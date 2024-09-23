@implementation EMPersistenceLayoutManager

void __51__EMPersistenceLayoutManager_baseMailDirectoryPath__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_nonContainerizedBaseMailDirectoryPathCreated:", &v9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)baseMailDirectoryPath_mailDirectory;
  baseMailDirectoryPath_mailDirectory = v1;

  if (v9)
  {
    v3 = open((const char *)objc_msgSend((id)baseMailDirectoryPath_mailDirectory, "fileSystemRepresentation"), 0);
    if (v3 < 0)
    {
      +[EMPersistenceLayoutManager log](EMPersistenceLayoutManager, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v11 = baseMailDirectoryPath_mailDirectory;
        _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "Could not open fd for %{public}@", buf, 0xCu);
      }

    }
    else
    {
      v4 = v3;
      v5 = fcntl(v3, 64, 4);
      if (v5)
      {
        v6 = v5;
        +[EMPersistenceLayoutManager log](EMPersistenceLayoutManager, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v11 = baseMailDirectoryPath_mailDirectory;
          v12 = 1024;
          v13 = v6;
          _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Could not set protection class on %{public}@: %d", buf, 0x12u);
        }

      }
      close(v4);
    }
  }
}

+ (id)_nonContainerizedBaseMailDirectoryPathCreated:(BOOL *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD);
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  EFNonContainerizedHomeDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Library"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Mail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMPersistenceLayoutManager.m"), 55, CFSTR("Unable to get mail directory"));

  }
  *a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, &v19);
  v11 = v19;

  if (v10)
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v11, "ef_match");
    v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13 = v12[2](v12, *MEMORY[0x1E0CB28A8], 516);

    if ((v13 & 1) == 0)
    {
      +[EMPersistenceLayoutManager log](EMPersistenceLayoutManager, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "ef_publicDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[EMPersistenceLayoutManager _nonContainerizedBaseMailDirectoryPathCreated:].cold.1(v15, buf, v14);
      }

    }
  }
  objc_msgSend(v8, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (NSURL)mailAccountDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "mailAccountDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (NSURL)mailDataDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "mailDataDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (NSString)baseMailDirectoryPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__EMPersistenceLayoutManager_baseMailDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (baseMailDirectoryPath_onceToken != -1)
    dispatch_once(&baseMailDirectoryPath_onceToken, block);
  return (NSString *)(id)baseMailDirectoryPath_mailDirectory;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EMPersistenceLayoutManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1)
    dispatch_once(&log_onceToken_31, block);
  return (OS_os_log *)(id)log_log_31;
}

void __33__EMPersistenceLayoutManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;

}

+ (NSURL)baseMailDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "baseMailDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (void)_nonContainerizedBaseMailDirectoryPathCreated:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Failed to create Mail directory:\n%{public}@", buf, 0xCu);

}

@end
