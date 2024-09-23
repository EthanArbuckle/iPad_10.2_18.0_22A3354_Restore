@implementation CPLEngineScheduler

- (CPLEngineScheduler)initWithEngineLibrary:(id)a3
{
  id v5;
  CPLEngineScheduler *v6;
  CPLEngineScheduler *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSCountedSet *v11;
  NSCountedSet *disablingReasons;
  NSCountedSet *v13;
  NSCountedSet *blockingElements;
  NSMutableDictionary *v15;
  NSMutableDictionary *blockedElements;
  NSMutableSet *v17;
  NSMutableSet *blockWaiters;
  NSCountedSet *v19;
  NSCountedSet *unblockOnceElements;
  dispatch_queue_t v21;
  OS_dispatch_queue *blockingLock;
  CPLSyncSessionPredictor *v23;
  id WeakRetained;
  void *v25;
  uint64_t v26;
  CPLSyncSessionPredictor *predictor;
  void *v28;
  uint64_t v29;
  CPLPlatformObject *platformObject;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CPLEngineScheduler;
  v6 = -[CPLEngineScheduler init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cpl.scheduler", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v7->_needsToUpdateLastSyncDate = 1;
    v7->_intervalForRetry = 0.100000001;
    v7->_requiredFirstState = 14;
    *(int64x2_t *)&v7->_currentSyncState = vdupq_n_s64(0xEuLL);
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    disablingReasons = v7->_disablingReasons;
    v7->_disablingReasons = v11;

    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    blockingElements = v7->_blockingElements;
    v7->_blockingElements = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    blockedElements = v7->_blockedElements;
    v7->_blockedElements = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    blockWaiters = v7->_blockWaiters;
    v7->_blockWaiters = v17;

    v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    unblockOnceElements = v7->_unblockOnceElements;
    v7->_unblockOnceElements = v19;

    v21 = dispatch_queue_create("com.apple.cpl.blocking", 0);
    blockingLock = v7->_blockingLock;
    v7->_blockingLock = (OS_dispatch_queue *)v21;

    v7->_protectAgainstFastRelaunch = 1;
    v23 = [CPLSyncSessionPredictor alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v7->_engineLibrary);
    objc_msgSend(WeakRetained, "libraryIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[CPLSyncSessionPredictor initWithIdentifier:](v23, "initWithIdentifier:", v25);
    predictor = v7->_predictor;
    v7->_predictor = (CPLSyncSessionPredictor *)v26;

    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "newPlatformImplementationForObject:", v7);
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v29;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v39 = v33;
          v34 = v33;
          _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, v36, 192, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
  }

  return v7;
}

- (void)_updateOverridingForeground
{
  unint64_t foregroundCalls;
  void *v4;
  void *v5;
  BOOL v6;

  foregroundCalls = self->_foregroundCalls;
  if (self->_isOverridingForeground)
  {
    if (!foregroundCalls || !self->_nextSession && !self->_currentSession)
    {
      -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "systemMonitor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopOverridingSystemBudgets:reason:", 8, 2);
      v6 = 0;
LABEL_9:

      self->_isOverridingForeground = v6;
    }
  }
  else if (foregroundCalls && self->_currentSession)
  {
    -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOverridingSystemBudgets:reason:", 8, 2);
    v6 = 1;
    goto LABEL_9;
  }
}

- (void)_setRequiredFirstState:(unint64_t)requiredFirstState
{
  void (**requiredStateObserverBlock)(id, unint64_t);

  if (self->_requiredFirstState != requiredFirstState)
  {
    self->_requiredFirstState = requiredFirstState;
    requiredStateObserverBlock = (void (**)(id, unint64_t))self->_requiredStateObserverBlock;
    if (requiredStateObserverBlock)
    {
      requiredStateObserverBlock[2](requiredStateObserverBlock, requiredFirstState);
      requiredFirstState = self->_requiredFirstState;
    }
    if (requiredFirstState <= 0xB)
      self->_needsToUpdateLastSyncDate = 1;
  }
}

- (BOOL)_syncSessionIsPossible
{
  return !self->_unavailabilityLimitDate && -[NSCountedSet count](self->_disablingReasons, "count") == 0;
}

- (void)_startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5
{
  _BOOL8 v5;
  CPLSyncSession *v9;
  CPLSyncSession *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  int v19;
  id WeakRetained;
  void *v21;
  _BYTE v22[24];
  const char *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = (CPLSyncSession *)a3;
  v10 = v9;
  if (v5 && self->_currentSession != v9)
    goto LABEL_24;
  if (self->_protectAgainstFastRelaunch)
  {
    self->_protectAgainstFastRelaunch = 0;
    -[CPLEngineScheduler _writeFirstSynchronizationMarker](self, "_writeFirstSynchronizationMarker");
  }
  if (self->_delayedFirstSyncBecauseOfRapidLaunch)
    self->_delayedFirstSyncBecauseOfRapidLaunch = 0;
  if (self->_currentSession != v10)
  {
    if (_CPLSilentLogging)
      goto LABEL_20;
    __CPLSchedulerOSLogDomain_6445();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = " (don't rewind)";
    *(_DWORD *)v22 = 138412802;
    *(_QWORD *)&v22[4] = v10;
    if (v5)
      v14 = "";
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v12;
    *(_WORD *)&v22[22] = 2080;
    v23 = v14;
    v15 = "Starting %@ with minimal phase %@%s";
    goto LABEL_18;
  }
  if (_CPLSilentLogging)
    goto LABEL_20;
  __CPLSchedulerOSLogDomain_6445();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a4);
    v16 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v16;
    v17 = " (don't rewind)";
    *(_DWORD *)v22 = 138412802;
    *(_QWORD *)&v22[4] = v10;
    if (v5)
      v17 = "";
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v16;
    *(_WORD *)&v22[22] = 2080;
    v23 = v17;
    v15 = "Ensure %@ goes through phase %@%s";
LABEL_18:
    _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, v15, v22, 0x20u);

  }
LABEL_19:

LABEL_20:
  if (self->_nextSessionShouldRequestMoreTime
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("CPLAllSessionsShouldRequestMoreTime")),
        v18,
        v19))
  {
    -[CPLSyncSession setShouldRequestMoreTime:](v10, "setShouldRequestMoreTime:", 1, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
  }
  objc_storeStrong((id *)&self->_currentSession, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  objc_msgSend(WeakRetained, "syncManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startSyncSession:withMinimalPhase:rewind:", v10, a4, v5);

LABEL_24:
}

- (void)_reallyStartSyncSession:(id)a3
{
  CPLSyncSession *v5;
  CPLSyncSession *currentSession;
  NSDate *unavailabilityLimitDate;
  double v9;
  CPLSyncSession *nextSession;
  NSDate *deferDate;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  CPLSyncSession *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  CPLSyncSession *v25;
  __int16 v26;
  CPLSyncSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (CPLSyncSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5 && currentSession != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_currentSession;
        *(_DWORD *)buf = 138412546;
        v25 = v5;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Trying to start %@ while %@ is already running", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v23, 261, CFSTR("Trying to start %@ while %@ is already running"), v5, self->_currentSession);

    abort();
  }
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
    if (v9 < 0.0)
      -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  }
  nextSession = self->_nextSession;
  self->_nextSession = 0;

  deferDate = self->_deferDate;
  self->_deferDate = 0;

  if (-[CPLEngineScheduler _syncSessionIsPossible](self, "_syncSessionIsPossible")
    && (-[CPLEngineScheduler platformObject](self, "platformObject"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "shouldStartSyncSessionFromState:", self->_requiredFirstState),
        v12,
        v13))
  {
    if (self->_requiredFirstState < 7
      || (-[CPLEngineScheduler engineLibrary](self, "engineLibrary"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "store"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isClientInSyncWithClientCache"),
          v15,
          v14,
          v16)
      && self->_requiredFirstState <= 0xD)
    {
      self->_lastRequestGeneration = self->_currentRequestGeneration;
      -[CPLEngineScheduler _startSyncSession:withMinimalPhase:rewind:](self, "_startSyncSession:withMinimalPhase:rewind:", v5);
    }
    else if (!self->_currentSession)
    {
      -[CPLEngineScheduler platformObject](self, "platformObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "noteSyncSessionSucceeded:", v5);

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "We were prevented to start a required sync session by implementation. Rescheduling", buf, 2u);
      }

    }
    if (!self->_currentSession)
    {
      -[CPLEngineScheduler platformObject](self, "platformObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "noteSyncSessionSucceeded:", v5);

      -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
    }
  }
  -[CPLEngineScheduler _updateOverridingForeground](self, "_updateOverridingForeground");

}

- (void)_startRequiredSyncSession:(id)a3
{
  CPLSyncSession *v4;
  NSDate *unavailabilityLimitDate;
  double v6;
  NSObject *v7;
  CPLSyncSession *currentSession;
  const char *v9;
  CPLSyncSession *v11;
  CPLSyncSession *nextSession;
  CPLSyncSession *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  CPLSyncSession *v17;
  __int16 v18;
  CPLSyncSession *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (CPLSyncSession *)a3;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
    if (v6 < 0.0)
      -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  }
  if (self->_opened)
  {
    if (self->_currentSyncState > 0xD)
    {
      nextSession = self->_nextSession;
      if (nextSession)
      {
        if (nextSession == v4)
        {
          if (self->_deferDate && !_CPLSilentLogging)
          {
            __CPLSchedulerOSLogDomain_6445();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = 138543362;
              v17 = v4;
              _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "Restarting deferred %{public}@", (uint8_t *)&v16, 0xCu);
            }

          }
          -[CPLEngineScheduler _reallyStartSyncSession:](self, "_reallyStartSyncSession:", v4);
        }
        else if (!_CPLSilentLogging)
        {
          __CPLSchedulerOSLogDomain_6445();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v13 = self->_nextSession;
            v16 = 138412546;
            v17 = v4;
            v18 = 2112;
            v19 = v13;
            v9 = "Dropping request for sync session %@ from implementation as we scheduled %@";
            goto LABEL_21;
          }
LABEL_22:

        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = 138412290;
          v17 = v4;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Dropping request for sync session %@ from implementation as we cancelled that scheduling", (uint8_t *)&v16, 0xCu);
        }

      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        currentSession = self->_currentSession;
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = currentSession;
        v9 = "Dropping request for sync session %@ from implementation as we are already in the middle of %@";
LABEL_21:
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v16, 0x16u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else if (self->_requiredFirstState <= 0xD && _CPLSilentLogging == 0)
  {
    __CPLSchedulerOSLogDomain_6445();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
      v11 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Dropping one request for a sync session from %@ because we are closed", (uint8_t *)&v16, 0xCu);

    }
    goto LABEL_22;
  }

}

- (void)_scheduleNextSyncSession
{
  NSDate *unavailabilityLimitDate;
  double v4;
  NSDate *proposedScheduleDate;
  double v6;
  double intervalForRetry;
  CPLSyncSession *nextSession;
  NSObject *v9;
  CPLSyncSession *v10;
  void *v11;
  NSObject *v12;
  CPLSyncSession *currentSession;
  void *v14;
  double v15;
  NSObject *v16;
  CPLSyncSession *v17;
  unint64_t requiredFirstState;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSDate *lastSuccessfulSyncSessionDate;
  id v24;
  NSDate *v25;
  NSDate *v26;
  double v27;
  id v28;
  CPLSyncSession *v29;
  NSObject *v30;
  CPLSyncSession *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  CPLSyncSession *v37;
  CPLSyncSession *v38;
  NSDate *deferDate;
  int v40;
  CPLSyncSession *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
    if (v4 < 0.0)
      -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  }
  -[CPLEngineScheduler _stopPreparingFirstSession](self, "_stopPreparingFirstSession");
  proposedScheduleDate = self->_proposedScheduleDate;
  if (proposedScheduleDate)
  {
    -[NSDate timeIntervalSinceNow](proposedScheduleDate, "timeIntervalSinceNow");
    if (v6 >= 0.100000001)
      intervalForRetry = v6;
    else
      intervalForRetry = 0.100000001;
  }
  else
  {
    intervalForRetry = self->_intervalForRetry;
  }
  nextSession = self->_nextSession;
  if (!nextSession)
  {
    if (!self->_currentSession)
      goto LABEL_27;
    if (_CPLSilentLogging)
      return;
    __CPLSchedulerOSLogDomain_6445();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      currentSession = self->_currentSession;
      v40 = 138543362;
      v41 = currentSession;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "No need to schedule a sync session as we are already in the middle of %{public}@", (uint8_t *)&v40, 0xCu);
    }
LABEL_42:

    return;
  }
  if (self->_deferDate)
  {
    if (_CPLSilentLogging)
    {
LABEL_15:
      -[CPLEngineScheduler _reallyUnscheduleSession](self, "_reallyUnscheduleSession");
      goto LABEL_27;
    }
    __CPLSchedulerOSLogDomain_6445();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_nextSession;
      +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", self->_deferDate, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v10;
      v42 = 2114;
      v43 = v11;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has been deferred %{public}@ - scheduling a new sync session", (uint8_t *)&v40, 0x16u);

    }
LABEL_14:

    goto LABEL_15;
  }
  -[CPLSyncSession expectedDate](nextSession, "expectedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (_CPLSilentLogging)
      goto LABEL_15;
    __CPLSchedulerOSLogDomain_6445();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_nextSession;
      v40 = 138543362;
      v41 = v29;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has no expected date - scheduling a new sync session", (uint8_t *)&v40, 0xCu);
    }
    goto LABEL_14;
  }
  -[CPLSyncSession expectedDate](self->_nextSession, "expectedDate");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject timeIntervalSinceNow](v12, "timeIntervalSinceNow");
  if (v15 <= intervalForRetry)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        -[CPLSyncSession whenItWillStartDescription](self->_nextSession, "whenItWillStartDescription");
        v31 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        v40 = 138543362;
        v41 = v31;
        _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_DEBUG, "No need to reschedule a sync session. A session is expected to start %{public}@", (uint8_t *)&v40, 0xCu);

      }
    }
    goto LABEL_42;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_nextSession;
      v40 = 138543362;
      v41 = v17;
      _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@'s expected date is too far away - scheduling a new sync session", (uint8_t *)&v40, 0xCu);
    }

  }
  -[CPLEngineScheduler _reallyUnscheduleSession](self, "_reallyUnscheduleSession");

