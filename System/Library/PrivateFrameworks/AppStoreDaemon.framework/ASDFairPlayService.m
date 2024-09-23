@implementation ASDFairPlayService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392430);
}

+ (ASDFairPlayService)defaultService
{
  if (qword_1ECFFAAF8 != -1)
    dispatch_once(&qword_1ECFFAAF8, &__block_literal_global_17);
  return (ASDFairPlayService *)(id)_MergedGlobals_43;
}

void __36__ASDFairPlayService_defaultService__block_invoke()
{
  ASDFairPlayService *v0;
  void *v1;
  ASDFairPlayService *v2;
  void *v3;
  id v4;
  objc_super v5;

  v0 = [ASDFairPlayService alloc];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDFairPlayService;
    v2 = (ASDFairPlayService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2)
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
  }

  v3 = (void *)_MergedGlobals_43;
  _MergedGlobals_43 = (uint64_t)v0;

}

- (id)generateKeybagRequestForDSID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v6 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke;
  v12[3] = &unk_1E37BDFB0;
  v12[4] = &v13;
  -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke_2;
  v11[3] = &unk_1E37BF438;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "generateKeybagRequestForDSID:completionHandler:", a3, v11);
  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(uint64_t)a1
{
  void (**v3)(id, id);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v9 = 0;
    objc_msgSend(v4, "getFairPlayServiceWithError:", &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v5)
    {
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3[2](v3, v6);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __57__ASDFairPlayService_generateKeybagRequestForDSID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)generateSubscriptionRequestForDSID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v6 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke;
  v12[3] = &unk_1E37BDFB0;
  v12[4] = &v13;
  -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke_2;
  v11[3] = &unk_1E37BF438;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v7, "generateSubscriptionRequestForDSID:completionHandler:", a3, v11);
  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__ASDFairPlayService_generateSubscriptionRequestForDSID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)importKeybag:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v7 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__ASDFairPlayService_importKeybag_error___block_invoke;
  v14[3] = &unk_1E37BDFB0;
  v14[4] = &v15;
  -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __41__ASDFairPlayService_importKeybag_error___block_invoke_2;
  v13[3] = &unk_1E37BDFB0;
  v13[4] = &v15;
  objc_msgSend(v8, "importKeybag:completionHandler:", v6, v13);
  v9 = v16;
  if (a4)
  {
    v10 = (void *)v16[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v16;
    }
  }
  v11 = v9[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __41__ASDFairPlayService_importKeybag_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41__ASDFairPlayService_importKeybag_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)importSubscriptionKeybag:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v7 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke;
  v14[3] = &unk_1E37BDFB0;
  v14[4] = &v15;
  -[ASDFairPlayService _synchronousRemoteObjectProxyWithErrorHandler:]((uint64_t)self, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke_2;
  v13[3] = &unk_1E37BDFB0;
  v13[4] = &v15;
  objc_msgSend(v8, "importSubscriptionKeybag:completionHandler:", v6, v13);
  v9 = v16;
  if (a4)
  {
    v10 = (void *)v16[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v16;
    }
  }
  v11 = v9[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__ASDFairPlayService_importSubscriptionKeybag_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
