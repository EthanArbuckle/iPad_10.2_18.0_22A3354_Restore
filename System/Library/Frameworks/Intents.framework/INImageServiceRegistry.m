@implementation INImageServiceRegistry

- (void)_reprioritizeImageServices
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *prioritySortedImageServices;
  id v6;

  -[NSMutableDictionary allValues](self->_imageServicesByServiceIdentifier, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_63586);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  prioritySortedImageServices = self->_prioritySortedImageServices;
  self->_prioritySortedImageServices = v4;

}

uint64_t __47__INImageServiceRegistry_registerImageService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v2, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "_reprioritizeImageServices");
}

uint64_t __52__INImageServiceRegistry__reprioritizeImageServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "servicePriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "servicePriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v5, "serviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

id __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE03AD98))
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (NSArray)imageStorageServices
{
  NSObject *registryQueue;
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
  v9 = __Block_byref_object_copy__63584;
  v10 = __Block_byref_object_dispose__63585;
  v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__INImageServiceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sSharedInstance;
}

- (void)registerImageService:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__INImageServiceRegistry_registerImageService___block_invoke;
    v7[3] = &unk_1E2293C38;
    v7[4] = self;
    v8 = v4;
    v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
    if (dispatch_get_specific(&INImageServiceRegistryQueueSpecificKey) == self)
      v6[2](v6);
    else
      dispatch_sync((dispatch_queue_t)self->_registryQueue, v6);

  }
}

void __77__INImageServiceRegistry_INImageStorageServiceRegistry__imageStorageServices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "if_compactMap:", &__block_literal_global_88);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __40__INImageServiceRegistry_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (INImageServiceRegistry)init
{
  id v2;
  id v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INImageServiceRegistry;
  v2 = -[INImageServiceRegistry init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.intents.INImageServiceRegistry.RegistryQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 3), &INImageServiceRegistryQueueSpecificKey, v2, 0);
  }
  return (INImageServiceRegistry *)v2;
}

- (void)unregisterImageService:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__INImageServiceRegistry_unregisterImageService___block_invoke;
    v7[3] = &unk_1E2293C38;
    v7[4] = self;
    v8 = v4;
    v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
    if (dispatch_get_specific(&INImageServiceRegistryQueueSpecificKey) == self)
      v6[2](v6);
    else
      dispatch_sync((dispatch_queue_t)self->_registryQueue, v6);

  }
}

- (NSArray)imageServices
{
  NSObject *registryQueue;
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
  v9 = __Block_byref_object_copy__63584;
  v10 = __Block_byref_object_dispose__63585;
  v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__INImageServiceRegistry_imageServices__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)imageServiceForServiceIdentifier:(id)a3
{
  id v4;
  NSObject *registryQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  INImageServiceRegistry *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__63584;
  v17 = __Block_byref_object_dispose__63585;
  v18 = 0;
  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__INImageServiceRegistry_imageServiceForServiceIdentifier___block_invoke;
  block[3] = &unk_1E228F728;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(registryQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryQueue, 0);
  objc_storeStrong((id *)&self->_prioritySortedImageServices, 0);
  objc_storeStrong((id *)&self->_imageServicesByServiceIdentifier, 0);
}

void __59__INImageServiceRegistry_imageServiceForServiceIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[4];
  if (v2)
  {
    objc_msgSend(*(id *)(a1[5] + 8), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v3);
  if (v2)

}

void __39__INImageServiceRegistry_imageServices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v4 = (id)v2;
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

uint64_t __49__INImageServiceRegistry_unregisterImageService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)imageStorageServiceForServiceIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[INImageServiceRegistry imageServiceForServiceIdentifier:](self, "imageServiceForServiceIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE03AD98))
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (NSArray)imageLoaders
{
  NSObject *registryQueue;
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
  v9 = __Block_byref_object_copy__63584;
  v10 = __Block_byref_object_dispose__63585;
  v11 = 0;
  registryQueue = self->_registryQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)imageLoaderForServiceIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[INImageServiceRegistry imageServiceForServiceIdentifier:](self, "imageServiceForServiceIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE06D380))
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

void __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "if_compactMap:", &__block_literal_global_24_63698);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __61__INImageServiceRegistry_INImageLoaderRegistry__imageLoaders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE06D380))
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

@end
