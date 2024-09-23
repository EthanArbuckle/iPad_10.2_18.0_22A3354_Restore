@implementation FBProcess

- (BOOL)hasEntitlement:(id)a3
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", a3);
}

- (double)execTime
{
  return self->_execTime;
}

- (_QWORD)logProem
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[12];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@:-1]"), a1[11]);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (int)pid
{
  return self->_pid;
}

- (RBSTarget)target
{
  return self->_target;
}

- (void)_setSceneLifecycleState:(unsigned __int8)a3
{
  int v3;
  uint64_t v5;
  _QWORD v6[4];
  char v7;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_sceneState != v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    self->_lock_sceneState = v3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __37__FBProcess__setSceneLifecycleState___block_invoke;
    v6[3] = &__block_descriptor_33_e24_v16__0__FBProcessState_8l;
    v7 = v3;
    -[FBProcess _updateStateWithBlock:](self, "_updateStateWithBlock:", v6);
  }
  os_unfair_recursive_lock_unlock();
}

- (void)_rebuildState:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  unsigned int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FBProcess *v13;
  int64_t v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)&self->_lock_rbsState, a3);
    v7 = -[FBProcessState taskState](self->_lock_state, "taskState");
    v8 = objc_msgSend(v6, "taskState") - 2;
    if (v8 <= 2)
      v7 = qword_1A3619990[(char)v8];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __27__FBProcess__rebuildState___block_invoke;
    v11[3] = &unk_1E4A131D8;
    v13 = self;
    v14 = v7;
    v12 = v6;
    v10 = v6;
    -[FBProcess _updateStateWithBlock:](self, "_updateStateWithBlock:", v11);
    os_unfair_recursive_lock_unlock();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("rbsState != ((void *)0)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _rebuildState:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_launchDidComplete:(BOOL)a3 finalizeBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  NSMutableArray *v12;
  NSMutableArray *lock_launchCompletionBlocks;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  FBProcess *v24;
  void *v25;
  void *v26;
  FBSProcessWatchdogPolicy *v27;
  FBSProcessWatchdogPolicy *sceneCreateWatchdogPolicy;
  NSObject *v29;
  void *v30;
  FBSProcessWatchdogPolicy *v31;
  FBProcessWatchdog *lock_watchdog;
  NSObject *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  _BOOL4 v36;
  id v37;
  _QWORD block[4];
  NSMutableArray *v39;
  FBProcess *v40;
  id v41;
  BOOL v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE buf[24];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v4 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_launchFinalized)
  {
    os_unfair_recursive_lock_unlock();
    if (v6)
    {
      +[FBProcess rbInteractionWorkloop](FBProcess, "rbInteractionWorkloop");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v7, v6);

    }
    goto LABEL_37;
  }
  self->_lock_launchFinalized = 1;
  self->_lock_launchSuccess = v4;
  FBLogProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      -[FBProcess logProem](self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      v11 = "%{public}@ Connection to remote process established!";
LABEL_9:
      _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);

    }
  }
  else if (v9)
  {
    -[FBProcess logProem](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    v11 = "%{public}@ Connection to remote process was not established.";
    goto LABEL_9;
  }

  v12 = self->_lock_launchCompletionBlocks;
  lock_launchCompletionBlocks = self->_lock_launchCompletionBlocks;
  self->_lock_launchCompletionBlocks = 0;

  if (-[FBProcessWatchdog event](self->_lock_watchdog, "event") == 1)
  {
    -[FBSProcessWatchdog deactivate](self->_lock_watchdog, "deactivate");
    if (v4)
    {
      v35 = v12;
      v36 = v4;
      v37 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[FBSProcessWatchdog policy](self->_lock_watchdog, "policy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "provisions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v46 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            v43 = 0uLL;
            v44 = 0;
            if (objc_msgSend(v21, "isResourceProvision")
              && objc_msgSend(v21, "allowanceRemaining:", &v43))
            {
              *(_OWORD *)buf = v43;
              *(_QWORD *)&buf[16] = v44;
              objc_msgSend(MEMORY[0x1E0D23190], "provisionWithAllowance:", buf);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                FBLogWatchdog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  -[FBProcess logProem](self);
                  v24 = self;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v25;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v21;
                  *(_WORD *)&buf[22] = 2114;
                  v50 = v22;
                  _os_log_impl(&dword_1A359A000, v23, OS_LOG_TYPE_INFO, "%{public}@ Provision %{public}@ has remainder %{public}@", buf, 0x20u);

                  self = v24;
                }

                objc_msgSend(v14, "addObject:", v22);
              }

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v18);
      }

      v26 = v14;
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(MEMORY[0x1E0D231A0], "policyWithName:forProvisions:", CFSTR("scene create after launch"), v14);
        v27 = (FBSProcessWatchdogPolicy *)objc_claimAutoreleasedReturnValue();
        sceneCreateWatchdogPolicy = self->_sceneCreateWatchdogPolicy;
        self->_sceneCreateWatchdogPolicy = v27;

      }
      FBLogWatchdog();
      v29 = objc_claimAutoreleasedReturnValue();
      v4 = v36;
      v12 = v35;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        -[FBProcess logProem](self);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self->_sceneCreateWatchdogPolicy;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_1A359A000, v29, OS_LOG_TYPE_INFO, "%{public}@ Made scene-create policy: %{public}@", buf, 0x16u);

      }
      v6 = v37;
    }
    -[FBSProcessWatchdog invalidate](self->_lock_watchdog, "invalidate");
    lock_watchdog = self->_lock_watchdog;
    self->_lock_watchdog = 0;

  }
  if (v4)
  {
    if (self->_lock_waitForDebugger)
    {
      self->_lock_waitForDebugger = 0;
      -[FBProcess _rebuildState](self, "_rebuildState");
    }
  }
  else
  {
    -[FBProcess _notePendingExitForReason:](self, "_notePendingExitForReason:", CFSTR("launch failed"));
  }
  os_unfair_recursive_lock_unlock();
  +[FBProcess calloutQueue](FBProcess, "calloutQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke;
  block[3] = &unk_1E4A13220;
  v42 = v4;
  v39 = v12;
  v40 = self;
  v41 = v6;
  v34 = v12;
  dispatch_async(v33, block);

LABEL_37:
}

- (NSString)description
{
  NSString *description;

  description = self->_description;
  if (description)
    return description;
  -[FBProcess succinctDescription](self, "succinctDescription");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPendingExit
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_lock_pendingExit;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isFinishedLaunching
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_lock_launchSuccess;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)_executeBlockAfterLaunchCompletes:(id)a3
{
  void (**v4)(id, _BOOL8);
  _BOOL8 lock_launchSuccess;
  NSMutableArray *lock_launchCompletionBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *v10;
  void (**v11)(id, _BOOL8);

  v4 = (void (**)(id, _BOOL8))a3;
  if (v4)
  {
    v11 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if (self->_lock_launchFinalized)
    {
      lock_launchSuccess = self->_lock_launchSuccess;
      os_unfair_recursive_lock_unlock();
      v11[2](v11, lock_launchSuccess);
    }
    else
    {
      lock_launchCompletionBlocks = self->_lock_launchCompletionBlocks;
      if (lock_launchCompletionBlocks)
      {
        v7 = (void *)objc_msgSend(v11, "copy");
        v8 = (NSMutableArray *)MEMORY[0x1A8590C4C]();
        -[NSMutableArray addObject:](lock_launchCompletionBlocks, "addObject:", v8);
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C99DE8];
        v7 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v9, "arrayWithObject:", v7);
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v8 = self->_lock_launchCompletionBlocks;
        self->_lock_launchCompletionBlocks = v10;
      }

      os_unfair_recursive_lock_unlock();
    }
    v4 = v11;
  }

}

- (BSProcessHandle)handle
{
  return self->_handle;
}

+ (id)_currentProcess
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FBProcess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_executeBlockAsCurrentProcess:(id)a3
{
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = (void (**)(_QWORD))a3;
  objc_msgSend(v4, "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("FBProcess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", self, CFSTR("FBProcess"));
  v5[2](v5);

  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("FBProcess"));
  else
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("FBProcess"));

}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (BOOL)isRunning
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = -[FBProcessState isRunning](self->_lock_state, "isRunning");
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)isForeground
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = -[FBProcessState isForeground](self->_lock_state, "isForeground");
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

