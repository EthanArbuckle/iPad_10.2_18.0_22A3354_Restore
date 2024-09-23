@implementation MLModelAssetResourceFactory

- (MLModelAssetResourceFactory)initWithImpl:(id)a3
{
  id v5;
  MLModelAssetResourceFactory *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *modelLoadQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *descriptionLoadQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *structureLoadQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLModelAssetResourceFactory;
  v6 = -[MLModelAssetResourceFactory init](&v17, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.modelLoadQueue", v7);
    modelLoadQueue = v6->_modelLoadQueue;
    v6->_modelLoadQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.descriptionLoadQueue", v10);
    descriptionLoadQueue = v6->_descriptionLoadQueue;
    v6->_descriptionLoadQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.coreml.MLModelAssetResourceFactory.structureLoadQueue", v13);
    structureLoadQueue = v6->_structureLoadQueue;
    v6->_structureLoadQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v6;
}

- (NSURL)compiledModelURL
{
  void *v2;
  void *v3;

  -[MLModelAssetResourceFactory impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compiledModelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)modelAssetDescriptionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MLModelAssetResourceFactory descriptionLoadQueue](self, "descriptionLoadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MLModelAssetResourceFactory_modelAssetDescriptionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3D66950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__20005;
  v26 = __Block_byref_object_dispose__20006;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__20005;
  v20 = __Block_byref_object_dispose__20006;
  v21 = 0;
  -[MLModelAssetResourceFactory modelLoadQueue](self, "modelLoadQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MLModelAssetResourceFactory_modelWithConfiguration_error___block_invoke;
  v12[3] = &unk_1E3D66978;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MLModelAssetResourceFactory modelLoadQueue](self, "modelLoadQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MLModelAssetResourceFactory_modelWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E3D669A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MLModelAssetResourceFactory structureLoadQueue](self, "structureLoadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MLModelAssetResourceFactory_modelStructureWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3D66950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)modelLoadQueue
{
  return self->_modelLoadQueue;
}

- (OS_dispatch_queue)descriptionLoadQueue
{
  return self->_descriptionLoadQueue;
}

- (OS_dispatch_queue)structureLoadQueue
{
  return self->_structureLoadQueue;
}

- (MLModelAssetResourceFactoryImpl)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_structureLoadQueue, 0);
  objc_storeStrong((id *)&self->_descriptionLoadQueue, 0);
  objc_storeStrong((id *)&self->_modelLoadQueue, 0);
}

void __67__MLModelAssetResourceFactory_modelStructureWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "modelStructureWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__MLModelAssetResourceFactory_modelWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "modelWithConfiguration:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __60__MLModelAssetResourceFactory_modelWithConfiguration_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "modelWithConfiguration:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __74__MLModelAssetResourceFactory_modelAssetDescriptionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "modelAssetDescriptionWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (MLModelAssetResourceFactory)resourceFactoryWithModelURL:(id)a3 error:(id *)a4
{
  id v5;
  MLModelAssetResourceFactoryOnDiskImpl *v6;
  MLModelAssetResourceFactory *v7;

  v5 = a3;
  v6 = -[MLModelAssetResourceFactoryOnDiskImpl initWithModelURL:error:]([MLModelAssetResourceFactoryOnDiskImpl alloc], "initWithModelURL:error:", v5, a4);
  if (v6)
    v7 = -[MLModelAssetResourceFactory initWithImpl:]([MLModelAssetResourceFactory alloc], "initWithImpl:", v6);
  else
    v7 = 0;

  return v7;
}

+ (MLModelAssetResourceFactory)resourceFactoryWithArchiveData:(id)a3
{
  id v3;
  MLModelAssetResourceFactoryInMemoryImpl *v4;
  MLModelAssetResourceFactory *v5;

  v3 = a3;
  v4 = -[MLModelAssetResourceFactoryInMemoryImpl initWithArchiveData:]([MLModelAssetResourceFactoryInMemoryImpl alloc], "initWithArchiveData:", v3);
  if (v4)
    v5 = -[MLModelAssetResourceFactory initWithImpl:]([MLModelAssetResourceFactory alloc], "initWithImpl:", v4);
  else
    v5 = 0;

  return v5;
}

@end
