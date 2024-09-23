@implementation LNConnection

uint64_t __43__LNConnection_enqueueConnectionOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_executors, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_assertionsMapTable, 0);
  objc_storeStrong((id *)&self->_currentOptions, 0);
  objc_storeStrong((id *)&self->_getConnectionInterfaceQueue, 0);
  objc_storeStrong(&self->_getConnectionInterfaceCompletionHandler, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connectionOperations, 0);
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  id v34;
  char v35[32];
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[NSObject priority](v4, "priority"))
  {
    v6 = (void *)MEMORY[0x1E0D016E0];
    -[LNConnection auditToken](self, "auditToken");
    objc_msgSend(v6, "tokenFromAuditToken:", v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "pid"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v8, &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;
    if (v9)
    {
      if (objc_msgSend(v9, "isDaemon"))
      {
        getLNLogCategoryConnection();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[LNConnection logPrefix](self, "logPrefix");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v12;
          v39 = 2114;
          v40 = v8;
          _os_log_impl(&dword_1A18F6000, v11, OS_LOG_TYPE_INFO, "%{public}@ pid %{public}@ is a daemon; assertion is not required",
            buf,
            0x16u);

        }
      }
      else
      {
        v15 = -[NSObject priority](v4, "priority");
        v16 = CFSTR("com.apple.siri");
        if (v15 == 3)
          v16 = CFSTR("com.apple.siri.pushtotalk");
        v17 = v16;
        v18 = -[NSObject priority](v4, "priority");
        if ((unint64_t)(v18 - 1) > 2)
          v19 = 0;
        else
          v19 = off_1E45DC080[v18 - 1];
        v31 = v19;
        v32 = v17;
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_alloc(MEMORY[0x1E0D87C98]);
        objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentifier:", v9);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithExplanation:target:attributes:", CFSTR("Application connection"), v23, v21);

        v33 = 0;
        LOBYTE(v23) = objc_msgSend(v24, "acquireWithError:", &v33);
        v10 = v33;
        getLNLogCategoryConnection();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if ((v23 & 1) != 0)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            -[LNConnection logPrefix](self, "logPrefix");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v27;
            v39 = 2114;
            v40 = v8;
            v41 = 2114;
            v42 = v4;
            _os_log_impl(&dword_1A18F6000, v26, OS_LOG_TYPE_INFO, "%{public}@ Successfully acquired process assertion (pid: %{public}@) for %{public}@", buf, 0x20u);

          }
          objc_msgSend(v24, "addObserver:", self);
          -[LNConnection assertionsMapTable](self, "assertionsMapTable");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v24, v4);

          v29 = v31;
        }
        else
        {
          v29 = v31;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            -[LNConnection logPrefix](self, "logPrefix");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v30;
            v39 = 2114;
            v40 = v31;
            v41 = 2114;
            v42 = v10;
            _os_log_impl(&dword_1A18F6000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Failed to acquire assertion %{public}@: %{public}@", buf, 0x20u);

          }
          -[NSObject finishWithError:](v4, "finishWithError:", v10);
        }

      }
    }
    else
    {
      getLNLogCategoryConnection();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[LNConnection logPrefix](self, "logPrefix");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v14;
        v39 = 2114;
        v40 = v8;
        v41 = 2114;
        v42 = v10;
        _os_log_impl(&dword_1A18F6000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);

      }
      -[NSObject finishWithError:](v4, "finishWithError:", v10);
    }

    goto LABEL_26;
  }
  getLNLogCategoryConnection();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v7;
    _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_INFO, "%{public}@ Connection has no background or foreground priority; assertion not required",
      buf,
      0xCu);
LABEL_26:

  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[5].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)invalidateAssertionsForConnectionOperation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getLNLogCategoryConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_INFO, "%{public}@ Invalidating assertions for %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v4, "priority"))
  {
    -[LNConnection assertionsMapTable](self, "assertionsMapTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeObserver:", self);
    if (objc_msgSend(v9, "isValid"))
    {
      v16 = 0;
      v10 = objc_msgSend(v9, "invalidateWithError:", &v16);
      v11 = v16;
      if ((v10 & 1) == 0)
      {
        getLNLogCategoryConnection();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          -[LNConnection logPrefix](self, "logPrefix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v18 = v13;
          v19 = 2114;
          v20 = v4;
          v21 = 2114;
          v22 = v11;
          _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to invalidate process assertion for %{public}@: %{public}@", buf, 0x20u);

        }
      }
    }
    else
    {
      v11 = 0;
    }
    -[LNConnection assertionsMapTable](self, "assertionsMapTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v4);

  }
  else
  {
    getLNLogCategoryConnection();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1A18F6000, v11, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ has no priority and thus no associated assertion", buf, 0x16u);

    }
  }

}

- (NSMapTable)assertionsMapTable
{
  return self->_assertionsMapTable;
}

- (void)connectionOperation:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[LNConnection invalidateAssertionsForConnectionOperation:](self, "invalidateAssertionsForConnectionOperation:", v5);
  v8 = v5;
  if (v8 && (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE652F70) & 1) != 0)
  {
    objc_msgSend(v8, "invalidateRuntimeAssertions");
    v7 = v8;
  }
  else
  {

    v7 = 0;
  }
  -[LNConnection removeConnectionOperation:](self, "removeConnectionOperation:", v8);

}

- (void)removeConnectionOperation:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LNConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[LNConnection connectionOperations](self, "connectionOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(v6, "setConnection:", 0);
}

- (void)connectionOperationWillStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7 = v4;
  if (v7 && (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE652F70) & 1) != 0)
  {
    objc_msgSend(v7, "acquireRuntimeAssertions");
    v6 = v7;
  }
  else
  {

    v6 = 0;
  }
  -[LNConnection acquireAssertionsForConnectionOperation:](self, "acquireAssertionsForConnectionOperation:", v7);

}

- (void)enqueueConnectionOperation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[LNConnection connectionOperations](self, "connectionOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  objc_msgSend(v4, "setConnection:", self);
  -[LNConnection extendIdleTimeout](self, "extendIdleTimeout");
  objc_msgSend(v4, "activity");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LNConnection_enqueueConnectionOperation___block_invoke;
  block[3] = &unk_1E45DDE18;
  v10 = v4;
  v8 = v4;
  os_activity_apply(v7, block);

}

- (NSMutableSet)connectionOperations
{
  NSObject *v3;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_connectionOperations;
}

- (void)extendIdleTimeout
{
  NSObject *v3;
  void *v4;
  id v5;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[LNConnection idleTimer](self, "idleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LNConnection idleTimer](self, "idleTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

- (LNWatchdogTimer)idleTimer
{
  NSObject *v3;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_idleTimer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)completeWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if (-[LNConnection state](self, "state") && -[LNConnection state](self, "state") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateDisconnected || self.state == LNConnectionStateConnected"));

  }
  -[LNConnection getConnectionInterfaceCompletionHandler](self, "getConnectionInterfaceCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__LNConnection_completeWithError___block_invoke;
    aBlock[3] = &unk_1E45DDE18;
    aBlock[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v5)
    {
      getLNLogCategoryConnection();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[LNConnection logPrefix](self, "logPrefix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v11;
        v19 = 2114;
        v20 = v5;
        _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get connection interface: %{public}@", buf, 0x16u);

      }
      -[LNConnection getConnectionInterfaceCompletionHandler](self, "getConnectionInterfaceCompletionHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v5);
    }
    else
    {
      -[LNConnection getConnectionInterfaceCompletionHandler](self, "getConnectionInterfaceCompletionHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[LNConnection connectionInterface](self, "connectionInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v13, 0);

    }
    v9[2](v9);

  }
  os_activity_scope_leave(&state);

}

- (int64_t)state
{
  return self->_state;
}

- (id)getConnectionInterfaceCompletionHandler
{
  return self->_getConnectionInterfaceCompletionHandler;
}

- (LNConnectionHostInterface)connectionInterface
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[LNConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__LNConnection_connectionInterface__block_invoke;
  v6[3] = &unk_1E45DE240;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (LNConnectionHostInterface *)v4;
}

- (void)performGetConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void (**v18)(_QWORD);
  LNUnlockService *v19;
  void *v20;
  LNUnlockService *v21;
  LNUnlockService *v22;
  _QWORD v23[4];
  LNUnlockService *v24;
  LNConnection *v25;
  void (**v26)(_QWORD);
  _QWORD aBlock[5];
  __CFString *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[LNConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  getLNLogCategoryConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_INFO, "%{public}@ Getting connection interface with options: %{public}@", buf, 0x16u);

  }
  getLNLogCategoryConnection();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LNConnection state](self, "state");
    if ((unint64_t)(v13 - 1) > 2)
      v14 = CFSTR("Not Connected");
    else
      v14 = off_1E45DDF80[v13 - 1];
    *(_DWORD *)buf = 138543618;
    v30 = v12;
    v31 = 2114;
    v32 = v14;

  }
  v15 = (void *)objc_msgSend(v7, "copy");

  -[LNConnection setGetConnectionInterfaceCompletionHandler:](self, "setGetConnectionInterfaceCompletionHandler:", v15);
  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultOptions");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E45DDE40;
  aBlock[4] = self;
  v17 = v6;
  v28 = v17;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[__CFString authenticationPolicy](v17, "authenticationPolicy") == 1)
  {
    v19 = [LNUnlockService alloc];
    -[LNConnection queue](self, "queue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[LNUnlockService initWithQueue:](v19, "initWithQueue:", v20);

    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v23[3] = &unk_1E45DDE68;
    v24 = v21;
    v25 = self;
    v26 = v18;
    v22 = v21;
    -[LNUnlockService requestUnlockIfNeeded:](v22, "requestUnlockIfNeeded:", v23);

  }
  else
  {
    v18[2](v18);
  }

}

