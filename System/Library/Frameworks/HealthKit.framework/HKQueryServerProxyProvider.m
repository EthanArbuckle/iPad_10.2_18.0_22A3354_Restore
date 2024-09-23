@implementation HKQueryServerProxyProvider

- (HKQueryServerProxyProvider)initWithHealthStore:(id)a3 query:(id)a4 configuration:(id)a5 queryUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HKQueryServerProxyProvider *v17;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "taskIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exportedInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HKQueryServerProxyProvider;
  v17 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](&v19, sel_initWithHealthStore_taskIdentifier_exportedObject_exportedInterface_remoteInterface_taskUUID_, v13, v14, v12, v15, v16, v11);

  if (v17)
    -[HKTaskServerProxyProvider setTaskConfiguration:](v17, "setTaskConfiguration:", v10);

  return v17;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  HKQueryServerProxyProvider *v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQueryServerProxyProvider.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[source isKindOfClass:HKHealthStore.class]"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke;
  v19[3] = &unk_1E37E8AA8;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  objc_msgSend(v11, "_serverProxyWithHandler:errorHandler:", v19, v15);

}

void __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "taskUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "taskConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "shouldForceReactivation");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke_2;
  v9[3] = &unk_1E37F3610;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v5, "remote_createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:completion:", v4, v6, v7, v8, v9);

}

uint64_t __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQueryServerProxyProvider.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[source isKindOfClass:HKHealthStore.class]"));

  }
  v11 = v9;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__45;
  v33 = __Block_byref_object_dispose__45;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__45;
  v27 = __Block_byref_object_dispose__45;
  v12 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke;
  v22[3] = &unk_1E37E8B48;
  v22[4] = &v23;
  objc_msgSend(v11, "_synchronousServerProxyWithErrorHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTaskServerProxyProvider taskUUID](self, "taskUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTaskServerProxyProvider taskConfiguration](self, "taskConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke_2;
  v21[3] = &unk_1E37F3638;
  v21[4] = &v29;
  v21[5] = &v23;
  objc_msgSend(v13, "remote_createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:completion:", v10, v14, v15, -[HKQueryServerProxyProvider shouldForceReactivation](self, "shouldForceReactivation"), v21);

  v16 = (id)v24[5];
  v17 = v16;
  if (v16)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError(v16);
  }

  v18 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)shouldForceReactivation
{
  return self->_shouldForceReactivation;
}

- (void)setShouldForceReactivation:(BOOL)a3
{
  self->_shouldForceReactivation = a3;
}

@end
