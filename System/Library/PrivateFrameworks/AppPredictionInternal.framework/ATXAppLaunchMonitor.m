@implementation ATXAppLaunchMonitor

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  __CFString *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  __CFString *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v36 = a3;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2((uint64_t)v5, v6, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)MEMORY[0x1CAA48B6C](WeakRetained);
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__43;
    v49 = __Block_byref_object_dispose__43;
    v50 = 0;
    v11 = (void *)v9[4];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_75;
    v42[3] = &unk_1E82E1EA0;
    v44 = &v45;
    v43 = *(id *)(a1 + 32);
    objc_msgSend(v11, "runWithLockAcquired:", v42, v36);
    v12 = (void *)v46[5];
    objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isValidAppLaunchBundleId:", v14) & 1) != 0)
    {
      if (!objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipForBundleId:", v14))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)v46[5];
        objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = &stru_1E82FDC98;
        if (v20)
          v22 = (__CFString *)v20;
        v23 = v22;

        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_1();

        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByAppendingString:", CFSTR("-appLaunch"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_retainAutorelease(v27);
        objc_msgSend(v28, "UTF8String");
        v29 = (void *)os_transaction_create();
        v30 = (void *)MEMORY[0x1E0D81598];
        v31 = v9[1];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_80;
        v37[3] = &unk_1E82E1EC8;
        v37[4] = v9;
        v32 = v14;
        v38 = v32;
        v33 = v23;
        v39 = v33;
        v34 = v17;
        v40 = v34;
        v35 = v29;
        v41 = v35;
        objc_msgSend(v30, "runAsyncOnQueue:afterDelaySeconds:block:", v31, v37, 5.0);

        _Block_object_dispose(&v45, 8);
        goto LABEL_17;
      }
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v14;
        v16 = "Received an app clip bundle id: '%@' in app launch monitoring. Ignoring.";
LABEL_10:
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v14;
        v16 = "Received invalid bundle id: '%@' in app launch monitoring. Ignoring.";
        goto LABEL_10;
      }
    }

    _Block_object_dispose(&v45, 8);
LABEL_17:
    objc_autoreleasePoolPop(v10);
  }

}

void __72___ATXAppLaunchMonitor_processDonationsForPreviousAppSessionEndIfNeeded__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)a2[4];
  v5 = a2;
  objc_msgSend(v4, "lastAppLaunchDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (void *)a2[4];
  objc_msgSend(v9, "lastAppLaunch");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Donation processing - Processing donations for %@, launched on: %@", (uint8_t *)&v17, 0x16u);
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -5.0);
    objc_msgSend(*(id *)(a1 + 32), "updateActionPredictionPipelineForAppSession:startDate:endDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v16);

  }
}

id __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 24), "stopAppUsageAtDate:", *(_QWORD *)(a1 + 32));
  return (id)objc_opt_self();
}

void __29___ATXAppLaunchMonitor_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29___ATXAppLaunchMonitor_start__block_invoke_61;
  v6[3] = &unk_1E82E1DC0;
  v6[4] = &v7;
  objc_msgSend(v2, "runWithLockAcquired:", v6);
  if (v8[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v8[5]);
    v5 = v4;

    objc_msgSend(*(id *)(a1 + 32), "updateLaunchHistoryFromDuet:callback:", 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateLaunchHistoryFromDuet:callback:", 0, 1209600.0);
  }
  _Block_object_dispose(&v7, 8);

}

void __29___ATXAppLaunchMonitor_start__block_invoke_61(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a2 + 56), "predictionContextForCurrentContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAppLaunchDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __29___ATXAppLaunchMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D15C40];
  v3 = a2;
  objc_msgSend(v2, "userContext");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[1];
  v3[1] = v4;

}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -*(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__43;
  v25 = __Block_byref_object_dispose__43;
  v26 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_2;
  v20[3] = &unk_1E82E1DC0;
  v20[4] = &v21;
  objc_msgSend(v6, "runWithLockAcquired:", v20);
  v7 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  objc_msgSend(v7, "getAppLaunchesBetweenStartDate:endDate:", v4, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getScreenTransitionsBetweenStartDate:endDate:", v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_3;
  v14[3] = &unk_1E82E1E50;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v19 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "runAsyncWithLockAcquired:", v14);

  objc_autoreleasePoolPop(v2);
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v5 = a1[4];
  v6 = a1[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_4;
  v14[3] = &unk_1E82E1E28;
  v7 = v3;
  v8 = a1[6];
  v15 = v7;
  v16 = v8;
  +[_ATXAppLaunchMonitor mergeAppLaunches:andBacklightTransitions:callingAppLaunchBlock:](_ATXAppLaunchMonitor, "mergeAppLaunches:andBacklightTransitions:callingAppLaunchBlock:", v5, v6, v14);
  v12 = a1[8];
  if (v12)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v9, v10, v11);

  objc_autoreleasePoolPop(v4);
  v13 = (id)objc_opt_self();

}

