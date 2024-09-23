@implementation NSURL(CLSNSURLExtensions)

+ (id)userCachesDirectoryURL:()CLSNSURLExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v27 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      v9 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processName");
      v9 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("com.apple.mediaminingkit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v26 = 0;
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v16, &v26);

      if ((v17 & 1) != 0)
      {
        if (!v26)
        {
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v15;
            _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Caches directory at %@ is not a directory!", buf, 0xCu);
          }
          v7 = 0;
LABEL_17:

          v10 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        v25 = 0;
        objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v25);
        v20 = v25;
        if (v20)
        {
          v7 = v20;
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "localizedDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v29 = v15;
            v30 = 2112;
            v31 = v24;
            _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Could not create caches directory at %@. \"%@\", buf, 0x16u);

          }
          goto LABEL_17;
        }
      }
    }
    v10 = v15;
    v7 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v23;
    _os_log_error_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_ERROR, "Could not get caches directory. \"%@\", buf, 0xCu);

  }
  v10 = 0;
LABEL_20:

  return v10;
}

@end
