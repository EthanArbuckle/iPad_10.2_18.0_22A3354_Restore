@implementation ATXDataStore

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __26___ATXDataStore__doAsync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  pthread_mutex_lock(&_doAsync__txnLock);
  if (!--_doAsync__txnCount)
  {
    v3 = (void *)_doAsync__txn;
    _doAsync__txn = 0;

  }
  return pthread_mutex_unlock(&_doAsync__txnLock);
}

uint64_t __64___ATXDataStore_addCategoricalHistogramData_forHistogramOfType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertCategoricalHistogramData:forHistogram:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53___ATXDataStore_addHistogramData_forHistogramOfType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertHistogramData:forHistogram:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __36___ATXDataStore_appInfoForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_appInfoForBundleIdNoSync:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "getInt64ForColumn:", 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);
  if (v3)

  return *MEMORY[0x1E0D81788];
}

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _ATXAppInfo *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v6 = objc_msgSend(v3, "getInt64ForColumn:", 2);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSDataForColumn:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  decodeSubGenresData(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "getInt64ForColumn:", 5);
  v12 = objc_msgSend(v3, "getInt64ForColumn:", 6);
  if (objc_msgSend(v3, "isColumnNull:", 6))
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected NULL isEnterpriseApp for bundleId: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 7));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isColumnNull:", 8) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v3, "isColumnNull:", 9) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 9));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = -[_ATXAppInfo initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:]([_ATXAppInfo alloc], "initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:", *(_QWORD *)(a1 + 32), v11 != 0, v12 != 0, v23, v22, v7, v16, v17, v8, v10, v15);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  return *MEMORY[0x1E0D81788];
}

void __58___ATXDataStore_updateOrInsertHistogramData_forHistogram___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":histogram_type", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":histogram_data", *(_QWORD *)(a1 + 32));

}

void __69___ATXDataStore_updateOrInsertCategoricalHistogramData_forHistogram___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":histogram_type", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":histogram_data", *(_QWORD *)(a1 + 32));

}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

void __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  dateColumnNameForLaunchType(a1[6]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MAX(%@) FROM appInfo WHERE isExtension = FALSE"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(void **)(a1[4] + 48);
  v6[4] = a1[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_2;
  v7[3] = &unk_1E82DCC00;
  v7[4] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_3;
  v6[3] = &unk_1E82DCC28;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v2, 0, v7, v6);

}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM appInfo WHERE lastLaunchDate = (SELECT MAX(lastLaunchDate) FROM appInfo WHERE isExtension = FALSE)"), &__block_literal_global_200, v6, v5);
}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_2;
  v3[3] = &unk_1E82DCB88;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO intentCache (cacheKey, bundleId, paramCombinationsWithSchema) VALUES (:cache_key, :bundle_id, :param_combinations) ON CONFLICT(cacheKey) DO UPDATE SET paramCombinationsWithSchema=excluded.paramCombinationsWithSchema"), v3, 0, &__block_literal_global_31);

}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "stringRepresentationForSerialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":cache_key", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":bundle_id", v5);

  objc_msgSend(v6, "bindNamedParam:toNSData:", ":param_combinations", *(_QWORD *)(a1 + 40));
}

uint64_t __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT paramCombinationsWithSchema FROM intentCache WHERE cacheKey = :cache_key LIMIT 1"), v5, v4, &__block_literal_global_18);

}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentationForSerialization");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":cache_key", v4);

}

uint64_t __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_2;
  v3[3] = &unk_1E82DCF50;
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO intentCache (cacheKey, bundleId, backgroundExecution) VALUES (:cache_key, :bundle_id, :background_execution) ON CONFLICT(cacheKey) DO UPDATE SET backgroundExecution=excluded.backgroundExecution"), v3, 0, &__block_literal_global_27);

}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "stringRepresentationForSerialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":cache_key", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":bundle_id", v5);

  objc_msgSend(v6, "bindNamedParam:toInteger:", ":background_execution", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT backgroundExecution FROM intentCache WHERE cacheKey = :cache_key LIMIT 1"), v5, v4, &__block_literal_global_30);

}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentationForSerialization");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":cache_key", v4);

}

uint64_t __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getInt64AsNSNumberForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_2;
  v3[3] = &unk_1E82DCB88;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO intentCache (cacheKey, bundleId, title) VALUES (:cache_key, :bundle_id, :title) ON CONFLICT(cacheKey) DO UPDATE SET title=excluded.title"), v3, 0, &__block_literal_global_36);

}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "stringRepresentationForSerialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":cache_key", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":bundle_id", v5);

  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  else
    v6 = &stru_1E82FDC98;
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":title", v6);

}

uint64_t __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT title FROM intentCache WHERE cacheKey = :cache_key LIMIT 1"), v5, v4, &__block_literal_global_39);

}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentationForSerialization");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":cache_key", v4);

}

uint64_t __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_2;
  v3[3] = &unk_1E82DCB88;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO intentCache (cacheKey, bundleId, subtitle) VALUES (:cache_key, :bundle_id, :subtitle) ON CONFLICT(cacheKey) DO UPDATE SET subtitle=excluded.subtitle"), v3, 0, &__block_literal_global_43_1);

}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "stringRepresentationForSerialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":cache_key", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":bundle_id", v5);

  objc_msgSend(v6, "bindNamedParam:toNSString:", ":subtitle", *(_QWORD *)(a1 + 40));
}

uint64_t __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT subtitle FROM intentCache WHERE cacheKey = :cache_key LIMIT 1"), v5, v4, &__block_literal_global_46);

}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentationForSerialization");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":cache_key", v4);

}

uint64_t __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_2;
  v3[3] = &unk_1E82DCF50;
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO intentCache (cacheKey, bundleId, eligibleForWidgets) VALUES (:cache_key, :bundle_id, :eligible_for_widgets) ON CONFLICT(cacheKey) DO UPDATE SET eligibleForWidgets=excluded.eligibleForWidgets"), v3, 0, &__block_literal_global_50);

}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "stringRepresentationForSerialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":cache_key", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":bundle_id", v5);

  objc_msgSend(v6, "bindNamedParam:toInteger:", ":eligible_for_widgets", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT eligibleForWidgets FROM intentCache WHERE cacheKey = :cache_key LIMIT 1"), v5, v4, &__block_literal_global_53_0);

}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentationForSerialization");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":cache_key", v4);

}

uint64_t __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getInt64AsNSNumberForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_2;
  v3[3] = &unk_1E82DCBD8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM intentCache WHERE bundleId = :bundle_id"), v3, 0, &__block_literal_global_56);

}

uint64_t __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 32));
}

uint64_t __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM intentCache"), 0, 0, &__block_literal_global_59);

}

uint64_t __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_2;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT webClipBundleId FROM webClipForAppClip WHERE appClipBundleId = :appClipBundleId"), v5, v4, &__block_literal_global_42);

}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":appClipBundleId", *(_QWORD *)(a1 + 32));
}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return *MEMORY[0x1E0D81788];
}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_2;
  v3[3] = &unk_1E82DCB88;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO webClipForAppClip (webClipBundleId, appClipBundleId)VALUES (:webClipBundleId, :appClipBundleId)ON CONFLICT(webClipBundleId) DO UPDATE SET appClipBundleId=excluded.appClipBundleId"), v3, 0, &__block_literal_global_17);

}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":webClipBundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":appClipBundleId", *(_QWORD *)(a1 + 40));

}

uint64_t __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return *MEMORY[0x1E0D81788];
}

void __31___ATXDataStore_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

uint64_t __43___ATXDataStore_removeFeedbackForBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeFeedbackForBundleId:", *(_QWORD *)(a1 + 40));
}

uint64_t __34___ATXDataStore_removeAllFeedback__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___ATXDataStore_removeAllFeedback__block_invoke_2;
  v4[3] = &unk_1E82DCC28;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM app"), 0, 0, v4);
}

uint64_t __34___ATXDataStore_removeAllFeedback__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke_2;
  v4[3] = &unk_1E82DCC28;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM predictionFeedbackInfo"), 0, 0, v4);
}

uint64_t __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM messageRecipients WHERE lastDateMessaged<?"), v6, 0, v5);

}

void __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindParam:toInt64:", 1, (uint64_t)v3);

}

