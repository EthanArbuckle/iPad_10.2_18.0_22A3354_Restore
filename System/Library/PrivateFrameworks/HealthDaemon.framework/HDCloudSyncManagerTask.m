@implementation HDCloudSyncManagerTask

- (HDCloudSyncManagerTask)init
{
  HDCloudSyncManagerTask *v2;
  HDCloudSyncManagerTask *v3;
  uint64_t v4;
  NSProgress *progress;
  NSArray *mirroringTasks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerTask;
  v2 = -[HDCloudSyncManagerTask init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v4 = objc_claimAutoreleasedReturnValue();
    progress = v3->_progress;
    v3->_progress = (NSProgress *)v4;

    mirroringTasks = v3->_mirroringTasks;
    v3->_mirroringTasks = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_priority = 0;
  }
  return v3;
}

- (int64_t)status
{
  os_unfair_lock_s *p_lock;
  int64_t status;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (BOOL)combineWithTask:(id)a3
{
  return 0;
}

- (void)startWithCompletion:(id)a3
{
  id v5;
  id WeakRetained;
  int64_t status;
  void *v8;
  id completion;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  HDCloudSyncManagerTask *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalTask);

  status = self->_status;
  if (!status)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
    completion = self->_completion;
    self->_completion = v8;

    self->_status = 1;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_mirroringTasks;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 24) = self->_status;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v12);
    }

  }
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasOriginalTask == NO"));

    if (!status)
      goto LABEL_14;
  }
  else if (!status)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == HDCloudSyncManagerTaskStatusPending"));

LABEL_14:
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting.", buf, 0xCu);
  }
  -[HDCloudSyncManagerTask main](self, "main");

}

- (void)main
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)finish
{
  os_unfair_lock_s *p_lock;
  int64_t status;
  void (**v6)(_QWORD);
  id completion;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *mirroringTasks;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  HDCloudSyncManagerTask *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  status = self->_status;
  v6 = (void (**)(_QWORD))_Block_copy(self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  if (self->_status == 1)
  {
    self->_status = 2;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_mirroringTasks;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12++) + 24) = self->_status;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v10);
    }

  }
  mirroringTasks = self->_mirroringTasks;
  self->_mirroringTasks = (NSArray *)MEMORY[0x1E0C9AA60];

  os_unfair_lock_unlock(p_lock);
  if (!status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status != HDCloudSyncManagerTaskStatusPending"));

  }
  v14 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
  v15 = -[NSProgress totalUnitCount](self->_progress, "totalUnitCount");
  if (v14 <= v15)
    v16 = v15;
  else
    v16 = v14;
  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v16);
  if (status == 1)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished.", buf, 0xCu);
    }
    if (v6)
      v6[2](v6);
  }

}

- (void)mirrorTask:(id)a3
{
  id WeakRetained;
  HDCloudSyncManagerTask *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  NSProgress *progress;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSProgress *v14;
  void *v15;
  void *v16;
  void *v17;
  char *obj;

  obj = (char *)a3;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalTask"));

  }
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalTask);

  objc_storeWeak((id *)&self->_originalTask, obj);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncManagerTask.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasOriginalTask == NO"));

  }
  v6 = self;
  if (obj)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__addMirroringTask_, obj, CFSTR("HDCloudSyncManagerTask.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mirroringTask"));

    }
    v7 = (os_unfair_lock_s *)(obj + 8);
    os_unfair_lock_lock((os_unfair_lock_t)obj + 2);
    if (*((_QWORD *)obj + 3))
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "hd_progressMirroringProgress:", *((_QWORD *)obj + 6));
      v8 = objc_claimAutoreleasedReturnValue();
      progress = v6->_progress;
      v6->_progress = (NSProgress *)v8;

      os_unfair_lock_unlock(v7);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__addMirroringTask_, obj, CFSTR("HDCloudSyncManagerTask.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == HDCloudSyncManagerTaskStatusPending"));

    }
    else
    {
      objc_msgSend(*((id *)obj + 4), "arrayByAddingObject:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)obj + 4);
      *((_QWORD *)obj + 4) = v11;

      objc_msgSend(MEMORY[0x1E0CB38A8], "hd_progressMirroringProgress:", *((_QWORD *)obj + 6));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v6->_progress;
      v6->_progress = (NSProgress *)v13;

      os_unfair_lock_unlock(v7);
    }
  }

}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (HDCloudSyncManagerTask)originalTask
{
  return (HDCloudSyncManagerTask *)objc_loadWeakRetained((id *)&self->_originalTask);
}

- (NSArray)mirroringTasks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalTask);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_mirroringTasks, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
