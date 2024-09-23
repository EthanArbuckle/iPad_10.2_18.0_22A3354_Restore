@implementation CPLEngineSyncManager

- (void)dispatchSyncBlock:(id)a3
{
  OS_dispatch_queue *lock;
  id v4;
  dispatch_block_t v5;
  id v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD block[4];
  id v10;

  lock = self->_lock;
  v4 = a3;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForSyncSessions](CPLEngineSyncManager, "qualityOfServiceForSyncSessions"), 0, v4);

  v6 = v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v10 = v6;
  v7 = lock;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

- (void)dispatchForcedTaskBlock:(id)a3
{
  OS_dispatch_queue *lock;
  id v4;
  dispatch_block_t v5;
  id v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD block[4];
  id v10;

  lock = self->_lock;
  v4 = a3;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForForcedTasks](CPLEngineSyncManager, "qualityOfServiceForForcedTasks"), 0, v4);

  v6 = v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v10 = v6;
  v7 = lock;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

- (void)_dispatchAfter:(double)a3 block:(id)a4
{
  int64_t v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  v5 = 1000000000 * (uint64_t)a3;
  block = a4;
  v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)self->_lock, block);

}

- (CPLEngineSyncManager)initWithEngineLibrary:(id)a3
{
  id v5;
  CPLEngineSyncManager *v6;
  CPLEngineSyncManager *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *lock;
  uint64_t v11;
  NSMutableArray *lastErrors;
  void *v13;
  uint64_t v14;
  CPLPlatformObject *platformObject;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLEngineSyncManager;
  v6 = -[CPLEngineSyncManager init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForSyncSessions](CPLEngineSyncManager, "qualityOfServiceForSyncSessions"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cpl.syncmanager", v8);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_queue *)v9;

    v7->_shouldRestartSessionFromState = 14;
    v7->_shouldTryToMingleImmediately = 1;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
    lastErrors = v7->_lastErrors;
    v7->_lastErrors = (NSMutableArray *)v11;

    *(_QWORD *)&v7->_transportUserIdentifierLock._os_unfair_lock_opaque = 0;
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "newPlatformImplementationForObject:", v7);
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v14;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          v19 = v18;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, v21, 277, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
  }

  return v7;
}

- (void)_recordForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *forcedSyncHistory;
  _CPLForcedSyncHistory *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  if (!self->_forcedSyncHistory)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    forcedSyncHistory = self->_forcedSyncHistory;
    self->_forcedSyncHistory = v9;

  }
  v11 = -[_CPLForcedSyncHistory initWithForcedSyncTask:discarded:error:]([_CPLForcedSyncHistory alloc], "initWithForcedSyncTask:discarded:error:", v12, v6, v8);
  -[NSMutableArray addObject:](self->_forcedSyncHistory, "addObject:", v11);
  if ((unint64_t)-[NSMutableArray count](self->_forcedSyncHistory, "count") >= 4)
    -[NSMutableArray removeObjectsInRange:](self->_forcedSyncHistory, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_forcedSyncHistory, "count") - 3);

}

- (void)setErrorForSyncSessionUnlocked:(id)a3
{
  NSError *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSError **p_lastError;
  NSError *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _CPLEngineSyncLastError *v18;
  const char *v19;
  _CPLEngineSyncLastError *v20;
  SEL v21;
  int v22;
  void *v23;
  __int16 v24;
  NSError *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (-[NSError isCPLOperationCancelledError](v4, "isCPLOperationCancelledError"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLastSyncErrorOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v6;
        v7 = "Sync session in %@ got cancelled";
LABEL_9:
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v22, 0xCu);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (-[NSError isCPLErrorWithCode:](v4, "isCPLErrorWithCode:", 10000))
  {
    if (!_CPLSilentLogging)
    {
      __CPLLastSyncErrorOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v6;
        v7 = "Sync session in %@ is requesting a retry";
        goto LABEL_9;
      }
LABEL_10:

    }
LABEL_11:
    p_lastError = &self->_lastError;
    goto LABEL_12;
  }
  if (!-[NSError isCPLOperationDeferredError](v4, "isCPLOperationDeferredError"))
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transport");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSError userInfo](v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!_CPLSilentLogging)
    {
      __CPLLastSyncErrorOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bestErrorForUnderlyingError:](v10, "bestErrorForUnderlyingError:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v15;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Sync session in %@ got error: %@, underlying error: %@", (uint8_t *)&v22, 0x20u);

      }
    }
    goto LABEL_21;
  }
  if (!_CPLSilentLogging)
  {
    __CPLLastSyncErrorOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
LABEL_22:

      goto LABEL_23;
    }
    -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v11;
    _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Sync session in %@ got deferred", (uint8_t *)&v22, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:
  p_lastError = &self->_lastError;
  if (v4 && !self->_lastError)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(_CPLEngineSyncLastError);
    v20 = v18;
    if (v18)
    {
      v18->_state = self->_state;
      objc_setProperty_nonatomic_copy(v18, v19, v17, 16);
      objc_setProperty_nonatomic_copy(v20, v21, v4, 24);
    }
    -[NSMutableArray addObject:](self->_lastErrors, "addObject:", v20);
    if ((unint64_t)-[NSMutableArray count](self->_lastErrors, "count") >= 6)
      -[NSMutableArray removeObjectAtIndex:](self->_lastErrors, "removeObjectAtIndex:", 0);

  }
LABEL_12:
  v9 = *p_lastError;
  *p_lastError = v4;

}

- (void)_resetErrorForSyncSession
{
  NSObject *v3;
  NSError *lastError;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLLastSyncErrorOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Resetting error for sync session", v5, 2u);
    }

  }
  lastError = self->_lastError;
  self->_lastError = 0;

}

- (void)_cancelAllTasksLocked
{
  -[CPLEngineSyncManager _cancelAllTasksLockedDeferringPushTaskCancellationIfCurrentlyUploadingForeground:](self, "_cancelAllTasksLockedDeferringPushTaskCancellationIfCurrentlyUploadingForeground:", 0);
}

- (void)_cancelAllTasksLockedDeferringPushTaskCancellationIfCurrentlyUploadingForeground:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineSyncManager _descriptionForLaunchedTasks](self, "_descriptionForLaunchedTasks");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling all current sync manager tasks: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[CPLEngineSyncManager _cancelAllTasksForSetup](self, "_cancelAllTasksForSetup");
  -[CPLSyncStep cancelAllTasks:](self->_currentStep, "cancelAllTasks:", v3);
}

- (void)_moveAllTasksToBackgroundLocked
{
  -[CPLSyncStep moveTasksToBackground](self->_currentStep, "moveTasksToBackground");
}

- (id)_descriptionForCurrentState
{
  return (id)objc_msgSend((id)objc_opt_class(), "descriptionForState:", self->_state);
}

- (id)_shortDescriptionForCurrentState
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", self->_state);
}

- (id)_descriptionForLaunchedTasks
{
  unint64_t state;
  BOOL v3;
  __CFString *v4;

  state = self->_state;
  if (state)
    v3 = state == 14;
  else
    v3 = 1;
  if (v3)
    goto LABEL_9;
  if (state == 1)
  {
    -[CPLEngineSyncManager _descriptionForSetupTasks](self, "_descriptionForSetupTasks");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    -[CPLSyncStep descriptionForTasks](self->_currentStep, "descriptionForTasks");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
LABEL_9:
      v4 = CFSTR("No current tasks");
  }
  return v4;
}

- (BOOL)_launchNecessaryTasksForCurrentStateLocked
{
  NSError *lastError;
  BOOL v4;
  NSObject *v5;
  void *v6;
  NSError *v7;
  CPLSyncStep *currentStep;
  id WeakRetained;
  void *v10;
  unint64_t state;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  NSError *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  lastError = self->_lastError;
  v4 = lastError == 0;
  if (lastError)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self->_lastError;
        v14 = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Stopping launch tasks (current state: %@) as we have an error to report: %@", (uint8_t *)&v14, 0x16u);

      }
LABEL_5:

      LOBYTE(currentStep) = v4;
      return (char)currentStep;
    }
    LOBYTE(currentStep) = 0;
  }
  else
  {
    -[CPLSyncSession noteSyncSessionMovedToState:](self->_session, "noteSyncSessionMovedToState:", self->_state);
    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(WeakRetained, "scheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "noteSyncSession:stateWillBeAttempted:", self->_session, self->_state);

    LOBYTE(currentStep) = 0;
    state = self->_state;
    if (state && state != 14)
    {
      if (state == 1)
      {
        LODWORD(currentStep) = -[CPLEngineSyncManager _launchSetupTask](self, "_launchSetupTask");
        if (!(_DWORD)currentStep)
          return (char)currentStep;
      }
      else
      {
        currentStep = self->_currentStep;
        if (!currentStep)
          return (char)currentStep;
        LODWORD(currentStep) = -[CPLSyncStep launchNecessaryTasks](currentStep, "launchNecessaryTasks");
        if (!(_DWORD)currentStep)
          return (char)currentStep;
      }
      if (_CPLSilentLogging)
        return (char)currentStep;
      __CPLSyncOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Launched some necessary tasks for %@", (uint8_t *)&v14, 0xCu);

      }
      goto LABEL_5;
    }
  }
  return (char)currentStep;
}

- (void)_notifyEndOfSyncSession
{
  NSObject *v3;
  NSError *lastError;
  NSError *v5;
  void *v6;
  void *v7;
  void *v8;
  CPLSyncSession *session;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  CPLSyncSession *v21;
  int v22;
  NSError *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastError = self->_lastError;
      v22 = 138412290;
      v23 = lastError;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Did finish sync session with error: %@", (uint8_t *)&v22, 0xCu);
    }

  }
  v5 = self->_lastError;
  -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  session = self->_session;
  if (v5)
  {
    objc_msgSend(v7, "noteSyncSession:failedDuringPhase:withError:", session, self->_state, self->_lastError);

    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      goto LABEL_11;
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncSessionDidFailWithError:", self->_lastError);
  }
  else
  {
    objc_msgSend(v7, "noteSyncSessionSucceeded:", session);

    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
      goto LABEL_11;
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncSessionDidSucceed");
  }

