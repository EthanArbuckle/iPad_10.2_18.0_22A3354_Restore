@implementation WDClinicalSourcesDataProvider

- (WDClinicalSourcesDataProvider)initWithHealthRecordsStore:(id)a3
{
  id v5;
  WDClinicalSourcesDataProvider *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKClinicalAccountStore *clinicalAccountStore;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDClinicalSourcesDataProvider;
  v6 = -[WDClinicalSourcesDataProvider init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D2EE98]);
    objc_msgSend(v5, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithHealthStore:", v8);
    clinicalAccountStore = v6->_clinicalAccountStore;
    v6->_clinicalAccountStore = (HKClinicalAccountStore *)v9;

    objc_storeStrong((id *)&v6->_healthRecordsStore, a3);
  }

  return v6;
}

- (WDClinicalSourcesDataProvider)init
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

- (void)_fetchAccountsForDisplayWithCompletion:(id)a3
{
  id v4;
  HKClinicalAccountStore *clinicalAccountStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clinicalAccountStore = self->_clinicalAccountStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke;
  v7[3] = &unk_1E74D18B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKClinicalAccountStore fetchAllAccountsWithCompletion:](clinicalAccountStore, "fetchAllAccountsWithCompletion:", v7);

}

void __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_orderAccountsForDisplay:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

