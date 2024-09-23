@implementation NSFileManager(CLSNSFileManagerExtensions)

- (uint64_t)createDirectoryIfNecessary:()CLSNSFileManagerExtensions
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  if (objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v4, &v12))
  {
    v5 = v12 != 0;
  }
  else
  {
    v11 = 0;
    v5 = objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
    v6 = v11;
    if ((v5 & 1) == 0)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "An error occured creating a directory at \"%@\": \"%@\", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (id)incrementalPathInDirectory:()CLSNSFileManagerExtensions withFilename:andExtension:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathExtension:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "fileExistsAtPath:", v12))
  {
    v13 = 2;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lu.%@"), v9, v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ++v13;
      v12 = v15;
    }
    while ((objc_msgSend(a1, "fileExistsAtPath:", v15) & 1) != 0);
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

+ (id)temporaryFilePathWithExtension:()CLSNSFileManagerExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "cls_generateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