uint64_t __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __44___ATXDataStore__removeFeedbackForBundleId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __44___ATXDataStore__removeFeedbackForBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_2;
  aBlock[3] = &unk_1E82E2A78;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v8 = v2;
  v9 = v3;
  v12 = *(_BYTE *)(a1 + 64);
  v10 = v4;
  v11 = *(id *)(a1 + 56);
  v5 = _Block_copy(aBlock);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v6, "readTransaction:", v5);
  else
    objc_msgSend(v6, "writeTransaction:", v5);

}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  _QWORD *v42;
  int v43;
  _QWORD v44[5];
  _QWORD v45[4];
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  _QWORD v50[5];
  _QWORD v51[5];
  uint64_t __key;
  uint64_t *p_key;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  _QWORD v60[7];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  int v68;
  _QWORD v69[3];
  int v70;
  _QWORD v71[5];
  _QWORD v72[4];
  id v73;

  v2 = *(id *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (!v2)
  {
    v4 = (void *)objc_opt_new();
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v72[0] = v3;
    v72[1] = 3221225472;
    v72[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_3;
    v72[3] = &unk_1E82DEC70;
    v6 = v4;
    v73 = v6;
    v71[0] = v3;
    v71[1] = 3221225472;
    v71[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_4;
    v71[3] = &unk_1E82DCC28;
    v71[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM app"), 0, v72, v71);
    v2 = v6;

  }
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 32;
  v65 = 0;
  v66 = (int *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v64 = malloc_type_calloc(0x18uLL, 0x20uLL, 0x78E31E6BuLL);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v59[4] = *(_QWORD *)(a1 + 40);
  v60[0] = v3;
  v60[1] = 3221225472;
  v60[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_5;
  v60[3] = &unk_1E82DF498;
  v60[4] = &v65;
  v60[5] = v69;
  v60[6] = &v61;
  v59[0] = v3;
  v59[1] = 3221225472;
  v59[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_6;
  v59[3] = &unk_1E82DCC28;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, data FROM app ORDER BY bundleId"), 0, v60, v59);
  v8 = objc_msgSend(v2, "count");
  v36 = malloc_type_calloc(v8, 0x10uLL, 0x1000040451B5BE8uLL);
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = v36;
    do
    {
      v11 = (void *)MEMORY[0x1CAA48B6C]();
      *v10 = 0;
      v10[1] = 0;
      __key = 0;
      p_key = 0;
      v54 = 0;
      objc_msgSend(v2, "objectAtIndexedSubscript:", v9);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      __key = objc_msgSend(v12, "UTF8String");
      p_key = 0;
      v54 = 0;

      v13 = (char *)bsearch_b(&__key, (const void *)v62[3], v66[6], 0x18uLL, &__block_literal_global_164);
      if (v13)
        *(_OWORD *)v10 = *(_OWORD *)(v13 + 8);
      objc_autoreleasePoolPop(v11);
      ++v9;
      v10 += 2;
    }
    while (v8 != v9);
  }
  if (v66[6] >= 1)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      free(*(void **)(v62[3] + v14));
      ++v15;
      v14 += 24;
    }
    while (v15 < v66[6]);
  }
  free((void *)v62[3]);
  __key = 0;
  p_key = &__key;
  v54 = 0x3810000000;
  v55 = &unk_1C9F35407;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v16 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v17 = MEMORY[0x1E0C809B0];
  v50[4] = *(_QWORD *)(a1 + 40);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_8;
  v51[3] = &unk_1E82DCC00;
  v51[4] = &__key;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_9;
  v50[3] = &unk_1E82DCC28;
  objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT data FROM meta LIMIT 1"), 0, v51, v50);
  if (*(_BYTE *)(a1 + 64))
  {
    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      v18 = (*(uint64_t (**)(uint64_t, uint64_t *))(v18 + 16))(v18, p_key + 4);
    if (v8 >= 1)
    {
      v19 = 0;
      v20 = v8;
      v21 = v36;
      do
      {
        v22 = (void *)MEMORY[0x1CAA48B6C](v18);
        v23 = *(_QWORD *)(a1 + 56);
        if (v23)
        {
          objc_msgSend(v2, "objectAtIndexedSubscript:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD *))(v23 + 16))(v23, v24, v21);

        }
        objc_autoreleasePoolPop(v22);
        ++v19;
        v21 += 2;
      }
      while (v20 != v19);
    }
  }
  else
  {
    v25 = p_key;
    v48 = *((_OWORD *)p_key + 2);
    v49 = p_key[6];
    v26 = *(_QWORD *)(a1 + 48);
    if (v26)
    {
      (*(void (**)(uint64_t, __int128 *))(v26 + 16))(v26, &v48);
      v25 = p_key;
    }
    v27 = v25[4];
    v28 = v25[5];
    v29 = v25[6];
    if (v27 != (_QWORD)v48 || v28 != *((_QWORD *)&v48 + 1) || v29 != v49)
    {
      v32 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v44[4] = *(_QWORD *)(a1 + 40);
      v45[0] = v17;
      v45[1] = 3221225472;
      v45[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_10;
      v45[3] = &__block_descriptor_56_e29_v16__0___PASSqliteStatement_8l;
      v46 = v48;
      v47 = v49;
      v44[0] = v17;
      v44[1] = 3221225472;
      v44[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_11;
      v44[3] = &unk_1E82DCC28;
      objc_msgSend(v32, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO meta (id, data, version) VALUES (1, ?, (SELECT version FROM meta WHERE id = 1))"), v45, 0, v44);
    }
    v33 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v38[0] = v17;
    v38[1] = 3221225472;
    v38[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_12;
    v38[3] = &unk_1E82E2A50;
    v43 = v8;
    v42 = v36;
    v41 = *(id *)(a1 + 56);
    v34 = v2;
    v35 = *(_QWORD *)(a1 + 40);
    v39 = v34;
    v40 = v35;
    v37[0] = v17;
    v37[1] = 3221225472;
    v37[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_13;
    v37[3] = &unk_1E82DCC28;
    v37[4] = v35;
    objc_msgSend(v33, "prepQuery:onPrep:onError:", CFSTR("INSERT OR REPLACE INTO app (bundleId, data) VALUES (?, ?)"), v38, v37);

  }
  free(v36);
  _Block_object_dispose(&__key, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);

}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_5(_QWORD *a1, id a2)
{
  id v3;
  const unsigned __int8 *v4;
  id v5;
  sqlite3_stmt *v6;
  _OWORD *v7;
  _OWORD *v8;
  int v9;
  uint64_t v10;

  v3 = objc_retainAutorelease(a2);
  v4 = sqlite3_column_text((sqlite3_stmt *)objc_msgSend(v3, "stmt"), 0);
  v5 = objc_retainAutorelease(v3);
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "stmt");

  v7 = sqlite3_column_blob(v6, 1);
  if (v4)
  {
    v8 = v7;
    if (v7)
    {
      v9 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      v10 = *(_QWORD *)(a1[5] + 8);
      if (v9 == *(_DWORD *)(v10 + 24))
      {
        *(_DWORD *)(v10 + 24) = 2 * v9;
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = reallocf(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), 24 * *(int *)(*(_QWORD *)(a1[5] + 8) + 24));
        v9 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      }
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 24 * v9 + 8) = *v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)
                + 24 * (int)(*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))++) = strdup((const char *)v4);
    }
  }
  return *MEMORY[0x1E0D81780];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_6(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_7(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_8(uint64_t a1, id a2)
{
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;

  v3 = sqlite3_column_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 0);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_OWORD *)v3;
    *(_QWORD *)(v4 + 48) = v3[2];
    *(_OWORD *)(v4 + 32) = v5;
  }
  return *MEMORY[0x1E0D81788];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_9(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_10(uint64_t a1, id a2)
{
  return sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 1, (const void *)(a1 + 32), 24, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_11(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  __int128 v15;

  v3 = a2;
  v15 = 0uLL;
  if (*(int *)(a1 + 64) >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v7 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v15 = *(_OWORD *)(v6 + v4);
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, __int128 *))(v7 + 16))(v7, v8, &v15);

        v6 = *(_QWORD *)(a1 + 56);
      }
      v9 = (uint64_t *)(v6 + v4);
      v11 = *v9;
      v10 = v9[1];
      if ((_QWORD)v15 != v11 || *((_QWORD *)&v15 + 1) != v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bindParam:toNSString:", 1, v13);

        v14 = objc_retainAutorelease(v3);
        sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v14, "stmt"), 2, &v15, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "runQuery:onRow:", v14, 0);
        sqlite3_reset((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v14), "stmt"));
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < *(int *)(a1 + 64));
  }

}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_13(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __44___ATXDataStore_vacuumDatabaseWithActivity___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v1, "didDefer") ^ 1;
  else
    return 1;
}

uint64_t __82___ATXDataStore_addAppInstallForBundleId_date_genreId_subGenreIds_app2VecCluster___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = +[ATXLaunchServicesHelper bundleIsExtension:](ATXLaunchServicesHelper, "bundleIsExtension:", *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isEnterpriseAppForBundle:", *(_QWORD *)(a1 + 32));
  __atxlog_handle_app_install();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Attempting to write install date for %@ with date: %{public}@", buf, 0x16u);
  }

  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  LOBYTE(v10) = v3;
  return objc_msgSend(v7, "updateOrInsertInstallTimestamp:genreId:subGenreIds:app2VecCluster:forBundleId:isExtension:isEnterpriseApp:", (uint64_t)v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), v2, v10);
}

void __61___ATXDataStore_addAppLaunchForBundleId_date_withLaunchType___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3;
  dateColumnNameForLaunchType(*(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateOrInsertTimestamp:intoColumn:forBundleId:isExtension:", v4, v5, *(_QWORD *)(a1 + 48), 0);

}

uint64_t __53___ATXDataStore_addAppActionLaunchForAppAction_date___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  return objc_msgSend(v2, "updateOrInsertTimestamp:forAppAction:", (uint64_t)v3, *(_QWORD *)(a1 + 48));
}

uint64_t __52___ATXDataStore_addExtensionLaunchForBundleId_date___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  return objc_msgSend(v2, "updateOrInsertTimestamp:intoColumn:forBundleId:isExtension:", (uint64_t)v3, CFSTR("lastLaunchDate"), *(_QWORD *)(a1 + 48), 1);
}

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_182(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_2;
  v9[3] = &unk_1E82DCBD8;
  v10 = v2;
  v7[4] = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_3;
  v8[3] = &unk_1E82DCC00;
  v8[4] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v6 = v2;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT BUNDLEID FROM appInfo WHERE (installDate > ? OR lastLaunchDate > ?) AND installDate IS NOT NULL;"),
    v9,
    v8,
    v7);

}

void __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = (uint64_t)v3;
  objc_msgSend(v5, "bindParam:toInteger:", 1, (uint64_t)v3);
  objc_msgSend(v5, "bindParam:toInteger:", 2, v4);

}

uint64_t __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __44___ATXDataStore__allAppsRequireInstallDate___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (*(_BYTE *)(a1 + 48))
    v2 = CFSTR("WHERE installDate IS NOT NULL");
  else
    v2 = &stru_1E82FDC98;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT bundleId, installDate FROM appInfo %@"), v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_2;
  v7[3] = &unk_1E82DCC00;
  v7[4] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_3;
  v6[3] = &unk_1E82DCC28;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, v7, v6);

}

uint64_t __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v1 = a1[4];
  v2 = a1[5];
  v3 = *(void **)(v1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = a1[6];
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, lastLaunchDate FROM appInfo ORDER BY lastLaunchDate DESC LIMIT 1 OFFSET ?"), v7, v6, v5);
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInteger:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *context;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA48B6C]();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(&unk_1E83CFA28, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(&unk_1E83CFA28);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_2;
        v12[3] = &unk_1E82DCBD8;
        v13 = v8;
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_3;
        v11[3] = &unk_1E82DCC28;
        v11[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v7, v12, 0, v11);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(&unk_1E83CFA28, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }
  objc_autoreleasePoolPop(context);
}

uint64_t __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":installedBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(&unk_1E83CFA40, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v14;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(&unk_1E83CFA40);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_2;
        v11[3] = &unk_1E82DCBD8;
        v12 = v8;
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_4;
        v10[3] = &unk_1E82DCC28;
        v10[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v7, v11, &__block_literal_global_214, v10);

        ++v6;
      }
      while (v3 != v6);
      result = objc_msgSend(&unk_1E83CFA40, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_3()
{
  return *MEMORY[0x1E0D81788];
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_2;
  v10[3] = &unk_1E82DCBD8;
  v11 = v2;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3;
  v7[3] = &unk_1E82DCBB0;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET lastLaunchDate=NULL, lastSpotlightLaunchDate=NULL WHERE bundleId=?"), v10, 0, v7);

}

uint64_t __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v3);
  objc_msgSend(*(id *)(a1 + 40), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __35___ATXDataStore_clearAppLaunchInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35___ATXDataStore_clearAppLaunchInfo__block_invoke_2;
  v4[3] = &unk_1E82DCC28;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET lastLaunchDate=NULL, lastSpotlightLaunchDate=NULL"), 0, 0, v4);
}

uint64_t __35___ATXDataStore_clearAppLaunchInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __36___ATXDataStore_clearAppInstallInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36___ATXDataStore_clearAppInstallInfo__block_invoke_2;
  v4[3] = &unk_1E82DCC28;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET installDate=NULL"), 0, 0, v4);
}

uint64_t __36___ATXDataStore_clearAppInstallInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33___ATXDataStore_launchedAppCount__block_invoke_2;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___ATXDataStore_launchedAppCount__block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM appInfo WHERE ((lastLaunchDate!=0 AND lastLaunchDate IS NOT NULL) OR (lastSpotlightLaunchDate!=0 AND lastSpotlightLaunchDate IS NOT NULL)) AND (installDate IS NOT NULL)"), 0, v6, v5);
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __28___ATXDataStore_loadAppInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28___ATXDataStore_loadAppInfo__block_invoke_2;
  v6[3] = &unk_1E82DEC70;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __28___ATXDataStore_loadAppInfo__block_invoke_229;
  v5[3] = &unk_1E82DCC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, installDate, lastLaunchDate, lastSpotlightLaunchDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster, averageSecondsBetweenLaunches, medianSecondsBetweenLaunches FROM appInfo"), 0, v6, v5);

}

