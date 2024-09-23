@implementation MNFilePaths

+ (id)_homeDirectoryPath
{
  void *v2;

  v2 = (void *)_homeDirectoryPath_homePath;
  _homeDirectoryPath_homePath = (uint64_t)CFSTR("/var/mobile/");

  return CFSTR("/var/mobile/");
}

+ (id)_cachesDirectoryPath
{
  if (qword_1ED0C3FD0 != -1)
    dispatch_once(&qword_1ED0C3FD0, &__block_literal_global_28);
  return (id)_MergedGlobals_33;
}

void __35__MNFilePaths__cachesDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[MNFilePaths _homeDirectoryPath](MNFilePaths, "_homeDirectoryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/Caches/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v1;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138477827;
    v5 = _MergedGlobals_33;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "cachesDirectory: %{private}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (NSString)navdCacheDirectoryPath
{
  if (qword_1ED0C3FE0 != -1)
    dispatch_once(&qword_1ED0C3FE0, &__block_literal_global_9);
  return (NSString *)(id)qword_1ED0C3FD8;
}

void __37__MNFilePaths_navdCacheDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[MNFilePaths _cachesDirectoryPath](MNFilePaths, "_cachesDirectoryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("com.apple.navd"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0C3FD8;
  qword_1ED0C3FD8 = v1;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138477827;
    v5 = qword_1ED0C3FD8;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "navdCacheDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (NSString)navTracesDirectoryPath
{
  if (qword_1ED0C3FF0 != -1)
    dispatch_once(&qword_1ED0C3FF0, &__block_literal_global_12);
  return (NSString *)(id)qword_1ED0C3FE8;
}

void __37__MNFilePaths_navTracesDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[MNFilePaths navdCacheDirectoryPath](MNFilePaths, "navdCacheDirectoryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("NavTraces"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0C3FE8;
  qword_1ED0C3FE8 = v1;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138477827;
    v5 = qword_1ED0C3FE8;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "navTracesDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (NSString)routePlanningTracesDirectoryPath
{
  void *v2;
  void *v3;

  +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("RoutePlanning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)routeCreationTracesDirectoryPath
{
  void *v2;
  void *v3;

  +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("RouteCreation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)navTempDirectoryPath
{
  if (qword_1ED0C4000 != -1)
    dispatch_once(&qword_1ED0C4000, &__block_literal_global_19);
  return (NSString *)(id)qword_1ED0C3FF8;
}

void __35__MNFilePaths_navTempDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[MNFilePaths navdCacheDirectoryPath](MNFilePaths, "navdCacheDirectoryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("tmp"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0C3FF8;
  qword_1ED0C3FF8 = v1;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138477827;
    v5 = qword_1ED0C3FF8;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "navTracesDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (NSString)navTraceExtension
{
  return (NSString *)CFSTR("navtrace");
}

+ (NSString)routePlanningTraceExtension
{
  return (NSString *)CFSTR("rptrace");
}

+ (NSString)customRouteCreationTraceExtension
{
  return (NSString *)CFSTR("crctrace");
}

+ (NSString)routeHandleExtension
{
  return (NSString *)CFSTR("rstorage");
}

+ (BOOL)createFolderIfNotPresent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  char v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (!objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v15))
  {
    v7 = 1;
    if ((objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, a4) & 1) != 0)
      goto LABEL_11;
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *a4;
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v9;
      v10 = "Could not create trace directory at path: %@. Error: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
LABEL_9:
      _os_log_impl(&dword_1B0AD7000, v11, v12, v10, buf, v13);
    }
LABEL_10:

    v7 = 0;
    goto LABEL_11;
  }
  if (!v15)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      v10 = "File exists in place of traces directory at path: %@. Please remove it.";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

+ (id)tracePathForTraceName:(id)a3 extension:(id)a4 directoryPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  +[MNFilePaths _validFilenameForTraceName:](MNFilePaths, "_validFilenameForTraceName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v7, 0) & 1) == 0)
  {
    v17 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v17);
    v13 = v17;
    if (v12)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "Couldn't create traces directory: %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_validFilenameForTraceName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[\x00/\\\\]+"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