LABEL_27:
  requiredFirstState = self->_requiredFirstState;
  if (requiredFirstState <= 0xD)
  {
    if (requiredFirstState < 7
      || (-[CPLEngineScheduler engineLibrary](self, "engineLibrary"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "store"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isClientInSyncWithClientCache"),
          v20,
          v19,
          v21))
    {
      if (-[CPLEngineScheduler _syncSessionIsPossible](self, "_syncSessionIsPossible"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", intervalForRetry);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        lastSuccessfulSyncSessionDate = self->_lastSuccessfulSyncSessionDate;
        v24 = v22;
        v25 = lastSuccessfulSyncSessionDate;
        v26 = v25;
        if (_decentNextSessionDate_onceToken == -1)
        {
          if (!v25)
            goto LABEL_44;
        }
        else
        {
          dispatch_once(&_decentNextSessionDate_onceToken, &__block_literal_global_485);
          if (!v26)
            goto LABEL_44;
        }
        objc_msgSend(v24, "timeIntervalSinceDate:", v26);
        if (v27 < *(double *)&_decentNextSessionDate_secondSessionCoalescingInterval)
        {
          -[NSDate dateByAddingTimeInterval:](v26, "dateByAddingTimeInterval:");
          v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
          v32 = v28;

          if (self->_protectAgainstFastRelaunch)
          {
            -[CPLEngineScheduler _minimalDateForFirstSync](self, "_minimalDateForFirstSync");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33 && objc_msgSend(v32, "compare:", v33) == -1)
            {
              if (!_CPLSilentLogging)
              {
                __CPLSchedulerOSLogDomain_6445();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v40) = 0;
                  _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Delaying first sync because we relaunched too fast", (uint8_t *)&v40, 2u);
                }

              }
              v35 = v33;

              self->_delayedFirstSyncBecauseOfRapidLaunch = 1;
              v32 = v35;
            }

          }
          -[CPLEngineScheduler platformObject](self, "platformObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "scheduleNextSyncSessionAtDate:", v32);
          v37 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
          v38 = self->_nextSession;
          self->_nextSession = v37;

          deferDate = self->_deferDate;
          self->_deferDate = 0;

          goto LABEL_55;
        }
LABEL_44:
        v28 = v24;
        goto LABEL_45;
      }
    }
  }
LABEL_55:
  -[CPLEngineScheduler _updateOverridingForeground](self, "_updateOverridingForeground");
}

- (void)_reallyUnscheduleSession
{
  void *v3;
  CPLSyncSession *nextSession;
  NSDate *deferDate;

  if (self->_nextSession)
  {
    -[CPLEngineScheduler platformObject](self, "platformObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unscheduleSyncSession:", self->_nextSession);

    nextSession = self->_nextSession;
    self->_nextSession = 0;

    deferDate = self->_deferDate;
    self->_deferDate = 0;

    -[CPLEngineScheduler _updateOverridingForeground](self, "_updateOverridingForeground");
  }
}

- (void)_unscheduleNextSyncSession
{
  if (self->_nextSession)
    -[CPLEngineScheduler _reallyUnscheduleSession](self, "_reallyUnscheduleSession");
}

- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 proposedScheduleDate:(id)a4
{
  id v7;
  NSDate *unavailabilityLimitDate;
  double v9;
  unint64_t pendingRequiredFirstState;
  NSDate **p_proposedScheduleDate;
  unint64_t requiredFirstState;
  NSObject *v14;
  double intervalForRetry;
  void *v16;
  NSDate *v17;
  NSString *unavailabilityReason;
  unint64_t currentSyncState;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  CPLSyncSession *currentSession;
  NSObject *v28;
  CPLSyncSession *v29;
  void *v30;
  void *v31;
  void *v32;
  CPLSyncSession *nextSession;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  double v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
    if (v9 < 0.0)
      -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  }
  if (self->_opened)
  {
    pendingRequiredFirstState = self->_pendingRequiredFirstState;
    if (pendingRequiredFirstState <= 0xD && pendingRequiredFirstState >= a3)
      self->_pendingRequiredFirstState = 14;
    p_proposedScheduleDate = &self->_proposedScheduleDate;
    objc_storeStrong((id *)&self->_proposedScheduleDate, a4);
    requiredFirstState = self->_requiredFirstState;
    if (requiredFirstState > a3 && self->_intervalForRetry > 5.0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          intervalForRetry = self->_intervalForRetry;
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 134218242;
          v40 = intervalForRetry;
          v41 = 2114;
          v42 = v16;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Resetting backoff interval to %.0fs because we are asked to start from %{public}@", (uint8_t *)&v39, 0x16u);

        }
      }
      self->_intervalForRetry = 5.0;
      v17 = self->_unavailabilityLimitDate;
      self->_unavailabilityLimitDate = 0;

      unavailabilityReason = self->_unavailabilityReason;
      self->_unavailabilityReason = 0;

      requiredFirstState = self->_requiredFirstState;
    }
    if (requiredFirstState >= a3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543362;
          v40 = *(double *)&v26;
          _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@", (uint8_t *)&v39, 0xCu);

        }
      }
      -[CPLEngineScheduler _setRequiredFirstState:](self, "_setRequiredFirstState:", a3);
      ++self->_currentRequestGeneration;
      currentSession = self->_currentSession;
      if (currentSession)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSchedulerOSLogDomain_6445();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v29 = self->_currentSession;
            +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 138543618;
            v40 = *(double *)&v29;
            v41 = 2114;
            v42 = v30;
            _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEBUG, "We are in the middle of %{public}@. Let's use it and rewind to %{public}@", (uint8_t *)&v39, 0x16u);

          }
          currentSession = self->_currentSession;
        }
        -[CPLEngineScheduler _reallyStartSyncSession:](self, "_reallyStartSyncSession:", currentSession);
      }
      else
      {
        -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
      }
      goto LABEL_54;
    }
    currentSyncState = self->_currentSyncState;
    if (self->_currentSession && currentSyncState >= a3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_currentSyncState);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543874;
          v40 = *(double *)&v21;
          v41 = 2114;
          v42 = v22;
          v43 = 2114;
          v44 = v23;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "We are in the middle of %{public}@ and are requested to rewind to %{public}@ but we will already rewind to %{public}@", (uint8_t *)&v39, 0x20u);

        }
        goto LABEL_53;
      }
LABEL_54:
      v24 = *p_proposedScheduleDate;
      *p_proposedScheduleDate = 0;
LABEL_55:

      goto LABEL_56;
    }
    if (currentSyncState < a3)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_currentSyncState);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543618;
          v40 = *(double *)&v31;
          v41 = 2114;
          v42 = v32;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEBUG, "We are in the middle of %{public}@ and requested %{public}@ will happen later in the sync session.", (uint8_t *)&v39, 0x16u);

        }
        goto LABEL_53;
      }
      goto LABEL_54;
    }
    nextSession = self->_nextSession;
    if (!nextSession
      || self->_deferDate
      || (-[CPLSyncSession expectedDate](nextSession, "expectedDate"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v38,
          !v38))
    {
      -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
    }
    if (self->_nextSession)
    {
      if (_CPLSilentLogging)
        goto LABEL_54;
      __CPLSchedulerOSLogDomain_6445();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLSyncSession whenItWillStartDescription](self->_nextSession, "whenItWillStartDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543874;
        v40 = *(double *)&v34;
        v41 = 2114;
        v42 = v35;
        v43 = 2114;
        v44 = v36;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@ but we have already been asked to start from %{public}@ (should happen %{public}@)", (uint8_t *)&v39, 0x20u);

LABEL_52:
      }
    }
    else
    {
      if (_CPLSilentLogging)
        goto LABEL_54;
      __CPLSchedulerOSLogDomain_6445();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = *(double *)&v34;
        v41 = 2114;
        v42 = v37;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "We are asked to schedule a sync session from %{public}@ but we have already been asked to start from %{public}@ (no date scheduled yet)", (uint8_t *)&v39, 0x16u);

        goto LABEL_52;
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "Not scheduling sync sessions until the scheduler is fully ready", (uint8_t *)&v39, 2u);
    }
    goto LABEL_55;
  }
LABEL_56:

}

- (void)_noteSyncSessionNeededFromState:(unint64_t)a3 minimumDelay:(double)intervalForRetry
{
  double v6;
  void *v7;
  NSDate *unavailabilityLimitDate;
  double v9;
  id v10;
  id v11;
  id v12;

  if (self->_requiredFirstState == 14
    && (v6 = intervalForRetry, intervalForRetry = self->_intervalForRetry, intervalForRetry < v6))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    unavailabilityLimitDate = self->_unavailabilityLimitDate;
    if (unavailabilityLimitDate
      && (-[NSDate timeIntervalSinceDate:](unavailabilityLimitDate, "timeIntervalSinceDate:", v7), v9 >= v6))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    v10 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = v10;
  -[CPLEngineScheduler _noteSyncSessionNeededFromState:proposedScheduleDate:](self, "_noteSyncSessionNeededFromState:proposedScheduleDate:", a3, v10, intervalForRetry);

}

- (void)_backOff
{
  NSDate *unavailabilityLimitDate;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  double intervalForRetry;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
    if (v4 < 0.0)
      -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  }
  v5 = self->_intervalForRetry + self->_intervalForRetry;
  self->_intervalForRetry = v5;
  v6 = 5.0;
  if (v5 < 5.0 || (v6 = 3600.0, v5 > 3600.0))
    self->_intervalForRetry = v6;
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      intervalForRetry = self->_intervalForRetry;
      v9 = 134217984;
      v10 = intervalForRetry;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Will back-off retry to %.0fs", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)startRequiredSyncSessionNow:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__CPLEngineScheduler_startRequiredSyncSessionNow___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)forceStartSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CPLEngineScheduler_forceStartSyncSession_withMinimalPhase___block_invoke;
  v13[3] = &unk_1E60D6E20;
  v13[4] = self;
  v14 = v6;
  v15 = a4;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = queue;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (void)kickOffSyncSession
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CPLEngineScheduler_kickOffSyncSession__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteStoreNeedsSetup
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CPLEngineScheduler_noteStoreNeedsSetup__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteStoreNeedsToUpdateDisabledFeatures
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CPLEngineScheduler_noteStoreNeedsToUpdateDisabledFeatures__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteStoreNeedsCleanup
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CPLEngineScheduler_noteStoreNeedsCleanup__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteTransportNeedsUpdate
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CPLEngineScheduler_noteTransportNeedsUpdate__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteScopeListNeedsUpdate
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CPLEngineScheduler_noteScopeListNeedsUpdate__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteScopeNeedsUpdate
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineScheduler_noteScopeNeedsUpdate__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_disableFastRelaunchProtection
{
  CPLSyncSession *nextSession;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (self->_protectAgainstFastRelaunch)
    self->_protectAgainstFastRelaunch = 0;
  if (self->_delayedFirstSyncBecauseOfRapidLaunch)
  {
    self->_delayedFirstSyncBecauseOfRapidLaunch = 0;
    self->_intervalForRetry = 5.0;
    nextSession = self->_nextSession;
    if (nextSession && -[CPLSyncSession isInMoreThanTimeInverval:](nextSession, "isInMoreThanTimeInverval:", 5.0))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling sync session soon after disabling fast relaunch protection", buf, 2u);
        }

      }
      -[CPLEngineScheduler _reallyUnscheduleSession](self, "_reallyUnscheduleSession");
      -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Disabling fast relaunch protection", v6, 2u);
      }

    }
  }
}

- (void)noteScopeNeedsToPushHighPriorityToTransport
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CPLEngineScheduler_noteScopeNeedsToPushHighPriorityToTransport__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteScopeNeedsToPushToTransportWithChangeTypes:(unint64_t)a3
{
  unint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD v9[6];
  _QWORD block[4];
  id v11;

  v3 = 122;
  if (a3)
    v3 = a3;
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__CPLEngineScheduler_noteScopeNeedsToPushToTransportWithChangeTypes___block_invoke;
  v9[3] = &unk_1E60D6DF8;
  v9[4] = self;
  v9[5] = v3;
  v6 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v11 = v6;
  v7 = queue;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

- (void)noteScopeNeedsToPullFromTransport
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CPLEngineScheduler_noteScopeNeedsToPullFromTransport__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteScopeNeedsToUploadComputeState
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CPLEngineScheduler_noteScopeNeedsToUploadComputeState__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientNeedsToPull
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CPLEngineScheduler *v11;

  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CPLEngineScheduler_noteClientNeedsToPull__block_invoke;
  v8[3] = &unk_1E60DD2A8;
  v9 = v4;
  v10 = v3;
  v11 = self;
  v5 = v3;
  v6 = v4;
  v7 = (id)objc_msgSend(v6, "performReadTransactionWithBlock:", v8);

}

- (void)noteClientIsInSyncWithClientCache
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CPLEngineScheduler_noteClientIsInSyncWithClientCache__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientIsNotInSyncWithClientCache
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CPLEngineScheduler_noteClientIsNotInSyncWithClientCache__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_noteSyncSessionNeededFromStateDontRewindImmediately:(unint64_t)a3
{
  unint64_t currentSyncState;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  currentSyncState = self->_currentSyncState;
  if (currentSyncState <= a3 || currentSyncState > 0xB)
  {
    -[CPLEngineScheduler _noteSyncSessionNeededFromState:proposedScheduleDate:](self, "_noteSyncSessionNeededFromState:proposedScheduleDate:", a3, 0);
  }
  else if (self->_requiredFirstState > a3 && self->_pendingRequiredFirstState > a3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_currentSyncState);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", 11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = v8;
        v13 = 2114;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Notified that we need to rewind to %{public}@ but we will wait for %{public}@...%{public}@ to be finished", (uint8_t *)&v11, 0x20u);

      }
    }
    self->_pendingRequiredFirstState = a3;
  }
}

- (void)_reallyNoteServerHasChangesLocked
{
  void *v3;
  void *v4;
  NSDate *unavailabilityLimitDate;
  double v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "shouldSyncScopeList"))
  {
    unavailabilityLimitDate = self->_unavailabilityLimitDate;
    if (unavailabilityLimitDate)
    {
      -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
      if (v6 < 0.0)
        -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
    }
    -[CPLEngineScheduler _noteSyncSessionNeededFromStateDontRewindImmediately:](self, "_noteSyncSessionNeededFromStateDontRewindImmediately:", 4);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Notified that Server has changes to be pulled", buf, 2u);
      }

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke;
    v9[3] = &unk_1E60DD838;
    v10 = v4;
    v8 = (id)objc_msgSend(v10, "performWriteTransactionWithBlock:completionHandler:", v9, &__block_literal_global_6548);

  }
  self->_shouldNoteServerHasChanges = 0;

}

- (void)noteServerHasChanges
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineScheduler_noteServerHasChanges__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteResourceDownloadQueueIsFull
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CPLEngineScheduler_noteResourceDownloadQueueIsFull__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD block[4];
  id v11;

  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CPLEngineScheduler_noteClientIsInForegroundQuietly___block_invoke;
  v8[3] = &unk_1E60DC878;
  v8[4] = self;
  v9 = a3;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)noteClientIsInBackground
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CPLEngineScheduler_noteClientIsInBackground__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (BOOL)isClientInForeground
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineScheduler_isClientInForeground__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_disableSynchronizationBecauseContainerHasBeenWipedLocked
{
  NSObject *v3;
  uint8_t v4[16];

  if ((-[NSCountedSet containsObject:](self->_disablingReasons, "containsObject:", CFSTR("container has been wiped")) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Disabling synchronization because container has been wiped - engine and transport must be wiped", v4, 2u);
      }

    }
    -[CPLEngineScheduler _disableSynchronizationWithReasonLocked:](self, "_disableSynchronizationWithReasonLocked:", CFSTR("container has been wiped"));
  }
}