LABEL_11:
  -[CPLEngineSyncManager platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didFinishSyncSession");

  }
  -[CPLEngineSyncManager _setState:](self, "_setState:", 0);
  -[CPLEngineSyncManager _overrideBudgetsIfNeeded](self, "_overrideBudgetsIfNeeded");
  -[CPLEngineSyncManager platformObject](self, "platformObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didMoveToState:", 0);

  }
  v21 = self->_session;
  self->_session = 0;

  -[CPLEngineSyncManager _launchForceSyncTaskIfNecessary](self, "_launchForceSyncTaskIfNecessary");
  -[CPLEngineSyncManager _dispatchCancellerBlocksIfNecessary](self, "_dispatchCancellerBlocksIfNecessary");
}

- (void)_advanceToNextStateLocked
{
  -[CPLEngineSyncManager _advanceToNextStateLockedMinimalState:](self, "_advanceToNextStateLockedMinimalState:", 0);
}

- (void)_setState:(unint64_t)a3
{
  CPLSyncStep *currentStep;
  BOOL v7;
  BOOL v8;
  CPLSyncStep *v9;
  CPLSyncStep *v10;
  NSObject *v11;
  CPLSyncSession *session;
  void *v13;
  NSObject *v14;
  CPLSyncSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  CPLSyncSession *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  currentStep = self->_currentStep;
  if (currentStep && -[CPLSyncStep hasTasks](currentStep, "hasTasks"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        +[CPLEngineSyncManager descriptionForState:](CPLEngineSyncManager, "descriptionForState:", a3);
        v15 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        -[CPLSyncStep descriptionForTasks](self->_currentStep, "descriptionForTasks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Trying to move to %@ while still having running tasks for %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLEngineSyncManager descriptionForState:](CPLEngineSyncManager, "descriptionForState:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLSyncStep descriptionForTasks](self->_currentStep, "descriptionForTasks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 430, CFSTR("Trying to move to %@ while still having running tasks for %@"), v19, v20);

    abort();
  }
  if (self->_session)
  {
    v7 = self->_state == a3 || a3 == 0;
    v8 = v7 || a3 == 14;
    if (!v8 && !_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = session;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "%@ moved to %@", buf, 0x16u);

      }
    }
  }
  self->_state = a3;
  objc_msgSend((id)objc_opt_class(), "stepForState:syncManager:session:", self->_state, self, self->_session);
  v9 = (CPLSyncStep *)objc_claimAutoreleasedReturnValue();
  v10 = self->_currentStep;
  self->_currentStep = v9;

}

- (void)_advanceToNextStateLockedMinimalState:(unint64_t)a3
{
  NSObject *v5;
  CPLEngineForceSyncTask *pendingForceSyncTask;
  const char *v7;
  BOOL v8;
  CPLEngineForceSyncTask *currentForceSyncTask;
  unint64_t state;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  char v37;
  _BOOL4 v38;
  unint64_t v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  _QWORD *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  void (*v51)(uint64_t);
  void *v52;
  CPLEngineSyncManager *v53;
  _BYTE *v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (self->_pendingForceSyncTask)
  {
    if (_CPLSilentLogging)
    {
LABEL_16:
      state = self->_state;
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineSyncManager setErrorForSyncSessionUnlocked:](self, "setErrorForSyncSessionUnlocked:", v11);

      -[CPLEngineSyncManager _setState:](self, "_setState:", 14);
      -[CPLEngineSyncManager _launchNecessaryTasksForCurrentStateLocked](self, "_launchNecessaryTasksForCurrentStateLocked");
      goto LABEL_17;
    }
    __CPLForceSyncOSLogDomain_18271();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:

      goto LABEL_16;
    }
    pendingForceSyncTask = self->_pendingForceSyncTask;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = pendingForceSyncTask;
    v7 = "Stopping current sync session because of pending %@";
LABEL_14:
    _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    goto LABEL_15;
  }
  if (self->_disabledSchedulerForForceSyncTask || self->_closed)
  {
    if (self->_currentForceSyncTask)
      v8 = _CPLSilentLogging == 0;
    else
      v8 = 0;
    if (!v8)
      goto LABEL_16;
    __CPLForceSyncOSLogDomain_18271();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    currentForceSyncTask = self->_currentForceSyncTask;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = currentForceSyncTask;
    v7 = "Stopping current sync session because of %@";
    goto LABEL_14;
  }
  v25 = a3;
  if (-[CPLSyncSession shouldDefer](self->_session, "shouldDefer"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "Sync session has been deferred. Stopping now", buf, 2u);
      }

    }
    state = self->_state;
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineSyncManager setErrorForSyncSessionUnlocked:](self, "setErrorForSyncSessionUnlocked:", v27);

    -[CPLEngineSyncManager _setState:](self, "_setState:", 14);
    -[CPLEngineSyncManager _launchNecessaryTasksForCurrentStateLocked](self, "_launchNecessaryTasksForCurrentStateLocked");
    goto LABEL_17;
  }
  if (self->_state && !self->_setupIsDone)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEBUG, "Looking for next steps after %@ but setup must be done first", buf, 0xCu);

      }
    }
    -[CPLEngineSyncManager _setState:](self, "_setState:", 0);
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "didMoveToState:", self->_state);

    v25 = 0;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v32;
      _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_DEBUG, "Looking for next state after %@", buf, 0xCu);

    }
  }
  state = self->_state;
  if (v25 <= state)
    v33 = self->_state;
  else
    v33 = v25;
  -[CPLEngineSyncManager _setState:](self, "_setState:", v33);
  while (1)
  {
    v34 = self->_state;
    if (v34 > 0xD)
      goto LABEL_17;
    if (v34 >= 3)
    {
      -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "store");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isClientInSyncWithClientCache");

      if ((v37 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSyncOSLogDomain();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v43, OS_LOG_TYPE_DEBUG, "Client is not yet in sync with the client cache, we are not going any further", buf, 2u);
          }

        }
        goto LABEL_78;
      }
    }
    v38 = -[CPLEngineSyncManager hasBrokenScopes](self, "hasBrokenScopes");
    v39 = self->_state;
    if (v38)
      break;
    if (v39 >= 9)
    {
      -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scheduler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isMinglingEnabled");

      if (!v42)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSyncOSLogDomain();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v46, OS_LOG_TYPE_DEBUG, "Client still needs to push more records, we are not going any further", buf, 2u);
          }

        }
LABEL_78:
        -[CPLEngineSyncManager _setState:](self, "_setState:", 14);
        -[CPLEngineSyncManager _launchNecessaryTasksForCurrentStateLocked](self, "_launchNecessaryTasksForCurrentStateLocked");
        goto LABEL_17;
      }
      v39 = self->_state;
    }
LABEL_72:
    -[CPLEngineSyncManager _setState:](self, "_setState:", v39 + 1);
    if (-[CPLEngineSyncManager _launchNecessaryTasksForCurrentStateLocked](self, "_launchNecessaryTasksForCurrentStateLocked"))
    {
      goto LABEL_17;
    }
  }
  if (v39 < 7)
    goto LABEL_72;
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v44, OS_LOG_TYPE_ERROR, "Metadata sync is disabled until the library is cleaned-up", buf, 2u);
    }

  }
  -[CPLEngineSyncManager _setState:](self, "_setState:", 14);
  -[CPLEngineSyncManager _launchNecessaryTasksForCurrentStateLocked](self, "_launchNecessaryTasksForCurrentStateLocked");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__18178;
  v57 = __Block_byref_object_dispose__18179;
  v58 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v51 = __62__CPLEngineSyncManager__advanceToNextStateLockedMinimalState___block_invoke;
  v52 = &unk_1E60D64C8;
  v53 = self;
  v54 = buf;
  v45 = v50;
  os_unfair_lock_lock(&self->_brokenScopesLock);
  v51((uint64_t)v45);
  os_unfair_lock_unlock(&self->_brokenScopesLock);

  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "makeObjectsPerformSelector:", sel_showAlertToUser);
  _Block_object_dispose(buf, 8);

LABEL_17:
  if (state != self->_state)
  {
    -[CPLEngineSyncManager platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLEngineSyncManager _descriptionForLaunchedTasks](self, "_descriptionForLaunchedTasks");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Moving to state %@ with current tasks: %@", buf, 0x16u);

        }
      }
      -[CPLEngineSyncManager platformObject](self, "platformObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didMoveToState:", self->_state);

    }
  }
  -[CPLEngineSyncManager _overrideBudgetsIfNeeded](self, "_overrideBudgetsIfNeeded");
  v18 = self->_state;
  if (v18 == 14)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", state);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "No task to launch after %@", buf, 0xCu);

      }
    }
    if (self->_session)
      -[CPLEngineSyncManager _notifyEndOfSyncSession](self, "_notifyEndOfSyncSession");
    else
      -[CPLEngineSyncManager _setState:](self, "_setState:", 0);
  }
  else
  {
    if (!v18)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_ERROR, "State should not be quiet here", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v49, 518, CFSTR("State should not be quiet here"));

      abort();
    }
    if (!state && self->_shouldRestartSessionFromState == 14)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEBUG, "Starting sync session", buf, 2u);
        }

      }
      -[CPLEngineSyncManager platformObject](self, "platformObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        -[CPLEngineSyncManager platformObject](self, "platformObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "willStartSyncSession");

      }
    }
  }
}

- (void)_restartSyncSessionFromStateLocked:(unint64_t)a3 session:(id)a4 cancelIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  CPLSyncSession *v9;
  CPLSyncSession *v10;
  CPLSyncSession *session;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t state;
  NSObject *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = (CPLSyncSession *)a4;
  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "%@ called with no sync session to attach to", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 530, CFSTR("%@ called with no sync session to attach to"), v26);

    abort();
  }
  v10 = v9;
  session = v9;
  if (self->_session != v9)
  {
    -[CPLSyncSession sessionWillStart](v9, "sessionWillStart");
    session = self->_session;
  }
  self->_session = v10;

  if (a3 <= 1)
    v12 = 1;
  else
    v12 = a3;
  if (self->_shouldRestartSessionFromState < v12)
  {
    if (v5)
      -[CPLEngineSyncManager _cancelAllTasksLocked](self, "_cancelAllTasksLocked");
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineSyncManager _descriptionForLaunchedTasks](self, "_descriptionForLaunchedTasks");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Will try to restart a sync session from %@ (current state is %@ / current tasks are: %@)", buf, 0x20u);

    }
  }
  -[CPLEngineSyncManager _resetErrorForSyncSession](self, "_resetErrorForSyncSession");
  state = self->_state;
  if (state)
  {
    if (state == v12)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Finishing the current state, and starting over", buf, 2u);
        }