uint64_t __28___ATXDataStore_loadAppInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _ATXAppInfo *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  if (v4)
  {
    v22 = a1;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v7 = objc_msgSend(v3, "getInt64ForColumn:", 2);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v8 = objc_msgSend(v3, "getInt64ForColumn:", 3);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 4));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSDataForColumn:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    decodeSubGenresData(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v3, "getInt64ForColumn:", 6);
    v13 = objc_msgSend(v3, "getInt64ForColumn:", 7);
    if (objc_msgSend(v3, "isColumnNull:", 7))
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __28___ATXDataStore_loadAppInfo__block_invoke_2_cold_1();

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 8));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isColumnNull:", 9) & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 9));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v3, "isColumnNull:", 10) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 10));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = -[_ATXAppInfo initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:]([_ATXAppInfo alloc], "initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:", v4, v12 != 0, v13 != 0, v23, v21, v20, v16, v17, v9, v11, v15);
    objc_msgSend(*(id *)(v22 + 32), "setObject:forKeyedSubscript:", v18, v4);

    v6 = *MEMORY[0x1E0D81780];
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
      objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("rdar://28434856 Caught appInfo entry with nil bundleId"));
    v6 = *MEMORY[0x1E0D81788];
  }

  return v6;
}

uint64_t __28___ATXDataStore_loadAppInfo__block_invoke_229(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke_2;
  v4[3] = &unk_1E82DF1D0;
  v5 = *(_OWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke_3;
  v3[3] = &unk_1E82DCC28;
  return objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT appAction, lastAppActionLaunchDate FROM appActionInfo ORDER BY lastAppActionLaunchDate DESC LIMIT 1"), 0, v4, v3);
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = objc_msgSend(v3, "getInt64ForColumn:", 1);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    if (v7)

  }
  else if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("rdar://28434856 Caught appActionInfo entry with nil appAction"));
  }
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v9;
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __40___ATXDataStore_lastMessageToRecipient___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT lastDateMessaged FROM messageRecipients WHERE recipientName = :recipient"), v7, v6, v5);

}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":recipient", *(_QWORD *)(a1 + 32));
}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(a2, "getInt64ForColumn:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *MEMORY[0x1E0D81788];
}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v8[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_2;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v8[4] = a1[6];
  v6[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT appAction, predictionsCount, feedbackCount, uiType FROM predictionFeedbackInfo ORDER BY predictionsCount DESC LIMIT :num_app_actions"), v8, v6, v5);

}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":num_app_actions", *(_QWORD *)(a1 + 32));
}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "getIntegerForColumn:", 1);
    v6 = objc_msgSend(v3, "getIntegerForColumn:", 2);
    objc_msgSend(v3, "getNSStringForColumn:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D81638]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithFirst:second:", v9, v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v4, v7);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);
    v13 = *MEMORY[0x1E0D81780];

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
      objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("rdar://28434856 Caught predictionFeedbackInfo entry with nil appAction"));
    v13 = *MEMORY[0x1E0D81788];
  }

  return v13;
}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __47___ATXDataStore_writeLaunches_followingBundle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertSubsequentLaunchCountData:forBundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59___ATXDataStore_writeAppActionLaunches_followingAppAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertSubsequentAppActionLaunchCountData:forAppAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __64___ATXDataStore_writeAverageSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertAverageSecondsBetweenLaunches:forBundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63___ATXDataStore_writeMedianSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertMedianSecondsBetweenLaunches:forBundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67___ATXDataStore_writeAverageSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertAverageSecondsBetweenAppActions:forAppAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66___ATXDataStore_writeMedianSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertMedianSecondsBetweenAppActions:forAppAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54___ATXDataStore_writeGenreId_subGenreIds_forBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertGenreId:subGenreIds:forBundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __49___ATXDataStore_writeApp2VecCluster_forBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrInsertApp2VecCluster:forBundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  _QWORD v8[4];
  __int128 v9;
  _QWORD v10[4];
  id v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_2;
  v10[3] = &unk_1E82DCBD8;
  v11 = v2;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3;
  v8[3] = &unk_1E82DF090;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v9 = v6;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_258;
  v7[3] = &unk_1E82DCC28;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT subsequentLaunchCounts FROM appInfo WHERE bundleId = ?"), v10, v8, v7);

}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unsigned __int8 *v15;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1CAA48B6C]();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    objc_autoreleasePoolPop(v9);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1();

    }
  }
  v15 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v15;
}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_258(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSuffix:", CFSTR("#AppLaunched"));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(CFSTR(":#AppLaunched"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("SELECT subsequentAppActionLaunchCounts FROM appInfo WHERE bundleId = ?");
  }
  else
  {
    v4 = v3;
    v5 = CFSTR("SELECT subsequentAppActionLaunchCounts FROM appActionInfo WHERE appAction = ?");
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_2;
  v15[3] = &unk_1E82DCBD8;
  v16 = v4;
  v12[1] = 3221225472;
  v12[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_3;
  v12[3] = &unk_1E82DF090;
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v16;
  v14 = v8;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_267;
  v11[3] = &unk_1E82DCC28;
  v11[4] = v9;
  v12[0] = v7;
  v10 = v16;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", v5, v15, v12, v11);

}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unsigned __int8 *v15;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1CAA48B6C]();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    objc_autoreleasePoolPop(v9);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1();

    }
  }
  v15 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v15;
}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_267(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET subsequentLaunchCounts = NULL WHERE bundleId = ?"), v7, 0, v5);

}

uint64_t __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSuffix:", CFSTR("#AppLaunched"));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(CFSTR(":#AppLaunched"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("UPDATE appInfo SET subsequentAppActionLaunchCounts = NULL WHERE bundleId = ?");
  }
  else
  {
    v4 = v3;
    v5 = CFSTR("UPDATE appActionInfo SET subsequentAppActionLaunchCounts = NULL WHERE appAction = ?");
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_2;
  v11[3] = &unk_1E82DCBD8;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3;
  v9[3] = &unk_1E82DCC28;
  v10 = v6;
  v8 = v4;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v5, v11, 0, v9);

}

uint64_t __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __55___ATXDataStore_enumerateAppInfoBundlesExecutingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateAppInfoBundlesExecutingBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __58___ATXDataStore_enumerateAppInfoAppActionsExecutingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateAppInfoAppActionsExecutingBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("rdar://28434856 Caught appInfo entry with nil bundleId"));
  }

  objc_autoreleasePoolPop(v4);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

uint64_t __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("rdar://28434856 Caught appInfo entry with nil appAction"));
  }

  objc_autoreleasePoolPop(v4);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

uint64_t __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_2;
  v6[3] = &unk_1E82DEC70;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT appAction FROM appActionInfo"), 0, v6, v5);

}

uint64_t __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke_2;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("select count(*) from (select distinct l.bundleId, l.actionType, s.paramHash from slotSetKey as s, alog as l, alogBundleId as b, alogAction as a where l.id=s.alogId and b.id=l.bundleId and a.id=l.actionType)"), 0, v6, v5);
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(DISTINCT l.actionType) FROM alog as l, alogBundleId as b WHERE b.bundleId = ? AND b.id = l.bundleId"), v7, v6, v5);

}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_2;
  v7[3] = &unk_1E82DCB88;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v6[1] = 3221225472;
  v6[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = *(_QWORD *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT 1 FROM alog, alogBundleId, alogAction WHERE alogBundleId.bundleId = ? AND alogBundleId.id = alog.bundleId AND alogAction.actionType = ? AND alogAction.id = alog.actionType LIMIT 1"), v7, v6, v5);

}

void __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSString:", 1, v3);
  objc_msgSend(v4, "bindParam:toNSString:", 2, *(_QWORD *)(a1 + 40));

}

uint64_t __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  return *MEMORY[0x1E0D81788];
}

uint64_t __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __36___ATXDataStore_containsActionType___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36___ATXDataStore_containsActionType___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __36___ATXDataStore_containsActionType___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __36___ATXDataStore_containsActionType___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogAction WHERE actionType = ?"), v7, v6, v5);

}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT lastAppActionLaunchDate FROM appActionInfo WHERE appAction = ?"), v7, v6, v5);

}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) == 0)
  {
    v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v8;
}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT averageSecondsBetweenAppActions FROM appActionInfo WHERE appAction = ?"), v7, v6, v5);

}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v7;
}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = v2;
  v6[1] = 3221225472;
  v6[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = a1[6];
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v5[4] = a1[4];
  v6[0] = v4;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT medianSecondsBetweenAppActions FROM appActionInfo WHERE appAction = ?"), v7, v6, v5);

}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v7;
}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  sqlite3 **v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("dataStore_"), "stringByAppendingString:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("tempdb-backup.db"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    nukeDbFiles(v6);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_2;
    v27[3] = &unk_1E82DCBD8;
    v9 = v6;
    v28 = v9;
    objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("VACUUM INTO :tmp_db_path"), v27, 0, 0);
    v23 = 0;
    v24 = (sqlite3 **)&v23;
    v25 = 0x2020000000;
    v26 = 0;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_3;
    aBlock[3] = &unk_1E82DACD8;
    v10 = v9;
    v21 = v10;
    v22 = &v23;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    v12 = objc_retainAutorelease(v10);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (sqlite3_open_v2(v13, v24 + 3, 2, 0)
      || sqlite3_exec(v24[3], "PRAGMA journal_mode=memory", 0, 0, 0)
      || *(_BYTE *)(a1 + 56)
      && !+[_ATXDataStore pareDownForBackup:](_ATXDataStore, "pareDownForBackup:", v24[3]))
    {
      v11[2](v11);
      v14 = 0;
    }
    else
    {
      sqlite3_exec(v24[3], "VACUUM", 0, 0, 0);
      sqlite3_close(v24[3]);
      v24[3] = 0;
      v19 = 0;
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v12, 1, &v19);
      v14 = v19;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        nukeDbFiles(v12);
      }
      else
      {
        __atxlog_handle_default();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_cold_1();

        v11[2](v11);
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

uint64_t __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":tmp_db_path", *(_QWORD *)(a1 + 32));
}

sqlite3 *__67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_3(uint64_t a1)
{
  void *v2;
  sqlite3 *result;

  v2 = *(void **)(a1 + 32);
  if (v2)
    nukeDbFiles(v2);
  result = *(sqlite3 **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result)
    return (sqlite3 *)sqlite3_close(result);
  return result;
}

void __89___ATXDataStore_removeSensitiveInformationFromModeEntityScoresFile_shouldBackupContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "stableContactIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "stableContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", v8);

    if (v9)
    {
      objc_msgSend(v5, "setDisplayName:", 0);
      objc_msgSend(v5, "setRawIdentifier:", 0);
      objc_msgSend(v5, "setCnContactId:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v10);
    }
  }

}