void __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  int v12;
  int v13;
  int64_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i) + 16))();
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 40), "isApplicationProcess"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 323) = 1;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "applicationProcessDidLaunch:", *(_QWORD *)(a1 + 40));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v9);
    }

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isApplicationProcess") & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "hasConsistentLaunchdJob");
  if (*(_BYTE *)(a1 + 56))
    v13 = 1;
  else
    v13 = v12;
  if (v13)
    v14 = 1000000000;
  else
    v14 = 100000000;
  v15 = dispatch_time(0, v14);
  +[FBProcess rbInteractionWorkloop](FBProcess, "rbInteractionWorkloop");
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_2;
  v18[3] = &unk_1E4A130B8;
  v17 = *(void **)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 40);
  v19 = v17;
  dispatch_after(v15, v16, v18);

}

uint64_t __25__FBProcess_addObserver___block_invoke(uint64_t result)
{
  uint64_t v1;
  _BYTE *v2;

  v1 = result;
  v2 = *(_BYTE **)(result + 32);
  if (v2[320])
  {
    result = objc_msgSend(*(id *)(result + 40), "processWillExit:");
    v2 = *(_BYTE **)(v1 + 32);
  }
  if (v2[321])
  {
    result = objc_msgSend(*(id *)(v1 + 40), "processDidExit:");
    v2 = *(_BYTE **)(v1 + 32);
  }
  if (v2[322])
  {
    result = objc_msgSend(*(id *)(v1 + 40), "applicationProcessWillLaunch:");
    v2 = *(_BYTE **)(v1 + 32);
  }
  if (v2[323])
    return objc_msgSend(*(id *)(v1 + 40), "applicationProcessDidLaunch:");
  return result;
}

void __35__FBProcess__updateStateWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "process:stateDidChangeFromState:toState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 56))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * j), "applicationProcessDebuggingStateDidChange:", *(_QWORD *)(a1 + 32));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

- (id)_observers
{
  os_unfair_lock_s *p_observerLock;
  void *v4;

  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  v4 = (void *)-[NSMutableSet copy](self->_observerLock_observers, "copy");
  os_unfair_lock_unlock(p_observerLock);
  return v4;
}

- (void)_noteStateDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (objc_msgSend(v6, "taskState"))
  {
    -[FBProcess _rebuildState:](self, "_rebuildState:", v6);
  }
  else
  {
    FBLogProcess();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FBProcess _noteStateDidUpdate:].cold.1(v4, v7);

  }
}

- (BOOL)isApplicationProcess
{
  return 0;
}

- (BOOL)executableLivesOnSystemPartition
{
  char IsYes;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_executableLivesOnSystemPartition == 0x7FFFFFFFFFFFFFFFLL && self->_executablePath)
  {
    BSPathExistsOnSystemPartition();
    self->_lock_executableLivesOnSystemPartition = BSSettingFlagForBool();
  }
  IsYes = BSSettingFlagIsYes();
  os_unfair_recursive_lock_unlock();
  return IsYes;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)dealloc
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

- (FBProcessState)state
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[FBProcessState copy](self->_lock_state, "copy");
  os_unfair_recursive_lock_unlock();
  return (FBProcessState *)v3;
}

- (BOOL)bootstrapWithDelegate:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 lock_attemptedBootstrap;
  BOOL result;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    os_unfair_recursive_lock_lock_with_options();
    lock_attemptedBootstrap = self->_lock_attemptedBootstrap;
    if (self->_lock_attemptedBootstrap)
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      self->_lock_attemptedBootstrap = 1;
      objc_storeWeak((id *)&self->_lock_delegate, v5);
      os_unfair_recursive_lock_unlock();
      -[FBProcess _bootstrapAndExec](self, "_bootstrapAndExec");
    }

    return !lock_attemptedBootstrap;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess bootstrapWithDelegate:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_bootstrapAndExec
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_15(&dword_1A359A000, a3, v6, "Bootstrapping failed for %{public}@ with error: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8_2();
}

