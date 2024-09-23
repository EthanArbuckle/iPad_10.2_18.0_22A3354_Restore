@implementation ATXTimelineRelevancePersonalizedConfig

- (ATXTimelineRelevancePersonalizedConfig)init
{
  ATXTimelineRelevancePersonalizedConfig *v2;
  ATXTimelineRelevancePersonalizedConfig *v3;
  uint64_t v4;
  NSDictionary *personalizedConfiguration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXTimelineRelevancePersonalizedConfig;
  v2 = -[ATXTimelineRelevancePersonalizedConfig init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ATXTimelineRelevancePersonalizedConfig _readPersonalizedConfiguration](v2, "_readPersonalizedConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
    personalizedConfiguration = v3->_personalizedConfiguration;
    v3->_personalizedConfiguration = (NSDictionary *)v4;

  }
  return v3;
}

- (ATXTimelineRelevancePersonalizedConfig)initWithPersonalizedConfiguration:(id)a3
{
  id v5;
  ATXTimelineRelevancePersonalizedConfig *v6;
  ATXTimelineRelevancePersonalizedConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimelineRelevancePersonalizedConfig;
  v6 = -[ATXTimelineRelevancePersonalizedConfig init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personalizedConfiguration, a3);

  return v7;
}

- (id)personalizedValueForParameter:(id)a3 forWidgetBundleIdentifier:(id)a4 kind:(id)a5
{
  id v8;
  NSDictionary *personalizedConfiguration;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  personalizedConfiguration = self->_personalizedConfiguration;
  v10 = a5;
  -[NSDictionary objectForKeyedSubscript:](personalizedConfiguration, "objectForKeyedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (v12 || (v13 = v11) != 0)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_readPersonalizedConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXTimelineRelevancePersonalizedConfig"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v17 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v2, 0, &v17);
  v5 = v17;
  if (v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = (void *)MEMORY[0x1CAA48B6C]();
    v16 = v5;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v4, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;

    objc_autoreleasePoolPop(v10);
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      __atxlog_handle_timeline();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXTimelineRelevancePersonalizedConfig _readPersonalizedConfiguration].cold.1((uint64_t)v2, (uint64_t)v12, v14);

    }
  }
  else
  {
    __atxlog_handle_timeline();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v2;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXTimelineRelevancePersonalizedConfig does not exist at path: %{public}@: %{public}@", buf, 0x16u);
    }
    v11 = 0;
    v12 = v5;
  }

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedConfiguration, 0);
}

- (void)_readPersonalizedConfiguration
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Failed to read personalized configuration at path: %{public}@. Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