- (id)fetchAccountsForDisplayWithCompletion:(id)a3
{
  id v4;
  WDCancellationToken *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(WDCancellationToken);
  objc_msgSend((id)objc_opt_class(), "_objectCompletionOnMainQueue:cancellationToken:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__WDClinicalSourcesDataProvider_fetchAccountsForDisplayWithCompletion___block_invoke;
  v9[3] = &unk_1E74D18E0;
  v10 = v6;
  v7 = v6;
  -[WDClinicalSourcesDataProvider _fetchAccountsForDisplayWithCompletion:](self, "_fetchAccountsForDisplayWithCompletion:", v9);

  return v5;
}

uint64_t __71__WDClinicalSourcesDataProvider_fetchAccountsForDisplayWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchAccessedAccountsForDisplayWithCompletion:(id)a3
{
  id v4;
  WDCancellationToken *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(WDCancellationToken);
  objc_msgSend((id)objc_opt_class(), "_objectCompletionOnMainQueue:cancellationToken:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke;
  v9[3] = &unk_1E74D18E0;
  v10 = v6;
  v7 = v6;
  -[WDClinicalSourcesDataProvider _fetchAccountsForDisplayWithCompletion:](self, "_fetchAccountsForDisplayWithCompletion:", v9);

  return v5;
}

void __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "hk_filter:", &__block_literal_global_1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

BOOL __79__WDClinicalSourcesDataProvider_fetchAccessedAccountsForDisplayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "lastFetchDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 completion:(id)a6
{
  return -[WDClinicalSourcesDataProvider _fetchLogoForBrand:fallback:size:options:completion:](self, "_fetchLogoForBrand:fallback:size:options:completion:", a3, a4, 0, a6, a5);
}

- (id)_fetchLogoForBrand:(id)a3 fallback:(id)a4 size:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  WDCancellationToken *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v28;
  _QWORD v29[4];
  _QWORD v30[2];
  id v31;
  id v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  WDClinicalSourcesDataProvider *v38;
  id v39;
  _QWORD v40[3];

  v12 = a3;
  v28 = a4;
  v13 = a7;
  v14 = objc_alloc_init(WDCancellationToken);
  objc_msgSend((id)objc_opt_class(), "_logoCompletionOnMainQueue:cancellationToken:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WDClinicalSourcesDataProvider healthRecordsStore](self, "healthRecordsStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_brandImageManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2;
    v29[3] = &unk_1E74D1950;
    v18 = a6;
    v19 = (id *)v30;
    v20 = v12;
    v30[0] = v20;
    v30[1] = self;
    v21 = &v31;
    v33 = a5;
    v22 = v28;
    v31 = v28;
    v32 = v15;
    v23 = v15;
    v24 = v28;
    objc_msgSend(v17, "retrieveLogoForBrand:size:options:completion:", v20, v18, v29, a5);

  }
  else
  {
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke;
    v37 = &unk_1E74D1928;
    v19 = (id *)v40;
    v21 = &v39;
    v38 = self;
    v22 = v28;
    v39 = v28;
    v40[0] = v15;
    *(double *)&v40[1] = a5;
    v25 = v15;
    v26 = v28;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }

  return v14;
}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_logoForFallback:size:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v1 + 16))(v1, v2, 1);

}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = v5;
  if (!v5)
  {
    if (objc_msgSend(v6, "code") != 608)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2_cold_1(a1, v9);
    }
    objc_msgSend(*(id *)(a1 + 40), "_logoForFallback:size:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_logoForFallback:(id)a3 size:(double)a4
{
  id v5;
  HRMonogrammer *v6;
  void *v7;

  v5 = a3;
  v6 = -[HRMonogrammer initWithDiameter:]([HRMonogrammer alloc], "initWithDiameter:", a4);
  -[HRMonogrammer monogramForFirstWordFromText:](v6, "monogramForFirstWordFromText:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchAccountOwnerForSource:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromSource:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  objc_msgSend(MEMORY[0x1E0CB6258], "accountOwnerType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__WDClinicalSourcesDataProvider_fetchAccountOwnerForSource_completion___block_invoke;
  v14[3] = &unk_1E74D1978;
  v15 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, v7, 0, 0, v14);

  -[WDClinicalSourcesDataProvider healthRecordsStore](self, "healthRecordsStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeQuery:", v11);

}

void __71__WDClinicalSourcesDataProvider_fetchAccountOwnerForSource_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3
{
  return -[WDClinicalSourcesDataProvider nameAndFormattedBirthDateForAccountOwner:useMultipleLines:](self, "nameAndFormattedBirthDateForAccountOwner:useMultipleLines:", a3, 0);
}

- (id)nameAndFormattedBirthDateForAccountOwner:(id)a3 useMultipleLines:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "birthDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalSourcesDataProvider formattedFullName:birthDate:useMultipleLines:](self, "formattedFullName:birthDate:useMultipleLines:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formattedFullName:(id)a3 birthDate:(id)a4 useMultipleLines:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  v9 = v7;
  if (v7)
  {
    v9 = v7;
    if (a4)
    {
      v10 = a4;
      objc_msgSend(v10, "displayString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateForUTC");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:toDate:options:", 4, v13, v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      HKIntegerFormatter();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "year"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromNumber:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("date_and_age_%@_%@"), &stru_1E74EA150, CFSTR("HealthUI-Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v21, v11, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        v23 = CFSTR("\n%@");
      else
        v23 = CFSTR(", %@");
      objc_msgSend(v8, "stringByAppendingFormat:", v23, v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3
{
  return -[WDClinicalSourcesDataProvider nameAndFormattedBirthDateForSignedClinicalDataSubject:useMultipleLines:](self, "nameAndFormattedBirthDateForSignedClinicalDataSubject:useMultipleLines:", a3, 0);
}

- (id)nameAndFormattedBirthDateForSignedClinicalDataSubject:(id)a3 useMultipleLines:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "birthDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalSourcesDataProvider formattedFullName:birthDate:useMultipleLines:](self, "formattedFullName:birthDate:useMultipleLines:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)beginInitialLoginSessionForGateway:(id)a3 fromViewController:(id)a4 loginCancelledHandler:(id)a5 errorHandler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  HRUIClinicalAccountLoginSession *v14;
  HKClinicalAccountStore *clinicalAccountStore;
  void *v16;
  HRUIClinicalAccountLoginSession *v17;
  id v18;
  id v19;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [HRUIClinicalAccountLoginSession alloc];
  clinicalAccountStore = self->_clinicalAccountStore;
  objc_msgSend(v12, "hk_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HRUIClinicalAccountLoginSession initWithAccountStore:presentationAnchor:funnelContext:](v14, "initWithAccountStore:presentationAnchor:funnelContext:", clinicalAccountStore, v16, 0);
  v19 = 0;
  LOBYTE(clinicalAccountStore) = -[HRUIClinicalAccountLoginSession startLoginWithGateway:loginCancelledHandler:callbackErrorHandler:error:](v17, "startLoginWithGateway:loginCancelledHandler:callbackErrorHandler:error:", v13, v11, v10, &v19);

  v18 = v19;
  if ((clinicalAccountStore & 1) == 0)
    v10[2](v10, v18);

}

- (void)beginReloginSessionForAccount:(id)a3 fromViewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 errorHandler:(id)a7
{
  void (**v12)(id, id);
  id v13;
  id v14;
  id v15;
  id v16;
  HRUIClinicalAccountLoginSession *v17;
  HKClinicalAccountStore *clinicalAccountStore;
  void *v19;
  HRUIClinicalAccountLoginSession *v20;
  id v21;
  id v22;

  v12 = (void (**)(id, id))a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [HRUIClinicalAccountLoginSession alloc];
  clinicalAccountStore = self->_clinicalAccountStore;
  objc_msgSend(v15, "hk_window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HRUIClinicalAccountLoginSession initWithAccountStore:presentationAnchor:funnelContext:](v17, "initWithAccountStore:presentationAnchor:funnelContext:", clinicalAccountStore, v19, 0);

  v22 = 0;
  LOBYTE(clinicalAccountStore) = -[HRUIClinicalAccountLoginSession startReloginToAccount:viewController:profile:loginCancelledHandler:callbackErrorHandler:error:](v20, "startReloginToAccount:viewController:profile:loginCancelledHandler:callbackErrorHandler:error:", v16, v15, v14, v13, v12, &v22);

  v21 = v22;
  if ((clinicalAccountStore & 1) == 0)
    v12[2](v12, v21);

}

- (id)appSourceRequestingAuthorizationForClinicalTypeWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WDClinicalSourcesDataProvider sourcesRequestingAuthorizationForClinicalTypes](self, "sourcesRequestingAuthorizationForClinicalTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "allSources", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "source");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)sourcesRequestingAuthorizationForClinicalTypes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB63D8], "allTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[WDClinicalSourcesDataProvider healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6330]), "initWithHealthStore:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke;
  v12[3] = &unk_1E74D19A0;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "fetchSourcesRequestingAuthorizationForTypes:completion:", v5, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D2F888]);
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithSources:", v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)fetchSignedClinicalDataRecordWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6BD0], "signedClinicalDataRecordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A88]), "initWithSampleType:predicate:", v8, v9);
  v11 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke;
  v17[3] = &unk_1E74D19C8;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v13 = v7;
  v14 = v6;
  v15 = (void *)objc_msgSend(v11, "initWithQueryDescriptors:limit:resultsHandler:", v12, 1, v17);

  -[WDClinicalSourcesDataProvider healthStore](self, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeQuery:", v15);

}

