@implementation FBSApplicationDataStoreClientFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance___singleton;
}

- (id)checkout
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke;
  v5[3] = &unk_1E38EB628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)checkin
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSApplicationDataStoreClientFactory_checkin__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __47__FBSApplicationDataStoreClientFactory_checkin__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = v2 - 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v4 + 8))
    {
      objc_msgSend(*(id *)(v4 + 24), "invalidate");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;

    }
  }
}

void __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(_QWORD);
  objc_class *v5;
  BOOL v6;
  FBSApplicationDataStoreRepositoryClient *v7;
  FBSApplicationDataStoreRepositoryClient *v8;
  uint64_t v9;
  void *v10;
  FBSApplicationDataStoreRepositoryClient *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  FBSApplicationDataStoreRepositoryClient *v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
  {
    if (!*(_QWORD *)(v2 + 24))
    {
      v5 = NSClassFromString(CFSTR("FBApplicationDataStoreInProcessRepositoryClient"));
      if (+[FBSApplicationDataStoreClientFactory isServerProcess](FBSApplicationDataStoreClientFactory, "isServerProcess"))
      {
        v6 = v5 == 0;
      }
      else
      {
        v6 = 1;
      }
      if (v6)
      {
        v7 = objc_alloc_init(FBSApplicationDataStoreRepositoryClient);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_2;
        v15[3] = &unk_1E38EAE78;
        v8 = v7;
        v16 = v8;
        v4 = (void (**)(_QWORD))MEMORY[0x19AECA324](v15);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v9 + 24);
        *(_QWORD *)(v9 + 24) = v8;
        v11 = v8;

      }
      else
      {
        v12 = objc_alloc_init(v5);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 24);
        *(_QWORD *)(v13 + 24) = v12;

        v4 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addPrefetchedKeys:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(v2 + 8);
      goto LABEL_5;
    }
    v3 = 0;
  }
  v4 = 0;
LABEL_5:
  *(_QWORD *)(v2 + 8) = v3 + 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  if (v4)
    v4[2](v4);

}

- (FBSApplicationDataStoreClientFactory)init
{
  FBSApplicationDataStoreClientFactory *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  FBSApplicationDataStoreRepositoryClient *sharedClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBSApplicationDataStoreClientFactory;
  v2 = -[FBSApplicationDataStoreClientFactory init](&v7, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v2->_count = 0;
    sharedClient = v2->_sharedClient;
    v2->_sharedClient = 0;

  }
  return v2;
}

void __54__FBSApplicationDataStoreClientFactory_sharedInstance__block_invoke()
{
  FBSApplicationDataStoreClientFactory *v0;
  void *v1;

  v0 = objc_alloc_init(FBSApplicationDataStoreClientFactory);
  v1 = (void *)sharedInstance___singleton;
  sharedInstance___singleton = (uint64_t)v0;

}

+ (BOOL)isServerProcess
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(off_1E38E9E20, "environmentAliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveMachService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E38E9E88, "bootstrapConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domainForMachName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBSSystemServiceSpecification identifier](FBSSystemServiceSpecification, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

void __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_3;
  block[3] = &unk_1E38EAE78;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __48__FBSApplicationDataStoreClientFactory_checkout__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

- (NSArray)prefetchedKeys
{
  return self->_prefetchedKeys;
}

- (void)setPrefetchedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
  objc_storeStrong((id *)&self->_sharedClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
