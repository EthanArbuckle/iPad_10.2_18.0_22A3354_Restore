@implementation ATXGlobalAppScorePredictor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_37 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_37, &__block_literal_global_195);
  return (id)sharedInstance__pasExprOnceResult_48;
}

void __44__ATXGlobalAppScorePredictor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_48;
  sharedInstance__pasExprOnceResult_48 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXGlobalAppScorePredictor)init
{
  ATXGlobalAppScorePredictor *v2;
  uint64_t v3;
  _PASCFBurstTrie *index;
  uint64_t v5;
  _PASCFBurstTrie *signalsTrie;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXGlobalAppScorePredictor;
  v2 = -[ATXGlobalAppScorePredictor init](&v8, sel_init);
  if (v2)
  {
    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalAppSignalsIndex"));
    v3 = objc_claimAutoreleasedReturnValue();
    index = v2->_index;
    v2->_index = (_PASCFBurstTrie *)v3;

    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalAppSignalsHistogram"));
    v5 = objc_claimAutoreleasedReturnValue();
    signalsTrie = v2->_signalsTrie;
    v2->_signalsTrie = (_PASCFBurstTrie *)v5;

  }
  return v2;
}

- (id)globalPopularityPredictor
{
  return +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:](ATXGlobalAppScoresUtil, "loadCoreMLModelWithName:", CFSTR("ATXGlobalAppSignals"));
}

