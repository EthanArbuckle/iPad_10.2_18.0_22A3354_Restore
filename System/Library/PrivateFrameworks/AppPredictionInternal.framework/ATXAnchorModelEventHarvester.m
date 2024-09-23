@implementation ATXAnchorModelEventHarvester

- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7 predicates:(id)a8
{
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = (double)-a6;
  v12 = a8;
  v13 = a3;
  objc_msgSend(v13, "dateByAddingTimeInterval:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", (double)a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v14, v15, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count") <= a5)
    a5 = objc_msgSend(v17, "count");
  objc_msgSend(v17, "subarrayWithRange:", 0, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6
{
  return -[ATXAnchorModelEventHarvester fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:](self, "fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:", a3, a4, a5, a6, &__block_literal_global_30);
}

uint64_t __132__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor___block_invoke()
{
  return 1;
}

- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v11 = a3;
  v12 = a7;
  v13 = a4;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v11, "dateByAddingTimeInterval:", (double)-a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", (double)a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke;
  v33[3] = &unk_1E82DCE00;
  v34 = v15;
  v35 = v16;
  v36 = v12;
  v18 = v12;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v13, "filterWithIsIncluded:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2;
  v30[3] = &unk_1E82DCE28;
  v31 = v14;
  v32 = v11;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_10;
  v28[3] = &unk_1E82DB0C8;
  v22 = v31;
  v29 = v22;
  v23 = v11;
  v24 = (id)objc_msgSend(v21, "sinkWithCompletion:receiveInput:", v30, v28);

  v25 = v29;
  v26 = v22;

  return v26;
}

uint64_t __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  if (v5 >= v6
    && (objc_msgSend(v3, "timestamp"),
        v8 = v7,
        objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate"),
        v8 <= v9))
  {
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events after anchor on %@", (uint8_t *)&v9, 0x16u);

  }
}

uint64_t __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)fetchAppLaunchEventsAfterAnchorOccurrenceDate:(id)a3 limit:(unint64_t)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  unint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v11 = a7;
  v12 = a3;
  objc_msgSend(v12, "dateByAddingTimeInterval:", (double)-a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", (double)a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke;
  v28[3] = &unk_1E82DCE50;
  v29 = v11;
  v16 = v11;
  +[ATXAppLaunchDuetDataProvider biomePublisher:andEndDate:isIncluded:](ATXAppLaunchDuetDataProvider, "biomePublisher:andEndDate:isIncluded:", v13, v14, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2;
  v26[3] = &unk_1E82DCE78;
  v27 = (id)objc_opt_new();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_14;
  v23[3] = &unk_1E82DCEA0;
  v18 = v27;
  v24 = v18;
  v25 = a4;
  v19 = (id)objc_msgSend(v17, "sinkWithCompletion:shouldContinue:", v26, v23);
  v20 = v24;
  v21 = v18;

  return v21;
}

uint64_t __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events", (uint8_t *)&v8, 0xCu);

  }
}

BOOL __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 < v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4 < v5;
}

+ (id)negativeAppsGivenAllAppIds:(id)a3 positiveAppIds:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "minusSet:", v5);

  return v6;
}

- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "idsFromDuetEvents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:](self, "negativeActionsOnAnchorOccurrenceDate:positiveActionIds:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)idsFromDuetEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v6;
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)idsFromBiomeEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C]();
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "timestamp");
        v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%f"), v13);
        objc_msgSend(v4, "addObject:", v14);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (id)deduplicatedActionEventsByIdFromActionEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1CAA48B6C](v7);
        objc_msgSend(v11, "identifier", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

          objc_msgSend(v4, "addObject:", v11);
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v7;
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionIds:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;

  v5 = a3;
  v6 = a4;
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction");
  v9 = v8;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appIntentDuetEventsForActionsBetweenStartDate:endDate:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:].cold.2(v12, v13, v9);

  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "containsObject:", v17);

      if ((v18 & 1) == 0)
        objc_msgSend(v14, "addIndex:", v15);

      ++v15;
    }
    while (objc_msgSend(v12, "count") > v15);
  }
  objc_msgSend(v12, "objectsAtIndexes:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:].cold.1(v19, v20);

  return v19;
}

+ (id)randomSampleFromArray:(id)a3 sampleSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") <= a4)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

void __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for after the anchor event on date %@: %@", (uint8_t *)&v6, 0x16u);

}

void __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)negativeActionsOnAnchorOccurrenceDate:(void *)a1 positiveActionIds:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Producing negative samples: %lu negative actions remain after filtering out positive actions.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)negativeActionsOnAnchorOccurrenceDate:(double)a3 positiveActionIds:.cold.2(void *a1, NSObject *a2, double a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = a3;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Producing negative samples: fetched %lu actions that were received in the last %.2f seconds.", (uint8_t *)&v5, 0x16u);
}

@end
