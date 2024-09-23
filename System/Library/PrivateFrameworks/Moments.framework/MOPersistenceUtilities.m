@implementation MOPersistenceUtilities

+ (id)userCacheDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v14;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if ((v6 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = 0,
          v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14), v9 = v14, v7, v8)&& !v9)
    {
      _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[MOPersistenceUtilities userCacheDirectoryPath].cold.1((uint64_t)v4, v10);

      v11 = v4;
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[MOPersistenceUtilities userCacheDirectoryPath].cold.2();

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)userDataDumpDirectoryPathWithSuffix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  NSObject *v16;
  id v17;

  v3 = a3;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Temp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v10 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v17);
    v13 = v17;

    if (!v12 || v13)
    {
      _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:].cold.1();

      v14 = 0;
    }
    else
    {
LABEL_6:
      v14 = v8;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)getBundlingJSONURLWithDirectorySuffix:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  +[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:](MOPersistenceUtilities, "userDataDumpDirectoryPathWithSuffix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPersistenceManager);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOPersistenceUtilities getBundlingJSONURLWithDirectorySuffix:].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

+ (void)userCacheDirectoryPath
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEBUG, "failed to create %@, error, %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)userDataDumpDirectoryPathWithSuffix:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)getBundlingJSONURLWithDirectorySuffix:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Failed to get bundling data dump directory.", v1, 2u);
}

@end
