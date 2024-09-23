@implementation ATXModeFaceSuggestionsCache

- (id)cachedSuggestedFacesForModeUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ATXModeFaceSuggestionsCache _cacheForUUID:](self, "_cacheForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v9, 0, 432000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)evictCachedSuggestedFaces
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXModeFaceSuggestionsCache _suggestedFacesDirectoryURL](self, "_suggestedFacesDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (void)cacheSuggestedFaces:(id)a3 forModeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeFaceSuggestionsCache _suggestedFacesDirectoryURL](self, "_suggestedFacesDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

    -[ATXModeFaceSuggestionsCache _cacheForUUID:](self, "_cacheForUUID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v10, "storeSecureCodedObject:error:", v11, 0);

    __atxlog_handle_lock_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ATXModeFaceSuggestionsCache cacheSuggestedFaces:forModeUUID:].cold.1((uint64_t)v7, v12);

  }
}

- (id)_cacheForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[ATXModeFaceSuggestionsCache _suggestedFacesDirectoryURL](self, "_suggestedFacesDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_lock_screen();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithCacheFilePath:loggingHandle:debugName:", v9, v10, CFSTR("suggested mode faces"));

  return v11;
}

- (id)_suggestedFacesDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SuggestedModeFaces"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cacheSuggestedFaces:(uint64_t)a1 forModeUUID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "Caching mode suggestions to disk for: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
