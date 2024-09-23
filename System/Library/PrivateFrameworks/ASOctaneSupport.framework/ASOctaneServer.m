@implementation ASOctaneServer

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (id)shared_octaneServer;
}

void __24__ASOctaneServer_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_octaneServer;
  shared_octaneServer = v0;

}

- (ASOctaneServer)init
{
  ASOctaneServer *v2;
  uint64_t v3;
  NSXPCConnection *connectionToService;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ASOctaneServer;
  v2 = -[ASOctaneServer init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.ASOctaneSupportXPCService"));
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02904A0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_messageOfTypeForBundleID_messageReason_withReply_, 0, 1);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_messageForBundleID_withReply_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v2->_connectionToService, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection resume](v2->_connectionToService, "resume");

  }
  return v2;
}

- (int64_t)activePort
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__ASOctaneServer_activePort__block_invoke;
  v5[3] = &unk_1EA1F0C60;
  v5[4] = &v6;
  objc_msgSend(v2, "getPortWithReply:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__ASOctaneServer_activePort__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)appRemovedWithBundleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appRemovedWithBundleID:withReply:", v4, &__block_literal_global_119);

}

- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__ASOctaneServer_buyProductWithConfiguration_withReply___block_invoke;
  v10[3] = &unk_1EA1F0CA8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ASOctaneServer _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buyProductWithConfiguration:withReply:", v8, v7);

}

