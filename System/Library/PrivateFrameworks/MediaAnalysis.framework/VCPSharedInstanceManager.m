@implementation VCPSharedInstanceManager

- (VCPSharedInstanceManager)init
{
  VCPSharedInstanceManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  uint64_t v5;
  NSMutableDictionary *sharedInstances;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPSharedInstanceManager;
  v2 = -[VCPSharedInstanceManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPSharedInstanceManager", 0);
    serialQueue = v2->serialQueue_;
    v2->serialQueue_ = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sharedInstances = v2->sharedInstances_;
    v2->sharedInstances_ = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_once_token != -1)
    dispatch_once(&sharedManager_once_token, &__block_literal_global_22);
  return (id)sharedManager_instance;
}

void __41__VCPSharedInstanceManager_sharedManager__block_invoke()
{
  VCPSharedInstanceManager *v0;
  void *v1;

  v0 = objc_alloc_init(VCPSharedInstanceManager);
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = (uint64_t)v0;

}

- (id)sharedInstanceWithIdentifier:(id)a3 andCreationBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  v22 = 0;
  serialQueue = self->serialQueue_;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__VCPSharedInstanceManager_sharedInstanceWithIdentifier_andCreationBlock___block_invoke;
  v13[3] = &unk_1E6B16DF8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __74__VCPSharedInstanceManager_sharedInstanceWithIdentifier_andCreationBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v5 = (void *)MEMORY[0x1BCCA1B2C]();
    (*(void (**)(void))(a1[6] + 16))();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v9)
      objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v9, a1[5]);
    objc_autoreleasePoolPop(v5);
  }
}

- (void)resetSharedInstanceWithIdentifier:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->serialQueue_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCPSharedInstanceManager_resetSharedInstanceWithIdentifier___block_invoke;
  block[3] = &unk_1E6B16E20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __62__VCPSharedInstanceManager_resetSharedInstanceWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)reset
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->serialQueue_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCPSharedInstanceManager_reset__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __33__VCPSharedInstanceManager_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sharedInstances_, 0);
  objc_storeStrong((id *)&self->serialQueue_, 0);
}

@end
