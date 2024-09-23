@implementation ATXModeInferredDurationAndCountProvider

- (ATXModeInferredDurationAndCountProvider)initWithLastNDays:(unint64_t)a3
{
  ATXModeInferredDurationAndCountProvider *v4;
  uint64_t v5;
  NSDate *thresholdDateLastNDays;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXModeInferredDurationAndCountProvider;
  v4 = -[ATXModeInferredDurationAndCountProvider init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a3));
    v5 = objc_claimAutoreleasedReturnValue();
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;

  }
  return v4;
}

- (void)cacheInferredModeStreamIfNecessary
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeInferredDurationAndCountProvider: Could not fetch inferred mode stream with error: %@", (uint8_t *)&v3, 0xCu);
}

void __77__ATXModeInferredDurationAndCountProvider_cacheInferredModeStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      if (objc_msgSend(v6, "isStart"))
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v8 = v7 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v9 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          objc_msgSend(v9, "numberWithDouble:", v8 + v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "absoluteTimestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v18 = v17;
          v19 = *(double *)(a1 + 96);

          if (v18 > v19)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "absoluteTimestamp");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "timeIntervalSinceReferenceDate");
            v22 = v21 - *(double *)(a1 + 96);

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            if (v8 >= v22)
              v26 = v22;
            else
              v26 = v8;
            objc_msgSend(v23, "numberWithDouble:", v26 + v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v27, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          }
        }
      }
    }
  }
}

void __77__ATXModeInferredDurationAndCountProvider_cacheInferredModeStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;

  v33 = a2;
  objc_msgSend(v33, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3);
  if (objc_msgSend(v3, "modeType") == 2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXActivityTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(v33, "timestamp");
    v7 = v6;
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqualToString:", v5);
    v10 = objc_msgSend(v3, "isStart");
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        v11 = v7 - v8;
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v12, "numberWithDouble:", v11 + v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        objc_msgSend(v33, "timestamp");
        if (v19 > *(double *)(a1 + 88))
        {
          objc_msgSend(v33, "timestamp");
          v21 = v20 - *(double *)(a1 + 88);
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          if (v11 >= v21)
            v25 = v21;
          else
            v25 = v11;
          objc_msgSend(v22, "numberWithDouble:", v25 + v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "intValue") + 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        }
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = 0;

      }
      goto LABEL_15;
    }
  }
  else
  {
    v10 = objc_msgSend(v3, "isStart");
  }
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
    objc_msgSend(v33, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v32;
  }
LABEL_15:

}

- (double)modeInferredDurationInLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[ATXModeInferredDurationAndCountProvider cacheInferredModeStreamIfNecessary](self, "cacheInferredModeStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_inferredModeDurationSumLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)modeInferredDurationInLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[ATXModeInferredDurationAndCountProvider cacheInferredModeStreamIfNecessary](self, "cacheInferredModeStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_inferredModeDurationSumLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (unint64_t)modeInferredCountInLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXModeInferredDurationAndCountProvider cacheInferredModeStreamIfNecessary](self, "cacheInferredModeStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_inferredModeCounterLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)modeInferredCountInLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXModeInferredDurationAndCountProvider cacheInferredModeStreamIfNecessary](self, "cacheInferredModeStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_inferredModeCounterLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredModeCounterLast1Day, 0);
  objc_storeStrong((id *)&self->_inferredModeCounterLastNDays, 0);
  objc_storeStrong((id *)&self->_inferredModeDurationSumLast1Day, 0);
  objc_storeStrong((id *)&self->_inferredModeDurationSumLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end