LABEL_29:

      }
    }
    else
    {
      if (state <= v12)
        return;
      if (v5)
      {
        -[CPLEngineSyncManager _cancelAllTasksLocked](self, "_cancelAllTasksLocked");
      }
      else if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[CPLEngineSyncManager _descriptionForLaunchedTasks](self, "_descriptionForLaunchedTasks");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v21;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Not cancelling current tasks: %@", buf, 0xCu);

        }
        goto LABEL_29;
      }
    }
    self->_shouldRestartSessionFromState = v12;
    return;
  }
  if (self->_setupIsDone)
    -[CPLEngineSyncManager _advanceToNextStateLockedMinimalState:](self, "_advanceToNextStateLockedMinimalState:", v12 - 1);
  else
    -[CPLEngineSyncManager _advanceToNextStateLocked](self, "_advanceToNextStateLocked");
  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  objc_msgSend(WeakRetained, "feedback");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendFeedbackToServerIfNecessary");

}

- (void)startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CPLEngineSyncManager_startSyncSession_withMinimalPhase_rewind___block_invoke;
  v10[3] = &unk_1E60D6E70;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v13 = a5;
  v9 = v8;
  -[CPLEngineSyncManager dispatchSyncBlock:](self, "dispatchSyncBlock:", v10);

}

- (void)_cancelCurrentSyncSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_shouldRestartSessionFromState = 14;
  if (self->_state <= 0xD)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLEngineSyncManager _descriptionForLaunchedTasks](self, "_descriptionForLaunchedTasks");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v4;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Cancelling %@ (%@)", (uint8_t *)&v8, 0x16u);

      }
    }
    -[CPLEngineSyncManager _cancelAllTasksLocked](self, "_cancelAllTasksLocked");
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performBarrier");

  }
}

- (void)cancelCurrentSyncSession
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CPLEngineSyncManager_cancelCurrentSyncSession__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_dispatchCancellerBlocksIfNecessary
{
  NSMutableArray *cancellerBlocks;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  cancellerBlocks = self->_cancellerBlocks;
  if (cancellerBlocks)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = cancellerBlocks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    v9 = self->_cancellerBlocks;
    self->_cancellerBlocks = 0;

  }
}

- (void)cancelAndBlockAllSyncSessionsWithReason:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *lock;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__CPLEngineSyncManager_cancelAndBlockAllSyncSessionsWithReason_block___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = lock;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)unblockSyncSessionWithReason:(id)a3
{
  id v5;
  OS_dispatch_queue *lock;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  lock = self->_lock;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CPLEngineSyncManager_unblockSyncSessionWithReason___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = lock;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)_setTransportUserIdentifier:(id)a3
{
  CPLEngineStoreUserIdentifier *v4;
  CPLEngineStoreUserIdentifier *transportUserIdentifier;

  v4 = (CPLEngineStoreUserIdentifier *)a3;
  os_unfair_lock_lock(&self->_transportUserIdentifierLock);
  transportUserIdentifier = self->_transportUserIdentifier;
  self->_transportUserIdentifier = v4;

  os_unfair_lock_unlock(&self->_transportUserIdentifierLock);
}

- (id)_transportUserIdentifier
{
  os_unfair_lock_s *p_transportUserIdentifierLock;
  CPLEngineStoreUserIdentifier *v4;

  p_transportUserIdentifierLock = &self->_transportUserIdentifierLock;
  os_unfair_lock_lock(&self->_transportUserIdentifierLock);
  v4 = self->_transportUserIdentifier;
  os_unfair_lock_unlock(p_transportUserIdentifierLock);
  return v4;
}

- (void)resetTransportUserIdentifier
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Resetting transport user identifier", buf, 2u);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke;
  v4[3] = &unk_1E60D65B8;
  v4[4] = self;
  -[CPLEngineSyncManager dispatchSyncBlock:](self, "dispatchSyncBlock:", v4);
}

- (void)discardTransportUserIdentifier
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CPLEngineSyncManager_discardTransportUserIdentifier__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)requestDisabledFeaturesUpdate
{
  uint64_t v2;
  OS_dispatch_queue *lock;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CPLEngineSyncManager_requestDisabledFeaturesUpdate__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = lock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)setSyncSessionShouldBeForeground:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke;
  v3[3] = &unk_1E60DC878;
  v4 = a3;
  v3[4] = self;
  -[CPLEngineSyncManager dispatchSyncBlock:](self, "dispatchSyncBlock:", v3);
}

- (void)_overrideBudgetsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_boostPriority && self->_state - 1 <= 6)
  {
    if (!self->_hasOverridenBudgets)
    {
      -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "systemMonitor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startOverridingSystemBudgets:reason:", 18487, 3);

      self->_hasOverridenBudgets = 1;
    }
  }
  else if (self->_hasOverridenBudgets)
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopOverridingSystemBudgets:reason:", 18487, 3);

    self->_hasOverridenBudgets = 0;
  }
}

- (void)setBoostPriority:(BOOL)a3
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD block[4];
  id v11;

  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CPLEngineSyncManager_setBoostPriority___block_invoke;
  v8[3] = &unk_1E60DC878;
  v8[4] = self;
  v9 = a3;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (BOOL)prepareAndLaunchSyncTaskUnlocked:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "Asked to launch a task without providing a task", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v24, 767, CFSTR("Asked to launch a task without providing a task"));

    abort();
  }
  -[CPLEngineSyncManager _transportUserIdentifier](self, "_transportUserIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v9 = objc_msgSend(v8, "isSynchronizationDisabledWithReasonError:", &v25);
    v10 = v25;

    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v10;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Synchronization is disabled (error: %@)", buf, 0xCu);
        }

      }
      -[CPLEngineSyncManager setErrorForSyncSessionUnlocked:](self, "setErrorForSyncSessionUnlocked:", v10);
    }
    else
    {
      if (self->_state < 3)
        goto LABEL_17;
      -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "diskPressureState");
      v15 = self->_state >= 9 ? v14 == 0 : v14 != 2;

      if (v15)
      {
LABEL_17:
        -[NSObject setTransportUserIdentifier:](v5, "setTransportUserIdentifier:", v6);
        -[NSObject setDelegate:](v5, "setDelegate:", self);
        if (!_CPLSilentLogging)
        {
          __CPLSyncOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = " with foreground priority";
            if (!self->_foreground)
              v17 = " with background priority";
            *(_DWORD *)buf = 138412546;
            v27 = v5;
            v28 = 2080;
            v29 = v17;
            _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
          }

        }
        -[NSObject setForeground:](v5, "setForeground:", self->_foreground);
        -[NSObject launch](v5, "launch");
        v18 = 1;
        goto LABEL_29;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", self->_state);
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v27 = v20;
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "System does not have enough space on disk to do %@", buf, 0xCu);

        }
      }
    }
  }
  else
  {
    if (_CPLSilentLogging)
    {
      v18 = 0;
      goto LABEL_30;
    }
    __CPLSyncOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Can't launch %@ as there is no transport user identifier", buf, 0xCu);
    }
  }
  v18 = 0;
LABEL_29:

LABEL_30:
  return v18;
}

- (void)configureDirectTransportTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineSyncManager _transportUserIdentifier](self, "_transportUserIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportUserIdentifier:", v5);

}

- (BOOL)hasBrokenScopes
{
  os_unfair_lock_s *p_brokenScopesLock;
  _QWORD *v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  CPLEngineSyncManager *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_brokenScopesLock = &self->_brokenScopesLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __39__CPLEngineSyncManager_hasBrokenScopes__block_invoke;
  v7 = &unk_1E60D64C8;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_brokenScopesLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_brokenScopesLock);

  LOBYTE(p_brokenScopesLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_brokenScopesLock;
}

- (NSArray)brokenScopes
{
  os_unfair_lock_s *p_brokenScopesLock;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  CPLEngineSyncManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18178;
  v18 = __Block_byref_object_dispose__18179;
  v19 = 0;
  p_brokenScopesLock = &self->_brokenScopesLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __36__CPLEngineSyncManager_brokenScopes__block_invoke;
  v11 = &unk_1E60DC8A0;
  v12 = self;
  v13 = &v14;
  v3 = v9;
  os_unfair_lock_lock(p_brokenScopesLock);
  v10((uint64_t)v3);
  os_unfair_lock_unlock(p_brokenScopesLock);

  v4 = objc_msgSend((id)v15[5], "copy");
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  _Block_object_dispose(&v14, 8);
  return (NSArray *)v7;
}

- (void)addBrokenScope:(id)a3
{
  id v4;
  CPLBrokenScope *v5;
  void *v6;
  CPLBrokenScope *v7;
  os_unfair_lock_s *p_brokenScopesLock;
  CPLBrokenScope *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CPLEngineSyncManager *v15;
  CPLBrokenScope *v16;

  v4 = a3;
  v5 = [CPLBrokenScope alloc];
  -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPLBrokenScope initWithEngineScope:engineLibrary:](v5, "initWithEngineScope:engineLibrary:", v4, v6);

  p_brokenScopesLock = &self->_brokenScopesLock;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __39__CPLEngineSyncManager_addBrokenScope___block_invoke;
  v14 = &unk_1E60D6F88;
  v15 = self;
  v9 = v7;
  v16 = v9;
  v10 = &v11;
  os_unfair_lock_lock(p_brokenScopesLock);
  v13((uint64_t)v10);
  os_unfair_lock_unlock(p_brokenScopesLock);

  -[CPLBrokenScope showAlertToUser](v9, "showAlertToUser", v11, v12);
}

- (void)removeBrokenScope:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[2];
  void (*v12)(_QWORD *);
  void *v13;
  CPLEngineSyncManager *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __42__CPLEngineSyncManager_removeBrokenScope___block_invoke;
  v13 = &unk_1E60DC8F0;
  v14 = self;
  v5 = v4;
  v15 = v5;
  v16 = &v17;
  v6 = v11;
  os_unfair_lock_lock(&self->_brokenScopesLock);
  v12(v6);
  os_unfair_lock_unlock(&self->_brokenScopesLock);

  if (*((_BYTE *)v18 + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "All broken scopes have been fixed. Starting a sync session", v10, 2u);
      }

    }
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kickOffSyncSession");

  }
  _Block_object_dispose(&v17, 8);

}

- (void)_disableSchedulerForForceSyncTaskIfNecessary
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!self->_closed
    && (self->_pendingForceSyncTask || self->_currentForceSyncTask || self->_forcedSetupTask)
    && !self->_disabledSchedulerForForceSyncTask)
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableSynchronizationWithReason:", CFSTR("performing a forced sync session"));

    -[CPLEngineSyncManager _cancelAllTasksLocked](self, "_cancelAllTasksLocked");
    self->_disabledSchedulerForForceSyncTask = 1;
  }
}

