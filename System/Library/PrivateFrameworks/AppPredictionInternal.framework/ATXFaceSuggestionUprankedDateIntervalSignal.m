@implementation ATXFaceSuggestionUprankedDateIntervalSignal

- (ATXFaceSuggestionUprankedDateIntervalSignal)initWithParameters:(id)a3
{
  id v4;
  ATXFaceSuggestionUprankedDateIntervalSignal *v5;
  uint64_t v6;
  NSDictionary *uprankedDateIntervals;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionUprankedDateIntervalSignal;
  v5 = -[ATXFaceSuggestionUprankedDateIntervalSignal init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "uprankedDateIntervals");
    v6 = objc_claimAutoreleasedReturnValue();
    uprankedDateIntervals = v5->_uprankedDateIntervals;
    v5->_uprankedDateIntervals = (NSDictionary *)v6;

  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *uprankedDateIntervals;
  void *v7;
  NSObject *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  uprankedDateIntervals = self->_uprankedDateIntervals;
  if (uprankedDateIntervals)
  {
    objc_msgSend(v4, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](uprankedDateIntervals, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = 0.0;
    if (v8)
    {
      v10 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__ATXFaceSuggestionUprankedDateIntervalSignal_valueForDescriptor___block_invoke;
      v16[3] = &unk_1E82E3858;
      v11 = v10;
      v17 = v11;
      -[NSObject bs_firstObjectPassingTest:](v8, "bs_firstObjectPassingTest:", v16);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        __atxlog_handle_lock_screen();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "-[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:]";
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v5;
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "%s: descriptor has valid interval: %@, %@", buf, 0x20u);
        }

        v9 = 1.0;
      }
      else
      {

      }
    }
  }
  else
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:].cold.1(v8);
  }

  return v9;
}

uint64_t __66__ATXFaceSuggestionUprankedDateIntervalSignal_valueForDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsDate:", *(_QWORD *)(a1 + 32));
}

- (double)weight
{
  return 30.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uprankedDateIntervals, 0);
}

- (void)valueForDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: no upranked date intervals found", (uint8_t *)&v1, 0xCu);
}

@end
