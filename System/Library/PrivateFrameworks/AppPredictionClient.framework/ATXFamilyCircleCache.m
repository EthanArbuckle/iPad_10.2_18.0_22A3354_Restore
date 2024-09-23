@implementation ATXFamilyCircleCache

- (ATXFamilyCircleCache)init
{
  void *v3;
  void *v4;
  ATXFamilyCircleCache *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("familyCircleCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ATXFamilyCircleCache initWithCachePath:](self, "initWithCachePath:", v4);
  return v5;
}

- (ATXFamilyCircleCache)initWithCachePath:(id)a3
{
  id v4;
  ATXFamilyCircleCache *v5;
  uint64_t v6;
  NSString *path;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFamilyCircleCache;
  v5 = -[ATXFamilyCircleCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

  }
  return v5;
}

- (BOOL)hasiCloudFamily
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ATXFamilyCircleCache fetchFamilyCircle](self, "fetchFamilyCircle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "members");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "Fetched %ld members during iCloud family check", (uint8_t *)&v7, 0xCu);
  }

  return v4 != 0;
}

- (id)_requestUpdatedFamilyCircle
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend(v2, "setCachePolicy:", 0);
  v10 = 0;
  objc_msgSend(v2, "fetchFamilyCircleWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXFamilyCircleCache _requestUpdatedFamilyCircle].cold.1((uint64_t)v5, v7);

  }
  __atxlog_handle_home_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ATXFamilyCircleCache _requestUpdatedFamilyCircle]";
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s: Fetched iCloud family circle: %@", buf, 0x16u);
  }

  return v3;
}

- (id)_cache
{
  id v3;
  NSString *path;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CF94C0]);
  path = self->_path;
  __atxlog_handle_default();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCacheFilePath:loggingHandle:debugName:", path, v5, CFSTR("cached family circle"));

  return v6;
}

- (id)_fetchFamilyCircleFromCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ATXFamilyCircleCache _cache](self, "_cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v5, 0, 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ATXFamilyCircleCache _requestUpdatedFamilyCircle](self, "_requestUpdatedFamilyCircle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "storeSecureCodedObject:error:", v6, 0);
  }
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_requestUpdatedFamilyCircle
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXFamilyCircleCache _requestUpdatedFamilyCircle]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "%s: Error querying for iCloud family: %@", (uint8_t *)&v2, 0x16u);
}

@end
