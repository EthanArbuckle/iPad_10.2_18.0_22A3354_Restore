@implementation CPLEngineSchedulerBlocker

- (CPLEngineSchedulerBlocker)initWithReason:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  CPLEngineSchedulerBlocker *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineSchedulerBlocker;
  v8 = -[CPLEngineSchedulerBlocker init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeStrong((id *)&v8->_scheduler, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_blocking)
    -[CPLEngineScheduler enableSynchronizationWithReason:](self->_scheduler, "enableSynchronizationWithReason:", self->_reason);
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineSchedulerBlocker;
  -[CPLEngineSchedulerBlocker dealloc](&v3, sel_dealloc);
}

- (void)unblock
{
  void *v3;
  void *v4;

  -[CPLEngineScheduler engineLibrary](self->_scheduler, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unblockSyncSessionWithReason:", self->_reason);

  -[CPLEngineScheduler enableSynchronizationWithReason:](self->_scheduler, "enableSynchronizationWithReason:", self->_reason);
  self->_blocking = 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (CPLEngineScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