- (void)_disableSynchronizationWithReasonLocked:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Disabling synchronization for reason '%{public}@'", (uint8_t *)&v8, 0xCu);
    }

  }
  -[NSCountedSet addObject:](self->_disablingReasons, "addObject:", v4);
  if (self->_nextSession)
    -[CPLEngineScheduler _unscheduleNextSyncSession](self, "_unscheduleNextSyncSession");
  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelCurrentSyncSession");

}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLEngineScheduler_disableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)disableSynchronizationIfBlockedWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CPLEngineScheduler_disableSynchronizationIfBlockedWithReason_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)_enableSynchronizationWithReasonLocked:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[NSCountedSet countForObject:](self->_disablingReasons, "countForObject:", v5))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "%@ has been called too many times with reason '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 883, CFSTR("%@ has been called too many times with reason '%@'"), v16, v5);

    abort();
  }
  -[NSCountedSet removeObject:](self->_disablingReasons, "removeObject:", v5);
  if (-[NSCountedSet count](self->_disablingReasons, "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[NSCountedSet allObjects](self->_disablingReasons, "allObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v5;
        v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is still disabled for reasons: %{public}@", buf, 0x16u);

      }
    }
  }
  else if (self->_requiredFirstState > 0xD)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v5;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is now fully enabled", buf, 0xCu);
      }

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v5;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Reenabling synchonization for reason '%{public}@'. Synchronization is now fully enabled and should restart soon from at least %{public}@", buf, 0x16u);

      }
    }
    self->_intervalForRetry = 0.100000001;
    if (!self->_currentSession)
      -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
  }

}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CPLEngineScheduler_enableSynchronizationWithReason___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)blockAllSyncSessionsWithReason:(id)a3 onlyIfBlocked:(BOOL)a4 block:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke;
  v17[3] = &unk_1E60D6AA0;
  v20 = a4;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

- (void)blockEngineElement:(id)a3
{
  id v4;
  NSObject *blockingLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  blockingLock = self->_blockingLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CPLEngineScheduler_blockEngineElement___block_invoke;
  v7[3] = &unk_1E60D6F88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(blockingLock, v7);

}

- (void)unblockEngineElement:(id)a3
{
  id v5;
  NSObject *blockingLock;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  blockingLock = self->_blockingLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CPLEngineScheduler_unblockEngineElement___block_invoke;
  block[3] = &unk_1E60D6E20;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(blockingLock, block);

}

- (void)willRunEngineElement:(id)a3
{
  id v4;
  char v5;
  __int128 v6;
  NSObject *blockingLock;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6491;
  v26 = __Block_byref_object_dispose__6492;
  v27 = 0;
  *(_QWORD *)&v6 = 138412290;
  v13 = v6;
  do
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    blockingLock = self->_blockingLock;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CPLEngineScheduler_willRunEngineElement___block_invoke;
    block[3] = &unk_1E60DDAA8;
    v16 = &v18;
    block[4] = self;
    v8 = v4;
    v15 = v8;
    v17 = &v22;
    dispatch_sync(blockingLock, block);
    v9 = *((unsigned __int8 *)v19 + 24);
    if (*((_BYTE *)v19 + 24))
    {
      if (!(v5 & 1 | (_CPLSilentLogging != 0)))
      {
        __CPLSchedulerOSLogDomain_6445();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v29 = v4;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Blocked engine for %@", buf, 0xCu);
        }

      }
      v11 = (void *)v23[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3.0, v13);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "waitUntilDate:", v12);
LABEL_8:

      v5 = 1;
      goto LABEL_9;
    }
    if ((v5 & (_CPLSilentLogging == 0)) == 1)
    {
      __CPLSchedulerOSLogDomain_6445();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v13;
        v29 = v4;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Unblocked engine for %@", buf, 0xCu);
      }
      goto LABEL_8;
    }
LABEL_9:

    _Block_object_dispose(&v18, 8);
  }
  while (v9);
  _Block_object_dispose(&v22, 8);

}

- (BOOL)waitForEngineElementToBeBlocked:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  char v8;
  __int128 v9;
  double v10;
  NSObject *blockingLock;
  int v12;
  NSObject *v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v18;
  void *v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 > 0.0)
    objc_msgSend(v19, "dateByAddingTimeInterval:", a4);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6491;
  v32 = __Block_byref_object_dispose__6492;
  v33 = 0;
  *(_QWORD *)&v9 = 138412546;
  v18 = v9;
  do
  {
    objc_msgSend(v7, "timeIntervalSinceNow", v18);
    if (v10 <= 0.0)
      break;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    blockingLock = self->_blockingLock;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CPLEngineScheduler_waitForEngineElementToBeBlocked_timeout___block_invoke;
    block[3] = &unk_1E60DDAA8;
    block[4] = self;
    v21 = v6;
    v22 = &v24;
    v23 = &v28;
    dispatch_sync(blockingLock, block);
    v12 = *((unsigned __int8 *)v25 + 24);
    if (*((_BYTE *)v25 + 24))
    {
      if (_CPLSilentLogging)
      {
        v8 = 1;
        goto LABEL_13;
      }
      __CPLSchedulerOSLogDomain_6445();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "timeIntervalSinceNow");
        *(_DWORD *)buf = v18;
        v35 = v6;
        v36 = 2048;
        v37 = -v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Engine is blocked on %@ - waited for %.2fs", buf, 0x16u);
      }
      v8 = 1;
    }
    else
    {
      v15 = (void *)v29[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject earlierDate:](v13, "earlierDate:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "waitUntilDate:", v16);

    }
LABEL_13:

    _Block_object_dispose(&v24, 8);
  }
  while (!v12);
  _Block_object_dispose(&v28, 8);

  return v8 & 1;
}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4;
  NSObject *blockingLock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  blockingLock = self->_blockingLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CPLEngineScheduler_unblockEngineElementOnce___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(blockingLock, block);

}

- (void)noteClientIsBeginningSignificantWork
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CPLEngineScheduler_noteClientIsBeginningSignificantWork__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteClientIsEndingSignificantWork
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CPLEngineScheduler_noteClientIsEndingSignificantWork__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)disableMingling
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CPLEngineScheduler_disableMingling__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)enableMingling
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CPLEngineScheduler_enableMingling__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (BOOL)isMinglingEnabled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CPLEngineScheduler_isMinglingEnabled__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isSynchronizationDisabledWithReasonError:(id *)a3
{
  NSObject *queue;
  int v5;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6491;
  v13 = __Block_byref_object_dispose__6492;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CPLEngineScheduler_isSynchronizationDisabledWithReasonError___block_invoke;
  block[3] = &unk_1E60DD460;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && *((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v5 = *((unsigned __int8 *)v16 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)_disableRetryAfterLocked
{
  NSDate *unavailabilityLimitDate;
  NSString *unavailabilityReason;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (unavailabilityLimitDate)
  {
    self->_unavailabilityLimitDate = 0;

    unavailabilityReason = self->_unavailabilityReason;
    self->_unavailabilityReason = 0;

    if (self->_requiredFirstState > 0xD)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Server should be available now", (uint8_t *)&v8, 2u);
        }

      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", self->_requiredFirstState);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412290;
          v9 = v6;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Server should be available now. Rescheduling a sync session from at least %@", (uint8_t *)&v8, 0xCu);

        }
      }
      -[CPLEngineScheduler _unscheduleNextSyncSession](self, "_unscheduleNextSyncSession");
      -[CPLEngineScheduler _scheduleNextSyncSession](self, "_scheduleNextSyncSession");
    }
  }
}

- (void)_noteServerIsUnavailableWithErrorLocked:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSDate *unavailabilityLimitDate;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSDate *v16;
  NSDate *v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  void *unavailabilityReason;
  NSString *v23;
  NSString *v24;
  dispatch_time_t v25;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  unavailabilityLimitDate = self->_unavailabilityLimitDate;
  if (!unavailabilityLimitDate)
    goto LABEL_8;
  -[NSDate timeIntervalSinceNow](unavailabilityLimitDate, "timeIntervalSinceNow");
  if (v9 < 0.0)
    -[CPLEngineScheduler _disableRetryAfterLocked](self, "_disableRetryAfterLocked");
  if (!self->_unavailabilityLimitDate)
  {
LABEL_8:
    -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancelCurrentSyncSession");

    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("CPLErrorRetryAfterDate"));
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject timeIntervalSinceNow](v10, "timeIntervalSinceNow");
      if (v14 <= 86400.0)
      {
        v16 = v10;
        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x1E0C99D68];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
    }
    objc_msgSend(v15, "dateWithTimeIntervalSinceNow:");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v17 = self->_unavailabilityLimitDate;
    self->_unavailabilityLimitDate = v16;

    -[CPLEngineScheduler _backOff](self, "_backOff");
    -[NSDate timeIntervalSinceNow](self->_unavailabilityLimitDate, "timeIntervalSinceNow");
    v19 = (uint64_t)fmax(v18, 2.0);
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v19;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Server will be unavailable for %llds", buf, 0xCu);
      }

    }
    if (v7)
    {
      v21 = (NSString *)v7;
      unavailabilityReason = self->_unavailabilityReason;
      self->_unavailabilityReason = v21;
    }
    else
    {
      objc_msgSend(v6, "userInfo");
      unavailabilityReason = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(unavailabilityReason, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterReason"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_unavailabilityReason;
      self->_unavailabilityReason = v23;

    }
    v25 = dispatch_walltime(0, 1000000000 * v19);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CPLEngineScheduler__noteServerIsUnavailableWithErrorLocked_reason___block_invoke;
    block[3] = &unk_1E60D65B8;
    block[4] = self;
    dispatch_after(v25, queue, block);
    goto LABEL_22;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Ignoring spurious server unavailability error", buf, 2u);
    }
LABEL_22:

  }
}

- (void)noteServerIsUnavailableWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLEngineScheduler_noteServerIsUnavailableWithError___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)noteServerMightBeAvailableNow
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CPLEngineScheduler_noteServerMightBeAvailableNow__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteContainerHasBeenWiped
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CPLEngineScheduler_noteContainerHasBeenWiped__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)noteNetworkStateDidChange
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CPLEngineScheduler_noteNetworkStateDidChange__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_updateLastSyncDateIfNecessaryLocked
{
  unint64_t pendingRequiredFirstState;
  CPLSyncSession *currentSession;
  unint64_t v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  uint8_t v9[16];

  if (self->_requiredFirstState >= self->_pendingRequiredFirstState)
    pendingRequiredFirstState = self->_pendingRequiredFirstState;
  else
    pendingRequiredFirstState = self->_requiredFirstState;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    v5 = -[CPLSyncSession requiredStateAtEndOfSyncSession](currentSession, "requiredStateAtEndOfSyncSession");
    if (pendingRequiredFirstState >= v5)
      pendingRequiredFirstState = v5;
  }
  if (pendingRequiredFirstState >= 0xC && self->_needsToUpdateLastSyncDate)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Updating last successful sync date", v9, 2u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateLastSuccessfullSyncDate:", v8);

    self->_needsToUpdateLastSyncDate = 0;
  }
}

- (void)noteSyncSession:(id)a3 stateWillBeAttempted:(unint64_t)a4
{
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  unint64_t v17;
  _QWORD block[4];
  id v19;

  v7 = a3;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__CPLEngineScheduler_noteSyncSession_stateWillBeAttempted___block_invoke;
  v14[3] = &unk_1E60D8AC8;
  v14[4] = self;
  v15 = v7;
  v16 = a2;
  v17 = a4;
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

- (void)_keepSessionInformation:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *lastSessionInformation;
  void *v7;
  NSArray *v8;
  NSArray *lastScopeIdentifiersExludedFromMingling;
  NSArray *v10;
  NSArray *lastScopeIdentifiersExcludedFromPushToTransport;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "popSessionInformation");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastSessionInformation = self->_lastSessionInformation;
  self->_lastSessionInformation = v5;

  objc_msgSend(v4, "scopeIdentifiersExcludedFromMingling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastScopeIdentifiersExludedFromMingling = self->_lastScopeIdentifiersExludedFromMingling;
  self->_lastScopeIdentifiersExludedFromMingling = v8;

  objc_msgSend(v4, "scopeIdentifiersExcludedFromPushToTransport");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lastScopeIdentifiersExcludedFromPushToTransport = self->_lastScopeIdentifiersExcludedFromPushToTransport;
  self->_lastScopeIdentifiersExcludedFromPushToTransport = v10;

}

- (void)noteSyncSessionSucceeded:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__CPLEngineScheduler_noteSyncSessionSucceeded___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (void)_handleResetClientCacheWithError:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  objc_msgSend(a3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("CPLErrorResetReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a2;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke;
  v18[3] = &unk_1E60DD810;
  v18[4] = self;
  v19 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60D8AF0;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  v13 = v9;
  v14 = (id)objc_msgSend(v11, "performWriteTransactionWithBlock:completionHandler:", v18, v15);

}

- (void)_handleResetCloudCacheWithError:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  objc_msgSend(a3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("CPLErrorResetReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a2;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke;
  v18[3] = &unk_1E60DD810;
  v18[4] = self;
  v19 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60D8AF0;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  v13 = v9;
  v14 = (id)objc_msgSend(v11, "performWriteTransactionWithBlock:completionHandler:", v18, v15);

}

- (void)_handleResetAnchorWithError:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  SEL v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __CFString *v27;
  CPLEngineScheduler *v28;

  v7 = a4;
  objc_msgSend(a3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPLErrorResetReason"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("needs refresh");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPLErrorScopeIdentifiers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke;
  v24[3] = &unk_1E60DBED0;
  v25 = v13;
  v26 = v15;
  v27 = v12;
  v28 = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_85;
  v21[3] = &unk_1E60D8AF0;
  v22 = v7;
  v23 = a2;
  v21[4] = self;
  v16 = v7;
  v17 = v12;
  v18 = v15;
  v19 = v13;
  v20 = (id)objc_msgSend(v18, "performWriteTransactionWithBlock:completionHandler:", v24, v21);

}

- (void)_handleResetGlobalAnchorWithError:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD v22[4];
  id v23;
  __CFString *v24;

  v7 = a4;
  objc_msgSend(a3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPLErrorResetReason"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("needs refresh");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = a2;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke;
  v22[3] = &unk_1E60DD810;
  v23 = v14;
  v24 = v12;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_88;
  v19[3] = &unk_1E60D8AF0;
  v19[4] = self;
  v20 = v7;
  v15 = v7;
  v16 = v12;
  v17 = v14;
  v18 = (id)objc_msgSend(v17, "performWriteTransactionWithBlock:completionHandler:", v22, v19);

}

- (void)_noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  unint64_t v22;
  _QWORD block[4];
  id v24;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke;
  v18[3] = &unk_1E60D8B38;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v21 = a2;
  v22 = a4;
  v13 = v18;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v10;
  v16 = v9;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

- (void)noteSyncSession:(id)a3 failedDuringPhase:(unint64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CPLEngineScheduler *v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "isCPLOperationDeferredError")
    && objc_msgSend(v8, "shouldConsiderRequestingMoreTime"))
  {
    -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__CPLEngineScheduler_noteSyncSession_failedDuringPhase_withError___block_invoke;
    v14[3] = &unk_1E60D8B60;
    v15 = v11;
    v16 = v8;
    v17 = self;
    v19 = a4;
    v18 = v9;
    v12 = v11;
    v13 = (id)objc_msgSend(v12, "performReadTransactionWithBlock:", v14);

  }
  else
  {
    -[CPLEngineScheduler _noteSyncSession:failedDuringPhase:withError:](self, "_noteSyncSession:failedDuringPhase:withError:", v8, a4, v9);
  }

}

