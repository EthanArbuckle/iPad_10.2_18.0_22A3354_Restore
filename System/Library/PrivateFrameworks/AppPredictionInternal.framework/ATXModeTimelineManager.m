@implementation ATXModeTimelineManager

- (id)_modeTimelineDataFrom:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UserFocus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "InferredMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_23;
  v18[3] = &unk_1E82DF748;
  v19 = v9;
  v14 = v9;
  v15 = (id)objc_msgSend(v13, "sinkWithCompletion:shouldContinue:", &__block_literal_global_240, v18);

  -[ATXModeTimelineManager _formatModeStream:](self, "_formatModeStream:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeTimeline:", v16);

  return v8;
}

void __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_cold_1(v2, v4);

  }
}

BOOL __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v4 <= 0x186A0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v4 < 0x186A1;
}

- (id)_formatModeStream:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_26_3);
}

id __44__ATXModeTimelineManager__formatModeStream___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v2, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "modeType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("mode"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("modeString"));
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "absoluteTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("startTimestamp"));

    objc_msgSend(v2, "origin");
    BMUserFocusInferredModeOriginToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("modeOrigin"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_1E82FDC98, CFSTR("contextVector"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("contextstored"), CFSTR("process"));

  }
  else
  {
    v5 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)modeFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeAppUsageManager: request mode timeline", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1CAA48B6C]();
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ATXModeTimelineManager _modeTimelineDataFrom:toDate:](self, "_modeTimelineDataFrom:toDate:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
      goto LABEL_9;
  }
  else
  {

    if (v6)
      goto LABEL_9;
  }

LABEL_9:
  objc_autoreleasePoolPop(v10);
  __atxlog_handle_modes();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "timeIntervalSinceNow");
    v18 = 134217984;
    v19 = -v16;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXModeAppUsageManager: request finished (%lf seconds)", (uint8_t *)&v18, 0xCu);
  }

  return v14;
}

void __55__ATXModeTimelineManager__modeTimelineDataFrom_toDate___block_invoke_cold_1(void *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeAppUsageManager: Error reading inferred mode stream: %@", (uint8_t *)&v4, 0xCu);

}

@end