- (void)setCurrentOptions:(id)a3
{
  objc_storeStrong((id *)&self->_currentOptions, a3);
}

uint64_t __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2)
  {
    if (v2 == 3)
      objc_msgSend(*(id *)(a1 + 32), "refreshWithOptions:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connectWithOptions:", *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentOptions:", *(_QWORD *)(a1 + 40));
}

void __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "getConnectionInterfaceQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
  v4[3] = &unk_1E45DE0A0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addOperationWithBlock:", v4);

}

uint64_t __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "getConnectionInterfaceQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "performGetConnectionInterfaceWithOptions:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __34__LNConnection_completeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setGetConnectionInterfaceCompletionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "getConnectionInterfaceQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "%{public}@ Resuming the getConnectionInterface queue", (uint8_t *)&v5, 0xCu);

  }
}

- (NSOperationQueue)getConnectionInterfaceQueue
{
  return self->_getConnectionInterfaceQueue;
}

- (void)setGetConnectionInterfaceCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

+ (LNConnectionOptions)defaultOptions
{
  objc_msgSend(a1, "connectionOptionsClass");
  return (LNConnectionOptions *)(id)objc_opt_new();
}

void __122__LNConnection_FetchOptionsDefaultValue__fetchDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchParameterOptionDefaultValueConnectionOperation *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  LNFetchParameterOptionDefaultValueConnectionOperation *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = [LNFetchParameterOptionDefaultValueConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LNFetchParameterOptionDefaultValueConnectionOperation initWithConnectionInterface:action:actionMetadata:parameterIdentifier:queue:completionHandler:](v3, "initWithConnectionInterface:action:actionMetadata:parameterIdentifier:queue:completionHandler:", v9, v4, v5, v6, v7, *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 56), "enqueueConnectionOperation:", v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (NSString)logPrefix
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)refreshWithOptions:(id)a3
{
  id v5;
  NSObject *v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[LNConnection state](self, "state") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 467, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnected"));

  }
  v7 = -[LNConnection shouldRefreshWithOptions:](self, "shouldRefreshWithOptions:", v5);
  if (v7)
    -[LNConnection setState:](self, "setState:", 2);
  else
    -[LNConnection completeWithError:](self, "completeWithError:", 0);

  return v7;
}

+ (Class)connectionOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((-[LNConnection isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0
    && (-[LNConnection isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    getLNLogCategoryConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "%{public}@ Invalidating RunningBoard Assertions", buf, 0xCu);

    }
    -[LNConnection _invalidateAllAssertions](self, "_invalidateAllAssertions");
    getLNLogCategoryConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Invalidating XPC connection on %{public}@ dealloc", buf, 0x16u);

    }
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    getLNLogCategoryConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_INFO, "%{public}@ Invalidating process monitor on dealloc", buf, 0xCu);

    }
    -[LNConnection processMonitor](self, "processMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

  }
  v12.receiver = self;
  v12.super_class = (Class)LNConnection;
  -[LNConnection dealloc](&v12, sel_dealloc);
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)_invalidateAllAssertions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectEnumerator](self->_assertionsMapTable, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "removeObserver:", self);
        objc_msgSend(v8, "invalidate");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[NSMapTable removeAllObjects](self->_assertionsMapTable, "removeAllObjects");

}

void __31__LNConnection_closeWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    v7 = "Connection to %@ closed due to error %{public}@";
    v8 = v4;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    v7 = "Connection to %@ closed";
    v8 = v4;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
  }
  _os_log_impl(&dword_1A18F6000, v8, v9, v7, buf, v10);

LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "cancelIdleTimeout");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "currentConnectionOperations", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "finishWithError:", *(_QWORD *)(a1 + 32));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 40), "manager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "connection:didCloseWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (LNConnectionDelegate)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void)setIdleTimer
{
  NSObject *v3;
  _QWORD block[5];

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__LNConnection_setIdleTimer__block_invoke;
  block[3] = &unk_1E45DDE18;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSSet)currentConnectionOperations
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[LNConnection connectionOperations](self, "connectionOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSSet *)v5;
}

- (void)cancelIdleTimeout
{
  NSObject *v3;
  void *v4;
  id v5;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[LNConnection idleTimer](self, "idleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LNConnection idleTimer](self, "idleTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__LNConnection_FetchAppShortcutParameters__fetchAppShortcutParametersWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E45DD390;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v6);

}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, void *, id);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  void (**v38)(id, void *, id);
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  LNConnection *v52;
  void (**v53)(id, void *, id);
  id v54;
  id v55;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(id, void *, id))a9;
  objc_msgSend(v16, "effectiveBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 1)
    goto LABEL_15;
  v43 = v20;
  v44 = v15;
  objc_msgSend(v16, "effectiveBundleIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "type") != 3)
  {

    v20 = v43;
    v15 = v44;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v17, "name");
  v42 = v18;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("app"));

  v18 = v42;
  v20 = v43;
  v15 = v44;
  if (v26)
  {
    objc_msgSend(v16, "effectiveBundleIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "bundleIdentifier");
    v29 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 != CFSTR("com.apple.UIKitCore"))
    {
      if (!v29
        || (v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("com.apple.UIKitCore")),
            v30,
            (v31 & 1) == 0))
      {
        objc_msgSend(v28, "bundleIdentifier");
        v32 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32 != CFSTR("com.apple.UIKit"))
        {
          if (!v32
            || (v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("com.apple.UIKit")),
                v33,
                (v34 & 1) == 0))
          {
            objc_msgSend(v28, "bundleIdentifier");
            v35 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            if (v35 != CFSTR("com.apple.AppKit"))
            {
              v36 = v35;
              if (!v35)
              {

LABEL_23:
                v40 = (void *)MEMORY[0x1E0CA5870];
                -[LNConnection bundleURL](self, "bundleURL");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = 0;
                objc_msgSend(v40, "ln_dynamicOptionsWithAppsImplementingFrameworkAtURL:matchingSearchTerm:options:error:", v41, v19, 0, &v54);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void (**)(id, void *, id))v54;

                goto LABEL_21;
              }
              v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("com.apple.AppKit"));

              if ((v37 & 1) == 0)
                goto LABEL_23;
LABEL_20:
              v55 = 0;
              objc_msgSend(MEMORY[0x1E0CA5870], "ln_dynamicOptionsWithAppsImplementingFrameworkAtURL:matchingSearchTerm:options:error:", 0, v19, 0, &v55);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void (**)(id, void *, id))v55;
LABEL_21:
              v15 = v44;
              v21[2](v21, v39, v38);

              v18 = v42;
              v20 = v43;
              goto LABEL_17;
            }
          }
        }

      }
    }

    goto LABEL_20;
  }
LABEL_16:
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __156__LNConnection_FetchOptions__fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke;
  v45[3] = &unk_1E45DBFE0;
  v53 = v21;
  v46 = v15;
  v47 = v16;
  v48 = v17;
  v49 = v18;
  v50 = v19;
  v51 = v20;
  v52 = self;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v45);

  v38 = v53;
LABEL_17:

}

- (void)fetchDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  LNConnection *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__LNConnection_FetchOptionsDefaultValue__fetchDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E45DCC00;
  v22 = self;
  v23 = v13;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v18);

}

- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[LNConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E45DE0A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (void)setConnected
{
  NSObject *v4;
  void *v5;

  -[LNConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[LNConnection state](self, "state") != 1 && -[LNConnection state](self, "state") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnecting || self.state == LNConnectionStateRefreshing"));

  }
  -[LNConnection setState:](self, "setState:", 3);
  -[LNConnection completeWithError:](self, "completeWithError:", 0);
}

- (void)setState:(int64_t)a3
{
  NSObject *v6;
  int64_t state;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  state = self->_state;
  if (state != a3)
  {
    switch(state)
    {
      case 0:
        if (a3 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNConnectionStateConnecting"));
          goto LABEL_11;
        }
        break;
      case 1:
        if (a3 && a3 != 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNConnectionStateConnected || state == LNConnectionStateDisconnected"));
          goto LABEL_11;
        }
        break;
      case 2:
        if (a3 && a3 != 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNConnectionStateConnected || state == LNConnectionStateDisconnected"));
          goto LABEL_11;
        }
        break;
      case 3:
        if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNConnectionStateDisconnected || state == LNConnectionStateRefreshing"));
LABEL_11:

        }
        break;
      default:
        break;
    }
    getLNLogCategoryConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = self->_state - 1;
      if (v12 > 2)
        v13 = CFSTR("Not Connected");
      else
        v13 = off_1E45DDF80[v12];
      if ((unint64_t)(a3 - 1) > 2)
        v14 = CFSTR("Not Connected");
      else
        v14 = off_1E45DDF80[a3 - 1];
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v14;

    }
    self->_state = a3;
  }
}

