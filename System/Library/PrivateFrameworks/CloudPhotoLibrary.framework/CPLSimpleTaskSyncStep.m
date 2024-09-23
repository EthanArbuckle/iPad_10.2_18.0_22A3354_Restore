@implementation CPLSimpleTaskSyncStep

- (CPLSimpleTaskSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 taskClass:(Class)a5
{
  CPLSimpleTaskSyncStep *v6;
  CPLSimpleTaskSyncStep *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleTaskSyncStep;
  v6 = -[CPLSyncStep initWithSyncManager:syncSession:](&v9, sel_initWithSyncManager_syncSession_, a3, a4);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskClass, a5);
  return v7;
}

- (id)newTask
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(self->_taskClass);
  -[CPLSyncStep engineLibrary](self, "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLSyncStep syncSession](self, "syncSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEngineLibrary:session:", v4, v5);

  return v6;
}

- (id)descriptionForTasks
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CPLEngineSyncTask description](self->_currentTask, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ not launched>"), self->_taskClass);
  v6 = v5;

  return v6;
}

- (BOOL)launchNecessaryTasks
{
  CPLEngineSyncTask **p_currentTask;
  CPLEngineSyncTask *v5;
  CPLEngineSyncTask *v6;

  p_currentTask = &self->_currentTask;
  if (self->_currentTask)
    return 0;
  v5 = -[CPLSimpleTaskSyncStep newTask](self, "newTask");
  v6 = *p_currentTask;
  *p_currentTask = v5;

  return -[CPLSyncStep prepareAndLaunchSyncTask:](self, "prepareAndLaunchSyncTask:", p_currentTask);
}

- (void)cancelAllTasks:(BOOL)a3
{
  -[CPLEngineSyncTask cancel](self->_currentTask, "cancel", a3);
}

- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5
{
  CPLEngineSyncTask *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;

  v9 = (CPLEngineSyncTask *)a3;
  v10 = a4;
  if (self->_currentTask != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 146, CFSTR("Task %@ did finish for %@ but no task has been dispatched"), objc_opt_class(), self->_taskClass);

    abort();
  }
  v11 = v10;
  self->_currentTask = 0;

  if (v11)
    -[CPLSyncStep setErrorForSyncSession:](self, "setErrorForSyncSession:", v11);
  -[CPLSyncStep lastError](self, "lastError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    *a5 = 1;
  v13 = self->_currentTask == 0;

  return v13;
}

- (void)moveTasksToBackground
{
  -[CPLEngineSyncTask setForeground:](self->_currentTask, "setForeground:", 0);
}

- (BOOL)hasTasks
{
  return self->_currentTask != 0;
}

- (BOOL)containsTask:(id)a3
{
  return self->_currentTask == a3;
}

- (Class)taskClass
{
  return self->_taskClass;
}

- (CPLEngineSyncTask)currentTask
{
  return self->_currentTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_taskClass, 0);
}

@end
