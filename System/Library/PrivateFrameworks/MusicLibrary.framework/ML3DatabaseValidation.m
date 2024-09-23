@implementation ML3DatabaseValidation

- (ML3DatabaseValidation)initWithLibrary:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  ML3DatabaseValidation *v12;
  ML3DatabaseValidation *v13;
  uint64_t v14;
  id completionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ML3DatabaseValidation;
  v12 = -[ML3DatabaseValidation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_truncateBeforeValidating = 0;
    v14 = objc_msgSend(v11, "copy");
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v14;

  }
  return v13;
}

- (void)runValidation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  _BOOL8 v9;
  id v10;
  NSObject *v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseValidation library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseValidation delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[ML3DatabaseValidation truncateBeforeValidating](self, "truncateBeforeValidating");
LABEL_8:
    if (!-[ML3DatabaseValidation truncateBeforeValidating](self, "truncateBeforeValidating"))
      goto LABEL_39;
    v23 = 0;
    v9 = -[ML3DatabaseValidation _truncateDatabaseFileForLibrary:withError:](self, "_truncateDatabaseFileForLibrary:withError:", v3, &v23);
    v10 = v23;
    if (!v10 && v9)
      goto LABEL_39;
    v8 = v10;
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Truncation failed with error=%{public}@", buf, 0xCu);
    }

    if (!v8)
    {
LABEL_39:
      v12 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "databasePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v13;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Starting validation at path=%{public}@", buf, 0xCu);

      }
      v22 = 0;
      v14 = -[ML3DatabaseValidation _validateLibraryDatabaseIfNecessary:withError:](self, "_validateLibraryDatabaseIfNecessary:withError:", v3, &v22);
      v8 = v22;
      v9 = v14;
      if (!v8)
        goto LABEL_32;
    }
    if (objc_msgSend(v8, "code") == 3 && MSVDeviceOSIsInternalInstall())
    {
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "Device is running an internal install. Asking user for permission to rebuild.", buf, 2u);
      }

      v17 = -[ML3DatabaseValidation _internalUserAgreesToRebuildUnmigratableDatabase](self, "_internalUserAgreesToRebuildUnmigratableDatabase");
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "User agrees to rebuild. Deleting database and re-attempting validation.", buf, 2u);
        }

        objc_msgSend(v3, "databaseConnectionAllowingWrites:withBlock:", 1, &__block_literal_global_7386);
        v21 = 0;
        v9 = -[ML3DatabaseValidation _validateLibraryDatabaseIfNecessary:withError:](self, "_validateLibraryDatabaseIfNecessary:withError:", v3, &v21);
        v8 = v21;
        goto LABEL_32;
      }
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "User did not want to rebuild database. Preparing for nuclear meltdown.", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v8, "domain");
      v18 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0CB28A8])
        && objc_msgSend(v8, "code") == 513)
      {
        -[ML3DatabaseValidation _logDatabasePathDirectoryAttributes](self, "_logDatabasePathDirectoryAttributes");
      }
    }

LABEL_32:
    -[ML3DatabaseValidation completionHandler](self, "completionHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, id))v20)[2](v20, v9, v8);

    goto LABEL_33;
  }
  v6 = objc_msgSend(v4, "shouldValidateDatabaseForLibrary:", v3);
  if (-[ML3DatabaseValidation truncateBeforeValidating](self, "truncateBeforeValidating") || (v6 & 1) != 0)
    goto LABEL_8;
  v7 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Database already validated. Returning immediately.", buf, 2u);
  }

  -[ML3DatabaseValidation completionHandler](self, "completionHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
LABEL_33:

}

- (BOOL)_truncateDatabaseFileForLibrary:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "databasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "*** Truncating database files at path: %{public}@ ***", (uint8_t *)&v18, 0xCu);

  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Closing all local database connections...", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(v5, "connectionPool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closeAllConnections");
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Notifying other clients about database deletion...", (uint8_t *)&v18, 2u);
  }

  notify_post((const char *)objc_msgSend(CFSTR("MLMediaLibraryWillDeleteDatabaseNotification"), "UTF8String"));
  sleep(2u);
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Performing truncation...", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(v5, "databasePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = ML3TruncateDatabase(v12, 1);

  v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Truncation successful", (uint8_t *)&v18, 2u);
    }

    v16 = 0;
    if (!a4)
      goto LABEL_18;
LABEL_17:
    *a4 = objc_retainAutorelease(v16);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Failed to truncate database files.", (uint8_t *)&v18, 2u);
  }

  +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 301, CFSTR("failed to truncate database files"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    goto LABEL_17;
LABEL_18:

  return v13;
}

- (BOOL)_validateLibraryDatabaseIfNecessary:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  _BYTE v34[10];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke;
  v21[3] = &unk_1E5B62408;
  v23 = &v29;
  v8 = v6;
  v22 = v8;
  v24 = &v25;
  objc_msgSend(v8, "databaseConnectionAllowingWrites:withBlock:", 0, v21);
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v30 + 24);
    v11 = *((unsigned __int8 *)v26 + 24);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v34 = v10;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v11;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "validateLibraryDatabaseIfNecessary requiresNonSchemaUpdates=%{BOOL}u, requiresSchemaOnlyUpdates=%{BOOL}u", buf, 0xEu);
  }

  if (*((_BYTE *)v30 + 24))
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "databasePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v34 = v13;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Database requires preprocessing before schema updates for library at path %{public}@", buf, 0xCu);

    }
    v14 = -[ML3DatabaseValidation _performDatabasePreprocessingWithLibrary:error:](self, "_performDatabasePreprocessingWithLibrary:error:", v8, a4);
  }
  else
  {
    if (!*((_BYTE *)v26 + 24))
      goto LABEL_12;
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "databasePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v34 = v16;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Database requires schema upgrades for library at path %{public}@", buf, 0xCu);

    }
    v14 = -[ML3DatabaseValidation _performSchemaUpgradeWithLibrary:error:](self, "_performSchemaUpgradeWithLibrary:error:", v8, a4);
  }
  if (!v14)
  {
    v17 = 0;
    goto LABEL_16;
  }