- (void)connectWithOptions:(id)a3
{
  NSObject *v5;
  void *v6;

  -[LNConnection queue](self, "queue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[LNConnection state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateDisconnected"));

  }
  -[LNConnection setState:](self, "setState:", 1);
}

- (void)setXPCConnection:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  id v11;
  _QWORD v12[5];
  id v13;
  id location;
  os_activity_scope_state_s state;

  v5 = a3;
  -[LNConnection activity](self, "activity");
  v6 = objc_claimAutoreleasedReturnValue();
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  objc_storeStrong((id *)&self->_xpcConnection, a3);
  objc_initWeak(&location, self);
  -[LNConnection queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v8);

  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__LNConnection_setXPCConnection___block_invoke;
  v12[3] = &unk_1E45DDDC8;
  v12[4] = v6;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __33__LNConnection_setXPCConnection___block_invoke_54;
  v10[3] = &unk_1E45DDDF0;
  v10[4] = v6;
  objc_copyWeak(&v11, &location);
  v10[5] = v7;
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);

}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)shouldRefreshWithOptions:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[LNConnection state](self, "state") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnected"));

  }
  -[LNConnection userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  -[LNConnection bundleType](self, "bundleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "integerValue") == 3)
  {
    -[LNConnection bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_4;
  }
  else
  {

  }
  -[LNConnection currentOptions](self, "currentOptions");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = v13;
  if (v12 != v13)
  {
    if (v13 && v12)
    {
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if (v15)
        goto LABEL_16;
    }
    else
    {

    }
LABEL_4:
    v8 = 1;
    goto LABEL_5;
  }

LABEL_16:
  getLNLogCategoryConnection();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_INFO, "Options %{public}@ haven't changed, skipping refresh", buf, 0xCu);
  }

  v8 = 0;
LABEL_5:

  return v8;
}

- (LNConnectionOptions)currentOptions
{
  return self->_currentOptions;
}

void __28__LNConnection_setIdleTimer__block_invoke(uint64_t a1)
{
  LNWatchdogTimer *v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [LNWatchdogTimer alloc];
  v3 = *(double *)&LNConnectionIdleTimeout;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __28__LNConnection_setIdleTimer__block_invoke_2;
  v12 = &unk_1E45DDEF8;
  objc_copyWeak(&v13, &location);
  v5 = -[LNWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v2, "initWithTimeoutInterval:onQueue:timeoutHandler:", v4, &v9, v3);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  objc_msgSend(*(id *)(a1 + 32), "idleTimer", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __28__LNConnection_setIdleTimer__block_invoke_2(uint64_t a1)
{
  os_activity_t *WeakRetained;
  os_activity_t *v2;
  NSObject *v3;
  os_activity_scope_state_s v4;
  uint8_t buf[4];
  os_activity_t *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (-[os_activity_t targetIsBeingDebugged](WeakRetained, "targetIsBeingDebugged") & 1) == 0)
  {
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2[19], &v4);
    getLNLogCategoryConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v2;
      _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Closing idle connection (%@)", buf, 0xCu);
    }

    -[os_activity_t closeWithError:](v2, "closeWithError:", 0);
    os_activity_scope_leave(&v4);
  }

}

- (BOOL)targetIsBeingDebugged
{
  __int128 v3;

  -[LNConnection auditToken](self, "auditToken");
  if ((int)LNPIDForAuditToken(&v3) < 1)
    return 0;
  else
    return BSPIDIsBeingDebugged();
}

- (void)closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LNConnection *v9;

  v4 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__LNConnection_closeWithError___block_invoke;
  v7[3] = &unk_1E45DDE40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __92__LNConnection_FetchAppShortcutParameters__fetchAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchAppShortcutParametersConnectionOperation *v3;
  void *v4;
  LNFetchAppShortcutParametersConnectionOperation *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = [LNFetchAppShortcutParametersConnectionOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LNFetchAppShortcutParametersConnectionOperation initWithConnectionInterface:queue:completionHandler:](v3, "initWithConnectionInterface:queue:completionHandler:", v6, v4, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __156__LNConnection_FetchOptions__fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchOptionsConnectionOperation *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  LNFetchOptionsConnectionOperation *v11;
  id v12;

  v12 = a2;
  if (v12)
  {
    v3 = [LNFetchOptionsConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 80), "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[LNFetchOptionsConnectionOperation initWithConnectionInterface:action:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:queue:completionHandler:](v3, "initWithConnectionInterface:action:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:queue:completionHandler:", v12, v4, v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 88));

    objc_msgSend(*(id *)(a1 + 80), "enqueueConnectionOperation:", v11);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

- (void)exportEntities:(id)a3 metadata:(id)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  LNConnection *v14;

  v9 = _Block_copy(a6);
  sub_1A190B0C4(0, &qword_1EE648CE0);
  v10 = sub_1A19B2D14();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = a4;
  v13 = a5;
  v14 = self;
  sub_1A19229F4(v10, v12, v13, (uint64_t)sub_1A192393C, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LNConnection *v14;

  v6 = _Block_copy(a5);
  v7 = sub_1A19B2C00();
  v9 = v8;
  v10 = sub_1A19B2C00();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  sub_1A192742C(v7, v9, v10, v12, (uint64_t)sub_1A1927F90, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  LNConnection *v13;

  v7 = _Block_copy(a5);
  v8 = sub_1A19B2C00();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a4;
  v13 = self;
  sub_1A192D250(v8, v10, v12, (uint64_t)sub_1A192393C, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  LNConnection *v11;

  v7 = _Block_copy(a5);
  sub_1A192E78C();
  v8 = sub_1A19B2D14();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a4;
  v11 = self;
  sub_1A192DD14(v8, v10, (uint64_t)sub_1A192E7F4, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  LNConnection *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A1940144(v8, (uint64_t)sub_1A1927F90, v7);

  swift_release();
}

- (void)fetchActionOutputValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  LNConnection *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDeferred") & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__LNConnection_FetchActionOutputValue__fetchActionOutputValue_completionHandler___block_invoke;
    v9[3] = &unk_1E45DD3E0;
    v12 = v7;
    v10 = v6;
    v11 = self;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v9);

  }
  else
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v8, 0);

  }
}

void __81__LNConnection_FetchActionOutputValue__fetchActionOutputValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchActionOutputValueOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchActionOutputValueOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchActionOutputValueOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchActionOutputValueOperation initWithConnectionInterface:actionOutput:queue:completionHandler:](v3, "initWithConnectionInterface:actionOutput:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__LNConnection_FetchMDMProperties__fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __100__LNConnection_FetchMDMProperties__fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchMDMPropertiesConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchMDMPropertiesConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchMDMPropertiesConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchMDMPropertiesConnectionOperation initWithConnectionInterface:action:queue:completionHandler:](v3, "initWithConnectionInterface:action:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__LNConnection_FetchDisplayRepresentation__fetchDisplayRepresentationForActions_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __99__LNConnection_FetchDisplayRepresentation__fetchDisplayRepresentationForActions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchDisplayRepresentationConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchDisplayRepresentationConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchDisplayRepresentationConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchDisplayRepresentationConnectionOperation initWithConnectionInterface:actions:queue:completionHandler:](v3, "initWithConnectionInterface:actions:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__LNConnection_FetchListenerEndpoint__getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke;
  v14[3] = &unk_1E45DE3A0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v14);

}

