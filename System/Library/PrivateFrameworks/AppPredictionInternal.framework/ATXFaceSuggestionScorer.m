@implementation ATXFaceSuggestionScorer

- (ATXFaceSuggestionScorer)initWithParameters:(id)a3 descriptors:(id)a4
{
  id v7;
  id v8;
  ATXFaceSuggestionScorer *v9;
  ATXFaceSuggestionScorer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionScorer;
  v9 = -[ATXFaceSuggestionScorer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameters, a3);
    objc_storeStrong((id *)&v10->_descriptors, a4);
    -[ATXFaceSuggestionScorer _loadSignals](v10, "_loadSignals");
  }

  return v10;
}

- (NSSet)signals
{
  return (NSSet *)(id)-[NSSet copy](self->_signals, "copy");
}

- (double)featuredScoreForDescriptor:(id)a3
{
  double v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  NSSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  objc_class *v23;
  double v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = COERCE_DOUBLE(a3);
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  -[ATXFaceSuggestionScorer _mockScoreForDescriptor:](self, "_mockScoreForDescriptor:", *(_QWORD *)&v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    __atxlog_handle_lock_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "doubleValue");
      *(_DWORD *)buf = 136315650;
      v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
      v33 = 2048;
      v34 = v8;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: using mocked score of %f for descriptor %@", buf, 0x20u);
    }

    objc_msgSend(v6, "doubleValue");
    v10 = v9;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = self->_signals;
    v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v16, "weight");
          v18 = v17;
          objc_msgSend(v16, "valueForDescriptor:", *(_QWORD *)&v4);
          v20 = v19;
          v21 = v18 * v19;
          __atxlog_handle_lock_screen();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136316162;
            v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
            v33 = 2112;
            v34 = v24;
            v35 = 2048;
            v36 = v18;
            v37 = 2048;
            v38 = v20;
            v39 = 2048;
            v40 = v21;
            _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "%s: [%@] weight: %f, value: %f = product: %f", buf, 0x34u);

          }
          v10 = v10 + v21;
        }
        v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0.0;
    }

    __atxlog_handle_lock_screen();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
      v33 = 2048;
      v34 = v10;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "%s: score: %f", buf, 0x16u);
    }

    v6 = 0;
  }

  return v10;
}

- (void)_loadSignals
{
  ATXFaceSuggestionAppLaunchUniqueDaysSignal *v3;
  void *v4;
  void *v5;
  ATXFaceSuggestionUprankedDateIntervalSignal *v6;
  ATXFaceSuggestionGlobalPopularitySignal *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *signals;
  id v14;
  ATXFaceSuggestionAppLaunchSignal *v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionScorer _loadAppLaunchData](self, "_loadAppLaunchData");
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v15 = -[ATXFaceSuggestionAppLaunchSignal initWithAppLaunchDictionary:]([ATXFaceSuggestionAppLaunchSignal alloc], "initWithAppLaunchDictionary:", self->_appLaunchDictionary);
  v16[0] = v15;
  v3 = -[ATXFaceSuggestionAppLaunchUniqueDaysSignal initWithAppLaunchDictionary:]([ATXFaceSuggestionAppLaunchUniqueDaysSignal alloc], "initWithAppLaunchDictionary:", self->_appLaunchDictionary);
  v16[1] = v3;
  v4 = (void *)objc_opt_new();
  v16[2] = v4;
  v5 = (void *)objc_opt_new();
  v16[3] = v5;
  v6 = -[ATXFaceSuggestionUprankedDateIntervalSignal initWithParameters:]([ATXFaceSuggestionUprankedDateIntervalSignal alloc], "initWithParameters:", self->_parameters);
  v16[4] = v6;
  v7 = -[ATXFaceSuggestionGlobalPopularitySignal initWithParameters:]([ATXFaceSuggestionGlobalPopularitySignal alloc], "initWithParameters:", self->_parameters);
  v16[5] = v7;
  v8 = (void *)objc_opt_new();
  v16[6] = v8;
  v9 = (void *)objc_opt_new();
  v16[7] = v9;
  v10 = (void *)objc_opt_new();
  v16[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSSet *)objc_msgSend(v14, "initWithArray:", v11);
  signals = self->_signals;
  self->_signals = v12;

}

- (void)_loadAppLaunchData
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *appLaunchDictionary;
  id v6;

  -[NSSet _pas_mappedSetWithTransform:](self->_descriptors, "_pas_mappedSetWithTransform:", &__block_literal_global_207);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v6);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  appLaunchDictionary = self->_appLaunchDictionary;
  self->_appLaunchDictionary = v4;

}

uint64_t __45__ATXFaceSuggestionScorer__loadAppLaunchData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containerBundleIdentifier");
}

- (id)_mockScoreForDescriptor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "dictionaryForKey:", *MEMORY[0x1E0CF95D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@-%@"), v8, v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_appLaunchDictionary, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