void __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;

  v19 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((a6 & 1) != 0)
  {
    if (v19 && v11)
    {
      v16 = a1 + 32;
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v16 + 8);
      if (v13)
        v17 = v13;
      else
        v17 = &stru_1E82FDC98;
      objc_msgSend(*(id *)(v14 + 56), "predictionContextForCurrentContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_addLaunchWithLockWitness:bundleId:date:timeZone:reason:context:", v14, v19, v11, v12, v17, v18);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addScreenLockAtDate:", v11);
  }

}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_75(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_80(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:", *(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 48), 9, *(_QWORD *)(a1 + 56));
  return (id)objc_opt_self();
}

uint64_t __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v3 = (void *)a2[2];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v6 = (void *)v5[1];

  return objc_msgSend(v6, "registerCallback:", *(_QWORD *)(a1 + 32));
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Received clip launch with event: %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(v3, "webClipBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "clipBundleId");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v3, "urlHash");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_opt_new();
          -[NSObject setBundleId:](v9, "setBundleId:", v7);
          -[NSObject setUrlHash:](v9, "setUrlHash:", v8);
          -[NSObject setCaptureType:](v9, "setCaptureType:", objc_msgSend((id)objc_opt_class(), "petClipCaptureTypeFromDuetClipLaunchReason:", objc_msgSend(v3, "launchReason")));
          objc_msgSend(WeakRetained[7], "trackScalarForMessage:", v9);
          v10 = objc_msgSend(v3, "launchReason");
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:", v6, v7, v8, 1, CFSTR("ATXClipLaunch"), v10, v11);

        }
        else
        {
          __atxlog_handle_hero();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_3();
        }

      }
      else
      {
        __atxlog_handle_hero();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_2();
      }

    }
    else
    {
      __atxlog_handle_hero();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_1();
    }

  }
}

void __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *WeakRetained;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unsigned int v33;

  v5 = a2;
  v6 = a3;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2((uint64_t)v5, v7, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0x80000000;
    v11 = (void *)WeakRetained[4];
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_95;
    v27[3] = &unk_1E82E1EA0;
    v29 = &v30;
    v28 = *(id *)(a1 + 32);
    objc_msgSend(v11, "runWithLockAcquired:", v27);
    if (*((_DWORD *)v31 + 6) != 0x80000000)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("-backlightChanged"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_retainAutorelease(v15);
      objc_msgSend(v16, "UTF8String");
      v17 = (void *)os_transaction_create();
      v18 = (void *)objc_opt_new();
      v19 = (void *)MEMORY[0x1E0D81598];
      v20 = v10[1];
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_2;
      v23[3] = &unk_1E82E1F40;
      v23[4] = v10;
      v26 = &v30;
      v21 = v18;
      v24 = v21;
      v22 = v17;
      v25 = v22;
      objc_msgSend(v19, "runAsyncOnQueue:afterDelaySeconds:block:", v20, v23, 5.0);

    }
    _Block_object_dispose(&v30, 8);
  }

}

void __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_95(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "intValue");

  }
}

id __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleBacklightChangeNotificationWithValue:date:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 40));
  return (id)objc_opt_self();
}

uint64_t __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_3(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v3 = (void *)a2[2];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v6 = (void *)v5[1];

  return objc_msgSend(v6, "registerCallback:", *(_QWORD *)(a1 + 32));
}

void __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_101(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43;
  v22 = __Block_byref_object_dispose__43;
  v23 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_2;
  v17[3] = &unk_1E82E1DC0;
  v17[4] = &v18;
  objc_msgSend(v4, "runWithLockAcquired:", v17);
  objc_msgSend(*(id *)(a1 + 32), "logAppLaunchForBundleId:launchReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  LOBYTE(v9) = 15;
  +[_ATXAppLaunchMonitor _logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:](_ATXAppLaunchMonitor, "_logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 92), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 88), 7, v9, v19[5]);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_3;
  v10[3] = &unk_1E82E1FB8;
  v11 = v5;
  v7 = *(id *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v16 = &v18;
  v15 = *(id *)(a1 + 80);
  objc_msgSend(v6, "runAsyncWithLockAcquired:", v10);

  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v2);
}

void __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 56), "updateContextStreamAndReturnPredictionContextForCurrentContext");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v3 = (void *)a2[3];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "addLaunchForBundleId:date:completion:", v4, v5, 0);
  objc_msgSend(*(id *)(a1 + 48), "_addLaunchWithLockWitness:bundleId:date:timeZone:reason:context:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    ATXUpdatePredictionsDefaultInterval(1);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_4;
  block[3] = &unk_1E82DAC38;
  v9 = *(id *)(a1 + 64);
  dispatch_async(v7, block);

}