- (void)noteQuotaHasChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke;
  v9[3] = &unk_1E60DDB58;
  v6 = v4;
  v10 = v6;
  v11 = v12;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_3;
  v8[3] = &unk_1E60DDB58;
  v8[4] = self;
  v8[5] = v12;
  v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

  _Block_object_dispose(v12, 8);
}

- (void)resetBackoffInterval
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineScheduler_resetBackoffInterval__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (CPLSyncSessionConfiguration)configuration
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  objc_msgSend(WeakRetained, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPLSyncSessionConfiguration *)v3;
}

- (void)getCurrentRequiredStateWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
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
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CPLEngineScheduler_getCurrentRequiredStateWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60DB970;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CPLEngineScheduler platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60D7330;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "openWithCompletionHandler:", v7);

}

- (void)_prepareFirstSession
{
  NSDate *v3;
  NSDate *preparingFirstSessionStartDate;
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_preparingFirstSessionStartDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
    self->_preparingFirstSessionStartDate = v3;

    -[CPLEngineScheduler platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke;
    v6[3] = &unk_1E60D8BA0;
    v6[4] = self;
    objc_msgSend(v5, "schedulePersistedSyncSessionIfAvailableWithCompletionHandler:", v6);

  }
}

- (void)_stopPreparingFirstSession
{
  NSDate *preparingFirstSessionStartDate;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
  if (preparingFirstSessionStartDate)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring normal first sync session because it has been superseded", v6, 2u);
      }

      preparingFirstSessionStartDate = self->_preparingFirstSessionStartDate;
    }
    self->_preparingFirstSessionStartDate = 0;

    -[CPLEngineScheduler platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unschedulePersistedSyncSession");

  }
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD block[4];
  id v17;

  v6 = a4;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CPLEngineScheduler_closeAndDeactivate_completionHandler___block_invoke;
  v13[3] = &unk_1E60DC058;
  v15 = a3;
  v13[4] = self;
  v14 = v6;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = queue;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (id)componentName
{
  void *v2;
  void *v3;

  -[CPLEngineScheduler platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  OS_dispatch_queue *queue;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[4];
  void *v17;
  _QWORD v18[5];
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E60D8BC8;
  v20[4] = self;
  v6 = v4;
  v21 = v6;
  v7 = (void *)MEMORY[0x1B5E08DC4](v20);
  -[CPLEngineScheduler platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E60D8BF0;
    v18[4] = self;
    v19 = v7;
    v9 = v7;
    objc_msgSend(v8, "getStatusWithCompletionHandler:", v18);
    v10 = v19;
  }
  else
  {
    queue = self->_queue;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_5;
    v16[3] = &unk_1E60D71F8;
    v17 = v7;
    v12 = v16;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6369;
    block[3] = &unk_1E60D71F8;
    v23 = v12;
    v13 = queue;
    v14 = v7;
    v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  OS_dispatch_queue *queue;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[4];
  void *v17;
  _QWORD v18[5];
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E60D8C18;
  v20[4] = self;
  v6 = v4;
  v21 = v6;
  v7 = (void *)MEMORY[0x1B5E08DC4](v20);
  -[CPLEngineScheduler platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E60D8C40;
    v18[4] = self;
    v19 = v7;
    v9 = v7;
    objc_msgSend(v8, "getStatusDictionaryWithCompletionHandler:", v18);
    v10 = v19;
  }
  else
  {
    queue = self->_queue;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_5;
    v16[3] = &unk_1E60D71F8;
    v17 = v7;
    v12 = v16;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6369;
    block[3] = &unk_1E60D71F8;
    v23 = v12;
    v13 = queue;
    v14 = v7;
    v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

- (id)_pathToFirstSynchronizationMarker
{
  void *v2;
  void *v3;
  void *v4;

  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientLibraryBaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("lastsyncafterlaunch.plist"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_writeFirstSynchronizationMarker
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  self->_didWriteFirstSyncMarker = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("date");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScheduler _pathToFirstSynchronizationMarker](self, "_pathToFirstSynchronizationMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToURL:atomically:", v5, 1);

}

- (id)_minimalDateForFirstSync
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[CPLEngineScheduler _pathToFirstSynchronizationMarker](self, "_pathToFirstSynchronizationMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:", v4);

  if (v5)
    self->_didWriteFirstSyncMarker = 1;
  objc_msgSend(v5, "objectForKey:", CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "timeIntervalSinceNow"), v7 <= 0.0))
  {
    if (!v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "dateByAddingTimeInterval:", 600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (void)_resetFirstSynchronizationMarker
{
  void *v3;
  void *v4;

  if (self->_didWriteFirstSyncMarker)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineScheduler _pathToFirstSynchronizationMarker](self, "_pathToFirstSynchronizationMarker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

    self->_didWriteFirstSyncMarker = 0;
  }
}

- (unint64_t)requiredState
{
  dispatch_block_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *queue;
  unint64_t v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_215_6372);
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, &__block_literal_global_216);
  -[CPLEngineScheduler engineLibrary](self, "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__CPLEngineScheduler_requiredState__block_invoke_3;
  v17[3] = &unk_1E60D8CA8;
  v18 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v17);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 14;
  queue = self->_queue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __35__CPLEngineScheduler_requiredState__block_invoke_4;
  block[3] = &unk_1E60D64C8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)hasAScheduledSyncSession
{
  CPLEngineScheduler *v2;
  dispatch_block_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *queue;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[4];
  id v17;

  v2 = self;
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_217);
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, &__block_literal_global_218);
  -[CPLEngineScheduler engineLibrary](v2, "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_3;
  v16[3] = &unk_1E60D8CA8;
  v17 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v5, "performReadTransactionWithBlock:", v16);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = v2->_queue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_4;
  block[3] = &unk_1E60D64C8;
  block[4] = v2;
  block[5] = &v12;
  dispatch_sync(queue, block);
  LOBYTE(v2) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v2;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  _QWORD *v12;
  NSObject *v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("server-unavailable")))
  {
    v10 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__CPLEngineScheduler_testKey_value_completionHandler___block_invoke;
    v15[3] = &unk_1E60D70C8;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v12 = v15;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6369;
    block[3] = &unk_1E60D71F8;
    v19 = v12;
    v13 = queue;
    v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v13, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
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

- (CPLSyncSessionPredictor)predictor
{
  return self->_predictor;
}

- (id)requiredStateObserverBlock
{
  return self->_requiredStateObserverBlock;
}

- (void)setRequiredStateObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)shouldBackOffOnErrorBlock
{
  return self->_shouldBackOffOnErrorBlock;
}

- (void)setShouldBackOffOnErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldBackOffOnErrorBlock, 0);
  objc_storeStrong(&self->_requiredStateObserverBlock, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong(&self->_syncObserver, 0);
  objc_storeStrong((id *)&self->_lastScopeIdentifiersExludedFromMingling, 0);
  objc_storeStrong((id *)&self->_lastScopeIdentifiersExcludedFromPushToTransport, 0);
  objc_storeStrong((id *)&self->_lastSessionInformation, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulSyncSessionDate, 0);
  objc_storeStrong((id *)&self->_deferDate, 0);
  objc_storeStrong((id *)&self->_lastSyncSessionDateCausedByForeground, 0);
  objc_storeStrong((id *)&self->_blockingLock, 0);
  objc_storeStrong((id *)&self->_unblockOnceElements, 0);
  objc_storeStrong((id *)&self->_blockWaiters, 0);
  objc_storeStrong((id *)&self->_blockedElements, 0);
  objc_storeStrong((id *)&self->_blockingElements, 0);
  objc_storeStrong((id *)&self->_disablingReasons, 0);
  objc_storeStrong((id *)&self->_unavailabilityReason, 0);
  objc_storeStrong((id *)&self->_unavailabilityLimitDate, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proposedScheduleDate, 0);
  objc_storeStrong((id *)&self->_nextSession, 0);
  objc_storeStrong((id *)&self->_preparingFirstSessionStartDate, 0);
}

uint64_t __54__CPLEngineScheduler_testKey_value_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  +[CPLErrors unknownError](CPLErrors, "unknownError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_noteServerIsUnavailableWithErrorLocked:reason:", v3, a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__CPLEngineScheduler_hasAScheduledSyncSession__block_invoke_4(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 48))
    v2 = *(_QWORD *)(v1 + 104) != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __35__CPLEngineScheduler_requiredState__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35__CPLEngineScheduler_requiredState__block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v17;

  v15 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 120) || objc_msgSend(*(id *)(v4 + 144), "count"))
  {
    v5 = CFSTR("disabled");
LABEL_4:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("state"));
    goto LABEL_5;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 80) <= 0xDuLL)
  {
    v5 = CFSTR("syncing");
    goto LABEL_4;
  }
  if (*(_QWORD *)(v9 + 16) > 0xDuLL)
  {
    v5 = CFSTR("quiet");
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("scheduler"), CFSTR("state"));
  +[CPLEngineSyncManager descriptionForState:](CPLEngineSyncManager, "descriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requiredState"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "expectedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "timeIntervalSinceNow");
  objc_msgSend(v11, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("date"));

  if (!v12)
LABEL_5:
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E60D6F88;
  block[4] = v6;
  v8 = v3;
  v17 = v8;
  dispatch_sync(v7, block);
  if (v15)
    objc_msgSend(v8, "addEntriesFromDictionary:", v15);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E60DB970;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__CPLEngineScheduler_getStatusDictionaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allKeys", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(v2, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, CFSTR("blocking"));

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, CFSTR("blocked"));

    }
  }
}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  const __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id WeakRetained;
  char v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _QWORD block[5];
  id v77;

  v75 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  if (!v4)
  {
    v9 = *(void **)(v3 + 120);
    if (v9)
    {
      v10 = *(double *)(v3 + 128);
      v11 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v9, "timeIntervalSinceNow");
      v13 = fmax(v12, 0.0);
      if (v10 == 0.0)
      {
        v71 = v13;
        v14 = CFSTR("Synchronization is disabled because server is unavailable for %.0fs");
      }
      else
      {
        v72 = v13;
        v71 = v10;
        v14 = CFSTR("Synchronization is disabled - %@ (for %.0fs)");
      }
      objc_msgSend(v11, "stringWithFormat:", v14, *(_QWORD *)&v71, *(_QWORD *)&v72);
LABEL_17:
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v17 = objc_msgSend(*(id *)(v3 + 144), "count");
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(v18 + 16);
    if (v17)
    {
      v20 = (void *)MEMORY[0x1E0CB37A0];
      if (v19 > 0xD)
      {
        objc_msgSend(*(id *)(v18 + 144), "allObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("Synchronization is disabled because of: %@"), v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Needs to start a sync session from %@ but synchronization is disabled because of: %@"), v7, v22, v73, v74);
    }
    else
    {
      if (v19 > 0xD)
      {
        if (*(_QWORD *)(v18 + 80) <= 0xDuLL)
        {
          v40 = (void *)MEMORY[0x1E0CB37A0];
          v41 = *(_QWORD *)(v18 + 104);
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("Currently in %@ %@"), v41, v7);
          goto LABEL_4;
        }
        objc_msgSend((id)v18, "engineLibrary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "store");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isClientInSyncWithClientCache");

        if ((v44 & 1) != 0)
          v15 = CFSTR("No action is required. No sync session is scheduled");
        else
          v15 = CFSTR("Waiting for client to push or pull at least one batch. No sync session is scheduled");
        goto LABEL_9;
      }
      v23 = *(_QWORD *)(v18 + 48);
      if (!v23)
      {
        if (*(_QWORD *)(v18 + 80) > 0xDuLL)
        {
          objc_msgSend((id)v18, "engineLibrary");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "systemMonitor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "isNetworkConnected");

          if (!v57)
          {
            v63 = (void *)MEMORY[0x1E0CB37A0];
            +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringWithFormat:", CFSTR("Needs to start a sync session from %@, at least, but network is unreachable"), v7, *(_QWORD *)&v72);
            goto LABEL_4;
          }
          v58 = *(_QWORD *)(a1 + 32);
          if (*(_QWORD *)(v58 + 16) >= 7uLL)
          {
            objc_msgSend((id)v58, "engineLibrary");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "store");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isClientInSyncWithClientCache");

            v58 = *(_QWORD *)(a1 + 32);
            if ((v61 & 1) == 0)
            {
              v69 = (void *)MEMORY[0x1E0CB37A0];
              +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(v58 + 16));
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringWithFormat:", CFSTR("Needs to start a sync session from %@, at least, waiting for client to push or pull at least one batch"), v7, *(_QWORD *)&v72);
              goto LABEL_4;
            }
          }
          v62 = *(_QWORD *)(v58 + 104);
          if (!v62)
          {
            v64 = *(_QWORD *)(v58 + 16);
            if (v64 == 8)
            {
              WeakRetained = objc_loadWeakRetained((id *)(v58 + 280));
              v66 = objc_msgSend(WeakRetained, "isExceedingQuota");

              v67 = *(_QWORD *)(a1 + 32);
              if ((v66 & 1) != 0)
              {
                v68 = (void *)MEMORY[0x1E0CB37A0];
                +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(v67 + 16));
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "stringWithFormat:", CFSTR("Needs to start a sync session from %@, at least, but user is over-quota"), v7, *(_QWORD *)&v72);
                goto LABEL_4;
              }
              v64 = *(_QWORD *)(v67 + 16);
            }
            v70 = (void *)MEMORY[0x1E0CB37A0];
            +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", v64);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "stringWithFormat:", CFSTR("Needs to start a sync session from %@, at least, but there is no session scheduled yet"), v7, *(_QWORD *)&v72);
            goto LABEL_4;
          }
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ just started"), v62, *(_QWORD *)&v72);
          goto LABEL_17;
        }
        v45 = (void *)MEMORY[0x1E0CB37A0];
        v46 = *(_QWORD *)(v18 + 104);
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("Currently in %@ - %@ (required phase is %@)"), v46, v47, v48);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "currentSessionInformation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "count"))
          goto LABEL_25;
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\t"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("\nCurrent session info:\n\t%@"), v21);
LABEL_24:

        goto LABEL_25;
      }
      v24 = *(_QWORD *)(v18 + 216);
      if (v24)
      {
        v25 = (void *)MEMORY[0x1E0CB37A0];
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v24, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ has been deferred %@ (will resume from %@)"), v23, v26, v27);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      objc_msgSend(*(id *)(v18 + 48), "expectedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x1E0CB37A0];
      v50 = *(_QWORD *)(a1 + 32);
      v51 = *(_QWORD *)(v50 + 48);
      +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(v50 + 16));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "whenItWillStartDescription");
      v52 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v52;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 226))
        v53 = CFSTR(", delayed because of fast relaunch");
      else
        v53 = &stru_1E60DF6B8;
      if (v7)
      {
        +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", v7);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("Will start %@ from %@, at least, %@%@ (%@)"), v51, v21, v22, v53, v54);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      objc_msgSend(v49, "stringWithFormat:", CFSTR("Will start %@ from %@, at least, %@%@"), v51, v21, v52, v53);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_24;
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 >= -1.0)
  {
    v15 = CFSTR("Preparing first sync session");
LABEL_9:
    v16 = -[__CFString mutableCopy](v15, "mutableCopy");
LABEL_18:
    v8 = (void *)v16;
    goto LABEL_26;
  }
  v6 = (void *)MEMORY[0x1E0CB37A0];
  +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Preparing first sync session (started %@)"), v7, *(_QWORD *)&v72);
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
  v28 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v28 + 88) <= 0xDuLL)
  {
    +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", 11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" - should also rewind to %@ once %@ is done"), v29, v30);

    v28 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v28 + 104))
    v31 = CFSTR("current");
  else
    v31 = CFSTR("next");
  objc_msgSend(*(id *)(v28 + 288), "currentPrediction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\nPrediction for %@ session: %@"), v31, v32);

  if (v75)
    objc_msgSend(v8, "appendFormat:", CFSTR("\n%@"), v75);
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(NSObject **)(v33 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E60D6F88;
  block[4] = v33;
  v35 = v8;
  v77 = v35;
  dispatch_sync(v34, block);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "componentsJoinedByString:", CFSTR("\n\t"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\nLast session info:\n\t%@"), v36);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "componentsJoinedByString:", CFSTR(", "));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\nScopes excluded from push-to-transport: %@"), v37);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "componentsJoinedByString:", CFSTR(", "));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\nScopes excluded from mingling: %@"), v38);

  }
  v39 = *(_QWORD **)(a1 + 32);
  if (v39[25])
  {
    objc_msgSend(v35, "appendString:", CFSTR("\nMingling is disabled: waiting for client to finish pushing everything before starting pulling changes"));
    v39 = *(_QWORD **)(a1 + 32);
  }
  if (v39[17])
  {
    objc_msgSend(v35, "appendString:", CFSTR("\nRunning in foreground mode"));
    v39 = *(_QWORD **)(a1 + 32);
  }
  if (v39[24])
    objc_msgSend(v35, "appendString:", CFSTR("\nSignificant work in progress"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E60DB970;
  v12 = v3;
  v13 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__CPLEngineScheduler_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v2, "count"))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v2, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("\nBlocking elements: %@"), v10);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("\nBlocked elements: %@"), v13);

    }
  }
}

