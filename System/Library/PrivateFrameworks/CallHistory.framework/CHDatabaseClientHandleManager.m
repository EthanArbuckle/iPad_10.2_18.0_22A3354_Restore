@implementation CHDatabaseClientHandleManager

- (CallHistoryDBClientHandle)databaseClientHandle
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CHDatabaseClientHandleManager_databaseClientHandle__block_invoke;
  v4[3] = &unk_1E67463A8;
  v4[4] = self;
  v4[5] = &v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CallHistoryDBClientHandle *)v2;
}

+ (CHDatabaseClientHandleManager)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  return (CHDatabaseClientHandleManager *)(id)sharedInstance_databaseClientHandleManager;
}

void __53__CHDatabaseClientHandleManager_databaseClientHandle__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (!WeakRetained)
  {
    +[CallHistoryDBClientHandle createForClient](CallHistoryDBClientHandle, "createForClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), v3);

  }
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __47__CHDatabaseClientHandleManager_sharedInstance__block_invoke()
{
  CHDatabaseClientHandleManager *v0;
  void *v1;

  v0 = objc_alloc_init(CHDatabaseClientHandleManager);
  v1 = (void *)sharedInstance_databaseClientHandleManager;
  sharedInstance_databaseClientHandleManager = (uint64_t)v0;

}

- (CHDatabaseClientHandleManager)init
{
  CHDatabaseClientHandleManager *v2;
  CHDatabaseClientHandleManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHDatabaseClientHandleManager;
  v2 = -[CHSynchronizedLoggable initWithName:](&v5, sel_initWithName_, "CHDatabaseClientHandleManager");
  v3 = v2;
  if (v2)
    objc_storeWeak((id *)&v2->_databaseClientHandle, 0);
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseClientHandle);
}

@end