- (void)_configureIntrinsicsFromHandle:(id)a3
{
  RBSProcessHandle *v5;
  RBSProcessHandle *v6;
  RBSProcessHandle *rbsHandle;
  RBSProcessHandle **p_rbsHandle;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  RBSProcessHandle *v15;
  BSAuditToken *v16;
  BSAuditToken *auditToken;
  RBSTarget *v18;
  RBSTarget *target;
  NSString *v20;
  NSString *description;
  NSString *v22;
  NSString *handleDescription;
  int pid;
  RBSProcessIdentity *identity;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  RBSProcessIdentity *v36;
  void *v37;
  void *v38;
  _OWORD v39[2];
  char v40[32];

  v5 = (RBSProcessHandle *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handle != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _configureIntrinsicsFromHandle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_33:
    JUMPOUT(0x1A35AF6FCLL);
  }
  v6 = v5;
  p_rbsHandle = &self->_rbsHandle;
  rbsHandle = self->_rbsHandle;
  if (rbsHandle == v5)
    goto LABEL_14;
  if (rbsHandle)
  {
    v9 = (void *)MEMORY[0x1E0D22F80];
    -[RBSProcessHandle auditToken](v5, "auditToken");
    objc_msgSend(v9, "tokenFromAuditToken:", v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", self->_auditToken) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("auditToken mismatch : existing=%@ new=%@"), self->_auditToken, v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBProcess _configureIntrinsicsFromHandle:].cold.6();
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35AF75CLL);
    }
    -[RBSProcessHandle identity](*p_rbsHandle, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle identity](v6, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[RBSProcessHandle identity](*p_rbsHandle, "identity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBSProcessHandle identity](v6, "identity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("identity mismatch : existing=%@ new=%@"), v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBProcess _configureIntrinsicsFromHandle:].cold.5();
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35AF7E4);
    }

    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_rbsHandle, a3);
  self->_pid = -[RBSProcessHandle pid](v6, "pid");
  v14 = (void *)MEMORY[0x1E0D22F80];
  v15 = self->_rbsHandle;
  if (v15)
    -[RBSProcessHandle auditToken](v15, "auditToken");
  else
    memset(v39, 0, sizeof(v39));
  objc_msgSend(v14, "tokenFromAuditToken:", v39);
  v16 = (BSAuditToken *)objc_claimAutoreleasedReturnValue();
  auditToken = self->_auditToken;
  self->_auditToken = v16;

  self->_versionedPID = -[BSAuditToken versionedPID](self->_auditToken, "versionedPID");
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", self->_pid);
  v18 = (RBSTarget *)objc_claimAutoreleasedReturnValue();
  target = self->_target;
  self->_target = v18;

  -[FBProcess succinctDescription](self, "succinctDescription");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  description = self->_description;
  self->_description = v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@:%d]"), self->_identityDescription, self->_pid);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  handleDescription = self->_handleDescription;
  self->_handleDescription = v22;

  pid = self->_pid;
  if (pid != -[BSAuditToken pid](self->_auditToken, "pid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RBSProcessHandle %@ gave us a pid (%d) and an audit token with pid (%d) that don't match"), self->_rbsHandle, self->_pid, -[BSAuditToken pid](self->_auditToken, "pid"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _configureIntrinsicsFromHandle:].cold.4();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AF854);
  }
  if (-[BSAuditToken isInvalid](self->_auditToken, "isInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RBSProcessHandle %@ gave us a bogus audit token: %@"), self->_rbsHandle, self->_auditToken);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _configureIntrinsicsFromHandle:].cold.2();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AF8B4);
  }
  if ((-[RBSProcessIdentity isXPCService](self->_identity, "isXPCService") & 1) == 0)
  {
    identity = self->_identity;
    -[RBSProcessHandle identity](v6, "identity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(identity) = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v26);

    if ((identity & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = self->_identity;
      -[RBSProcessHandle identity](v6, "identity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("processIdentity %@ is not equal to handleIdentity %@"), v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBProcess _configureIntrinsicsFromHandle:].cold.3();
      objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      goto LABEL_33;
    }
  }
LABEL_14:

}

- (BOOL)_startWatchdogTimerForContext:(id)a3
{
  id v4;
  int pid;
  BOOL v6;
  id v8;
  FBProcessWatchdog **p_lock_watchdog;
  FBProcessWatchdog *v10;

  v4 = a3;
  pid = self->_pid;
  if (pid == getpid())
    goto LABEL_4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  v8 = -[FBProcess _newWatchdogForContext:completion:](self, "_newWatchdogForContext:completion:", v4, 0);
  v6 = v8 != 0;
  if (v8)
  {
    p_lock_watchdog = &self->_lock_watchdog;
    v10 = self->_lock_watchdog;
    objc_storeStrong((id *)p_lock_watchdog, v8);
  }
  else
  {
    v10 = 0;
  }
  os_unfair_recursive_lock_unlock();
  -[FBSProcessWatchdog invalidate](v10, "invalidate");
  objc_msgSend(v8, "activate");

LABEL_5:
  return v6;
}

- (void)_configureBundleInfo
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

- (void)bootstrapLock:(id)a3
{
  void (**v4)(id, FBProcess *);

  v4 = (void (**)(id, FBProcess *))a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_lock_lock(&self->_bootstrapLock);
  if (v4)
    v4[2](v4, self);
  os_unfair_lock_unlock(&self->_bootstrapLock);

}

- (void)_executeBlockAfterBootstrap:(id)a3
{
  id v4;
  NSMutableArray *lock_bootstrapBlocks;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    lock_bootstrapBlocks = self->_lock_bootstrapBlocks;
    if (lock_bootstrapBlocks)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      v7 = (void *)MEMORY[0x1A8590C4C]();
      -[NSMutableArray addObject:](lock_bootstrapBlocks, "addObject:", v7);

    }
    else
    {
      +[FBProcess calloutQueue](FBProcess, "calloutQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __41__FBProcess__executeBlockAfterBootstrap___block_invoke;
      v9[3] = &unk_1E4A130B8;
      v9[4] = self;
      v10 = v4;
      dispatch_async(v8, v9);

    }
    os_unfair_recursive_lock_unlock();
  }

}

- (BOOL)isBeingDebugged
{
  BOOL v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = -[FBProcessState isDebugging](self->_lock_state, "isDebugging");
  os_unfair_recursive_lock_unlock();
  if (v3)
    return 1;
  else
    return BSPIDIsBeingDebugged();
}

- (void)_updateStateWithBlock:(id)a3
{
  void (**v4)(id, FBProcessState *);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, FBProcessState *))a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_didExit)
  {
    if (self->_lock_updatingState)
    {
      if (v4)
        v4[2](v4, self->_lock_state);
    }
    else
    {
      self->_lock_updatingState = 1;
      v5 = (void *)-[FBProcessState copy](self->_lock_state, "copy");
      if (v4)
        v4[2](v4, self->_lock_state);
      v6 = objc_msgSend(v5, "taskState");
      if (v6 != -[FBProcessState taskState](self->_lock_state, "taskState"))
      {
        FBLogProcess();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[FBProcess logProem](self);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromFBProcessTaskState(-[FBProcessState taskState](self->_lock_state, "taskState"));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v8;
          v29 = 2114;
          v30 = v9;
          _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process task state to: %{public}@", buf, 0x16u);

        }
      }
      v10 = objc_msgSend(v5, "visibility");
      if (v10 != -[FBProcessState visibility](self->_lock_state, "visibility"))
      {
        FBLogProcess();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[FBProcess logProem](self);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromFBProcessVisibility(-[FBProcessState visibility](self->_lock_state, "visibility"));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v12;
          v29 = 2114;
          v30 = v13;
          _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process visibility to: %{public}@", buf, 0x16u);

        }
      }
      v14 = objc_msgSend(v5, "isDebugging");
      v15 = v14 ^ -[FBProcessState isDebugging](self->_lock_state, "isDebugging");
      if (v15 == 1)
      {
        FBLogProcess();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[FBProcess logProem](self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[FBProcessState isDebugging](self->_lock_state, "isDebugging");
          v19 = CFSTR("NO");
          if (v18)
            v19 = CFSTR("YES");
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2114;
          v30 = v19;
          _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process debug state to: %{public}@", buf, 0x16u);

        }
      }
      if ((objc_msgSend(v5, "isEqual:", self->_lock_state) & 1) == 0)
      {
        v20 = (void *)-[FBProcessState copy](self->_lock_state, "copy");
        +[FBProcess calloutQueue](FBProcess, "calloutQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __35__FBProcess__updateStateWithBlock___block_invoke;
        v23[3] = &unk_1E4A13128;
        v23[4] = self;
        v24 = v5;
        v25 = v20;
        v26 = v15;
        v22 = v20;
        dispatch_async(v21, v23);

      }
      self->_lock_updatingState = 0;

    }
  }
  os_unfair_recursive_lock_unlock();

}

void __27__FBProcess__rebuildState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setTaskState:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "isDebugging") & 1) != 0 || *(_BYTE *)(*(_QWORD *)(a1 + 40) + 291))
    v3 = 1;
  else
    v3 = BSPIDIsBeingDebugged();
  objc_msgSend(v4, "setDebugging:", v3);

}

uint64_t __37__FBProcess__setSceneLifecycleState___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(a1 + 32);
  if (v2 == 1)
    v3 = 1;
  else
    v3 = 2 * (v2 == 2);
  return objc_msgSend(a2, "setVisibility:", v3);
}

void __30__FBProcess__bootstrapAndExec__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v4, "setPid:", v3);
  objc_msgSend(v4, "setTaskState:", 2);
  objc_msgSend(v4, "setVisibility:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRunning"))
    objc_msgSend(*(id *)(a1 + 32), "_rebuildState:", v5);

}

uint64_t __47__FBProcess__newWatchdogForContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (a2)
  {
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D22E30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      FBLogWatchdog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[FBProcess logProem](*(_QWORD **)(a1 + 32));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v17;
        v24 = 2114;
        v25 = v18;
        v26 = 2114;
        v27 = v7;
        _os_log_error_impl(&dword_1A359A000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Provision violated for watchdog %{public}@: %{public}@", buf, 0x20u);

      }
      v9 = objc_msgSend(v7, "copy");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 280);
      *(_QWORD *)(v10 + 280) = v9;

    }
  }
  v12 = *(void **)(a1 + 40);
  if (v12 == *(void **)(*(_QWORD *)(a1 + 32) + 264))
  {
    objc_msgSend(v12, "invalidate");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 264);
    *(_QWORD *)(v13 + 264) = 0;

  }
  os_unfair_recursive_lock_unlock();
  +[FBProcess calloutQueue](FBProcess, "calloutQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__FBProcess__newWatchdogForContext_completion___block_invoke_136;
  v19[3] = &unk_1E4A13090;
  v21 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 40);
  dispatch_async(v15, v19);

  return 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  FBProcessObserver *v5;
  NSObject *v6;
  _QWORD v7[5];
  FBProcessObserver *v8;

  if (a3)
  {
    v4 = a3;
    v5 = -[FBProcessObserver initWithObserver:]([FBProcessObserver alloc], "initWithObserver:", v4);

    os_unfair_lock_lock(&self->_observerLock);
    if (v5 && (-[NSMutableSet containsObject:](self->_observerLock_observers, "containsObject:", v5) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_observerLock_observers, "addObject:", v5);
      os_unfair_lock_unlock(&self->_observerLock);
      +[FBProcess calloutQueue](FBProcess, "calloutQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __25__FBProcess_addObserver___block_invoke;
      v7[3] = &unk_1E4A11FD0;
      v7[4] = self;
      v8 = v5;
      dispatch_async(v6, v7);

    }
    else
    {
      os_unfair_lock_unlock(&self->_observerLock);
      -[FBProcessObserver invalidate](v5, "invalidate");
    }

  }
}

