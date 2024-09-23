@implementation CDMAssetsUtils

+ (id)getNLUsages:(id)a3
{
  id v3;
  CDMAssetsUsages *v4;

  v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v4, "addUsageForKey:withAssetUsageValue:", 0, v3);

  return v4;
}

+ (id)loadAssetMetadataFromAsset:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("version.yaml"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v3, 4, &v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v35;
  if (v5)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "+[CDMAssetsUtils loadAssetMetadataFromAsset:]";
      v39 = 2112;
      v40 = v3;
      v41 = 2112;
      v42 = v5;
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error while loading file: %@. Error: %@.", buf, 0x20u);
    }

    v29 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  else
  {
    v28 = v3;
    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v4;
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      v12 = CFSTR(":");
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v14, "length"))
          {
            v15 = objc_msgSend(v14, "rangeOfString:", v12);
            if (v16)
              v17 = v15 == 0x7FFFFFFFFFFFFFFFLL;
            else
              v17 = 1;
            if (v17)
            {
              CDMOSLoggerForCategory(0);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v38 = "+[CDMAssetsUtils loadAssetMetadataFromAsset:]";
                v39 = 2112;
                v40 = v14;
                _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s Skip invalid line: %@.", buf, 0x16u);
              }
            }
            else
            {
              v18 = v15;
              objc_msgSend(v14, "substringToIndex:", v15);
              v19 = v12;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
              v22 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "substringFromIndex:", v18 + 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "setValue:forKey:", v25, v22);
              v12 = v19;
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v4 = v27;
    v3 = v28;
    v5 = 0;
  }

  return v29;
}

+ (id)getAssetVersionFromAssetMetadata:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("VERSION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315650;
    v8 = "+[CDMAssetsUtils getAssetVersionFromAssetMetadata:]";
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Asset version is: %@ for asset metadata: %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

+ (id)findExistFolderInAssetFolders:(id)a3 underBasePath:(id)a4 useFileManager:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v15, (_QWORD)v21);
        v16 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "fileExistsAtPath:", v16))
        {
          CDMOSLoggerForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v26 = "+[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:]";
            v27 = 2112;
            v28 = v8;
            v29 = 2112;
            v30 = v16;
            v31 = 2112;
            v32 = v15;
            _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Using basePath %@ basePath, path %@ exists. Return %@.", buf, 0x2Au);
          }

          v18 = v15;
          v17 = v10;
          goto LABEL_15;
        }

      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v12)
        continue;
      break;
    }
  }

  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "+[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s No folder exists in %@ under %@. Return nil.", buf, 0x20u);
  }
  v18 = 0;
LABEL_15:

  return v18;
}

+ (id)appendPathWithServiceAssetFolder:(id)a3 assetPath:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "+[CDMAssetsUtils appendPathWithServiceAssetFolder:assetPath:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s NL asset path is: %@. Appending asset folder: %@ to it.", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filterFactors:(id)a3 withFactorsInAssetSet:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intersectSet:", v8);
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
    v14 = 136315138;
    v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
    v11 = "%s NL asset is nil. It is invalid. Return NO.";
LABEL_18:
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v14, 0xCu);
    goto LABEL_15;
  }
  if (!objc_msgSend(v5, "getAssetType"))
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    v14 = 136315138;
    v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
    v11 = "%s NilAsset received. It is invalid. Return NO.";
    goto LABEL_18;
  }
  objc_msgSend(v5, "getAssetPath");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && -[NSObject length](v7, "length"))
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "getAssetPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
      v16 = 2112;
      v17 = v13;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ is valid. Return YES.", (uint8_t *)&v14, 0x16u);

    }
    v10 = 1;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
      v16 = 2112;
      v17 = v5;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ has nil asset path. It is invalid. Return NO.", (uint8_t *)&v14, 0x16u);
    }
    v10 = 0;
  }

LABEL_16:
  return v10;
}

+ (id)filterFactors:(id)a3 forAssetSets:(id)a4 withAssetSetNameToFactors:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v7, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMAssetsUtils filterFactors:withFactorsInAssetSet:](CDMAssetsUtils, "filterFactors:withFactorsInAssetSet:", v7, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "count"))
          {
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v14);
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              v27 = "+[CDMAssetsUtils filterFactors:forAssetSets:withAssetSetNameToFactors:]";
              v28 = 2112;
              v29 = v7;
              v30 = 2112;
              v31 = v15;
              v32 = 2112;
              v33 = v14;
              _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Can't find any factor in factors: %@ among %@ that exist under assetSetName: %@. Continue.", buf, 0x2Au);
            }

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v11);
    }

  }
  return v20;
}