void __59__CPLEngineScheduler_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeAndDeactivate:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), CFSTR("CPLSyncSessionBlockedStateDidChangeNotification"), 0);

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 264);
    *(_QWORD *)(v4 + 264) = 0;

  }
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2;
  v11[3] = &unk_1E60D6F88;
  v11[4] = v4;
  v12 = v3;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (*(_QWORD *)(v2 + 8))
  {
    objc_storeStrong((id *)(v2 + 48), v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 48);
    if (v5)
      v6 = _CPLSilentLogging == 0;
    else
      v6 = 0;
    if (v6)
    {
      __CPLSchedulerOSLogDomain_6445();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v26 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Found persisted %{public}@", buf, 0xCu);
      }

      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v4 + 48);
    }
    if (v5 && objc_msgSend(*(id *)(v4 + 144), "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "allObjects");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v11;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Unscheduling persisted sync session. Reasons: %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_unscheduleNextSyncSession");
    }
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "store");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isClientInSyncWithClientCache"))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 8);
      *(_QWORD *)(v14 + 8) = 0;

      v16 = *(_QWORD **)(a1 + 32);
      if (v16[6])
      {
        v16[2] = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLSchedulerOSLogDomain_6445();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Scheduler is ready, requesting a full session soon", buf, 2u);
          }

          v16 = *(_QWORD **)(a1 + 32);
        }
        v16[7] = 0x4014000000000000;
        objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 1, 0);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_111;
      v22[3] = &unk_1E60DD810;
      v13 = v13;
      v19 = *(_QWORD *)(a1 + 32);
      v23 = v13;
      v24 = v19;
      v20 = (id)objc_msgSend(v13, "performReadTransactionWithBlock:", v22);

    }
  }
  else
  {
    if (!v3)
      return;
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring persisted sync session %@", buf, 0xCu);
      }

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "platformObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unscheduleSyncSession:", *(_QWORD *)(a1 + 40));
  }

}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_111(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[8];
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "cleanupTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasCleanupTasks"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Store has clean tasks to do, requesting a full session soon", buf, 2u);
      }

    }
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 72);
    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_112;
    v19[3] = &unk_1E60D65B8;
    v19[4] = v4;
    v7 = v19;
    *(_QWORD *)buf = v6;
    v21 = 3221225472;
    v22 = __cpl_dispatch_async_block_invoke_6369;
    v23 = &unk_1E60D71F8;
    v24 = v7;
    v8 = v5;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v8, v9);

  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v10 + 72);
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2_113;
    v17[3] = &unk_1E60D6F88;
    v17[4] = v10;
    v18 = v11;
    v14 = v17;
    *(_QWORD *)buf = v13;
    v21 = 3221225472;
    v22 = __cpl_dispatch_async_block_invoke_6369;
    v23 = &unk_1E60D71F8;
    v24 = v14;
    v15 = v12;
    v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v15, v16);

  }
}

uint64_t __42__CPLEngineScheduler__prepareFirstSession__block_invoke_112(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 8) = 0;

    v4 = *(_QWORD **)(v3 + 32);
    if (v4[6])
    {
      objc_msgSend(v4, "_unscheduleNextSyncSession");
      v4 = *(_QWORD **)(v3 + 32);
    }
    v4[7] = 0x4014000000000000;
    result = objc_msgSend(*(id *)(v3 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 2, 0);
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 56) = 0x3FB99999A0000000;
  }
  return result;
}

void __42__CPLEngineScheduler__prepareFirstSession__block_invoke_2_113(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = 0;

    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Client is not in sync with client cache. Waiting before dispatching the first sync session", v5, 2u);
      }

    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isClientInSyncWithClientCache") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "_unscheduleNextSyncSession");
    }
  }
}

void __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 72);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E60D70C8;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v17 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

uint64_t __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 112) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 280));
  v4 = objc_msgSend(WeakRetained, "containerHasBeenWiped");

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unschedulePersistedSyncSession");

    objc_msgSend(*(id *)(a1 + 40), "_disableSynchronizationBecauseContainerHasBeenWipedLocked");
  }
  else
  {
    objc_msgSend(v5, "_prepareFirstSession");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E60DB108;
  v11[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("CPLSyncSessionBlockedStateDidChangeNotification"), 0, 0, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 264);
  *(_QWORD *)(v9 + 264) = v8;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E60D6F88;
  v11[4] = v4;
  v12 = v3;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6369;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __48__CPLEngineScheduler_openWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2
      || (v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104)) != 0
      && (v12 = v2,
          objc_msgSend(v3, "rescheduler"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v2 = v12,
          v4 == v12))
    {
      v13 = v2;
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isBlocked"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("syncRequested"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
      objc_msgSend(WeakRetained, "updateBlockedMetrics:syncRequested:", v7, v10);

      v2 = v13;
    }

  }
}

uint64_t __67__CPLEngineScheduler_getCurrentRequiredStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __42__CPLEngineScheduler_resetBackoffInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  NSObject *v4;
  uint8_t v5[16];

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 120))
  {
    objc_msgSend(*(id *)(result + 120), "timeIntervalSinceNow");
    result = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)result, "_disableRetryAfterLocked");
      result = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(double *)(result + 56) > 0.100000001)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Resetting back-off interval", v5, 2u);
      }

      result = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(result + 56) = 0x3FB99999A0000000;
  }
  return result;
}

void __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_2;
  v6[3] = &unk_1E60DD7C0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  __int128 buf;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_10;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v10 = *(void **)(v8 + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_107;
    v13[3] = &unk_1E60D65B8;
    v13[4] = v8;
    v11 = v13;
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v15 = __cpl_dispatch_async_block_invoke_6369;
    v16 = &unk_1E60D71F8;
    v17 = v11;
    v5 = v10;
    v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v5, v12);

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject libraryIsCorrupted](v5, "libraryIsCorrupted") & 1) != 0)
    goto LABEL_9;
  v6 = objc_msgSend(v3, "isLibraryClosed");

  if ((v6 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Quota change transaction error: %@", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_107(uint64_t a1)
{
  void *v2;
  double v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v3 < 0.0)
      objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Quota has changed and some scopes were marked as being over quota. Requesting to push", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 7, 0);
}

uint64_t __41__CPLEngineScheduler_noteQuotaHasChanged__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "enumeratorForScopesIncludeInactive:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v18 = a2;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(v4, "flagsForScope:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "valueForFlag:", 2) & 1) != 0)
          {
            objc_msgSend(v12, "setValue:forFlag:", 0, 2);
            v19 = v8;
            v13 = objc_msgSend(v4, "updateFlags:forScope:error:", v12, v11, &v19);
            v14 = v19;

            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            {

              if (!v13)
                goto LABEL_17;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "pushRepository");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v15, "isEmpty") ^ 1;

              if ((v13 & 1) == 0)
              {
LABEL_17:

                if (v18)
                {
                  v14 = objc_retainAutorelease(v14);
                  v16 = 0;
                  *v18 = v14;
                }
                else
                {
                  v16 = 0;
                }
                goto LABEL_22;
              }
            }
            v8 = v14;
          }
          else
          {

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v16 = 1;
  v14 = v8;
LABEL_22:

  return v16;
}

uint64_t __66__CPLEngineScheduler_noteSyncSession_failedDuringPhase_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "syncSessionShouldRequestMoreTime"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 40);
        v5 = 138412290;
        v6 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%@ has been deferred and should request more time", (uint8_t *)&v5, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "noteSyncSessionInformation:", CFSTR("Session should likely have requested more time to avoid deferral"));
    objc_msgSend(*(id *)(a1 + 40), "setShouldHaveRequestedMoreTime:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_noteSyncSession:failedDuringPhase:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id WeakRetained;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  int v31;
  _BOOL4 v32;
  int v33;
  void *v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t);
  void *v95;
  id v96;
  id v97;
  NSObject *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  NSObject *v102;
  _QWORD v103[4];
  id v104;
  id v105;
  NSObject *v106;
  _QWORD v107[4];
  id v108;
  id v109;
  NSObject *v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  NSObject *v114;
  __int16 v115;
  uint64_t v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) == *(_QWORD *)(a1 + 40))
  {
    v2 = *(id *)(a1 + 48);
    if (!-[NSObject isCPLOperationDeferredError](v2, "isCPLOperationDeferredError"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
      goto LABEL_32;
    }
    v6 = objc_msgSend(*(id *)(a1 + 40), "shouldConsiderRequestingMoreTime");
    v7 = *(void **)(a1 + 40);
    if (v6)
    {
      if (objc_msgSend(v7, "shouldRequestMoreTime"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLSchedulerOSLogDomain_6445();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v112 = v9;
            _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "%@ has been deferred again and should request even more time", buf, 0xCu);
          }

        }
        v10 = *(void **)(a1 + 40);
        v11 = CFSTR("Session should likely request even more time to avoid more deferrals");
      }
      else
      {
        v16 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(v16 + 42))
        {
          if (_CPLSilentLogging)
          {
            v13 = 1;
            goto LABEL_28;
          }
          __CPLSchedulerOSLogDomain_6445();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v112 = v43;
            _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_DEFAULT, "%@ has been deferred and should request more time if deferred again", buf, 0xCu);
          }

          v13 = 1;
LABEL_27:
          v16 = *(_QWORD *)(a1 + 32);
LABEL_28:
          *(_BYTE *)(v16 + 42) = v13;
          v19 = objc_msgSend(*(id *)(a1 + 40), "shouldHaveRequestedMoreTime");
          v20 = *(_QWORD *)(a1 + 32);
          if (v19)
          {
            *(_BYTE *)(v20 + 41) = 1;
            +[CPLErrors cplErrorWithCode:underlyingError:description:](CPLErrors, "cplErrorWithCode:underlyingError:description:", 258, v2, CFSTR("Sync session should have requested more time"));
            v21 = objc_claimAutoreleasedReturnValue();

            v2 = v21;
          }
          else
          {
            *(_BYTE *)(v20 + 41) = 0;
            objc_msgSend(*(id *)(a1 + 40), "setShouldRequestMoreTime:", 0);
          }
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
          objc_msgSend(WeakRetained, "updateBlockedMetrics:syncRequested:", 1, 0);

