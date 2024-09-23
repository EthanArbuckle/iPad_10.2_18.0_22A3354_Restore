@implementation ATXABHelper

+ (id)abGroupNilString
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  +[ATXAggregateKeys abGroupNilString](ATXAggregateKeys, "abGroupNilString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown");
  v4 = v2;

  return v4;
}

+ (id)abGroupForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXAssetsABHelper *v9;
  void *v10;
  ATXAssetsABHelper *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90](a1, a2);
  if (abGroupForConsumerSubType__onceToken != -1)
    dispatch_once(&abGroupForConsumerSubType__onceToken, &__block_literal_global_38);
  +[ATXABHelper abGroupOverride](ATXABHelper, "abGroupOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
  v15 = (id)abGroupForConsumerSubType__cache;
  objc_sync_enter(v15);
  v16 = (void *)abGroupForConsumerSubType__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v15);
  if (!v18)
  {
LABEL_4:
    +[ATXAppPredictorAssetMapping sharedInstanceWithMobileAssets](ATXAppPredictorAssetMapping, "sharedInstanceWithMobileAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getAssetFileAndSubscoreForConsumerSubType:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [ATXAssetsABHelper alloc];
    +[ATXABHelper abGroupOverride](ATXABHelper, "abGroupOverride");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:](v9, "initWithAssetsForResource:ofType:specifiedABGroup:", v8, CFSTR("plplist"), v10);

    -[ATXAssetsABHelper groupIdentifier](v11, "groupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      +[ATXABHelper abGroupNilString](ATXABHelper, "abGroupNilString");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v14;

    if (!v5)
    {
      v19 = (id)abGroupForConsumerSubType__cache;
      objc_sync_enter(v19);
      v20 = (void *)abGroupForConsumerSubType__cache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v21);

      objc_sync_exit(v19);
    }

  }
  objc_autoreleasePoolPop(v4);
  return v18;
}

void __41__ATXABHelper_abGroupForConsumerSubType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)abGroupForConsumerSubType__cache;
  abGroupForConsumerSubType__cache = v0;

}

+ (id)abGroupOverride
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;

  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(v3, "objectForKey:", CFSTR("appPredictionABGroupOverride"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ATXABHelper abGroupOverride].cold.1((uint64_t)v4, v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)abGroupOverride
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "Using A/B group override: %@", (uint8_t *)&v2, 0xCu);
}

@end