+ (OS_dispatch_queue)calloutQueue
{
  if (calloutQueue_onceToken != -1)
    dispatch_once(&calloutQueue_onceToken, &__block_literal_global_11);
  return (OS_dispatch_queue *)(id)calloutQueue_queue;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBProcess succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[FBProcess succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  NSStringFromFBProcessTaskState(-[FBProcessState taskState](self->_lock_state, "taskState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("taskState"), 1);

  NSStringFromFBProcessVisibility(-[FBProcessState visibility](self->_lock_state, "visibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v7, CFSTR("visibility"), 1);

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  NSString *identityDescription;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  identityDescription = self->_identityDescription;
  NSStringFromBSVersionedPID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), identityDescription, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, 0);

  return v3;
}

- (void)noteProcessPublished
{
  -[FBWorkspace _enableLegacyRequests:]((uint64_t)self->_workspace, self);
}

- (BOOL)isCurrentProcess
{
  int pid;

  pid = self->_pid;
  return pid == getpid();
}

- (FBProcessExecutionContext)executionContext
{
  return self->_executionContext;
}

- (FBSApplicationInfo)applicationInfo
{
  FBSApplicationInfo *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lock_applicationInfo;
  if (!v3)
  {
    v5 = -[FBProcess isApplicationProcess](self, "isApplicationProcess");
    os_unfair_recursive_lock_unlock();
    if (!v5)
    {
      v4 = 0;
      return (FBSApplicationInfo *)v4;
    }
    +[FBSystemService sharedInstanceIfExists](FBSystemService, "sharedInstanceIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_applicationInfoProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_auditToken && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "applicationInfoForAuditToken:", self->_auditToken);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_bundleIdentifier)
      {
        v4 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v7, "applicationInfoForBundleIdentifier:");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v8;
LABEL_12:
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)&self->_lock_applicationInfo, v4);
    os_unfair_recursive_lock_unlock();

    return (FBSApplicationInfo *)v4;
  }
  v4 = v3;
  os_unfair_recursive_lock_unlock();
  return (FBSApplicationInfo *)v4;
}

- (id)_newWatchdogForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  FBSProcessWatchdogPolicy *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  FBSProcessWatchdogPolicy *v19;
  FBProcessWatchdog *v20;
  FBSProcessWatchdogPolicy *sceneCreateWatchdogPolicy;
  FBProcessWatchdog *v22;
  _QWORD v24[5];
  FBProcessWatchdog *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "event");
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "sceneTransitionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2
    && (objc_msgSend(v9, "watchdogTransitionContext"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "runIndependently"),
        v11,
        !v12))
  {
    v19 = self->_sceneCreateWatchdogPolicy;
    sceneCreateWatchdogPolicy = self->_sceneCreateWatchdogPolicy;
    self->_sceneCreateWatchdogPolicy = 0;

    if (v19)
    {
LABEL_10:
      v22 = -[FBProcessWatchdog initWithProcess:context:policy:]([FBProcessWatchdog alloc], "initWithProcess:context:policy:", self, v6, v19);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__FBProcess__newWatchdogForContext_completion___block_invoke;
      v24[3] = &unk_1E4A13248;
      v24[4] = self;
      v25 = v22;
      v26 = v7;
      v20 = v22;
      -[FBSProcessWatchdog setCompletion:](v20, "setCompletion:", v24);

      goto LABEL_11;
    }
  }
  else
  {
    v13 = self->_sceneCreateWatchdogPolicy;
    self->_sceneCreateWatchdogPolicy = 0;

  }
  objc_msgSend(v10, "watchdogTransitionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "watchdogProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    -[FBProcess _watchdogProvider](self, "_watchdogProvider");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v18, "watchdogPolicyForProcess:eventContext:", self, v6);
  v19 = (FBSProcessWatchdogPolicy *)objc_claimAutoreleasedReturnValue();

  if (v19)
    goto LABEL_10;
  v20 = 0;
LABEL_11:
  os_unfair_recursive_lock_unlock();

  return v20;
}

- (RBSProcessHandle)rbsHandle
{
  return self->_rbsHandle;
}

- (id)_watchdogProvider
{
  os_unfair_lock_s *p_watchdogProviderLock;
  FBProcessWatchdogProviding *v4;
  FBProcessWatchdogProviding *v5;
  FBProcessWatchdogProviding *v6;

  p_watchdogProviderLock = &self->_watchdogProviderLock;
  os_unfair_lock_lock(&self->_watchdogProviderLock);
  v4 = self->_watchdogProvider;
  os_unfair_lock_unlock(p_watchdogProviderLock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[FBProcess delegate](self, "delegate");
    v5 = (FBProcessWatchdogProviding *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (FBWorkspace)workspace
{
  return self->_workspace;
}

- (id)_createBootstrapContext
{
  id v3;
  objc_class *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D87D10]);
  objc_msgSend(v3, "setIdentity:", self->_identity);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExplanation:", v5);

  +[FBWorkspaceDomain sharedInstance]();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain assertionAttributesForLaunchIntent:](v6, -[FBProcessExecutionContext launchIntent](self->_executionContext, "launchIntent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:", v7);

  -[FBProcessExecutionContext overrideExecutablePath](self->_executionContext, "overrideExecutablePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideExecutablePath:", v8);

  -[FBProcessExecutionContext overrideExecutableSlice](self->_executionContext, "overrideExecutableSlice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLsBinpref:", v12);

    if (objc_msgSend(v10, "subtype") != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "subtype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLsBinprefSubtype:", v14);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D22E38]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setManagedEndpointLaunchIdentifiers:", v15);

  return v3;
}

+ (id)createProcessWithHandle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("RBSProcessIdentity"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBProcess createProcessWithHandle:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BAE98);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBProcess createProcessWithHandle:].cold.1();
    goto LABEL_9;
  }

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "fb_processClass")), "_initWithIdentity:handle:executionContext:", v4, v3, 0);
  return v5;
}

+ (id)createProcessWithExecutionContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("RBSProcessIdentity"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBProcess createProcessWithExecutionContext:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BAFF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBProcess createProcessWithExecutionContext:].cold.1();
    goto LABEL_9;
  }

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "fb_processClass")), "_initWithIdentity:handle:executionContext:", v4, 0, v3);
  return v5;
}

