@implementation LACSharedModeService

- (LACSharedModeService)initWithReplyQueue:(id)a3
{
  id v5;
  LACSharedModeService *v6;
  LACSharedModeService *v7;
  LACSharedModeDataSourceTaskDecoratorRuntime *v8;
  LACSharedModeDataSourceTaskDecoratorRuntime *runtime;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LACSharedModeService;
  v6 = -[LACSharedModeService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = objc_alloc_init(LACSharedModeDataSourceTaskDecoratorRuntime);
    runtime = v7->_runtime;
    v7->_runtime = v8;

  }
  return v7;
}

- (id)processor
{
  LACSharedModeProcessor *v3;
  OS_dispatch_queue *replyQueue;
  void *v5;
  void *v6;
  void *v7;
  LACSharedModeProcessor *v8;

  v3 = [LACSharedModeProcessor alloc];
  replyQueue = self->_replyQueue;
  -[LACSharedModeService _dataSource](self, "_dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACSharedModeService _policyTraitsManager](self, "_policyTraitsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACSharedModeService _policyCoordinator](self, "_policyCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LACSharedModeProcessor initWithReplyQueue:dataSource:policyTraitsManager:policyCoordinator:](v3, "initWithReplyQueue:dataSource:policyTraitsManager:policyCoordinator:", replyQueue, v5, v6, v7);

  return v8;
}

- (id)_dataSource
{
  LACSharedModeDataSourceTaskDecorator *v3;
  void *v4;
  LACSharedModeDataSourceTaskDecorator *v5;
  _QWORD v7[5];

  v3 = [LACSharedModeDataSourceTaskDecorator alloc];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__LACSharedModeService__dataSource__block_invoke;
  v7[3] = &unk_2510C1960;
  v7[4] = self;
  __35__LACSharedModeService__dataSource__block_invoke((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACSharedModeDataSourceTaskDecorator initWithDataSource:runtime:replyQueue:](v3, "initWithDataSource:runtime:replyQueue:", v4, self->_runtime, self->_replyQueue);

  return v5;
}

LACSharedModeDataSourceDefaultsDecorator *__35__LACSharedModeService__dataSource__block_invoke(uint64_t a1)
{
  LACSharedModeDataSourceFTRCAdapter *v2;
  LACSharedModeDataSourceDefaultsDecorator *v3;
  LACSharedModeDataSourceDefaultsDecorator *v4;

  v2 = -[LACSharedModeDataSourceFTRCAdapter initWithReplyQueue:]([LACSharedModeDataSourceFTRCAdapter alloc], "initWithReplyQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if (+[LACGlobalDomain osVariantAllowsDomainOverrides](LACGlobalDomain, "osVariantAllowsDomainOverrides"))
  {
    v3 = -[LACSharedModeDataSourceDefaultsDecorator initWithDataSource:replyQueue:]([LACSharedModeDataSourceDefaultsDecorator alloc], "initWithDataSource:replyQueue:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (id)_policyTraitsManager
{
  return objc_alloc_init(LACSharedModePolicyTraitsManager);
}

- (id)_policyCoordinator
{
  LACSharedModePolicyCoordinatorACMStorageRequestFactory *v3;
  LACSharedModePolicyCoordinatorACMStorage *v4;
  LACSharedModePolicyCoordinatorACMAdapter *v5;

  v3 = objc_alloc_init(LACSharedModePolicyCoordinatorACMStorageRequestFactory);
  v4 = objc_alloc_init(LACSharedModePolicyCoordinatorACMStorage);
  v5 = -[LACSharedModePolicyCoordinatorACMAdapter initWithReplyQueue:storageRequestFactory:storage:]([LACSharedModePolicyCoordinatorACMAdapter alloc], "initWithReplyQueue:storageRequestFactory:storage:", self->_replyQueue, v3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtime, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
