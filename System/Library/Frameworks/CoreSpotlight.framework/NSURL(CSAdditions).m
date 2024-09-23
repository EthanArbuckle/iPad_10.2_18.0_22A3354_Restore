@implementation NSURL(CSAdditions)

- (uint64_t)cs_isInMobileDocuments
{
  uint64_t v1;
  char v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  id v9;

  v9 = 0;
  v1 = *MEMORY[0x1E0C99A38];
  v8 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v9, v1, &v8);
  v3 = v9;
  v4 = v8;
  if ((v2 & 1) == 0)
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSURL(CSAdditions) cs_isInMobileDocuments].cold.1((uint64_t)v4, v5);

  }
  v6 = objc_msgSend(v3, "BOOLValue");

  return v6;
}

- (uint64_t)cs_addDocumentTracking
{
  const char *v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  stat v10;

  memset(&v10, 0, sizeof(v10));
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  getpid();
  if (!sandbox_check())
  {
    v4 = open(v1, 256, v1);
    if (v4 < 0)
    {
      v7 = *__error();
      if (v7 != 2)
      {
        logForCSLogCategoryDefault();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[NSURL(CSAdditions) cs_addDocumentTracking].cold.1((uint64_t)v1, v7, v8);

      }
      return 0;
    }
    v5 = v4;
    if (fstat(v4, &v10))
    {
      logForCSLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NSURL(CSAdditions) cs_addDocumentTracking].cold.3();
    }
    else
    {
      if ((v10.st_flags & 0x40) != 0 || !fchflags(v5, v10.st_flags | 0x40))
      {
        v3 = 1;
        goto LABEL_20;
      }
      logForCSLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NSURL(CSAdditions) cs_addDocumentTracking].cold.2();
    }

    v3 = 0;
LABEL_20:
    close(v5);
    return v3;
  }
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[NSURL(CSAdditions) cs_addDocumentTracking].cold.4((uint64_t)v1, v2);

  return 0;
}

- (void)cs_isInMobileDocuments
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "Couldn't get value for NSURLIsUbiquitousItemKey, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)cs_addDocumentTracking
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "sandbox_check for \"file-write-flags\" failed at \"%s\", (uint8_t *)&v2, 0xCu);
}

@end
