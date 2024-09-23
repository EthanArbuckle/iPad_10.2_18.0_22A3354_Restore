@implementation ATXModeSetupPredictionTrainer

- (ATXModeSetupPredictionTrainer)init
{
  void *v3;
  ATXModeSetupPredictionTrainer *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "modeCachesRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXModeSetupPredictionTrainer initWithCacheBasePath:](self, "initWithCacheBasePath:", v3);

  return v4;
}

- (ATXModeSetupPredictionTrainer)initWithCacheBasePath:(id)a3
{
  id v4;
  ATXModeSetupPredictionTrainer *v5;
  uint64_t v6;
  NSString *cacheBasePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeSetupPredictionTrainer;
  v5 = -[ATXModeSetupPredictionTrainer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cacheBasePath = v5->_cacheBasePath;
    v5->_cacheBasePath = (NSString *)v6;

  }
  return v5;
}

- (void)train
{
  -[ATXModeSetupPredictionTrainer trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldSkipEligiblilityCheckForSetupPrediction:](self, "trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldSkipEligiblilityCheckForSetupPrediction:", 0, 0, 1);
}

- (void)trainWithXPCActivity:(id)a3
{
  -[ATXModeSetupPredictionTrainer trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldSkipEligiblilityCheckForSetupPrediction:](self, "trainWithXPCActivity:shouldSkipRetrainingIfTrainedRecently:shouldSkipEligiblilityCheckForSetupPrediction:", a3, 1, 0);
}

- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldSkipEligiblilityCheckForSetupPrediction:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  double v24;
  ATXModeSetupPredictionModel *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  double v30;
  __int128 v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  double v41;
  uint64_t v42;

  v5 = a5;
  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (v6)
  {
    -[ATXModeSetupPredictionTrainer pathForModeSetupPredictionCacheWithDirectory:](self, "pathForModeSetupPredictionCacheWithDirectory:", CFSTR("modeSetupPredictions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF94D8], "modificationDateOfFileAtPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;

    if (v11 < 0.0 && v11 > -21600.0)
    {
      __atxlog_handle_modes();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v41 = -v11;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping inference because this was done recently. Cache age: %.2f", buf, 0xCu);
      }

      goto LABEL_30;
    }

  }
  __atxlog_handle_modes();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Started running Mode Setup Prediction inference...", buf, 2u);
  }

  v33 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  allModesForModeSetupPrediction();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v14)
    goto LABEL_24;
  v16 = v14;
  v17 = *(_QWORD *)v36;
  *(_QWORD *)&v15 = 138412290;
  v31 = v15;
  while (2)
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v36 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1CAA48B6C]();
      v21 = objc_msgSend(v19, "unsignedIntegerValue");
      if (v5)
      {
        self->_modeIsEligibleForSetupPrediction = 1;
      }
      else
      {
        v22 = -[ATXModeSetupPredictionTrainer modeIsEligibleForSetupPrediction:](self, "modeIsEligibleForSetupPrediction:", v21);
        self->_modeIsEligibleForSetupPrediction = v22;
        if (!v22)
          goto LABEL_21;
      }
      __atxlog_handle_modes();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        ATXModeToString();
        v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = v31;
        v41 = v24;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Running Mode Prediction inference for Mode %@...", buf, 0xCu);

      }
      v25 = -[ATXModeSetupPredictionModel initWithMode:]([ATXModeSetupPredictionModel alloc], "initWithMode:", v21);
      -[ATXModeSetupPredictionModel probabilityScore](v25, "probabilityScore");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ATXModeToString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v26, v27);

LABEL_21:
      if (objc_msgSend(v34, "didDefer", v31))
      {
        __atxlog_handle_modes();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          ATXModeToString();
          v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = v31;
          v41 = v30;
          _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Finished making inference for mode %@, but deferring further inference for remaining modes because XPC activity asked for deferral.", buf, 0xCu);

        }
        v8 = v33;
        -[ATXModeSetupPredictionTrainer persistPredictionScores:](self, "persistPredictionScores:", v33);
        objc_autoreleasePoolPop(v20);

        goto LABEL_30;
      }
      objc_autoreleasePoolPop(v20);
      ++v18;
    }
    while (v16 != v18);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
      continue;
    break;
  }
