@implementation CNTUCallProviderManager

- (CNTUCallProviderManager)init
{
  CNTUCallProviderManager *v2;
  TUCallProviderManager *v3;
  TUCallProviderManager *callProviderManager;
  CNTUCallProviderManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNTUCallProviderManager;
  v2 = -[CNTUCallProviderManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (TUCallProviderManager *)objc_alloc_init(getTUCallProviderManagerClass_0());
    callProviderManager = v2->_callProviderManager;
    v2->_callProviderManager = v3;

    v5 = v2;
  }

  return v2;
}

uint64_t __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstPartyCallProvider:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "isActionType:supportedByProvider:", *(_QWORD *)(a1 + 40), v3);

  return v4;
}

- (BOOL)isFirstPartyCallProvider:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isTelephonyProvider") & 1) != 0 || (objc_msgSend(v3, "isFaceTimeProvider") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.telephonyutilities.callservicesd.TinCan")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.internal.suiuntool"));

    }
  }

  return v4;
}

- (id)thirdPartyCallProvidersForActionType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  CNTUCallProviderManager *v14;
  id v15;

  v4 = a3;
  -[CNTUCallProviderManager callProviderManager](self, "callProviderManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke;
  v13 = &unk_1EA604AC8;
  v14 = self;
  v15 = v4;
  v6 = v4;
  objc_msgSend(v5, "providersPassingTest:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_cn_map:", &__block_literal_global_15_0, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (id)providerManagerQueue
{
  if (providerManagerQueue_cn_once_token_2 != -1)
    dispatch_once(&providerManagerQueue_cn_once_token_2, &__block_literal_global_48);
  return (id)providerManagerQueue_cn_once_object_2;
}

void __47__CNTUCallProviderManager_providerManagerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.contacts.ContactsUICore.CNTUCallProviderManagerQueue", 0);
  v1 = (void *)providerManagerQueue_cn_once_object_2;
  providerManagerQueue_cn_once_object_2 = (uint64_t)v0;

}

- (id)observableForCallProvidersChangedWithSchedulerProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  CNTUCallProviderManager *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13AE8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke;
  v9[3] = &unk_1EA604AA0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

CNCallProvidersChangedCancelationToken *__82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNCallProvidersChangedCancelationToken *v4;
  CNTUCallProviderManagerDelegate *v5;
  uint64_t v6;
  id v7;
  CNTUCallProviderManagerDelegate *v8;
  void *v9;
  void *v10;
  CNTUCallProviderManagerDelegate *v11;
  _QWORD v13[5];
  CNTUCallProviderManagerDelegate *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = objc_alloc_init(CNCallProvidersChangedCancelationToken);
  v5 = [CNTUCallProviderManagerDelegate alloc];
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_2;
  v15[3] = &unk_1EA604A78;
  v16 = *(id *)(a1 + 32);
  v17 = v3;
  v7 = v3;
  v8 = -[CNTUCallProviderManagerDelegate initWithBlock:](v5, "initWithBlock:", v15);
  objc_msgSend(*(id *)(a1 + 40), "callProviderManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "providerManagerQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDelegate:queue:", v8, v10);

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_4;
  v13[3] = &unk_1EA6042B8;
  v13[4] = *(_QWORD *)(a1 + 40);
  v14 = v8;
  v11 = v8;
  -[CNCancelationToken addCancelationBlock:](v4, "addCancelationBlock:", v13);

  return v4;
}

void __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_3;
  v6[3] = &unk_1EA6042B8;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

void __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callProviderManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeDelegate:", *(_QWORD *)(a1 + 40));

}

CNTUCallProvider *__64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CNTUCallProvider *v3;

  v2 = a2;
  v3 = -[CNTUCallProvider initWithCallProvider:]([CNTUCallProvider alloc], "initWithCallProvider:", v2);

  return v3;
}

- (id)thirdPartyCallProviderWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  CNTUCallProvider *v9;
  CNTUCallProvider *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  CNTUCallProviderManager *v16;
  id v17;

  v4 = a3;
  -[CNTUCallProviderManager callProviderManager](self, "callProviderManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke;
  v15 = &unk_1EA604AC8;
  v16 = self;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v6, "_cn_firstObjectPassingTest:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [CNTUCallProvider alloc];
    v10 = -[CNTUCallProvider initWithCallProvider:](v9, "initWithCallProvider:", v8, v12, v13, v14, v15, v16);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstPartyCallProvider:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  return v4;
}

- (BOOL)isActionType:(id)a3 supportedByProvider:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C965F8])
    && (objc_msgSend(v6, "supportsAudioOnly") & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96658]))
  {
    v7 = objc_msgSend(v6, "supportsAudioAndVideo");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCallProviderManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

@end