id __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_4()
{
  return (id)objc_opt_self();
}

void __72___ATXAppLaunchMonitor_handleBacklightChangeNotificationWithValue_date___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  int v4;
  id v5;
  id *v6;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 48);
  v6 = v3;
  if (v4 == 1)
  {
    objc_msgSend(v3[4], "addScreenLockAtDate:", *(_QWORD *)(a1 + 32));
  }
  else if (!v4)
  {
    objc_msgSend(v3[3], "stopAppUsageAtDate:", *(_QWORD *)(a1 + 32));
  }
  v5 = (id)objc_opt_self();

}

void __36___ATXAppLaunchMonitor_clearHistory__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v2 = (void *)a2[4];
  v3 = a2;
  objc_msgSend(v2, "clearAppLaunchInfo");
  objc_msgSend(v3[5], "histogramForLaunchType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 92);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 93);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetData");

  objc_msgSend(v3[5], "histogramForLaunchType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetData");

  v11 = v3[5];
  objc_msgSend(v11, "histogramForLaunchType:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetData");

  +[_ATXAppLaunchHistogramManager resetDataForCategoricalHistograms](_ATXAppLaunchHistogramManager, "resetDataForCategoricalHistograms");
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clear");

}

void __51___ATXAppLaunchMonitor_clearIntentHistogramHistory__block_invoke(uint64_t a1, id *a2)
{
  id v3;
  id *v4;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = a2[5];
  v4 = a2;
  objc_msgSend(v3, "histogramForLaunchType:", 14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetData");

  objc_msgSend(a2[5], "categoricalHistogramForLaunchType:", 29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetData");

  objc_msgSend(a2[5], "categoricalHistogramForLaunchType:", 40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetData");

  objc_msgSend(a2[5], "histogramForLaunchType:", 22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resetData");

  objc_msgSend(a2[5], "categoricalHistogramForLaunchType:", 31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resetData");

  v18 = a2[5];
  objc_msgSend(v18, "categoricalHistogramForLaunchType:", 39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resetData");

  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allApps");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deleteAllLaunchesForBundles:", v21);

  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "clear");

  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "iterZeroDayAppIntentKeysWithBlock:", &__block_literal_global_128_1);

}

void __51___ATXAppLaunchMonitor_clearIntentHistogramHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intern:", v2);

}

void __67___ATXAppLaunchMonitor_addLaunchWithBundleId_date_timeZone_reason___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = (void *)a2[7];
  v8 = a2;
  objc_msgSend(v7, "predictionContextForCurrentContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_addLaunchWithLockWitness:bundleId:date:timeZone:reason:context:", v8, v3, v4, v5, v6, v9);

}

void __28___ATXAppLaunchMonitor_stop__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2[2];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2[1], "deregisterCallback:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = v2[1];
  v2[1] = 0;

}

void __43___ATXAppLaunchMonitor_startDeltaRecording__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (id)v2[1];
  v2[1] = v3;

}

void __42___ATXAppLaunchMonitor_stopDeltaRecording__block_invoke(uint64_t a1, id *a2)
{
  id v3;
  id *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2[1]);
  v4 = a2;
  v3 = a2[1];
  a2[1] = 0;

}

void __38___ATXAppLaunchMonitor_appInfoManager__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

void __49___ATXAppLaunchMonitor_appLaunchHistogramManager__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 40));
}

void __48___ATXAppLaunchMonitor_appLaunchSequenceManager__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 48));
}

void __39___ATXAppLaunchMonitor_swapDuetHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
}

void __33___ATXAppLaunchMonitor_dailyDose__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "Donation Processing - App change notification bundleId: '%@', launch reason: '%@'");
  OUTLINED_FUNCTION_1_0();
}

void __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, a3, "Identifier called: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Web clip bundleId is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Powering clip bundleId is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "URL Hash is nil. Ignoring App Clip Launch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
