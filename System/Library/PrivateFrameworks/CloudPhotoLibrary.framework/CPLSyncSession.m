@implementation CPLSyncSession

- (CPLSyncSession)initWithSequenceNumber:(unint64_t)a3 expectedDate:(id)a4 scheduler:(id)a5 configuration:(id)a6 scopeFilter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CPLSyncSession *v17;
  CPLSyncSession *v18;
  id WeakRetained;
  uint64_t v20;
  CPLSyncSessionPredictor *predictor;
  objc_super v23;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLSyncSession;
  v17 = -[CPLSyncSession init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    v17->_sequenceNumber = a3;
    objc_storeStrong((id *)&v17->_expectedDate, a4);
    objc_storeWeak((id *)&v18->_scheduler, v14);
    objc_storeStrong((id *)&v18->_scopeFilter, a7);
    WeakRetained = objc_loadWeakRetained((id *)&v18->_scheduler);
    objc_msgSend(WeakRetained, "predictor");
    v20 = objc_claimAutoreleasedReturnValue();
    predictor = v18->_predictor;
    v18->_predictor = (CPLSyncSessionPredictor *)v20;

    v18->_requiredStateAtEndOfSyncSession = 14;
    -[CPLSyncSession setupWithConfiguration:](v18, "setupWithConfiguration:", v15);
  }

  return v18;
}

- (NSString)description
{
  __CFString *v2;

  if (self->_sequenceNumber == -1)
    v2 = CFSTR("[detached session]");
  else
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[session #%lu]"), self->_sequenceNumber);
  return (NSString *)v2;
}

- (BOOL)isDetached
{
  return self->_sequenceNumber == -1;
}

- (BOOL)shouldBeDiscretionary
{
  return !-[CPLSyncSession isDetached](self, "isDetached");
}

- (BOOL)shouldDefer
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  CPLSyncSession *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1106;
  v17 = __Block_byref_object_dispose__1107;
  v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __29__CPLSyncSession_shouldDefer__block_invoke;
  v9 = &unk_1E60DD460;
  v10 = self;
  v11 = &v19;
  v12 = &v13;
  v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (void *)v14[5];
  if (v4)
    v5 = objc_msgSend(v4, "shouldDefer");
  else
    v5 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v5;
}

- (int64_t)activityState
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  CPLSyncSession *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1106;
  v17 = __Block_byref_object_dispose__1107;
  v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __31__CPLSyncSession_activityState__block_invoke;
  v9 = &unk_1E60DD460;
  v10 = self;
  v11 = &v19;
  v12 = &v13;
  v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (void *)v14[5];
  if (v4)
    v5 = objc_msgSend(v4, "activityState");
  else
    v5 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v5;
}

- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4 proposedRescheduleDate:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSDate *proposedRescheduleDate;
  NSDate *v11;
  NSDate *v12;
  void *v13;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (self->_requiredStateAtEndOfSyncSession > a3)
  {
    self->_requiredStateAtEndOfSyncSession = a3;
    if (v5)
    {
      self->_shouldRescheduleASyncSession = 1;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      proposedRescheduleDate = self->_proposedRescheduleDate;
      v13 = v9;
      if (proposedRescheduleDate)
      {
        -[NSDate earlierDate:](proposedRescheduleDate, "earlierDate:", v9);
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = v9;
      }
      v12 = self->_proposedRescheduleDate;
      self->_proposedRescheduleDate = v11;

      v9 = v13;
    }
  }

}

- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4
{
  -[CPLSyncSession requestSyncStateAtEndOfSyncSession:reschedule:proposedRescheduleDate:](self, "requestSyncStateAtEndOfSyncSession:reschedule:proposedRescheduleDate:", a3, a4, 0);
}

- (BOOL)isAfterDate:(id)a3
{
  id v5;
  NSDate *expectedDate;
  BOOL v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 148, CFSTR("%@ called on a detached sync session"), v13);

    abort();
  }
  expectedDate = self->_expectedDate;
  if (expectedDate)
    v7 = -[NSDate compare:](expectedDate, "compare:", v5) == NSOrderedDescending;
  else
    v7 = 1;

  return v7;
}

- (BOOL)isBeforeDate:(id)a3
{
  id v5;
  BOOL v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 158, CFSTR("%@ called on a detached sync session"), v12);

    abort();
  }
  v6 = -[CPLSyncSession isAfterDate:](self, "isAfterDate:", v5);

  return !v6;
}

