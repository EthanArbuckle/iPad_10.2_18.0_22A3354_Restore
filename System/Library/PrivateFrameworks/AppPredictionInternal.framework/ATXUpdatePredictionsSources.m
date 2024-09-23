@implementation ATXUpdatePredictionsSources

- (void)tryUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[ATXTimeBucketedRateLimiter tryToIncrementCountAndReturnSuccess](self->_rateLimiter, "tryToIncrementCountAndReturnSuccess");
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v9;
      v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsDefaultIntervalWithReason:]";
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ successful", (uint8_t *)&v14, 0x20u);

    }
    -[ATXUpdatePredictionsSources forwardUpdatePredictionsDefaultIntervalWithReason:](self, "forwardUpdatePredictionsDefaultIntervalWithReason:", a3);
  }
  else
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsDefaultIntervalWithReason:]";
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ rate limited", (uint8_t *)&v14, 0x20u);

    }
  }
}

- (ATXUpdatePredictionsSources)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXTimeBucketedRateLimiter *v8;
  ATXUpdatePredictionsSources *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11[0] = v3;
  v4 = (void *)objc_opt_new();
  v11[1] = v4;
  v5 = (void *)objc_opt_new();
  v11[2] = v5;
  v6 = (void *)objc_opt_new();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXTimeBucketedRateLimiter initWithMaxCount:perPeriod:]([ATXTimeBucketedRateLimiter alloc], "initWithMaxCount:perPeriod:", 2, 27000.0);
  v9 = -[ATXUpdatePredictionsSources initWithUpdateSources:rateLimiter:](self, "initWithUpdateSources:rateLimiter:", v7, v8);

  return v9;
}

- (ATXUpdatePredictionsSources)initWithUpdateSources:(id)a3 rateLimiter:(id)a4
{
  id v7;
  id v8;
  ATXUpdatePredictionsSources *v9;
  ATXUpdatePredictionsSources *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ATXUpdatePredictionsSources;
  v9 = -[ATXUpdatePredictionsSources init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updateSources, a3);
    objc_storeStrong((id *)&v10->_rateLimiter, a4);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setDelegate:", v10, (_QWORD)v17);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)tryUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[ATXTimeBucketedRateLimiter tryToIncrementCountAndReturnSuccess](self->_rateLimiter, "tryToIncrementCountAndReturnSuccess");
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v9;
      v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsImmediatelyWithReason:]";
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ successful", (uint8_t *)&v14, 0x20u);

    }
    -[ATXUpdatePredictionsSources forwardUpdatePredictionsImmediatelyWithReason:](self, "forwardUpdatePredictionsImmediatelyWithReason:", a3);
  }
  else
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsImmediatelyWithReason:]";
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ rate limited", (uint8_t *)&v14, 0x20u);

    }
  }
}

- (void)forceUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2080;
    v12 = "-[ATXUpdatePredictionsSources forceUpdatePredictionsImmediatelyWithReason:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "%@ - %s: forced prediction update with reason: %@", (uint8_t *)&v9, 0x20u);

  }
  -[ATXUpdatePredictionsSources forwardUpdatePredictionsImmediatelyWithReason:](self, "forwardUpdatePredictionsImmediatelyWithReason:", a3);
  -[ATXTimeBucketedRateLimiter tryToIncrementCountAndReturnSuccess](self->_rateLimiter, "tryToIncrementCountAndReturnSuccess");
}

- (void)forwardUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3
{
  ATXUpdatePredictionsDefaultInterval(a3);
}

- (void)forwardUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
  ATXUpdatePredictionsImmediatelyIfPossible(a3);
}

- (NSArray)updateSources
{
  return self->_updateSources;
}

- (void)setUpdateSources:(id)a3
{
  objc_storeStrong((id *)&self->_updateSources, a3);
}

- (ATXTimeBucketedRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_updateSources, 0);
}

@end