void __103__LNConnection_FetchListenerEndpoint__getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchListenerEndpointConnectionOperation *v3;
  void *v4;
  LNFetchListenerEndpointConnectionOperation *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = [LNFetchListenerEndpointConnectionOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LNFetchListenerEndpointConnectionOperation initWithConnectionInterface:queue:bundleIdentifier:action:completionHandler:](v3, "initWithConnectionInterface:queue:bundleIdentifier:action:completionHandler:", v6, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 searchTerm:(id)a5 localeIdentifier:(id)a6 completionHandler:(id)a7
{
  -[LNConnection fetchOptionsForAction:actionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:](self, "fetchOptionsForAction:actionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:", 0, a3, a4, a5, a6, a7);
}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 completionHandler:(id)a5
{
  -[LNConnection fetchOptionsForActionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:](self, "fetchOptionsForActionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:", a3, a4, 0, CFSTR("en_US"), a5);
}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 localeIdentifier:(id)a5 completionHandler:(id)a6
{
  -[LNConnection fetchOptionsForActionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:](self, "fetchOptionsForActionMetadata:parameterMetadata:searchTerm:localeIdentifier:completionHandler:", a3, a4, 0, a5, a6);
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 searchTerm:(id)a6 localeIdentifier:(id)a7 completionHandler:(id)a8
{
  -[LNConnection fetchOptionsForAction:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:completionHandler:](self, "fetchOptionsForAction:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:completionHandler:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAutoShortcutPhrase_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAppShortcutIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __104__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAppShortcutIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchActionForAppShortcutIdentifierOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchActionForAppShortcutIdentifierOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchActionForAppShortcutIdentifierOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchActionForAppShortcutIdentifierOperation initWithConnectionInterface:appShortcutIdentifier:queue:completionHandler:](v3, "initWithConnectionInterface:appShortcutIdentifier:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __101__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAutoShortcutPhrase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchActionForAutoShortcutPhraseOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchActionForAutoShortcutPhraseOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchActionForAutoShortcutPhraseOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchActionForAutoShortcutPhraseOperation initWithConnectionInterface:autoShortcutPhrase:queue:completionHandler:](v3, "initWithConnectionInterface:autoShortcutPhrase:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__LNConnection_PerformQuery_Deprecated__performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__LNConnection_PerformQuery_Deprecated__performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__LNConnection_PerformQuery_Deprecated__performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __108__LNConnection_PerformQuery_Deprecated__performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNPerformAllResultsQueryOperation *v6;
  uint64_t v7;
  void *v8;
  LNPerformAllResultsQueryOperation *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = [LNPerformAllResultsQueryOperation alloc];
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNPerformAllResultsQueryOperation initWithConnectionInterface:entityMangledTypeName:queue:completionHandler:](v6, "initWithConnectionInterface:entityMangledTypeName:queue:completionHandler:", v10, v7, v8, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v9);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __114__LNConnection_PerformQuery_Deprecated__performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNPerformSuggestedResultsQueryOperation *v6;
  uint64_t v7;
  void *v8;
  LNPerformSuggestedResultsQueryOperation *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = [LNPerformSuggestedResultsQueryOperation alloc];
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNPerformSuggestedResultsQueryOperation initWithConnectionInterface:entityMangledTypeName:queue:completionHandler:](v6, "initWithConnectionInterface:entityMangledTypeName:queue:completionHandler:", v10, v7, v8, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v9);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __102__LNConnection_PerformQuery_Deprecated__performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNPerformSuggestedResultsQueryOperation *v6;
  uint64_t v7;
  void *v8;
  LNPerformSuggestedResultsQueryOperation *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = [LNPerformSuggestedResultsQueryOperation alloc];
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNPerformSuggestedResultsQueryOperation initWithConnectionInterface:entityType:queue:completionHandler:](v6, "initWithConnectionInterface:entityType:queue:completionHandler:", v10, v7, v8, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v9);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__LNConnection_PerformQuery__performConfigurableQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

- (void)performQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__LNConnection_PerformQuery__performQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __61__LNConnection_PerformQuery__performQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNPerformQueryConnectionOperation *v6;
  uint64_t v7;
  void *v8;
  LNPerformQueryConnectionOperation *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = [LNPerformQueryConnectionOperation alloc];
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNPerformQueryConnectionOperation initWithConnectionInterface:query:queue:completionHandler:](v6, "initWithConnectionInterface:query:queue:completionHandler:", v10, v7, v8, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v9);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __73__LNConnection_PerformQuery__performConfigurableQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNPerformConfigurableQueryConnectionOperation *v6;
  uint64_t v7;
  void *v8;
  LNPerformConfigurableQueryConnectionOperation *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = [LNPerformConfigurableQueryConnectionOperation alloc];
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNPerformConfigurableQueryConnectionOperation initWithConnectionInterface:query:queue:completionHandler:](v6, "initWithConnectionInterface:query:queue:completionHandler:", v10, v7, v8, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v9);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__LNConnection_FetchActionAppContext__fetchActionAppContextForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __88__LNConnection_FetchActionAppContext__fetchActionAppContextForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchActionAppContextConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchActionAppContextConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchActionAppContextConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchActionAppContextConnectionOperation initWithConnectionInterface:action:queue:completionHandler:](v3, "initWithConnectionInterface:action:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__LNConnection_FetchAppIntentState__fetchStateForAppIntentIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __89__LNConnection_FetchAppIntentState__fetchStateForAppIntentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchAppIntentStateConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchAppIntentStateConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchAppIntentStateConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchAppIntentStateConnectionOperation initWithConnectionInterface:appIntentIdentifiers:queue:completionHandler:](v3, "initWithConnectionInterface:appIntentIdentifiers:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchDefaultValueForActionMetadata:(id)a3 parameterIdentifier:(id)a4 completionHandler:(id)a5
{
  -[LNConnection fetchDefaultValueForAction:actionMetadata:parameterIdentifier:completionHandler:](self, "fetchDefaultValueForAction:actionMetadata:parameterIdentifier:completionHandler:", 0, a3, a4, a5);
}

- (void)fetchOptionsDefaultValueForAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__LNConnection_FetchOptionsDefaultValue__fetchOptionsDefaultValueForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __94__LNConnection_FetchOptionsDefaultValue__fetchOptionsDefaultValueForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchOptionsDefaultValueConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchOptionsDefaultValueConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchOptionsDefaultValueConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchOptionsDefaultValueConnectionOperation initWithConnectionInterface:action:queue:completionHandler:](v3, "initWithConnectionInterface:action:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__LNConnection_FetchSuggestedActions__fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E45DD390;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v6);

}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__LNConnection_FetchSuggestedActions__fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LNConnection *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__LNConnection_FetchSuggestedActions__fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke;
  v10[3] = &unk_1E45DD3E0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v10);

}

void __100__LNConnection_FetchSuggestedActions__fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchSuggestedActionsForStartWorkoutConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchSuggestedActionsForStartWorkoutConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchSuggestedActionsForStartWorkoutConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchSuggestedActionsForStartWorkoutConnectionOperation initWithConnectionInterface:action:queue:completionHandler:](v3, "initWithConnectionInterface:action:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__LNConnection_FetchSuggestedActions__fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchSuggestedActionsConnectionOperation *v3;
  uint64_t v4;
  void *v5;
  LNFetchSuggestedActionsConnectionOperation *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = [LNFetchSuggestedActionsConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LNFetchSuggestedActionsConnectionOperation initWithConnectionInterface:siriLanguageCode:queue:completionHandler:](v3, "initWithConnectionInterface:siriLanguageCode:queue:completionHandler:", v7, v4, v5, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__LNConnection_FetchSuggestedActions__fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *v3;
  void *v4;
  LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = [LNFetchSuggestedActionsFromViewAppIntentConnectionOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LNFetchSuggestedActionsFromViewAppIntentConnectionOperation initWithConnectionInterface:queue:completionHandler:](v3, "initWithConnectionInterface:queue:completionHandler:", v6, v4, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E45DD250;
  v11[4] = self;
  if (+[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", CFSTR("com.apple.private.appintents.update-app-shortcut-apps"), v11))
  {
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke_7;
    v9[3] = &unk_1E45DD390;
    v9[4] = self;
    v10 = v4;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v9);
    v6 = v10;
  }
  else
  {
    getLNLogCategoryMetadata();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[LNConnection bundleIdentifier](self, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_ERROR, "Unable to update App Shortcuts for %{public}@ because the current process isn't entitled to do so.", buf, 0xCu);

    }
    LNConnectionErrorWithCode(1004);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }

}

uint64_t __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LNUpdateAppShortcutParametersOperation *v6;
  void *v7;
  LNUpdateAppShortcutParametersOperation *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = [LNUpdateAppShortcutParametersOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LNUpdateAppShortcutParametersOperation initWithConnectionInterface:queue:completionHandler:](v6, "initWithConnectionInterface:queue:completionHandler:", v9, v7, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v8);
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)fetchViewEntitiesWithOptions:(id)a3 interactionIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  LNConnection *v16;
  id v17;
  LNConnection *v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    getLNLogCategoryView();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchViewEntitiesWithOptions", ", buf, 2u);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E45DDAB8;
    v17 = v10;
    v15 = v9;
    v16 = self;
    v18 = self;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", v8, v14);

  }
  else
  {
    getLNLogCategoryGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v13, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    -[LNConnection fetchViewEntitiesWithOptions:interactionIDs:completionHandler:](self, "fetchViewEntitiesWithOptions:interactionIDs:completionHandler:", 0, v6, v7);
  }
  else
  {
    getLNLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", v9, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  LNConnection *v10;
  uint8_t buf[16];

  v4 = a3;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    getLNLogCategoryView();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchViewActions", ", buf, 2u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E45DDAE0;
    v8[4] = self;
    v9 = v4;
    v10 = self;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v8);

  }
  else
  {
    getLNLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Action fetching skipped", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  LNConnection *v18;
  id v19;
  int64_t v20;
  LNConnection *v21;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    getLNLogCategoryView();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchStructuredData", ", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "defaultOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v15 = v13;

    objc_msgSend(v15, "setOpenApplicationPriority:", 2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke;
    v16[3] = &unk_1E45DDC78;
    v19 = v9;
    v20 = a3;
    v17 = v8;
    v18 = self;
    v21 = self;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", v15, v16);

  }
  else
  {
    getLNLogCategoryGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Structured data fetching skipped", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA70], 0);
  }

}

