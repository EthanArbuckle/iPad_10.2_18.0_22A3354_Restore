@implementation CPLEngineSyncTask

- (CPLEngineSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  CPLEngineSyncTask *v9;
  CPLEngineSyncTask *v10;
  uint64_t v11;
  NSDate *lastChangeDateForPhaseDescription;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineSyncTask;
  v9 = -[CPLEngineSyncTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_engineLibrary, a3);
    objc_storeStrong((id *)&v10->_session, a4);
    v10->_phaseDescriptionLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    lastChangeDateForPhaseDescription = v10->_lastChangeDateForPhaseDescription;
    v10->_lastChangeDateForPhaseDescription = (NSDate *)v11;

  }
  return v10;
}

- (void)launchTransportTask:(id)a3 withTransportGroup:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "setForeground:", -[CPLEngineSyncTask foreground](self, "foreground"));
  objc_msgSend(v8, "setForcedTask:", -[CPLEngineSyncTask forceSync](self, "forceSync"));
  objc_msgSend(v8, "setTransportUserIdentifier:", self->_transportUserIdentifier);
  objc_msgSend(v8, "setTransportGroup:", v6);

  -[CPLEngineSyncTask session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runWithinSyncSession:", v7);

  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
    objc_msgSend(v8, "cancel");

}

- (unint64_t)diskPressureState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "diskPressureState");

  return v4;
}

- (NSString)taskIdentifier
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 66, CFSTR("%@ should be overridden by %@"), v6, objc_opt_class());

  abort();
}

- (void)launch
{
  NSObject *v3;
  int v4;
  CPLEngineSyncTask *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_13504();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "%@ launched", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)cancel
{
  NSObject *v3;
  int v4;
  CPLEngineSyncTask *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_13504();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "%@ has been cancelled", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CPLEngineSyncTask _setCancelled:](self, "_setCancelled:", 1);
}

- (void)taskDidFinishWithError:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  CPLEngineSyncTask *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_hasFinishedTask)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "%@ called %@ twice", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 80, CFSTR("%@ called %@ twice"), self, v13);

    abort();
  }
  v6 = v5;
  self->_hasFinishedTask = 1;
  if (!v5)
  {
    if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_13504();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%@ did finish with error: %@", buf, 0x16u);
    }

  }
  -[CPLEngineSyncTask delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "task:didFinishWithError:", self, v6);

  -[CPLEngineSyncTask setDelegate:](self, "setDelegate:", 0);
}

- (void)taskDidProgress:(float)a3 userInfo:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[CPLEngineSyncTask delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "task:didProgress:userInfo:", self, v6, v7);

}

- (NSArray)scopesForTask
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  os_unfair_lock_s *p_phaseDescriptionLock;
  NSDate *lastChangeDateForPhaseDescription;
  NSString *v7;
  NSDate *v8;
  NSDate *v9;

  p_phaseDescriptionLock = &self->_phaseDescriptionLock;
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  lastChangeDateForPhaseDescription = self->_lastChangeDateForPhaseDescription;
  v7 = self->_phaseDescription;
  v8 = lastChangeDateForPhaseDescription;
  os_unfair_lock_unlock(p_phaseDescriptionLock);
  v9 = objc_retainAutorelease(v8);
  *a3 = v9;

  return v7;
}

- (NSString)phaseDescription
{
  os_unfair_lock_s *p_phaseDescriptionLock;
  NSString *v4;

  p_phaseDescriptionLock = &self->_phaseDescriptionLock;
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  v4 = self->_phaseDescription;
  os_unfair_lock_unlock(p_phaseDescriptionLock);
  return v4;
}

- (void)setPhaseDescription:(id)a3
{
  NSString *v4;
  NSString *phaseDescription;
  NSString *v6;
  NSDate *v7;
  NSDate *lastChangeDateForPhaseDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_phaseDescriptionLock);
  phaseDescription = self->_phaseDescription;
  self->_phaseDescription = v4;
  v6 = v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastChangeDateForPhaseDescription = self->_lastChangeDateForPhaseDescription;
  self->_lastChangeDateForPhaseDescription = v7;

  os_unfair_lock_unlock(&self->_phaseDescriptionLock);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = 0;
  -[CPLEngineSyncTask phaseDescriptionLastChangeDate:](self, "phaseDescriptionLastChangeDate:", &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      if (v13 < -10.0)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        -[CPLEngineSyncTask taskIdentifier](self, "taskIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", v5, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v15, v9, v10, v21);
        goto LABEL_9;
      }
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    -[CPLEngineSyncTask taskIdentifier](self, "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %@>"), v18, v9, v20);
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!v4 || (objc_msgSend(v4, "timeIntervalSinceNow"), v6 >= -10.0))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_opt_class();
    -[CPLEngineSyncTask taskIdentifier](self, "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v12, v9, v3);
    goto LABEL_11;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[CPLEngineSyncTask taskIdentifier](self, "taskIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %@ %@ %@>"), v8, v9, v3, v10);
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v16;
}

- (CPLEngineSyncTaskDelegate)delegate
{
  return (CPLEngineSyncTaskDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (CPLSyncSession)session
{
  return self->_session;
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (void)setTransportUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transportUserIdentifier, a3);
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_engineLibrary, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_phaseDescription, 0);
  objc_storeStrong((id *)&self->_lastChangeDateForPhaseDescription, 0);
}

+ (id)taskWithEngineLibrary:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEngineLibrary:session:", v7, v6);

  return v8;
}

@end
