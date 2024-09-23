@implementation NSFileManager(_QLTUtilities)

+ (void)_QLTRemoveTemporaryDirectoryAtURL:()_QLTUtilities
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v9 = objc_msgSend(v8, "removeItemAtURL:error:", v4, &v14);
    v10 = v14;

    _log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[NSFileManager(_QLTUtilities) _QLTRemoveTemporaryDirectoryAtURL:].cold.1(a2, (uint64_t)v4, v12);
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1AE3F5000, v12, OS_LOG_TYPE_ERROR, "%@ Could not remove temporary directory at url %@. %@", buf, 0x20u);

    }
  }

}

+ (void)_QLTRemoveTemporaryDirectoryAtURL:()_QLTUtilities .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1AE3F5000, a3, OS_LOG_TYPE_DEBUG, "%@ Removed temporary directory at url %@.", (uint8_t *)&v6, 0x16u);

}

@end