void __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  LNFetchStructuredDataConnectionOperation *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  LNFetchStructuredDataConnectionOperation *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  if (v3)
  {
    v4 = [LNFetchStructuredDataConnectionOperation alloc];
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2;
    v14 = &unk_1E45DDB08;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 64);
    v15 = v8;
    v16 = v9;
    v10 = -[LNFetchStructuredDataConnectionOperation initWithConnectionInterface:typeIdentifier:entityIdentifiers:queue:completionHandler:](v4, "initWithConnectionInterface:typeIdentifier:entityIdentifiers:queue:completionHandler:", v3, v5, v6, v7, &v11);

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v10, v11, v12, v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryView();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LinkServices_fetchStructuredData", ", v5, 2u);
  }

}

void __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  LNFetchViewActionsConnectionOperation *v4;
  void *v5;
  id v6;
  uint64_t v7;
  LNFetchViewActionsConnectionOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  if (v3)
  {
    v4 = [LNFetchViewActionsConnectionOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke_2;
    v12 = &unk_1E45DDA90;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = v6;
    v14 = v7;
    v8 = -[LNFetchViewActionsConnectionOperation initWithConnectionInterface:queue:completionHandler:](v4, "initWithConnectionInterface:queue:completionHandler:", v3, v5, &v9);

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v8, v9, v10, v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  getLNLogCategoryView();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LinkServices_fetchViewActions", ", v5, 2u);
  }

}

void __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  LNFetchViewEntitiesConnectionOperation *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  LNFetchViewEntitiesConnectionOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  if (v3)
  {
    v4 = [LNFetchViewEntitiesConnectionOperation alloc];
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke_2;
    v12 = &unk_1E45DDA90;
    v7 = *(void **)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v13 = v7;
    v8 = -[LNFetchViewEntitiesConnectionOperation initWithConnectionInterface:interactionIDs:queue:completionHandler:](v4, "initWithConnectionInterface:interactionIDs:queue:completionHandler:", v3, v5, v6, &v9);

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v8, v9, v10, v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  getLNLogCategoryView();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchViewEntitiesWithOptions", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    objc_msgSend(a1, "fetchEntitiesFromActiveApplicationsWithInteractionIDs:bundleIdentifiers:completionHandler:", v6, 0, v7);
  }
  else
  {
    getLNLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", v9, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], 0);
  }

}

+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 bundleIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  LNMetadataProvider *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  LNWatchdogTimer *v35;
  id v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint8_t v46[16];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  _BYTE *v56;
  id v57;
  id v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  os_unfair_lock_s *v73;
  uint64_t v74;
  void *v75;
  int v76;
  id v77;
  _QWORD aBlock[4];
  id v79;
  id v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v8 = a4;
  v9 = a5;
  getLNLogCategoryView();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_fetchEntitiesFromActiveApplications", ", buf, 2u);
  }

  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke;
  aBlock[3] = &unk_1E45DDB08;
  v80 = a1;
  v13 = v9;
  v79 = v13;
  v14 = _Block_copy(aBlock);
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    if (v8 && objc_msgSend(v8, "count"))
    {
      v15 = v8;
LABEL_20:
      getLNLogCategoryView();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1A18F6000, v24, OS_LOG_TYPE_INFO, "Requesting entities for identifiers %@ for bundles %@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v82 = __Block_byref_object_copy__9999;
      v83 = __Block_byref_object_dispose__10000;
      v84 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v72 = 0;
      v73 = (os_unfair_lock_s *)&v72;
      v74 = 0x2810000000;
      v75 = &unk_1A19D5EAF;
      v76 = 0;
      v66 = 0;
      v67 = &v66;
      v68 = 0x3032000000;
      v69 = __Block_byref_object_copy__9999;
      v70 = __Block_byref_object_dispose__10000;
      v71 = 0;
      v60 = 0;
      v61 = &v60;
      v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__9999;
      v64 = __Block_byref_object_dispose__10000;
      v65 = 0;
      v59[0] = v12;
      v59[1] = 3221225472;
      v59[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_13;
      v59[3] = &unk_1E45DDB30;
      v59[4] = &v66;
      v26 = _Block_copy(v59);
      objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setNeedsUserInteractivePriority:", 1);
      v47[0] = v12;
      v47[1] = 3221225472;
      v47[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_2;
      v47[3] = &unk_1E45DDC28;
      v53 = &v72;
      v54 = &v66;
      v55 = &v60;
      v28 = v26;
      v51 = v28;
      v56 = buf;
      v57 = a1;
      v8 = v15;
      v48 = v8;
      v29 = v25;
      v49 = v29;
      v50 = v40;
      v58 = a1;
      v30 = v14;
      v52 = v30;
      objc_msgSend(v27, "setTransitionHandler:", v47);
      getLNLogCategoryView();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v31))
      {
        *(_WORD *)v46 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v32, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_invokeFBSDisplayLayoutMonitor", ", v46, 2u);
      }

      os_unfair_lock_lock(v73 + 8);
      objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v27);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v67[5];
      v67[5] = v33;

      v35 = [LNWatchdogTimer alloc];
      v41[0] = v12;
      v41[1] = 3221225472;
      v41[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_29;
      v41[3] = &unk_1E45DDC50;
      v44 = &v72;
      v45 = &v66;
      v36 = v28;
      v42 = v36;
      v43 = v30;
      v37 = -[LNWatchdogTimer initWithTimeoutInterval:timeoutHandler:](v35, "initWithTimeoutInterval:timeoutHandler:", v41, 0.5);
      v38 = (void *)v61[5];
      v61[5] = v37;

      objc_msgSend((id)v61[5], "start");
      os_unfair_lock_unlock(v73 + 8);

      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v66, 8);

      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    getLNLogCategoryMetadata();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_DEBUG, "No bundleIDs provided, using all enabled applications", buf, 2u);
    }

    getLNLogCategoryView();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_fetchMetadataBundles", ", buf, 2u);
    }

    v20 = objc_alloc_init(LNMetadataProvider);
    v77 = 0;
    -[LNMetadataProvider bundlesWithError:](v20, "bundlesWithError:", &v77);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v77;

    getLNLogCategoryView();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v23, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)a1, "LinkServices_fetchMetadataBundles", ", buf, 2u);
    }

    if (v15 && objc_msgSend(v15, "count"))
    {

      goto LABEL_20;
    }
    getLNLogCategoryView();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v39, OS_LOG_TYPE_ERROR, "Aborting early because no bundles could be found to query", buf, 2u);
    }

    (*((void (**)(void *, _QWORD, id))v14 + 2))(v14, 0, v21);
    v8 = v15;
  }
  else
  {
    getLNLogCategoryGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Action fetching skipped", buf, 2u);
    }

    (*((void (**)(void *, _QWORD, _QWORD))v14 + 2))(v14, MEMORY[0x1E0C9AA70], 0);
  }
LABEL_29:

}

+ (id)getUIExtensionBundleIdentifiersForOnScreenBundles:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99E20]);
}

+ (void)resolveEntitiesForInteractionIDs:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  os_signpost_id_t v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  os_signpost_id_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  getLNLogCategoryView();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getLNLogCategoryView();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LinkServices_resolveEntitiesForInteractionIDs", ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke;
  aBlock[3] = &unk_1E45DDA90;
  v46 = v11;
  v14 = v9;
  v45 = v14;
  v15 = _Block_copy(aBlock);
  if (+[LNFeatureFlags isViewActionAnnotationEnabled](LNFeatureFlags, "isViewActionAnnotationEnabled"))
  {
    v16 = (void *)objc_msgSend(v7, "copy");
    v17 = (void *)objc_msgSend(v8, "copy");
    v18 = objc_msgSend(v16, "count");
    getLNLogCategoryView();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v16;
        v49 = 2112;
        v50 = v17;
        _os_log_impl(&dword_1A18F6000, v20, OS_LOG_TYPE_INFO, "Requesting entities for identifiers %@ from %@", buf, 0x16u);
      }

      getLNLogCategoryView();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_generate(v21);

      getLNLogCategoryView();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "LinkServices_establishViewFetchConnection", ", buf, 2u);
      }

      +[LNConnectionPolicy policyWithBundleIdentifier:](LNConnectionPolicy, "policyWithBundleIdentifier:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      objc_msgSend(v25, "connectionWithError:", &v43);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v43;
      getLNLogCategoryView();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v26)
      {
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A18F6000, v28, OS_SIGNPOST_INTERVAL_END, v22, "LinkServices_establishViewFetchConnection", ", buf, 2u);
        }
        v37 = v25;

        v29 = (void *)objc_opt_new();
        objc_msgSend(v29, "setSceneless:", 0);
        objc_msgSend(v29, "setOpenApplicationPriority:", 2);
        getLNLogCategoryView();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v17;
          v49 = 2112;
          v50 = v16;
          _os_log_impl(&dword_1A18F6000, v30, OS_LOG_TYPE_INFO, "Fetching entities from %@ for interactionIDs %@", buf, 0x16u);
        }

        getLNLogCategoryView();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = os_signpost_id_generate(v31);

        getLNLogCategoryView();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A18F6000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "LinkServices_fetchViewEntitiesWithOptions", ", buf, 2u);
        }

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke_33;
        v39[3] = &unk_1E45DDCA0;
        v42 = v32;
        v40 = v17;
        v41 = v15;
        objc_msgSend(v26, "fetchViewEntitiesWithOptions:interactionIDs:completionHandler:", v29, v16, v39);

        v25 = v37;
        v35 = v38;
      }
      else
      {
        v35 = v38;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v17;
          v49 = 2114;
          v50 = v38;
          _os_log_impl(&dword_1A18F6000, v28, OS_LOG_TYPE_ERROR, "Error establishing connection with %@ to fetch view entities: %{public}@", buf, 0x16u);
        }

        (*((void (**)(void *, _QWORD, id))v15 + 2))(v15, MEMORY[0x1E0C9AA60], v38);
      }

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A18F6000, v20, OS_LOG_TYPE_ERROR, "No interactionIDs were provided, exiting.", buf, 2u);
      }

      (*((void (**)(void *, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA60], 0);
    }

  }
  else
  {
    getLNLogCategoryView();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v36, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", buf, 2u);
    }

    (*((void (**)(void *, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA60], 0);
  }

}

