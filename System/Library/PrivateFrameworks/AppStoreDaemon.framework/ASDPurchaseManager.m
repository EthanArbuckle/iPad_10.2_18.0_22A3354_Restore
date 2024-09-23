@implementation ASDPurchaseManager

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3927F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_processPurchases_withReplyHandler_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_startPurchase_withReplyHandler_, 0, 0);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_startPurchase_withReplyHandler_, 0, 1);

  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ASDPurchaseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB98 != -1)
    dispatch_once(&qword_1ECFFAB98, block);
  return (id)_MergedGlobals_53;
}

void __35__ASDPurchaseManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_53;
  _MergedGlobals_53 = (uint64_t)v1;

}

- (ASDPurchaseManager)init
{
  void *v3;
  id v4;
  ASDPurchaseManager *v5;
  objc_super v7;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDPurchaseManager;
    v5 = -[ASDPurchaseManager init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
  }

  return self;
}

- (id)adopt:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v15 + 5);
  obj = (id)v15[5];
  objc_msgSend(v4, "getPurchaseServiceWithError:", &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__ASDPurchaseManager_adopt___block_invoke;
  v12[3] = &unk_1E37BDFB0;
  v12[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __28__ASDPurchaseManager_adopt___block_invoke_2;
  v11[3] = &unk_1E37BDFB0;
  v11[4] = &v14;
  objc_msgSend(v8, "adopt:withReplyHandler:", v3, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __28__ASDPurchaseManager_adopt___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __28__ASDPurchaseManager_adopt___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)adoptableBundleIdentifiers
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id obj;
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
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  v27 = (id)MEMORY[0x1E0C9AA60];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(v17 + 5);
  obj = (id)v17[5];
  objc_msgSend(v2, "getPurchaseServiceWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);

  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke;
  v14[3] = &unk_1E37BDFB0;
  v14[4] = &v16;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke_2;
  v13[3] = &unk_1E37BF5D8;
  v13[4] = &v22;
  objc_msgSend(v6, "adoptableBundleIdentifiersWithReplyHandler:", v13);

  if (v17[5])
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v17[5];
      *(_DWORD *)buf = 138543618;
      v29 = v10;
      v30 = 2114;
      v31 = v11;
      v12 = v10;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for adoptableBundleIdentifiers error: %{public}@", buf, 0x16u);

    }
  }
  v8 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

void __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__ASDPurchaseManager_adoptableBundleIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)adoptionStatus:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke;
  v9[3] = &unk_1E37BFD18;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v9);

}

void __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 40);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_3;
    v7[3] = &unk_1E37BDC28;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "adoptionStatus:withReplyHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPurchaseManager_adoptionStatus_withReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke;
  v15[3] = &unk_1E37BFD68;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v15);

}

void __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E37BFD40;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "purchaseBatch:additionalBuyParams:withReplyHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__ASDPurchaseManager_purchaseBatch_additionalBuyParams_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke;
  v15[3] = &unk_1E37BFD68;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v15);

}

void __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E37BFD40;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "purchaseBatchWithItemMetadata:additionalBuyParams:withReplyHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__ASDPurchaseManager_purchaseBatchWithItemMetadata_additionalBuyParams_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processPurchase:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  ASDServiceBroker *serviceBroker;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke;
  v11[3] = &unk_1E37BFD90;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v11);

}

void __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_3;
    v7[3] = &unk_1E37BFD40;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "processPurchase:withReplyHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPurchaseManager_processPurchase_withResponseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processPurchases:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  ASDServiceBroker *serviceBroker;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke;
  v11[3] = &unk_1E37BFD90;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v11);

}

void __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_3;
    v7[3] = &unk_1E37BFD40;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "processPurchases:withReplyHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPurchaseManager_processPurchases_withResponseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startPurchase:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id *v10;
  id v11;
  ASDServiceBroker *serviceBroker;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[StoreKitService shouldProcessStoreKitPurchase:](StoreKitService, "shouldProcessStoreKitPurchase:", v6))
  {
    ASDLogHandleForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v9 = v20;
      _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing ASDPurchase with StoreKit service", buf, 0xCu);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke;
    v17[3] = &unk_1E37BFDB8;
    v10 = &v18;
    v18 = v7;
    v11 = v7;
    +[StoreKitService processStoreKitPurchase:withResultHandler:](StoreKitService, "processStoreKitPurchase:withResultHandler:", v6, v17);
  }
  else
  {
    serviceBroker = self->_serviceBroker;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_2;
    v14[3] = &unk_1E37BFD90;
    v10 = &v16;
    v16 = v7;
    v15 = v6;
    v13 = v7;
    -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v14);

  }
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_3;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_4;
    v7[3] = &unk_1E37BFDB8;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "startPurchase:withReplyHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPurchaseManager_startPurchase_withResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkAutomaticDownloadQueue
{
  ASDServiceBroker *serviceBroker;
  _QWORD v3[5];

  serviceBroker = self->_serviceBroker;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke;
  v3[3] = &unk_1E37BFDE0;
  v3[4] = self;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v3);
}

void __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke_2;
    v3[3] = &unk_1E37BDDB0;
    v3[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "checkStoreQueue:", 0);

  }
}

void __49__ASDPurchaseManager_checkAutomaticDownloadQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in checkAutomaticDownloadQueue: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)checkPendingQueue
{
  ASDServiceBroker *serviceBroker;
  _QWORD v3[5];

  serviceBroker = self->_serviceBroker;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__ASDPurchaseManager_checkPendingQueue__block_invoke;
  v3[3] = &unk_1E37BFDE0;
  v3[4] = self;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v3);
}

void __39__ASDPurchaseManager_checkPendingQueue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __39__ASDPurchaseManager_checkPendingQueue__block_invoke_2;
    v3[3] = &unk_1E37BDDB0;
    v3[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "checkStoreQueue:", 1);

  }
}

void __39__ASDPurchaseManager_checkPendingQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in checkPendingQueue: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)checkPreflightForItemIdentifier:(id)a3 atURL:(id)a4 withReplyHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)renewReceiptForApplicationAtURL:(id)a3 withAppleID:(id)a4 password:(id)a5 forceSandbox:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASDServiceBroker *serviceBroker;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  serviceBroker = self->_serviceBroker;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E37BFE08;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a6;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v15;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v21);

}

void __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDB60;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 64);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E37BDB60;
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "renewReceiptForApplicationAtURL:withAppleID:password:forceSandbox:withReplyHandler:", v6, v7, v9, v8, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__ASDPurchaseManager_renewReceiptForApplicationAtURL_withAppleID_password_forceSandbox_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unadoptWithReplyHandler:(id)a3
{
  id v4;
  ASDServiceBroker *serviceBroker;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke;
  v7[3] = &unk_1E37BFE30;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getPurchaseServiceWithCompletionHandler:](serviceBroker, "getPurchaseServiceWithCompletionHandler:", v7);

}

void __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_3;
    v6[3] = &unk_1E37BDC28;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "unadoptWithReplyHandler:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__ASDPurchaseManager_unadoptWithReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