- (void)_reenableSchedulerForForceSyncTaskIfNecessary
{
  void *v3;
  void *v4;
  void (**closingCompletionHandler)(id, _QWORD);
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (*(_OWORD *)&self->_currentForceSyncTask == 0
    && !self->_forcedSetupTask
    && self->_disabledSchedulerForForceSyncTask)
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableSynchronizationWithReason:", CFSTR("performing a forced sync session"));

    self->_disabledSchedulerForForceSyncTask = 0;
    closingCompletionHandler = (void (**)(id, _QWORD))self->_closingCompletionHandler;
    if (closingCompletionHandler)
    {
      closingCompletionHandler[2](closingCompletionHandler, 0);
      v6 = self->_closingCompletionHandler;
      self->_closingCompletionHandler = 0;

    }
  }
  -[CPLEngineSyncManager _dispatchCancellerBlocksIfNecessary](self, "_dispatchCancellerBlocksIfNecessary");
}

- (BOOL)_checkForegroundAtLaunchForForceSyncTask
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CPLForceForegroundAtLaunchForForceSyncTask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("CPLForceForegroundAtLaunchForForceSyncTask"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_discardPendingForceSyncTaskWithError:(id)a3
{
  CPLEngineForceSyncTask *pendingForceSyncTask;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  CPLEngineForceSyncTask *v7;

  pendingForceSyncTask = self->_pendingForceSyncTask;
  if (pendingForceSyncTask)
  {
    v5 = a3;
    -[CPLEngineForceSyncTask taskDidFinishWithErrorBlock](pendingForceSyncTask, "taskDidFinishWithErrorBlock");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CPLEngineForceSyncTask *, id))v6)[2](v6, self->_pendingForceSyncTask, v5);

    -[CPLEngineSyncManager _recordForcedSyncTask:discarded:error:](self, "_recordForcedSyncTask:discarded:error:", self->_pendingForceSyncTask, 1, v5);
    v7 = self->_pendingForceSyncTask;
    self->_pendingForceSyncTask = 0;

  }
}

- (void)_forceSyncTaskDidFinishWithError:(id)a3
{
  CPLEngineForceSyncTask *currentForceSyncTask;
  CPLEngineForceSyncTask *v6;

  currentForceSyncTask = self->_currentForceSyncTask;
  if (currentForceSyncTask)
  {
    -[CPLEngineSyncManager _recordForcedSyncTask:discarded:error:](self, "_recordForcedSyncTask:discarded:error:", currentForceSyncTask, 0, a3);
    v6 = self->_currentForceSyncTask;
    self->_currentForceSyncTask = 0;

  }
}

- (void)forceSyncTaskHasBeenLaunched:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CPLEngineSyncManager_forceSyncTaskHasBeenLaunched___block_invoke;
  v6[3] = &unk_1E60D6F88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CPLEngineSyncManager dispatchForcedTaskBlock:](self, "dispatchForcedTaskBlock:", v6);

}

- (void)forceSyncTaskHasBeenCancelled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CPLEngineSyncManager_forceSyncTaskHasBeenCancelled___block_invoke;
  v6[3] = &unk_1E60D6F88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CPLEngineSyncManager dispatchForcedTaskBlock:](self, "dispatchForcedTaskBlock:", v6);

}

- (void)_launchForceSetupTask
{
  CPLEngineTransportSetupTask *v3;
  CPLEngineTransportSetupTask *forcedSetupTask;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (self->_forcedSetupTask)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to launch a forced setup twice", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 989, CFSTR("Trying to launch a forced setup twice"));

    abort();
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke;
  v9[3] = &unk_1E60DDB80;
  v9[4] = self;
  -[CPLEngineSyncManager _setupTaskWithCompletionHandler:](self, "_setupTaskWithCompletionHandler:", v9);
  v3 = (CPLEngineTransportSetupTask *)objc_claimAutoreleasedReturnValue();
  forcedSetupTask = self->_forcedSetupTask;
  self->_forcedSetupTask = v3;

  -[CPLEngineTransportSetupTask setForeground:](self->_forcedSetupTask, "setForeground:", 1);
  -[CPLEngineTransportSetupTask setForcedTask:](self->_forcedSetupTask, "setForcedTask:", 1);
  -[CPLEngineTransportSetupTask runWithNoSyncSession](self->_forcedSetupTask, "runWithNoSyncSession");
}

- (void)_launchForceSyncTaskIfNecessary
{
  id *p_currentForceSyncTask;
  NSObject *v4;
  CPLEngineForceSyncTask *v5;
  CPLEngineForceSyncTask *v6;
  CPLEngineForceSyncTask *v7;
  CPLEngineForceSyncTask *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  CPLEngineForceSyncTask *v12;
  CPLEngineForceSyncTask *v13;
  CPLEngineForceSyncTask *pendingForceSyncTask;
  NSObject *v15;
  CPLEngineForceSyncTask *v16;
  void *v17;
  CPLEngineForceSyncTask *currentForceSyncTask;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  CPLEngineForceSyncTask *v25;
  __int16 v26;
  CPLEngineForceSyncTask *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!self->_closed && !self->_state)
  {
    p_currentForceSyncTask = (id *)&self->_currentForceSyncTask;
    if (!self->_currentForceSyncTask
      && !self->_forcedSetupTask
      && self->_pendingForceSyncTask
      && !-[NSCountedSet count](self->_blockedReasons, "count"))
    {
      -[CPLEngineSyncManager _transportUserIdentifier](self, "_transportUserIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_storeStrong((id *)&self->_currentForceSyncTask, self->_pendingForceSyncTask);
        pendingForceSyncTask = self->_pendingForceSyncTask;
        self->_pendingForceSyncTask = 0;

        if (!_CPLSilentLogging)
        {
          __CPLForceSyncOSLogDomain_18271();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (CPLEngineForceSyncTask *)*p_currentForceSyncTask;
            *(_DWORD *)buf = 138412290;
            v25 = v16;
            _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "Launching %@", buf, 0xCu);
          }

        }
        -[CPLEngineForceSyncTask taskDidFinishWithErrorBlock](self->_currentForceSyncTask, "taskDidFinishWithErrorBlock");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        currentForceSyncTask = self->_currentForceSyncTask;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke;
        v21[3] = &unk_1E60DC918;
        objc_copyWeak(&v23, (id *)buf);
        v21[4] = self;
        v19 = v17;
        v22 = v19;
        -[CPLEngineForceSyncTask setTaskDidFinishWithErrorBlock:](currentForceSyncTask, "setTaskDidFinishWithErrorBlock:", v21);
        objc_msgSend(*p_currentForceSyncTask, "setTransportUserIdentifier:", v4);
        objc_msgSend(*p_currentForceSyncTask, "reallyLaunch");

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLForceSyncOSLogDomain_18271();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Setup needs to be done before launching any forced sync task", buf, 2u);
          }

        }
        -[CPLEngineSyncManager _launchForceSetupTask](self, "_launchForceSetupTask");
        v4 = 0;
      }
      goto LABEL_23;
    }
  }
  if (!self->_pendingForceSyncTask)
    return;
  if (self->_state)
  {
    if (_CPLSilentLogging)
      return;
    __CPLForceSyncOSLogDomain_18271();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_state);
      v5 = (CPLEngineForceSyncTask *)objc_claimAutoreleasedReturnValue();
      v6 = self->_pendingForceSyncTask;
      *(_DWORD *)buf = 138412546;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for sync manager to be quiet (currently in %@) before launching pending %@", buf, 0x16u);

    }
    goto LABEL_23;
  }
  if (self->_currentForceSyncTask)
  {
    if (_CPLSilentLogging)
      return;
    __CPLForceSyncOSLogDomain_18271();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v7 = self->_currentForceSyncTask;
    v8 = self->_pendingForceSyncTask;
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v9 = "Waiting for sync manager to drop previous force sync %@ before launching pending %@";
    v10 = v4;
    v11 = 22;
    goto LABEL_22;
  }
  if (self->_forcedSetupTask)
  {
    if (_CPLSilentLogging)
      return;
    __CPLForceSyncOSLogDomain_18271();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v12 = self->_pendingForceSyncTask;
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    v9 = "Waiting for sync manager to finish forced setup before launching pending %@";
    goto LABEL_21;
  }
  if (_CPLSilentLogging)
    return;
  __CPLForceSyncOSLogDomain_18271();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_pendingForceSyncTask;
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    v9 = "Waiting for better conditions before launching pending %@";
LABEL_21:
    v10 = v4;
    v11 = 12;
LABEL_22:
    _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  }
LABEL_23:

}

- (id)_descriptionForSetupTasks
{
  CPLEngineTransportSetupTask *setupTask;
  void *v3;

  setupTask = self->_setupTask;
  if (setupTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), setupTask);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_setupTaskWithCompletionHandler:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL8 shouldUpdateDisabledFeatures;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  objc_msgSend(WeakRetained, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  shouldUpdateDisabledFeatures = self->_shouldUpdateDisabledFeatures;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60DCA10;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v9 = v5;
  objc_msgSend(v7, "setupTaskUpdateDisabledFeatures:completionHandler:", shouldUpdateDisabledFeatures, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_launchSetupTask
{
  NSObject *v4;
  CPLEngineTransportSetupTask *v5;
  CPLEngineTransportSetupTask *setupTask;
  NSObject *v7;
  CPLEngineTransportSetupTask *v8;
  int v9;
  const char *v10;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  CPLEngineTransportSetupTask *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_setupTask)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Trying to launch a setup task twice", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 1188, CFSTR("Trying to launch a setup task twice"));

    abort();
  }
  if (self->_setupIsDone)
    return 0;
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Launching setup task", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__CPLEngineSyncManager__launchSetupTask__block_invoke;
  v15[3] = &unk_1E60DDB80;
  v15[4] = self;
  -[CPLEngineSyncManager _setupTaskWithCompletionHandler:](self, "_setupTaskWithCompletionHandler:", v15);
  v5 = (CPLEngineTransportSetupTask *)objc_claimAutoreleasedReturnValue();
  setupTask = self->_setupTask;
  self->_setupTask = v5;

  if (self->_foreground)
    -[CPLEngineTransportSetupTask setForeground:](self->_setupTask, "setForeground:", 1);
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_setupTask;
      v9 = -[CPLEngineTransportSetupTask foreground](v8, "foreground");
      v10 = " with background priority";
      if (v9)
        v10 = " with foreground priority";
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2080;
      v19 = v10;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
    }

  }
  -[CPLEngineTransportSetupTask runWithinSyncSession:](self->_setupTask, "runWithinSyncSession:", self->_session);
  return self->_setupTask != 0;
}

