@implementation WDClinicalOnboardingManager

- (WDClinicalOnboardingManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (WDClinicalOnboardingManager)initWithProfile:(id)a3
{
  id v4;
  WDClinicalOnboardingManager *v5;
  WDClinicalOnboardingManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDClinicalOnboardingManager;
  v5 = -[WDClinicalOnboardingManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WDClinicalOnboardingManager inFlightLoginViewController](self, "inFlightLoginViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingManager;
  -[WDClinicalOnboardingManager dealloc](&v4, sel_dealloc);
}

- (void)onboardWithActivity:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  WDClinicalOnboardingManager *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[WDClinicalOnboardingManager logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1BC30A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is onboarding with activity %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE18]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalOnboardingManager gatewayProxyWithActivity:](self, "gatewayProxyWithActivity:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[WDClinicalOnboardingManager profile](self, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clinicalAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke;
    v20[3] = &unk_1E74D1C08;
    v21 = v16;
    v22 = self;
    v23 = v7;
    v24 = v15;
    v25 = v6;
    objc_msgSend(v18, "fetchAllAccountsWithCompletion:", v20);

    v19 = v21;
  }
  else
  {
    -[WDClinicalOnboardingManager _deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:](self, "_deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:", 0, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShowProviderNotFound:", 1);
    -[WDClinicalOnboardingManager _startOrReplaceLoginWithLoginViewController:presentingViewController:](self, "_startOrReplaceLoginWithLoginViewController:presentingViewController:", v19, v7);
  }

}

void __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_2;
  v8[3] = &unk_1E74D1BE0;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_3;
  v6[3] = &unk_1E74D1B98;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "hk_firstObjectPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "_presentAccount:presentingViewController:sourceIdentifier:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "hk_filter:", &__block_literal_global_3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    objc_msgSend(*(id *)(a1 + 48), "onboardWithActivity:gatewayProxy:hasGatewayBackedAccounts:presentingViewController:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v5 != 0, *(_QWORD *)(a1 + 56));
  }

}

uint64_t __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "gateway");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gatewayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

BOOL __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "gateway");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)onboardWithActivity:(id)a3 gatewayProxy:(id)a4 hasGatewayBackedAccounts:(BOOL)a5 presentingViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v13 = *MEMORY[0x1E0D2EE18];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;

  if (v15)
  {
    v40 = v12;
    v17 = v11;
    v18 = *MEMORY[0x1E0D2EE30];
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE30]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;

    if (!v20)
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E0CB52D8];
      v11 = v17;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        -[WDClinicalOnboardingManager logPrefix](self, "logPrefix");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        HKSensitiveLogItem();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v28;
        v43 = 2114;
        v44 = v30;
        v45 = 2114;
        v46 = v31;
        _os_log_error_impl(&dword_1BC30A000, v27, OS_LOG_TYPE_ERROR, "%{public}@ was not able to parse onboarding options of type %{public}@ with error %{public}@", buf, 0x20u);

        v11 = v17;
      }
      goto LABEL_17;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE38]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v20, "integerValue") & 1) != 0)
    {
      v11 = v17;
      -[WDClinicalOnboardingManager setPendingOnboardingGateway:](self, "setPendingOnboardingGateway:", v17);
      -[WDClinicalOnboardingManager _deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:](self, "_deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:", 1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setNavigationBarHidden:", 0);
    }
    else
    {
      v11 = v17;
      if (!a5)
      {
        -[WDClinicalOnboardingManager setPendingOnboardingGateway:](self, "setPendingOnboardingGateway:", v17);
        +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDClinicalOnboardingManager profile](self, "profile");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "makeOnboadingTileViewControllerUsing:", v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F7B8]), "initWithRootViewController:", v24);
          -[WDClinicalOnboardingManager setOnboardingTileNavigationController:](self, "setOnboardingTileNavigationController:", v34);
          objc_msgSend(v40, "presentViewController:animated:completion:", v34, 1, 0);

        }
        v11 = v17;
        goto LABEL_16;
      }
      -[WDClinicalOnboardingManager _deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:](self, "_deepLinkOnboardingViewControllerWithOptions:sourceIdentifier:", 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setGatewayProxyToTry:", v17);
    }
    -[WDClinicalOnboardingManager _startOrReplaceLoginWithLoginViewController:presentingViewController:](self, "_startOrReplaceLoginWithLoginViewController:presentingViewController:", v24, v40);