void __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  getLNLogCategoryView();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_resolveEntitiesForInteractionIDs", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke_33(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getLNLogCategoryView();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchViewEntitiesWithOptions", ", (uint8_t *)&v12, 2u);
  }

  if (v6)
  {
    getLNLogCategoryView();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_ERROR, "Error fetching entities from %@: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  getLNLogCategoryView();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchEntitiesFromActiveApplications", ", v11, 2u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id obj;
  id obja;
  void *v70;
  _QWORD block[4];
  id v72;
  __int128 *v73;
  uint64_t v74;
  _QWORD v75[5];
  NSObject *v76;
  __int128 *p_buf;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[4];
  void *v92;
  __int16 v93;
  void *v94;
  uint8_t v95[128];
  __int128 buf;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  LNViewEntityAggregationResult *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v65 = a2;
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  v66 = v7;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    if (v7)
    {
      v64 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "cancel");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
      v9 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v7, "elements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "if_compactMap:", &__block_literal_global_10006);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(*(id *)(a1 + 104), "getUIExtensionBundleIdentifiersForOnScreenBundles:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      obj = (id)objc_claimAutoreleasedReturnValue();
      getLNLogCategoryView();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v15, OS_LOG_TYPE_INFO, "Querying all entities for each application", (uint8_t *)&buf, 2u);
      }

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v16 = *(id *)(a1 + 32);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v88 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
            if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "containsObject:", v20) & 1) != 0)
            {
              v21 = *(_QWORD *)(a1 + 48);
              if (v21)
              {
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, v20);
              }
              else
              {
                v23 = (void *)objc_opt_new();
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, v20);

              }
            }
            else
            {
              getLNLogCategoryView();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v20;
                _os_log_impl(&dword_1A18F6000, v22, OS_LOG_TYPE_DEBUG, "Filtering out offscreen bundle %@", (uint8_t *)&buf, 0xCu);
              }

            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
        }
        while (v17);
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      obja = obj;
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v84;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v84 != v25)
              objc_enumerationMutation(obja);
            v27 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
            v28 = *(_QWORD *)(a1 + 48);
            if (v28)
            {
              objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j));
            }
            else
            {
              v29 = (void *)objc_opt_new();
              objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v29, v27);

            }
          }
          v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
        }
        while (v24);
      }

      getLNLogCategoryView();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = *(_QWORD *)(a1 + 112);
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v31, OS_SIGNPOST_INTERVAL_END, v32, "LinkServices_invokeFBSDisplayLayoutMonitor", ", (uint8_t *)&buf, 2u);
      }

      getLNLogCategoryView();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v35 = *(_QWORD *)(a1 + 112);
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v35, "LinkServices_establishViewFetchConnections", ", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "allKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "if_compactMap:", &__block_literal_global_21);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      getLNLogCategoryView();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = *(_QWORD *)(a1 + 112);
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v39, OS_SIGNPOST_INTERVAL_END, v40, "LinkServices_establishViewFetchConnections", ", (uint8_t *)&buf, 2u);
      }

      v70 = (void *)objc_opt_new();
      objc_msgSend(v70, "setSceneless:", 0);
      objc_msgSend(v70, "setOpenApplicationPriority:", 2);
      getLNLogCategoryView();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      v43 = *(_QWORD *)(a1 + 112);
      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A18F6000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v43, "LinkServices_aggregatingEntities", ", (uint8_t *)&buf, 2u);
      }

      getLNLogCategoryView();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v45;
        _os_log_impl(&dword_1A18F6000, v44, OS_LOG_TYPE_DEFAULT, "Aggregating entities from bundles %@", (uint8_t *)&buf, 0xCu);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v97 = 0x3032000000;
      v98 = __Block_byref_object_copy__9999;
      v99 = __Block_byref_object_dispose__10000;
      v100 = objc_alloc_init(LNViewEntityAggregationResult);
      v46 = dispatch_group_create();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v67 = v37;
      v47 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v80;
        do
        {
          v49 = 0;
          do
          {
            if (*(_QWORD *)v80 != v48)
              objc_enumerationMutation(v67);
            v50 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v49);
            dispatch_group_enter(v46);
            v51 = *(void **)(a1 + 40);
            objc_msgSend(v50, "bundleIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            getLNLogCategoryView();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v50, "bundleIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v91 = 138412546;
              v92 = v55;
              v93 = 2112;
              v94 = v53;
              _os_log_impl(&dword_1A18F6000, v54, OS_LOG_TYPE_INFO, "Fetching entities from %@ for interactionIDs %@", v91, 0x16u);

            }
            getLNLogCategoryView();
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if ((unint64_t)v50 + 1 >= 2 && os_signpost_enabled(v56))
            {
              *(_WORD *)v91 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A18F6000, v57, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v50, "LinkServices_fetchViewEntitiesWithOptions", ", v91, 2u);
            }

            v58 = objc_msgSend(v53, "count");
            v75[0] = MEMORY[0x1E0C809B0];
            if (v58)
              v59 = v53;
            else
              v59 = 0;
            v75[1] = 3221225472;
            v75[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_24;
            v75[3] = &unk_1E45DDBD8;
            p_buf = &buf;
            v75[4] = v50;
            v76 = v46;
            v78 = v50;
            objc_msgSend(v50, "fetchViewEntitiesWithOptions:interactionIDs:completionHandler:", v70, v59, v75);

            ++v49;
          }
          while (v47 != v49);
          v60 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
          v47 = v60;
        }
        while (v60);
      }

      dispatch_get_global_queue(33, 0);
      v61 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_25;
      block[3] = &unk_1E45DDC00;
      v74 = *(_QWORD *)(a1 + 112);
      v72 = *(id *)(a1 + 64);
      v73 = &buf;
      dispatch_group_notify(v46, v61, block);

      _Block_object_dispose(&buf, 8);
      v8 = v64;
    }
  }
  else
  {
    v62 = v8;
    getLNLogCategoryGeneral();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A18F6000, v63, OS_LOG_TYPE_ERROR, "Detected second call to transition handler before first has completed.", (uint8_t *)&buf, 2u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    v8 = v62;
  }

}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_29(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[4] + 16))();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
    v2 = a1[5];
    LNConnectionErrorWithCode(2200);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
  }
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint8_t v13[16];

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResults:error:forBundle:", v8, v7, v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  getLNLogCategoryView();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LinkServices_fetchViewEntitiesWithOptions", ", v13, 2u);
  }

}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_25(_QWORD *a1)
{
  void *v1;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  getLNLogCategoryView();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LinkServices_aggregatingEntities", ", buf, 2u);
  }

  getLNLogCategoryView();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_DEFAULT, "Entity aggregation completed", v12, 2u);
  }

  v7 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "entities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "entities");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v10, v11);

  if (v9)
  {

  }
}

id __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[LNConnectionPolicy policyWithBundleIdentifier:](LNConnectionPolicy, "policyWithBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "connectionWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    getLNLogCategoryView();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v2;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "Error establishing connection with %@ to fetch view entities: %{public}@", buf, 0x16u);
    }

  }
  return v4;
}

uint64_t __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

