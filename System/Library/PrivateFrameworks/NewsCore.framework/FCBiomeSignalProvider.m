@implementation FCBiomeSignalProvider

+ (void)fetchSignalsFromBiomeWithSafariBlockoutDuration:(double)a3 maxExternalSignalEventCount:(int64_t)a4 resultsBlock:(id)a5
{
  void (**v7)(_QWORD, void *, void *);
  void (**v8)(_QWORD, void *, void *);
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
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, void *, void *);
  _QWORD v35[4];
  id v36;
  id v37;
  double v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[6];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD, void *, void *))a5;
  v8 = v7;
  if (a4 <= 0)
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke;
    v42[3] = &unk_1E464A708;
    v42[4] = v7;
    v42[5] = a4;
    __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke((uint64_t)v42);
  }
  else
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "resultsBlock");
      *(_DWORD *)buf = 136315906;
      v44 = "+[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBlock:]";
      v45 = 2080;
      v46 = "FCBiomeSignalProvider.m";
      v47 = 1024;
      v48 = 32;
      v49 = 2114;
      v50 = v31;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v34 = v8;
    v9 = FCBiomeLog;
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v44 = (const char *)a4;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Querying Biome for Safari and App Signals with maxExternalSignalEventCount %ld", buf, 0xCu);
    }
    BiomeLibrary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "App");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "InFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "App");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "WebUsage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, a4, 0);
    v33 = v12;
    objc_msgSend(v12, "publisherWithUseCase:options:", CFSTR("AutoFavorites"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    objc_msgSend(v18, "reduceWithInitial:nextPartialResult:", v19, &__block_literal_global_71_0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_75;
    v39[3] = &unk_1E463C380;
    v22 = v15;
    v40 = v22;
    v41 = &__block_literal_global_177;
    v23 = (id)objc_msgSend(v20, "sinkWithCompletion:receiveInput:", &__block_literal_global_74_0, v39);

    objc_msgSend(v32, "publisherWithUseCase:options:", CFSTR("AutoFavorites"), v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_new();
    objc_msgSend(v24, "reduceWithInitial:nextPartialResult:", v25, &__block_literal_global_78_0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v21;
    v35[1] = 3221225472;
    v35[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_80;
    v35[3] = &unk_1E464A7D8;
    v27 = v16;
    v36 = v27;
    v37 = &__block_literal_global_177;
    v38 = a3;
    v28 = (id)objc_msgSend(v26, "sinkWithCompletion:receiveInput:", &__block_literal_global_79_2, v35);

    v8 = v34;
    if (v34)
    {
      v29 = (void *)objc_msgSend(v22, "copy");
      v30 = (void *)objc_msgSend(v27, "copy");
      v34[2](v34, v29, v30);

    }
  }

}

uint64_t __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCBiomeLog;
  if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "See maxExternalSignalEventCount specified as %ld, skipping query for external signals", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  return result;
}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_9_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_65_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = FCBiomeLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v11 = 134217984;
      v12 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Got back %lu results from Biome", (uint8_t *)&v11, 0xCu);

    }
    v9 = v6;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = (uint64_t)v2;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Didn't get an array back from Biome, instead got %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

BOOL __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6DC310))
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Got back an array from Biome that had an object that didn't conform to FCPersonalizationExternalSignal : %@"), v3);
    *(_DWORD *)buf = 136315906;
    v9 = "+[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBloc"
         "k:]_block_invoke_2";
    v10 = 2080;
    v11 = "FCBiomeSignalProvider.m";
    v12 = 1024;
    v13 = 56;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v5 != 0;
}

uint64_t __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_msgSend(a3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_72(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCBiomeLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Encountered an error getting appsStream. Error=%{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "AppsStream completed with no error.", (uint8_t *)&v8, 2u);
  }

}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_75(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_77(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_msgSend(a3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCBiomeLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Encountered an error getting WebUsageStream. Error=%{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "WebUsageStream completed with no error.", (uint8_t *)&v8, 2u);
  }

}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_81;
  v20[3] = &unk_1E464A7D8;
  v5 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v6 = v3;
  v21 = v6;
  v23 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "fc_array:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "BOOLForKey:", CFSTR("personalization_disregard_time_for_suggestions"));

  v9 = (void *)FCBiomeLog;
  v10 = os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v5)
  {
    if (v10)
    {
      v11 = v9;
      objc_opt_class();
      if (v6)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v6;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v14 = v12;
      v15 = objc_msgSend(v14, "count");
      v16 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218240;
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      v17 = "Asked to disregard time for Safari results, Raw results count %lu and final results count %lu";
LABEL_16:
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

    }
  }
  else if (v10)
  {
    v11 = v9;
    objc_opt_class();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v6;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;
    v18 = objc_msgSend(v14, "count");
    v19 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218240;
    v25 = v18;
    v26 = 2048;
    v27 = v19;
    v17 = "Raw Safari results pruned from %lu to %lu after applying blackout duration";
    goto LABEL_16;
  }

}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_81(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v9 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("personalization_disregard_time_for_suggestions"));

  if (v5)
  {
    objc_msgSend(v9, "addObjectsFromArray:", v3);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v7 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3_84;
    v10[3] = &unk_1E464A7B0;
    v11 = v6;
    v13 = v7;
    v12 = v9;
    v8 = v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);

  }
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3_84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPersonalizationURLMapping domainForURL:](FCPersonalizationURLMapping, "domainForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(v3, "date"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "timeIntervalSinceDate:", v7),
          v9 = v8,
          v10 = *(double *)(a1 + 48),
          v7,
          v9 >= v10))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v3, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fc_safelySetObject:forKey:", v12, v5);

      objc_msgSend(*(id *)(a1 + 40), "fc_safelyAddObject:", v3);
    }
  }
  else
  {
    v13 = (void *)FCProgressivePersonalizationLog;
    if (!os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = v13;
    objc_msgSend(v3, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "Encountered signal resulting in a nil-domain: %{public}@", (uint8_t *)&v16, 0xCu);

  }
LABEL_7:

}

@end
