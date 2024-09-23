@implementation HKSourceStore

- (HKSourceStore)initWithHealthStore:(id)a3
{
  id v4;
  HKSourceStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSourceStore;
  v5 = -[HKSourceStore init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchAllSourcesWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke;
  v10[3] = &unk_1E37EE928;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllSourcesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E37EE950;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchHasSampleWithBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E37EE950;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSourceWithBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke;
  v14[3] = &unk_1E37EE950;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchOrderedSourcesForObjectType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke;
  v18[3] = &unk_1E37EE978;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateOrderedSources:forObjectType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  HKProxyProvider *proxyProvider;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__22;
  v46 = __Block_byref_object_dispose__22;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__22;
  v40 = __Block_byref_object_dispose__22;
  v41 = 0;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke;
  aBlock[3] = &unk_1E37E8FD0;
  aBlock[4] = &v42;
  aBlock[5] = &v36;
  v17 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_2;
  v29[3] = &unk_1E37EE9A0;
  v19 = v12;
  v30 = v19;
  v20 = v13;
  v31 = v20;
  v21 = v14;
  v32 = v21;
  v22 = v15;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_3;
  v28[3] = &unk_1E37E8B48;
  v28[4] = &v36;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v29, v28);
  v24 = (void *)v37[5];
  if (v24)
  {
    *a7 = objc_retainAutorelease(v24);
    v25 = (void *)v43[5];
    v43[5] = 0;

  }
  v26 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v26;
}

void __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sourceForAppleDeviceWithUUID:identifier:name:productType:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