- (BOOL)isInMoreThanTimeInverval:(double)a3
{
  NSDate *expectedDate;
  double v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 163, CFSTR("%@ called on a detached sync session"), v13);

    abort();
  }
  expectedDate = self->_expectedDate;
  if (!expectedDate)
    return 1;
  -[NSDate timeIntervalSinceNow](expectedDate, "timeIntervalSinceNow");
  return v7 > a3;
}

- (BOOL)isInLessThanTimeInterval:(double)a3
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 174, CFSTR("%@ called on a detached sync session"), v11);

    abort();
  }
  return !-[CPLSyncSession isInLessThanTimeInterval:](self, "isInLessThanTimeInterval:", a3);
}

- (void)dropExpectedDate
{
  NSDate *expectedDate;

  expectedDate = self->_expectedDate;
  self->_expectedDate = 0;

}

- (void)sessionWillStart
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  CPLSyncSession *v8;

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __34__CPLSyncSession_sessionWillStart__block_invoke;
  v7 = &unk_1E60D65B8;
  v8 = self;
  v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  if (self->_shouldRequestMoreTime)
    -[CPLSyncSession noteSyncSessionInformation:](self, "noteSyncSessionInformation:", CFSTR("Session will request more time"));
}

- (void)deferWithBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSDate *expectedDate;
  os_unfair_lock_s *p_lock;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  CPLSyncSession *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t);
  void *v18;
  CPLSyncSession *v19;
  id v20;
  uint8_t buf[4];
  CPLSyncSession *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 193, CFSTR("%@ called on a detached sync session"), v15);

    abort();
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Deferring %@", buf, 0xCu);
    }

  }
  expectedDate = self->_expectedDate;
  self->_expectedDate = 0;

  p_lock = &self->_lock;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __33__CPLSyncSession_deferWithBlock___block_invoke;
  v18 = &unk_1E60D6708;
  v19 = self;
  v9 = v5;
  v20 = v9;
  v10 = v16;
  os_unfair_lock_lock(p_lock);
  v17((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);

}

- (void)sessionIsDone
{
  NSObject *v3;
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint8_t buf[4];
  CPLSyncSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@ is done", buf, 0xCu);
    }

  }
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __31__CPLSyncSession_sessionIsDone__block_invoke;
  v8 = &unk_1E60D65B8;
  v9 = self;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

}

- (void)sessionWontHappen
{
  NSObject *v3;
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint8_t buf[4];
  CPLSyncSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@ won't happen", buf, 0xCu);
    }

  }
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __35__CPLSyncSession_sessionWontHappen__block_invoke;
  v8 = &unk_1E60D65B8;
  v9 = self;
  v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

}

- (void)engineIsClosing
{
  NSObject *v4;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  NSObject *v7;
  CPLSyncSession *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t);
  void *v14;
  CPLSyncSession *v15;
  uint8_t buf[4];
  CPLSyncSession *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v8 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 219, CFSTR("%@ called on a detached sync session"), v11);

    abort();
  }
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@ won't happen in this life: engine is closing", buf, 0xCu);
    }

  }
  p_lock = &self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __33__CPLSyncSession_engineIsClosing__block_invoke;
  v14 = &unk_1E60D65B8;
  v15 = self;
  v6 = v12;
  os_unfair_lock_lock(p_lock);
  v13((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);

}

- (NSString)whenItWillStartDescription
{
  NSDate *expectedDate;
  double v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[CPLSyncSession isDetached](self, "isDetached"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 228, CFSTR("%@ called on a detached sync session"), v14);

    abort();
  }
  expectedDate = self->_expectedDate;
  if (expectedDate)
  {
    -[NSDate timeIntervalSinceNow](expectedDate, "timeIntervalSinceNow");
    if (v5 <= 1.0)
    {
      if (v5 >= -1.0)
      {
        v8 = CFSTR("very soon");
        return (NSString *)v8;
      }
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("very soon (%.1fs overdue)"), -v5);
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("in %.1fs"), *(_QWORD *)&v5);
    }
    v8 = (__CFString *)v6;
  }
  else
  {
    -[CPLSyncSessionRescheduler goodConditionsDescription](self->_rescheduler, "goodConditionsDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("when conditions are good (%@)"), v7);
    else
      v8 = CFSTR("when conditions are good");

  }
  return (NSString *)v8;
}