LABEL_32:
          objc_msgSend(*(id *)(a1 + 32), "_keepSessionInformation:", *(_QWORD *)(a1 + 40));
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(v23 + 232);
          *(_QWORD *)(v23 + 232) = 0;

          v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
          objc_msgSend(v25, "reportUnsuccessfulSync");

          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 14;
          if (!_CPLSilentLogging)
          {
            __CPLSchedulerOSLogDomain_6445();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(a1 + 64));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v112 = v27;
              v113 = 2112;
              v114 = v2;
              _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEBUG, "Sync session failed %@: %@", buf, 0x16u);

            }
          }
          v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
          objc_msgSend(v28, "systemMonitor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "updateDiskPressureState");

          if (!-[NSObject isCPLError](v2, "isCPLError"))
          {
            v31 = 0;
            v32 = 1;
LABEL_42:
            v33 = 1;
            goto LABEL_105;
          }
          v30 = -[NSObject code](v2, "code");
          v31 = 0;
          v32 = 1;
          if (v30 <= 256)
          {
            if (v30 <= 39)
            {
              v33 = 1;
              switch(v30)
              {
                case 18:
                  v31 = 0;
                  v32 = (unint64_t)(*(_QWORD *)(a1 + 64) - 9) < 0xFFFFFFFFFFFFFFFELL;
                  goto LABEL_105;
                case 19:
                case 23:
                  goto LABEL_105;
                case 20:
                  v107[0] = MEMORY[0x1E0C809B0];
                  v107[1] = 3221225472;
                  v107[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_95;
                  v107[3] = &unk_1E60D6EC0;
                  v44 = *(void **)(a1 + 40);
                  v108 = *(id *)(a1 + 32);
                  v109 = v44;
                  v110 = v2;
                  objc_msgSend(v108, "_handleResetClientCacheWithError:completionHandler:", v110, v107);
                  v45 = *(_QWORD *)(a1 + 32);
                  v46 = *(void **)(v45 + 104);
                  *(_QWORD *)(v45 + 104) = 0;

                  v47 = v109;
                  goto LABEL_101;
                case 21:
                  v92 = MEMORY[0x1E0C809B0];
                  v93 = 3221225472;
                  v94 = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_2;
                  v95 = &unk_1E60D6EC0;
                  v48 = *(void **)(a1 + 40);
                  v96 = *(id *)(a1 + 32);
                  v97 = v48;
                  v98 = v2;
                  objc_msgSend(v96, "_handleResetCloudCacheWithError:completionHandler:", v98, &v92);
                  v49 = *(_QWORD *)(a1 + 32);
                  v50 = *(void **)(v49 + 104);
                  *(_QWORD *)(v49 + 104) = 0;

                  v47 = v97;
                  goto LABEL_101;
                case 22:
                  if (*(_QWORD *)(a1 + 64) == 4)
                  {
                    if (!_CPLSilentLogging)
                    {
                      __CPLSchedulerOSLogDomain_6445();
                      v51 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B03C2000, v51, OS_LOG_TYPE_DEFAULT, "Glboal sync anchor expired, will pull all scopes from the beginning", buf, 2u);
                      }

                    }
                    v103[0] = MEMORY[0x1E0C809B0];
                    v103[1] = 3221225472;
                    v103[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_96;
                    v103[3] = &unk_1E60D6EC0;
                    v52 = *(void **)(a1 + 40);
                    v104 = *(id *)(a1 + 32);
                    v105 = v52;
                    v106 = v2;
                    objc_msgSend(v104, "_handleResetGlobalAnchorWithError:completionHandler:", v106, v103);
                    v53 = *(_QWORD *)(a1 + 32);
                    v54 = *(void **)(v53 + 104);
                    *(_QWORD *)(v53 + 104) = 0;

                    goto LABEL_104;
                  }
                  if (!_CPLSilentLogging)
                  {
                    __CPLSchedulerOSLogDomain_6445();
                    v71 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B03C2000, v71, OS_LOG_TYPE_DEFAULT, "Sync anchor expired, we can't trust the cloud cache anymore", buf, 2u);
                    }

                  }
                  v99[0] = MEMORY[0x1E0C809B0];
                  v99[1] = 3221225472;
                  v99[2] = __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_97;
                  v99[3] = &unk_1E60D6EC0;
                  v72 = *(void **)(a1 + 40);
                  v100 = *(id *)(a1 + 32);
                  v101 = v72;
                  v102 = v2;
                  objc_msgSend(v100, "_handleResetCloudCacheWithError:completionHandler:", v102, v99);
                  v73 = *(_QWORD *)(a1 + 32);
                  v74 = *(void **)(v73 + 104);
                  *(_QWORD *)(v73 + 104) = 0;

                  v47 = v101;
LABEL_101:

                  v33 = 0;
                  v31 = 1;
                  break;
                case 24:
                  objc_msgSend(*(id *)(a1 + 32), "_handleResetAnchorWithError:completionHandler:", v2, &__block_literal_global_98);
                  goto LABEL_104;
                default:
                  goto LABEL_42;
              }
              goto LABEL_105;
            }
            if (v30 != 40 && v30 != 41)
            {
              v33 = 1;
              if (v30 != 82)
                goto LABEL_105;
LABEL_93:
              objc_msgSend(*(id *)(a1 + 32), "platformObject");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), v2);

              v63 = *(_QWORD *)(a1 + 32);
              v64 = *(void **)(v63 + 104);
              *(_QWORD *)(v63 + 104) = 0;

              goto LABEL_94;
            }
            v32 = 0;
            v31 = 0;
            goto LABEL_42;
          }
          if (v30 <= 999)
          {
            if (v30 == 257)
            {
              objc_msgSend(*(id *)(a1 + 32), "platformObject");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), v2);

              objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(a1 + 32) + 104));
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v66 = objc_claimAutoreleasedReturnValue();
              v67 = *(_QWORD *)(a1 + 32);
              v68 = *(void **)(v67 + 216);
              *(_QWORD *)(v67 + 216) = v66;

              v69 = *(_QWORD *)(a1 + 32);
              v70 = *(void **)(v69 + 104);
              *(_QWORD *)(v69 + 104) = 0;

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dropExpectedDate");
LABEL_94:
              v31 = 0;
              v33 = 0;
              goto LABEL_105;
            }
            v33 = 1;
            if (v30 != 258)
            {
LABEL_105:
              v75 = *(_QWORD *)(a1 + 32);
              v76 = *(_QWORD *)(v75 + 88);
              v77 = *(_QWORD *)(v75 + 16);
              if (v76 >= v77)
                v78 = v77;
              else
                v78 = v76;
              v79 = objc_msgSend(*(id *)(a1 + 40), "requiredStateAtEndOfSyncSession", v92, v93, v94, v95, v96);
              if (v78 >= v79)
                v80 = v79;
              else
                v80 = v78;
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v80;
              if (v33)
              {
                objc_msgSend(*(id *)(a1 + 32), "platformObject");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), v2);

                v82 = *(_QWORD *)(a1 + 32);
                v83 = *(void **)(v82 + 104);
                *(_QWORD *)(v82 + 104) = 0;

                v84 = *(_QWORD *)(a1 + 32);
                if (*(_QWORD *)(v84 + 24) == *(_QWORD *)(v84 + 32) && (v85 = *(_QWORD *)(a1 + 64), v85 <= 0xD))
                {
                  if (v32)
                  {
                    objc_msgSend((id)v84, "_backOff");
                    v84 = *(_QWORD *)(a1 + 32);
                  }
                  v86 = *(_QWORD *)(v84 + 304);
                  if (v86)
                  {
                    if (*(double *)(v84 + 56) > 5.0)
                    {
                      v87 = (*(uint64_t (**)(_QWORD))(v86 + 16))(*(_QWORD *)(v84 + 304));
                      v84 = *(_QWORD *)(a1 + 32);
                      if ((v87 & 1) == 0)
                      {
                        v88 = *(_QWORD *)(v84 + 296);
                        v85 = 14;
                        if (v88)
                        {
                          (*(void (**)(_QWORD, uint64_t))(v88 + 16))(*(_QWORD *)(v84 + 296), 14);
                          v84 = *(_QWORD *)(a1 + 32);
                        }
                      }
                    }
                  }
                  objc_msgSend((id)v84, "_noteSyncSessionNeededFromState:proposedScheduleDate:", v85, 0);
                }
                else
                {
                  if (v32)
                  {
                    objc_msgSend((id)v84, "_backOff");
                    v84 = *(_QWORD *)(a1 + 32);
                  }
                  v89 = *(_QWORD *)(v84 + 304);
                  if (v89)
                  {
                    if (*(double *)(v84 + 56) > 5.0)
                    {
                      v90 = (*(uint64_t (**)(_QWORD))(v89 + 16))(*(_QWORD *)(v84 + 304));
                      v84 = *(_QWORD *)(a1 + 32);
                      if ((v90 & 1) == 0)
                      {
                        v91 = *(_QWORD *)(v84 + 296);
                        if (v91)
                        {
                          (*(void (**)(_QWORD, uint64_t))(v91 + 16))(*(_QWORD *)(v84 + 296), 14);
                          v84 = *(_QWORD *)(a1 + 32);
                        }
                        objc_msgSend((id)v84, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 14, 0);
                        v84 = *(_QWORD *)(a1 + 32);
                      }
                    }
                  }
                  objc_msgSend((id)v84, "_scheduleNextSyncSession");
                }
                objc_msgSend(*(id *)(a1 + 40), "noteClientNeedsToPullIfNecessary");
              }
              else if (v31)
              {
                objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 14, 0);
              }
              objc_msgSend(*(id *)(a1 + 32), "_updateOverridingForeground");
              goto LABEL_135;
            }
            if (_CPLSilentLogging)
            {
LABEL_66:
              v32 = 0;
LABEL_104:
              v31 = 0;
              goto LABEL_105;
            }
            __CPLSchedulerOSLogDomain_6445();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
LABEL_65:

              goto LABEL_66;
            }
            v38 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v112 = v38;
            v39 = "%@ has been deferred and should have requested more time - retrying immediately";
            v40 = v37;
            v41 = 12;
          }
          else
          {
            v33 = 1;
            switch(v30)
            {
              case 1000:
                v34 = *(void **)(a1 + 32);
                v35 = v2;
                v36 = 0;
                goto LABEL_92;
              case 1001:
                v55 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
                objc_msgSend(v55, "setICloudLibraryClientVersionTooOld:", 1);

                v34 = *(void **)(a1 + 32);
                v36 = CFSTR("client is too old");
                goto LABEL_91;
              case 1002:
              case 1003:
              case 1005:
              case 1006:
              case 1007:
              case 1008:
                goto LABEL_105;
              case 1004:
                if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) >= *(_QWORD *)(a1 + 64))
                {
                  -[NSObject userInfo](v2, "userInfo");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterDate"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v57 && (objc_msgSend(v57, "timeIntervalSinceNow"), v59 = fmin(v58, 86400.0), v59 > 5.0))
                  {
                    v32 = 0;
                    *(double *)(*(_QWORD *)(a1 + 32) + 56) = v59;
                  }
                  else
                  {
                    v32 = 1;
                  }

                }
                goto LABEL_104;
              case 1009:
                if (!_CPLSilentLogging)
                {
                  __CPLSchedulerOSLogDomain_6445();
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B03C2000, v60, OS_LOG_TYPE_ERROR, "Encryption keys are invalid - disabling synchronization temporarily", buf, 2u);
                  }

                }
                v34 = *(void **)(a1 + 32);
                v36 = CFSTR("encryption keys are invalid");
                goto LABEL_91;
              case 1010:
                if (!_CPLSilentLogging)
                {
                  __CPLSchedulerOSLogDomain_6445();
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B03C2000, v61, OS_LOG_TYPE_DEFAULT, "Encryption keys are not available yet - disabling synchronization temporarily", buf, 2u);
                  }

                }
                v34 = *(void **)(a1 + 32);
                v36 = CFSTR("waiting for encryption keys");
LABEL_91:
                v35 = v2;
LABEL_92:
                objc_msgSend(v34, "_noteServerIsUnavailableWithErrorLocked:reason:", v35, v36);
                goto LABEL_93;
              default:
                v33 = 1;
                if (v30 != 10000)
                  goto LABEL_105;
                if (_CPLSilentLogging)
                  goto LABEL_66;
                __CPLSchedulerOSLogDomain_6445();
                v37 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_65;
                *(_WORD *)buf = 0;
                v39 = "Scheduler has been asked to retry sync session immediately";
                v40 = v37;
                v41 = 2;
                break;
            }
          }
          _os_log_impl(&dword_1B03C2000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
          goto LABEL_65;
        }
        if (!_CPLSilentLogging)
        {
          __CPLSchedulerOSLogDomain_6445();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v112 = v18;
            _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "%@ has been deferred twice in a row and should request more time", buf, 0xCu);
          }

        }
        v10 = *(void **)(a1 + 40);
        v11 = CFSTR("Session should likely request more time to avoid more deferrals");
      }
      objc_msgSend(v10, "noteSyncSessionInformation:", v11);
      objc_msgSend(*(id *)(a1 + 40), "setShouldHaveRequestedMoreTime:", 1);
    }
    else
    {
      v12 = objc_msgSend(v7, "shouldHaveRequestedMoreTime");
      v13 = 0;
      if ((v12 & 1) != 0 || _CPLSilentLogging)
        goto LABEL_27;
      __CPLSchedulerOSLogDomain_6445();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v112 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "%@ has been deferred for external reasons", buf, 0xCu);
      }

    }
    v13 = 0;
    goto LABEL_27;
  }
  if (_CPLSilentLogging)
    return;
  __CPLSchedulerOSLogDomain_6445();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(NSObject **)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    *(_DWORD *)buf = 138412802;
    v112 = v3;
    v113 = 2114;
    v114 = v4;
    v115 = 2114;
    v116 = v5;
    _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%@: ignoring %{public}@ - current session is %{public}@", buf, 0x20u);

  }
LABEL_135:

}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_95(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_96(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_97(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__CPLEngineScheduler__noteSyncSession_failedDuringPhase_withError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteSyncSession:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "do:", v4);

}

void __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_88(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "libraryIsCorrupted") & 1) != 0)
    {

    }
    else
    {
      v5 = objc_msgSend(v10, "isLibraryClosed");

      if ((v5 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 48);
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 1481, CFSTR("Store is in a very bad state."));

        abort();
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __74__CPLEngineScheduler__handleResetGlobalAnchorWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v8[16];

  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Resetting global sync anchor", v8, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "storeScopeListSyncAnchor:error:", 0, a2);

  if ((_DWORD)v6)
    objc_msgSend(*(id *)(a1 + 32), "noteOtherResetEvent:cause:", CFSTR("globalAnchor"), *(_QWORD *)(a1 + 40));
  return v6;
}

void __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60DDA58;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v10 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "libraryIsCorrupted") & 1) != 0)
    {

    }
    else
    {
      v5 = objc_msgSend(v10, "isLibraryClosed");

      if ((v5 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 48);
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 1457, CFSTR("Store is in a very bad state."));

        abort();
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__CPLEngineScheduler__handleResetAnchorWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v23 = v16;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "Reset sync anchor for all scopes with reason '%{public}@'", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "resetSyncAnchorWithCause:error:", *(_QWORD *)(a1 + 48), a2);
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 40), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  v7 = v6 == 0;
  if (!v6)
  {
LABEL_25:

    goto LABEL_26;
  }
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v5);
      objc_msgSend(v4, "scopeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if ((objc_msgSend(v4, "resetSyncAnchorForScope:error:", v12, a2) & 1) == 0)
        {

          goto LABEL_25;
        }
        ++v9;
      }

    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
      continue;
    break;
  }

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v23 = v9;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Reset sync anchor for %lu scopes of %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "noteOtherResetEvent:cause:", CFSTR("anchor"), *(_QWORD *)(a1 + 48));
  }
  v7 = 1;
LABEL_26:

  return v7;
}

void __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "do:", v4);

}