void __35___ATXDataStore_restoreFromBackup___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  id v21;
  uint8_t buf;
  _BYTE v23[15];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("dataStore_")))
        {
          if (v5)
          {
            __atxlog_handle_backup();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              __35___ATXDataStore_restoreFromBackup___block_invoke_cold_4(&buf, v23, v9);

          }
          else
          {
            v5 = v8;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject substringFromIndex:](v5, "substringFromIndex:", objc_msgSend(CFSTR("dataStore_"), "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && +[_ATXDataStore isSqliteData:](_ATXDataStore, "isSqliteData:", v10))
      {
        objc_msgSend(*(id *)(a1 + 40), "_disconnectFromDb");
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeItemAtPath:error:", v12, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", CFSTR("-shm"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeItemAtPath:error:", v15, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", CFSTR("-wal"));
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeItemAtPath:error:", v17, 0);

        v21 = 0;
        LOBYTE(v17) = objc_msgSend(v10, "writeToFile:options:error:", v12, 1073741825, &v21);
        v18 = v21;
        if ((v17 & 1) != 0)
        {
          v19 = 1;
        }
        else
        {
          __atxlog_handle_backup();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __35___ATXDataStore_restoreFromBackup___block_invoke_cold_3((uint64_t)v11);

          v19 = 0;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        __atxlog_handle_backup();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __35___ATXDataStore_restoreFromBackup___block_invoke_cold_2();
      }

      goto LABEL_29;
    }
  }
  else
  {

  }
  __atxlog_handle_backup();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __35___ATXDataStore_restoreFromBackup___block_invoke_cold_1();
LABEL_29:

}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_2;
  v5[3] = &unk_1E82DB9D8;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "writeTransaction:", v5);

}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_3;
  v16[3] = &unk_1E82DCB88;
  v17 = v2;
  v18 = *(id *)(a1 + 48);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_4;
  v15[3] = &unk_1E82DCC28;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO appLaunchSequence (launchDate, bundleId) VALUES (:launch_date, :bundle_id)"), v16, 0, v15);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_5;
  v10[3] = &unk_1E82DCC00;
  v10[4] = &v11;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_6;
  v9[3] = &unk_1E82DCC28;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM appLaunchSequence"), 0, v10, v9);
  if (v12[3] >= 5)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_7;
    v8[3] = &unk_1E82E2CD8;
    v8[4] = &v11;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_8;
    v7[3] = &unk_1E82DCC28;
    objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM appLaunchSequence WHERE rowid IN (SELECT rowid FROM appLaunchSequence ORDER BY launchDate LIMIT :count - :max_count)"), v8, 0, v7);
  }
  _Block_object_dispose(&v11, 8);

}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":launch_date", (uint64_t)v4);
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 40));

}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_5(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81780];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_6(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":count", v2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":max_count", 4);

}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_8(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __34___ATXDataStore_appLaunchSequence__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_2;
  v4[3] = &unk_1E82DACB0;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "writeTransaction:", v4);

}

void __34___ATXDataStore_appLaunchSequence__block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_3;
  v13[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v13[4] = (uint64_t)(v2 + -3600.0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_4;
  v12[3] = &unk_1E82DCC28;
  v12[4] = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM appLaunchSequence WHERE launchDate <= :cut_off"), v13, 0, v12);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_5;
  v10[3] = &unk_1E82DEC70;
  v11 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_6;
  v9[3] = &unk_1E82DCC28;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM appLaunchSequence"), 0, v10, v9);

}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInteger:", ":cut_off", *(_QWORD *)(a1 + 32));
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_6(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v1 = a1[4];
  v2 = a1[5];
  v3 = *(void **)(v1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = a1[6];
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT histogramData FROM histograms WHERE histogramType = ?"), v7, v6, v5);
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInteger:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v1 = a1[4];
  v2 = a1[5];
  v3 = *(void **)(v1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = a1[6];
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT histogramData FROM categoricalHistograms WHERE histogramType = ?"), v7, v6, v5);
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInteger:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __28___ATXDataStore_blobOfType___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v1 = a1[4];
  v2 = a1[5];
  v3 = *(void **)(v1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28___ATXDataStore_blobOfType___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = a1[6];
  v5[4] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28___ATXDataStore_blobOfType___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28___ATXDataStore_blobOfType___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  return objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT data FROM blobs WHERE blobType = ? AND (expirationDate IS NULL OR expirationDate > ?)"), v7, v6, v5);
}

void __28___ATXDataStore_blobOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toInteger:", 1, v2);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindParam:toInt64:", 2, (uint64_t)v3);

}

uint64_t __28___ATXDataStore_blobOfType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

uint64_t __28___ATXDataStore_blobOfType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_2;
  v6[3] = &unk_1E82DEE00;
  v9 = *(_QWORD *)(a1 + 56);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_3;
  v5[3] = &unk_1E82DCC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO blobs (blobType, data, expirationDate) VALUES (?,?,?)"), v6, 0, v5);

}

void __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "bindParam:toInteger:", 1, a1[6]);
  if (a1[4])
    objc_msgSend(v5, "bindParam:toNSData:", 2);
  else
    objc_msgSend(v5, "bindParamToNull:", 2);
  v3 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "bindParam:toInt64:", 3, (uint64_t)v4);
  }
  else
  {
    objc_msgSend(v5, "bindParamToNull:", 3);
  }

}

uint64_t __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

void __40___ATXDataStore_alogContainsActionUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke_3;
  v5[3] = &unk_1E82DCC00;
  v5[4] = a1[6];
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alog WHERE actionUUID=? LIMIT 1"), v6, v5, &__block_literal_global_353);

}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D81568];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while trying to retrieve action from alog: %@"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulateCrashWithDescription:", v3);

  return *MEMORY[0x1E0D81788];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2;
  v7[3] = &unk_1E82E2DB8;
  v7[4] = v2;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v18 = *(_OWORD *)(a1 + 120);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 136);
  v5 = *(id *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 144);
  v14 = v5;
  v20 = v6;
  v15 = *(id *)(a1 + 96);
  v16 = *(id *)(a1 + 104);
  v21 = *(_OWORD *)(a1 + 152);
  v17 = *(id *)(a1 + 112);
  objc_msgSend(v4, "writeTransaction:", v7);

}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[4];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];

  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_3;
  v45[3] = &unk_1E82DCBD8;
  v46 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)"), v45, 0, 0);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_4;
  v43[3] = &unk_1E82DCBD8;
  v44 = *(id *)(a1 + 48);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)"), v43, 0, 0);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_5;
  v41[3] = &unk_1E82DCBD8;
  v42 = v6;
  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_6;
  v40[3] = &unk_1E82DCC00;
  v40[4] = v48;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogBundleId WHERE bundleId=?"), v41, v40, 0);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_7;
  v38[3] = &unk_1E82DCBD8;
  v39 = *(id *)(a1 + 48);
  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_8;
  v37[3] = &unk_1E82DCC00;
  v37[4] = v47;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogAction WHERE actionType=?"), v38, v37, 0);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_9;
  v23[3] = &unk_1E82E2D20;
  v31 = v48;
  v32 = v47;
  v24 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 64);
  v33 = *(_OWORD *)(a1 + 120);
  v26 = *(id *)(a1 + 72);
  v27 = *(id *)(a1 + 80);
  v34 = *(_QWORD *)(a1 + 136);
  v10 = *(id *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 144);
  v28 = v10;
  v35 = v11;
  v29 = *(id *)(a1 + 96);
  v30 = *(id *)(a1 + 104);
  v36 = *(_OWORD *)(a1 + 152);
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alog (bundleId, actionType, slots, date, timeOfDay, dayOfWeek, prevLocation, location, weight, actionUUID, motionType, appSessionStartDate, appSessionEndDate, creationDateInMilliseconds, geoHash, coarseGeohash) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), v23, 0, 0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_10;
  v16[3] = &unk_1E82DCBD8;
  v17 = *(id *)(a1 + 88);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_11;
  v15[3] = &unk_1E82DF1D0;
  v15[4] = &v18;
  v15[5] = v22;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id, MAX(creationDateInMilliseconds) FROM alog WHERE actionUUID=?"), v16, v15, &__block_literal_global_384);
  if (*((_BYTE *)v19 + 24))
  {
    v13 = *(void **)(a1 + 112);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_385;
    v14[3] = &unk_1E82E2D90;
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = v22;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_8(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BYTE v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  objc_msgSend(v3, "bindParam:toInt64:", 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  objc_msgSend(v3, "bindParam:toNSData:", 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindParam:toInt64:", 4, (uint64_t)v4);
  objc_msgSend(v3, "bindParam:toInteger:", 5, *(_QWORD *)(a1 + 104));
  objc_msgSend(v3, "bindParam:toInteger:", 6, *(_QWORD *)(a1 + 112));
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    objc_msgSend(v5, "getUUIDBytes:", v13);
    sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v3), "stmt"), 7, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v3, "bindParamToNull:", 7);
  }
  v6 = *(void **)(a1 + 56);
  if (v6)
  {
    objc_msgSend(v6, "getUUIDBytes:", v13);
    sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v3), "stmt"), 8, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v3, "bindParamToNull:", 8);
  }
  objc_msgSend(v3, "bindParam:toDouble:", 9, *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 64), "getUUIDBytes:", v13);
  v7 = objc_retainAutorelease(v3);
  sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v7, "stmt"), 10, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v7, "bindParam:toInteger:", 11, *(_QWORD *)(a1 + 128));
  v8 = *(void **)(a1 + 72);
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "bindParam:toInt64:", 12, (uint64_t)v9);
  }
  else
  {
    objc_msgSend(v7, "bindParamToNull:", 12);
  }
  v10 = *(void **)(a1 + 80);
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "bindParam:toInt64:", 13, (uint64_t)v11);
  }
  else
  {
    objc_msgSend(v7, "bindParamToNull:", 13);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "bindParam:toInt64:", 14, (uint64_t)(v12 * 1000.0));
  objc_msgSend(v7, "bindParam:toInt64:", 15, *(_QWORD *)(a1 + 136));
  objc_msgSend(v7, "bindParam:toInt64:", 16, *(_QWORD *)(a1 + 144));

}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_11(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12_cold_1();

  v4 = (void *)MEMORY[0x1E0D81568];
  objc_msgSend(v2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulateCrashWithDescription:", v5);

  v6 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v6;
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_385(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2_388;
  v11[3] = &unk_1E82E2D68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO slotSetKey (alogId, uuid, paramHash, slotHash, paramCount) VALUES (?,?,?,?,?)"), v11, 0, 0);

}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2_388(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v4, "stmt"), 2, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "hash"));
  objc_msgSend(v4, "bindParam:toInt64:", 4, objc_msgSend(*(id *)(a1 + 40), "slotHash"));
  v5 = *(void **)(a1 + 40);
  if (v5)
    v6 = objc_msgSend(v5, "paramCount");
  else
    v6 = 0;
  objc_msgSend(v4, "bindParam:toInt64:", 5, v6);

}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  __atxlog_handle_deletions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_cold_1(a1, v2, v3);

  v4 = (void *)MEMORY[0x1E0D81568];
  objc_msgSend(*(id *)(a1 + 40), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulateCrashWithDescription:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_392;
  v13[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v13[4] = v7;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE id=?"), v13, 0, 0);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_2;
  v12[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v12[4] = v9;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId=?"), v12, 0, 0);
  return xpc_transaction_exit_clean();
}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_392(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(a1 + 32));
}

void __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_2;
  v9[3] = &unk_1E82DF220;
  v10 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_3;
  v7[3] = &unk_1E82E2E08;
  v7[4] = v6;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT i.actionType, l.slots, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash, l.weight, l.id FROM alog AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?"), v9, v7, 0);

}

