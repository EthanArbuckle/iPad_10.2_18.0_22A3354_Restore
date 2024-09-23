@implementation ATXPaths

void __34__ATXPaths_appPredictionDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_getDirectoryCreating:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)appPredictionDirectory_dir;
  appPredictionDirectory_dir = v1;

}

+ (id)_getDirectoryCreating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("/var/mobile/Library/"), "stringByAppendingPathComponent:", CFSTR("DuetExpertCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "_recursivelyCreateDirectoryWithErrorHandlingAtPath:", v5);
    +[ATXPaths createDataVault:](ATXPaths, "createDataVault:", v5);
  }
  return v5;
}

+ (id)feedbackRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("feedback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uiCachesRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("UICaches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)clientModelCachesRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ClientModelCaches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)biomeStreamsRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("streams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appPredictionDirectoryFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)appPredictionDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ATXPaths_appPredictionDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (appPredictionDirectory_onceToken != -1)
    dispatch_once(&appPredictionDirectory_onceToken, block);
  return (id)appPredictionDirectory_dir;
}

+ (void)createDirectoriesIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[13];

  v15[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_getDirectoryCreating:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("MagicalMoments");
  v15[1] = CFSTR("caches");
  v15[2] = CFSTR("ClientModelCaches");
  v15[3] = CFSTR("UICaches");
  v15[4] = CFSTR("feedback");
  v15[5] = CFSTR("streams");
  v15[6] = CFSTR("metrics");
  v15[7] = CFSTR("models");
  v15[8] = CFSTR("ModeCaches");
  v15[9] = CFSTR("Bookmarks");
  v15[10] = CFSTR("WidgetPredictionModelDirectory");
  v15[11] = CFSTR("ScoreNormalizationModel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 12);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_recursivelyCreateDirectoryWithErrorHandlingAtPath:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v6, "code");
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 640)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[ATXPaths _recursivelyCreateDirectoryWithErrorHandlingAtPath:].cold.1((uint64_t)v3, v9);
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      +[ATXPaths _recursivelyCreateDirectoryWithErrorHandlingAtPath:].cold.2();
    }

  }
}

+ (void)createDataVault:(id)a3
{
  id v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  NSObject *v12;
  __int16 v13;
  uint8_t buf[2];

  v3 = objc_retainAutorelease(a3);
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  v5 = rootless_check_datavault_flag();
  if (v5 == 1)
  {
    if (chmod(v4, 0x1C0u))
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[ATXPaths createDataVault:].cold.3((uint64_t)v3, v6);
    }
    else
    {
      v11 = rootless_convert_to_datavault();
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (!v11)
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        v13 = 0;
        v7 = "Directory successfully converted to Data Vault";
        v8 = (uint8_t *)&v13;
        v9 = v6;
        v10 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ATXPaths createDataVault:].cold.2();
    }
  }
  else if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXPaths createDataVault:].cold.1();
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Data Vault already created";
      v8 = buf;
      v9 = v6;
      v10 = OS_LOG_TYPE_INFO;
LABEL_5:
      _os_log_impl(&dword_1C99CA000, v9, v10, v7, v8, 2u);
    }
  }
LABEL_11:

}

+ (id)appPredictionCacheDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("caches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appPredictionBackupDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Backups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)magicalMomentsPredictionTablesRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MagicalMoments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)metricsRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)trialFolderResourcePath
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("models"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)modeCachesRootDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ModeCaches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bookmarksPathFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Bookmarks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contextualActionsModelDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ContextualActionsModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)contextualActionsModelFileWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "contextualActionsModelDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)scoreNormalizationModelDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ScoreNormalizationModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)scoreNormalizationModelFileWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "scoreNormalizationModelDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)widgetPredictionModelDirectory
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionDirectory](ATXPaths, "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("WidgetPredictionModelDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)widgetPredictionModelFileWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "widgetPredictionModelDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)onboardingStackWidgetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("ATXOnboardingStackWidgetCache"));
}

+ (id)onboardingStackResultCacheFilePath
{
  void *v2;
  void *v3;

  +[ATXPaths appPredictionBackupDirectory](ATXPaths, "appPredictionBackupDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ATXOnboardingStackResultCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)posterDescriptorCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("PosterDescriptorCache"));
}

+ (id)posterConfigurationCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("PosterConfigurationCache"));
}

+ (id)faceGalleryDemoConfigurationFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("FaceGalleryDemoConfiguration.json"));
}

+ (id)complicationModularSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("ComplicationsModularSetCache"));
}

+ (id)complicationLandscapeModularSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("LandscapeComplicationsModularSetCache"));
}

+ (id)complicationInlineSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("ComplicationsInlineSetCache"));
}

+ (id)websiteSuggestionsVerticalModelCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("WebsiteSuggestionsVerticalModelCache"));
}

+ (id)websiteTitlesAndSubtitlesCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("WebsiteTitlesAndSubtitlesCache"));
}

+ (id)watchFaceConfigurationCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:](ATXPaths, "appPredictionDirectoryFile:", CFSTR("WatchFaceConfigurationCache"));
}

+ (id)modificationDateOfFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXPaths modificationDateOfFileAtPath:].cold.1();

    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99CA000, a2, OS_LOG_TYPE_ERROR, "Could not create directory (out of space): %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_10();
}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1C99CA000, v0, OS_LOG_TYPE_FAULT, "Could not create directory: %@ path: %@", v1, 0x16u);
  OUTLINED_FUNCTION_10();
}

+ (void)createDataVault:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  v0 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_2(&dword_1C99CA000, v1, v2, "Failed to check status of directory %@: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0_3();
}

+ (void)createDataVault:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  v0 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_2(&dword_1C99CA000, v1, v2, "Failed to convert to a Data Vault: %@: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0_3();
}

+ (void)createDataVault:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  int *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;

  OUTLINED_FUNCTION_4_2();
  v5 = OUTLINED_FUNCTION_6_1();
  v6[0] = 67109890;
  v6[1] = 448;
  v7 = 2112;
  v8 = a1;
  v9 = 1024;
  v10 = v2;
  v11 = 2080;
  v12 = OUTLINED_FUNCTION_3(v5);
  _os_log_error_impl(&dword_1C99CA000, a2, OS_LOG_TYPE_ERROR, "Failed to set mode 0%o on directory %@: [%i] %s", (uint8_t *)v6, 0x22u);
  OUTLINED_FUNCTION_0_3();
}

+ (void)modificationDateOfFileAtPath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1C99CA000, v0, OS_LOG_TYPE_ERROR, "Encountered error getting file age for path: %@. Error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_10();
}

@end
