@implementation ML3DatabaseRecoveryOperation

- (ML3DatabaseRecoveryOperation)initWithDatabaseFilePath:(id)a3
{
  id v4;
  ML3DatabaseRecoveryOperation *v5;
  uint64_t v6;
  NSString *path;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseRecoveryOperation;
  v5 = -[ML3DatabaseRecoveryOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

  }
  return v5;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSString *path;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  NSError *error;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Starting recovery operation...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", self->_path) && MSVDeviceOSIsInternalInstall())
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Internal device. Backing up database file for analysis...", buf, 2u);
    }

    -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("bak"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    path = self->_path;
    v14 = 0;
    ML3CopyDatabase(path, v6, &v14);
    v8 = v14;
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138543362;
        v16 = v8;
        v11 = "[ML3DatabaseRecoveryOperation] Error backing up database file: %{public}@";
LABEL_12:
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      v11 = "[ML3DatabaseRecoveryOperation] Successfully backed up database file to %{public}@";
      goto LABEL_12;
    }

  }
  -[ML3DatabaseRecoveryOperation _recreateDatabaseWithCompletion:](self, "_recreateDatabaseWithCompletion:", &__block_literal_global_17373);

  v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = 0;
    _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Recovery operation complete. err=%{public}@", buf, 0xCu);
  }

  error = self->_error;
  self->_error = 0;

}

- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("NSSQLiteErrorDomain"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_lastCorruptionRestoreAttemptDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LastCorruptionRestoreAttempt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateLastCorruptionRestoreAttemptDate
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("LastCorruptionRestoreAttempt"));

}

- (void)_recreateDatabaseWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *path;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Asking service to recreate database...", buf, 2u);
  }

  +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ML3DatabaseRecoveryOperation__recreateDatabaseWithCompletion___block_invoke;
  v9[3] = &unk_1E5B64CC8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "recreateDatabaseAtPath:withCompletionHandler:", path, v9);

}

- (NSString)path
{
  return self->_path;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __64__ML3DatabaseRecoveryOperation__recreateDatabaseWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
      v10 = 138543362;
      v11 = v8;
      v9 = "[ML3DatabaseRecoveryOperation] Successfully recreated database at path %{public}@";
LABEL_6:
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    v10 = 138543362;
    v11 = v5;
    v9 = "[ML3DatabaseRecoveryOperation] Failed to recreate database. %{public}@";
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
}

@end
