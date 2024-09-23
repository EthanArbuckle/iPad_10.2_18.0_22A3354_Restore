@implementation FCBundleEntitlementsProvider

void __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  FCBundleEntitlementsProviderResult *v19;
  void *v20;
  void *v21;
  void *v22;
  FCBundleEntitlementsProviderResult *v23;
  void *v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD block[5];
  id v34;
  id v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("running_ui_automation"));

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "paidBundleConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "offeredBundlePurchaseIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      NewsCoreUserDefaults();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerForKey:", CFSTR("simulate_bundle_subscription_state"));

      NewsCoreUserDefaults();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("simulate_bundle_subscription_is_family_member"));

      NewsCoreUserDefaults();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("simulate_bundle_subscription_is_amplify_user"));

      NewsCoreUserDefaults();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v15, "BOOLForKey:", CFSTR("simulate_bundle_subscription_is_services_bundle"));

      NewsCoreUserDefaults();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("simulate_bundle_subscription_paid_bundle_via_offer_activated"));

      v18 = CFSTR("servicesBundlePurchaseID");
      if (!(_DWORD)v7)
        v18 = 0;
      v19 = v18;
      v20 = 0;
      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "paidBundleViaOfferConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "vendorAdHocOfferIds");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      switch(v10)
      {
        case 3:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BundleEntitlementsProviderErrorDomain"), 5002, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 40);
          if (v25)
          {
            v26 = *(void (**)(void))(v25 + 16);
LABEL_16:
            v26();
          }
LABEL_17:

LABEL_25:
          goto LABEL_29;
        case 2:
          v23 = -[FCBundleEntitlementsProviderResult initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:]([FCBundleEntitlementsProviderResult alloc], "initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:", v8, 1, v12 ^ 1u, v19, v14, 0, v20);
LABEL_14:
          v24 = v23;
          v27 = *(_QWORD *)(a1 + 40);
          if (v27)
          {
            v26 = *(void (**)(void))(v27 + 16);
            goto LABEL_16;
          }
          goto LABEL_17;
        case 1:
          v23 = -[FCBundleEntitlementsProviderResult initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:]([FCBundleEntitlementsProviderResult alloc], "initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:", v8, 0, v12 ^ 1u, v19, v14, 0, v20);
          goto LABEL_14;
      }

    }
  }
  if (NFStoreDemoMode())
  {
    objc_msgSend(*(id *)(a1 + 32), "paidBundleConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "offeredBundlePurchaseIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "Temporary access activated with purchaseID:%@", buf, 0xCu);
    }
    if (v8)
    {
      v19 = -[FCBundleEntitlementsProviderResult initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:]([FCBundleEntitlementsProviderResult alloc], "initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:", v8, 0, 1, 0, 0, 0, 0);
      v31 = *(_QWORD *)(a1 + 40);
      if (v31)
        (*(void (**)(uint64_t, FCBundleEntitlementsProviderResult *, _QWORD))(v31 + 16))(v31, v19, 0);
      goto LABEL_25;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    dispatch_get_global_queue(2, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_5;
    block[3] = &unk_1E4647000;
    block[4] = v3;
    v36 = *(_BYTE *)(a1 + 48);
    v34 = *(id *)(a1 + 32);
    v35 = *(id *)(a1 + 40);
    dispatch_async(v32, block);

  }
  else
  {
    objc_msgSend(v3, "_fetchEntitlementsWithIgnoreCache:configuration:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
LABEL_29:

}

- (void)_fetchEntitlementsWithIgnoreCache:(BOOL)a3 configuration:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  -[FCBundleEntitlementsProvider entitlementService](self, "entitlementService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke;
  v13[3] = &unk_1E46470C8;
  v13[4] = self;
  v11 = v9;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "performEntitlementWithIgnoreCache:completion:", v6, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (FCEntitlementService)entitlementService
{
  return self->_entitlementService;
}

- (void)fetchEntitlementsWithIgnoreCache:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[FCBundleEntitlementsProvider configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke;
  v9[3] = &unk_1E4647050;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a3;
  FCCoreConfigurationFetch(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

void __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_2;
  v6[3] = &unk_1E4647028;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 48);
  v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

}

- (FCBundleEntitlementsProvider)initWithConfigurationManager:(id)a3 entitlementService:(id)a4
{
  id v7;
  id v8;
  FCBundleEntitlementsProvider *v9;
  FCBundleEntitlementsProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCBundleEntitlementsProvider;
  v9 = -[FCBundleEntitlementsProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_entitlementService, a4);
  }

  return v10;
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke(id *a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void (**v23)(id, _QWORD, void *);
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)FCPurchaseLog;
  if (v8)
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = v9;
    *(_DWORD *)buf = 138412802;
    v29 = objc_opt_class();
    v30 = 2114;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%@ failed to fetch entitlements with entitlements:%{public}@, error: %{public}@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = v9;
    *(_DWORD *)buf = 138412546;
    v29 = objc_opt_class();
    v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received with entitlements: %{public}@", buf, 0x16u);
  }

LABEL_7:
  objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_126);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "entitlementsOverrideProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1[4], "entitlementsOverrideProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entitlementsOverrideWithDefaultEntitlements:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "entitlements");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "error");
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
      v8 = (id)v16;
    }

  }
  if (objc_msgSend(v8, "code") == 3001)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 3001;
    goto LABEL_24;
  }
  if (!a3 || (v19 = objc_msgSend(v11, "count"), v8) || v19)
  {
    if (!v11 || v8 && !objc_msgSend(v11, "count"))
      goto LABEL_23;
    goto LABEL_22;
  }
  objc_msgSend(a1[4], "entitlementsOverrideProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (!v11)
    {
LABEL_23:
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 5001;
      goto LABEL_24;
    }
LABEL_22:
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_2;
    v24[3] = &unk_1E46470A0;
    v25 = v11;
    v26 = a1[5];
    v27 = a1[6];
    FCPerformIfNonNil(WeakRetained, v24);

    v22 = v25;
    goto LABEL_26;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = 5003;
LABEL_24:
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BundleEntitlementsProviderErrorDomain"), v18, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void (**)(id, _QWORD, void *))a1[6];
  if (v23)
    v23[2](v23, 0, v22);
LABEL_26:

}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->entitlementsOverrideProvider;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, a3);
}