void __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSString:", 1, v3);
  objc_msgSend(v4, "bindParam:toNSString:", 2, a1[5]);
  objc_msgSend(v4, "bindParam:toInteger:", 3, *(_QWORD *)(a1[6] + 56));

}

uint64_t __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_4;
  v6[3] = &unk_1E82E2DE0;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "_deserializeActionLogRowWithStmt:invokingBlock:", a2, v6);

  return v4;
}

uint64_t __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3, a4, a5, a6);
}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_2;
  v18[3] = &unk_1E82DF220;
  v19 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v20 = v5;
  v21 = v6;
  v9[0] = v4;
  v9[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 88);
  v14 = *(_OWORD *)(a1 + 104);
  v15 = *(_OWORD *)(a1 + 120);
  v16 = *(_OWORD *)(a1 + 136);
  v17 = *(_OWORD *)(a1 + 152);
  v8 = *(_OWORD *)(a1 + 56);
  v9[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3;
  v9[3] = &unk_1E82E2E30;
  v7 = (id)v8;
  v11 = v8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT s.uuid, l.id, i.actionType, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.weight, s.paramHash, s.slotHash, s.paramCount, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash FROM alog AS l, slotSetKey AS s, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND l.id = s.alogId AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?"), v18, v9, 0);

}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSString:", 1, v3);
  objc_msgSend(v4, "bindParam:toNSString:", 2, a1[5]);
  objc_msgSend(v4, "bindParam:toInteger:", 3, *(_QWORD *)(a1[6] + 56));

}

uint64_t __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  unsigned __int8 *v33;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  objc_msgSend(v3, "getInt64ForColumn:", 10);
  objc_msgSend(v3, "getInt64ForColumn:", 11);
  objc_msgSend(v3, "getInt64ForColumn:", 12);
  v6 = *(_QWORD *)(a1[6] + 8);
  if (*(_QWORD *)(v6 + 24) != v5)
  {
    objc_msgSend(v3, "getNSStringForColumn:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
    v11 = *(_QWORD *)(a1[8] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v3, "getIntegerForColumn:", 4);
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = objc_msgSend(v3, "getIntegerForColumn:", 5);
    objc_msgSend(v3, "getNSDataForColumn:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length") == 16)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v13), "bytes"));
      v15 = *(_QWORD *)(a1[11] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;
    }
    else
    {
      v17 = *(_QWORD *)(a1[11] + 8);
      v16 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;
    }

    objc_msgSend(v3, "getNSDataForColumn:", 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length") == 16)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v18), "bytes"));
      v20 = *(_QWORD *)(a1[12] + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;
    }
    else
    {
      v22 = *(_QWORD *)(a1[12] + 8);
      v21 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = 0;
    }

    *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = objc_msgSend(v3, "getIntegerForColumn:", 8);
    objc_msgSend(v3, "getDoubleForColumn:", 9);
    *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = v23;
    if ((objc_msgSend(v3, "isColumnNull:", 13) & 1) == 0)
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 13));
      v25 = *(_QWORD *)(a1[15] + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

    }
    if ((objc_msgSend(v3, "isColumnNull:", 14) & 1) == 0)
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 14));
      v28 = *(_QWORD *)(a1[16] + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;

    }
    *(_QWORD *)(*(_QWORD *)(a1[17] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 15);
    *(_QWORD *)(*(_QWORD *)(a1[18] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 16);

    v6 = *(_QWORD *)(a1[6] + 8);
  }
  *(_QWORD *)(v6 + 24) = v5;
  if (objc_msgSend(v4, "length") == 16)
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
    v31 = (void *)MEMORY[0x1CAA48B6C]();
    v32 = (*(uint64_t (**)(double))(a1[5] + 16))(*(double *)(*(_QWORD *)(a1[14] + 8) + 24));
    objc_autoreleasePoolPop(v31);
    if (v32)
      v33 = (unsigned __int8 *)MEMORY[0x1E0D81780];
    else
      v33 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }
  else
  {
    __atxlog_handle_default();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3_cold_1();
    v33 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }

  return *v33;
}

void __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "count");
  _PASQMarksSeparatedByCommas();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT i.actionType, l.slots, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash, l.weight, l.id FROM alog AS l, alogAction AS i WHERE actionUUID IN (%@) AND i.id = l.actionType"), v3);

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_2;
  v11[3] = &unk_1E82DCBD8;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_3;
  v9[3] = &unk_1E82E2E08;
  v7 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v7;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v8, v11, v9, 0);

}

void __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  _BYTE v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getUUIDBytes:", v6);

      sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v3), "stmt"), ++v4, v6, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    while (v4 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }

}

uint64_t __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deserializeActionLogRowWithStmt:invokingBlock:", a2, *(_QWORD *)(a1 + 40));
}

void __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_2;
  v7[3] = &unk_1E82DCB88;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT alog.id, alogBundleId.bundleId, alogAction.actionType, alog.date, slotSetKey.uuid, slotSetKey.paramHash, slotSetKey.slotHash, slotSetKey.paramCount FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ?"), v7, v5, 0);

}

void __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);

}

uint64_t __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ATXAppIntentDuetEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXAppIntentDuetEvent *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 1) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 2) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 4) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 5) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 6) & 1) != 0
    || objc_msgSend(v3, "isColumnNull:", 7))
  {
    v4 = *MEMORY[0x1E0D81780];
  }
  else
  {
    v18 = objc_msgSend(v3, "getInt64ForColumn:", 0);
    objc_msgSend(v3, "getNSStringForColumn:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSStringForColumn:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "getInt64ForColumn:", 5);
    v8 = objc_msgSend(v3, "getInt64ForColumn:", 6);
    v9 = objc_msgSend(v3, "getInt64ForColumn:", 7);
    v10 = [ATXAppIntentDuetEvent alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:](v10, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:", v20, v19, v12, v14, v15, v6, v6, v16);

    if (v17)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
    v4 = *MEMORY[0x1E0D81780];

  }
  return v4;
}

void __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_2;
  v10[3] = &unk_1E82DEE00;
  v11 = v2;
  v5 = *(id *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v12 = v5;
  v13 = v6;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_3;
  v8[3] = &unk_1E82DEC70;
  v9 = v7;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT alogBundleId.bundleId, alogAction.actionType, alog.date, slotSetKey.uuid, slotSetKey.paramHash, slotSetKey.slotHash, slotSetKey.paramCount FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ? ORDER BY alog.date DESC LIMIT ?"), v10, v8, 0);

}

void __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);
  objc_msgSend(v6, "bindParam:toInteger:", 3, *(_QWORD *)(a1 + 48));

}

uint64_t __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  ATXMinimalSlotResolutionParameters *v13;
  ATXMinimalActionParameters *v14;

  v3 = a2;
  if ((objc_msgSend(v3, "isColumnNull:", 0) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 1) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 2) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 4) & 1) != 0
    || (objc_msgSend(v3, "isColumnNull:", 5) & 1) != 0
    || objc_msgSend(v3, "isColumnNull:", 6))
  {
    v4 = *MEMORY[0x1E0D81780];
  }
  else
  {
    objc_msgSend(v3, "getNSStringForColumn:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSStringForColumn:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getNSDataForColumn:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v11 = objc_retainAutorelease(v9);
    v12 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));
    v13 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:]([ATXMinimalSlotResolutionParameters alloc], "initWithParameterHash:slotHash:uuid:paramCount:", objc_msgSend(v3, "getIntegerForColumn:", 4), objc_msgSend(v3, "getIntegerForColumn:", 5), v12, objc_msgSend(v3, "getIntegerForColumn:", 6));
    v14 = -[ATXMinimalActionParameters initWithMinimalSlotResolutionParameters:actionTime:bundleId:actionType:]([ATXMinimalActionParameters alloc], "initWithMinimalSlotResolutionParameters:actionTime:bundleId:actionType:", v13, v8, v6, v7);
    objc_msgSend(*(id *)(a1 + 32), "addMinimalActionParameter:", v14);
    v4 = *MEMORY[0x1E0D81780];

  }
  return v4;
}

void __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_2;
  v7[3] = &unk_1E82DCB88;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT alogBundleId.bundleId, alogAction.actionType, COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? GROUP BY alogBundleId.bundleId, alogAction.actionType"), v7, v5, 0);

}

void __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);

}

uint64_t __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

void __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_2;
  v6[3] = &unk_1E82E2E80;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_3;
  v5[3] = &unk_1E82DCC00;
  v5[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ? AND alogAction.actionType = ?"), v6, v5, 0);

}

void __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);
  objc_msgSend(v6, "bindParam:toNSString:", 3, *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "bindParam:toNSString:", 4, *(_QWORD *)(a1 + 56));

}

uint64_t __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_2;
  v6[3] = &unk_1E82DF220;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_3;
  v5[3] = &unk_1E82DCC00;
  v5[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ?"), v6, v5, 0);

}

void __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);
  objc_msgSend(v6, "bindParam:toNSString:", 3, *(_QWORD *)(a1 + 48));

}

uint64_t __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_2;
  v9[3] = &unk_1E82E2EF8;
  v10 = v2;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v13 = v5;
  v14 = v6;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_3;
  v8[3] = &unk_1E82DCC00;
  v8[4] = v7;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) as numOccurrences FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ? AND alogAction.actionType = ? AND slotSetKey.paramHash = ?"), v9, v8, 0);

}

void __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 1, (uint64_t)v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindParam:toInt64:", 2, (uint64_t)v5);
  objc_msgSend(v6, "bindParam:toNSString:", 3, *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "bindParam:toNSString:", 4, *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "bindParam:toInt64:", 5, *(_QWORD *)(a1 + 64));

}

uint64_t __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    ATXSlotSetsDeserialize();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return *MEMORY[0x1E0D81788];
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35___ATXDataStore_actionForSlotUUID___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "getUUIDBytes:", v18);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v18, 16);
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v5);
  }

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_2;
  v12[3] = &unk_1E82DACB0;
  v12[4] = v9;
  v13 = v2;
  v11 = v2;
  objc_msgSend(v10, "writeTransaction:", v12);

}

void __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_3;
  v13[3] = &unk_1E82DCBD8;
  v14 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId IN (SELECT rowid FROM alog WHERE actionUUID IN _pas_nsset(:actionUUIDSet))"), v13, 0, 0);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_4;
  v11[3] = &unk_1E82DCBD8;
  v12 = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE actionUUID IN _pas_nsset(:actionUUIDSet)"), v11, 0, 0);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_5;
  v9[3] = &unk_1E82DCBD8;
  v10 = v7;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback WHERE actionUUID IN _pas_nsset(:actionUUIDSet)"), v9, 0, 0);

}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":actionUUIDSet", *(_QWORD *)(a1 + 32));
}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":actionUUIDSet", *(_QWORD *)(a1 + 32));
}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":actionUUIDSet", *(_QWORD *)(a1 + 32));
}

void __47___ATXDataStore_removeActionDataForActionUUID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_2;
  v4[3] = &unk_1E82DACB0;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "writeTransaction:", v4);

}