+ (id)getGraphNameForAssetAvailabilityType:(int64_t)a3
{
  objc_class *v3;

  if (a3 == 1)
    return CFSTR("NLRouterNoGraph");
  if (a3)
    return 0;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLanguageFromLocaleString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "+[CDMAssetsUtils getLanguageFromLocaleString:]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Extracted language: %@ from locale: %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = v5;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "+[CDMAssetsUtils getLanguageFromLocaleString:]";
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %@. Return NO.", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)getCDMAssetsInfoForNLRouterWithLocale:(id)a3
{
  id v3;
  void *v4;
  CDMAssetsInfo *v5;
  void *v6;
  CDMAssetsInfo *v7;
  CDMAssetsFactorConfig *v8;
  uint64_t v9;
  void *v10;
  CDMAssetsFactorConfig *v11;
  uint64_t v12;
  void *v13;
  CDMAssetsFactorConfig *v14;
  void *v15;
  CDMAssetsFactorConfig *v16;
  void *v17;
  CDMAssetsUsages *v18;
  void *v19;
  CDMAssetsUsages *v20;
  void *v21;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CDMAssetsUtils getLanguageFromLocaleString:](CDMAssetsUtils, "getLanguageFromLocaleString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v23 = v4;
    v5 = [CDMAssetsInfo alloc];
    +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:](CDMAssetsUtils, "getGraphNameForAssetAvailabilityType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CDMAssetsInfo initWithGraphName:](v5, "initWithGraphName:", v6);

    v8 = [CDMAssetsFactorConfig alloc];
    v9 = MEMORY[0x24BDBD1A8];
    v30[0] = CFSTR("com.apple.if.planner.nlrouter.base");
    v30[1] = CFSTR("com.apple.if.planner.nlrouter.tokenizer");
    v31[0] = MEMORY[0x24BDBD1A8];
    v31[1] = MEMORY[0x24BDBD1A8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CDMAssetsFactorConfig initWithFactorToFoldersMapping:](v8, "initWithFactorToFoldersMapping:", v10);

    v12 = MEMORY[0x24BDBD1C8];
    v28[0] = CFSTR("com.apple.if.planner.nlrouter.base");
    v28[1] = CFSTR("com.apple.if.planner.nlrouter.tokenizer");
    v29[0] = MEMORY[0x24BDBD1C8];
    v29[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMAssetsFactorConfig setFactorToIsRequiredMapping:](v11, "setFactorToIsRequiredMapping:", v13);

    v14 = [CDMAssetsFactorConfig alloc];
    v26 = CFSTR("com.apple.if.planner.nlrouter.overrides");
    v27 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CDMAssetsFactorConfig initWithFactorToFoldersMapping:](v14, "initWithFactorToFoldersMapping:", v15);

    v24 = CFSTR("com.apple.if.planner.nlrouter.overrides");
    v25 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMAssetsFactorConfig setFactorToIsRequiredMapping:](v16, "setFactorToIsRequiredMapping:", v17);

    v18 = objc_alloc_init(CDMAssetsUsages);
    +[CDMAssetsUtils getLanguageFromLocaleString:](CDMAssetsUtils, "getLanguageFromLocaleString:", v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v18, "addUsageForKey:withAssetUsageValue:", 3, v19);

    v20 = objc_alloc_init(CDMAssetsUsages);
    +[CDMAssetsUtils getLanguageFromLocaleString:](CDMAssetsUtils, "getLanguageFromLocaleString:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v20, "addUsageForKey:withAssetUsageValue:", 3, v21);

    -[CDMAssetsInfo setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:](v7, "setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:", v18, v11, 2);
    -[CDMAssetsInfo setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:](v7, "setAssetsUsages:withCDMAssetsFactorConfig:forCDMAssetSet:", v20, v16, 3);

    v4 = v23;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)registerWithAssetsDelegate:(id)a3 withCDMAssetsInfo:(id)a4 withType:(int64_t)a5 withLocale:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  unsigned int v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v12, "setupForLocale:cdmAssetsInfo:error:", v13, v10, &v25);
  v14 = v25;

  if (v14)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
      v28 = 2112;
      v29 = v11;
      v16 = "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %@. Return NO.";
      v17 = v15;
      v18 = 22;
LABEL_10:
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v24 = 0;
  v19 = objc_msgSend(v12, "registerForCDMAssetsInfo:withLocale:withAssetsDelegate:selfContextId:selfMetadata:dataDispatcherContext:withAssetAvailabilityType:withError:", v10, v11, v9, 0, 0, 0, a5, &v24);
  v14 = v24;
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:](CDMAssetsUtils, "getGraphNameForAssetAvailabilityType:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
    v28 = 2112;
    v29 = v23;
    v30 = 2048;
    v31 = v19;
    _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Registration status for graph: %@ is %ld", buf, 0x20u);

  }
  if ((v19 & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
      v16 = "%s [ERR]: Error occurs while registering. Return NO.";
      v17 = v15;
      v18 = 12;
      goto LABEL_10;
    }
LABEL_11:

    v21 = 0;
    goto LABEL_12;
  }
  v21 = 1;
