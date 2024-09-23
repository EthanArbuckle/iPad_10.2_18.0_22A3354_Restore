@implementation ATXFileUtil

+ (BOOL)shouldUpdateCache:(id)a3 withRefreshRate:(double)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:](ATXFileUtil, "_shouldUpdateCache:withRefreshRate:currentTime:", v5, a4, CFAbsoluteTimeGetCurrent());

  return v6;
}

+ (BOOL)_shouldUpdateCache:(id)a3 withRefreshRate:(double)a4 currentTime:(double)a5
{
  id v8;
  void *v9;
  char v10;
  double v11;
  NSObject *v12;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.6();
    goto LABEL_7;
  }
  objc_msgSend(a1, "cacheAgeForCache:withCurrentTime:", v8, a5);
  if (v11 > a4)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.1();
LABEL_7:

    goto LABEL_8;
  }
  if (v11 < 0.0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.2();
    goto LABEL_7;
  }
  v14 = open((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0);
  if (v14 < 0)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.3();

  }
  else
  {
    v15 = v14;
    ATXCacheFileRead();
    close(v15);
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.4();

  }
LABEL_8:

  return 1;
}

+ (double)cacheAgeForCache:(id)a3 withCurrentTime:(double)a4
{
  id v5;
  NSObject *v6;
  double v7;
  stat v9;

  memset(&v9, 0, sizeof(v9));
  v5 = objc_retainAutorelease(a3);
  if (lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v9))
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[ATXFileUtil cacheAgeForCache:withCurrentTime:].cold.1((uint64_t)v5, v6);

    v7 = 1.79769313e308;
  }
  else
  {
    v7 = a4 - ((double)v9.st_mtimespec.tv_sec + (double)v9.st_mtimespec.tv_nsec * 0.000000001 - *MEMORY[0x1E0C9ADF8]);
  }

  return v7;
}

+ (double)cacheAgeForConsumerType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXFileUtil cacheAgeForConsumerType:basePath:](ATXFileUtil, "cacheAgeForConsumerType:basePath:", v3, v5);
  v7 = v6;

  return v7;
}

+ (double)cacheAgeForConsumerType:(unsigned __int8)a3 basePath:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CF8CD0];
  v7 = a4;
  objc_msgSend(v6, "sharedInstanceWithMobileAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getFullCachePathWithBaseCachePath:consumerSubType:", v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cacheAgeForCache:withCurrentTime:", v9, CFAbsoluteTimeGetCurrent());
  v11 = v10;

  return v11;
}

+ (BOOL)cachesAreValidForConsumerSubTypes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)MEMORY[0x1E0CF94D8];
  v4 = a3;
  objc_msgSend(v3, "appPredictionDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[ATXFileUtil cachesAreValidForBasePath:consumerSubTypes:](ATXFileUtil, "cachesAreValidForBasePath:consumerSubTypes:", v6, v4);

  return v7;
}

+ (BOOL)cachesAreValidForBasePath:(id)a3 consumerSubTypes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getFullCachePathWithBaseCachePath:consumerSubType:", v5, objc_msgSend(v13, "unsignedCharValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance", (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "defaultPredictionRefreshRate");
        LOBYTE(v21) = +[ATXFileUtil shouldUpdateCache:withRefreshRate:](ATXFileUtil, "shouldUpdateCache:withRefreshRate:", v21);

        if ((v21 & 1) != 0)
        {
          v23 = 0;
          goto LABEL_18;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_18:

  return v23;
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Prediction cache is old, update cache at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Prediction cache was created in the future, update cache at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Prediction cache file open failed at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Prediction cache file was empty at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Prediction cache file held invalid data (old magic number?) at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Prediction cache doesn't yet exist, update cache at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)cacheAgeForCache:(uint64_t)a1 withCurrentTime:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int *v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v4;
  v11 = 2080;
  v12 = v6;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Couldn't lstat %@: [%i] %s", (uint8_t *)&v7, 0x1Cu);
}

@end