void __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_3;
  v13[3] = &unk_1E82DCBD8;
  v14 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId IN (SELECT rowid FROM alog WHERE actionUUID=?)"), v13, 0, 0);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_4;
  v11[3] = &unk_1E82DCBD8;
  v12 = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE actionUUID=?"), v11, 0, 0);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_5;
  v9[3] = &unk_1E82DCBD8;
  v10 = v7;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback WHERE actionUUID=?"), v9, 0, 0);

}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  sqlite3_stmt *v5;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "getUUIDBytes:", v7);
  v4 = objc_retainAutorelease(v3);
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "stmt");

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke_2;
  v4[3] = &unk_1E82DCC00;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid FROM slotSetKey WHERE alogId NOT IN (SELECT id FROM alog)"), 0, v4, 0);
}

uint64_t __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

void __45___ATXDataStore_removeActionDataForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_2;
  v4[3] = &unk_1E82DACB0;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "writeTransaction:", v4);

}

void __45___ATXDataStore_removeActionDataForBundleId___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v7[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_3;
  v7[3] = &unk_1E82DCBD8;
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = v2;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_4;
  v6[3] = &unk_1E82DCC00;
  v6[4] = &v9;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogBundleId WHERE bundleId=?"), v7, v6, 0);
  v5 = v10[3];
  if (v5 != -1)
    removeActionDataByBundleIdId(*(void **)(*(_QWORD *)(a1 + 32) + 48), v5);

  _Block_object_dispose(&v9, 8);
}

uint64_t __45___ATXDataStore_removeActionDataForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __45___ATXDataStore_removeActionDataForBundleId___block_invoke_4(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __40___ATXDataStore_actionAndSlotsForRowId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "integerValue"));

}

uint64_t __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (ATXSlotSetsDeserialize(),
        v5 = objc_claimAutoreleasedReturnValue(),
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8),
        v7 = *(void **)(v6 + 40),
        *(_QWORD *)(v6 + 40) = v5,
        v7,
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }
  else
  {
    v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }

  return *v8;
}

uint64_t __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_459(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_460(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

void __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_461(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "longLongValue"));

}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_462()
{
  return *MEMORY[0x1E0D81780];
}

void __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "regenerateSlotSetKeyForBundleId", " enableTelemetry=YES ", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(v6 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke_464;
  v11[3] = &unk_1E82DACB0;
  v11[4] = v6;
  v12 = v7;
  objc_msgSend(v8, "writeTransaction:", v11);
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v10, OS_SIGNPOST_INTERVAL_END, v3, "regenerateSlotSetKeyForBundleId", ", buf, 2u);
  }

}

uint64_t __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke_464(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_regenerateSlotSetKeyForBundleId:", *(_QWORD *)(a1 + 40));
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2;
  v6[3] = &unk_1E82DACB0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "writeTransaction:", v6);

}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  _QWORD v65[5];
  _QWORD v66[5];
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  id v101;
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)objc_opt_new();
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v100[0] = v2;
    v100[1] = 3221225472;
    v100[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3;
    v100[3] = &unk_1E82DF040;
    v101 = v4;
    v6 = v3;
    v102 = v6;
    objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id, bundleId FROM alogBundleId"), 0, v100, 0);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v97 != v9)
            objc_enumerationMutation(v7);
          removeActionDataByBundleIdId(*(void **)(*(_QWORD *)(a1 + 40) + 48), objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "unsignedLongLongValue"));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      }
      while (v8);
    }

  }
  v11 = (void *)objc_opt_new();
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = -1;
  v88 = 0;
  v89 = &v88;
  v90 = 0x2020000000;
  v91 = -1;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = -1;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99D68];
  v47 = v12;
  objc_msgSend(v12, "maximumSlotResolutionDatabaseEntryAge");
  objc_msgSend(v13, "dateWithTimeIntervalSinceNow:", v14 * 24.0 * 60.0 * -60.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__48;
  v78 = __Block_byref_object_dispose__48;
  v79 = 0;
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(v16 + 48);
  v66[0] = v2;
  v66[1] = 3221225472;
  v66[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4;
  v66[3] = &unk_1E82E2F88;
  v70 = &v92;
  v71 = &v88;
  v72 = &v80;
  v69 = &v74;
  v66[4] = v16;
  v18 = v15;
  v67 = v18;
  v19 = v11;
  v68 = v19;
  v73 = &v84;
  objc_msgSend(v17, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, actionType, id, date FROM alog ORDER BY bundleId, actionType ASC, rowid DESC"), 0, v66, 0);
  if (v93[3] != -1 && v89[3] != -1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) < (unint64_t)*((int *)v81 + 6)
      || (objc_msgSend((id)v75[5], "timeIntervalSinceDate:", v18), v20 < 0.0))
    {
      v21 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v93[3]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v89[3]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFirst:second:", v22, v23);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v85[3]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, v24);

    }
  }
  v65[0] = v2;
  v65[1] = 3221225472;
  v65[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5;
  v65[3] = &unk_1E82E2FB0;
  v65[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v65);
  v26 = (void *)objc_opt_new();

  v93[3] = -1;
  v89[3] = -1;
  v85[3] = -1;
  *((_DWORD *)v81 + 6) = 0;
  v27 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v47, "maximumSlotFeedbackDatabaseEntryAge");
  objc_msgSend(v27, "dateWithTimeIntervalSinceNow:", v28 * 24.0 * 60.0 * -60.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_opt_new();
  v31 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v55[0] = v2;
  v55[1] = 3221225472;
  v55[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3_479;
  v55[3] = &unk_1E82E2FD8;
  v60 = &v74;
  v32 = v30;
  v61 = &v92;
  v62 = &v88;
  v63 = &v80;
  v33 = *(_QWORD *)(a1 + 40);
  v56 = v32;
  v57 = v33;
  v34 = v29;
  v58 = v34;
  v48 = v26;
  v59 = v48;
  v64 = &v84;
  objc_msgSend(v31, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, actionType, id, date FROM afeedback ORDER BY bundleId, actionType ASC, id DESC"), 0, v55, 0);
  if (v93[3] != -1 && v89[3] != -1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) < (unint64_t)*((int *)v81 + 6)
      || (objc_msgSend((id)v75[5], "timeIntervalSinceDate:", v34), v35 < 0.0))
    {
      v36 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v93[3]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v89[3]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v36, "initWithFirst:second:", v37, v38);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v85[3]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v40, v39);

    }
  }
  v54[0] = v2;
  v54[1] = 3221225472;
  v54[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4_480;
  v54[3] = &unk_1E82E2FB0;
  v54[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v54);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v41 = v32;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v103, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v51 != v43)
          objc_enumerationMutation(v41);
        v45 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
        v46 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        v49[0] = v2;
        v49[1] = 3221225472;
        v49[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_6;
        v49[3] = &unk_1E82DCBD8;
        v49[4] = v45;
        objc_msgSend(v46, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback WHERE id=?"), v49, 0, 0);
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v103, 16);
    }
    while (v42);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alogAction WHERE id NOT IN (SELECT actionType FROM alog UNION SELECT actionType FROM afeedback)"), 0, 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alogBundleId WHERE id NOT IN (SELECT bundleId FROM alog UNION SELECT bundleId FROM afeedback)"), 0, 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId NOT IN (SELECT id FROM alog)"), 0, 0, 0);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);

}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  unsigned __int8 *v20;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  v6 = objc_msgSend(v3, "getInt64ForColumn:", 3);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
  if (v6)

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v4 == v9)
  {
    if (v4 == -1)
      goto LABEL_17;
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v5 == v10)
      goto LABEL_17;
  }
  else
  {
    if (v9 == -1)
      goto LABEL_17;
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  if (v10 != -1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) < (unint64_t)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                             + 24)
      || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40)), v11 < 0.0))
    {
      v12 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithFirst:second:", v13, v14);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v15);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
LABEL_17:
  *(_QWORD *)(v8 + 24) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v5;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v18 = *(int *)(v17 + 24);
  *(_DWORD *)(v17 + 24) = v18 + 1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) > v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    if (v19 > 0.0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 2);
  }
  v20 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v20;
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_deletions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v6, "longLongValue");
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting rows older than id: %lld", buf, 0xCu);
  }

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_472;
  v18[3] = &unk_1E82DCB88;
  v10 = v5;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId IN (SELECT id FROM alog WHERE alog.bundleId=? AND alog.actionType=? AND alog.id<?)"), v18, 0, 0);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2_475;
  v15[3] = &unk_1E82DCB88;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE bundleId=? AND actionType=? AND id<?"), v15, 0, 0);

}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_472(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2_475(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3_479(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  unsigned __int8 *v25;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  v6 = objc_msgSend(v3, "getInt64ForColumn:", 3);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v9);
  }

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(_QWORD *)(v13 + 24);
  if (v4 == v14)
  {
    if (v4 == -1)
      goto LABEL_15;
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v5 == v15)
      goto LABEL_15;
  }
  else
  {
    if (v14 == -1)
      goto LABEL_15;
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  }
  if (v15 != -1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) < (unint64_t)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                             + 24)
      || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48)), v16 < 0.0))
    {
      v17 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithFirst:second:", v18, v19);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v21, v20);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
LABEL_15:
  *(_QWORD *)(v13 + 24) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v5;
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v23 = *(int *)(v22 + 24);
  *(_DWORD *)(v22 + 24) = v23 + 1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) > v23)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    if (v24 > 0.0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 2);
  }
  v25 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v25;
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4_480(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5_483;
  v10[3] = &unk_1E82DCB88;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback WHERE bundleId=? AND actionType=? AND id<?"), v10, 0, 0);

}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5_483(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "longLongValue"));

}

