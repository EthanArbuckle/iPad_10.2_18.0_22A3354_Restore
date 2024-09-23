@implementation AMSMediaSharedProperties

+ (id)propertiesForMarketingItemTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)propertiesForMediaTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "URLKnownToBeTrusted");

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)propertiesForMercuryCacheFetchTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)propertiesForRatingsTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, 0, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertiesForStorefrontsTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, 0, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertiesForNotificationSettingsTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", CFSTR("com.apple.AppleMediaServices"), v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)propertiesForUserNotificationSettingsTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_propertiesForClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_initWithClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  AMSMediaSharedProperties *v16;
  void *v17;
  AMSURLSession *v18;
  AMSMediaTokenService *v19;
  AMSMediaProtocolHandler *v20;
  AMSURLSession *session;
  AMSURLSession *v22;
  AMSMediaTokenServiceProtocol *tokenService;
  objc_super v25;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)AMSMediaSharedProperties;
  v16 = -[AMSMediaSharedProperties init](&v25, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AMSURLSession initWithConfiguration:]([AMSURLSession alloc], "initWithConfiguration:", v17);
    v19 = -[AMSMediaTokenService initWithClientIdentifier:bag:]([AMSMediaTokenService alloc], "initWithClientIdentifier:bag:", v12, v14);
    -[AMSMediaTokenService setAccount:](v19, "setAccount:", v13);
    -[AMSMediaTokenService setClientInfo:](v19, "setClientInfo:", v15);
    -[AMSMediaTokenService setSession:](v19, "setSession:", v18);
    -[AMSMediaTokenService setURLKnownToBeTrusted:](v19, "setURLKnownToBeTrusted:", v7);
    v20 = -[AMSMediaProtocolHandler initWithTokenService:]([AMSMediaProtocolHandler alloc], "initWithTokenService:", v19);
    -[AMSURLSession setProtocolHandler:](v18, "setProtocolHandler:", v20);
    session = v16->_session;
    v16->_session = v18;
    v22 = v18;

    tokenService = v16->_tokenService;
    v16->_tokenService = (AMSMediaTokenServiceProtocol *)v19;

  }
  return v16;
}

+ (id)_propertiesForClientIdentifier:(id)a3 account:(id)a4 bag:(id)a5 clientInfo:(id)a6 URLKnownToBeTrusted:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  BOOL v30;
  _QWORD block[4];
  id v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__41;
  v39 = __Block_byref_object_dispose__41;
  v40 = 0;
  objc_msgSend(a1, "accessQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke;
  block[3] = &unk_1E25416B8;
  v33 = &v35;
  v34 = a1;
  v18 = v12;
  v32 = v18;
  dispatch_sync(v16, block);

  v19 = (void *)v36[5];
  if (!v19)
  {
    objc_msgSend(a1, "accessQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke_2;
    v23[3] = &unk_1E2542F38;
    v28 = &v35;
    v29 = a1;
    v24 = v18;
    v25 = v13;
    v26 = v14;
    v27 = v15;
    v30 = a7;
    dispatch_barrier_sync(v20, v23);

    v19 = (void *)v36[5];
  }
  v21 = v19;

  _Block_object_dispose(&v35, 8);
  return v21;
}

void __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 48), "sharedPropertiesMapTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __102__AMSMediaSharedProperties__propertiesForClientIdentifier_account_bag_clientInfo_URLKnownToBeTrusted___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 72), "sharedPropertiesMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = -[AMSMediaSharedProperties _initWithClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:]([AMSMediaSharedProperties alloc], "_initWithClientIdentifier:account:bag:clientInfo:URLKnownToBeTrusted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 72), "sharedPropertiesMapTable");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));

  }
}

+ (OS_dispatch_queue)accessQueue
{
  if (_MergedGlobals_120 != -1)
    dispatch_once(&_MergedGlobals_120, &__block_literal_global_75);
  return (OS_dispatch_queue *)(id)qword_1ECEAD5A8;
}

void __39__AMSMediaSharedProperties_accessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSMediaSharedProperties", MEMORY[0x1E0C80D50]);
  v1 = (void *)qword_1ECEAD5A8;
  qword_1ECEAD5A8 = (uint64_t)v0;

}

+ (NSMapTable)sharedPropertiesMapTable
{
  NSObject *v2;

  objc_msgSend(a1, "accessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (qword_1ECEAD5B0 != -1)
    dispatch_once(&qword_1ECEAD5B0, &__block_literal_global_7_1);
  return (NSMapTable *)(id)qword_1ECEAD5B8;
}

void __52__AMSMediaSharedProperties_sharedPropertiesMapTable__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD5B8;
  qword_1ECEAD5B8 = v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AMSMediaSharedProperties session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel");

  v4.receiver = self;
  v4.super_class = (Class)AMSMediaSharedProperties;
  -[AMSMediaSharedProperties dealloc](&v4, sel_dealloc);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenService, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