void __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "syncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetTransportUserIdentifier");

    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "libraryIsCorrupted") & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_msgSend(v12, "isLibraryClosed");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, v10, 1410, CFSTR("Store is in a very bad state."));

    abort();
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__CPLEngineScheduler__handleResetCloudCacheWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
    v7 = *(const __CFString **)(a1 + 40);
  else
    v7 = CFSTR("cloud cache invalid");
  v8 = objc_msgSend(v5, "resetCompleteSyncStateWithCause:error:", v7, a2);

  return v8;
}

void __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "do:", v4);

}

void __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "libraryIsCorrupted") & 1) != 0)
    {

    }
    else
    {
      v5 = objc_msgSend(v10, "isLibraryClosed");

      if ((v5 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 48);
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 1392, CFSTR("Store is in a very bad state."));

        abort();
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__CPLEngineScheduler__handleResetClientCacheWithError_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
    v7 = *(const __CFString **)(a1 + 40);
  else
    v7 = CFSTR("Client cache invalid");
  v8 = objc_msgSend(v5, "resetLocalSyncStateWithCause:error:", v7, a2);

  return v8;
}

void __47__CPLEngineScheduler_noteSyncSessionSucceeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v3 == v2)
  {
    if (objc_msgSend(v3, "shouldRequestMoreTime"))
      v8 = _CPLSilentLogging == 0;
    else
      v8 = 0;
    if (v8)
    {
      __CPLSchedulerOSLogDomain_6445();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)(a1 + 40);
        v34 = 138412290;
        v35 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%@ with extended running time succeeded", (uint8_t *)&v34, 0xCu);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_keepSessionInformation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 232);
    *(_QWORD *)(v12 + 232) = v11;

    objc_msgSend(*(id *)(a1 + 32), "_resetFirstSynchronizationMarker");
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject requestAttachedLibrary](v4, "requestAttachedLibrary");
    -[NSObject systemMonitor](v4, "systemMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateDiskPressureState");

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 120);
    *(_QWORD *)(v15 + 120) = 0;

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 128);
    *(_QWORD *)(v17 + 128) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 14;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    v19 = *(_QWORD **)(a1 + 32);
    if (v19[4] == v19[3])
    {
      objc_msgSend(v19, "platformObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "noteSyncSessionSucceeded:", *(_QWORD *)(a1 + 40));

      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 104);
      *(_QWORD *)(v21 + 104) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_setRequiredFirstState:", 14);
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(a1 + 40);
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v24;
          v36 = 2114;
          v37 = v25;
          _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ did succeed but we were asked to do %{public}@ meanwhile. Restarting immediately", (uint8_t *)&v34, 0x16u);

        }
        v19 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v19, "_startRequiredSyncSession:", *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(*(id *)(a1 + 40), "noteClientNeedsToPullIfNecessary");
    v26 = objc_msgSend(*(id *)(a1 + 40), "requiredStateAtEndOfSyncSession");
    v27 = v26;
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(v28 + 88);
    if (v29 == 14 && v26 <= 0xD)
    {
      v30 = objc_msgSend(*(id *)(a1 + 40), "shouldRescheduleASyncSession");
      v31 = *(void **)(a1 + 32);
      if (v30)
      {
        objc_msgSend(*(id *)(a1 + 40), "proposedRescheduleDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_noteSyncSessionNeededFromState:proposedScheduleDate:", v27, v32);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_setRequiredFirstState:", v27);
      }
    }
    else
    {
      if (v29 >= v26)
        v29 = v26;
      *(_QWORD *)(v28 + 88) = v29;
    }
    v33 = *(_QWORD **)(a1 + 32);
    if (v33[11] <= 0xDuLL)
    {
      objc_msgSend(v33, "_noteSyncSessionNeededFromState:proposedScheduleDate:");
      v33 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v33, "_updateLastSyncDateIfNecessaryLocked");
    objc_msgSend(*(id *)(a1 + 32), "_updateOverridingForeground");
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v34 = 138412802;
      v35 = v5;
      v36 = 2114;
      v37 = v6;
      v38 = 2114;
      v39 = v7;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@: ignoring %{public}@ - current session is %{public}@", (uint8_t *)&v34, 0x20u);

    }
  }

}

void __59__CPLEngineScheduler_noteSyncSession_stateWillBeAttempted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 104) != *(_QWORD *)(a1 + 40))
  {
    if (_CPLSilentLogging)
      return;
    __CPLSchedulerOSLogDomain_6445();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v20 = 138412802;
      v21 = v4;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@: ignoring %@ - current session is %@", (uint8_t *)&v20, 0x20u);

    }
    goto LABEL_5;
  }
  if (*(_QWORD *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 120), "timeIntervalSinceNow");
    v2 = *(_QWORD *)(a1 + 32);
    if (v7 < 0.0)
    {
      objc_msgSend((id)v2, "_disableRetryAfterLocked");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(v2 + 88) <= 0xDuLL && *(_QWORD *)(a1 + 56) >= 0xCuLL)
  {
    objc_msgSend((id)v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:");
    return;
  }
  v8 = *(_QWORD *)(v2 + 80);
  if (v8 <= *(_QWORD *)(v2 + 16) && *(_QWORD *)(a1 + 56) > v8 && *(_QWORD *)(v2 + 24) == *(_QWORD *)(v2 + 32))
  {
    objc_msgSend((id)v2, "_setRequiredFirstState:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_updateLastSyncDateIfNecessaryLocked");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 232);
  *(_QWORD *)(v10 + 232) = v9;

  v12 = *(_QWORD *)(a1 + 56);
  if (v12 > 0xD)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 40);
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(a1 + 56));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2114;
        v23 = v19;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has reached %{public}@", (uint8_t *)&v20, 0x16u);

      }
LABEL_5:

    }
  }
  else
  {
    v13 = *(_QWORD **)(a1 + 32);
    v14 = v13[4];
    if (v13[3] < v14 && v12 <= v13[2])
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(a1 + 56));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v16;
          v22 = 2112;
          v23 = v17;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEBUG, "Sync manager is attempting %@ so we don't need to schedule %@", (uint8_t *)&v20, 0x16u);

        }
        v13 = *(_QWORD **)(a1 + 32);
        v14 = v13[4];
      }
      v13[3] = v14;
    }
  }
}

_QWORD *__47__CPLEngineScheduler_noteNetworkStateDidChange__block_invoke(uint64_t a1)
{
  _QWORD *result;
  NSObject *v3;
  uint8_t v4[16];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  result = *(_QWORD **)(a1 + 32);
  if (result[2] <= 0xDuLL && result[10] == 14 && !result[6] && !result[13])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Notified that network state did change. Attempting to relaunch a sync session", v4, 2u);
      }

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_scheduleNextSyncSession");
  }
  return result;
}

uint64_t __47__CPLEngineScheduler_noteContainerHasBeenWiped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableSynchronizationBecauseContainerHasBeenWipedLocked");
}

uint64_t __51__CPLEngineScheduler_noteServerMightBeAvailableNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
}

uint64_t __55__CPLEngineScheduler_noteServerIsUnavailableWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteServerIsUnavailableWithErrorLocked:reason:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __69__CPLEngineScheduler__noteServerIsUnavailableWithErrorLocked_reason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "End of server unavailability reached", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
}

void __63__CPLEngineScheduler_isSynchronizationDisabledWithReasonError___block_invoke(_QWORD *a1)
{
  id *v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = (id *)a1[4];
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = (id *)a1[4];
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = (id *)a1[4];
    }
  }
  if (v2[15])
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v4 = a1[4];
    if (*(_QWORD *)(v4 + 128))
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 1000, CFSTR("%@"), *(_QWORD *)(v4 + 128), v13);
    }
    else
    {
      objc_msgSend(*(id *)(v4 + 120), "timeIntervalSinceNow");
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 1000, CFSTR("Server is unavailable for %.0fs (%@)"), fmax(v9, 0.0), *(_QWORD *)(a1[4] + 120));
    }
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2[18], "count") != 0;
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(*(id *)(a1[4] + 144), "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 256, CFSTR("Synchronization is disabled because of: %@"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
}

uint64_t __39__CPLEngineScheduler_isMinglingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 200) == 0;
  return result;
}

_QWORD *__36__CPLEngineScheduler_enableMingling__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  _QWORD *result;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 120), "timeIntervalSinceNow");
    v2 = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)v2, "_disableRetryAfterLocked");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v4 = *(_QWORD *)(v2 + 200);
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, v12, 1128, CFSTR("%@ has been called too many times"), v13);

    abort();
  }
  *(_QWORD *)(v2 + 200) = v4 - 1;
  result = *(_QWORD **)(a1 + 32);
  if (!result[25])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Reenabling mingling", buf, 2u);
      }

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 10, 0);
  }
  return result;
}

void __37__CPLEngineScheduler_disableMingling__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  _QWORD *v4;
  NSObject *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 120), "timeIntervalSinceNow");
    v2 = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)v2, "_disableRetryAfterLocked");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  ++*(_QWORD *)(v2 + 200);
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[25] == 1)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Disabling mingling", v10, 2u);
      }

      v4 = *(_QWORD **)(a1 + 32);
    }
    v6 = v4[10];
    if (v6 >= 0xA && v6 != 14)
    {
      objc_msgSend(v4, "engineLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "syncManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelCurrentSyncSession");

    }
  }
}

void __55__CPLEngineScheduler_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 192);
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, v13, 1103, CFSTR("%@ has been called too many times"), v14);

    abort();
  }
  *(_QWORD *)(v2 + 192) = v3 - 1;
  v4 = *(_QWORD **)(a1 + 32);
  if (!v4[24])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Informing transport of significant work ending", buf, 2u);
      }

      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteClientIsEndingSignificantWork");

  }
}

void __58__CPLEngineScheduler_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[24] == 1)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Informing transport of significant work beginning", v6, 2u);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteClientIsBeginningSignificantWork");

  }
}

void __47__CPLEngineScheduler_unblockEngineElementOnce___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObject:", *(_QWORD *)(a1 + 40));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "signal");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __62__CPLEngineScheduler_waitForEngineElementToBeBlocked_timeout___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        v4 = objc_msgSend(*(id *)(a1[4] + 176), "containsObject:", a1[5]),
        v3,
        (v4 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 168), "removeObject:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "unlock");
      v7 = *(_QWORD *)(a1[7] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

    }
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = a1[5];
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Still waiting for %@ to be blocked", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3530]);
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(a1[4] + 168), "addObject:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "lock");
  }
}

void __43__CPLEngineScheduler_willRunEngineElement___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 152), "containsObject:", a1[5]);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24)
    && objc_msgSend(*(id *)(a1[4] + 176), "containsObject:", a1[5]))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = a1[5];
        *(_DWORD *)buf = 138412290;
        v26 = v3;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking engine once for %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1[4] + 176), "removeObject:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (v4)
    {
      if (_CPLSilentLogging)
        return;
      __CPLSchedulerOSLogDomain_6445();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = a1[5];
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Still blocked on %@", buf, 0xCu);
      }
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3530]);
      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "lock");
      objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", v5, a1[5]);
      }
      -[NSObject addObject:](v5, "addObject:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
      if (objc_msgSend(*(id *)(a1[4] + 168), "count") && !_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(*(id *)(a1[4] + 168), "count");
          v14 = a1[5];
          *(_DWORD *)buf = 134218242;
          v26 = v13;
          v27 = 2112;
          v28 = v14;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Informing %lu waiters that %@ is blocked", buf, 0x16u);
        }

      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v15 = *(id *)(a1[4] + 168);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "signal", (_QWORD)v20);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v17);
      }

    }
  }
  else
  {
    if (!v4)
      return;
    objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v5, "removeObject:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    if (!-[NSObject count](v5, "count"))
      objc_msgSend(*(id *)(a1[4] + 160), "removeObjectForKey:", a1[5]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "unlock");
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void __43__CPLEngineScheduler_unblockEngineElement___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countForObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countForObject:", *(_QWORD *)(a1 + 40)))
    {
      if (_CPLSilentLogging)
        return;
      __CPLSchedulerOSLogDomain_6445();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(void **)(a1 + 40);
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countForObject:", v3);
        *(_DWORD *)buf = 138412546;
        v19 = v3;
        v20 = 2048;
        v21 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking '%@' but it is still blocked by %lu clients.", buf, 0x16u);
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v19 = v8;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Unblocking '%@'.", buf, 0xCu);
        }

      }
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v2);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "signal");
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }
    }
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLSchedulerOSLogDomain_6445();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "%@ has been called too many times with element '%@'", buf, 0x16u);

    }
  }

}

void __41__CPLEngineScheduler_blockEngineElement___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "validElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countForObject:", *(_QWORD *)(a1 + 40)))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_QWORD *)(a1 + 40);
          v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countForObject:", v5);
          *(_DWORD *)v13 = 138412546;
          *(_QWORD *)&v13[4] = v5;
          *(_WORD *)&v13[12] = 2048;
          *(_QWORD *)&v13[14] = v6 + 1;
          v7 = "Blocking '%@' (%lu clients).";
          v8 = v4;
          v9 = 22;
LABEL_13:
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = v12;
        v7 = "Blocking '%@'.";
        v8 = v4;
        v9 = 12;
        goto LABEL_13;
      }
LABEL_14:

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", *(_QWORD *)(a1 + 40), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
    return;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)&v13[4] = v11;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "'%@' is an invalid element to block", v13, 0xCu);
    }

  }
}

void __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  if (*(_BYTE *)(a1 + 56)
    && (v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104)) != 0
    && (objc_msgSend(v2, "shouldDefer") & 1) == 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "activityState") == 2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10001, CFSTR("%@ is already actively running"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_disableSynchronizationWithReasonLocked:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke_2;
    v10[3] = &unk_1E60D70C8;
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v5, "cancelAndBlockAllSyncSessionsWithReason:block:", v7, v10);

  }
}