uint64_t __30___ATXDataStore_actionLogKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0D81638];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumn:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumn:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithFirst:second:", v6, v7);
  objc_msgSend(v2, "addObject:", v8);

  return *MEMORY[0x1E0D81780];
}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_2;
  v5[3] = &unk_1E82E3028;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 80);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 120);
  v12 = *(_OWORD *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 112);
  objc_msgSend(v4, "writeTransaction:", v5);

}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  _QWORD v31[4];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_3;
  v28[3] = &unk_1E82DCBD8;
  v29 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)"), v28, 0, 0);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_4;
  v26[3] = &unk_1E82DCBD8;
  v27 = *(id *)(a1 + 48);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)"), v26, 0, 0);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_5;
  v24[3] = &unk_1E82DCBD8;
  v25 = v6;
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_6;
  v23[3] = &unk_1E82DCC00;
  v23[4] = v31;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogBundleId WHERE bundleId=?"), v24, v23, 0);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_7;
  v21[3] = &unk_1E82DCBD8;
  v22 = *(id *)(a1 + 48);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_8;
  v20[3] = &unk_1E82DCC00;
  v20[4] = v30;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogAction WHERE actionType=?"), v21, v20, 0);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_9;
  v10[3] = &unk_1E82E3000;
  v14 = v31;
  v15 = v30;
  v11 = *(id *)(a1 + 56);
  v16 = *(_OWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v19 = *(_BYTE *)(a1 + 120);
  v17 = *(_OWORD *)(a1 + 96);
  v18 = *(_QWORD *)(a1 + 112);
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO afeedback (bundleId, actionType, slots, confirms, rejects, actionUUID, date, consumerSubType, feedbackType, geoHash, coarseGeohash) VALUES (?,?,?,?,?,?,?,?,?,?,?)"), v10, 0, 0);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_8(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  _BYTE v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toInt64:", 1, v3);
  objc_msgSend(v4, "bindParam:toInt64:", 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v4, "bindParam:toNSData:", 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindParam:toDouble:", 4, *(double *)(a1 + 72));
  objc_msgSend(v4, "bindParam:toDouble:", 5, *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "getUUIDBytes:", v9);
  v5 = objc_retainAutorelease(v4);
  sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v5, "stmt"), 6, v9, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindParam:toInt64:", 7, (uint64_t)v6);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindParam:toNSString:", 8, v7);

  objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackTypeToString:", *(_QWORD *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindParam:toNSString:", 9, v8);

  objc_msgSend(v5, "bindParam:toInt64:", 10, *(_QWORD *)(a1 + 96));
  objc_msgSend(v5, "bindParam:toInt64:", 11, *(_QWORD *)(a1 + 104));

}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0CF9508], "inverseConsumerSubtypeMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8C40], "inverseActionFeedbackTypeMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_2;
  v16[3] = &unk_1E82DF220;
  v17 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v18 = v7;
  v19 = v8;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_3;
  v11[3] = &unk_1E82E3050;
  v12 = v2;
  v13 = v3;
  v14 = v8;
  v15 = *(id *)(a1 + 56);
  v9 = v3;
  v10 = v2;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT l.slots, l.confirms, l.rejects, l.id, l.date, l.consumerSubType, l.feedbackType, l.geohash, l.coarseGeohash FROM afeedback AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?"), v16, v11, 0);

}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSString:", 1, v3);
  objc_msgSend(v4, "bindParam:toNSString:", 2, a1[5]);
  objc_msgSend(v4, "bindParam:toInteger:", 3, *(_QWORD *)(a1[6] + 56));

}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumn:", 1);
  v7 = v6;
  objc_msgSend(v3, "getDoubleForColumn:", 2);
  v9 = v8;
  objc_msgSend(v3, "getInt64ForColumn:", 3);
  v10 = objc_msgSend(v3, "getInt64ForColumn:", 4);
  objc_msgSend(v3, "getNSStringForColumn:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "getInt64ForColumn:", 7);
  v28 = objc_msgSend(v3, "getInt64ForColumn:", 8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14 && v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      ATXSlotSetsDeserialize();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v26 = v16;
    objc_msgSend(v16, "second");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    v21 = (unsigned __int8 *)MEMORY[0x1E0D81780];
    if (v20 == 1)
    {
      v24 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v26, "first");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "second");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "anyObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (*(uint64_t (**)(uint64_t, void *, void *, void *, _QWORD, uint64_t, uint64_t, uint64_t, double, double))(v24 + 16))(v24, v23, v22, v27, objc_msgSend(v13, "unsignedIntValue"), objc_msgSend(v15, "unsignedIntegerValue"), v29, v28, v7, v9);

      if (!v30)
        v21 = (unsigned __int8 *)MEMORY[0x1E0D81788];
    }
    v17 = *v21;

  }
  else
  {
    v17 = *MEMORY[0x1E0D81780];
  }

  objc_autoreleasePoolPop(v4);
  return v17;
}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4_cold_1();

  v3 = (void *)MEMORY[0x1E0D81568];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simulateCrashWithDescription:", v4);

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_501;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v8[4] = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback WHERE id=?"), v8, 0, 0);
  return xpc_transaction_exit_clean();
}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_501(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_deletions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting all actions", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog"), 0, 0, &__block_literal_global_505);
}

uint64_t __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_504(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_504_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM afeedback"), 0, 0, &__block_literal_global_508);
}

uint64_t __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey"), 0, 0, &__block_literal_global_511);
}

uint64_t __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __38___ATXDataStore_actionFeedbackLogKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0D81638];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumn:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumn:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithFirst:second:", v6, v7);
  objc_msgSend(v2, "addObject:", v8);

  return *MEMORY[0x1E0D81780];
}

uint64_t __42___ATXDataStore_removeActionsWithoutTitle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeActionsWithoutTitle");
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2;
  v22[3] = &unk_1E82DEC70;
  v5 = v2;
  v23 = v5;
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3;
  v21[3] = &unk_1E82DEF28;
  v21[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT slots, id FROM alog"), 0, v22, v21);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        __atxlog_handle_deletions();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(v10, "longLongValue");
          *(_DWORD *)buf = 134217984;
          v25 = v12;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting actions without title with rowId: %lld", buf, 0xCu);
        }

        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v15[4] = *(_QWORD *)(a1 + 40);
        v16[0] = v4;
        v16[1] = 3221225472;
        v16[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_518;
        v16[3] = &unk_1E82DCBD8;
        v16[4] = v10;
        v15[0] = v4;
        v15[1] = 3221225472;
        v15[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_520;
        v15[3] = &unk_1E82DEF28;
        objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE id = :id"), v16, 0, v15);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v7);
  }

}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  if (v4)
  {
    ATXSlotSetsDeserialize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasActionTitle") & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  v10 = *MEMORY[0x1E0D81780];

  return v10;
}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_518(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":id", objc_msgSend(v2, "longLongValue"));

}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_520(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_520_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

uint64_t __37___ATXDataStore_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __37___ATXDataStore_currentSchemaVersion__block_invoke_2()
{
  return *MEMORY[0x1E0D81788];
}

uint64_t __42___ATXDataStore_migrateWithMigrationPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __34___ATXDataStore_configureDatabase__block_invoke(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

BOOL __34___ATXDataStore_runMigrationPlan___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  NSString *v6;
  SEL v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(NSString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("migration_")))
        {
          v7 = NSSelectorFromString(v6);
          if (!v7
            || ((uint64_t (*)(_QWORD, SEL))objc_msgSend(*(id *)(a1 + 40), "methodForSelector:", v7))(*(_QWORD *)(a1 + 40), v7) != 3)
          {
            *((_BYTE *)v17 + 24) = 0;
            goto LABEL_15;
          }
        }
        else
        {
          v8 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __34___ATXDataStore_runMigrationPlan___block_invoke_2;
          v11[3] = &unk_1E82DEF28;
          v11[4] = &v16;
          objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v6, 0, 0, v11);
          if (!*((_BYTE *)v17 + 24))
            goto LABEL_15;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  if (*((_BYTE *)v17 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateSchemaVersionNumberTo:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 3;
    v9 = *((_BYTE *)v17 + 24) != 0;
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __34___ATXDataStore_runMigrationPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34___ATXDataStore_runMigrationPlan___block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

uint64_t __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toInt64:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_2;
  v13[3] = &unk_1E82E2AF0;
  v13[4] = v2;
  v13[5] = v3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_3;
  v12[3] = &unk_1E82DEF28;
  v12[4] = v3;
  result = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, date FROM launchHistory"), 0, v13, v12);
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_4;
    v11[3] = &unk_1E82E2AF0;
    v11[4] = v8;
    v11[5] = v7;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_5;
    v10[3] = &unk_1E82DEF28;
    return objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, date FROM spotlightLaunchHistory"), 0, v11, v10);
  }
  return result;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 *v6;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);

  if ((objc_msgSend(*(id *)(a1 + 32), "migrationUpdateOrInsertTimestamp:intoColumn:forBundleId:", v5, CFSTR("lastLaunchDate"), v4) & 1) != 0)
  {
    v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v6 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }

  return *v6;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81788];
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 *v6;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);

  if ((objc_msgSend(*(id *)(a1 + 32), "migrationUpdateOrInsertTimestamp:intoColumn:forBundleId:", v5, CFSTR("lastSpotlightLaunchDate"), v4) & 1) != 0)
  {
    v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v6 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }

  return *v6;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_5(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_removeFeedbackForBundleId:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

void __64___ATXDataStore_migration_DelinkFromCoreLocationVisitMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/CoreParsec.framework"), v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/Routine.bundle"), v3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "stopMonitoringVisits");
  objc_msgSend(v5, "stopMonitoringVisits");

  objc_autoreleasePoolPop(v2);
}

void __43___ATXDataStore_migration_AddExtensionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (+[ATXLaunchServicesHelper bundleIsExtension:](ATXLaunchServicesHelper, "bundleIsExtension:"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __47___ATXDataStore_migration_AddEnterpriseAppInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CF8CE8];
  v4 = a2;
  objc_msgSend(v2, "_markBundleId:asEnterpriseApp:", v4, objc_msgSend(v3, "isEnterpriseAppForBundle:", v4));

}

uint64_t __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":histogram_type", 8);
}

uint64_t __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

void __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":h1", 15);
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":h2", 18);
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":h3", 21);
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":h4", 24);
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":h5", 27);

}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_614(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":h1", 30);
}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_616(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v2);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v4;
}

uint64_t __35___ATXDataStore_allActionsAndSlots__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  ATXSlotSetsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

    v7 = *MEMORY[0x1E0D81780];
    goto LABEL_6;
  }
  v7 = *MEMORY[0x1E0D81780];
LABEL_6:

  return v7;
}

uint64_t __35___ATXDataStore_allActionsAndSlots__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __35___ATXDataStore_allActionsAndSlots__block_invoke_2_cold_1();

  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v7;
}

void __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _BYTE v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toInteger:", 1, objc_msgSend(v3, "integerValue"));
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", v7);

  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v6, "stmt"), 2, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 48), "hash"));
  objc_msgSend(v6, "bindParam:toInt64:", 4, objc_msgSend(*(id *)(a1 + 40), "hash"));
  objc_msgSend(v6, "bindParam:toInt64:", 5, objc_msgSend(*(id *)(a1 + 48), "paramCount"));

}

uint64_t __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  **(_QWORD **)(a1 + 48) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

void __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSData:", 1, v3);
  objc_msgSend(v4, "bindParam:toInteger:", 2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));

}

uint64_t __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return *MEMORY[0x1E0D81780];
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v9, v8);
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v10;
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

void __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":appAction", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":predictionsCount", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":feedbackCount", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":uiType", *(_QWORD *)(a1 + 56));

}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_5(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

void __69___ATXDataStore_updateOrInsertSubsequentLaunchCountData_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":launch_count", *(_QWORD *)(a1 + 40));

}

void __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", (uint64_t)v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":translate_app", CFSTR("com.apple.Translate"));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":magnifier_app", CFSTR("com.apple.Magnifier"));

}

uint64_t __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81788];
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", (uint64_t)v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":generativePlayground_app", CFSTR("com.apple.GenerativePlaygroundApp"));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":printCenter_app", CFSTR("com.apple.printcenter"));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":tvRemote_app", CFSTR("com.apple.TVRemoteUIService"));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":passwords_app", CFSTR("com.apple.Passwords"));

}

uint64_t __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  __atxlog_handle_app_install();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_cold_1();

  return *MEMORY[0x1E0D81788];
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_689(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", (uint64_t)v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":calculator_app", CFSTR("com.apple.calculator"));

}

uint64_t __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_694(uint64_t a1)
{
  NSObject *v1;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  __atxlog_handle_app_install();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_694_cold_1();

  return *MEMORY[0x1E0D81788];
}

uint64_t __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":new_timestamp", 1);
}