- (id)_initWithIdentity:(id)a3 handle:(id)a4 executionContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  FBProcess *v13;
  FBProcess *v14;
  uint64_t v15;
  NSString *identityDescription;
  uint64_t v17;
  FBProcessExecutionContext *executionContext;
  uint64_t v19;
  FBProcessWatchdogProviding *watchdogProvider;
  uint64_t v21;
  NSString *bundleIdentifier;
  NSMutableSet *v23;
  NSMutableSet *observerLock_observers;
  NSMutableArray *v25;
  NSMutableArray *lock_bootstrapBlocks;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSString *v45;
  FBProcessState *v46;
  FBProcessState *lock_state;
  id *v48;
  FBWorkspace *workspace;
  FBProcessExecutionContext *v50;
  FBProcessExecutionContext *v51;
  void *v53;
  objc_super v54;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be initialized with an identity : identity=%@ handle=%@"), 0, v10);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _initWithIdentity:handle:executionContext:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BB49CLL);
  }
  v12 = v11;
  if ((v10 == 0) != (v11 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must have either a handle or a context, but not both: %@ // %@"), v10, v11);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _initWithIdentity:handle:executionContext:].cold.2();
    goto LABEL_20;
  }
  v54.receiver = self;
  v54.super_class = (Class)FBProcess;
  v13 = -[FBProcess init](&v54, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_lock = 0;
    *(_QWORD *)&v13->_observerLock._os_unfair_lock_opaque = 0;
    v13->_pid = -1;
    v13->_versionedPID = -1;
    objc_storeStrong((id *)&v13->_identity, a3);
    objc_msgSend(v9, "description");
    v15 = objc_claimAutoreleasedReturnValue();
    identityDescription = v14->_identityDescription;
    v14->_identityDescription = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    executionContext = v14->_executionContext;
    v14->_executionContext = (FBProcessExecutionContext *)v17;

    -[FBProcessExecutionContext watchdogProvider](v14->_executionContext, "watchdogProvider");
    v19 = objc_claimAutoreleasedReturnValue();
    watchdogProvider = v14->_watchdogProvider;
    v14->_watchdogProvider = (FBProcessWatchdogProviding *)v19;

    objc_msgSend(v9, "embeddedApplicationIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v21;

    *(int64x2_t *)&v14->_lock_executableLivesOnSystemPartition = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observerLock_observers = v14->_observerLock_observers;
    v14->_observerLock_observers = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_bootstrapBlocks = v14->_lock_bootstrapBlocks;
    v14->_lock_bootstrapBlocks = v25;

    v27 = (void *)MEMORY[0x1A8590A90]();
    v28 = -[NSString rangeOfString:](v14->_identityDescription, "rangeOfString:", CFSTR("{"));
    v29 = -[NSString rangeOfString:options:](v14->_identityDescription, "rangeOfString:options:", CFSTR("}"), 4);
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = v29;
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v32 = v30;
        -[NSString substringToIndex:](v14->_identityDescription, "substringToIndex:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString substringFromIndex:](v14->_identityDescription, "substringFromIndex:", v31 + v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByAppendingString:", v34);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v14->_identityDescription;
        v14->_identityDescription = (NSString *)v35;

      }
    }
    v37 = -[NSString rangeOfString:](v14->_identityDescription, "rangeOfString:", CFSTR("("));
    v38 = -[NSString rangeOfString:options:](v14->_identityDescription, "rangeOfString:options:", CFSTR(")"), 4);
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = v38;
      if (v38 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v41 = v39;
        -[NSString substringToIndex:](v14->_identityDescription, "substringToIndex:", v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString substringFromIndex:](v14->_identityDescription, "substringFromIndex:", v40 + v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringByAppendingString:", v43);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v14->_identityDescription;
        v14->_identityDescription = (NSString *)v44;

      }
    }
    objc_autoreleasePoolPop(v27);
    if (v10)
      -[FBProcess _configureIntrinsicsFromHandle:](v14, "_configureIntrinsicsFromHandle:", v10);
    v46 = -[FBProcessState initWithPid:]([FBProcessState alloc], "initWithPid:", v14->_pid);
    lock_state = v14->_lock_state;
    v14->_lock_state = v46;

    -[FBProcess _finishInit](v14, "_finishInit");
    v48 = -[FBWorkspace initWithParentProcess:]((id *)[FBWorkspace alloc], v14);
    workspace = v14->_workspace;
    v14->_workspace = (FBWorkspace *)v48;

    if (!v14->_executionContext)
    {
      v50 = -[FBProcessExecutionContext initWithIdentity:]([FBProcessExecutionContext alloc], "initWithIdentity:", v9);
      v51 = v14->_executionContext;
      v14->_executionContext = v50;

    }
  }

  return v14;
}

- (BOOL)isExtensionProcess
{
  return 0;
}

- (void)_noteAssertionStateDidChange
{
  id v3;

  -[FBProcess delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteProcessAssertionStateDidChange:", self);

}

- (FBProcessDelegate)delegate
{
  id WeakRetained;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_recursive_lock_unlock();
  return (FBProcessDelegate *)WeakRetained;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBProcess descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBProcess descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_lock_exitContext, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_latestViolatedProvision, 0);
  objc_storeStrong((id *)&self->_sceneCreateWatchdogPolicy, 0);
  objc_storeStrong((id *)&self->_lock_watchdog, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);
  objc_storeStrong((id *)&self->_lock_exitTimer, 0);
  objc_storeStrong((id *)&self->_lock_terminateRequestCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lock_terminationWatchdogContext, 0);
  objc_storeStrong((id *)&self->_lock_terminationRequest, 0);
  objc_storeStrong((id *)&self->_lock_watchdogCPUStatistics, 0);
  objc_storeStrong((id *)&self->_lock_rbsState, 0);
  objc_storeStrong((id *)&self->_lock_state, 0);
  objc_storeStrong((id *)&self->_lock_applicationInfo, 0);
  objc_storeStrong((id *)&self->_lock_bootstrapBlocks, 0);
  objc_storeStrong((id *)&self->_lock_launchCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lock_gracefulExitAssertion, 0);
  objc_storeStrong((id *)&self->_observerLock_observers, 0);
  objc_storeStrong((id *)&self->_bootstrapError, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_handleDescription, 0);
  objc_storeStrong((id *)&self->_identityDescription, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_rbsHandle, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

uint64_t __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  os_unfair_recursive_lock_lock_with_options();
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[200])
    objc_msgSend(v2, "_updateStateWithBlock:", &__block_literal_global_134);
  os_unfair_recursive_lock_unlock();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __25__FBProcess_calloutQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceClass:", 33);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = BSDispatchQueueCreate();
  v2 = (void *)calloutQueue_queue;
  calloutQueue_queue = v1;

}

+ (id)rbInteractionWorkloop
{
  if (rbInteractionWorkloop_onceToken != -1)
    dispatch_once(&rbInteractionWorkloop_onceToken, &__block_literal_global_2);
  return (id)rbInteractionWorkloop_queue;
}

void __34__FBProcess_rbInteractionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.frontboard.process.rb-interaction");
  v1 = (void *)rbInteractionWorkloop_queue;
  rbInteractionWorkloop_queue = (uint64_t)inactive;

  dispatch_set_qos_class_floor((dispatch_object_t)rbInteractionWorkloop_queue, QOS_CLASS_USER_INITIATED, 0);
  dispatch_activate((dispatch_object_t)rbInteractionWorkloop_queue);
}

+ (id)createCurrentProcess
{
  uint64_t v2;
  void *v3;
  FBApplicationProcess *v4;
  void *v5;
  id v6;
  id result;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = [FBApplicationProcess alloc];
    objc_msgSend(v3, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FBProcess _initWithIdentity:handle:executionContext:](v4, "_initWithIdentity:handle:executionContext:", v5, v3, 0);

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to communicate with RunningBoard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBProcess createCurrentProcess].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBProcess)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBProcess *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBProcess *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[FBProcess init] is not supported"));
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
    v16 = CFSTR("FBProcess.m");
    v17 = 1024;
    v18 = 186;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBProcess *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)name
{
  return (NSString *)-[BSProcessHandle name](self->_handle, "name");
}

- (FBProcessExitContext)exitContext
{
  FBProcessExitContext *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lock_exitContext;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observerLock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)-[NSMutableSet copy](self->_observerLock_observers, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "observer");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = v11 == (_QWORD)v4;
          else
            v13 = 1;
          if (v13)
          {
            -[NSMutableSet removeObject:](self->_observerLock_observers, "removeObject:", v10);
            objc_msgSend(v10, "invalidate");
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_observerLock);
  }

}

- (id)valueForEntitlement:(id)a3
{
  return (id)-[BSAuditToken valueForEntitlement:](self->_auditToken, "valueForEntitlement:", a3);
}

- (void)setWatchdogProvider:(id)a3
{
  FBProcessWatchdogProviding *v4;
  FBProcessWatchdogProviding *watchdogProvider;

  v4 = (FBProcessWatchdogProviding *)a3;
  os_unfair_lock_lock(&self->_watchdogProviderLock);
  watchdogProvider = self->_watchdogProvider;
  self->_watchdogProvider = v4;

  os_unfair_lock_unlock(&self->_watchdogProviderLock);
}

- (void)invalidate
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

- (int64_t)taskState
{
  int64_t v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = -[FBProcessState taskState](self->_lock_state, "taskState");
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)visibility
{
  int64_t v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = -[FBProcessState visibility](self->_lock_state, "visibility");
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (unsigned)assertionState
{
  return -[FBWorkspace assertionState]((os_unfair_lock_s *)self->_workspace);
}

- (BOOL)isPlatformBinary
{
  void *v3;
  void *v4;
  RBSProcessHandle *rbsHandle;
  char IsYes;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_platformBinary == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[FBProcess applicationInfo](self, "applicationInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || objc_msgSend(v3, "type") == 2)
    {
      rbsHandle = self->_rbsHandle;
      if (rbsHandle)
        -[RBSProcessHandle auditToken](rbsHandle, "auditToken");
      BSAuditTokenRepresentsPlatformBinary();
    }
    self->_lock_platformBinary = BSSettingFlagForBool();

  }
  IsYes = BSSettingFlagIsYes();
  os_unfair_recursive_lock_unlock();
  return IsYes;
}

void __41__FBProcess__executeBlockAfterBootstrap___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__FBProcess__executeBlockAfterBootstrap___block_invoke_2;
  v4[3] = &unk_1E4A13090;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_executeBlockAsCurrentProcess:", v4);

}