uint64_t __76__FCBundleEntitlementsProvider_fetchEntitlementsWithIgnoreCache_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEntitlementsWithIgnoreCache:configuration:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

FCSubscriptionEntitlement *__91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  FCSubscriptionEntitlement *v3;

  v2 = a2;
  v3 = -[FCSubscriptionEntitlement initWithASDEntitlement:]([FCSubscriptionEntitlement alloc], "initWithASDEntitlement:", v2);

  return v3;
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  FCBundleEntitlementsProviderResult *v5;
  FCBundleEntitlementsProviderResult *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v3 = a2;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__51;
  v55 = __Block_byref_object_dispose__51;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__51;
  v49 = __Block_byref_object_dispose__51;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__51;
  v31 = __Block_byref_object_dispose__51;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__51;
  v25 = __Block_byref_object_dispose__51;
  v26 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_12;
  v12 = &unk_1E4647078;
  v4 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = &v51;
  v15 = &v45;
  v16 = &v41;
  v17 = &v37;
  v18 = &v33;
  v19 = &v27;
  v20 = &v21;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);
  if (v52[5])
  {
    v5 = [FCBundleEntitlementsProviderResult alloc];
    v6 = -[FCBundleEntitlementsProviderResult initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:](v5, "initWithBundlePurchaseID:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:vendorAdHocOfferID:", v52[5], *((unsigned __int8 *)v42 + 24), *((unsigned __int8 *)v38 + 24), v46[5], *((unsigned __int8 *)v34 + 24), v22[5], v28[5], v9, v10, v11, v12);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, FCBundleEntitlementsProviderResult *, _QWORD))(v7 + 16))(v7, v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BundleEntitlementsProviderErrorDomain"), 5002, 0);
    v6 = (FCBundleEntitlementsProviderResult *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, FCBundleEntitlementsProviderResult *))(v8 + 16))(v8, 0, v6);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
}

void __91__FCBundleEntitlementsProvider__fetchEntitlementsWithIgnoreCache_configuration_completion___block_invoke_12(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "paidBundleConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restorableBundlePurchaseIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inAppAdamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if (v10)
  {
    objc_msgSend(v26, "inAppAdamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(v26, "servicesBundleAdamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v26, "isTrialPeriod");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v26, "isPurchaser");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v26, "isAmplifyUser");
    objc_msgSend(v26, "vendorAdHocOfferID");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    objc_msgSend(v26, "initialPurchaseTimestamp");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    *a4 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, 0);
}

@end
