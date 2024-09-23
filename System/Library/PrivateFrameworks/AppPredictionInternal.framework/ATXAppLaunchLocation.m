@implementation ATXAppLaunchLocation

void __51___ATXAppLaunchLocation_resetAppIntentLocationData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  v10 = a2;
  v2 = objc_opt_new();
  v3 = (void *)v10[3];
  v10[3] = v2;

  v4 = objc_opt_new();
  v5 = (void *)v10[4];
  v10[4] = v4;

  v6 = objc_opt_new();
  v7 = (void *)v10[5];
  v10[5] = v6;

  v8 = objc_opt_new();
  v9 = (void *)v10[7];
  v10[7] = v8;

  objc_msgSend((id)objc_opt_class(), "writeModel:", v10);
}

void __57___ATXAppLaunchLocation_launchProbabilityAtLOI_bundleId___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)a2[2];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (double)(int)objc_msgSend(v8, "intValue");

  v9 = (void *)v5[6];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (double)(int)objc_msgSend(v10, "intValue");

}

void __51___ATXAppLaunchLocation_launchCountAtLOI_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a2 + 16);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "intValue");

}

void __58___ATXAppLaunchLocation_launchProbabilityAtLOI_appIntent___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)a2[3];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (double)(int)objc_msgSend(v8, "intValue");

  v9 = (void *)v5[7];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (double)(int)objc_msgSend(v10, "intValue");

}

void __73___ATXAppLaunchLocation_launchProbabilityAtLOI_appForAllIntentsBundleId___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)a2[5];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (double)(int)objc_msgSend(v8, "intValue");

  v9 = (void *)v5[7];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (double)(int)objc_msgSend(v10, "intValue");

}

void __43___ATXAppLaunchLocation_trainWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  id v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_trainModelWithLOI:startDate:", v5, v7);
  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43___ATXAppLaunchLocation_trainWithCallback___block_invoke_cold_1();
  }

  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v13 = 136446210;
    v14 = "_ATXAppLaunchLocation";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v9, OS_SIGNPOST_INTERVAL_END, v10, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v13, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(void))(v11 + 16))();
  v12 = (id)objc_opt_self();

}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
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
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = v20;
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);

    }
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v5);

  }
}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("_ATXAppLaunchLocation.m"), 218, CFSTR("Expected ATXIntentEvent class"));

  }
  v7 = *(void **)(a1 + 40);
  v41 = v5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v6);

  }
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, v6);

  }
  v14 = (void *)MEMORY[0x1E0CF8C20];
  objc_msgSend(v41, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "intentType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getActionKeyForBundleId:actionType:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v20, "integerValue") + 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v17);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "intentType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v26, "integerValue") + 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "intentType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v29);

  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bundleId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v36);
  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue") + 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v39, v6);

}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_3(id *a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 2, a1[4]);
  v4 = a2;
  objc_storeStrong(v4 + 3, a1[5]);
  objc_storeStrong(v4 + 4, a1[6]);
  objc_storeStrong(v4 + 5, a1[7]);
  objc_storeStrong(v4 + 6, a1[8]);
  objc_storeStrong(v4 + 7, a1[9]);
  objc_msgSend((id)objc_opt_class(), "writeModel:", v4);

}

uint64_t __43___ATXAppLaunchLocation_sortTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = a2;
  if (!v3[1])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = (void *)MEMORY[0x1E0D81590];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_2;
    v7[3] = &unk_1E82E1CC0;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "registerForLockStateChangeNotifications:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v3[1];
    v3[1] = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  if (a2 == 3 || !a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      __atxlog_handle_default();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "Model data unlocked! Loading...", v5, 2u);
      }

      objc_msgSend(WeakRetained[3], "runWithLockAcquired:", &__block_literal_global_67_0);
      objc_msgSend(WeakRetained, "loadModelAtPath:", *(_QWORD *)(a1 + 32));
    }

  }
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_66(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D81590];
  v4 = a2[1];
  v5 = a2;
  objc_msgSend(v3, "unregisterForLockStateChangeNotifications:", v4);
  v6 = (id)a2[1];
  a2[1] = 0;

}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_75(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appLaunchCountMapKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("appIntentLaunchCountMapKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[3];
  v4[3] = v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("intentLaunchCountMapKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[4];
  v4[4] = v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("appForAllIntentsLaunchCountMapKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[5];
  v4[5] = v11;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("totalLaunchCountMapKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v4[6];
  v4[6] = v13;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("totalIntentLaunchCountMapKey"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (id)v4[7];
  v4[7] = v15;

}

void __43___ATXAppLaunchLocation_trainWithCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error fetching locations: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