- (void)_updatePrediction:(id)a3
{
  id v4;
  CPLSyncSessionRescheduler *rescheduler;
  CPLBackgroundActivity *detachedActivity;
  id v7;

  v4 = a3;
  rescheduler = self->_rescheduler;
  if (rescheduler)
  {
    v7 = v4;
    -[CPLSyncSessionRescheduler updateSyncSessionPrediction:](rescheduler, "updateSyncSessionPrediction:", v4);
LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  detachedActivity = self->_detachedActivity;
  if (detachedActivity)
  {
    v7 = v4;
    -[CPLBackgroundActivity updatePrediction:](detachedActivity, "updatePrediction:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_watchPredictor
{
  if (!self->_watchingPredictor)
  {
    -[CPLSyncSessionPredictor addObserver:](self->_predictor, "addObserver:", self);
    self->_watchingPredictor = 1;
  }
}

- (void)_unwatchPredictor
{
  if (self->_watchingPredictor)
  {
    -[CPLSyncSessionPredictor removeObserver:](self->_predictor, "removeObserver:", self);
    self->_watchingPredictor = 0;
  }
}

- (void)_watchOrUnwatchPredictorIfNecessary
{
  CPLSyncSessionRescheduler *rescheduler;
  id v4;

  rescheduler = self->_rescheduler;
  if (self->_watchingPredictor)
  {
    if (!rescheduler && !self->_detachedActivity)
      -[CPLSyncSession _unwatchPredictor](self, "_unwatchPredictor");
  }
  else if (rescheduler || self->_detachedActivity)
  {
    -[CPLSyncSession _watchPredictor](self, "_watchPredictor");
  }
  if (self->_watchingPredictor)
  {
    if (self->_detachedActivity)
    {
      -[CPLSyncSessionPredictor currentPrediction](self->_predictor, "currentPrediction");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[CPLSyncSession _updatePrediction:](self, "_updatePrediction:", v4);

    }
  }
}

- (CPLSyncSessionRescheduler)rescheduler
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1106;
  v15 = __Block_byref_object_dispose__1107;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __29__CPLSyncSession_rescheduler__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLSyncSessionRescheduler *)v4;
}

- (void)setRescheduler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLSyncSession *v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __33__CPLSyncSession_setRescheduler___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)needsToAcquireRescheduler
{
  BOOL v3;
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t);
  void *v9;
  CPLSyncSession *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  if (-[CPLSyncSession isDetached](self, "isDetached"))
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __43__CPLSyncSession_needsToAcquireRescheduler__block_invoke;
  v9 = &unk_1E60D64C8;
  v10 = self;
  v11 = &v12;
  v5 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  v3 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v3;
}

- (void)noteClientNeedsToPullIfNecessary
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  id WeakRetained;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __50__CPLSyncSession_noteClientNeedsToPullIfNecessary__block_invoke;
  v8 = &unk_1E60DC8A0;
  v9 = self;
  v10 = &v11;
  v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  if (*((_BYTE *)v12 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
    objc_msgSend(WeakRetained, "noteClientNeedsToPull");

  }
  _Block_object_dispose(&v11, 8);
}

- (void)resetNoteClientNeedsToPull
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  CPLSyncSession *v7;

  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __44__CPLSyncSession_resetNoteClientNeedsToPull__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_lock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

}

- (CPLBackgroundActivity)detachedActivity
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1106;
  v15 = __Block_byref_object_dispose__1107;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __34__CPLSyncSession_detachedActivity__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLBackgroundActivity *)v4;
}