LABEL_12:

  return v21;
}

+ (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4 withLocale:(id)a5
{
  id v7;
  NSObject *v8;
  CDMConfig *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!v8)
  {
    v9 = objc_alloc_init(CDMConfig);
    -[CDMConfig defaultLocaleIdentifier](v9, "defaultLocaleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Locale was nil. Update it to Assistant locale: %@", (uint8_t *)&v18, 0x16u);
    }

  }
  if (a4 == 1)
  {
    +[CDMAssetsUtils getLanguageFromLocaleString:](CDMAssetsUtils, "getLanguageFromLocaleString:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for NLRouter assets for locale: %@", (uint8_t *)&v18, 0x16u);
    }

    +[CDMAssetsUtils getCDMAssetsInfoForNLRouterWithLocale:](CDMAssetsUtils, "getCDMAssetsInfoForNLRouterWithLocale:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v13 = +[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:", v7, v15, 1, v11);
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v18 = 136315138;
        v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
        _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Failed to initialize CDMAssetsInfo for NLRouter. Asset registration failed", (uint8_t *)&v18, 0xCu);
      }

      v13 = 0;
    }

  }
  else if (a4)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Asset Registration failed because of unknown assetAvailabilityType.", (uint8_t *)&v18, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    +[CDMServiceGraph getAssetsForSetup:](CDMNLUServiceGraph, "getAssetsForSetup:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for NLX assets for locale: %@", (uint8_t *)&v18, 0x16u);
    }

    v13 = +[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:](CDMAssetsUtils, "registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:", v7, v11, 0, v8);
  }

  return v13;
}

+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4 withFolders:(id)a5 useFileManager:(id)a6 withAssetAvailabilityType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v23 = 136315906;
    v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
    v25 = 2112;
    v26 = (int64_t)v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v14;
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Check is NL asset: %@ valid for locale: %@ with folders :%@.", (uint8_t *)&v23, 0x2Au);
  }

  if (objc_msgSend(a1, "isNLAssetValid:forLocale:", v12, v13))
  {
    objc_msgSend(v12, "getAssetPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "fileExistsAtPath:", v17) & 1) != 0)
    {
      if (a7)
      {
        CDMOSLoggerForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v23 = 136315394;
          v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
          v25 = 2048;
          v26 = a7;
          _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Skipping top level folder check for assetAvailabilityType: %ld", (uint8_t *)&v23, 0x16u);
        }
        v19 = 1;
        goto LABEL_12;
      }
      if (v14 && objc_msgSend(v14, "count"))
      {
        objc_msgSend(a1, "findExistFolderInAssetFolders:underBasePath:useFileManager:", v14, v17, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v19 = 1;
          goto LABEL_13;
        }
        CDMOSLoggerForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        v23 = 136315394;
        v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        v25 = 2112;
        v26 = (int64_t)v12;
        v22 = "%s No folder exists for NLAsset: %@. Return NO.";
        goto LABEL_22;
      }
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v23 = 136315394;
        v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        v25 = 2112;
        v26 = (int64_t)v12;
        v22 = "%s No folders specified for NL asset %@.";
LABEL_22:
        _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v23, 0x16u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v23 = 136315394;
        v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        v25 = 2112;
        v26 = (int64_t)v17;
        v22 = "%s Base asset path does not exist %@.";
        goto LABEL_22;
      }
    }
LABEL_11:
    v19 = 0;
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

+ (BOOL)areFactorsValid:(id)a3 inKnownFactors:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12, (_QWORD)v16) & 1) == 0)
          {
            CDMOSLoggerForCategory(0);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v21 = "+[CDMAssetsUtils areFactorsValid:inKnownFactors:]";
              v22 = 2112;
              v23 = v12;
              v24 = 2112;
              v25 = v6;
              _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Can't find factor: %@ in factor to among known factors: %@. Return NO.", buf, 0x20u);
            }

            v13 = 0;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_14:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (id)getAssistantUsages:(id)a3
{
  id v3;
  CDMAssetsUsages *v4;

  v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v4, "addUsageForKey:withAssetUsageValue:", 0, v3);

  -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v4, "addUsageForKey:withAssetUsageValue:", 1, CFSTR("enabled"));
  return v4;
}

+ (id)getSsuUsages:(id)a3
{
  id v3;
  CDMAssetsUsages *v4;

  v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v4, "addUsageForKey:withAssetUsageValue:", 0, v3);

  -[CDMAssetsUsages addUsageForKey:withAssetUsageValue:](v4, "addUsageForKey:withAssetUsageValue:", 2, CFSTR("enabled"));
  return v4;
}

+ (id)cdmAssetSetToStr:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_24DCAC5D0[a3];
}

@end