LABEL_16:

LABEL_17:
    v12 = v40;
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v25 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
  {
    v35 = v25;
    -[WDClinicalOnboardingManager logPrefix](self, "logPrefix");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSensitiveLogItem();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v36;
    v43 = 2114;
    v44 = v38;
    v45 = 2114;
    v46 = v39;
    _os_log_error_impl(&dword_1BC30A000, v35, OS_LOG_TYPE_ERROR, "%{public}@ was not able to parse onboarding activity dictionary of type %{public}@ with error %{public}@", buf, 0x20u);

  }
  v21 = v16;
LABEL_18:

}

- (id)_deepLinkOnboardingViewControllerWithOptions:(unint64_t)a3 sourceIdentifier:(id)a4
{
  id v6;
  WDClinicalOnboardingOAuthNavigationViewController *v7;
  void *v8;
  WDClinicalOnboardingOAuthNavigationViewController *v9;

  v6 = a4;
  v7 = [WDClinicalOnboardingOAuthNavigationViewController alloc];
  -[WDClinicalOnboardingManager profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WDClinicalOnboardingOAuthNavigationViewController initWithContext:onboardingOptions:sourceIdentifier:profile:existingAccount:](v7, "initWithContext:onboardingOptions:sourceIdentifier:profile:existingAccount:", 5, a3, v6, v8, 0);

  return v9;
}

- (id)gatewayProxyWithActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  WDClinicalGatewayProxy *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D2EE18];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;

  if (v7)
  {

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE28]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;

    if (!v10)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[WDClinicalOnboardingManager gatewayProxyWithActivity:].cold.2();
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D2EE20]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;

    if (v13)
    {
      if (v10)
      {
        v14 = -[WDClinicalGatewayProxy initWithGatewayID:batchID:]([WDClinicalGatewayProxy alloc], "initWithGatewayID:batchID:", v10, v13);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[WDClinicalOnboardingManager gatewayProxyWithActivity:].cold.1();
    }
    v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
  {
    v17 = v15;
    -[WDClinicalOnboardingManager logPrefix](self, "logPrefix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSensitiveLogItem();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v18;
    v24 = 2114;
    v25 = v20;
    v26 = 2114;
    v27 = v21;
    _os_log_error_impl(&dword_1BC30A000, v17, OS_LOG_TYPE_ERROR, "%{public}@ was not able to fetch onboarding activity dictionary of type %{public}@ with error %{public}@", buf, 0x20u);

  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)_presentAccount:(id)a3 presentingViewController:(id)a4 sourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingManager profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeAccountDetailViewControllerForAccount:profile:sourceIdentifier:", v10, v12, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v16, sel_dismissAnimated_);
  objc_msgSend(v16, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F7B8]), "initWithRootViewController:", v16);
  objc_msgSend(v9, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)registerInflightOnboardingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke;
  v10[3] = &unk_1E74D1C30;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WDClinicalOnboardingManager _dismissInFlightLoginViewControllerIfExistsWithCompletion:](self, "_dismissInFlightLoginViewControllerIfExistsWithCompletion:", v10);

}

void __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke_cold_1(a1, v4);
  objc_msgSend(*(id *)(a1 + 32), "setInFlightLoginViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "onboardingTileNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inFlightLoginViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnboardingTileNavigationViewController:", v5);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)_startOrReplaceLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__WDClinicalOnboardingManager__startOrReplaceLoginWithLoginViewController_presentingViewController___block_invoke;
  v10[3] = &unk_1E74D1C58;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WDClinicalOnboardingManager _dismissInFlightLoginViewControllerIfExistsWithCompletion:](self, "_dismissInFlightLoginViewControllerIfExistsWithCompletion:", v10);

}

uint64_t __100__WDClinicalOnboardingManager__startOrReplaceLoginWithLoginViewController_presentingViewController___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (!a2)
    a2 = a1[6];
  return objc_msgSend(v3, "_startLoginWithLoginViewController:presentingViewController:", a1[5], a2);
}

