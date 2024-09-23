@implementation CPLPushToTransportSyncStep

- (CPLPushToTransportSyncStep)initWithSyncManager:(id)a3 syncSession:(id)a4 highPriority:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  CPLPushToTransportSyncStep *v11;
  objc_super v13;

  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)CPLPushToTransportSyncStep;
  v11 = -[CPLSimpleTaskSyncStep initWithSyncManager:syncSession:taskClass:](&v13, sel_initWithSyncManager_syncSession_taskClass_, v9, v8, v10);

  if (v11)
    v11->_highPriority = a5;
  return v11;
}

- (void)cancelAllTasks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CPLSimpleTaskSyncStep currentTask](self, "currentTask");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel:", v3);

}

- (id)newTask
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPushToTransportSyncStep;
  v3 = -[CPLSimpleTaskSyncStep newTask](&v5, sel_newTask);
  objc_msgSend(v3, "setHighPriority:", self->_highPriority);
  return v3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

@end
