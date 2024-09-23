@implementation DESCoreAnalyticsEventManager

+ (void)_sendCoreAnalyticsEvent:(id)a3 eventPayloadBuilder:(id)a4
{
  AnalyticsSendEventLazy();
}

+ (void)sendEventDeleteRecordForBundleID:(id)a3 removedCount:(unint64_t)a4
{
  id v6;
  int v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v7 = objc_msgSend(a1, "allowEventForBundleID:", v6);
  if (a4 && v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__DESCoreAnalyticsEventManager_sendEventDeleteRecordForBundleID_removedCount___block_invoke;
    v8[3] = &unk_1E706EFB0;
    v9 = v6;
    v10 = a4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.DeleteRecord"), v8);

  }
}

id __78__DESCoreAnalyticsEventManager_sendEventDeleteRecordForBundleID_removedCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("removedCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)sendEventWriteRecordForBundleID:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__DESCoreAnalyticsEventManager_sendEventWriteRecordForBundleID___block_invoke;
    v5[3] = &unk_1E706EFD8;
    v6 = v4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.WriteRecord"), v5);

  }
}

id __64__DESCoreAnalyticsEventManager_sendEventWriteRecordForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)sendEventMaintenanceWithActivityID:(id)a3 intervalSincePostedEvent:(double)a4 shouldSkip:(BOOL)a5 lockState:(int)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;
  int v15;
  BOOL v16;

  v10 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __113__DESCoreAnalyticsEventManager_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState___block_invoke;
  v12[3] = &unk_1E706F000;
  v13 = v10;
  v16 = a5;
  v14 = a4;
  v15 = a6;
  v11 = v10;
  objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.MaintenanceActivity"), v12);

}

id __113__DESCoreAnalyticsEventManager_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)(a1 + 32);
  v7[0] = CFSTR("activity");
  v7[1] = CFSTR("dnuskip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  v7[2] = CFSTR("intervalSincePostedEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  v7[3] = CFSTR("lockState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)sendEventActivityShouldDeferWithActivityID:(id)a3 connectionDuration:(float)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  float v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__DESCoreAnalyticsEventManager_sendEventActivityShouldDeferWithActivityID_connectionDuration___block_invoke;
  v8[3] = &unk_1E706F028;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.ActivityShouldDefer"), v8);

}

id __94__DESCoreAnalyticsEventManager_sendEventActivityShouldDeferWithActivityID_connectionDuration___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v6[1] = CFSTR("connectionDuration");
  v7[0] = v2;
  v6[0] = CFSTR("activity");
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)sendEventFetchPolicyForBundleID:(id)a3 success:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v6 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v6))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__DESCoreAnalyticsEventManager_sendEventFetchPolicyForBundleID_success___block_invoke;
    v7[3] = &unk_1E706F050;
    v8 = v6;
    v9 = a4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.PolicyFetched"), v7);

  }
}

id __72__DESCoreAnalyticsEventManager_sendEventFetchPolicyForBundleID_success___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("success");
  v6[0] = v1;
  v5[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)sendEventErrorForBundleID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v7 && objc_msgSend(a1, "allowEventForBundleID:", v6))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__DESCoreAnalyticsEventManager_sendEventErrorForBundleID_error___block_invoke;
    v8[3] = &unk_1E706F078;
    v9 = v6;
    v10 = v7;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.Error"), v8);

  }
}

id __64__DESCoreAnalyticsEventManager_sendEventErrorForBundleID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v21[0] = v4;
  v20[0] = CFSTR("type");
  v20[1] = CFSTR("domain");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  v20[3] = CFSTR("domain_code");
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%ld"), v8, objc_msgSend(*(id *)(a1 + 40), "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("underlying_domain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("underlying_code"));

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%ld"), v17, objc_msgSend(v13, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("underlying_domain_code"));

  }
  return v11;
}

+ (void)sendEventEvaluationSessionStartForBundleID:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__DESCoreAnalyticsEventManager_sendEventEvaluationSessionStartForBundleID___block_invoke;
    v5[3] = &unk_1E706EFD8;
    v6 = v4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.EvaluationSessionStart"), v5);

  }
}

id __75__DESCoreAnalyticsEventManager_sendEventEvaluationSessionStartForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)sendEventEvaluationSessionFinishForBundleID:(id)a3 success:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v6 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v6))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__DESCoreAnalyticsEventManager_sendEventEvaluationSessionFinishForBundleID_success___block_invoke;
    v7[3] = &unk_1E706F050;
    v8 = v6;
    v9 = a4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.EvaluationSessionFinish"), v7);

  }
}

id __84__DESCoreAnalyticsEventManager_sendEventEvaluationSessionFinishForBundleID_success___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("success");
  v6[0] = v1;
  v5[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)sendEventRecipeExpiredForBundleID:(id)a3 deferralTime:(float)a4
{
  _QWORD v6[4];
  float v7;

  if (objc_msgSend(a1, "allowEventForBundleID:", a3))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__DESCoreAnalyticsEventManager_sendEventRecipeExpiredForBundleID_deferralTime___block_invoke;
    v6[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
    v7 = a4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.RecipeExpired"), v6);
  }
}

id __79__DESCoreAnalyticsEventManager_sendEventRecipeExpiredForBundleID_deferralTime___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("deferralTime");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)sendEventDeferForBundleID:(id)a3 deadlineStr:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "allowEventForBundleID:", v6))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__DESCoreAnalyticsEventManager_sendEventDeferForBundleID_deadlineStr___block_invoke;
    v8[3] = &unk_1E706F078;
    v9 = v6;
    v10 = v7;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.DeferredWithDeadline"), v8);

  }
}

