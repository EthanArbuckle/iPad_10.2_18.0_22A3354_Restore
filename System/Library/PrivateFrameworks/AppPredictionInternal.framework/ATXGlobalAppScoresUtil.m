@implementation ATXGlobalAppScoresUtil

+ (int)locationTypeIndexFromRTLocationOfInterestType:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 3;
  else
    v3 = 1;
  if (a3)
    return v3;
  else
    return 2;
}

+ (int)dayOfWeekIndexFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 544, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "weekday");
  return (int)v4;
}

+ (int)timeOfDayIndexFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 544, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = (int)objc_msgSend(v6, "hour") / 4 + 1;
  return (int)v4;
}

+ (id)initializeTrieAtPath:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", a3, CFSTR("trie"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v3);
  }
  else
  {
    __atxlog_handle_app_prediction();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXGlobalAppScoresUtil initializeTrieAtPath:].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

+ (id)loadCoreMLModelWithName:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v3 = a3;
  if (!v3)
  {
    __atxlog_handle_app_prediction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:].cold.1(v4, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", v3, CFSTR("mlmodelc"), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_10:
    v8 = 0;
    v9 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setComputeUnits:", 0);
  v6 = (void *)MEMORY[0x1E0C9E940];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "modelWithContentsOfURL:configuration:error:", v7, v5, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v9)
  {
    __atxlog_handle_app_prediction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:].cold.2((uint64_t)v3, (uint64_t)v9, v10);

  }
LABEL_11:

  return v8;
}

+ (id)normalizeValues:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD v12[4];

  v3 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v12[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke;
  v11[3] = &unk_1E82E48E8;
  v11[4] = v12;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2;
  v8[3] = &unk_1E82E4910;
  v5 = v3;
  v9 = v5;
  v10 = v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  _Block_object_dispose(v12, 8);
  return v6;
}

double __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(a3, "doubleValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(a3, "doubleValue");
  v8 = v7 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = fabs(v8);
  if (v9 >= INFINITY && v9 <= INFINITY)
  {
    __atxlog_handle_app_prediction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

    v8 = 0.0;
  }
  objc_msgSend(v5, "numberWithDouble:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, v6);

}

+ (id)getContextKeyForTimeOfDayIndex:(int)a3 dayOfWeekIndex:(int)a4 locationIndex:(int)a5 bundleIdIndex:(int)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%01d%01d%01d%04d"), (a5 - 1), (a3 - 1), (a4 - 1), *(_QWORD *)&a6);
}

+ (void)initializeTrieAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppSignalsUtil: Could not locate the trie located at %@", (uint8_t *)&v1, 0xCu);
}

+ (void)loadCoreMLModelWithName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXGlobalAppSignalsUtil: Missing model name", a5, a6, a7, a8, 0);
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppSignalsUtil: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

void __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXGlobalAppScoresUtil: invalid normalized score", a5, a6, a7, a8, 0);
}

@end