- (void)setDetachedActivity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLSyncSession *v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __38__CPLSyncSession_setDetachedActivity___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)shouldConsiderRequestingMoreTime
{
  BOOL v2;
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  _QWORD v6[2];
  void *(*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (self->_shouldHaveRequestedMoreTime)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __50__CPLSyncSession_shouldConsiderRequestingMoreTime__block_invoke;
  v8 = &unk_1E60DC8A0;
  v9 = self;
  v10 = &v11;
  v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  v2 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v2;
}

- (id)addDeferHandler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  CPLSyncSession *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1106;
  v18 = __Block_byref_object_dispose__1107;
  v19 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __34__CPLSyncSession_addDeferHandler___block_invoke;
  v11 = &unk_1E60D64C8;
  v12 = self;
  v13 = &v14;
  v6 = v9;
  os_unfair_lock_lock(p_lock);
  v10((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);

  objc_msgSend((id)v15[5], "addDeferHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)removeDeferHandler:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  CPLSyncSession *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1106;
    v16 = __Block_byref_object_dispose__1107;
    v17 = 0;
    p_lock = &self->_lock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v8 = __37__CPLSyncSession_removeDeferHandler___block_invoke;
    v9 = &unk_1E60D64C8;
    v10 = self;
    v11 = &v12;
    v6 = v7;
    os_unfair_lock_lock(p_lock);
    v8((uint64_t)v6);
    os_unfair_lock_unlock(p_lock);

    objc_msgSend((id)v13[5], "removeDeferHandler:", v4);
    _Block_object_dispose(&v12, 8);

  }
}

- (double)estimatedRemainingTime
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  double v4;
  _QWORD v6[2];
  double (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0x40AC200000000000;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __40__CPLSyncSession_estimatedRemainingTime__block_invoke;
  v8 = &unk_1E60DC8A0;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)setupWithConfiguration:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_allowsLocalConflictResolutionWhenOverQuota = objc_msgSend(v4, "allowsLocalConflictResolutionWhenOverQuota");
  self->_allowsLocalConflictResolution = objc_msgSend(v4, "allowsLocalConflictResolution");
  self->_maximumComputeStatesToUploadPerBatch = objc_msgSend(v4, "maximumComputeStatesToUploadPerBatch");
  v5 = objc_msgSend(v4, "isComputeStateTaskUploadEnabled");

  self->_isComputeStateTaskUploadEnabled = v5;
}

- (void)includeScopeIdentifierInPushToTransport:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CPLSyncSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_scopeIdentifiersExcludedFromPushToTransport, "containsObject:", v4))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412546;
        v7 = self;
        v8 = 2114;
        v9 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "%@ will finally include %{public}@ in push-to-transport", (uint8_t *)&v6, 0x16u);
      }

    }
    -[NSMutableSet removeObject:](self->_scopeIdentifiersExcludedFromPushToTransport, "removeObject:", v4);
  }
  -[CPLSyncSession includeScopeIdentifierInMingling:](self, "includeScopeIdentifierInMingling:", v4);

}

- (void)excludeScopeIdentifierFromPushToTransport:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *scopeIdentifiersExcludedFromPushToTransport;
  NSObject *v7;
  int v8;
  CPLSyncSession *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_scopeIdentifiersExcludedFromPushToTransport, "containsObject:", v4) & 1) == 0)
  {
    if (!self->_scopeIdentifiersExcludedFromPushToTransport)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      scopeIdentifiersExcludedFromPushToTransport = self->_scopeIdentifiersExcludedFromPushToTransport;
      self->_scopeIdentifiersExcludedFromPushToTransport = v5;

    }
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412546;
        v9 = self;
        v10 = 2114;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "%@ will exclude %{public}@ from push-to-transport", (uint8_t *)&v8, 0x16u);
      }

    }
    -[NSMutableSet addObject:](self->_scopeIdentifiersExcludedFromPushToTransport, "addObject:", v4);
  }
  -[CPLSyncSession excludeScopeIdentifierFromMingling:](self, "excludeScopeIdentifierFromMingling:", v4);
  -[CPLSyncSession requestSyncStateAtEndOfSyncSession:reschedule:](self, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);

}

- (void)includeScopeIdentifierInMingling:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CPLSyncSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_scopeIdentifiersExcludedFromMingling, "containsObject:", v4))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412546;
        v7 = self;
        v8 = 2114;
        v9 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "%@ will finally include %{public}@ in mingling", (uint8_t *)&v6, 0x16u);
      }

    }
    -[NSMutableSet removeObject:](self->_scopeIdentifiersExcludedFromMingling, "removeObject:", v4);
  }

}

- (void)excludeScopeIdentifierFromMingling:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *scopeIdentifiersExcludedFromMingling;
  NSObject *v7;
  int v8;
  CPLSyncSession *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_scopeIdentifiersExcludedFromMingling, "containsObject:", v4) & 1) == 0)
  {
    if (!self->_scopeIdentifiersExcludedFromMingling)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      scopeIdentifiersExcludedFromMingling = self->_scopeIdentifiersExcludedFromMingling;
      self->_scopeIdentifiersExcludedFromMingling = v5;

    }
    if (!_CPLSilentLogging)
    {
      __CPLSchedulerOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412546;
        v9 = self;
        v10 = 2114;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "%@ will exclude %{public}@ from mingling", (uint8_t *)&v8, 0x16u);
      }

    }
    -[NSMutableSet addObject:](self->_scopeIdentifiersExcludedFromMingling, "addObject:", v4);
  }
  -[CPLSyncSession requestSyncStateAtEndOfSyncSession:reschedule:](self, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);

}