- (void)_cancelAllTasksForSetup
{
  -[CPLEngineTransportSetupTask cancel](self->_setupTask, "cancel");
}

- (BOOL)_didFinishSetupTaskWithError:(id)a3 shouldStop:(BOOL *)a4
{
  id v6;
  CPLEngineTransportSetupTask *setupTask;

  v6 = a3;
  setupTask = self->_setupTask;
  self->_setupTask = 0;

  if (v6)
  {
    -[CPLEngineSyncManager setErrorForSyncSessionUnlocked:](self, "setErrorForSyncSessionUnlocked:", v6);
    *a4 = 1;
  }

  return 1;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[CPLEngineSyncManager _shortDescriptionForCurrentState](self, "_shortDescriptionForCurrentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Task %@ did finish with error %@ in state %@", buf, 0x20u);

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__CPLEngineSyncManager_task_didFinishWithError___block_invoke;
  v13[3] = &unk_1E60D7028;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = a2;
  v11 = v8;
  v12 = v7;
  -[CPLEngineSyncManager dispatchSyncBlock:](self, "dispatchSyncBlock:", v13);

}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  float v17;

  v9 = a3;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CPLEngineSyncManager_task_didProgress_userInfo___block_invoke;
  v13[3] = &unk_1E60DCA38;
  v13[4] = self;
  v14 = v9;
  v17 = a4;
  v15 = v10;
  v16 = a2;
  v11 = v10;
  v12 = v9;
  -[CPLEngineSyncManager dispatchSyncBlock:](self, "dispatchSyncBlock:", v13);

}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CPLEngineSyncManager_openWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60DCA60;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v7 = v4;
  v8 = v6;
  v9 = (id)objc_msgSend(v8, "performReadTransactionWithBlock:", v10);

}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *lock;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  _QWORD block[4];
  id v17;

  v6 = a4;
  lock = self->_lock;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CPLEngineSyncManager_closeAndDeactivate_completionHandler___block_invoke;
  v13[3] = &unk_1E60D6780;
  v14 = v6;
  v15 = a2;
  v13[4] = self;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = lock;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (void)beginClientWork:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineSyncManager platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginClientWork:", v4);

}

- (void)endClientWork:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineSyncManager platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endClientWork:", v4);

}

- (id)lastErrorUnlocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  return self->_lastError;
}

- (NSError)lastError
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18178;
  v10 = __Block_byref_object_dispose__18179;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CPLEngineSyncManager_lastError__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (id)componentName
{
  return CFSTR("syncmanager");
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *lock;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = lock;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *lock;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CPLEngineSyncManager_getStatusDictionaryWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18166;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = lock;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)_addRuleToUserDefaults:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CPLEngineSyncManager _dropDerivativeRulesFromUserDefaults](self, "_dropDerivativeRulesFromUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  objc_msgSend(v6, "addObject:", v9);
  +[CPLDropDerivativesRecipe archiveArrayOfCPLDropDerivativeRecipes:](CPLDropDerivativesRecipe, "archiveArrayOfCPLDropDerivativeRecipes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("CPLDropDerivativesTestRules"));

}

- (id)_dropDerivativeRulesFromUserDefaults
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CPLDropDerivativesTestRules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CPLDropDerivativesRecipe unarchiveArrayOfCPLDropDerivativeRecipesFrom:](CPLDropDerivativesRecipe, "unarchiveArrayOfCPLDropDerivativeRecipesFrom:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[4];
  id v21;
  CPLEngineSyncManager *v22;

  v8 = a3;
  v9 = a5;
  if (-[CPLDerivativesFilter addServerDropDerivativesRecipe:](self->_derivativesFilter, "addServerDropDerivativesRecipe:", v8))
  {
    -[CPLEngineSyncManager engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E60DD810;
    v21 = v11;
    v22 = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E60DCA90;
    v19 = a4;
    v18 = v9;
    v16[4] = self;
    v17 = v8;
    v12 = v11;
    v13 = (id)objc_msgSend(v12, "performWriteTransactionWithBlock:completionHandler:", v20, v16);

  }
  else
  {
    objc_msgSend(v8, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v15);

  }
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)shouldTryToMingleImmediately
{
  return self->_shouldTryToMingleImmediately;
}

- (void)setShouldTryToMingleImmediately:(BOOL)a3
{
  self->_shouldTryToMingleImmediately = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_blockedReasons, 0);
  objc_storeStrong((id *)&self->_cancellerBlocks, 0);
  objc_storeStrong((id *)&self->_forcedSyncHistory, 0);
  objc_storeStrong((id *)&self->_lastErrors, 0);
  objc_storeStrong((id *)&self->_pendingForceSyncTask, 0);
  objc_storeStrong((id *)&self->_currentForceSyncTask, 0);
  objc_storeStrong((id *)&self->_forcedSetupTask, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_closingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setupTask, 0);
  objc_storeStrong((id *)&self->_derivativesFilter, 0);
  objc_storeStrong((id *)&self->_brokenScopes, 0);
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
}

void __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E60DDA30;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Unable to save derivativesFilter: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 32), "_addRuleToUserDefaults:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeDerivativesFilter:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), a2);
}

void __65__CPLEngineSyncManager_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id obj;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[4];

  v1 = a1;
  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("state");
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("tasks");
  v34[0] = v2;
  objc_msgSend(*(id *)(v1 + 32), "_descriptionForLaunchedTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 128), "count"))
  {
    v23 = v5;
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "setObject:forKey:");
    objc_msgSend(*(id *)(v1 + 32), "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v1;
    obj = *(id *)(*(_QWORD *)(v1 + 32) + 128);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = *MEMORY[0x1E0CB3388];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v11);
          if (v12)
            v12 = (_QWORD *)v12[3];
          v13 = v12;
          objc_msgSend(v13, "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = v15;

            v13 = v16;
          }
          objc_msgSend(v27, "bestErrorForUnderlyingError:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "domain");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "code");
            objc_msgSend(v17, "localizedDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %ld %@"), v19, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v22);

          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

    v5 = v23;
    v1 = v24;
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();

}

void __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  void *v4;
  id v5;
  os_unfair_lock_s *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  id obj;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[2];
  void (*v76)(uint64_t);
  void *v77;
  id v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB37A0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_shortDescriptionForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "_descriptionForLaunchedTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__18178;
  v84 = __Block_byref_object_dispose__18179;
  v85 = 0;
  v5 = *v2;
  v6 = (os_unfair_lock_s *)((char *)*v2 + 20);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v76 = __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke_2;
  v77 = &unk_1E60DC8A0;
  v78 = v5;
  v79 = &v80;
  v7 = v75;
  os_unfair_lock_lock(v6);
  v76((uint64_t)v7);
  os_unfair_lock_unlock(v6);

  v8 = objc_msgSend((id)v81[5], "count");
  v9 = (void *)v81[5];
  if (v8 == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "appendFormat:", CFSTR("\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@"), v10);
LABEL_8:

    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "count");
  v12 = (void *)v81[5];
  if (v11 == 2)
  {
    objc_msgSend(v12, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v81[5], "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "appendFormat:", CFSTR("\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@ OR %@"), v10, v13);
LABEL_7:

    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v12, "count") >= 3)
  {
    objc_msgSend((id)v81[5], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 0, objc_msgSend((id)v81[5], "count") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v81[5], "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "appendFormat:", CFSTR("\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@ OR %@"), v14, v15);

    goto LABEL_7;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
    goto LABEL_37;
  objc_msgSend(v65, "appendString:", CFSTR("\nlast errors:"));
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transport");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
  if (!v62)
    goto LABEL_36;
  v60 = *(_QWORD *)v72;
  v63 = *MEMORY[0x1E0CB3388];
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v72 != v60)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v17);
      if (v18)
        v19 = *(_QWORD *)(v18 + 8);
      else
        v19 = 0;
      +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v66 = *(id *)(v18 + 16);
        v21 = *(void **)(v18 + 24);
      }
      else
      {
        v66 = 0;
        v21 = 0;
      }
      v22 = v21;
      v23 = objc_msgSend(v22, "isCPLOperationDeferredError");
      objc_msgSend(v22, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", CFSTR("CPLErrorRequestUUIDs"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", v63);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = v27;

        v22 = v28;
      }
      objc_msgSend(v61, "bestErrorForUnderlyingError:", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v66, v64);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "domain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v29, "code");
        objc_msgSend(v29, "localizedDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "appendFormat:", CFSTR("\n\t%@ (%@): [DEFER] %@ %ld %@"), v30, v20, v31, v32, v33);
LABEL_28:

        v35 = v27;
        goto LABEL_29;
      }
      objc_msgSend(v29, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v63);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v35, "domain");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v35, "code");
        objc_msgSend(v35, "localizedDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR(" - [%@ %ld %@]"), v37, v38, v39);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = &stru_1E60DF6B8;
      }
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v66, v64);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v29, "code");
      objc_msgSend(v29, "localizedDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "appendFormat:", CFSTR("\n\t%@ (%@): %@ %ld %@%@"), v40, v20, v41, v42, v43, v30);

      objc_msgSend(v35, "userInfo");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKey:", v63);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v31, "domain");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v31, "code");
        objc_msgSend(v31, "localizedDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "appendFormat:", CFSTR(" (%@ %ld %@)"), v33, v45, v46);

        v27 = v35;
        goto LABEL_28;
      }
LABEL_29:

      if (v25)
        objc_msgSend(v65, "appendFormat:", CFSTR(" (requests: %@)"), v25);

      ++v17;
    }
    while (v62 != v17);
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    v62 = v47;
  }
  while (v47);
LABEL_36:

