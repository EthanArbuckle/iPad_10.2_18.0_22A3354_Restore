@implementation CPLSyncStep

- (CPLSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4
{
  id v7;
  id v8;
  CPLSyncStep *v9;
  CPLSyncStep *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLSyncStep;
  v9 = -[CPLSyncStep init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncManager, a3);
    objc_storeStrong((id *)&v10->_syncSession, a4);
  }

  return v10;
}

- (CPLEngineLibrary)engineLibrary
{
  return -[CPLEngineSyncManager engineLibrary](self->_syncManager, "engineLibrary");
}

- (CPLEngineStore)engineStore
{
  void *v2;
  void *v3;

  -[CPLEngineSyncManager engineLibrary](self->_syncManager, "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPLEngineStore *)v3;
}

- (NSString)descriptionForTasks
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 41, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (BOOL)launchNecessaryTasks
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 50, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (void)cancelAllTasks:(BOOL)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 55, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (BOOL)didFinishTask:(id)a3 withError:(id)a4 shouldStop:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 59, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (void)moveTasksToBackground
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 63, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  -[CPLEngineSyncManager task:didFinishWithError:](self->_syncManager, "task:didFinishWithError:", a3, a4);
}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
  -[CPLEngineSyncManager task:didProgress:userInfo:](self->_syncManager, "task:didProgress:userInfo:", a3, a5);
}

- (BOOL)prepareAndLaunchSyncTask:(id *)a3
{
  id v5;

  if (*a3)
  {
    if (-[CPLEngineSyncManager prepareAndLaunchSyncTaskUnlocked:](self->_syncManager, "prepareAndLaunchSyncTaskUnlocked:"))
    {
      return 1;
    }
    v5 = *a3;
    *a3 = 0;

  }
  return 0;
}

- (void)setErrorForSyncSession:(id)a3
{
  -[CPLEngineSyncManager setErrorForSyncSessionUnlocked:](self->_syncManager, "setErrorForSyncSessionUnlocked:", a3);
}

- (NSError)lastError
{
  return (NSError *)-[CPLEngineSyncManager lastErrorUnlocked](self->_syncManager, "lastErrorUnlocked");
}

- (BOOL)hasTasks
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 94, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (BOOL)containsTask:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncStep.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 98, CFSTR("This should be implemented by subclasses"));

  abort();
}

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (CPLSyncSession)syncSession
{
  return self->_syncSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
