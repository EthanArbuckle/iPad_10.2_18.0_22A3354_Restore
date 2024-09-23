@implementation CNFileServices

+ (id)tmpDirLog
{
  if (tmpDirLog_cn_once_token_1 != -1)
    dispatch_once(&tmpDirLog_cn_once_token_1, &__block_literal_global_20);
  return (id)tmpDirLog_cn_once_object_1;
}

void __27__CNFileServices_tmpDirLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "temp-dir");
  v1 = (void *)tmpDirLog_cn_once_object_1;
  tmpDirLog_cn_once_object_1 = (uint64_t)v0;

}

+ (CNFileServices)sharedInstance
{
  if (sharedInstance_cn_once_token_2_0 != -1)
    dispatch_once(&sharedInstance_cn_once_token_2_0, &__block_literal_global_3_1);
  return (CNFileServices *)(id)sharedInstance_cn_once_object_2_0;
}

void __32__CNFileServices_sharedInstance__block_invoke()
{
  CNFileServices *v0;
  void *v1;

  v0 = objc_alloc_init(CNFileServices);
  v1 = (void *)sharedInstance_cn_once_object_2_0;
  sharedInstance_cn_once_object_2_0 = (uint64_t)v0;

}

- (int)errnoValue
{
  return *__error();
}

- (int)open:(const char *)a3 :(int)a4 :(unsigned __int16)a5
{
  return open(a3, a4, a5);
}

- (int)close:(int)a3
{
  return close(a3);
}

- (int)statfs:(const char *)a3 :(statfs *)a4
{
  return statfs(a3, a4);
}

- (int)fstatfs:(int)a3 :(statfs *)a4
{
  return fstatfs(a3, a4);
}

- (int)flock:(int)a3 :(int)a4
{
  return flock(a3, a4);
}

- (int)fcntl_flock:(int)a3 :(int)a4 :(flock *)a5
{
  return fcntl(a3, a4, a5);
}

- (id)temporaryDirectory
{
  void *v3;

  -[CNFileServices preferredTemporaryDirectory](self, "preferredTemporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CNFileServices bespokeTemporaryDirectory](self, "bespokeTemporaryDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[CNFileServices temporaryDirectoryOfLastResort](self, "temporaryDirectoryOfLastResort");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)secureTemporaryDirectory
{
  return -[CNFileServices secureTemporarySubdirectoryWithSubpathComponents:](self, "secureTemporarySubdirectoryWithSubpathComponents:", MEMORY[0x1E0C9AA60]);
}

- (id)secureTemporarySubdirectoryWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[CNFileServices secureTemporarySubdirectoryWithSubpathComponents:](self, "secureTemporarySubdirectoryWithSubpathComponents:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)secureTemporarySubdirectoryWithSubpathComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t v20[8];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNFileServices temporaryDirectory](self, "temporaryDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("TemporaryItems"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v12, "length"))
        {
          objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v12, 1);
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v21);
  v16 = v21;
  if ((v15 & 1) == 0
    && !+[CNFoundationError isFileAlreadyExistsError:](CNFoundationError, "isFileAlreadyExistsError:", v16))
  {
    objc_msgSend((id)objc_opt_class(), "tmpDirLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CNFileServices secureTemporarySubdirectoryWithSubpathComponents:].cold.1((uint64_t)v6, (uint64_t)v16, v17);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_18F80C000, v17, OS_LOG_TYPE_DEFAULT, "The action with a temporary URL will still be attempted, but the behavior is now undefined.", v20, 2u);
    }

  }
  v18 = v6;

  return v18;
}

- (id)preferredTemporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "tmpDirLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNFileServices preferredTemporaryDirectory].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_8;
  }
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "tmpDirLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNFileServices preferredTemporaryDirectory].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
LABEL_8:

    v4 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v4;
}

- (id)bespokeTemporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[8];
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tmpDirLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18F80C000, v6, OS_LOG_TYPE_INFO, "FileManager did not provide an item replacement directory", v8, 2u);
    }

  }
  return v4;
}

- (id)temporaryDirectoryOfLastResort
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/tmp"), 1);
}

- (void)secureTemporarySubdirectoryWithSubpathComponents:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18F80C000, log, OS_LOG_TYPE_ERROR, "Could not create secure temporary directory %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)preferredTemporaryDirectory
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "NSTemporaryDirectory() returned an empty string", a5, a6, a7, a8, 0);
}

@end