LABEL_37:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "componentsJoinedByString:", CFSTR(", "));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "appendFormat:", CFSTR("\nForced sync tasks are blocked. Reasons: %@"), v49);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count"))
  {
    objc_msgSend(v65, "appendString:", CFSTR("\nlast forced syncs:"));
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v50 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v68;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v68 != v52)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v53), "descriptionWithNow:", v64);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "appendFormat:", CFSTR("\n\t%@"), v54);

          ++v53;
        }
        while (v51 != v53);
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      }
      while (v51);
    }

  }
  v55 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v55 + 137))
  {
    if (*(_BYTE *)(v55 + 138))
      v56 = CFSTR("\nboosting priority - currently overriding system budgets");
    else
      v56 = CFSTR("\nboosting priority if necessary");
    objc_msgSend(v65, "appendString:", v56);
    v55 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v55 + 104))
  {
    objc_msgSend(v65, "appendFormat:", CFSTR("\nrunning %@"), *(_QWORD *)(v55 + 104));
    v55 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v55 + 96))
  {
    objc_msgSend(v65, "appendFormat:", CFSTR("\nrunning forced setup %@"), *(_QWORD *)(v55 + 96));
    v55 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v55 + 112))
  {
    objc_msgSend(v65, "appendFormat:", CFSTR("\npending %@"), *(_QWORD *)(v55 + 112));
    v55 = *(_QWORD *)(a1 + 32);
  }
  v57 = *(_QWORD *)(v55 + 64);
  if (v57)
    objc_msgSend(v65, "appendFormat:", CFSTR("\ncurrent session tracked as %@"), v57);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(&v80, 8);
}

void __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", CFSTR("LIBRARY ZONES ARE CLEANED-UP"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "alternateRecoverDescription", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uppercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

void __33__CPLEngineSyncManager_lastError__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

uint64_t __61__CPLEngineSyncManager_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Trying to close %@ twice", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, v24, 1334, CFSTR("Trying to close %@ twice"), *(_QWORD *)(a1 + 32));

    abort();
  }
  *(_BYTE *)(v2 + 42) = 1;
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForClose");

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[14])
  {
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_discardPendingForceSyncTaskWithError:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_reenableSchedulerForForceSyncTaskIfNecessary");
    v4 = *(_QWORD **)(a1 + 32);
  }
  if (!v4[24] && !v4[13] && !v4[12])
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  v6 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 104);
  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling current forced sync task", buf, 2u);
      }

      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    }
    objc_msgSend(v10, "cancelTask");
  }
  else
  {
    v12 = *(void **)(v9 + 96);
    if (v12)
    {
      objc_msgSend(v12, "cancel");
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(*(id *)(a1 + 32), "_shortDescriptionForCurrentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForLaunchedTasks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%@)"), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling current sync session in state: %@", buf, 0xCu);
        }

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAllTasksLocked");
}

void __50__CPLEngineSyncManager_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTransportUserIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 40), "derivativesFilter");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = objc_msgSend(*(id *)(a1 + 40), "shouldUpdateDisabledFeatures");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41))
    v10 = _CPLSilentLogging == 0;
  else
    v10 = 0;
  if (v10)
  {
    __CPLSyncOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Will update list of disabled features on setup", v15, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "scopes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 137) = objc_msgSend(v12, "hasScopesNeedingToPushHighPriorityChangesToTransport");

  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

void __50__CPLEngineSyncManager_task_didProgress_userInfo___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 192);
  switch(v4)
  {
    case 14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, v11, 1304, CFSTR("Should not be in state %@"), v12);

      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("Should not be in setup state with some running task");
      v17 = v8;
      v18 = v13;
      v19 = v14;
      v20 = v15;
      v21 = 1301;
LABEL_11:
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, v20, v21, v16);

LABEL_12:
      abort();
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("Should not be quiet with some running task");
      v17 = v8;
      v18 = v22;
      v19 = v23;
      v20 = v15;
      v21 = 1298;
      goto LABEL_11;
  }
  if (*(_QWORD *)(v3 + 88))
  {
    LODWORD(a2) = *(_DWORD *)(a1 + 64);
    objc_msgSend(*(id *)(v3 + 88), "progressForTask:progress:", *(_QWORD *)(a1 + 40), a2);
    v6 = v5;
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend((id)v3, "platformObject");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v6;
  objc_msgSend(v24, "didProgress:userInfo:forState:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), v7);

}

void __48__CPLEngineSyncManager_task_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  if (v3)
  {
    if ((objc_msgSend(v3, "containsTask:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      goto LABEL_6;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 48);
    if (!v4)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v52 = v41;
          _os_log_impl(&dword_1B03C2000, v40, OS_LOG_TYPE_ERROR, "Task completion called for %@ with no step currently running", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(a1 + 56);
      v43 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v42, v43, v37, 1222, CFSTR("Task completion called for %@ with no step currently running"), *(_QWORD *)(a1 + 40));
      goto LABEL_72;
    }
  }
  if (v4 != *(_QWORD *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "descriptionForTasks");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v52 = v32;
        v53 = 2112;
        v54 = v33;
        _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_ERROR, "Task completion called for %@ but current step (%@) does not manage it", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 56);
    v36 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "descriptionForTasks");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, v37, 1223, CFSTR("Task completion called for %@ but current step (%@) does not manage it"), v38, v39);
    goto LABEL_66;
  }
LABEL_6:
  v5 = *(id *)(a1 + 48);
  if (!*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 48) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Looking for next step of sync session", buf, 2u);
    }

  }
  v50 = 0;
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[24];
  switch(v9)
  {
    case 1:
      if (!objc_msgSend(v8, "_didFinishSetupTaskWithError:shouldStop:", v5, &v50))
        goto LABEL_20;
      goto LABEL_25;
    case 14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(a1 + 56);
      v45 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v44, v45, v37, 1240, CFSTR("Should not be in state %@"), v39, v49);
LABEL_66:

LABEL_72:
      goto LABEL_73;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *(_QWORD *)(a1 + 56);
      v47 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v46, v47, v48, 1234, CFSTR("Should not be quiet with some running task"));

LABEL_73:
      abort();
  }
  v10 = (void *)v8[11];
  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      if ((objc_msgSend(v10, "didFinishTask:withError:shouldStop:", v11, *(_QWORD *)(a1 + 48), &v50) & 1) == 0)
      {
LABEL_20:
        if (!_CPLSilentLogging)
        {
          __CPLSyncOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 32), "_shortDescriptionForCurrentState");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_descriptionForLaunchedTasks");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v52 = v13;
            v53 = 2112;
            v54 = v14;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "There is more work to do for %@ (%@)", buf, 0x16u);

          }
        }
        goto LABEL_60;
      }
    }
  }
LABEL_25:
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "_shortDescriptionForCurrentState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v16;
      _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEBUG, "%@ is finished now", buf, 0xCu);

    }
  }
  v17 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v17 + 56))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Library is closing. Stopping now", buf, 2u);
      }

      v17 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v17, "_notifyEndOfSyncSession");
    objc_msgSend(*(id *)(a1 + 32), "_setState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_overrideBudgetsIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_resetErrorForSyncSession");
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 56);
    *(_QWORD *)(v19 + 56) = 0;

    goto LABEL_60;
  }
  v21 = v50;
  if (*(_QWORD *)(v17 + 120) > 0xDuLL)
  {
LABEL_44:
    if (v21)
    {
      if (*(_QWORD *)(v17 + 120) > 0xDuLL)
      {
LABEL_59:
        objc_msgSend((id)v17, "_notifyEndOfSyncSession");
        objc_msgSend(*(id *)(a1 + 32), "_setState:", 0);
        objc_msgSend(*(id *)(a1 + 32), "_overrideBudgetsIfNeeded");
        goto LABEL_60;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
          *(_DWORD *)buf = 138412546;
          v52 = v25;
          v53 = 2112;
          v54 = v26;
          _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "Not rewinding to %@ as we were required to stop (last error: %@)", buf, 0x16u);

        }
        v17 = *(_QWORD *)(a1 + 32);
      }
      *(_QWORD *)(v17 + 120) = 14;
    }
    else
    {
      objc_msgSend((id)v17, "_transportUserIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(*(id *)(a1 + 32), "_advanceToNextStateLocked");
        goto LABEL_60;
      }
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEBUG, "Lost the transport user identifier, restarting from setup", buf, 2u);
        }

      }
      v29 = *(void **)(a1 + 32);
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 28, CFSTR("Lost the user identifier during the sync session"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setErrorForSyncSessionUnlocked:", v30);

    }
    v17 = *(_QWORD *)(a1 + 32);
    goto LABEL_59;
  }
  if (v50 && (objc_msgSend(*(id *)(v17 + 80), "isCPLOperationCancelledError") & 1) == 0)
  {
    v21 = v50;
    v17 = *(_QWORD *)(a1 + 32);
    goto LABEL_44;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v23;
      _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEBUG, "Restarting sync session from %@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_resetErrorForSyncSession");
  objc_msgSend(*(id *)(a1 + 32), "_setState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) - 1);
  objc_msgSend(*(id *)(a1 + 32), "_advanceToNextStateLocked");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 14;
LABEL_60:

}

uint64_t __40__CPLEngineSyncManager__launchSetupTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "task:didFinishWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a2);
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E60DC9E8;
  v14 = (void *)a1[4];
  v13 = (void *)a1[5];
  v22 = v12;
  v23 = v14;
  v15 = v13;
  v16 = a1[6];
  v27 = v15;
  v28 = v16;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  v20 = v12;
  objc_msgSend(v14, "dispatchSyncBlock:", v21);

}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  __int128 *v31;
  BOOL v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  __int128 *p_buf;
  BOOL v41;
  char v42;
  char v43;
  _QWORD v44[5];
  uint8_t v45[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int128 buf;
  uint64_t v50;
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56)
      || (+[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError"),
          (v2 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!*(_QWORD *)(a1 + 48))
      {
        if (!_CPLSilentLogging)
        {
          __CPLSyncOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "Did not get a user identifier from the transport", (uint8_t *)&buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 80);
        v25 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, v26, 1093, CFSTR("Did not get a user identifier from the transport"));

        abort();
      }
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 41))
      {
        if (objc_msgSend(*(id *)(a1 + 56), "count"))
        {
          if (_CPLSilentLogging)
            goto LABEL_19;
          __CPLSyncOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 56), "componentsJoinedByString:", CFSTR(", "));
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v5;
            _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updated list of disabled features: %@", (uint8_t *)&buf, 0xCu);

          }
        }
        else
        {
          if (_CPLSilentLogging)
            goto LABEL_19;
          __CPLSyncOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updated list of disabled features: none", (uint8_t *)&buf, 2u);
          }
        }

      }