id __70__DESCoreAnalyticsEventManager_sendEventDeferForBundleID_deadlineStr___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("deadline");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)sendEventEvaluationCompletedForBundleID:(id)a3 duration:(float)a4 deferralTime:(float)a5 wasDeferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  float v21;
  float v22;
  BOOL v23;
  BOOL v24;

  v9 = a7;
  v14 = a3;
  v15 = a8;
  v16 = CFSTR("com.apple.des.EvaluationCompletedWithError");
  if (v9)
    v16 = CFSTR("com.apple.des.EvaluationCompletedSuccessfully");
  v17 = v16;
  if (objc_msgSend(a1, "allowEventForBundleID:", v14))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __120__DESCoreAnalyticsEventManager_sendEventEvaluationCompletedForBundleID_duration_deferralTime_wasDeferred_success_error___block_invoke;
    v18[3] = &unk_1E706F0C0;
    v19 = v14;
    v21 = a4;
    v22 = a5;
    v23 = a6;
    v24 = v9;
    v20 = v15;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", v17, v18);

  }
}

id __120__DESCoreAnalyticsEventManager_sendEventEvaluationCompletedForBundleID_duration_deferralTime_wasDeferred_success_error___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v21[0] = *(_QWORD *)(a1 + 32);
  v20[0] = CFSTR("type");
  v20[1] = CFSTR("duration");
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = CFSTR("deferralTime");
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  v20[3] = CFSTR("wasDeferred");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 57))
  {
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%ld"), v12, objc_msgSend(*(id *)(a1 + 40), "code"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("domain_code"));

      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%ld"), v17, objc_msgSend(v15, "code"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("underlying_domain_code"));

      }
    }
  }
  return v9;
}

+ (void)sendEventRecordsMatchedForBundleID:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__DESCoreAnalyticsEventManager_sendEventRecordsMatchedForBundleID___block_invoke;
    v5[3] = &unk_1E706EFD8;
    v6 = v4;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.RecordsMatched"), v5);

  }
}

id __67__DESCoreAnalyticsEventManager_sendEventRecordsMatchedForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)sendEventRecipeFetchedForBundleID:(id)a3 evaluationID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "allowEventForBundleID:", v8))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__DESCoreAnalyticsEventManager_sendEventRecipeFetchedForBundleID_evaluationID_error___block_invoke;
    v11[3] = &unk_1E706F0E8;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.RecipeFetched"), v11);

  }
}

id __85__DESCoreAnalyticsEventManager_sendEventRecipeFetchedForBundleID_evaluationID_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("evaluation_id");
  v1 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 32);
  v7[1] = v1;
  v6[2] = CFSTR("error");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("none");
  }
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)

  return v4;
}

+ (void)sendEventAttachmentDownloadsBundleID:(id)a3 duration:(float)a4 success:(BOOL)a5 downloadedAttachmentCount:(unint64_t)a6
{
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  float v14;
  BOOL v15;

  v10 = a3;
  if (objc_msgSend(a1, "allowEventForBundleID:", v10))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__DESCoreAnalyticsEventManager_sendEventAttachmentDownloadsBundleID_duration_success_downloadedAttachmentCount___block_invoke;
    v11[3] = &unk_1E706F000;
    v14 = a4;
    v15 = a5;
    v12 = v10;
    v13 = a6;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.AttachmentDownloads"), v11);

  }
}

id __112__DESCoreAnalyticsEventManager_sendEventAttachmentDownloadsBundleID_duration_success_downloadedAttachmentCount___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("type");
  v8[1] = CFSTR("duration");
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("downloadedAttachmentCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)sendEventEvaluationForBundleID:(id)a3 evaluationID:(id)a4 duration:(float)a5 deferred:(BOOL)a6 success:(BOOL)a7 error:(id)a8 downloadedAttachmentCount:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  BOOL v39;
  BOOL v40;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  if (objc_msgSend(a1, "allowEventForBundleID:", v16))
  {
    if (v18)
    {
      v30 = a9;
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%ld"), v20, objc_msgSend(v18, "code"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "domain");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@_%ld"), v25, objc_msgSend(v23, "code"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = 0;
      }

      a9 = v30;
    }
    else
    {
      v26 = 0;
      v21 = 0;
    }
    v27 = DESHourOfDayInUTC();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __134__DESCoreAnalyticsEventManager_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount___block_invoke;
    v31[3] = &unk_1E706F110;
    v32 = v16;
    v38 = a5;
    v39 = a6;
    v40 = a7;
    v36 = v27;
    v37 = a9;
    v33 = v17;
    v34 = v21;
    v35 = v26;
    v28 = v26;
    v29 = v21;
    objc_msgSend(a1, "_sendCoreAnalyticsEvent:eventPayloadBuilder:", CFSTR("com.apple.des.Evaluation"), v31);

  }
}

id __134__DESCoreAnalyticsEventManager_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v15[0] = CFSTR("type");
  v15[1] = CFSTR("evaluation_id");
  v4 = *(_QWORD *)(a1 + 40);
  v16[0] = *(_QWORD *)(a1 + 32);
  v16[1] = v4;
  v15[2] = CFSTR("duration");
  LODWORD(a2) = *(_DWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("deferred");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  v15[5] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 85));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  v15[6] = CFSTR("downloadedAttachmentCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("domain_code"));
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("underlying_domain_code"));
  return v11;
}

@end
