@implementation StoreKitService

- (void)shouldContinueTransaction:(id)a3 withNewStorefront:(id)a4 replyBlock:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

+ (BOOL)shouldProcessStoreKitPurchase:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "buyParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CFDA08];
    objc_msgSend(v3, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buyParamsWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "parameterForKey:", CFSTR("productType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("A"));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)processStoreKitPurchase:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__StoreKitService_processStoreKitPurchase_withResultHandler___block_invoke;
  v26[3] = &unk_1E37BEA98;
  v28 = a1;
  v9 = v7;
  v27 = v9;
  +[StoreKitService storeKitServiceWithErrorHandler:](StoreKitService, "storeKitServiceWithErrorHandler:", v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CFDA08];
  objc_msgSend(v6, "buyParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buyParamsWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vendorName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(v6, "vendorName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("vendorName"));

  }
  objc_msgSend(v13, "parameterForKey:", CFSTR("bid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(v6, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v6, "bundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setParameter:forKey:", v20, CFSTR("bid"));

    }
  }
  objc_msgSend(v13, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __61__StoreKitService_processStoreKitPurchase_withResultHandler___block_invoke_12;
  v23[3] = &unk_1E37BEAC0;
  v24 = v9;
  v25 = a1;
  v22 = v9;
  objc_msgSend(v10, "processPaymentWithBuyParamsString:reply:", v21, v23);

}

void __61__StoreKitService_processStoreKitPurchase_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2112;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in StoreKit service - %@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v3, v5);

}

void __61__StoreKitService_processStoreKitPurchase_withResultHandler___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  ASDPurchaseResult *v7;
  uint64_t v8;
  id v9;
  id v10;
  ASDPurchaseResult *v11;
  id v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 138543618;
      *(_QWORD *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v4;
      v12 = *(id *)&v13[4];
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]: Error processing ASDPurchase with StoreKit service - %@", v13, 0x16u);

    }
    v7 = [ASDPurchaseResult alloc];
    v8 = 0;
    v9 = v4;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 138543362;
      *(_QWORD *)&v13[4] = objc_opt_class();
      v10 = *(id *)&v13[4];
      _os_log_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: StoreKit service finished processing ASDPurchase", v13, 0xCu);

    }
    v7 = [ASDPurchaseResult alloc];
    v8 = 1;
    v9 = 0;
  }
  v11 = -[ASDPurchaseResult initWithSuccess:error:](v7, "initWithSuccess:error:", v8, v9, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)storeKitServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__StoreKitService_storeKitServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E37BDB60;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__StoreKitService_storeKitServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_serviceConnection
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  StoreKitService *v6;

  if (_MergedGlobals_31 != -1)
    dispatch_once(&_MergedGlobals_31, &__block_literal_global_8);
  objc_msgSend((id)qword_1ECFFAA20, "lock");
  if (!qword_1ECFFAA28)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.storekitd"), 0);
    v3 = (void *)qword_1ECFFAA28;
    qword_1ECFFAA28 = v2;

    +[StoreKitService _storeKitServiceInterface](StoreKitService, "_storeKitServiceInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECFFAA28, "setRemoteObjectInterface:", v4);

    +[StoreKitService _storeKitClientInterface](StoreKitService, "_storeKitClientInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECFFAA28, "setExportedInterface:", v5);

    v6 = objc_alloc_init(StoreKitService);
    objc_msgSend((id)qword_1ECFFAA28, "setExportedObject:", v6);

    objc_msgSend((id)qword_1ECFFAA28, "setInterruptionHandler:", &__block_literal_global_18);
    objc_msgSend((id)qword_1ECFFAA28, "setInvalidationHandler:", &__block_literal_global_19);
    objc_msgSend((id)qword_1ECFFAA28, "resume");
  }
  objc_msgSend((id)qword_1ECFFAA20, "unlock");
  return (id)qword_1ECFFAA28;
}

void __37__StoreKitService__serviceConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)qword_1ECFFAA20;
  qword_1ECFFAA20 = (uint64_t)v0;

}

uint64_t __37__StoreKitService__serviceConnection__block_invoke_2()
{
  return +[StoreKitService _serviceConnectionInvalidated](StoreKitService, "_serviceConnectionInvalidated");
}

uint64_t __37__StoreKitService__serviceConnection__block_invoke_3()
{
  return +[StoreKitService _serviceConnectionInvalidated](StoreKitService, "_serviceConnectionInvalidated");
}

+ (void)_serviceConnectionInvalidated
{
  void *v2;

  objc_msgSend((id)qword_1ECFFAA20, "lock");
  v2 = (void *)qword_1ECFFAA28;
  qword_1ECFFAA28 = 0;

  objc_msgSend((id)qword_1ECFFAA20, "unlock");
}

+ (id)_storeKitServiceInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3920D0);
}

+ (id)_storeKitClientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE382348);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_downloadStatusChanged_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updatedTransactions_, 0, 0);

  return v2;
}

@end
