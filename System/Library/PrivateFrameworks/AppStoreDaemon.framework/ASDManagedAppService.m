@implementation ASDManagedAppService

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392670);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_submitVPPRequest_withReplyHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_submitManifestRequest_withReplyHandler_, 0, 0);

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestStatusWithReply_, 0, 1);

  return v2;
}

+ (id)defaultService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ASDManagedAppService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB78 != -1)
    dispatch_once(&qword_1ECFFAB78, block);
  return (id)_MergedGlobals_51;
}

void __38__ASDManagedAppService_defaultService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_51;
  _MergedGlobals_51 = (uint64_t)v1;

}

- (ASDManagedAppService)init
{
  ASDManagedAppService *v2;
  uint64_t v3;
  ASDServiceBroker *serviceBroker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDManagedAppService;
  v2 = -[ASDManagedAppService init](&v6, sel_init);
  if (v2)
  {
    +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
    v3 = objc_claimAutoreleasedReturnValue();
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;

  }
  return v2;
}

- (void)requestStatusWithResultHandler:(id)a3
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
  v7[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke;
  v7[3] = &unk_1E37BFA30;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getManagedAppServiceWithCompletionHandler:](serviceBroker, "getManagedAppServiceWithCompletionHandler:", v7);

}

void __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke(uint64_t a1, void *a2)
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
    v8[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_3;
    v6[3] = &unk_1E37BEF18;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "requestStatusWithReply:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ASDManagedAppService_requestStatusWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(v18 + 5);
  obj = (id)v18[5];
  objc_msgSend(v7, "getManagedAppServiceWithError:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &v17;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke_2;
  v14[3] = &unk_1E37BDFB0;
  v14[4] = &v17;
  objc_msgSend(v11, "showVPPInviteForCurrentUser:orgName:withReplyHandler:", v5, v6, v14);

  v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__ASDManagedAppService_showVPPInviteForCurrentUser_orgName___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)submitManifestRequest:(id)a3 withResultHandler:(id)a4
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
  v11[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BFA80;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getManagedAppServiceWithCompletionHandler:](serviceBroker, "getManagedAppServiceWithCompletionHandler:", v11);

}

void __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_2;
    v13[3] = &unk_1E37BE250;
    v15 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_3;
    v11[3] = &unk_1E37BFA58;
    v8 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v7, "submitManifestRequest:withReplyHandler:", v8, v11);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

  }
}

void __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "requestIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v5);

}

uint64_t __64__ASDManagedAppService_submitManifestRequest_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)submitVPPRequest:(id)a3 withResultHandler:(id)a4
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
  v11[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BFA80;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getManagedAppServiceWithCompletionHandler:](serviceBroker, "getManagedAppServiceWithCompletionHandler:", v11);

}

void __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_2;
    v15[3] = &unk_1E37BE250;
    v17 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_3;
    v13[3] = &unk_1E37BFAA8;
    v8 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v7, "submitVPPRequest:withReplyHandler:", v8, v13);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *, void *))(v9 + 16))(v9, v5, v10, v11, v12);

  }
}

void __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, void *))(v3 + 16))(v3, v5, v8, v6, v7);

}

uint64_t __59__ASDManagedAppService_submitVPPRequest_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