void __41__FBProcess__executeBlockAfterBootstrap___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 40))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "exitContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v1 + 16))(v1, v2, v3);

  }
}

- (void)_notePendingExitForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BSAbsoluteMachTimer *v13;
  BSAbsoluteMachTimer *lock_exitTimer;
  BSAbsoluteMachTimer *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _BYTE *v22;
  _QWORD block[5];
  _BYTE buf[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_pendingExit)
  {
    FBLogProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1A359A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Now flagged as pending exit for reason: %{public}@", buf, 0x16u);

    }
    self->_lock_pendingExit = 1;
    +[FBProcess calloutQueue](FBProcess, "calloutQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FBProcess__notePendingExitForReason___block_invoke;
    block[3] = &unk_1E4A12348;
    block[4] = self;
    dispatch_async(v7, block);

    if (self->_rbsHandle)
    {
      if (-[FBProcess isApplicationProcess](self, "isApplicationProcess"))
      {
        objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fb_canTaskSuspend");

        if ((v10 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBProcess logProem](self);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v25 = 0;
          v13 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22F50]), "initWithIdentifier:", v12);
          lock_exitTimer = self->_lock_exitTimer;
          self->_lock_exitTimer = v13;

          v15 = self->_lock_exitTimer;
          +[FBProcess rbInteractionWorkloop](FBProcess, "rbInteractionWorkloop");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v8;
          v19[1] = 3221225472;
          v19[2] = __39__FBProcess__notePendingExitForReason___block_invoke_2;
          v19[3] = &unk_1E4A13100;
          v19[4] = self;
          v17 = v11;
          v20 = v17;
          v22 = buf;
          v18 = v12;
          v21 = v18;
          -[BSAbsoluteMachTimer scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:](v15, "scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v16, v19, 0.5, 1.0, 0.1);

          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
  os_unfair_recursive_lock_unlock();

}

void __39__FBProcess__notePendingExitForReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "processWillExit:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __39__FBProcess__notePendingExitForReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  FBProcessExitContext *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 296))
  {
    objc_msgSend(*(id *)(v4 + 40), "lastExitContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v14 = (void *)v23;
      v15 = -[FBProcessExitContext initWithUnderlyingContext:]([FBProcessExitContext alloc], "initWithUnderlyingContext:", v23);
      objc_msgSend(*(id *)(a1 + 32), "_processDidExitWithContext:", v15);
LABEL_13:

      goto LABEL_14;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(_QWORD *)(v7 + 24) + 1;
  *(_QWORD *)(v7 + 24) = v8;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v8, 1) >= 0x199999999999999AuLL)
    v9 = OS_LOG_TYPE_DEBUG;
  else
    v9 = OS_LOG_TYPE_ERROR;
  FBLogProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, v9))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v24 = 138543618;
    v25 = v11;
    v26 = 2048;
    v27 = -v6;
    _os_log_impl(&dword_1A359A000, v10, v9, "%{public}@: Still waiting on exit context after %.1f seconds", (uint8_t *)&v24, 0x16u);
  }

  if (v6 <= -300.0)
  {
    FBLogProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __39__FBProcess__notePendingExitForReason___block_invoke_2_cold_1(a1, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessTermination"), 2, &__block_literal_global_65);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FBProcessExitContext initWithTerminationError:]([FBProcessExitContext alloc], "initWithTerminationError:", v14);
    objc_msgSend(*(id *)(a1 + 32), "_processDidExitWithContext:", v15);
    v16 = objc_alloc(MEMORY[0x1E0D87E00]);
    objc_msgSend(v14, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithExplanation:", v18);

    objc_msgSend(v19, "setReportType:", 0);
    objc_msgSend(v19, "setExceptionDomain:", 10);
    objc_msgSend(v19, "setExceptionCode:", 4196196013);
    objc_msgSend(v19, "setMaximumTerminationResistance:", 40);
    v20 = objc_alloc(MEMORY[0x1E0D87E08]);
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatching:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithPredicate:context:", v21, v19);

    objc_msgSend(v22, "execute:", 0);
    goto LABEL_13;
  }
LABEL_14:

}

void __39__FBProcess__notePendingExitForReason___block_invoke_63(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFailureDescription:", CFSTR("Timed out waiting for process termination"));
  objc_msgSend(v2, "setFailureReason:", CFSTR("No exit notification received after 5 minutes"));
  objc_msgSend(v2, "setCodeDescription:", CFSTR("timed-out"));

}

uint64_t __30__FBProcess__bootstrapAndExec__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __30__FBProcess__bootstrapAndExec__block_invoke_94(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProcessDidLaunch:", *(_QWORD *)(a1 + 32));

  os_unfair_recursive_lock_lock_with_options();
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = 0;

  os_unfair_recursive_lock_unlock();
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__FBProcess__bootstrapAndExec__block_invoke_2_95;
  v8[3] = &unk_1E4A11FD0;
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v6, "_executeBlockAsCurrentProcess:", v8);

}

void __30__FBProcess__bootstrapAndExec__block_invoke_2_95(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "isApplicationProcess"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 322) = 1;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_observers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "applicationProcessWillLaunch:", *(_QWORD *)(a1 + 40));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)_processDidExitWithContext:(id)a3
{
  FBProcessExitContext *v4;
  NSObject *v5;
  FBProcessExitContext *v6;
  id v7;
  BSAbsoluteMachTimer *lock_exitTimer;
  RBSAssertion *lock_gracefulExitAssertion;
  NSObject *v10;
  void *v11;
  FBProcessExitContext *lock_exitContext;
  NSMutableArray *v13;
  NSMutableArray *lock_terminateRequestCompletionBlocks;
  NSObject *v15;
  NSMutableArray *v16;
  _QWORD block[5];
  FBProcessExitContext *v18;
  NSMutableArray *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  FBProcessExitContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (FBProcessExitContext *)a3;
  -[FBProcess _launchDidComplete:finalizeBlock:](self, "_launchDidComplete:finalizeBlock:", 0, 0);
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    -[FBProcess _notePendingExitForReason:](self, "_notePendingExitForReason:", CFSTR("process exited"));
    if (!v4
      && (!self->_bootstrapError
       || (v4 = -[FBProcessExitContext initWithLaunchError:]([FBProcessExitContext alloc], "initWithLaunchError:", self->_bootstrapError)) == 0))
    {
      FBLogProcess();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FBProcess _processDidExitWithContext:].cold.1();

      v6 = [FBProcessExitContext alloc];
      v7 = objc_alloc_init(MEMORY[0x1E0D87D50]);
      v4 = -[FBProcessExitContext initWithUnderlyingContext:](v6, "initWithUnderlyingContext:", v7);

    }
    -[FBProcessExitContext setTerminationRequest:](v4, "setTerminationRequest:", self->_lock_terminationRequest);
    -[FBProcessExitContext setWatchdogContext:](v4, "setWatchdogContext:", self->_lock_terminationWatchdogContext);
    -[FBProcessExitContext setTerminationReason:](v4, "setTerminationReason:", self->_terminationReason);
    -[FBProcessExitContext setStateBeforeExiting:](v4, "setStateBeforeExiting:", self->_lock_state);
    objc_storeStrong((id *)&self->_lock_exitContext, v4);
    -[FBSProcessWatchdog invalidate](self->_lock_watchdog, "invalidate");
    -[BSAbsoluteMachTimer invalidate](self->_lock_exitTimer, "invalidate");
    lock_exitTimer = self->_lock_exitTimer;
    self->_lock_exitTimer = 0;

    -[RBSAssertion invalidate](self->_lock_gracefulExitAssertion, "invalidate");
    lock_gracefulExitAssertion = self->_lock_gracefulExitAssertion;
    self->_lock_gracefulExitAssertion = 0;

    FBLogProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      lock_exitContext = self->_lock_exitContext;
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2114;
      v23 = lock_exitContext;
      _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Process exited: %{public}@.", buf, 0x16u);

    }
    -[FBProcess _updateStateWithBlock:](self, "_updateStateWithBlock:", &__block_literal_global_122);
    self->_lock_didExit = 1;
    v13 = self->_lock_terminateRequestCompletionBlocks;
    lock_terminateRequestCompletionBlocks = self->_lock_terminateRequestCompletionBlocks;
    self->_lock_terminateRequestCompletionBlocks = 0;

    +[FBProcess calloutQueue](FBProcess, "calloutQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__FBProcess__processDidExitWithContext___block_invoke_2;
    block[3] = &unk_1E4A120D0;
    block[4] = self;
    v4 = v4;
    v18 = v4;
    v19 = v13;
    v16 = v13;
    dispatch_async(v15, block);

    os_unfair_recursive_lock_unlock();
  }

}