LABEL_24:

  __atxlog_handle_modes();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Finished running Mode Setup Prediction inference.", buf, 2u);
  }

  v8 = v33;
  -[ATXModeSetupPredictionTrainer persistPredictionScores:](self, "persistPredictionScores:", v33);
LABEL_30:

}

- (BOOL)trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionTrainer pathForModeEntityTypeIdentifier:modeIdentifier:](self, "pathForModeEntityTypeIdentifier:modeIdentifier:", CFSTR("apps"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF94D8], "modificationDateOfFileAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

  v9 = v8 > -604800.0 && v8 < 0.0;
  if (!v9)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      ATXModeToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping Mode Setup Prediction inference because the Mode Affinity model for this mode: %@ has not been trained within the last 7 days", (uint8_t *)&v13, 0xCu);

    }
  }

  return v9;
}

- (BOOL)modeIsCurrentlyCreated:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllModeConfigurationsWithoutCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ATXModeSetupPredictionTrainer_modeIsCurrentlyCreated___block_invoke;
  v8[3] = &unk_1E82E7090;
  v6 = v4;
  v9 = v6;
  v10 = &v12;
  v11 = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

void __56__ATXModeSetupPredictionTrainer_modeIsCurrentlyCreated___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)a1[4];
  objc_msgSend(v6, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "atxModeForDNDSemanticType:", objc_msgSend(v8, "semanticType"));

  if (a1[6] == v9)
  {
    objc_msgSend(v6, "created");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      __atxlog_handle_modes();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        ATXModeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: Skipping Mode Setup Prediction inference because this Mode: %@ is currently created.", (uint8_t *)&v13, 0xCu);

      }
      *a4 = 1;
    }
  }

}

- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3
{
  return !-[ATXModeSetupPredictionTrainer modeIsCurrentlyCreated:](self, "modeIsCurrentlyCreated:")
      && -[ATXModeSetupPredictionTrainer trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:](self, "trainSetupPredictionIfModeAffinityWasTrainedRecentlyForMode:", a3);
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4
{
  NSString *cacheBasePath;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  cacheBasePath = self->_cacheBasePath;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@_%@"), v8, v7);

  -[NSString stringByAppendingPathComponent:](cacheBasePath, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pathForModeSetupPredictionCacheWithDirectory:(id)a3
{
  return -[NSString stringByAppendingPathComponent:](self->_cacheBasePath, "stringByAppendingPathComponent:", a3);
}

- (void)persistPredictionScores:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[16];
  id v29;
  id v30;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    -[ATXModeSetupPredictionTrainer pathForModeSetupPredictionCacheWithDirectory:](self, "pathForModeSetupPredictionCacheWithDirectory:", CFSTR("modeSetupPredictions"));
    v14 = objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v10 = objc_msgSend(v6, "writeToFile:options:error:", v14, 1073741825, &v29);
    v11 = v29;
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeSetupPredictionTrainer: SUCCESS - Finished writing mode setup probability scores.", v28, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      -[ATXModeSetupPredictionTrainer persistPredictionScores:].cold.2((uint64_t)v11, v13, v22, v23, v24, v25, v26, v27);
    }

  }
  else
  {
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXModeSetupPredictionTrainer persistPredictionScores:].cold.1((uint64_t)v8, v14, v16, v17, v18, v19, v20, v21);
  }

  objc_autoreleasePoolPop(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
}

- (void)persistPredictionScores:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "ATXModeSetupPredictionTrainer: FAILURE - Unable to archive mode setup probability scores with error: %@", a5, a6, a7, a8, 2u);
}

- (void)persistPredictionScores:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "ATXModeSetupPredictionTrainer: FAILURE - Unable to write mode setup probability scores with error: %@", a5, a6, a7, a8, 2u);
}

@end
