@implementation ATXAppPredictorAssetMapping

- (id)getFullCachePathWithBaseCachePath:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[ATXAppPredictorAssetMapping getAssetFileAndSubscoreForConsumerSubType:](self, "getAssetFileAndSubscoreForConsumerSubType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictorAssetMapping getFullCachePathWithBaseCachePath:cacheFileBaseName:subScoreName:](ATXAppPredictorAssetMapping, "getFullCachePathWithBaseCachePath:cacheFileBaseName:subScoreName:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getAssetFileAndSubscoreForConsumerSubType:(unsigned __int8)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_consumerSubTypeAssetMappings, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_7;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppPredictorAssetMapping.m"), 101, CFSTR("Could not find a consumerSubType mapping because an empty consumerSubTypeString was nil"));

  }
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ATXAppPredictorAssetMapping getAssetFileAndSubscoreForConsumerSubType:].cold.2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  -[NSDictionary objectForKeyedSubscript:](self->_consumerSubTypeAssetMappings, "objectForKeyedSubscript:", CFSTR("__Default"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_7:
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("assetFile"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("subscore"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXAppPredictorAssetMapping getAssetFileAndSubscoreForConsumerSubType:].cold.1(v6, v18, v19, v20, v21, v22, v23, v24);
    v14 = CFSTR("_ATXAppPredictor");
    v15 = CFSTR("TotalScore");
  }

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)getFullCachePathWithBaseCachePath:(id)a3 cacheFileBaseName:(id)a4 subScoreName:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), a3, a4, a5);
}

+ (id)sharedInstanceWithMobileAssets
{
  if (sharedInstanceWithMobileAssets__pasOnceToken11 != -1)
    dispatch_once(&sharedInstanceWithMobileAssets__pasOnceToken11, &__block_literal_global_44);
  return (id)sharedInstanceWithMobileAssets__pasExprOnceResult;
}

- (ATXAppPredictorAssetMapping)initWithUseMobileAssets:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  ATXAppPredictorAssetMapping *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSDictionary *consumerSubTypeAssetMappings;
  id v19;
  ATXAssetsABHelper *v20;
  objc_class *v21;
  void *v22;
  ATXAssetsABHelper *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *v26;
  void *v27;
  NSDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  objc_super v47;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("caches/assetMapping"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v47.receiver = self;
  v47.super_class = (Class)ATXAppPredictorAssetMapping;
  v8 = -[ATXAppPredictorAssetMapping init](&v47, sel_init);
  if (!v8)
  {
    v17 = 0;
    goto LABEL_20;
  }
  if (!v3)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v7);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x1A85A4F90]();
      v12 = objc_alloc(MEMORY[0x1E0C99E60]);
      v13 = objc_opt_class();
      v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v11);
      v15 = (void *)MEMORY[0x1A85A4F90]();
      v46 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v10, &v46);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v46;
      consumerSubTypeAssetMappings = v8->_consumerSubTypeAssetMappings;
      v8->_consumerSubTypeAssetMappings = (NSDictionary *)v16;

      objc_autoreleasePoolPop(v15);
      if (v8->_consumerSubTypeAssetMappings)
      {
        v19 = v17;
LABEL_19:

        v17 = v19;
        goto LABEL_20;
      }

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ATXAppPredictorAssetMapping initWithUseMobileAssets:].cold.3((uint64_t)v17, v37, v38, v39, v40, v41, v42, v43);

      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ATXAppPredictorAssetMapping initWithUseMobileAssets:].cold.2();
  }
  v17 = 0;
LABEL_10:
  v20 = [ATXAssetsABHelper alloc];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:](v20, "initWithAssetsForResource:ofType:specifiedABGroup:", v22, CFSTR("plist"), 0);

  -[ATXAssetsABHelper abGroupContents](v23, "abGroupContents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("consumerSubTypeToAssetFileMapping"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v8->_consumerSubTypeAssetMappings;
  v8->_consumerSubTypeAssetMappings = (NSDictionary *)v25;

  if (v3)
  {
    if (!v8->_consumerSubTypeAssetMappings)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("ATXAppPredictorAssetMapping.m"), 61, CFSTR("Could not load ATXAppPredictorAssetMapping data"));

    }
    v27 = (void *)MEMORY[0x1A85A4F90]();
    v28 = v8->_consumerSubTypeAssetMappings;
    v45 = v17;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v45;

    objc_autoreleasePoolPop(v27);
    if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ATXAppPredictorAssetMapping initWithUseMobileAssets:].cold.1((uint64_t)v19, v29, v30, v31, v32, v33, v34, v35);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v7);
    if (!v14 || (objc_msgSend(v10, "isEqual:", v14) & 1) == 0)
      objc_msgSend(v10, "writeToFile:atomically:", v7, 1);
    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

+ (id)assetMappingWithCachedAssets
{
  return -[ATXAppPredictorAssetMapping initWithUseMobileAssets:]([ATXAppPredictorAssetMapping alloc], "initWithUseMobileAssets:", 0);
}

