@implementation HDCloudSyncManagerShowTask

- (HDCloudSyncManagerShowTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HDCloudSyncManagerShowTask *v14;
  NSMutableArray *v15;
  NSMutableArray *allRepositoryDescriptions;
  objc_super v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "subContextByAddingOptions:", 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HDCloudSyncManagerShowTask;
  v14 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v18, sel_initWithManager_context_accessibilityAssertion_completion_, v12, v13, v11, v10);

  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allRepositoryDescriptions = v14->_allRepositoryDescriptions;
    v14->_allRepositoryDescriptions = v15;

  }
  return v14;
}

- (id)pipelineForRepository:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDCloudSyncPipeline *v7;
  void *v8;
  void *v9;
  id v10;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v11;
  void *v12;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v13;
  HDCloudSyncPipelineStageSynchronize *v14;
  void *v15;
  HDCloudSyncPipelineStageSynchronize *v16;
  HDCloudSyncPipelineStagePrepareForSync *v17;
  void *v18;
  HDCloudSyncPipelineStagePrepareForSync *v19;
  HDCloudSyncPipelineStageDescribe *v20;
  void *v21;
  HDCloudSyncPipelineStageDescribe *v22;
  _QWORD v24[5];

  v4 = a3;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subContextByAddingOptions:", 64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HDCloudSyncPipeline alloc];
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v7, "initForContext:repository:accessibilityAssertion:queue:", v6, v4, 0, v9);

  v11 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  objc_msgSend(v10, "operationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v11, "initWithConfiguration:cloudState:", v12, 0);
  objc_msgSend(v10, "addStage:", v13);

  v14 = [HDCloudSyncPipelineStageSynchronize alloc];
  objc_msgSend(v10, "operationConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, 0);
  objc_msgSend(v10, "addStage:", v16);

  v17 = [HDCloudSyncPipelineStagePrepareForSync alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
  objc_msgSend(v10, "addStage:", v19);

  v20 = [HDCloudSyncPipelineStageDescribe alloc];
  objc_msgSend(v10, "operationConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__HDCloudSyncManagerShowTask_pipelineForRepository___block_invoke;
  v24[3] = &unk_1E6D02390;
  v24[4] = self;
  v22 = -[HDCloudSyncPipelineStageDescribe initWithConfiguration:cloudState:respositoryDescriptionHandler:](v20, "initWithConfiguration:cloudState:respositoryDescriptionHandler:", v21, 0, v24);
  objc_msgSend(v10, "addStage:", v22);

  return v10;
}

void __52__HDCloudSyncManagerShowTask_pipelineForRepository___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 136);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "addObject:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 136));
  }
}

- (void)didFinishWithSuccess
{
  os_unfair_lock_s *p_lock;
  void *v4;
  SEL v5;
  NSMutableArray *allRepositoryDescriptions;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_allRepositoryDescriptions, "copy");
  objc_setProperty_atomic_copy(self, v5, v4, 152);

  allRepositoryDescriptions = self->_allRepositoryDescriptions;
  self->_allRepositoryDescriptions = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)didFailWithErrors:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  SEL v6;
  NSMutableArray *allRepositoryDescriptions;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableArray copy](self->_allRepositoryDescriptions, "copy");
  objc_setProperty_atomic_copy(self, v6, v5, 152);

  allRepositoryDescriptions = self->_allRepositoryDescriptions;
  self->_allRepositoryDescriptions = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)repositoryDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repositoryDescriptions, 0);
  objc_storeStrong((id *)&self->_allRepositoryDescriptions, 0);
}

@end