- (NSSet)scopeIdentifiersExcludedFromMingling
{
  NSMutableSet *scopeIdentifiersExcludedFromMingling;
  NSMutableSet *v3;
  id v4;

  scopeIdentifiersExcludedFromMingling = self->_scopeIdentifiersExcludedFromMingling;
  if (_scopeIdentifierToAutomaticallyExcludeFromMingling)
  {
    if (scopeIdentifiersExcludedFromMingling)
    {
      -[NSMutableSet setByAddingObject:](scopeIdentifiersExcludedFromMingling, "setByAddingObject:");
      v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0C99E60]);
      v3 = (NSMutableSet *)objc_msgSend(v4, "initWithObjects:", _scopeIdentifierToAutomaticallyExcludeFromMingling, 0);
    }
  }
  else
  {
    v3 = scopeIdentifiersExcludedFromMingling;
  }
  return (NSSet *)v3;
}

- (void)updateScopeFilter:(id)a3
{
  objc_storeStrong((id *)&self->_scopeFilter, a3);
}

- (void)predictor:(id)a3 changedPrediction:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  id v9;
  _QWORD *v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  CPLSyncSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __46__CPLSyncSession_predictor_changedPrediction___block_invoke;
  v13 = &unk_1E60D6F88;
  v14 = self;
  v9 = v7;
  v15 = v9;
  v10 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);

}

- (void)noteSyncSessionInformation:(id)a3 arguments:(char *)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  id v9;
  _QWORD *v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  CPLSyncSession *v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, a4);
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __55__CPLSyncSession_noteSyncSessionInformation_arguments___block_invoke;
  v13 = &unk_1E60D6F88;
  v14 = self;
  v9 = v7;
  v15 = v9;
  v10 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);

}

- (void)noteSyncSessionMovedToState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  CPLSyncSession *v8;
  unint64_t v9;

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __46__CPLSyncSession_noteSyncSessionMovedToState___block_invoke;
  v7 = &unk_1E60D6DF8;
  v8 = self;
  v9 = a3;
  v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)currentState
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  unint64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __30__CPLSyncSession_currentState__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)noteSyncSessionInformation:(id)a3
{
  uint64_t v3;

  -[CPLSyncSession noteSyncSessionInformation:arguments:](self, "noteSyncSessionInformation:arguments:", a3, &v3);
}

- (id)popSessionInformation
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1106;
  v15 = __Block_byref_object_dispose__1107;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __39__CPLSyncSession_popSessionInformation__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (NSArray)currentSessionInformation
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLSyncSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1106;
  v15 = __Block_byref_object_dispose__1107;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __43__CPLSyncSession_currentSessionInformation__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  return self->_allowsLocalConflictResolutionWhenOverQuota;
}

- (BOOL)allowsLocalConflictResolution
{
  return self->_allowsLocalConflictResolution;
}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  return self->_maximumComputeStatesToUploadPerBatch;
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  return self->_isComputeStateTaskUploadEnabled;
}

- (CPLEngineScheduler)scheduler
{
  return (CPLEngineScheduler *)objc_loadWeakRetained((id *)&self->_scheduler);
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)requiredStateAtEndOfSyncSession
{
  return self->_requiredStateAtEndOfSyncSession;
}

- (BOOL)shouldRescheduleASyncSession
{
  return self->_shouldRescheduleASyncSession;
}

- (NSDate)proposedRescheduleDate
{
  return self->_proposedRescheduleDate;
}

- (CPLSyncSessionPredictor)predictor
{
  return self->_predictor;
}

- (BOOL)shouldRequestMoreTime
{
  return self->_shouldRequestMoreTime;
}

- (void)setShouldRequestMoreTime:(BOOL)a3
{
  self->_shouldRequestMoreTime = a3;
}

- (BOOL)shouldHaveRequestedMoreTime
{
  return self->_shouldHaveRequestedMoreTime;
}

- (void)setShouldHaveRequestedMoreTime:(BOOL)a3
{
  self->_shouldHaveRequestedMoreTime = a3;
}

