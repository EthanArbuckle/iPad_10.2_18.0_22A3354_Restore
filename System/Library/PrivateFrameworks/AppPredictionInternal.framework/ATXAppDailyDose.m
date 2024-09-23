@implementation ATXAppDailyDose

uint64_t __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_recordAppDurationForApp:withStartTime:andEndTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = v2;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(v9 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke_2;
    block[3] = &unk_1E82DF858;
    block[1] = 3221225472;
    block[4] = v9;
    v16 = v3;
    v17 = v4;
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    v12 = v4;
    v13 = v3;
    dispatch_async(v11, block);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(void))(v14 + 16))();
  }
}

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_2;
  block[3] = &unk_1E82DF858;
  v5 = v2;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  dispatch_async(v3, block);

}

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  _QWORD *v6;
  id v7;
  id v8;
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "_loadHistoricalDoseFrom:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[2];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_3;
    v5[3] = &unk_1E82DF830;
    v6 = v3;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    dispatch_async(v4, v5);

  }
}

void __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_4;
  v4[3] = &unk_1E82DA9F8;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_doTrainingOn:timeZone:completion:", v2, v3, v4);

}

uint64_t __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __34___ATXAppDailyDose_getDoseForApp___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41___ATXAppDailyDose_getCurrentDoseForApp___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 24), "currentDoseFor:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

void __25___ATXAppDailyDose_train__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "todayWithTimeZone:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_doTrainingOn:timeZone:completion:", v3, v4, 0);

}

void __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _ATXAppHistoricalAverageDose *v13;
  _ATXAppHistoricalAverageDose *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id obj;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v33 = (void *)objc_opt_new();
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v31 = a1;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getAppLaunchesBetweenStartDate:endDate:batchSize:");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v45 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v7, "bundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v7, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "endDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addDuration:endDate:", v11, v12);
        }
        else
        {
          v13 = [_ATXAppHistoricalAverageDose alloc];
          objc_msgSend(v7, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "endDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[_ATXAppHistoricalAverageDose initWith:endDate:timeZone:alpha:](v13, "initWith:endDate:timeZone:alpha:", v11, v12, *(_QWORD *)(v31 + 48), *(double *)(*(_QWORD *)(v31 + 32) + 64));
          objc_msgSend(v7, "bundleId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, v15);

        }
        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v4);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = v2;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v16, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "skipTo:", *(_QWORD *)(v31 + 40));
        objc_msgSend(v22, "movingAverage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v18);
  }

  v24 = *(_QWORD *)(v31 + 32);
  v25 = *(void **)(v31 + 40);
  v26 = *(NSObject **)(v24 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_2;
  block[3] = &unk_1E82DF8D0;
  block[4] = v24;
  v35 = v33;
  v36 = v25;
  v27 = *(id *)(v31 + 64);
  v28 = *(_QWORD *)(v31 + 72);
  v38 = v27;
  v39 = v28;
  v37 = *(id *)(v31 + 56);
  v29 = v33;
  dispatch_async(v26, block);

}

void __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_3;
  v5[3] = &unk_1E82DF8A8;
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  v8 = v4;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_writeHistoricalDoseWithCompletion:", v5);

}

id __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v7 = 136446210;
    v8 = "_ATXAppDailyDose";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v7, 0xCu);
  }

  return (id)objc_opt_self();
}

uint64_t __57___ATXAppDailyDose_addLaunchForBundleId_date_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  objc_msgSend(v2, "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isExpiredAt:", v4);

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 32), "_backfillAppDurationMapDBForToday");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  if (v6)
  {
    v7 = *(_QWORD *)(v5 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    objc_msgSend((id)v5, "_recordAppDurationForApp:withStartTime:andEndTime:", v9, v7, v8);

    v5 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v5 + 48), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  +[_ATXAppDailyDose _defaultHistoricalDosePath](_ATXAppDailyDose, "_defaultHistoricalDosePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = objc_msgSend(v2, "writeToFile:options:error:", v3, 1073741825, &v14);
  v5 = v14;

  if ((v4 & 1) == 0)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

void __36___ATXAppDailyDose_previousBundleId__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Could not write historical dose: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