- (LNConnection)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 appIntentsEnabledOnly:(BOOL)a7 userIdentity:(id)a8 error:(id *)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  LNFrameworkConnection *v21;
  LNConnection *v22;
  LNConnection *v23;
  uint64_t v24;
  NSString *bundleIdentifier;
  uint64_t v26;
  NSURL *bundleURL;
  NSMutableSet *v28;
  NSMutableSet *connectionOperations;
  NSObject *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *queue;
  uint64_t v34;
  NSMapTable *executors;
  os_activity_t v36;
  OS_os_activity *activity;
  NSOperationQueue *v38;
  NSOperationQueue *getConnectionInterfaceQueue;
  uint64_t v40;
  NSMapTable *assertionsMapTable;
  void *v42;
  uint64_t v43;
  RBSProcessMonitor *processMonitor;
  uint64_t v45;
  LNUserIdentity *userIdentity;
  LNConnection *p_super;
  void *v48;
  id v49;
  __objc2_class *v50;
  NSObject *v51;
  NSObject *v52;
  _QWORD v54[4];
  id v55;
  objc_super v56;
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v10 = a7;
  v62 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (-[LNConnection isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    if (v17)
    {
      if (objc_msgSend(v17, "integerValue") == 3)
      {
        if (!v18)
        {
          v21 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:]([LNFrameworkConnection alloc], "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v15, v16, v17, 0, v10, v19, a9);
          goto LABEL_24;
        }
        v20 = v18;

        v10 = 0;
        v15 = v20;
      }
      if (objc_msgSend(v17, "integerValue") == 2)
      {
        v21 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:]([LNDaemonConnection alloc], "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v15, v16, v17, v18, v10, v19, a9);
LABEL_24:
        p_super = &v21->super;
        goto LABEL_30;
      }
    }
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v15, 0, &v57);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v57;
    if (v48)
    {
      if (v10 && (objc_msgSend(v48, "ln_isAppIntentsEnabled") & 1) == 0)
      {
        getLNLogCategoryGeneral();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v15;
          _os_log_impl(&dword_1A18F6000, v52, OS_LOG_TYPE_ERROR, "Connection request for non-AppIntents enabled bundle %{public}@", buf, 0xCu);
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = LNApplicationConnection;
LABEL_22:
          p_super = (LNConnection *)objc_msgSend([v50 alloc], "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v15, v16, v17, v18, v10, v19, a9);
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = LNExtensionConnection;
          goto LABEL_22;
        }
      }
    }
    else
    {
      getLNLogCategoryGeneral();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v59 = v15;
        v60 = 2114;
        v61 = v49;
        _os_log_impl(&dword_1A18F6000, v51, OS_LOG_TYPE_ERROR, "Unable to create a bundle record for %{public}@: %{public}@", buf, 0x16u);
      }

      if (a9)
      {
        p_super = 0;
        *a9 = objc_retainAutorelease(v49);
LABEL_29:

        goto LABEL_30;
      }
    }
    p_super = 0;
    goto LABEL_29;
  }
  v56.receiver = self;
  v56.super_class = (Class)LNConnection;
  v22 = -[LNConnection init](&v56, sel_init);
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend(v15, "copy");
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v23->_appBundleIdentifier, a6);
    v26 = objc_msgSend(v16, "copy");
    bundleURL = v23->_bundleURL;
    v23->_bundleURL = (NSURL *)v26;

    objc_storeStrong((id *)&v23->_bundleType, a5);
    v23->_state = 0;
    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connectionOperations = v23->_connectionOperations;
    v23->_connectionOperations = v28;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.link.LNConnection.internal-queue", v31);
    queue = v23->_queue;
    v23->_queue = (OS_dispatch_queue *)v32;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v34 = objc_claimAutoreleasedReturnValue();
    executors = v23->_executors;
    v23->_executors = (NSMapTable *)v34;

    v36 = _os_activity_create(&dword_1A18F6000, "appintents:connection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v23->_activity;
    v23->_activity = (OS_os_activity *)v36;

    v38 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    getConnectionInterfaceQueue = v23->_getConnectionInterfaceQueue;
    v23->_getConnectionInterfaceQueue = v38;

    -[NSOperationQueue setUnderlyingQueue:](v23->_getConnectionInterfaceQueue, "setUnderlyingQueue:", v23->_queue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v23->_getConnectionInterfaceQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v40 = objc_claimAutoreleasedReturnValue();
    assertionsMapTable = v23->_assertionsMapTable;
    v23->_assertionsMapTable = (NSMapTable *)v40;

    v42 = (void *)MEMORY[0x1E0D87D90];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __123__LNConnection_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error___block_invoke;
    v54[3] = &unk_1E45DDDA0;
    v15 = v15;
    v55 = v15;
    objc_msgSend(v42, "monitorWithConfiguration:", v54);
    v43 = objc_claimAutoreleasedReturnValue();
    processMonitor = v23->_processMonitor;
    v23->_processMonitor = (RBSProcessMonitor *)v43;

    v45 = objc_msgSend(v19, "copy");
    userIdentity = v23->_userIdentity;
    v23->_userIdentity = (LNUserIdentity *)v45;

    self = v23;
    p_super = self;
LABEL_30:

    goto LABEL_31;
  }
  p_super = 0;
LABEL_31:

  return p_super;
}

- (void)setDisconnectedWithError:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[LNConnection state](self, "state") != 3
    && -[LNConnection state](self, "state") != 1
    && -[LNConnection state](self, "state") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnected || self.state == LNConnectionStateConnecting || self.state == LNConnectionStateRefreshing"));

  }
  -[LNConnection setState:](self, "setState:", 0);
  -[LNConnection completeWithError:](self, "completeWithError:", v7);

}

- (id)operationWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[LNConnection connectionOperations](self, "connectionOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

- (void)cancelTimeoutForOperationWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LNConnection_cancelTimeoutForOperationWithIdentifier___block_invoke;
  block[3] = &unk_1E45DDE40;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)extendTimeoutForOperationWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnection.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LNConnection_extendTimeoutForOperationWithIdentifier___block_invoke;
  block[3] = &unk_1E45DDE40;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (BOOL)isPerformActionOperationPending
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[LNConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[LNConnection connectionOperations](self, "connectionOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_10484);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)isDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v12;
  _BYTE v13[32];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D016E0];
  -[LNConnection auditToken](self, "auditToken");
  objc_msgSend(v3, "tokenFromAuditToken:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isDaemon");
  }
  else
  {
    getLNLogCategoryConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);

    }
    v8 = 0;
  }

  return v8;
}

- (void)setUpConnectionContextWithAssertions:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, id);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void (**v15)(id, id);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  char v43;
  __CFString *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  LNConnectionContext *v54;
  void *v55;
  LNConnectionContext *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  _BOOL4 v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  void (**v67)(id, id);
  id v68;
  id v69;
  char v70[32];
  void *v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v4 = a3;
  v79 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a4;
  -[LNConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1E0CA5898];
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNConnection bundleType](self, "bundleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(v11, "integerValue") == 3)
  {
    -[LNConnection bundleURL](self, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;

  }
  if (v10)
  {
    -[LNConnection bundleURL](self, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v63 = v4;
      v15 = v6;
      v16 = v10;
      objc_msgSend(v10, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileReferenceURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNConnection bundleURL](self, "bundleURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileReferenceURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
        v24 = 0;
      }
      else
      {
        v24 = 1;
        if (v21 && v22)
          v24 = objc_msgSend(v21, "isEqual:", v22) ^ 1;
      }

      v10 = v16;
      v6 = v15;
      v4 = v63;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  v25 = v12 | v24;
  -[LNConnection userIdentity](self, "userIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26 || (v25 & 1) != 0)
  {
    if (v4)
    {
      v64 = v10;
      getLNLogCategoryConnection();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[LNConnection logPrefix](self, "logPrefix");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v30;
        _os_log_impl(&dword_1A18F6000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Assertions requested for context setup", buf, 0xCu);

      }
      v31 = (void *)MEMORY[0x1E0D016E0];
      -[LNConnection auditToken](self, "auditToken");
      objc_msgSend(v31, "tokenFromAuditToken:", v70);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "pid"));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v33, &v69);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (__CFString *)v69;
      if (v34)
      {
        v61 = v32;
        v62 = v33;
        v36 = CFSTR("com.apple.siri");
        v37 = CFSTR("IntentStartupGrant");
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.siri"), CFSTR("IntentStartupGrant"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = objc_alloc(MEMORY[0x1E0D87C98]);
        objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentifier:", v34);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v40, "initWithExplanation:target:attributes:", CFSTR("Application connection"), v41, v39);

        v68 = 0;
        v43 = objc_msgSend(v42, "acquireWithError:", &v68);
        v44 = (__CFString *)v68;

        getLNLogCategoryConnection();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if ((v43 & 1) != 0)
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            -[LNConnection logPrefix](self, "logPrefix");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v74 = v47;
            v75 = 2114;
            v76 = v62;
            _os_log_impl(&dword_1A18F6000, v46, OS_LOG_TYPE_INFO, "%{public}@ Successfully acquired process assertion (pid: %{public}@) for context setup", buf, 0x16u);

          }
          v48 = 0;
        }
        else
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            -[LNConnection logPrefix](self, "logPrefix");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v51;
            v75 = 2114;
            v76 = CFSTR("IntentStartupGrant");
            v77 = 2114;
            v78 = v44;
            _os_log_impl(&dword_1A18F6000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to acquire assertion %{public}@: %{public}@", buf, 0x20u);

          }
          v6[2](v6, v44);
          v48 = 1;
        }

        v35 = v44;
        v32 = v61;
        v33 = (__CFString *)v62;
      }
      else
      {
        getLNLogCategoryConnection();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          -[LNConnection logPrefix](self, "logPrefix");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v74 = v50;
          v75 = 2114;
          v76 = v33;
          v77 = 2114;
          v78 = v35;
          _os_log_impl(&dword_1A18F6000, v49, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);

        }
        v6[2](v6, v35);
        v42 = 0;
        v48 = 1;
      }

      v10 = v64;
      if (v48)
        goto LABEL_42;
    }
    else
    {
      v42 = 0;
    }
    if (v25)
    {
      -[LNConnection bundleURL](self, "bundleURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v53 = 0;
    }
    v54 = [LNConnectionContext alloc];
    -[LNConnection userIdentity](self, "userIdentity");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[LNConnectionContext initWithUserIdentity:requiredBundleURLs:](v54, "initWithUserIdentity:requiredBundleURLs:", v55, v53);

    getLNLogCategoryConnection();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v58;
      v75 = 2112;
      v76 = (const __CFString *)v56;
      _os_log_impl(&dword_1A18F6000, v57, OS_LOG_TYPE_INFO, "%{public}@ Updating connection connection context with: %@", buf, 0x16u);

    }
    -[LNConnection xpcConnection](self, "xpcConnection");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "remoteObjectProxy");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __71__LNConnection_setUpConnectionContextWithAssertions_completionHandler___block_invoke;
    v65[3] = &unk_1E45DDED0;
    v42 = v42;
    v66 = v42;
    v67 = v6;
    objc_msgSend(v60, "updateConnectionContext:completionHandler:", v56, v65);

