@implementation NSURL(MLTemporaryDirectory)

- (uint64_t)removeItemAndReturnError:()MLTemporaryDirectory
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AD6ED8]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "removeItemAtURL:error:", a1, &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to delete the temporary directory: %@. Error: %@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

+ (id)uniqueDirectoryURLInPath:()MLTemporaryDirectory
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AD6ED8]();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globallyUniqueString");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Failed to create URL from base directory %@ and the unique string %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v16);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory at: %@. Error: %@", buf, 0x16u);
    }

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v13 = v9;
LABEL_10:

  objc_autoreleasePoolPop(v4);
  return v13;
}

@end
