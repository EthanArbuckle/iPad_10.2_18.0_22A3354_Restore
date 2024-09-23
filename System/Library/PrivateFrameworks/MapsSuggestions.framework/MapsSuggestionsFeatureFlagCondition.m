@implementation MapsSuggestionsFeatureFlagCondition

- (MapsSuggestionsFeatureFlagCondition)initWithFeatureFlag:(id)a3
{
  id v5;
  void *v6;
  MapsSuggestionsFeatureFlagCondition *v7;
  MapsSuggestionsFeatureFlagCondition *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MapsSuggestionsFeatureFlagCondition_%@"), v5);
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsFeatureFlagCondition;
    v7 = -[MapsSuggestionsBaseCondition initWithName:](&v11, sel_initWithName_, v6);

    if (v7)
      objc_storeStrong((id *)&v7->_featureFlag, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFeatureFlagCondition.m";
      v14 = 1024;
      v15 = 53;
      v16 = 2082;
      v17 = "-[MapsSuggestionsFeatureFlagCondition initWithFeatureFlag:]";
      v18 = 2082;
      v19 = "nil == (featureFlag)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feature flag", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)isTrue
{
  int v3;
  NSObject *v4;
  NSString *featureFlag;
  int v7;
  NSString *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = GEOIsFeatureActive();
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    featureFlag = self->_featureFlag;
    v7 = 138412546;
    v8 = featureFlag;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Checking featureFlag %@: %d", (uint8_t *)&v7, 0x12u);
  }

  if (v3)
    return GEOConfigGetBOOL();
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlag, 0);
}

@end