- (void)setShouldConsiderRequestingMoreTime:(BOOL)a3
{
  self->_shouldConsiderRequestingMoreTime = a3;
}

- (CPLScopeFilter)scopeFilter
{
  return self->_scopeFilter;
}

- (NSSet)scopeIdentifiersExcludedFromPushToTransport
{
  return &self->_scopeIdentifiersExcludedFromPushToTransport->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeFilter, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_proposedRescheduleDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_detachedActivity, 0);
  objc_storeStrong((id *)&self->_rescheduler, 0);
  objc_storeStrong((id *)&self->_sessionInformation, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersExcludedFromPushToTransport, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersExcludedFromMingling, 0);
}

void __43__CPLSyncSession_currentSessionInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__CPLSyncSession_popSessionInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

uint64_t __30__CPLSyncSession_currentState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

uint64_t __46__CPLSyncSession_noteSyncSessionMovedToState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __55__CPLSyncSession_noteSyncSessionInformation_arguments___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__CPLSyncSession_predictor_changedPrediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLSchedulerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Updating prediction for %@ to %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrediction:", *(_QWORD *)(a1 + 40));
}

double __40__CPLSyncSession_estimatedRemainingTime__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "estimatedRemainingTime");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    result = fmax(fmin(*(double *)(v4 + 24), 3600.0), 10.0);
    *(double *)(v4 + 24) = result;
  }
  return result;
}

void __37__CPLSyncSession_removeDeferHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);

}

void __34__CPLSyncSession_addDeferHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);

}

void *__50__CPLSyncSession_shouldConsiderRequestingMoreTime__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
  {
    result = (void *)objc_msgSend(result, "shouldConsiderRequestingMoreTime");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

uint64_t __38__CPLSyncSession_setDetachedActivity___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_watchOrUnwatchPredictorIfNecessary");
}

void __34__CPLSyncSession_detachedActivity__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __44__CPLSyncSession_resetNoteClientNeedsToPull__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

uint64_t __50__CPLSyncSession_noteClientNeedsToPullIfNecessary__block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  }
  return result;
}

uint64_t __43__CPLSyncSession_needsToAcquireRescheduler__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) == 0;
  return result;
}

uint64_t __33__CPLSyncSession_setRescheduler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_watchOrUnwatchPredictorIfNecessary");
}

void __29__CPLSyncSession_rescheduler__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __33__CPLSyncSession_engineIsClosing__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "engineIsClosing");
  return objc_msgSend(*(id *)(a1 + 32), "_unwatchPredictor");
}

uint64_t __35__CPLSyncSession_sessionWontHappen__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sessionWontHappen");
  return objc_msgSend(*(id *)(a1 + 32), "_unwatchPredictor");
}

uint64_t __31__CPLSyncSession_sessionIsDone__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sessionIsDone");
  return objc_msgSend(*(id *)(a1 + 32), "_unwatchPredictor");
}

uint64_t __33__CPLSyncSession_deferWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "deferWithBlock:", *(_QWORD *)(a1 + 40));
}

void __34__CPLSyncSession_sessionWillStart__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __31__CPLSyncSession_activityState__block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;

  v1 = (_QWORD *)a1[4];
  if (v1[7] || v1[12] == -1)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 2;
  }
  else
  {
    v2 = (void *)v1[6];
    if (v2)
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v2);
    else
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
}

void __29__CPLSyncSession_shouldDefer__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = a1[4];
  v3 = *(void **)(v2 + 56);
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "shouldDefer");
  }
  else
  {
    v4 = *(void **)(v2 + 48);
    if (v4)
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v4);
    else
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
}

+ (id)detachedSyncSessionWithScheduler:(id)a3 configuration:(id)a4 scopeFilter:(id)a5
{
  id v7;
  id v8;
  id v9;
  CPLSyncSession *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CPLSyncSession initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:]([CPLSyncSession alloc], "initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:", -1, 0, v9, v8, v7);

  return v10;
}

+ (NSString)scopeIdentifierToAutomaticallyExcludeFromMingling
{
  return (NSString *)(id)_scopeIdentifierToAutomaticallyExcludeFromMingling;
}

+ (void)setScopeIdentifierToAutomaticallyExcludeFromMingling:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_scopeIdentifierToAutomaticallyExcludeFromMingling;
  _scopeIdentifierToAutomaticallyExcludeFromMingling = v3;

}

@end