void __40__FBProcess__processDidExitWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTaskState:", 1);
  objc_msgSend(v2, "setVisibility:", 0);

}

void __40__FBProcess__processDidExitWithContext___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProcessDidExit:", a1[4]);

  os_unfair_recursive_lock_lock_with_options();
  v3 = *((id *)a1[4] + 21);
  v4 = a1[4];
  v5 = (void *)v4[21];
  v4[21] = 0;

  os_unfair_recursive_lock_unlock();
  *((_BYTE *)a1[4] + 321) = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__FBProcess__processDidExitWithContext___block_invoke_3;
  v11[3] = &unk_1E4A12068;
  v12 = v3;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[4];
  v13 = v7;
  v14 = v8;
  v15 = a1[6];
  v10 = v3;
  objc_msgSend(v6, "_executeBlockAsCurrentProcess:", v11);
  v9 = FBAnalyticsLogHangTracerEvent(a1[4], 3);

}

void __40__FBProcess__processDidExitWithContext___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[5], "createError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v3 = a1[4];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v5);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1[6], "_observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12++), "processDidExit:", a1[6]);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = a1[7];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v15);
  }

}

- (void)_rebuildState
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_rbsState)
    -[FBProcess _rebuildState:](self, "_rebuildState:");
  os_unfair_recursive_lock_unlock();
}

uint64_t __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisibility:", 0);
}

uint64_t __47__FBProcess__newWatchdogForContext_completion___block_invoke_136(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_shouldWatchdogWithDeclineReason:(id *)a3
{
  int pid;
  BOOL result;
  __CFString *v7;
  int AppBooleanValue;
  void *v9;
  int v10;

  pid = self->_pid;
  if (pid == getpid())
  {
    result = 0;
    v7 = CFSTR("current process can't be watchdogged");
LABEL_11:
    *a3 = v7;
    return result;
  }
  if (-[FBProcess isBeingDebugged](self, "isBeingDebugged"))
  {
    result = 0;
    v7 = CFSTR("process is being debugged");
    goto LABEL_11;
  }
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("BKNoWatchdogs"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
  if (-[FBProcessExecutionContext checkForLeaks](self->_executionContext, "checkForLeaks") || AppBooleanValue)
  {
    result = 0;
    v7 = CFSTR("override default is set");
    goto LABEL_11;
  }
  os_unfair_recursive_lock_lock_with_options();
  -[RBSProcessState tags](self->_lock_rbsState, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("FBDisableWatchdog"));

  os_unfair_recursive_lock_unlock();
  if (v10)
    *a3 = CFSTR("watchdog is disabled via RB assertion");
  return v10 ^ 1;
}

- (int64_t)_watchdogReportType
{
  if (_watchdogReportType_onceToken != -1)
    dispatch_once(&_watchdogReportType_onceToken, &__block_literal_global_150);
  if (_watchdogReportType___StackshotOverride)
    return 2;
  if (-[FBProcess isPlatformBinary](self, "isPlatformBinary"))
    return 2;
  return 1;
}

uint64_t __32__FBProcess__watchdogReportType__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("BKStackshotAppTimeout"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
  _watchdogReportType___StackshotOverride = (_DWORD)result != 0;
  return result;
}

- (void)_terminateWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableArray *lock_terminateRequestCompletionBlocks;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  FBSProcessTerminationRequest *lock_terminationRequest;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("request != ((void *)0)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _terminateWithRequest:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35DB850);
  }
  v8 = v7;
  os_unfair_recursive_lock_lock_with_options();
  FBLogProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[FBProcess logProem](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v10;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1A359A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Received termination request: %{public}@", buf, 0x16u);

  }
  if (self->_lock_launchFinalized && !self->_lock_launchSuccess || self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
    FBLogProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring termination request because the process either failed to launch or already exited.", buf, 0xCu);

    }
    +[FBProcess calloutQueue](FBProcess, "calloutQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__FBProcess__terminateWithRequest_completion___block_invoke;
    block[3] = &unk_1E4A12168;
    v27 = v8;
    dispatch_async(v13, block);

  }
  else
  {
    if (!self->_rbsHandle)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot terminate a process before it has attempted bootstrapping"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBProcess _terminateWithRequest:completion:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35DB8A8);
    }
    if (v8)
    {
      lock_terminateRequestCompletionBlocks = self->_lock_terminateRequestCompletionBlocks;
      if (lock_terminateRequestCompletionBlocks)
      {
        v16 = (void *)objc_msgSend(v8, "copy");
        v17 = (NSMutableArray *)MEMORY[0x1A8590C4C]();
        -[NSMutableArray addObject:](lock_terminateRequestCompletionBlocks, "addObject:", v17);
      }
      else
      {
        v18 = (void *)MEMORY[0x1E0C99DE8];
        v16 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v18, "arrayWithObject:", v16);
        v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v17 = self->_lock_terminateRequestCompletionBlocks;
        self->_lock_terminateRequestCompletionBlocks = v19;
      }

    }
    v20 = objc_msgSend(v6, "exceptionCode");
    lock_terminationRequest = self->_lock_terminationRequest;
    if (!lock_terminationRequest
      || v20 == 2343432205
      && -[FBSProcessTerminationRequest exceptionCode](lock_terminationRequest, "exceptionCode") != 2343432205)
    {
      v14 = (void *)objc_msgSend(v6, "copy");

      objc_storeStrong((id *)&self->_lock_terminationRequest, v14);
      if (v20 != 2343432205 && (objc_msgSend(v14, "options") & 1) != 0)
      {
        if (-[FBProcessState taskState](self->_lock_state, "taskState") == 2)
        {
          -[FBProcess _lock_consumeLock_performGracefulKill](self, "_lock_consumeLock_performGracefulKill");
          goto LABEL_11;
        }
        objc_msgSend(v14, "setOptions:", objc_msgSend(v14, "options") & 0xFFFFFFFFFFFFFFFELL);
        objc_msgSend(v14, "setReportType:", 0);
      }
      -[FBProcess _lock_consumeLock_executeTerminationRequest](self, "_lock_consumeLock_executeTerminationRequest");
      goto LABEL_11;
    }
    os_unfair_recursive_lock_unlock();
    FBLogProcess();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      _os_log_impl(&dword_1A359A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Already terminating; ignoring additional termination request.",
        buf,
        0xCu);

    }
  }
  v14 = v6;
LABEL_11:

}

uint64_t __46__FBProcess__terminateWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  int pid;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  pid = self->_pid;
  if (pid == getpid())
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    FBSApplicationTerminationReasonDescription();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("The current requested its own termination (for reason \"%@\" with description \"%@\")"), v23, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _killForReason:andReport:withDescription:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35DBB3CLL);
  }
  if (!v10)
  {
    FBSApplicationTerminationReasonDescription();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  FBLogProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[FBProcess logProem](self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v14;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ requested termination (\"%{public}@\")", buf, 0x20u);

  }
  -[FBProcess _notePendingExitForReason:](self, "_notePendingExitForReason:", CFSTR("explicit kill request from client"));
  v17 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("fbReason != FBProcessKillReasonUnknown"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcess _killForReason:andReport:withDescription:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35DBBA0);
  }
  v18 = qword_1A36199A8[v17];
  v19 = qword_1A36199F0[v17];
  if (!self->_terminationReason)
    self->_terminationReason = a3;
  if (v7)
    v20 = v18;
  else
    v20 = 0;
  objc_msgSend(MEMORY[0x1E0D23198], "requestForProcess:withLabel:", self, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setReportType:", v20);
  objc_msgSend(v21, "setExceptionCode:", v19);
  objc_msgSend(v21, "setExplanation:", v10);
  objc_msgSend(v21, "setOptions:", FBSApplicationTerminationReasonIsGraceful());
  -[FBProcess _terminateWithRequest:completion:](self, "_terminateWithRequest:completion:", v21, v11);

}

