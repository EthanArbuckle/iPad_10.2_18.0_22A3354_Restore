@implementation WebsiteDataUtilities

+ (void)getDatabaseQuotaForOrigin:(id)a3 currentQuota:(unint64_t)a4 currentOriginUsage:(unint64_t)a5 currentDatabaseUsage:(unint64_t)a6 expectedUsage:(unint64_t)a7 dialogPresenter:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  NSObject *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, int);
  void *v30;
  _QWORD v31[2];
  _QWORD block[4];
  id v33;
  _QWORD v34[4];
  id v35;

  v14 = a3;
  v15 = a8;
  v16 = a9;
  v17 = v16;
  if (!a4 && a7 <= 0x500000)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke;
    v34[3] = &unk_1E9CF1950;
    v18 = &v35;
    v35 = v16;
    v19 = MEMORY[0x1E0C80D38];
    v20 = v34;
LABEL_13:
    dispatch_async(v19, v20);
    goto LABEL_14;
  }
  v21 = 0;
  v22 = a7 + a5;
  if (a6)
    v22 = a4 + 0x100000;
  while (1)
  {
    v23 = leastPresetSizeGreaterThanOrEqualTo_presetQuotas[v21];
    if (v23 >= v22)
      break;
    if (++v21 == 6)
    {
      v24 = (double)v22 * 1.1;
      v23 = vcvtd_n_u64_f64(ceil(v24 / 52428800.0) * 50.0, 0x14uLL);
      if (v23 >> 23 >= 0x7D)
        v23 = (unint64_t)(ceil(v24 / 107374182.0) * 107374182.0);
      break;
    }
  }
  if (!v23)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke_2;
    block[3] = &unk_1E9CF1950;
    v18 = &v33;
    v33 = v16;
    v19 = MEMORY[0x1E0C80D38];
    v20 = block;
    goto LABEL_13;
  }
  v25 = (void *)MEMORY[0x1E0D4EC60];
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke_3;
  v30 = &unk_1E9CF57B0;
  v18 = (id *)v31;
  v31[0] = v16;
  v31[1] = v23;
  objc_msgSend(v25, "increaseDatabaseQuotaDialogForOrigin:newQuota:completionHandler:", v14, v23, &v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentDialog:sender:", v26, 0, v27, v28, v29, v30);

LABEL_14:
}

uint64_t __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __151__WebsiteDataUtilities_getDatabaseQuotaForOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_dialogPresenter_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = *(_QWORD *)(a1 + 40);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

@end
