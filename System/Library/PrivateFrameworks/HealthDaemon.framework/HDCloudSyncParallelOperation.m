@implementation HDCloudSyncParallelOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncParallelOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncParallelOperation *v4;
  NSMutableArray *v5;
  NSMutableArray *operations;
  HDSynchronousTaskGroup *v7;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncParallelOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v10, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    operations = v4->_operations;
    v4->_operations = v5;

    v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v7;

    -[HDSynchronousTaskGroup setDelegate:](v4->_taskGroup, "setDelegate:", v4);
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)main
{
  uint64_t v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    v3 = 10 * -[NSMutableArray count](self->_operations, "count");
    -[HDCloudSyncOperation progress](self, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTotalUnitCount:", v3);

    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_operations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask", (_QWORD)v14);
          -[HDCloudSyncOperation cloudState](self, "cloudState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCloudState:", v11);

          -[HDCloudSyncOperation progress](self, "progress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "progress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addChild:withPendingUnitCount:", v13, 10);

          objc_msgSend(v10, "start");
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

- (void)skip
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncParallelOperation;
  -[HDCloudSyncOperation skip](&v12, sel_skip);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_operations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "skip", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (NSArray)operations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addOperationOfClass:(Class)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = [a3 alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "initWithConfiguration:cloudState:", v5, v6);

  -[HDCloudSyncParallelOperation addOperation:](self, "addOperation:", v7);
}

- (void)addOperation:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncParallelOperation.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudState:", v6);

  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HDCloudSyncParallelOperation_addOperation___block_invoke;
  v10[3] = &unk_1E6CE7778;
  v10[4] = self;
  objc_msgSend(v5, "setOnSuccess:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __45__HDCloudSyncParallelOperation_addOperation___block_invoke_2;
  v9[3] = &unk_1E6CE77A0;
  v9[4] = self;
  objc_msgSend(v5, "setOnError:", v9);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_operations, "addObject:", v5);

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __45__HDCloudSyncParallelOperation_addOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
}

uint64_t __45__HDCloudSyncParallelOperation_addOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