void __61__ATXAppPredictorAssetMapping_sharedInstanceWithMobileAssets__block_invoke()
{
  void *v0;
  ATXAppPredictorAssetMapping *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = -[ATXAppPredictorAssetMapping initWithUseMobileAssets:]([ATXAppPredictorAssetMapping alloc], "initWithUseMobileAssets:", 1);
  v2 = (void *)sharedInstanceWithMobileAssets__pasExprOnceResult;
  sharedInstanceWithMobileAssets__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)getFullDefaultCachePathWithConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppPredictorAssetMapping getFullCachePathWithBaseCachePath:consumerSubType:](self, "getFullCachePathWithBaseCachePath:consumerSubType:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getAtxToolDescription
{
  void *v2;
  int v3;
  unsigned int v4;
  void *v5;
  const __CFString *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  ATXAssetsABHelper *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  NSDictionary *obj;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  ATXAssetsABHelper *v42;
  void *v43;
  __CFString *v44;
  void *context;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = 0;
  do
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

    ++v3;
  }
  while (v4 < 0x2F);
  v33 = v2;
  v40 = (void *)objc_opt_new();
  v35 = (void *)objc_opt_new();
  v37 = (id)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_consumerSubTypeAssetMappings;
  v39 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v39)
  {
    v6 = &stru_1E4D5DB30;
    v36 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v9 = MEMORY[0x1A85A4F90]();
        v10 = (__CFString *)v6;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("__Default")) & 1) == 0)
        {
          v11 = objc_msgSend(v33, "containsObject:", v8);
          v12 = CFSTR(" (INVALID SUBTYPE)");
          if (v11)
            v12 = (__CFString *)v6;
          v10 = v12;
        }
        -[NSDictionary objectForKeyedSubscript:](self->_consumerSubTypeAssetMappings, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("assetFile"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = CFSTR(" (ASSET FILE NAME MISSING)");
        if (v14)
          v16 = (__CFString *)v14;
        v17 = v16;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subscore"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = CFSTR(" (FINAL SUBSCORE NAME MISSING)");
        if (v18)
          v20 = (__CFString *)v18;
        v21 = v20;

        v44 = v10;
        context = (void *)v9;
        v43 = v13;
        if (objc_msgSend(v40, "containsObject:", v17))
        {
          v42 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:]([ATXAssetsABHelper alloc], "initWithAssetsForResource:ofType:specifiedABGroup:", v17, CFSTR("plist"), 0);
          -[ATXAssetsABHelper abGroupContents](v42, "abGroupContents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          v41 = v6;
          goto LABEL_25;
        }
        if ((objc_msgSend(v35, "containsObject:", v17) & 1) != 0)
        {
          v22 = 0;
          v42 = 0;
        }
        else
        {
          v23 = -[ATXAssetsABHelper initWithAssetsForResource:ofType:specifiedABGroup:]([ATXAssetsABHelper alloc], "initWithAssetsForResource:ofType:specifiedABGroup:", v17, CFSTR("plist"), 0);
          -[ATXAssetsABHelper abGroupContents](v23, "abGroupContents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v23;
          if (v22)
          {
            objc_msgSend(v40, "addObject:", v17);
            goto LABEL_22;
          }
          objc_msgSend(v35, "addObject:", v17);
        }
        v41 = CFSTR("(INVALID ASSET FILE)");
LABEL_25:
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Scorer"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = CFSTR(" (MISSING FROM ASSET FILE)");
        if (v25)
          v26 = (__CFString *)v6;
        v27 = v6;
        v28 = v26;

        objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXAppPredictorAssetMapping getFullCachePathWithBaseCachePath:cacheFileBaseName:subScoreName:](ATXAppPredictorAssetMapping, "getFullCachePathWithBaseCachePath:cacheFileBaseName:subScoreName:", v30, v17, v21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "appendFormat:", CFSTR("%@%@\n"), v8, v44);
        objc_msgSend(v37, "appendFormat:", CFSTR("    assetFile=%@%@\n"), v17, v41);
        objc_msgSend(v37, "appendFormat:", CFSTR("    subscore=%@%@\n"), v21, v28);

        v6 = v27;
        objc_msgSend(v37, "appendFormat:", CFSTR("    cacheFilePath=%@\n"), v31);

        objc_autoreleasePoolPop(context);
      }
      v39 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v39);
  }

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubTypeAssetMappings, 0);
}

- (void)initWithUseMobileAssets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, MEMORY[0x1E0C81028], a3, "ATXAppPredictorAssetMapping:initWithUseMobileAssets error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithUseMobileAssets:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ATXAppPredictorAssetMapping:cached unable to init from file", v0, 2u);
}

- (void)initWithUseMobileAssets:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, MEMORY[0x1E0C81028], a3, "ATXAppPredictorAssetMapping, error unarchiving data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getAssetFileAndSubscoreForConsumerSubType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "Could not even find a consumerSubType mapping for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getAssetFileAndSubscoreForConsumerSubType:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not find a consumerSubType mapping for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
