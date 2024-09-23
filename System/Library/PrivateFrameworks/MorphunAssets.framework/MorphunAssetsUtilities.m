@implementation MorphunAssetsUtilities

+ (id)userSiriXLocales
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MorphunAssetOSLog;
  if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "+[MorphunAssetsUtilities userSiriXLocales]";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_209C90000, v4, OS_LOG_TYPE_INFO, "%s AFPreferences returned %@", buf, 0x16u);
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v9 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)configurationFromPropertiesFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke;
    v13 = &unk_24C253308;
    v6 = v4;
    v14 = v6;
    v15 = v3;
    if (configurationFromPropertiesFile__oncePredicate != -1)
      dispatch_once(&configurationFromPropertiesFile__oncePredicate, &v10);
    if (configurationFromPropertiesFile__configurationStore
      && (objc_msgSend((id)configurationFromPropertiesFile__configurationStore, "objectForKeyedSubscript:", v6, v10, v11, v12, v13, v14, v15), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      objc_msgSend((id)configurationFromPropertiesFile__configurationStore, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v8;
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)configurationFromPropertiesFile__configurationStore;
  configurationFromPropertiesFile__configurationStore = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (uint64_t *)(a1 + 32);
  objc_msgSend((id)configurationFromPropertiesFile__configurationStore, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  v6 = MorphunAssetOSLog;
  if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v35 = "+[MorphunAssetsUtilities configurationFromPropertiesFile:]_block_invoke";
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_209C90000, v6, OS_LOG_TYPE_INFO, "%s Reading configuration file %@", buf, 0x16u);
  }
  v8 = *v5;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v8, 4, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
      __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_2();
  }
  else
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^[ \t]*(.*?)[ \t]*[=|:][ \t]*(.*?)[ \t]*$"), 16, &v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
        __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_1();
    }
    else
    {
      v26 = v12;
      objc_msgSend(v12, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "rangeAtIndex:", 1);
            objc_msgSend(v9, "substringWithRange:", v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v18, "rangeAtIndex:", 2);
            objc_msgSend(v9, "substringWithRange:", v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)configurationFromPropertiesFile__configurationStore, "objectForKeyedSubscript:", *v5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v21);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v15);
      }

      v12 = v26;
      v11 = 0;
    }

  }
}

+ (id)configFileValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "embeddedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("config.properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
  +[MorphunAssetsUtilities configurationFromPropertiesFile:](MorphunAssetsUtilities, "configurationFromPropertiesFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
      +[MorphunAssetsUtilities configFileValueForKey:].cold.1();
    v10 = 0;
  }

  return v10;
}

+ (id)embeddedLanguages
{
  id v2;

  MorphunLogInitIfNeeded();
  if (embeddedLanguages_oncePredicate != -1)
    dispatch_once(&embeddedLanguages_oncePredicate, &__block_literal_global_0);
  if (embeddedLanguages_languages)
  {
    v2 = (id)embeddedLanguages_languages;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
      +[MorphunAssetsUtilities embeddedLanguages].cold.1();
    v2 = (id)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

void __43__MorphunAssetsUtilities_embeddedLanguages__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[MorphunAssetsUtilities configFileValueForKey:](MorphunAssetsUtilities, "configFileValueForKey:", CFSTR("languages.default"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "componentsSeparatedByString:", CFSTR(","));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)embeddedLanguages_languages;
    embeddedLanguages_languages = v1;

    v0 = v3;
  }

}

+ (id)libmorphunVersion
{
  void *v2;
  id v3;

  MorphunLogInitIfNeeded();
  if ((objc_msgSend((id)libmorphunVersion_version, "isEqualToString:", &stru_24C2539D8) & 1) != 0)
  {
    +[MorphunAssetsUtilities configFileValueForKey:](MorphunAssetsUtilities, "configFileValueForKey:", CFSTR("library.version"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_storeStrong((id *)&libmorphunVersion_version, v2);
    }
    else if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
    {
      +[MorphunAssetsUtilities libmorphunVersion].cold.1();
    }
    v3 = (id)libmorphunVersion_version;

  }
  else
  {
    v3 = (id)libmorphunVersion_version;
  }
  return v3;
}

+ (int)compareVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MorphunAssetsUtilities libmorphunVersion](MorphunAssetsUtilities, "libmorphunVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 2 && (unint64_t)objc_msgSend(v6, "count") > 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v11 >= v13)
    {
      if (v11 == v13)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        if (v15 < v17)
          v8 = -1;
        else
          v8 = v15 != v17;
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v7 = (void *)MorphunAssetOSLog;
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
      +[MorphunAssetsUtilities compareVersion:].cold.1((uint64_t)v3, v7);
    v8 = 0;
  }

  return v8;
}

+ (id)embeddedPath
{
  return CFSTR("/usr/share/morphun");
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_209C90000, v0, v1, "%s Failed to parse configuration file at %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_209C90000, v0, v1, "%s Failed to read configuration file at %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)configFileValueForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_209C90000, v0, v1, "%s Retrieved configuration returned an empty dictionary for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)embeddedLanguages
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_209C90000, v0, v1, "%s Configuration parser returned a nil value for key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)libmorphunVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_209C90000, v0, v1, "%s Configuration parser returned a nil value for key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)compareVersion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  __int16 v5;
  uint64_t v6;
  int v7[3];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[MorphunAssetsUtilities libmorphunVersion](MorphunAssetsUtilities, "libmorphunVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v8 = a1;
  v9 = v5;
  v10 = v6;
  _os_log_error_impl(&dword_209C90000, v3, OS_LOG_TYPE_ERROR, "%s Error parsing version strings:\nInput version: %@\nlibmorphun version:%@", (uint8_t *)v7, 0x20u);

}

@end