- (void)_lock_consumeLock_executeTerminationRequest
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

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  FBProcessExitContext *v9;
  FBProcessExitContext *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v1 = a1 + 32;
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatching:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v2, *(_QWORD *)(v1 + 8));
  v16 = 0;
  v4 = objc_msgSend(v3, "execute:", &v16);
  v5 = v16;
  if ((v4 & 1) == 0)
  {
    FBLogProcess();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_cold_1((_QWORD **)v1, v5, v6);

    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_204;
    v14 = &unk_1E4A12D88;
    v15 = v5;
    objc_msgSend(v7, "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessTermination"), 1, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [FBProcessExitContext alloc];
    v10 = -[FBProcessExitContext initWithTerminationError:](v9, "initWithTerminationError:", v8, v11, v12, v13, v14);
    objc_msgSend(*(id *)v1, "_processDidExitWithContext:", v10);

  }
}

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_204(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Termination request failed"));
  objc_msgSend(v3, "setFailureReason:", CFSTR("RunningBoard returned an error"));
  objc_msgSend(v3, "setCodeDescription:", CFSTR("request-failed"));
  objc_msgSend(v3, "setUnderlyingError:", *(_QWORD *)(a1 + 32));

}

- (void)_lock_consumeLock_performGracefulKill
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_15(&dword_1A359A000, a4, a3, "%{public}@ Failed to acquire graceful termination assertion: %{public}@", (uint8_t *)a3);

}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "invalidate");
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[FBProcess logProem](WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ Failed to terminate gracefully after %.1fs"), v7, *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    FBLogProcess();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0D23198], "requestForProcess:withLabel:", v5, CFSTR("graceful termination failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setReportType:", objc_msgSend(v5, "_watchdogReportType"));
    objc_msgSend(v10, "setExceptionCode:", 2343432205);
    objc_msgSend(v10, "setExplanation:", v8);
    os_unfair_recursive_lock_lock_with_options();
    v11 = v5[27];
    v5[27] = v10;
    v12 = v10;

    objc_storeStrong(v5 + 28, *(id *)(a1 + 32));
    objc_storeStrong(v5 + 26, *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0D23190], "provisionWithResourceType:timeInterval:", 1, *(double *)(a1 + 56));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v5[35];
    v5[35] = (id)v13;

    v15 = v5[19];
    if (v15 == v3)
    {
      v5[19] = 0;

    }
    objc_msgSend(v5, "_lock_consumeLock_executeTerminationRequest");

  }
}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_225(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    if ((id)WeakRetained[19] == v4)
    {
      WeakRetained[19] = 0;

    }
    os_unfair_recursive_lock_unlock();
  }

}

- (BSMachPortTaskNameRight)taskNameRight
{
  return 0;
}

- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4
{
  id v6;
  FBProcessWatchdogEventContext *v7;
  FBProcessWatchdogEventContext *lock_terminationWatchdogContext;
  FBProcessCPUStatistics *v9;
  FBProcessCPUStatistics *lock_watchdogCPUStatistics;
  id v11;

  v11 = a4;
  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_terminationWatchdogContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "eventContext");
      v7 = (FBProcessWatchdogEventContext *)objc_claimAutoreleasedReturnValue();
      lock_terminationWatchdogContext = self->_lock_terminationWatchdogContext;
      self->_lock_terminationWatchdogContext = v7;

      objc_msgSend(v11, "cpuStatistics");
      v9 = (FBProcessCPUStatistics *)objc_claimAutoreleasedReturnValue();
      lock_watchdogCPUStatistics = self->_lock_watchdogCPUStatistics;
      self->_lock_watchdogCPUStatistics = v9;

    }
  }
  os_unfair_recursive_lock_unlock();
  -[FBProcess _terminateWithRequest:completion:](self, "_terminateWithRequest:completion:", v6, 0);

  objc_msgSend(v11, "invalidate");
}

- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v7 = a3;
  v8 = a5;
  -[FBProcess _watchdogProvider](self, "_watchdogProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v9, "watchdogTerminationRequestForProcess:error:", self, v8),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D23198], "requestForProcess:withLabel:", self, CFSTR("watchdog provision violated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setReportType:", -[FBProcess _watchdogReportType](self, "_watchdogReportType"));
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedFailureReason");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ watchdog transgression: %@"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ watchdog transgression: %@"), v12, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "explanation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@; %@"), v15, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v15;
  }
  v19 = v18;
  objc_msgSend(v10, "setExplanation:", v18);
  objc_msgSend(v10, "setExceptionCode:", 2343432205);

  return v10;
}

- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  BSAbsoluteMachTimer *lock_exitTimer;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[FBProcess _shouldWatchdogWithDeclineReason:](self, "_shouldWatchdogWithDeclineReason:", a4);
  if (!v7)
  {
    FBLogProcess();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *a4;
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring %{public}@ for reason: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    os_unfair_recursive_lock_lock_with_options();
    -[BSAbsoluteMachTimer invalidate](self->_lock_exitTimer, "invalidate");
    lock_exitTimer = self->_lock_exitTimer;
    self->_lock_exitTimer = 0;

    os_unfair_recursive_lock_unlock();
  }

  return v7;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  int v5;
  int pid;
  char v8;
  RBSProcessIdentity *identity;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "pid");
  pid = self->_pid;
  if (pid <= 0 && v5 < 1)
  {
    identity = self->_identity;
    objc_msgSend(v4, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v10);

  }
  else
  {
    v8 = pid == v5;
  }

  return v8;
}

- (id)processPredicate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_pid < 1)
  {
    v4 = 0;
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0D87DA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "predicateMatchingIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

+ (void)createCurrentProcess
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

+ (void)createProcessWithHandle:.cold.1()
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

+ (void)createProcessWithExecutionContext:.cold.1()
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

- (void)_initWithIdentity:handle:executionContext:.cold.1()
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

- (void)_initWithIdentity:handle:executionContext:.cold.2()
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

- (void)bootstrapWithDelegate:.cold.1()
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

void __39__FBProcess__notePendingExitForReason___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, a3, "No exit notification received for %{public}@ after 5 minutes", (uint8_t *)&v4);
  OUTLINED_FUNCTION_12();
}

- (void)_configureIntrinsicsFromHandle:.cold.1()
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

- (void)_configureIntrinsicsFromHandle:.cold.2()
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

- (void)_configureIntrinsicsFromHandle:.cold.3()
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

- (void)_configureIntrinsicsFromHandle:.cold.4()
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

- (void)_configureIntrinsicsFromHandle:.cold.5()
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

- (void)_configureIntrinsicsFromHandle:.cold.6()
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

- (void)_noteStateDidUpdate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, v4, "invalid task state received from runningboard for %{public}@", v5);

}

- (void)_processDidExitWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, v0, v1, "No exit context obtained for %{public}@", v2);
  OUTLINED_FUNCTION_12();
}

- (void)_rebuildState:.cold.1()
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

- (void)_terminateWithRequest:completion:.cold.1()
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

- (void)_terminateWithRequest:completion:.cold.2()
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

- (void)_killForReason:andReport:withDescription:completion:.cold.1()
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

- (void)_killForReason:andReport:withDescription:completion:.cold.2()
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

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_cold_1(_QWORD **a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](*a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_15(&dword_1A359A000, a3, v7, "%{public}@ Termination failed with error: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_8_2();
}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, v0, v1, "%{public}@!", v2);
  OUTLINED_FUNCTION_12();
}

@end
