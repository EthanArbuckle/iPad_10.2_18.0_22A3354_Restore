@implementation VSAccountManager

- (VSAccountManager)init
{
  VSAccountManager *v2;
  uint64_t v3;
  VSSecurityTask *securityTask;
  uint64_t v5;
  VSPrivacyInfoCenter *privacyInfoCenter;
  uint64_t v7;
  VSViewServiceRequestCenter *requestCenter;
  VSLinkedOnOrAfterChecker *v9;
  VSLinkedOnOrAfterChecker *linkedOnOrAfterChecker;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VSAccountManager;
  v2 = -[VSAccountManager init](&v12, sel_init);
  if (v2)
  {
    +[VSSecurityTask currentSecurityTask](VSSecurityTask, "currentSecurityTask");
    v3 = objc_claimAutoreleasedReturnValue();
    securityTask = v2->_securityTask;
    v2->_securityTask = (VSSecurityTask *)v3;

    +[VSPrivacyInfoCenter sharedPrivacyInfoCenter](VSPrivacyInfoCenter, "sharedPrivacyInfoCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    privacyInfoCenter = v2->_privacyInfoCenter;
    v2->_privacyInfoCenter = (VSPrivacyInfoCenter *)v5;

    +[VSViewServiceRequestCenter sharedViewServiceRequestCenter](VSViewServiceRequestCenter, "sharedViewServiceRequestCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    requestCenter = v2->_requestCenter;
    v2->_requestCenter = (VSViewServiceRequestCenter *)v7;

    v9 = objc_alloc_init(VSLinkedOnOrAfterChecker);
    linkedOnOrAfterChecker = v2->_linkedOnOrAfterChecker;
    v2->_linkedOnOrAfterChecker = v9;

  }
  return v2;
}

- (void)viewServiceRequestOperation:(id)a3 presentViewController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "VSAccountManagerDelegate";
    v13 = 2080;
    v14 = "accountManager:presentViewController:";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will call -[%s %s]", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke;
  v9[3] = &unk_1E939F138;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke((uint64_t)v9);
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "VSAccountManagerDelegate";
    v13 = 2080;
    v14 = "accountManager:presentViewController:";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Did call -[%s %s]", buf, 0x16u);
  }

}

void __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountManager:presentViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)viewServiceRequestOperation:(id)a3 dismissViewController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "VSAccountManagerDelegate";
    v13 = 2080;
    v14 = "accountManager:dismissViewController:";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will call -[%s %s]", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke;
  v9[3] = &unk_1E939F138;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke((uint64_t)v9);
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "VSAccountManagerDelegate";
    v13 = 2080;
    v14 = "accountManager:dismissViewController:";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Did call -[%s %s]", buf, 0x16u);
  }

}