LABEL_42:
    goto LABEL_43;
  }
  getLNLogCategoryConnection();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v74 = v28;
    v75 = 2114;
    v76 = CFSTR("NO");
    v77 = 2114;
    v78 = CFSTR("NO");
    _os_log_impl(&dword_1A18F6000, v27, OS_LOG_TYPE_INFO, "%{public}@ Skipping connection context update: has user identity: %{public}@, needs to load bundles at runtime: %{public}@", buf, 0x20u);

  }
  v6[2](v6, 0);
LABEL_43:

}

- (void)close
{
  -[LNConnection closeWithError:](self, "closeWithError:", 0);
}

- (id)executorForAction:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  LNActionExecutor *v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v15);
  v11 = -[LNActionExecutor initWithAction:connection:options:]([LNActionExecutor alloc], "initWithAction:connection:options:", v8, self, v9);
  -[LNActionExecutor setDelegate:](v11, "setDelegate:", v10);
  -[LNConnection executors](self, "executors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v13);

  os_activity_scope_leave(&v15);
  return v11;
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[LNConnection activity](self, "activity");
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &state);

  -[LNConnection queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__LNConnection_assertion_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E45DDF20;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

  os_activity_scope_leave(&state);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (LNUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSNumber)bundleType
{
  return self->_bundleType;
}

- (void)setLogPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_logPrefix, a3);
}

- (NSMapTable)executors
{
  return self->_executors;
}

void __49__LNConnection_assertion_didInvalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t j;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "processMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "states");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (!v4)
  {

LABEL_12:
    LNConnectionErrorWithCode(1003);
    v9 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "assertionsMapTable", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "copy");

    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "assertionsMapTable");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 48);

          if (v19 == v20)
            objc_msgSend(v17, "finishWithError:", v9);
        }
        v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }
    goto LABEL_21;
  }
  v5 = v4;
  v6 = *(_QWORD *)v26;
  v7 = 1;
  do
  {
    for (j = 0; j != v5; ++j)
    {
      if (*(_QWORD *)v26 != v6)
        objc_enumerationMutation(v3);
      v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "taskState");
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  }
  while (v5);

  if ((v7 & 1) != 0)
    goto LABEL_12;
  getLNLogCategoryConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2114;
    v33 = v11;
    _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Application process assertion was dropped after timeout: %{public}@", buf, 0x16u);
LABEL_21:

  }
}

void __71__LNConnection_setUpConnectionContextWithAssertions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __47__LNConnection_isPerformActionOperationPending__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __56__LNConnection_extendTimeoutForOperationWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "extendTimeout");
    objc_msgSend(*(id *)(a1 + 32), "extendIdleTimeout");
    objc_msgSend(*(id *)(a1 + 32), "invalidateAssertionsForConnectionOperation:", v3);
    objc_msgSend(*(id *)(a1 + 32), "acquireAssertionsForConnectionOperation:", v3);
  }
  else
  {
    getLNLogCategoryConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Operation not found: unable to extend timeout for operation with identifier %{public}@.", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __56__LNConnection_cancelTimeoutForOperationWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateAssertionsForConnectionOperation:", v2);
    objc_msgSend(v2, "cancelTimeout");
    objc_msgSend(*(id *)(a1 + 32), "cancelIdleTimeout");
  }
  else
  {
    getLNLogCategoryConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Operation not found: unable to cancel timeout for operation with identifier %{public}@.", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    LNConnectionErrorWithCode(1900);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completeWithError:", v3);

  }
}

void __35__LNConnection_connectionInterface__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v3;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Remote object proxy error: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(WeakRetained, "state") == 3)
  {
    objc_msgSend(WeakRetained, "setDisconnectedWithError:", v3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "finishWithError:", v3);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __33__LNConnection_setXPCConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  os_activity_scope_state_s state;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "logPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_ERROR, "%{public}@ XPC connection has been interrupted", buf, 0xCu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(WeakRetained, "setXPCConnection:", 0);
    objc_msgSend(WeakRetained, "setState:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          LNConnectionErrorWithCode(1004);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "finishWithError:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  os_activity_scope_leave(&state);
}

void __33__LNConnection_setXPCConnection___block_invoke_54(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_activity_scope_state_s state;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "[%@] XPC connection has been invalidated", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setXPCConnection:", 0);
    objc_msgSend(WeakRetained, "setState:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          LNConnectionErrorWithCode(1005);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "finishWithError:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

  }
  os_activity_scope_leave(&state);
}

void __123__LNConnection_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D87DA0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "predicateMatchingBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v6);

  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", 1);
  objc_msgSend(v4, "setStateDescriptor:", v7);

}

+ (void)invalidateAllConnections
{
  id v2;

  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAllConnections");

}

+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v7 = a3;
  objc_msgSend(a1, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "audioStartingProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", v10))
  {

LABEL_4:
    objc_msgSend(v8, "setInitiatesAudioSession:", 1);
    goto LABEL_5;
  }
  objc_msgSend(v7, "systemProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "audioRecordingProtocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
    goto LABEL_4;
LABEL_5:

  return v8;
}

- (int64_t)metadataVersion
{
  return 1;
}

- (LNConnection)initWithBundleIdentifier:(id)a3 metadataVersion:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  LNConnection *v9;

  v7 = a3;
  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v7, 0, 0, 0, 0, 0, a5);
  v9 = (LNConnection *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LNConnection)initWithBundleIdentifier:(id)a3
{
  return -[LNConnection initWithBundleIdentifier:metadataVersion:error:](self, "initWithBundleIdentifier:metadataVersion:error:", a3, 0, 0);
}

- (id)executorForAction:(id)a3 metadata:(id)a4 appBundleIdentifier:(id)a5 options:(id)a6 delegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_storeStrong((id *)&self->_appBundleIdentifier, a5);
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[LNConnection executorForAction:options:delegate:](self, "executorForAction:options:delegate:", v13, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)executorForAction:(id)a3 metadata:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *appBundleIdentifier;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "effectiveBundleIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "if_firstObjectPassingTest:", &__block_literal_global_307);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v16;

  -[LNConnection executorForAction:options:delegate:](self, "executorForAction:options:delegate:", v12, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)executorForAction:(id)a3 label:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setClientLabel:", v9);

  objc_msgSend(v11, "setInteractionMode:", 0);
  objc_msgSend(v11, "setSource:", 0);
  -[LNConnection executorForAction:options:delegate:](self, "executorForAction:options:delegate:", v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setClientLabel:", v11);

  objc_msgSend(v13, "setInteractionMode:", a4);
  objc_msgSend(v13, "setSource:", 0);
  -[LNConnection executorForAction:options:delegate:](self, "executorForAction:options:delegate:", v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 source:(unsigned __int16)a6 delegate:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setClientLabel:", v13);

  objc_msgSend(v15, "setInteractionMode:", a4);
  objc_msgSend(v15, "setSource:", v7);
  -[LNConnection executorForAction:options:delegate:](self, "executorForAction:options:delegate:", v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

BOOL __72__LNConnection_Deprecated__executorForAction_metadata_options_delegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  LNConnection *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __124__LNConnection_FetchSuggestedFocusActions__fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke;
  v14[3] = &unk_1E45DE3A0;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", 0, v14);

}

void __124__LNConnection_FetchSuggestedFocusActions__fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  LNFetchSuggestedFocusActionsConnectionOperation *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  LNFetchSuggestedFocusActionsConnectionOperation *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = [LNFetchSuggestedFocusActionsConnectionOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNFetchSuggestedFocusActionsConnectionOperation initWithConnectionInterface:actionMetadata:suggestionContext:queue:completionHandler:](v3, "initWithConnectionInterface:actionMetadata:suggestionContext:queue:completionHandler:", v8, v4, v5, v6, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 48), "enqueueConnectionOperation:", v7);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end