uint64_t __56__ASOctaneServer_buyProductWithConfiguration_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)buyProductWithID:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v18, obj);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__ASOctaneServer_buyProductWithID_bundleID___block_invoke;
  v11[3] = &unk_1EA1F0CD0;
  v11[4] = &v13;
  objc_msgSend(v8, "buyProductWithID:bundleID:withReply:", v6, v7, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ASOctaneServer_buyProductWithID_bundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_cancelTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0CD0;
  v10[4] = &v12;
  objc_msgSend(v7, "cancelTransactionWithIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_cancelTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v8 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ASOctaneServer_changeAutoRenewStatus_transactionID_bundleID___block_invoke;
  v12[3] = &unk_1EA1F0CD0;
  v12[4] = &v14;
  objc_msgSend(v9, "changeAutoRenewStatus:transactionID:bundleID:withReply:", v6, a4, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __63__ASOctaneServer_changeAutoRenewStatus_transactionID_bundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)clearOverridesForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v15, obj);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ASOctaneServer_clearOverridesForBundleID___block_invoke;
  v8[3] = &unk_1EA1F0CD0;
  v8[4] = &v10;
  objc_msgSend(v5, "clearOverridesForBundleID:withReply:", v4, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__ASOctaneServer_clearOverridesForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 forBundleID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v8 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__ASOctaneServer_completeAskToBuyRequestWithResponse_transactionID_forBundleID___block_invoke;
  v12[3] = &unk_1EA1F0CD0;
  v12[4] = &v14;
  objc_msgSend(v9, "completeAskToBuyRequestWithResponse:transactionIdentifier:forBundleID:withReply:", v6, a4, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __80__ASOctaneServer_completeAskToBuyRequestWithResponse_transactionID_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)deleteAllTransactionsForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v15, obj);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ASOctaneServer_deleteAllTransactionsForBundleID___block_invoke;
  v8[3] = &unk_1EA1F0CD0;
  v8[4] = &v10;
  objc_msgSend(v5, "deleteAllTransactionsForBundleID:withRelpy:", v4, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __51__ASOctaneServer_deleteAllTransactionsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_deleteTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0CD0;
  v10[4] = &v12;
  objc_msgSend(v7, "deleteTransactionWithIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_deleteTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v20, obj);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__ASOctaneServer_expireOrRenewSubscriptionWithIdentifier_expire_forBundleID___block_invoke;
  v13[3] = &unk_1EA1F0CD0;
  v13[4] = &v15;
  objc_msgSend(v10, "expireOrRenewSubscriptionWithIdentifier:expire:forBundleID:withReply:", v8, v6, v9, v13);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __77__ASOctaneServer_expireOrRenewSubscriptionWithIdentifier_expire_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getStorefrontForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__ASOctaneServer_getStorefrontForBundleID___block_invoke;
  v8[3] = &unk_1EA1F0CF8;
  v8[4] = &v9;
  objc_msgSend(v5, "getStorefrontForBundleID:withReply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __43__ASOctaneServer_getStorefrontForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getTransactionDataForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer_getTransactionDataForBundleID___block_invoke;
  v8[3] = &unk_1EA1F0D20;
  v8[4] = &v9;
  objc_msgSend(v5, "getTransactionDataForBundleID:withReply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__ASOctaneServer_getTransactionDataForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_refundTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0CD0;
  v10[4] = &v12;
  objc_msgSend(v7, "refundTransactionWithIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_refundTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ASOctaneServer_resolveIssueForTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0CD0;
  v10[4] = &v12;
  objc_msgSend(v7, "resolveIssueForTransactionWithIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __71__ASOctaneServer_resolveIssueForTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setStorefront:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v18, obj);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__ASOctaneServer_setStorefront_forBundleID___block_invoke;
  v11[3] = &unk_1EA1F0CD0;
  v11[4] = &v13;
  objc_msgSend(v8, "setStorefront:forBundleID:withReply:", v6, v7, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ASOctaneServer_setStorefront_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ASOctaneServer_useConfigurationDirectory_forBundleID___block_invoke;
  v11[3] = &unk_1EA1F0D48;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "startServingConfiguration:forBundleID:withReply:", v10, v9, v11);

}

void __56__ASOctaneServer_useConfigurationDirectory_forBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Error setting configuration file %@ for %@: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (id)registerForEventOfType:(int64_t)a3 withFilterData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__ASOctaneServer_registerForEventOfType_withFilterData___block_invoke;
  v10[3] = &unk_1EA1F0D70;
  v10[4] = &v11;
  objc_msgSend(v7, "registerForEventOfType:filterData:withReply:", a3, v6, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __56__ASOctaneServer_registerForEventOfType_withFilterData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterForEventWithIdentifier:", v4);

}

- (id)messageForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ASOctaneServer_messageForBundleID___block_invoke;
  v8[3] = &unk_1EA1F0CF8;
  v8[4] = &v9;
  objc_msgSend(v5, "messageForBundleID:withReply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __37__ASOctaneServer_messageForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__ASOctaneServer_messageOfTypeForBundleID_messageReason___block_invoke;
  v11[3] = &unk_1EA1F0CF8;
  v11[4] = &v12;
  objc_msgSend(v8, "messageOfTypeForBundleID:messageReason:withReply:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __57__ASOctaneServer_messageOfTypeForBundleID_messageReason___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(id)a4 needsConsent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a5;
  v8 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__ASOctaneServer_startPriceIncreaseForTransactionID_bundleID_needsConsent___block_invoke;
  v12[3] = &unk_1EA1F0CD0;
  v12[4] = &v13;
  objc_msgSend(v9, "startPriceIncreaseForTransactionID:bundleID:needsConsent:withReply:", a3, v8, v5, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __75__ASOctaneServer_startPriceIncreaseForTransactionID_bundleID_needsConsent___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v8 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__ASOctaneServer_completePriceConsentRequestWithResponse_transactionIdentifier_forBundleID___block_invoke;
  v12[3] = &unk_1EA1F0CD0;
  v12[4] = &v13;
  objc_msgSend(v9, "completePriceConsentRequestWithResponse:transactionIdentifier:forBundleID:withReply:", v6, a4, v8, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __92__ASOctaneServer_completePriceConsentRequestWithResponse_transactionIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 forBundleID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__ASOctaneServer_validateSKAdNetworkSignature_withPublicKey_source_andParameters_forBundleID___block_invoke;
  v20[3] = &unk_1EA1F0D98;
  v17 = v15;
  v21 = v17;
  v22 = &v23;
  objc_msgSend(v16, "validateSKAdNetworkSignature:withPublicKey:source:andParameters:forBundleID:withReply:", v12, v13, a5, v14, v17, v20);

  v18 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __94__ASOctaneServer_validateSKAdNetworkSignature_withPublicKey_source_andParameters_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("Error validating SKAdNetwork signature for %@: %@"), *(_QWORD *)(a1 + 32), v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)generateSKANPostbackSignature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer_generateSKANPostbackSignature___block_invoke;
  v8[3] = &unk_1EA1F0DC0;
  v8[4] = &v9;
  objc_msgSend(v5, "generateSKANPostbackSignature:withReply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__ASOctaneServer_generateSKANPostbackSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!v3)
    NSLog(CFSTR("Error generating SKAN Postback"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ASOctaneServer_storeKitErrorForCategory_bundleID___block_invoke;
  v10[3] = &unk_1EA1F0C60;
  v10[4] = &v11;
  objc_msgSend(v7, "storeKitErrorForCategory:bundleID:withReply:", a3, v6, v10);

  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __52__ASOctaneServer_storeKitErrorForCategory_bundleID___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStoreKitError:forCategory:bundleID:withReply:", a3, a4, v8, &__block_literal_global_131);

}

- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ASOctaneServer_getIntegerValueForIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0C60;
  v10[4] = &v11;
  objc_msgSend(v7, "getIntegerValueForIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __59__ASOctaneServer_getIntegerValueForIdentifier_forBundleID___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke;
  v16[3] = &unk_1EA1F0CA8;
  v10 = v8;
  v17 = v10;
  v11 = a4;
  -[ASOctaneServer _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke_2;
  v14[3] = &unk_1EA1F0E08;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "getIntegerValueForIdentifier:forBundleID:withReply:", a3, v11, v14);

}

uint64_t __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error connecting to remote proxy: %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__ASOctaneServer_setIntegerValue_forIdentifier_forBundleID___block_invoke;
  v12[3] = &unk_1EA1F0CD0;
  v12[4] = &v14;
  objc_msgSend(v9, "setIntegerValue:forIdentifier:forBundleID:withReply:", a3, a4, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __60__ASOctaneServer_setIntegerValue_forIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ASOctaneServer_getStringValueForIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1EA1F0DC0;
  v10[4] = &v11;
  objc_msgSend(v7, "getStringValueForIdentifier:forBundleID:withReply:", a3, v6, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __58__ASOctaneServer_getStringValueForIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v9 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  obj = 0;
  -[ASOctaneServer _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v20, obj);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__ASOctaneServer_setStringValue_forIdentifier_forBundleID___block_invoke;
  v13[3] = &unk_1EA1F0CD0;
  v13[4] = &v15;
  objc_msgSend(v10, "setStringValue:forIdentifier:forBundleID:withReply:", v8, a4, v9, v13);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __59__ASOctaneServer_setStringValue_forIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_synchronousRemoteObjectProxy:(id *)a3
{
  NSXPCConnection *connectionToService;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  connectionToService = self->_connectionToService;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer__synchronousRemoteObjectProxy___block_invoke;
  v8[3] = &unk_1EA1F0CD0;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = (void *)v10[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __48__ASOctaneServer__synchronousRemoteObjectProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  NSLog(CFSTR("Error connecting to remote proxy: %@"), v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connectionToService;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  connectionToService = self->_connectionToService;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ASOctaneServer__remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1EA1F0CA8;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__ASOctaneServer__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