void __73__CPLEngineScheduler_blockAllSyncSessionsWithReason_onlyIfBlocked_block___block_invoke_2(_QWORD *a1)
{
  CPLEngineSchedulerBlocker *v2;

  v2 = -[CPLEngineSchedulerBlocker initWithReason:scheduler:]([CPLEngineSchedulerBlocker alloc], "initWithReason:scheduler:", a1[4], a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __54__CPLEngineScheduler_enableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_enableSynchronizationWithReasonLocked:", *(_QWORD *)(a1 + 40));
}

void __82__CPLEngineScheduler_disableSynchronizationIfBlockedWithReason_completionHandler___block_invoke(_QWORD *a1)
{
  id *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;

  v2 = (id *)a1[4];
  if (v2[13]
    && (v3 = objc_msgSend(v2[13], "shouldDefer"), v2 = (id *)a1[4], (v3 & 1) == 0)
    && (v4 = objc_msgSend(v2[13], "activityState"), v2 = (id *)a1[4], v4 == 2))
  {
    v5 = a1[6];
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10001, CFSTR("%@ is already actively running"), v2[13]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

  }
  else
  {
    if (v2[15])
    {
      objc_msgSend(v2[15], "timeIntervalSinceNow");
      v2 = (id *)a1[4];
      if (v6 < 0.0)
      {
        objc_msgSend(v2, "_disableRetryAfterLocked");
        v2 = (id *)a1[4];
      }
    }
    objc_msgSend(v2, "_disableSynchronizationWithReasonLocked:", a1[5]);
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __55__CPLEngineScheduler_disableSynchronizationWithReason___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_disableSynchronizationWithReasonLocked:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__CPLEngineScheduler_isClientInForeground__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136) != 0;
  return result;
}

uint64_t __46__CPLEngineScheduler_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 120))
  {
    objc_msgSend(*(id *)(result + 120), "timeIntervalSinceNow");
    result = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)result, "_disableRetryAfterLocked");
      result = *(_QWORD *)(a1 + 32);
    }
  }
  v4 = *(_QWORD *)(result + 136);
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineScheduler.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, v24, 808, CFSTR("%@ has been called too many times"), v25);

    abort();
  }
  *(_QWORD *)(result + 136) = v4 - 1;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 136))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 280));
    objc_msgSend(WeakRetained, "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSyncSessionShouldBeForeground:", 0);

    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v8, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v9, "engineLibrary:noteClientIsInForeground:", v10, 0);

    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v11, "transport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "noteClientIsInBackground");

    +[CPLSyncIndicator setForeground:](CPLSyncIndicator, "setForeground:", 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    v13 = *(_QWORD **)(a1 + 32);
    if (!v13[6] && v13[2] <= 0xDuLL && v13[10] == 14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
      {
        objc_msgSend(v14, "timeIntervalSinceDate:");
        if (v16 > 60.0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLSchedulerOSLogDomain_6445();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v27 = v18;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "All clients are now in background and we need a sync session, scheduling one now from at least %@", buf, 0xCu);

            }
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), v15);
          objc_msgSend(*(id *)(a1 + 32), "_scheduleNextSyncSession");
        }
      }

      v13 = *(_QWORD **)(a1 + 32);
    }
    return objc_msgSend(v13, "_updateOverridingForeground");
  }
  return result;
}

void __54__CPLEngineScheduler_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint32_t v29;
  double v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 120), "timeIntervalSinceNow");
    v2 = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)v2, "_disableRetryAfterLocked");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  ++*(_QWORD *)(v2 + 136);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 136) == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 280));
    objc_msgSend(WeakRetained, "syncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSyncSessionShouldBeForeground:", 1);

    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v8, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v9, "engineLibrary:noteClientIsInForeground:", v10, 1);

    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v11, "transport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "noteClientIsInForeground");

    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v13, "systemMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "canBoostOperations"))
    {
      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
      objc_msgSend(v15, "systemMonitor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "canBoostBackgroundOperations");

      v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
      objc_msgSend(v18, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cancelBlockedTasksIncludingBackground:", v17);

    }
    +[CPLSyncIndicator setForeground:](CPLSyncIndicator, "setForeground:", 1);

    v5 = *(_QWORD *)(a1 + 32);
  }
  v20 = objc_loadWeakRetained((id *)(v5 + 280));
  objc_msgSend(v20, "supervisor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40) || !v21)
  {
LABEL_12:
    if (v22)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v35 = 0;
          v24 = "Some client is in foreground but we have been asked not to trigger a sync session";
LABEL_26:
          v28 = v23;
          v29 = 2;
LABEL_27:
          _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEFAULT, v24, v35, v29);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
    v25 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v25 + 16) <= 0xDuLL && *(_QWORD *)(v25 + 80) <= 0xDuLL)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v35 = 138543362;
          *(_QWORD *)&v35[4] = v27;
          _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "Some client is in foreground, current required state is %{public}@", v35, 0xCu);

        }
        v25 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)v25, "_disableFastRelaunchProtection");
      goto LABEL_29;
    }
    if (*(_QWORD *)(v25 + 208))
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      if (v30 <= 60.0)
      {
        if (_CPLSilentLogging)
          goto LABEL_29;
        __CPLSchedulerOSLogDomain_6445();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
        *(_DWORD *)v35 = 134217984;
        *(_QWORD *)&v35[4] = v33;
        v24 = "Some client is in foreground but we already did a sync session for foreground clients %.0fs ago";
        goto LABEL_40;
      }
      v25 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v25 + 208), v4);
    v31 = *(_QWORD **)(a1 + 32);
    if (!v31[13])
    {
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Some client is in foreground. Scheduling a sync session soon", v35, 2u);
        }

        v31 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v31, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 2, 0);
      goto LABEL_29;
    }
    if (_CPLSilentLogging)
      goto LABEL_29;
    __CPLSchedulerOSLogDomain_6445();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    *(_DWORD *)v35 = 138543362;
    *(_QWORD *)&v35[4] = v32;
    v24 = "Some client is in foreground but we are already in %{public}@";
LABEL_40:
    v28 = v23;
    v29 = 12;
    goto LABEL_27;
  }
  if ((objc_msgSend(v21, "schedulerShouldStartSyncSessionMovingToForeground:currentSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) & 1) != 0)
  {
    v22 = *(unsigned __int8 *)(a1 + 40);
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      v24 = "Some client is in foreground but supervisor asked not to trigger a sync session";
      goto LABEL_26;
    }
LABEL_28:

  }
LABEL_29:
  objc_msgSend(*(id *)(a1 + 32), "_updateOverridingForeground", *(_OWORD *)v35);

}

uint64_t __53__CPLEngineScheduler_noteResourceDownloadQueueIsFull__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v3 < 0.0)
      objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Notified that Resource Download queue is full", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 13, 0);
}

void __42__CPLEngineScheduler_noteServerHasChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80) <= 0xDuLL
    && (objc_msgSend((id)v2, "platformObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldCoalesceServerChangesNotification"),
        v3,
        v2 = *(_QWORD *)(a1 + 32),
        v4))
  {
    *(_BYTE *)(v2 + 96) = 1;
    v5 = dispatch_time(0, 2000000000);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CPLEngineScheduler_noteServerHasChanges__block_invoke_2;
    block[3] = &unk_1E60D65B8;
    block[4] = v6;
    dispatch_after(v5, v7, block);
  }
  else
  {
    objc_msgSend((id)v2, "_reallyNoteServerHasChangesLocked");
  }
}

_BYTE *__42__CPLEngineScheduler_noteServerHasChanges__block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[96])
    return (_BYTE *)objc_msgSend(result, "_reallyNoteServerHasChangesLocked");
  return result;
}

void __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke_2;
  v3[3] = &unk_1E60DD6D0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "do:", v3);

}

uint64_t __55__CPLEngineScheduler__reallyNoteServerHasChangesLocked__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "setAllScopesHasChangesToPullFromTransportWithError:", a2);

  return v4;
}

_QWORD *__58__CPLEngineScheduler_noteClientIsNotInSyncWithClientCache__block_invoke(uint64_t a1)
{
  _QWORD *result;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (result[10] <= 0xDuLL)
  {
    if (_CPLSilentLogging)
      goto LABEL_14;
    __CPLSchedulerOSLogDomain_6445();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    v9 = 138543362;
    v10 = v4;
    v5 = "Stopping %{public}@ until client is in sync with the engine";
    v6 = v3;
    v7 = 12;
    goto LABEL_12;
  }
  if (result[2] <= 0xDuLL && _CPLSilentLogging == 0)
  {
    __CPLSchedulerOSLogDomain_6445();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      result = *(_QWORD **)(a1 + 32);
      goto LABEL_14;
    }
    LOWORD(v9) = 0;
    v5 = "Unscheduling sync session until client is in sync with the engine";
    v6 = v3;
    v7 = 2;
LABEL_12:
    _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, v7);
    goto LABEL_13;
  }
LABEL_14:
  if (result[2] >= 7uLL)
    return (_QWORD *)objc_msgSend(result, "_unscheduleNextSyncSession");
  return result;
}

uint64_t __55__CPLEngineScheduler_noteClientIsInSyncWithClientCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 120), "timeIntervalSinceNow");
    v2 = *(_QWORD *)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend((id)v2, "_disableRetryAfterLocked");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(v2 + 56) = 0x3FB99999A0000000;
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Notified that we need to perform an initial sync now that the client is in sync with the engine", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 8, 0);
}

void __43__CPLEngineScheduler_noteClientNeedsToPull__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "scopes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasStagedSyncAnchors"))
  {

LABEL_7:
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain_6445();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[5], "store");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pullQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 134217984;
        v10 = objc_msgSend(v8, "countOfQueuedBatches");
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "There is %lu batches in the pull queue and staged sync anchors. Notifying who might be interested", (uint8_t *)&v9, 0xCu);

      }
    }
    objc_msgSend(a1[5], "notifyAttachedObjectsPullQueueIsFull");
    objc_msgSend(a1[6], "platformObject");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject noteClientNeedsToPull](v5, "noteClientNeedsToPull");
    goto LABEL_12;
  }
  objc_msgSend(a1[4], "pullQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");

  if ((v4 & 1) == 0)
    goto LABEL_7;
  if (_CPLSilentLogging)
    return;
  __CPLSchedulerOSLogDomain_6445();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "There is no changes in the pull queue and no staged sync anchors", (uint8_t *)&v9, 2u);
  }
LABEL_12:

}

uint64_t __56__CPLEngineScheduler_noteScopeNeedsToUploadComputeState__block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 12, 0);
}

void __55__CPLEngineScheduler_noteScopeNeedsToPullFromTransport__block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  id v4;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 10, 0);
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteServerHasChanges");

}

void __69__CPLEngineScheduler_noteScopeNeedsToPushToTransportWithChangeTypes___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  NSObject *v4;
  double v5;
  void *v6;
  uint8_t v7[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v3 < 0.0)
      objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Client has put some changes in push repository", v7, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_disableFastRelaunchProtection");
  v5 = 60.0;
  if (*(_QWORD *)(a1 + 40) != 32)
    v5 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:minimumDelay:", 8, v5);
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteScopeNeedsToPushToTransport");

}

void __65__CPLEngineScheduler_noteScopeNeedsToPushHighPriorityToTransport__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v3 < 0.0)
      objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Client has put some high priority changes in push repository", v6, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_disableFastRelaunchProtection");
  objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 7, 0);
  objc_msgSend(*(id *)(a1 + 32), "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteScopeNeedsToPushToTransport");

}

uint64_t __42__CPLEngineScheduler_noteScopeNeedsUpdate__block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 5, 0);
}

uint64_t __46__CPLEngineScheduler_noteScopeListNeedsUpdate__block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 4, 0);
}

uint64_t __46__CPLEngineScheduler_noteTransportNeedsUpdate__block_invoke(uint64_t a1)
{
  id *v2;
  double v3;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "timeIntervalSinceNow");
    v2 = *(id **)(a1 + 32);
    if (v3 < 0.0)
    {
      objc_msgSend(v2, "_disableRetryAfterLocked");
      v2 = *(id **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_noteSyncSessionNeededFromState:proposedScheduleDate:", 3, 0);
}

uint64_t __43__CPLEngineScheduler_noteStoreNeedsCleanup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16) >= 3uLL && _CPLSilentLogging == 0)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Will need to cleanup database before next sync session", v6, 2u);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 56) = 0x3FB99999A0000000;
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 2, 0);
}

uint64_t __60__CPLEngineScheduler_noteStoreNeedsToUpdateDisabledFeatures__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2] >= 2uLL && _CPLSilentLogging == 0)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Will need to update disabled features before next sync session", v8, 2u);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDisabledFeaturesUpdate");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 1, 0);
}

uint64_t __41__CPLEngineScheduler_noteStoreNeedsSetup__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2] >= 2uLL && _CPLSilentLogging == 0)
  {
    __CPLSchedulerOSLogDomain_6445();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Will need to setup engine before next sync session", v8, 2u);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discardTransportUserIdentifier");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 1, 0);
}

uint64_t __40__CPLEngineScheduler_kickOffSyncSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  uint8_t v11[16];

  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain_6445();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Forcing a sync session right now", v11, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_resetFirstSynchronizationMarker");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 226) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 232);
  *(_QWORD *)(v7 + 232) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 48))
  {
    result = objc_msgSend(*(id *)(v9 + 48), "isInMoreThanTimeInverval:", *(double *)(v9 + 56));
    if (!(_DWORD)result)
      return result;
    v9 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v9, "_unscheduleNextSyncSession");
  return objc_msgSend(*(id *)(a1 + 32), "_noteSyncSessionNeededFromState:proposedScheduleDate:", 1, 0);
}

uint64_t __61__CPLEngineScheduler_forceStartSyncSession_withMinimalPhase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_resetFirstSynchronizationMarker");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 226) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0x3FB99999A0000000;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_unscheduleNextSyncSession");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 216);
  *(_QWORD *)(v8 + 216) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 16);
  v12 = *(_QWORD *)(a1 + 48);
  if (v11 > v12)
  {
    *(_QWORD *)(v10 + 16) = v12;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 16);
  }
  if (v11 <= 0xB)
  {
    *(_BYTE *)(v10 + 40) = 1;
    v10 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v10, "_startRequiredSyncSession:", *(_QWORD *)(a1 + 40));
}

void __50__CPLEngineScheduler_startRequiredSyncSessionNow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 112))
  {
    if (*(_QWORD *)(v2 + 48) == *(_QWORD *)(a1 + 40))
    {
      v3 = *(void **)(v2 + 120);
      if (v3)
      {
        objc_msgSend(v3, "timeIntervalSinceNow");
        if (v4 < 0.0)
          objc_msgSend(*(id *)(a1 + 32), "_disableRetryAfterLocked");
      }
      if (!_CPLSilentLogging)
      {
        __CPLSchedulerOSLogDomain_6445();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v6 = *(_QWORD *)(a1 + 40);
          +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v10 = v6;
          v11 = 2112;
          v12 = v7;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "It's time to start %@ from %@", buf, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_startRequiredSyncSession:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend((id)v2, "platformObject");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "noteSyncSessionSucceeded:", *(_QWORD *)(a1 + 40));

    }
  }
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

+ (id)validElements
{
  if (validElements_onceToken != -1)
    dispatch_once(&validElements_onceToken, &__block_literal_global_67);
  return (id)validElements_validElements;
}

void __35__CPLEngineScheduler_validElements__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", CPLEngineElementUpload, CPLEngineElementSuccessfulUpload, CPLEngineElementEndOfUpload, CPLEngineElementEndOfUploadHighPriority, CPLEngineElementMingling, CPLEngineElementPushSweetSpot, CPLEngineElementClientPullsBatch, CPLEngineElementPullSweetSpot, CPLEngineElementDownloadResource, CPLEngineElementDownloadResourcesInBackground, CPLEngineElementProcessStagedScopes, CPLEngineElementUploadComputeStates, CPLEngineElementStartForceSync, 0);
  v2 = (void *)validElements_validElements;
  validElements_validElements = v1;

}

@end