LABEL_19:
      objc_msgSend(*(id *)(a1 + 40), "engineLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "store");
      v2 = (id)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v50 = 0x2020000000;
      v51 = 1;
      objc_msgSend(*(id *)(a1 + 40), "_transportUserIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      if (v7)
      {
        if ((objc_msgSend(*(id *)(a1 + 48), "isEqual:", v7) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLSyncOSLogDomain();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)v45 = 138412546;
              v46 = v7;
              v47 = 2112;
              v48 = v10;
              _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Transport user changed from %@ to %@, we will need to wipe everything and start from scratch", v45, 0x16u);
            }

          }
          v44[0] = v8;
          v44[1] = 3221225472;
          v44[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_203;
          v44[3] = &unk_1E60D65B8;
          v44[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v2, "wipeStoreAtNextOpeningWithReason:completionBlock:", CFSTR("user has changed without CPL being disabled and re-enabled"), v44);
        }
        if (!*(_QWORD *)(a1 + 64))
        {
LABEL_34:
          v17 = *(_QWORD *)(a1 + 40);
          if (!*(_BYTE *)(v17 + 41))
          {
            if (!_CPLSilentLogging)
            {
              __CPLSyncOSLogDomain();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)v45 = 0;
                _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEBUG, "Setup is done", v45, 2u);
              }

              v17 = *(_QWORD *)(a1 + 40);
            }
            *(_BYTE *)(v17 + 40) = 1;
            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
            goto LABEL_42;
          }
          goto LABEL_35;
        }
      }
      else if (!*(_QWORD *)(a1 + 64))
      {
LABEL_35:
        LOBYTE(v16) = 0;
LABEL_36:
        v34[0] = v8;
        v34[1] = 3221225472;
        v34[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2_205;
        v34[3] = &unk_1E60DC970;
        v41 = v7 == 0;
        v42 = 0;
        v35 = v2;
        p_buf = &buf;
        v18 = *(id *)(a1 + 48);
        v19 = *(_QWORD *)(a1 + 40);
        v36 = v18;
        v37 = v19;
        v43 = v16 & 1;
        v38 = *(id *)(a1 + 64);
        v39 = *(id *)(a1 + 56);
        v27[0] = v8;
        v27[1] = 3221225472;
        v27[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_6;
        v27[3] = &unk_1E60DC9C0;
        v27[4] = *(_QWORD *)(a1 + 40);
        v30 = *(id *)(a1 + 72);
        v32 = v7 == 0;
        v28 = *(id *)(a1 + 48);
        v33 = v16 & 1;
        v29 = *(id *)(a1 + 64);
        v31 = &buf;
        v20 = (id)objc_msgSend(v35, "performWriteTransactionWithBlock:completionHandler:", v34, v27);

LABEL_42:
        _Block_object_dispose(&buf, 8);
        goto LABEL_43;
      }
      v11 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 40) + 32);
      v12 = (unint64_t)*(id *)(a1 + 64);
      v13 = (void *)v12;
      if (v11 && v12)
      {
        v14 = objc_msgSend((id)v11, "isEqual:", v12);
        v15 = v7 == 0;

        v16 = v14 ^ 1;
      }
      else
      {
        v15 = v7 == 0;
        v16 = (v11 | v12) != 0;

      }
      if (((v15 | v16) & 1) != 0)
        goto LABEL_36;
      goto LABEL_34;
    }
  }
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Setup of transport did fail: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_43:

}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_203(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CPLLibraryMustBeWipedNotificationName"), v2);

}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2_205(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  v10 = a2;
  v3 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 80))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E60DC948;
    v23 = *(_BYTE *)(a1 + 81);
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 72);
    v19 = v4;
    v22 = v5;
    v24 = *(_BYTE *)(a1 + 80);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v20 = v6;
    v21 = v7;
    objc_msgSend(v10, "do:", v18);

  }
  if (*(_BYTE *)(a1 + 82))
  {
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E60DDA30;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v10, "do:", v15);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 41))
  {
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E60DDB30;
    v12 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v13 = v8;
    v14 = v9;
    objc_msgSend(v10, "do:", v11);

  }
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  char v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_7;
  v11[3] = &unk_1E60DC998;
  v12 = v3;
  v5 = *(id *)(a1 + 56);
  v18 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v16 = v5;
  v13 = v6;
  v14 = v7;
  v19 = *(_BYTE *)(a1 + 73);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v15 = v8;
  v17 = v9;
  v10 = v3;
  objc_msgSend(v4, "dispatchSyncBlock:", v11);

}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Unable to save user identifier: %@", (uint8_t *)&v11, 0xCu);

      }
    }
    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Setup is done", (uint8_t *)&v11, 2u);
      }

    }
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 40), "_setTransportUserIdentifier:", *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(a1 + 81))
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 41) = 0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Setup detected significant changes, will need to retry", (uint8_t *)&v11, 2u);
        }

      }
      v9 = *(_QWORD *)(a1 + 64);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
  }
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  void *v6;

  if (!*(_BYTE *)(a1 + 64)
    || (v4 = objc_msgSend(*(id *)(a1 + 32), "resetCompleteSyncStateWithCause:error:", CFSTR("user change"), a2),
        result = 0,
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0,
        v4))
  {
    if (*(_BYTE *)(a1 + 65))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "storeUserIdentifier:error:", *(_QWORD *)(a1 + 40), a2);
      if (!(_DWORD)result)
        return result;
      if (*(_BYTE *)(a1 + 65))
      {
        objc_msgSend(*(id *)(a1 + 48), "engineLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notifyAttachedObjectsPullQueueIsFull");

      }
    }
    return 1;
  }
  return result;
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeDerivativesFilter:error:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v4;
  char v5;

  v5 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "updateDisabledFeatures:didReset:error:", *(_QWORD *)(a1 + 40), &v5, a2);
  if ((_DWORD)result)
    v4 = v5 == 0;
  else
    v4 = 1;
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return result;
}

void __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLForceSyncOSLogDomain_18271();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "%@ did finish with error %@", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke_193;
    v11[3] = &unk_1E60D70A0;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    v14 = WeakRetained;
    v15 = v6;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "dispatchForcedTaskBlock:", v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke_193(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "_forceSyncTaskDidFinishWithError:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "_launchForceSyncTaskIfNecessary");
    objc_msgSend(*(id *)(a1 + 48), "_reenableSchedulerForForceSyncTaskIfNecessary");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke_2;
  v6[3] = &unk_1E60D6F88;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchForcedTaskBlock:", v6);

}

void __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  v4 = *(id *)(a1 + 40);
  if (v4)
    goto LABEL_2;
  objc_msgSend(*(id *)(a1 + 32), "_transportUserIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_8;
  if (!_CPLSilentLogging)
  {
    __CPLForceSyncOSLogDomain_18271();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Setup finished successfully but has no transport user identifier", (uint8_t *)&v10, 2u);
    }

  }
  +[CPLErrors unknownError](CPLErrors, "unknownError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_2:
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain_18271();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Forced setup failed with error: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_discardPendingForceSyncTaskWithError:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_reenableSchedulerForForceSyncTaskIfNecessary");

  }
  else
  {
LABEL_8:
    v7 = *(_QWORD **)(a1 + 32);
    if (v7[14])
    {
      if (!_CPLSilentLogging)
      {
        __CPLForceSyncOSLogDomain_18271();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Forced setup finished successfully", (uint8_t *)&v10, 2u);
        }

        v7 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v7, "_launchForceSyncTaskIfNecessary");
    }
    else
    {
      objc_msgSend(v7, "_reenableSchedulerForForceSyncTaskIfNecessary");
    }
  }
}

uint64_t __54__CPLEngineSyncManager_forceSyncTaskHasBeenCancelled___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[12];
  if (v3)
  {
    objc_msgSend(v3, "cancel");
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    if (v4 == (void *)v2[14])
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_discardPendingForceSyncTaskWithError:", v5);

    }
    else
    {
      objc_msgSend(v4, "reallyCancel");
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_reenableSchedulerForForceSyncTaskIfNecessary");
}

void __53__CPLEngineSyncManager_forceSyncTaskHasBeenLaunched___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  NSObject *v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  _BYTE v29[22];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasBrokenScopes"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain_18271();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "All forced syncs are disabled until library is cleaned", v29, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithErrorBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    if (_CPLSilentLogging)
    {
LABEL_13:
      objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithErrorBlock", *(_OWORD *)v29);
      v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 40);
      _willDownloadInBackgroundErrorForTask(v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v11 = (void *)v5;
      ((void (**)(_QWORD, void *, uint64_t))v3)[2](v3, v4, v5);

LABEL_21:
      return;
    }
    __CPLForceSyncOSLogDomain_18271();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_13;
    }
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v29 = 138412290;
    *(_QWORD *)&v29[4] = v7;
    v8 = "Ignoring %@ because we are blocked";
LABEL_11:
    _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, v8, v29, 0xCu);
    goto LABEL_12;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 42))
  {
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain_18271();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v29 = 138412290;
        *(_QWORD *)&v29[4] = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring %@ because we are closed", v29, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithErrorBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v12 = objc_msgSend(*(id *)(a1 + 40), "bypassForceSyncLimitations");
  v13 = *(_QWORD *)(a1 + 32);
  if ((v12 & 1) == 0 && !*(_BYTE *)(v13 + 136))
  {
    if ((objc_msgSend((id)v13, "_checkForegroundAtLaunchForForceSyncTask") & 1) != 0)
    {
      if (_CPLSilentLogging)
        goto LABEL_13;
      __CPLForceSyncOSLogDomain_18271();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v29 = 138412290;
      *(_QWORD *)&v29[4] = v14;
      v8 = "Ignoring %@ because we are in background";
      goto LABEL_11;
    }
    v13 = *(_QWORD *)(a1 + 32);
  }
  v15 = *(void **)(v13 + 104);
  if (v15)
  {
    if ((objc_msgSend(v15, "bypassForceSyncLimitations") & 1) != 0)
    {
      v16 = 0;
      goto LABEL_39;
    }
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain_18271();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
        *(_DWORD *)v29 = 138412546;
        *(_QWORD *)&v29[4] = v19;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v18;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling %@ because we must launch %@", v29, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancelTask");
  }
  v16 = 1;