LABEL_12:
  if ((objc_msgSend(v8, "isHomeSharingLibrary") & 1) == 0)
  {
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke_12;
    v19[3] = &unk_1E5B65F08;
    v20 = v8;
    objc_msgSend(v20, "databaseConnectionAllowingWrites:withBlock:", 1, v19);

  }
  v17 = 1;
LABEL_16:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (BOOL)_performSchemaUpgradeWithLibrary:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "databasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Upgrading schema for library at path %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v8 = objc_msgSend(v5, "coerceValidDatabaseWithError:", a4);

  return v8;
}

- (BOOL)_performDatabasePreprocessingWithLibrary:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "databasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Preprocessing database for library at path %{public}@", buf, 0xCu);

  }
  v8 = objc_msgSend(v5, "coerceValidDatabaseWithError:", a4);
  *((_BYTE *)v15 + 24) = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__ML3DatabaseValidation__performDatabasePreprocessingWithLibrary_error___block_invoke;
    v11[3] = &unk_1E5B62430;
    v13 = &v14;
    v12 = v5;
    objc_msgSend(v12, "performDatabaseTransactionWithBlock:", v11);

    v9 = *((_BYTE *)v15 + 24) != 0;
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)_internalUserAgreesToRebuildUnmigratableDatabase
{
  id v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  char v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (ML3IsProcessRunning(CFSTR("com.apple.SpringBoard")) && !ML3IsProcessRunning(CFSTR("com.apple.datamigrator")))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D4D100]);
    objc_msgSend(v2, "setAlertHeader:", CFSTR("Unmigratable Media Library"));
    objc_msgSend(v2, "setAlertMessage:", CFSTR("The media library service has detected that this device has been downgraded from a newer operating system version. The service does not support migration back to previous versions.\n\nPlease either erase-install the desired version of the operating system, or select the option to let the service rebuild your media library database. This WILL erase your media library on this device.\n\n[This dialog is shown for internal users only.]"));
    objc_msgSend(v2, "setDefaultButtonTitle:", CFSTR("Rebuild Library"));
    objc_msgSend(v2, "setAlternateButtonTitle:", CFSTR("Ignore"));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0F8]), "initWithOptions:", v2);
    v4 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__ML3DatabaseValidation__internalUserAgreesToRebuildUnmigratableDatabase__block_invoke;
    v8[3] = &unk_1E5B62458;
    v10 = &v11;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "presentWithCompletion:", v8);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_logDatabasePathDirectoryAttributes
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __int128 v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseValidation library](self, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MLMobileUserHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Media"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", v5))
  {
    *(_QWORD *)&v7 = 138543362;
    v17 = v7;
    v8 = v6;
    do
    {
      v9 = objc_msgSend(v8, "isEqualToString:", v5, v17);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(v12, "attributesOfItemAtPath:error:", v8, &v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v18;

        v15 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v20 = v13;
          v21 = 2114;
          v22 = v14;
          v23 = 2114;
          v24 = v8;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "finished loading fileSystemAttributes=%{public}@ with error=%{public}@ for path=%{public}@", buf, 0x20u);
        }

      }
      else
      {
        v14 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          v20 = v8;
          _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Directory does not exist at path %{public}@", buf, 0xCu);
        }
      }

      objc_msgSend(v8, "stringByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v6;
    }
    while ((v9 & 1) == 0);
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "database at %{public}@ is not a subdirectory of %{public}@", buf, 0x16u);
    }

  }
}

- (BOOL)truncateBeforeValidating
{
  return self->_truncateBeforeValidating;
}

- (void)setTruncateBeforeValidating:(BOOL)a3
{
  self->_truncateBeforeValidating = a3;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (ML3DatabaseValidationDelegate)delegate
{
  return (ML3DatabaseValidationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_library, 0);
}

intptr_t __73__ML3DatabaseValidation__internalUserAgreesToRebuildUnmigratableDatabase__block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "buttonIdentifier") == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __72__ML3DatabaseValidation__performDatabasePreprocessingWithLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;
  __int16 v11;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "updateSortMap");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v11 = 0;
    v6 = "[Preprocessing] Failed to update sort map.";
    v7 = (uint8_t *)&v11;
LABEL_11:
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    goto LABEL_12;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "createIndexes");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v10 = 0;
    v6 = "[Preprocessing] Failed to create indexes.";
    v7 = (uint8_t *)&v10;
    goto LABEL_11;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "updateSystemPlaylistNamesForCurrentLanguageUsingConnection:", v3);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      v6 = "[Preprocessing] Failed to update system playlist names for current language.";
      v7 = (uint8_t *)&v9;
      goto LABEL_11;
    }
LABEL_12:

    v4 = 0;
    goto LABEL_13;
  }
  v4 = 1;
LABEL_13:

  return v4;
}

void __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "requiresNonSchemaUpdatesOnConnection:", v4);
  LOBYTE(v3) = objc_msgSend(*(id *)(a1 + 32), "requiresSchemaOnlyUpdatesOnConnection:", v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v3;
}

void __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "validateSortMapUnicodeVersionOnConnection:", v3);
  objc_msgSend(v3, "executeUpdate:", CFSTR("DELETE FROM entity_revision WHERE entity_pid=0"));

}

uint64_t __38__ML3DatabaseValidation_runValidation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteDatabase");
}

@end