- (void)_startLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
    -[WDClinicalOnboardingManager _startLoginWithLoginViewController:presentingViewController:].cold.1();
  -[WDClinicalOnboardingManager setInFlightLoginViewController:](self, "setInFlightLoginViewController:", v6);
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_dismissInFlightLoginViewControllerIfExistsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v4 = a3;
  -[WDClinicalOnboardingManager inFlightLoginViewController](self, "inFlightLoginViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "presentingViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
        -[WDClinicalOnboardingManager _dismissInFlightLoginViewControllerIfExistsWithCompletion:].cold.1();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __89__WDClinicalOnboardingManager__dismissInFlightLoginViewControllerIfExistsWithCompletion___block_invoke;
      v10[3] = &unk_1E74D1C80;
      v10[4] = self;
      v11 = v6;
      v12 = v8;
      v13 = v4;
      v9 = v8;
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v10);

      goto LABEL_9;
    }
    -[WDClinicalOnboardingManager setInFlightLoginViewController:](self, "setInFlightLoginViewController:", 0);
  }
  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_9:

}

uint64_t __89__WDClinicalOnboardingManager__dismissInFlightLoginViewControllerIfExistsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didDismissLoginViewController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_didDismissLoginViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDClinicalOnboardingManager inFlightLoginViewController](self, "inFlightLoginViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[WDClinicalOnboardingManager setInFlightLoginViewController:](self, "setInFlightLoginViewController:", 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
      -[WDClinicalOnboardingManager _didDismissLoginViewController:].cold.1();
  }

}

- (id)getPendingOnboardingGatewayAndClear
{
  WDClinicalGatewayProxy *v3;
  WDClinicalGatewayProxy *pendingOnboardingGateway;

  v3 = self->_pendingOnboardingGateway;
  pendingOnboardingGateway = self->_pendingOnboardingGateway;
  self->_pendingOnboardingGateway = 0;

  return v3;
}

- (HRProfile)profile
{
  return (HRProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (WDClinicalGatewayProxy)pendingOnboardingGateway
{
  return self->_pendingOnboardingGateway;
}

- (void)setPendingOnboardingGateway:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOnboardingGateway, a3);
}

- (WDClinicalOnboardingOAuthNavigationViewController)inFlightLoginViewController
{
  return (WDClinicalOnboardingOAuthNavigationViewController *)objc_loadWeakRetained((id *)&self->_inFlightLoginViewController);
}

- (void)setInFlightLoginViewController:(id)a3
{
  objc_storeWeak((id *)&self->_inFlightLoginViewController, a3);
}

- (HKNavigationController)inFlightClinicalSharingLoginViewController
{
  return (HKNavigationController *)objc_loadWeakRetained((id *)&self->_inFlightClinicalSharingLoginViewController);
}

- (void)setInFlightClinicalSharingLoginViewController:(id)a3
{
  objc_storeWeak((id *)&self->_inFlightClinicalSharingLoginViewController, a3);
}

- (HKNavigationController)onboardingTileNavigationController
{
  return (HKNavigationController *)objc_loadWeakRetained((id *)&self->_onboardingTileNavigationController);
}

- (void)setOnboardingTileNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingTileNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_onboardingTileNavigationController);
  objc_destroyWeak((id *)&self->_inFlightClinicalSharingLoginViewController);
  objc_destroyWeak((id *)&self->_inFlightLoginViewController);
  objc_storeStrong((id *)&self->_pendingOnboardingGateway, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)gatewayProxyWithActivity:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BC30A000, v4, v5, "%{public}@ tried to onboard using a deep link with no batch ID and found error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3();
}

- (void)gatewayProxyWithActivity:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BC30A000, v4, v5, "%{public}@ tried to onboard using a deep link with no gateway ID and found error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3();
}

void __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1BC30A000, v5, v6, "%{public}@ registering in-flight login view controller %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_startLoginWithLoginViewController:presentingViewController:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_0(&dword_1BC30A000, v3, v4, "%{public}@ starting login with login view controller %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)_dismissInFlightLoginViewControllerIfExistsWithCompletion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_0(&dword_1BC30A000, v3, v4, "%{public}@ dismissing in-flight login view controller %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)_didDismissLoginViewController:.cold.1()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  OUTLINED_FUNCTION_7_0();
  v13 = *MEMORY[0x1E0C80C00];
  v4 = v3;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "logPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "inFlightLoginViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = v5;
  v9 = 2114;
  v10 = v0;
  v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_1BC30A000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ did dismiss login view controller %{public}@ different from in-flight login view controller %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