LABEL_39:
  v20 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v20)
  {
    if ((objc_msgSend(v20, "bypassForceSyncLimitations") & 1) != 0)
    {
LABEL_52:
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10, CFSTR("A more important force sync task is running"));
      v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithErrorBlock");
      v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v28[2](v28, *(_QWORD *)(a1 + 40), v3);

      objc_msgSend(*(id *)(a1 + 32), "_recordForcedSyncTask:discarded:error:", *(_QWORD *)(a1 + 40), 1, v3);
      goto LABEL_21;
    }
    if (!_CPLSilentLogging)
    {
      __CPLForceSyncOSLogDomain_18271();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        *(_DWORD *)v29 = 138412546;
        *(_QWORD *)&v29[4] = v23;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v22;
        _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@ because we must launch %@", v29, 0x16u);
      }

    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "taskDidFinishWithErrorBlock");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, *(_QWORD *)(a1 + 40), v24);

    objc_msgSend(*(id *)(a1 + 32), "_recordForcedSyncTask:discarded:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), 1, v24);
  }
  if (!v16)
    goto LABEL_52;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
  if (!_CPLSilentLogging)
  {
    __CPLForceSyncOSLogDomain_18271();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v29 = 138412290;
      *(_QWORD *)&v29[4] = v27;
      _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "Enqueuing %@", v29, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_disableSchedulerForForceSyncTaskIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_launchForceSyncTaskIfNecessary");
}

void __42__CPLEngineSyncManager_removeBrokenScope___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineSyncManager_removeBrokenScope___block_invoke_2;
  v5[3] = &unk_1E60DC8C8;
  v6 = v2;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "removeObjectsAtIndexes:", v4);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "count") == 0;
  }

}

uint64_t __42__CPLEngineSyncManager_removeBrokenScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "engineScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __39__CPLEngineSyncManager_addBrokenScope___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __36__CPLEngineSyncManager_brokenScopes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "engineScope", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

uint64_t __39__CPLEngineSyncManager_hasBrokenScopes__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t __41__CPLEngineSyncManager_setBoostPriority___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 137) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 137) = v2;
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(v3 + 32) + 137))
          v5 = CFSTR("Start");
        else
          v5 = CFSTR("Stop");
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@ boosting priority", (uint8_t *)&v6, 0xCu);
      }

    }
    return objc_msgSend(*(id *)(v3 + 32), "_overrideBudgetsIfNeeded");
  }
  return result;
}

void __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void **v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *(*v19)(_QWORD *);
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(v3 + 136))
  {
    *(_BYTE *)(v3 + 136) = v2;
    if (*(_BYTE *)(a1 + 40))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Moving to foreground operations", buf, 2u);
        }

      }
      +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.foreground"), CFSTR("client is foreground"), 0);
    }
    else
    {
      +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.foreground"));
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Moving to background operations", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_moveAllTasksToBackgroundLocked");
    }
    objc_msgSend(*(id *)(a1 + 32), "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSyncSessionShouldBeForeground:", *(unsigned __int8 *)(a1 + 40));

    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(unsigned __int8 *)(v3 + 136);
  }
  if (!v2)
  {
    v7 = *(void **)(v3 + 104);
    if (v7)
    {
      v8 = objc_msgSend(v7, "bypassForceSyncLimitations");
      v3 = *(_QWORD *)(a1 + 32);
      if ((v8 & 1) == 0)
      {
        v9 = *(id *)(v3 + 104);
        v10 = *(void **)(a1 + 32);
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke_172;
        v20 = &unk_1E60D6F88;
        v21 = v10;
        v22 = v9;
        v11 = v9;
        objc_msgSend(v10, "_dispatchAfter:block:", &v17, 60.0);

        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    v12 = *(void **)(v3 + 112);
    if (v12 && (objc_msgSend(v12, "bypassForceSyncLimitations") & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLForceSyncOSLogDomain_18271();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@ because we moved to background", buf, 0xCu);
        }

      }
      v15 = *(void ***)(a1 + 32);
      _willDownloadInBackgroundErrorForTask(v15[14]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_discardPendingForceSyncTaskWithError:", v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "_reenableSchedulerForForceSyncTaskIfNecessary", v17, v18, v19, v20, v21);
  }
}

_QWORD *__57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke_172(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = result[4];
  if (!*(_BYTE *)(v1 + 136))
  {
    v2 = result;
    result = *(_QWORD **)(v1 + 104);
    if (result == (_QWORD *)v2[5])
    {
      if (!_CPLSilentLogging)
      {
        __CPLForceSyncOSLogDomain_18271();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = v2[5];
          v5 = 138412290;
          v6 = v4;
          _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling %@ because we moved to background", (uint8_t *)&v5, 0xCu);
        }

        result = (_QWORD *)v2[5];
      }
      return (_QWORD *)objc_msgSend(result, "cancelTask");
    }
  }
  return result;
}

uint64_t __53__CPLEngineSyncManager_requestDisabledFeaturesUpdate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

uint64_t __54__CPLEngineSyncManager_discardTransportUserIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setTransportUserIdentifier:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return result;
}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_setTransportUserIdentifier:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2;
  v7[3] = &unk_1E60DD838;
  v8 = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2_166;
  v6[3] = &unk_1E60DD838;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "performWriteTransactionWithBlock:completionHandler:", v7, v6);

}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLSyncOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Restting stored user identifier", buf, 2u);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_163;
  v5[3] = &unk_1E60DD6D0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "do:", v5);

}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2_166(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_163(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeUserIdentifier:error:", 0, a2);
}

uint64_t __53__CPLEngineSyncManager_unblockSyncSessionWithReason___block_invoke(uint64_t *a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1[4] + 160), "countForObject:", a1[5]))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSyncOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = a1[5];
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Sync manager unblocked for reason '%@' too many times", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[6];
    v7 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, v8, 648, CFSTR("Sync manager unblocked for reason '%@' too many times"), a1[5]);

    abort();
  }
  objc_msgSend(*(id *)(a1[4] + 160), "removeObject:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 160), "count");
  if (result)
    return objc_msgSend((id)a1[4], "_launchForceSyncTaskIfNecessary");
  return result;
}

void __70__CPLEngineSyncManager_cancelAndBlockAllSyncSessionsWithReason_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD **)(a1 + 32);
  v7 = (void *)v6[19];
  if (v7)
  {
    v18 = (id)MEMORY[0x1B5E08DC4](*(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "addObject:");

  }
  else
  {
    v8 = (void *)v6[14];
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        __CPLForceSyncOSLogDomain_18271();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@", buf, 0xCu);
        }

        v6 = *(_QWORD **)(a1 + 32);
        v8 = (void *)v6[14];
      }
      _willDownloadInBackgroundErrorForTask(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_discardPendingForceSyncTaskWithError:", v11);

      v6 = *(_QWORD **)(a1 + 32);
    }
    if (v6[13] || v6[24])
    {
      v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v13 = (void *)MEMORY[0x1B5E08DC4](*(_QWORD *)(a1 + 48));
      v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 152);
      *(_QWORD *)(v15 + 152) = v14;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancelTask");
      objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentSyncSession");
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSyncOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "No sync session is currently running - no need to cancel anything", buf, 2u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __48__CPLEngineSyncManager_cancelCurrentSyncSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentSyncSession");
}

void __65__CPLEngineSyncManager_startSyncSession_withMinimalPhase_rewind___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *v7;
  id v8;
  id WeakRetained;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    v7 = *(id **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
    {
      v8 = v7[8];
      if (v8 != *(id *)(a1 + 40))
      {
        v2 = v7 + 23;
        goto LABEL_3;
      }
    }
    else
    {
      v8 = *(id *)(a1 + 40);
    }
    objc_msgSend(v7, "_restartSyncSessionFromStateLocked:session:cancelIfNecessary:", *(_QWORD *)(a1 + 48), v8, 1);
    return;
  }
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 184);
LABEL_3:
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 48) >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192))
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  else
    v5 = *(_QWORD *)(a1 + 48);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteSyncSession:failedDuringPhase:withError:", v4, v5, v6);

}

void __62__CPLEngineSyncManager__advanceToNextStateLockedMinimalState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)descriptionForState:(unint64_t)a3
{
  if (a3 < 0xF)
    return off_1E60DCAF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CPLEngineSyncManagerState unknown %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shortDescriptionForState:(unint64_t)a3
{
  if (a3 < 0xF)
    return off_1E60DCB68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("state-%lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)qualityOfServiceForSyncSessions
{
  return 9;
}

+ (unsigned)qualityOfServiceForForcedTasks
{
  return 25;
}

+ (id)stepForState:(unint64_t)a3 syncManager:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (stepForState_syncManager_session__onceToken != -1)
  {
    dispatch_once(&stepForState_syncManager_session__onceToken, &__block_literal_global_18417);
    if (v9)
      goto LABEL_3;
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  v10 = (void *)stepForState_syncManager_session__constructors;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    ((void (**)(_QWORD, id, void *))v12)[2](v12, v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

LABEL_9:
  return v13;
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E611A2B8;
  v2[1] = &unk_1E611A2D0;
  v3[0] = &__block_literal_global_76_18420;
  v3[1] = &__block_literal_global_81;
  v2[2] = &unk_1E611A2E8;
  v2[3] = &unk_1E611A300;
  v3[2] = &__block_literal_global_85_18421;
  v3[3] = &__block_literal_global_89;
  v2[4] = &unk_1E611A318;
  v2[5] = &unk_1E611A330;
  v3[4] = &__block_literal_global_93;
  v3[5] = &__block_literal_global_98_18425;
  v2[6] = &unk_1E611A348;
  v2[7] = &unk_1E611A360;
  v3[6] = &__block_literal_global_102_18426;
  v3[7] = &__block_literal_global_105;
  v2[8] = &unk_1E611A378;
  v2[9] = &unk_1E611A390;
  v3[8] = &__block_literal_global_109_18427;
  v3[9] = &__block_literal_global_113;
  v2[10] = &unk_1E611A3A8;
  v2[11] = &unk_1E611A3C0;
  v3[10] = &__block_literal_global_117;
  v3[11] = &__block_literal_global_121;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stepForState_syncManager_session__constructors;
  stepForState_syncManager_session__constructors = v0;

}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLPushToTransportSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLPushToTransportSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLPushToTransportSyncStep initWithSyncManager:syncSession:highPriority:]([CPLPushToTransportSyncStep alloc], "initWithSyncManager:syncSession:highPriority:", v5, v4, 0);

  return v6;
}

CPLPushToTransportSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLPushToTransportSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLPushToTransportSyncStep initWithSyncManager:syncSession:highPriority:]([CPLPushToTransportSyncStep alloc], "initWithSyncManager:syncSession:highPriority:", v5, v4, 1);

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CPLSimpleTaskSyncStep *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:]([CPLSimpleTaskSyncStep alloc], "initWithSyncManager:syncSession:taskClass:", v5, v4, objc_opt_class());

  return v6;
}

@end