uint64_t __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81788];
}

void __45___ATXDataStore_migration_populateModeCaches__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t v5[16];
  uint8_t buf[16];

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Populating mode caches in migration", buf, 2u);
  }

  __atxlog_handle_default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_DEFAULT, "Training mode entity models...", v5, 2u);
  }

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "train");
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Done training mode entity models.", v4, 2u);
  }

}

void __79___ATXDataStore_updateOrInsertSubsequentAppActionLaunchCountData_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":key", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":launch_count", *(_QWORD *)(a1 + 40));

}

void __93___ATXDataStore_updateOrInsertPredictionsAndFeedbackForAppAction_feedbackReceived_forUIType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":app_action", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":ui_type", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":feedback_count", *(unsigned __int8 *)(a1 + 48));

}

void __61___ATXDataStore_updateOrInsertMessageRecipient_dateMessaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":recipient", v3);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":date_messaged", (uint64_t)v4);

}

void __73___ATXDataStore_updateOrInsertAverageSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":average_seconds_between_launches", objc_msgSend(v3, "integerValue"));
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":average_seconds_between_launches");

}

void __72___ATXDataStore_updateOrInsertMedianSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":median_seconds_between_launches", objc_msgSend(v3, "integerValue"));
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":median_seconds_between_launches");

}

void __76___ATXDataStore_updateOrInsertAverageSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":app_action", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":average_seconds_between_app_actions", objc_msgSend(v3, "integerValue"));
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":average_seconds_between_app_actions");

}

void __75___ATXDataStore_updateOrInsertMedianSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":app_action", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":median_seconds_between_app_actions", objc_msgSend(v3, "integerValue"));
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":median_seconds_between_app_actions");

}

void __63___ATXDataStore_updateOrInsertGenreId_subGenreIds_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":genreId_data", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "bindNamedParam:toNSData:", ":subGenreIdsData");
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":subGenreIdsData");

}

void __58___ATXDataStore_updateOrInsertApp2VecCluster_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":app2vec_cluster", objc_msgSend(*(id *)(a1 + 40), "integerValue"));

}

void __76___ATXDataStore_updateOrInsertTimestamp_intoColumn_forBundleId_isExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":is_extension", *(unsigned __int8 *)(a1 + 48));

}

void __54___ATXDataStore_updateOrInsertTimestamp_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":app_action", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", *(_QWORD *)(a1 + 40));

}

void __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":new_timestamp", *(_QWORD *)(a1 + 64));
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":genreId_data", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v3, "bindNamedParam:toNSData:", ":subGenreIds_data");
  else
    objc_msgSend(v3, "bindNamedParamToNull:", ":subGenreIds_data");
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":is_extension", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":is_enterprise_app", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":app2vec_cluster", objc_msgSend(*(id *)(a1 + 56), "integerValue"));

}

uint64_t __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_app_install();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __42___ATXDataStore__markBundleIdAsExtension___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":bundle_id", *(_QWORD *)(a1 + 32));
}

uint64_t __42___ATXDataStore__markBundleIdAsExtension___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

void __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":is_enterprise_app", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  return *MEMORY[0x1E0D81788];
}

void __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundle_id", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":new_timestamp", *(_QWORD *)(a1 + 40));

}

uint64_t __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81788];
}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_2;
  v7[3] = &unk_1E82E3430;
  v7[4] = v2;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 96);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 112);
  v5 = *(id *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 120);
  v14 = v5;
  v17 = v6;
  objc_msgSend(v4, "writeTransaction:", v7);

}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  _QWORD v34[4];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_3;
  v31[3] = &unk_1E82DCBD8;
  v32 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)"), v31, 0, 0);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_4;
  v29[3] = &unk_1E82DCBD8;
  v30 = *(id *)(a1 + 48);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)"), v29, 0, 0);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_5;
  v27[3] = &unk_1E82DCBD8;
  v28 = v6;
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_6;
  v26[3] = &unk_1E82DCC00;
  v26[4] = v34;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogBundleId WHERE bundleId=?"), v27, v26, 0);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_7;
  v24[3] = &unk_1E82DCBD8;
  v25 = *(id *)(a1 + 48);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_8;
  v23[3] = &unk_1E82DCC00;
  v23[4] = v33;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogAction WHERE actionType=?"), v24, v23, 0);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_9;
  v12[3] = &unk_1E82E3408;
  v18 = v34;
  v19 = v33;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v20 = *(_OWORD *)(a1 + 96);
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 112);
  v10 = *(id *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 120);
  v17 = v10;
  v22 = v11;
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO alog (bundleId, actionType, slots, date, timeOfDay, dayOfWeek, prevLocation, location, weight, actionUUID, motionType) VALUES (?,?,?,?,?,?,?,?,?,?,?)"), v12, 0, 0);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_8(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  objc_msgSend(v3, "bindParam:toInt64:", 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  objc_msgSend(v3, "bindParam:toNSData:", 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindParam:toInt64:", 4, (uint64_t)v4);
  objc_msgSend(v3, "bindParam:toInteger:", 5, *(_QWORD *)(a1 + 88));
  objc_msgSend(v3, "bindParam:toInteger:", 6, *(_QWORD *)(a1 + 96));
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    objc_msgSend(v5, "getUUIDBytes:", v8);
    sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v3), "stmt"), 7, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v3, "bindParamToNull:", 7);
  }
  v6 = *(void **)(a1 + 56);
  if (v6)
  {
    objc_msgSend(v6, "getUUIDBytes:", v8);
    sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v3), "stmt"), 8, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v3, "bindParamToNull:", 8);
  }
  objc_msgSend(v3, "bindParam:toDouble:", 9, *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 64), "getUUIDBytes:", v8);
  v7 = objc_retainAutorelease(v3);
  sqlite3_bind_blob((sqlite3_stmt *)objc_msgSend(v7, "stmt"), 10, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v7, "bindParam:toInteger:", 11, *(_QWORD *)(a1 + 112));

}

uint64_t __29___ATXDataStore__testMigrate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrate");
}

void __38___ATXDataStore__testMigrateToSchema___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  +[_ATXDataStoreMigrations migrations](_ATXDataStoreMigrations, "migrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_trimMigrationPlan:toSchema:", v3, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "migrateWithMigrationPlan:", v4);
}

void __38___ATXDataStore_swapInDuetHelperStub___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __32___ATXDataStore__databaseSchema__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v23[2] = __32___ATXDataStore__databaseSchema__block_invoke_2;
  v23[3] = &unk_1E82DEC70;
  v4 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = v2;
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __32___ATXDataStore__databaseSchema__block_invoke_3;
  v22[3] = &unk_1E82DCC28;
  v22[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND NOT name LIKE 'sqlite_%'"), 0, v23, v22);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA table_info(%@);"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 40);
        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v15[0] = v4;
        v15[1] = 3221225472;
        v15[2] = __32___ATXDataStore__databaseSchema__block_invoke_4;
        v15[3] = &unk_1E82DF040;
        v16 = v11;
        v17 = v9;
        v14[0] = v4;
        v14[1] = 3221225472;
        v14[2] = __32___ATXDataStore__databaseSchema__block_invoke_5;
        v14[3] = &unk_1E82DCC28;
        v14[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v10, 0, v15, v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v6);
  }

}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned __int8 *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v5;
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("column");
  v9[1] = CFSTR("dataType");
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  return *MEMORY[0x1E0D81780];
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_5(uint64_t a1, uint64_t a2)
{
  +[_ATXDataStore _simulateCrashForMigrationFailure:](_ATXDataStore, "_simulateCrashForMigrationFailure:", a2);
  objc_msgSend(*(id *)(a1 + 32), "integrityCheckOrAbort");
  return *MEMORY[0x1E0D81788];
}

uint64_t __38___ATXDataStore_integrityCheckOrAbort__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("ok"), "isEqualToString:", v3);

  if ((v4 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81788];
}

uint64_t __38___ATXDataStore_integrityCheckOrAbort__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E0D81780];
}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_2;
  v9[3] = &unk_1E82DCBD8;
  v10 = *(id *)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_3;
  v6[3] = &unk_1E82E6C58;
  v5 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 64);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT log.id, logAction.actionType, log.date FROM alog AS log, alogAction AS logAction WHERE logAction.id = log.actionType AND log.date > ? ORDER BY log.date"), v9, v6, &__block_literal_global_162);

}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindParam:toInt64:", 1, (uint64_t)v3);

}

uint64_t __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 0);
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (void *)MEMORY[0x1CAA48B6C]();
  LODWORD(a1) = (*(uint64_t (**)(void))(a1[4] + 16))();
  objc_autoreleasePoolPop(v10);
  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if ((_DWORD)a1)
    v13 = v11;
  else
    v13 = v12;
  return *v13;
}

uint64_t __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4_cold_1(v0);

  return *MEMORY[0x1E0D81788];
}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to write parameterCombinationsWithSchema", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to read parameterCombinationsWithSchema", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to write backgroundExecution", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to read backgroundExecution", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to write title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to read title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to write subtitle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to read subtitle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to write eligibleForWidgets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to read eligibleForWidgets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to remove cached intents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "_ATXDataStore failed to remove all cached intents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "_ATXDataStore failed to read webClipForAppClip", a5, a6, a7, a8, 0);
}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "_ATXDataStore failed to write webClipForAppClip", a5, a6, a7, a8, 0);
}

void __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to delete launch timestamps for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __28___ATXDataStore_loadAppInfo__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "Unexpected NULL isEnterpriseApp for bundleId: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error unarchving subsequent launches for %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Unable to delete subsequentLaunchCounts for bundle %@ (%@)", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Unable to delete subsequentAppActionLaunchCounts for appAction %@ (%@)", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error enumerating AppInfo bundleIds: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error enumerating AppInfo appActions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Could not read sqlite database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "No datastore file found in backup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Invalid chunk received for ATXDataStoreBackup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error restoring to file %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "More than one ATXDataStore found in backup", buf, 2u);
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error retrieving action just added: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a2, a3, "Exception deserializing slots for %@: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error obtaining slotset UUID for action row: %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35___ATXDataStore_actionForSlotUUID___block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error retrieving action for slot UUID:%@ error:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error fetching action and slots from db for row identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error deleting slotSetKey data for bundleId: %@ error:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Exception deserializing slots: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_504_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with alog: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with afeedback: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with slotSetKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error collating data while clearing actions without title: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_520_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data while clearing actions without title: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __34___ATXDataStore_runMigrationPlan___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error creating table: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error updating schema: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error iterating through bundles in app table: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error wiping subsequent launch counts (migration_RemoveAllSubsequentLaunches: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with deprecated histogram _APRHistogramTypeAppIntentDonation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with deprecated histograms: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35___ATXDataStore_allActionsAndSlots__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error all actions and slots from db: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "Failed to insert slotSetKey UUID: %@ alogId: %@ with error: %@", v7, 0x20u);

}

void __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Failed to update action id: %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Database migration Failure: Failed to add install date for new Crystal apps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_694_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Database migration Failure: Failed to add install date for new Crystal app (Calculator for iPad)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_FAULT, "ATXDataStore: Updating install date failed for bundle id: %@ error: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "_ATXDataStore failed to enumerateActionTypesOlderThan", v1, 2u);
}

@end