- (id)globalPopularitiesAtTimeOfDay:(int)a3 atDayOfWeek:(int)a4 atLocation:(int)a5 withLastAppLaunched:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  _PASCFBurstTrie *index;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  _QWORD v47[5];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v47[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[ATXGlobalAppScorePredictor globalPopularityPredictor](self, "globalPopularityPredictor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (index = self->_index) != 0)
  {
    v13 = -[_PASCFBurstTrie payloadForString:](index, "payloadForString:", v10);
    v46[0] = CFSTR("TimeOfDay");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v14;
    v46[1] = CFSTR("DayOfWeek");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v15;
    v46[2] = CFSTR("Location");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v16;
    v46[3] = CFSTR("LastApp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __103__ATXGlobalAppScorePredictor_globalPopularitiesAtTimeOfDay_atDayOfWeek_atLocation_withLastAppLaunched___block_invoke;
    v44[3] = &unk_1E82E8558;
    v20 = v19;
    v45 = v20;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v44);
    v43 = 0;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v20, &v43);
    v22 = v43;
    if (v22)
    {
      __atxlog_handle_app_prediction();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ATXGlobalAppScorePredictor globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:].cold.2((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);

    }
    v42 = v22;
    objc_msgSend(v11, "predictionFromFeatures:error:", v21, &v42);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v42;

    if (v31)
    {
      __atxlog_handle_app_prediction();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[ATXGlobalAppScorePredictor globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:].cold.1((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);

    }
    objc_msgSend(v30, "featureValueForName:", CFSTR("output"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "multiArrayValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

void __103__ATXGlobalAppScorePredictor_globalPopularitiesAtTimeOfDay_atDayOfWeek_atLocation_withLastAppLaunched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0C9E970];
  v6 = a3;
  v7 = a2;
  v10 = 0;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithShape:dataType:error:", &unk_1E83D0550, 65600, &v10);
  v9 = v10;
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v6, 0);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);
}

- (id)globalPopularityForBundleIdsGivenTimeDayLocationAndLastApp:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "locationMotionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentLOI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "type");
  else
    v10 = -1;
  objc_msgSend(v6, "userContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastAppLaunch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXGlobalAppScorePredictor globalPopularityForBundleIds:atDate:atLocation:withLastAppLaunched:](self, "globalPopularityForBundleIds:atDate:atLocation:withLastAppLaunched:", v7, v14, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)globalPopularityForBundleIds:(id)a3 atDate:(id)a4 atLocation:(int64_t)a5 withLastAppLaunched:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = +[ATXGlobalAppScoresUtil locationTypeIndexFromRTLocationOfInterestType:](ATXGlobalAppScoresUtil, "locationTypeIndexFromRTLocationOfInterestType:", a5);
  v14 = +[ATXGlobalAppScoresUtil timeOfDayIndexFromDate:](ATXGlobalAppScoresUtil, "timeOfDayIndexFromDate:", v11);
  v15 = +[ATXGlobalAppScoresUtil dayOfWeekIndexFromDate:](ATXGlobalAppScoresUtil, "dayOfWeekIndexFromDate:", v11);

  -[ATXGlobalAppScorePredictor globalPopularitiesForBundleIds:atTimeOfDayIndex:atDayOfWeekIndex:atLocationIndex:withLastAppLaunched:](self, "globalPopularitiesForBundleIds:atTimeOfDayIndex:atDayOfWeekIndex:atLocationIndex:withLastAppLaunched:", v12, v14, v15, v13, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6 withLastAppLaunched:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  SEL v36;
  __CFString *v37;
  id v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = &stru_1E82FDC98;
  if (a7)
    v14 = (__CFString *)a7;
  v15 = v14;
  -[ATXGlobalAppScorePredictor globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:](self, "globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:", v10, v9, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    v38 = v13;
    v39 = (void *)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v13;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v37 = v15;
    if (v20)
    {
      v21 = v20;
      v36 = a2;
      v22 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v25 = (int)-[_PASCFBurstTrie payloadForString:](self->_index, "payloadForString:", v24);
          if (objc_msgSend(v17, "count") <= v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, CFSTR("ATXGlobalAppScorePredictor.m"), 157, CFSTR("ATXGlobalSignals: BundleId index %d exceeded the output layer size %lu"), v25, objc_msgSend(v17, "count"));

          }
          if ((int)v25 < 1)
          {
            objc_msgSend(v39, "addObject:", v24);
          }
          else
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v24);
            if (objc_msgSend(v18, "compare:", v26) == 1)
            {
              v27 = v26;

              v18 = v27;
            }

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v21);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = v39;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    v13 = v38;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v31);
    }

    +[ATXGlobalAppScoresUtil normalizeValues:](ATXGlobalAppScoresUtil, "normalizeValues:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v37;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)globalPopularityForBundleIdsGivenTimeDayAndLocation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "locationMotionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentLOI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "type");
  else
    v10 = -1;
  objc_msgSend(v6, "timeContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXGlobalAppScorePredictor globalPopularitiesForBundleIds:atTimeOfDayIndex:atDayOfWeekIndex:atLocationIndex:](self, "globalPopularitiesForBundleIds:atTimeOfDayIndex:atDayOfWeekIndex:atLocationIndex:", v7, +[ATXGlobalAppScoresUtil timeOfDayIndexFromDate:](ATXGlobalAppScoresUtil, "timeOfDayIndexFromDate:", v12), +[ATXGlobalAppScoresUtil dayOfWeekIndexFromDate:](ATXGlobalAppScoresUtil, "dayOfWeekIndexFromDate:", v12), +[ATXGlobalAppScoresUtil locationTypeIndexFromRTLocationOfInterestType:](ATXGlobalAppScoresUtil, "locationTypeIndexFromRTLocationOfInterestType:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (self->_signalsTrie)
  {
    v10 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          +[ATXGlobalAppScoresUtil getContextKeyForTimeOfDayIndex:dayOfWeekIndex:locationIndex:bundleIdIndex:](ATXGlobalAppScoresUtil, "getContextKeyForTimeOfDayIndex:dayOfWeekIndex:locationIndex:bundleIdIndex:", v7, v6, a6, -[_PASCFBurstTrie payloadForString:](self->_index, "payloadForString:", v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)-[_PASCFBurstTrie payloadForString:](self->_signalsTrie, "payloadForString:", v16)/ 100000.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    +[ATXGlobalAppScoresUtil normalizeValues:](ATXGlobalAppScoresUtil, "normalizeValues:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalsTrie, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

- (void)globalPopularitiesAtTimeOfDay:(uint64_t)a3 atDayOfWeek:(uint64_t)a4 atLocation:(uint64_t)a5 withLastAppLaunched:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXGlobalSignals - Error during inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
}

- (void)globalPopularitiesAtTimeOfDay:(uint64_t)a3 atDayOfWeek:(uint64_t)a4 atLocation:(uint64_t)a5 withLastAppLaunched:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXGlobalSignals - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
}

@end