void __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(a3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

+ (id)_logoCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke;
  v11[3] = &unk_1E74D1A18;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = _Block_copy(v11);

  return v9;
}

void __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke_2;
  v8[3] = &unk_1E74D19F0;
  v9 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = a3;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __78__WDClinicalSourcesDataProvider__logoCompletionOnMainQueue_cancellationToken___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

+ (id)_objectCompletionOnMainQueue:(id)a3 cancellationToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke;
  v11[3] = &unk_1E74D1A68;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = _Block_copy(v11);

  return v9;
}

void __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke_2;
  block[3] = &unk_1E74D1A40;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__WDClinicalSourcesDataProvider__objectCompletionOnMainQueue_cancellationToken___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

- (id)_orderAccountsForDisplay:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3928];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("subtitle"), 1, sel_localizedCaseInsensitiveCompare_);
  v10[0] = v5;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKHealthStore)healthStore
{
  void *v2;
  void *v3;

  -[WDClinicalSourcesDataProvider healthRecordsStore](self, "healthRecordsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKHealthStore *)v3;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
}

void __72__WDClinicalSourcesDataProvider__fetchAccountsForDisplayWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Accounts fetch failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

void __85__WDClinicalSourcesDataProvider__fetchLogoForBrand_fallback_size_options_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1BC30A000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch image for brand %@: %{public}@", (uint8_t *)&v7, 0x16u);

}

void __79__WDClinicalSourcesDataProvider_sourcesRequestingAuthorizationForClinicalTypes__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Failed to fetch all sources requesting clinical types: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

void __88__WDClinicalSourcesDataProvider_fetchSignedClinicalDataRecordWithIdentifier_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1BC30A000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKSignedClinicalDataRecord with identifier %@, error: %@", (uint8_t *)&v5, 0x20u);
}

@end
