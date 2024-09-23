@implementation GEOConfigRangeCheckEnabled

void ___GEOConfigRangeCheckEnabled_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isInternalInstall");

  if (v1)
  {
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("GEOConfigRangeClampDisabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

    if (v5)
    {
      _MergedGlobals_266 = 1;
      j__GEOGetUserDefaultsLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "!!WARNING!! \"%@\" found, GEOConfig Range Clamping has been disabled", (uint8_t *)&v7, 0xCu);
      }

    }
  }
}

@end