void __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountManager:dismissViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)viewServiceRequestOperation:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[VSAccountManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "accountManager:shouldAuthenticateAccountProviderWithIdentifier:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)checkAccessStatusWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  NSDictionary *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  VSViewServiceRequest *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  VSViewServiceRequest *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = options;
  v7 = completionHandler;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSRequireUsageInfoPlistKey();
  if (v6)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options parameter must not be nil."));
    if (v7)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
LABEL_5:
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
  -[VSAccountManager securityTask](self, "securityTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v10 = VSCheckEntitlementForTask(v9, &v40);
  v11 = v40;

  if (v10)
  {
    -[VSAccountManager privacyInfoCenter](self, "privacyInfoCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "accountAccessStatus");
    v14 = v13;
    if ((unint64_t)(v13 - 1) < 3)
    {
      -[VSAccountManager requestCenter](self, "requestCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_79;
      v34[3] = &unk_1E939F540;
      v36 = v14;
      v35 = v7;
      v16 = (id)objc_msgSend(v15, "enqueueCompletionHandlerBlock:", v34);

      v17 = v35;
LABEL_15:

      goto LABEL_16;
    }
    if (!v13)
    {
      v17 = objc_alloc_init(VSViewServiceRequest);
      -[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("VSCheckAccessOptionPrompt"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      -[VSViewServiceRequest setAllowsPrivacyUI:](v17, "setAllowsPrivacyUI:", v28);
      -[VSViewServiceRequest setRequiresPrivacyUI:](v17, "setRequiresPrivacyUI:", v28);
      -[VSAccountManager linkedOnOrAfterChecker](self, "linkedOnOrAfterChecker");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSViewServiceRequest setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:](v17, "setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:", objc_msgSend(v29, "shouldPerformBehavior:", 2));

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2;
      v37[3] = &unk_1E939F338;
      v38 = v12;
      v39 = v7;
      v30 = -[VSAccountManager _enqueueViewServiceRequest:completionHandler:](self, "_enqueueViewServiceRequest:completionHandler:", v17, v37);

      goto LABEL_15;
    }
  }
  else
  {
    VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[VSAccountManager checkAccessStatusWithOptions:completionHandler:].cold.1((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);

    -[VSAccountManager requestCenter](self, "requestCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_80;
    v31[3] = &unk_1E939F1A8;
    v33 = v7;
    v32 = v11;
    v26 = (id)objc_msgSend(v25, "enqueueCompletionHandlerBlock:", v31);

    v12 = v33;
  }
LABEL_16:

}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  CFTypeID v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = a3;
  if (objc_msgSend(CFSTR("VSCheckAccessOptionPrompt"), "isEqual:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v5 = CFGetTypeID(v4), v5 != CFBooleanGetTypeID()))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported value %@ for %@ option"), v4, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported option: %@"), v7, v6);
  }

}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_73;
  v7[3] = &unk_1E939F1F8;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_73((uint64_t)v7);
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]_block_invoke_4";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }

}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_73(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "accountAccessStatus");
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2_74;
  v8[3] = &unk_1E939F4F0;
  v4 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = v2;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E939F518;
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  objc_msgSend(v4, "unwrapObject:error:", v8, v5);

}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2_74(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 40) == 3)
  {
    v2 = 0;
  }
  else
  {
    VSPublicError(0, 0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_enqueueViewServiceRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[VSAccountManager privacyInfoCenter](self, "privacyInfoCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountManager requestCenter](self, "requestCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "accountAccessStatus");
  if ((unint64_t)(v10 - 1) < 2)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E939F2E8;
    v12 = &v19;
    v19 = v7;
    objc_msgSend(v9, "enqueueCompletionHandlerBlock:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 && v10 != 3)
      goto LABEL_7;
    -[VSAccountManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_2;
    v15[3] = &unk_1E939F338;
    v12 = &v16;
    v16 = v8;
    v17 = v7;
    objc_msgSend(v9, "enqueueRequest:withAccountManagerDelegate:operationDelegate:completionHandler:", v6, v11, self, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v13)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
    v13 = 0;
  }

  return v13;
}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  VSPublicError(0, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E939F568;
  v11 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v5;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_4;
  v7[3] = &unk_1E939F590;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v6, "unwrapObject:error:", v10, v7);

}

uint64_t __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateAccountAccessStatusWithResponse:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "updateAccountAccessStatusWithError:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (VSAccountManagerResult)enqueueAccountMetadataRequest:(VSAccountMetadataRequest *)request completionHandler:(void *)completionHandler
{
  VSAccountMetadataRequest *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  VSViewServiceRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  VSViewServiceRequest *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = request;
  v7 = completionHandler;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSRequireUsageInfoPlistKey();
  if (v6)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The request parameter must not be nil."));
    if (v7)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
LABEL_5:
  -[VSAccountManager securityTask](self, "securityTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v10 = VSCheckEntitlementForTask(v9, &v30);
  v11 = v30;

  if (v10)
  {
    v12 = objc_alloc_init(VSViewServiceRequest);
    -[VSViewServiceRequest setAccountMetadataRequest:](v12, "setAccountMetadataRequest:", v6);
    -[VSAccountManager linkedOnOrAfterChecker](self, "linkedOnOrAfterChecker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceRequest setShouldInferFeaturedProviders:](v12, "setShouldInferFeaturedProviders:", objc_msgSend(v13, "shouldPerformBehavior:", 1) ^ 1);

    -[VSViewServiceRequest setAllowsPrivacyUI:](v12, "setAllowsPrivacyUI:", -[VSAccountMetadataRequest isInterruptionAllowed](v6, "isInterruptionAllowed"));
    -[VSViewServiceRequest setRequiresPrivacyUI:](v12, "setRequiresPrivacyUI:", 0);
    -[VSAccountManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceRequest setCanVetoAuthentication:](v12, "setCanVetoAuthentication:", objc_opt_respondsToSelector() & 1);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke;
    v28[3] = &unk_1E939F5E0;
    v29 = v7;
    -[VSAccountManager _enqueueViewServiceRequest:completionHandler:](self, "_enqueueViewServiceRequest:completionHandler:", v12, v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    VSErrorLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[VSAccountManager enqueueAccountMetadataRequest:completionHandler:].cold.1((uint64_t)v11, v16, v17, v18, v19, v20, v21, v22);

    -[VSAccountManager requestCenter](self, "requestCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_88;
    v25[3] = &unk_1E939F1A8;
    v27 = v7;
    v26 = v11;
    objc_msgSend(v23, "enqueueCompletionHandlerBlock:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v27;
  }

  if (!v15)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The managerResult parameter must not be nil."));

  return (VSAccountManagerResult *)v15;
}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_86;
  v7[3] = &unk_1E939F3B0;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_86((uint64_t)v7);
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]_block_invoke_4";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }

}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_86(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E939F5B8;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_3;
  v4[3] = &unk_1E939F2C0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "unwrapObject:error:", v6, v4);

}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "accountMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (VSSecurityTask)securityTask
{
  return self->_securityTask;
}

- (void)setSecurityTask:(id)a3
{
  objc_storeStrong((id *)&self->_securityTask, a3);
}

- (VSPrivacyInfoCenter)privacyInfoCenter
{
  return self->_privacyInfoCenter;
}

- (void)setPrivacyInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_privacyInfoCenter, a3);
}

- (VSViewServiceRequestCenter)requestCenter
{
  return self->_requestCenter;
}

- (void)setRequestCenter:(id)a3
{
  objc_storeStrong((id *)&self->_requestCenter, a3);
}

- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker
{
  return self->_linkedOnOrAfterChecker;
}

- (void)setLinkedOnOrAfterChecker:(id)a3
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, 0);
  objc_storeStrong((id *)&self->_requestCenter, 0);
  objc_storeStrong((id *)&self->_privacyInfoCenter, 0);
  objc_storeStrong((id *)&self->_securityTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)checkAccessStatusWithOptions:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Check access caller process lacks entitlement: %@", a5, a6, a7, a8, 2u);
}

- (void)enqueueAccountMetadataRequest:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Metadata request caller process lacks entitlement: %@", a5, a6, a7, a8, 2u);
}

@end
