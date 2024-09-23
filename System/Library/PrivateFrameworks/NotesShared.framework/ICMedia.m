@implementation ICMedia

- (id)mediaURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICMedia filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICMedia generationManager](self, "generationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICMedia generationManager](self, "generationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "generationURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMedia filename](self, "filename");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICMedia mediaFallbackURL](self, "mediaFallbackURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (ICAssetGenerationManager)generationManager
{
  void *v3;
  ICAssetGenerationManager *generationManager;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICAssetGenerationManager *v10;
  void *v11;
  ICAssetGenerationManager *v12;
  ICAssetGenerationManager *v13;
  void *v14;
  ICAssetGenerationManager *v15;

  -[ICMedia containerDirectoryURL](self, "containerDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    generationManager = self->_generationManager;
    if (!generationManager)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMedia mediaFallbackURL](self, "mediaFallbackURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_addNonNilObject:", v6);

      -[ICMedia encryptedMediaFallbackURL](self, "encryptedMediaFallbackURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_addNonNilObject:", v7);

      -[ICMedia mediaArchiveFallbackURL](self, "mediaArchiveFallbackURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_addNonNilObject:", v8);

      NSStringFromSelector(sel_generation);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [ICAssetGenerationManager alloc];
      -[ICMedia containerDirectoryURL](self, "containerDirectoryURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICAssetGenerationManager initWithObject:generationKeyPath:containerURL:](v10, "initWithObject:generationKeyPath:containerURL:", self, v9, v11);
      v13 = self->_generationManager;
      self->_generationManager = v12;

      v14 = (void *)objc_msgSend(v5, "copy");
      -[ICAssetGenerationManager setFallbackURLs:](self->_generationManager, "setFallbackURLs:", v14);

      generationManager = self->_generationManager;
    }
    v15 = generationManager;
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)mediaArchiveFallbackURL
{
  void *v2;
  void *v3;

  -[ICMedia mediaFallbackURL](self, "mediaFallbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("zip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)encryptedMediaFallbackURL
{
  void *v3;
  void *v4;
  void *v5;

  -[ICMedia containerDirectoryURL](self, "containerDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mediaFallbackURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICMedia filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICMedia containerDirectoryURL](self, "containerDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia filename](self, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)filename
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("filename"));
}

- (id)containerDirectoryURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICMedia identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ICMedia containerAccount](self, "containerAccount"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[ICMedia identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia containerAccount](self, "containerAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia containerDirectoryURLForMediaWithIdentifier:account:](ICMedia, "containerDirectoryURLForMediaWithIdentifier:account:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (ICAccount)containerAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ICMedia attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "account");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v7)
  {
    -[ICMedia placeholderAccount](self, "placeholderAccount");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[ICMedia managedObjectContext](self, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v12 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ICMedia containerAccount].cold.1(self, v7);

    }
  }
  -[ICMedia setPlaceholderAccount:](self, "setPlaceholderAccount:", v7);
  return (ICAccount *)v7;
}

- (void)setPlaceholderAccount:(id)a3
{
  objc_storeWeak((id *)&self->placeholderAccount, a3);
}

+ (id)containerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "mediaDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject awakeFromFetch](&v3, sel_awakeFromFetch);
  -[ICAssetGenerationManager updateCurrentGeneration](self->_generationManager, "updateCurrentGeneration");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationManager, 0);
  objc_destroyWeak((id *)&self->placeholderAccount);
}

- (BOOL)hasFile
{
  void *v3;
  void *v4;
  id *v5;
  uint64_t *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;

  if ((-[ICMedia isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
  {
    -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v12 = 0;
    v5 = (id *)&v12;
    v6 = &v12;
  }
  else
  {
    -[ICMedia mediaURL](self, "mediaURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v11 = 0;
    v5 = (id *)&v11;
    v6 = &v11;
  }
  v7 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", v6, v11, v12);
  v8 = *v5;

  if (v8 && objc_msgSend(v8, "code") != 260)
  {
    v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICMedia hasFile].cold.1();

  }
  return v7;
}

+ (void)purgeMediaFilesForIdentifiers:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v11 = v10;
    v20 = v6;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = v12;
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1C3B7AC74]();
        objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v16, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v12;
        objc_msgSend(v7, "removeItemAtURL:error:", v18, &v21);
        v12 = v21;

        if (v12 && objc_msgSend(v12, "code") != 4)
        {
          v19 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v18;
            v28 = 2112;
            v29 = v12;
            _os_log_error_impl(&dword_1BD918000, v19, OS_LOG_TYPE_ERROR, "failed to remove media directory at URL: %@, error: %@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v11);

    v6 = v20;
  }

}

- (void)accountWillChangeToAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia containerDirectoryURL](self, "containerDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia identifier](self, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v10 = 0;
LABEL_16:
    if (!v4)
      goto LABEL_18;
LABEL_17:
    -[ICMedia setPlaceholderAccount:](self, "setPlaceholderAccount:", v4);
    goto LABEL_18;
  }
  v8 = (void *)objc_opt_class();
  -[ICMedia identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerDirectoryURLForMediaWithIdentifier:account:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (!v6 || !v10)
    goto LABEL_16;
  if ((objc_msgSend(v6, "isEqual:", v10) & 1) != 0
    || (objc_msgSend(v6, "path"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v5, "fileExistsAtPath:", v11),
        v11,
        !v12))
  {
    v7 = 0;
    if (!v4)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v18);
  v14 = v18;

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICMedia accountWillChangeToAccount:].cold.2();

  }
  v17 = v14;
  objc_msgSend(v5, "moveItemAtURL:toURL:error:", v6, v10, &v17);
  v7 = v17;

  if (!v7)
    goto LABEL_16;
  v16 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ICMedia accountWillChangeToAccount:].cold.1();

  if (v4)
    goto LABEL_17;
LABEL_18:

}

- (void)prepareForDeletion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error removing media file directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setAttachment:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[ICMedia willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("attachment"));
  -[ICMedia setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("attachment"));
  -[ICMedia didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("attachment"));
  -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  v5 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICMedia setAttachment:].cold.1(v4, self);

}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

- (BOOL)isValid
{
  return (-[ICMedia needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) == 0
      && (-[ICMedia needsToBeFetchedFromCloud](self, "needsToBeFetchedFromCloud") & 1) == 0
      && -[ICMedia hasFile](self, "hasFile");
}

- (BOOL)isArchivedDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v15;
  void *v16;

  if (-[ICMedia hasFile](self, "hasFile"))
  {
    if ((-[ICMedia isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
      -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
    else
      -[ICMedia mediaURL](self, "mediaURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = *MEMORY[0x1E0C999D0];
    v15 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, v11, &v15);
    v12 = v16;
    v13 = v15;
    v10 = objc_msgSend(v12, "BOOLValue");

LABEL_12:
    return v10;
  }
  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICMedia attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CEC3F8];
      -[ICMedia attachment](self, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "typeUTI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeWithIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC4B8]);

    }
    else
    {
      v10 = 0;
    }

    goto LABEL_12;
  }
  return 0;
}

- (NSSet)urlsToConsiderForCloudBackup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia mediaURL](self, "mediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[ICMedia mediaArchiveURL](self, "mediaArchiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v9;
}

- (void)updateFlagToExcludeFromCloudBackup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICMedia urlsToConsiderForCloudBackup](self, "urlsToConsiderForCloudBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldExcludeFilesFromCloudBackup");

  if (v7)
  {
    if (-[ICMedia needsToBePushedToCloud](self, "needsToBePushedToCloud"))
      v8 = -[ICCloudSyncingObject shouldBeIgnoredForSync](self, "shouldBeIgnoredForSync");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "ic_updateFlagToExcludeFromBackup:", v8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)writeDataFromFileURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICMedia *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__ICMedia_writeDataFromFileURL_error___block_invoke;
  v9[3] = &unk_1E76C9DA0;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[ICMedia writeDataWithBlock:error:](self, "writeDataWithBlock:error:", v9, a4);

  return (char)a4;
}

uint64_t __38__ICMedia_writeDataFromFileURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v38 = 0;
  v7 = *MEMORY[0x1E0C999D0];
  v37 = 0;
  v8 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v38, v7, &v37);
  v9 = v38;
  v10 = v37;
  if (v8)
    v11 = objc_msgSend(v9, "BOOLValue");
  else
    v11 = 0;
  objc_msgSend(*(id *)(a1 + 40), "mediaArchiveURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0D64198]);
    objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithDestinationURL:baseURL:", v12, v14);

    objc_msgSend(v15, "setUsesCompression:", 0);
    v45[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v15, "writeURLs:error:", v16, &v36);
    v17 = v36;

    if (v17)
    {
      v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v40 = v19;
        v41 = 2112;
        v42 = v12;
        v43 = 2112;
        v44 = v17;
        _os_log_error_impl(&dword_1BD918000, v18, OS_LOG_TYPE_ERROR, "Failed to write file %@ to archive %@, error %@", buf, 0x20u);
      }
LABEL_11:

      v21 = 0;
      v10 = v17;
      goto LABEL_18;
    }
    v35 = 0;
    objc_msgSend(v15, "finish:", &v35);
    v20 = v35;
    if (v20)
    {
      v17 = v20;
      v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_2();
      goto LABEL_11;
    }

    v10 = 0;
  }
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("tempMedia"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copyItemAtURL:toURL:error:", *(_QWORD *)(a1 + 32), v15, a3);

  if ((v23 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v24, "moveItemAtURL:toURL:error:", v15, v5, a3);

    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __38__ICMedia_writeDataFromFileURL_error___block_invoke_18;
    v34[3] = &unk_1E76C73F8;
    v34[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v25, "performBlockAndWait:", v34);

  }
  else
  {
    v26 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_1(a3, v26, v27, v28, v29, v30, v31, v32);

    v21 = 0;
  }
LABEL_18:

  return v21;
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateChangeCountWithReason:", CFSTR("Wrote media data"));
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "updateChangeCountWithReason:", CFSTR("Wrote media data"));

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedImage:", 0);

  }
}

- (BOOL)writeDataFromAsset:(id)a3 accountID:(id)a4 isArchivedDirectory:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  char v46;
  id *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[ICMedia managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICMedia setPlaceholderAccount:](self, "setPlaceholderAccount:", v13);
  -[ICMedia generationManager](self, "generationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "beginGeneration");

  if ((_DWORD)v11)
  {
    if (v7)
      -[ICMedia mediaArchiveURL](self, "mediaArchiveURL");
    else
      -[ICMedia mediaURL](self, "mediaURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICMedia isPasswordProtected](self, "isPasswordProtected"))
    {
      -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    if (!v16)
    {
      v28 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:].cold.1(self, v28);

      -[ICMedia generationManager](self, "generationManager");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rollbackGeneration");
      goto LABEL_29;
    }
    objc_msgSend(v10, "fileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isEqual:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = 0;
      goto LABEL_11;
    }
    v47 = a6;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v31 = objc_msgSend(v29, "moveItemAtURL:toURL:error:", v30, v16, &v54);
    v20 = v54;

    if ((v31 & 1) != 0)
    {
      v21 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v20;
      v34 = objc_msgSend(v32, "linkItemAtURL:toURL:error:", v33, v16, &v53);
      v35 = v53;

      if ((v34 & 1) == 0)
      {
        v41 = v35;
        v42 = os_log_create("com.apple.notes", "Media");
        a6 = v47;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:].cold.3();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileURL");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v41;
        v46 = objc_msgSend(v43, "copyItemAtURL:toURL:error:", v44, v16, &v52);
        v20 = v52;

        if ((v46 & 1) != 0)
        {
LABEL_11:
          v21 = 1;
          if (v7)
            goto LABEL_12;
LABEL_22:
          -[ICMedia managedObjectContext](self, "managedObjectContext");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke_2;
          v48[3] = &unk_1E76C73F8;
          v48[4] = self;
          objc_msgSend(v36, "performBlockAndWait:", v48);

          if (!v20)
LABEL_23:
            v37 = (id)-[ICMedia ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICMediaDidLoadNotification"));
LABEL_24:
          if (a6)
            *a6 = objc_retainAutorelease(v20);
          -[ICMedia generationManager](self, "generationManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v21)
          {
            v15 = objc_msgSend(v38, "commitGeneration");

LABEL_30:
            goto LABEL_31;
          }
          objc_msgSend(v38, "rollbackGeneration");

LABEL_29:
          v15 = 0;
          goto LABEL_30;
        }
        v45 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:].cold.2();

        v21 = 0;
        if (!v7)
          goto LABEL_22;
LABEL_12:
        v22 = objc_alloc(MEMORY[0x1E0D64190]);
        objc_msgSend(v16, "URLByDeletingLastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithSourceURL:destinationURL:", v16, v23);

        v50 = v20;
        v51 = 0;
        objc_msgSend(v24, "unarchiveResultURLs:error:", &v51, &v50);
        v25 = v51;
        v26 = v50;

        -[ICMedia managedObjectContext](self, "managedObjectContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke;
        v49[3] = &unk_1E76C73F8;
        v49[4] = self;
        objc_msgSend(v27, "performBlockAndWait:", v49);

        v20 = v26;
        if (!v26)
          goto LABEL_23;
        goto LABEL_24;
      }
      v21 = 1;
      v20 = v35;
    }
    a6 = v47;
    if (!v7)
      goto LABEL_22;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_31:

  return v15;
}

void __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateFlagToExcludeFromCloudBackup");
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedImage:", 0);

  }
}

void __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateFlagToExcludeFromCloudBackup");
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedImage:", 0);

  }
}

- (void)writeDataFromItemProvider:(id)a3 checkForMarkupData:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id *v17;
  id *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  ICMedia *v27;
  id v28;
  id v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  id v33;
  BOOL v34;
  _QWORD aBlock[5];
  id v36;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke;
  aBlock[3] = &unk_1E76C9DC8;
  aBlock[4] = self;
  v11 = v9;
  v36 = v11;
  v12 = _Block_copy(aBlock);
  v13 = (void *)*MEMORY[0x1E0CEC618];
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "hasItemConformingToTypeIdentifier:", v14);

  if (v15)
  {
    objc_msgSend(v13, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_2;
    v31[3] = &unk_1E76C9E18;
    v17 = &v32;
    v31[4] = self;
    v32 = v11;
    v34 = a4;
    v18 = &v33;
    v33 = v12;
    v19 = v31;
LABEL_5:
    objc_msgSend(v8, "loadItemForTypeIdentifier:options:completionHandler:", v16, 0, v19, v23, v24, v25, v26, v27);

    goto LABEL_6;
  }
  v20 = (void *)*MEMORY[0x1E0CEC4A0];
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "hasItemConformingToTypeIdentifier:", v21);

  if (v22)
  {
    objc_msgSend(v20, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    v24 = 3221225472;
    v25 = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_4;
    v26 = &unk_1E76C9E18;
    v17 = &v28;
    v27 = self;
    v28 = v11;
    v30 = a4;
    v18 = &v29;
    v29 = v12;
    v19 = &v23;
    goto LABEL_5;
  }
LABEL_6:

}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attachmentModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateFileBasedAttributes");

    objc_msgSend(*(id *)(a1 + 32), "updateChangeCountWithReason:", CFSTR("Wrote media data"));
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentDidChange");

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreviewUpdateDate:", 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v8 = a3;
  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    objc_msgSend(v6, "startAccessingSecurityScopedResource");
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_3;
    v9[3] = &unk_1E76C9DF0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v12 = *(_BYTE *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v4 = objc_msgSend(v2, "writeDataFromFileURL:error:", v3, &v9);
  v5 = v9;
  if (v4 && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICMarkupUtilities hasPrivateImageMetadata:](ICMarkupUtilities, "hasPrivateImageMetadata:", v6);
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHasMarkupData:", v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v8 = a3;
  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_5;
    v9[3] = &unk_1E76C9DF0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v12 = *(_BYTE *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "writeData:error:", v3, &v8);
  v5 = v8;
  if (v4 && *(_BYTE *)(a1 + 56))
  {
    v6 = +[ICMarkupUtilities hasPrivateImageMetadata:](ICMarkupUtilities, "hasPrivateImageMetadata:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasMarkupData:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[ICMedia isArchivedDirectory](self, "isArchivedDirectory"))
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    -[ICMedia mediaArchiveURL](self, "mediaArchiveURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      -[ICMedia mediaTarArchiveURL](self, "mediaTarArchiveURL");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      objc_msgSend(v6, "dataWithContentsOfURL:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (!-[ICMedia isPasswordProtected](self, "isPasswordProtected"))
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      -[ICMedia mediaURL](self, "mediaURL");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[ICMedia decryptedData](self, "decryptedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)dataWithoutImageMarkupMetadata:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = a3;
  -[ICMedia data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICMedia attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasMarkupData");

    if (v7)
    {
      +[ICMarkupUtilities cleanImageMetadataFromData:](ICMarkupUtilities, "cleanImageMetadataFromData:", v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  return v5;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__ICMedia_writeData_error___block_invoke;
  v9[3] = &unk_1E76C9DA0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[ICMedia writeDataWithBlock:error:](self, "writeDataWithBlock:error:", v9, a4);

  return (char)a4;
}

uint64_t __27__ICMedia_writeData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mediaArchiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "isArchivedDirectory");
  if (v7)
    v8 = v6;
  else
    v8 = v5;
  v9 = v8;
  if (!v9)
  {
    v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __27__ICMedia_writeData_error___block_invoke_cold_1(v14);
    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "writeToURL:options:error:", v9, 1, a3) & 1) == 0)
  {
    v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __27__ICMedia_writeData_error___block_invoke_cold_2(a3, v14, v15, v16, v17, v18, v19, v20);
LABEL_12:

    v13 = 0;
    goto LABEL_15;
  }
  if (v7)
  {
    v10 = objc_alloc(MEMORY[0x1E0D64190]);
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithSourceURL:destinationURL:", v6, v11);

    v24 = 0;
    v13 = objc_msgSend(v12, "unarchiveResultURLs:error:", &v24, a3);

  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __27__ICMedia_writeData_error___block_invoke_32;
  v23[3] = &unk_1E76C73F8;
  v23[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v21, "performBlockAndWait:", v23);

LABEL_15:
  return v13;
}

void __27__ICMedia_writeData_error___block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateChangeCountWithReason:", CFSTR("Wrote media data"));
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "updateChangeCountWithReason:", CFSTR("Wrote media data"));

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedImage:", 0);

  }
}

- (BOOL)writeDataFromFileWrapper:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICMedia *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICMedia_writeDataFromFileWrapper_error___block_invoke;
  v9[3] = &unk_1E76C9DA0;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[ICMedia writeDataWithBlock:error:](self, "writeDataWithBlock:error:", v9, a4);

  return (char)a4;
}

uint64_t __42__ICMedia_writeDataFromFileWrapper_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  char v40;
  char v41;
  char v42;
  char v43;
  _QWORD v44[5];
  uint64_t v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "isDirectory");
  objc_msgSend(*(id *)(a1 + 40), "mediaArchiveURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v45 = 0;
    if (a3)
      v8 = (uint64_t *)a3;
    else
      v8 = &v45;
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("zip"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, v8);

    if (*v8)
    {
      v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_7();
      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 32), "writeToURL:options:originalContentsURL:error:", v15, 1, 0, v8);
    if (*v8)
    {
      v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_6();
      goto LABEL_23;
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64198]), "initWithDestinationURL:baseURL:", v16, v13);
    -[NSObject setUsesCompression:](v18, "setUsesCompression:", 0);
    v52[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject writeURLs:error:](v18, "writeURLs:error:", v28, v8);

    if (*v8)
    {
      v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = *v8;
        *(_DWORD *)buf = 138412802;
        v47 = v15;
        v48 = 2112;
        v49 = v16;
        v50 = 2112;
        v51 = v30;
        _os_log_error_impl(&dword_1BD918000, v29, OS_LOG_TYPE_ERROR, "Failed to write file %@ to archive %@, error %@", buf, 0x20u);
      }
      goto LABEL_22;
    }
    -[NSObject finish:](v18, "finish:", v8);
    if (*v8)
    {
      v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_5();
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v32, "moveItemAtURL:toURL:error:", v15, v5, v8);

    if ((v40 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = objc_msgSend(v33, "copyItemAtURL:toURL:error:", v15, v5, v8),
          v33,
          (v41 & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v34, "moveItemAtURL:toURL:error:", v16, v7, v8);

      if ((v42 & 1) != 0)
      {
LABEL_34:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "removeItemAtURL:error:", v13, v8);

        if (*v8)
        {
          v39 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_1();

          *v8 = 0;
        }

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v35, "copyItemAtURL:toURL:error:", v16, v7, v8);

      if ((v43 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "removeItemAtURL:error:", v16, v8);

        if (*v8)
        {
          v37 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_2();

          *v8 = 0;
        }
        goto LABEL_34;
      }
      v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
    }
    else
    {
      v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
LABEL_40:
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_3();
    }
LABEL_22:

LABEL_23:
LABEL_24:
    v20 = 0;
    goto LABEL_25;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "writeToURL:options:originalContentsURL:error:", v5, 1, 0, a3) & 1) == 0)
  {
    v21 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_8(a3, v21, v22, v23, v24, v25, v26, v27);

    goto LABEL_24;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_34;
  v44[3] = &unk_1E76C73F8;
  v44[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v19, "performBlockAndWait:", v44);

  v20 = 1;
LABEL_25:

  return v20;
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateChangeCountWithReason:", CFSTR("Wrote media data"));
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "updateChangeCountWithReason:", CFSTR("Wrote media data"));

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedImage:", 0);

  }
}

- (BOOL)writeDataWithBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, void *, id *);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  NSObject *v15;
  void *v16;
  char v17;
  os_log_t v18;
  char v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *, id *))a3;
  -[ICMedia deleteExportableMedia](self, "deleteExportableMedia");
  -[ICMedia generationManager](self, "generationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "beginGeneration");

  if (!v8)
  {
    v13 = 0;
    goto LABEL_11;
  }
  -[ICMedia mediaURL](self, "mediaURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || -[ICMedia isPasswordProtected](self, "isPasswordProtected") && !v10)
  {
    v11 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICMedia writeDataWithBlock:error:].cold.1(self, v11);

    v12 = 0;
    goto LABEL_8;
  }
  v15 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v16;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_INFO, "Writing media… {mediaID: %@, url: %@}", buf, 0x16u);

  }
  v30 = 0;
  v17 = v6[2](v6, v9, &v30);
  v12 = v30;
  if ((v17 & 1) != 0)
  {
    if (!-[ICMedia isPasswordProtected](self, "isPasswordProtected"))
    {
      v20 = v12;
      goto LABEL_28;
    }
    if (!-[ICCloudSyncingObject encryptFileFromURL:toURL:](self, "encryptFileFromURL:toURL:", v9, v10))
    {
      v27 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ICMedia writeDataWithBlock:error:].cold.3(self, v27);

      -[ICMedia generationManager](self, "generationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rollbackGeneration");

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (os_log_t)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    v19 = -[NSObject removeItemAtURL:error:](v18, "removeItemAtURL:error:", v9, &v29);
    v20 = v29;

    if ((v19 & 1) == 0)
    {
      v21 = objc_msgSend(v20, "code");

      if (v21 == 4)
      {
LABEL_28:
        -[ICMedia generationManager](self, "generationManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "commitGeneration");

        if (v25)
        {
          -[ICMedia updateFlagToExcludeFromCloudBackup](self, "updateFlagToExcludeFromCloudBackup");
          v26 = (id)-[ICMedia ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICMediaDidLoadNotification"));
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }
        v12 = v20;
        goto LABEL_9;
      }
      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ICMedia writeDataWithBlock:error:].cold.2(self, v18);

    }
    goto LABEL_28;
  }
  v22 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[ICMedia writeDataWithBlock:error:].cold.4(self, (uint64_t)v12, v22);

  -[ICMedia generationManager](self, "generationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rollbackGeneration");

  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a4 = v12;
    goto LABEL_9;
  }
LABEL_8:
  v13 = 0;
LABEL_9:

LABEL_11:
  return v13;
}

- (id)encryptedMediaURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICMedia identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICMedia generationManager](self, "generationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICMedia generationManager](self, "generationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "generationURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMedia identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICMedia encryptedMediaFallbackURL](self, "encryptedMediaFallbackURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)mediaTarArchiveURL
{
  void *v2;
  void *v3;

  -[ICMedia mediaURL](self, "mediaURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("tar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaArchiveURL
{
  void *v2;
  void *v3;

  -[ICMedia mediaURL](self, "mediaURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("zip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)exportableContainerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "exportableMediaDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)exportableContainerDirectoryURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICMedia identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ICMedia containerAccount](self, "containerAccount"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[ICMedia identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia containerAccount](self, "containerAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia exportableContainerDirectoryURLForMediaWithIdentifier:account:](ICMedia, "exportableContainerDirectoryURLForMediaWithIdentifier:account:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)exportableMediaURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICMedia filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICMedia exportableContainerDirectoryURL](self, "exportableContainerDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia filename](self, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)prepareExportableMediaURL
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasMarkupData");

  if (!v4)
  {
    -[ICMedia mediaURL](self, "mediaURL");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if ((-[ICMedia isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
    return 0;
  -[ICMedia exportableMediaURL](self, "exportableMediaURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0))
  {
    -[ICMedia mediaURL](self, "mediaURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v8 = *MEMORY[0x1E0C998D8];
    v31 = 0;
    v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v32, v8, &v31);
    v10 = v32;
    v11 = v31;
    if (v9)
    {
      v29 = 0;
      v30 = 0;
      v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v30, v8, &v29);
      v13 = v30;
      v14 = v29;

      if (v12)
      {
        v15 = objc_msgSend(v10, "compare:", v13) > 0;
      }
      else
      {
        v17 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ICMedia prepareExportableMediaURL].cold.2();

        v15 = 1;
      }
    }
    else
    {
      v16 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ICMedia prepareExportableMediaURL].cold.3();

      v13 = 0;
      v15 = 0;
      v14 = v11;
    }

  }
  else
  {
    v15 = 1;
  }
  -[ICMedia exportableContainerDirectoryURL](self, "exportableContainerDirectoryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && v15)
  {
    -[ICMedia dataWithoutImageMarkupMetadata:](self, "dataWithoutImageMarkupMetadata:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v21 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v28);
    v22 = v28;
    v23 = v22;
    if (v21)
    {
      v27 = v22;
      v24 = objc_msgSend(v19, "writeToURL:options:error:", v6, 1, &v27);
      v25 = v27;

      if ((v24 & 1) != 0)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {

      v25 = v23;
    }
    v26 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICMedia prepareExportableMediaURL].cold.1();

    v6 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return v6;
}

- (void)deleteExportableMedia
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Unable to remove exportable media file because %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICMedia managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__ICMedia_ic_loggingValues__block_invoke;
  v10[3] = &unk_1E76C73B0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __27__ICMedia_ic_loggingValues__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasFile");
  if ((v2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasFile"));
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("attachment"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isArchivedDirectory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, CFSTR("isArchivedDirectory"));

    if ((v2 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "mediaArchiveURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v2 & 1) == 0)
      return;
    v9 = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
    v10 = *(void **)(a1 + 32);
    if (v9)
      objc_msgSend(v10, "encryptedMediaURL");
    else
      objc_msgSend(v10, "mediaURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
  v16 = 0;
  objc_msgSend(v8, "getResourceValue:forKey:error:", &v16, *MEMORY[0x1E0C99998], 0);
  v12 = v16;
  if (v12)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("fileSize"));
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "hash"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, CFSTR("filename"));

}

- (void)markForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject markForDeletion](&v4, sel_markForDeletion);
  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markForDeletion");

}

- (void)unmarkForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject unmarkForDeletion](&v4, sel_unmarkForDeletion);
  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unmarkForDeletion");

}

- (id)cryptoStrategyProtocol
{
  return &unk_1EF5340D8;
}

- (id)decryptedData
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decryptedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentEncryptableObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICMedia attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICMedia account](self, "account");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (void)applyRandomCryptoGooIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject applyRandomCryptoGooIfNeeded](&v9, sel_applyRandomCryptoGooIfNeeded);
  -[ICMedia assetCryptoTag](self, "assetCryptoTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia setAssetCryptoTag:](self, "setAssetCryptoTag:", v5);

  }
  -[ICMedia assetCryptoInitializationVector](self, "assetCryptoInitializationVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia setAssetCryptoInitializationVector:](self, "setAssetCryptoInitializationVector:", v8);

  }
}

- (void)setFilename:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(a3, "ic_sanitizedFilenameString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v4 = v6;
  }
  else
  {
    -[ICMedia identifier](self, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v7 = v4;
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, CFSTR("filename"));

}

+ (id)keyPathsForValuesAffectingParentCloudObject
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("attachment.note"));
}

- (id)cloudAccount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICMedia account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICMedia attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)parentCloudObject
{
  void *v2;
  void *v3;

  -[ICMedia attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICMedia;
  objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingIsSharedViaICloud);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("self.attachment.note"));
  objc_msgSend(v3, "addObject:", CFSTR("self.attachment.note.isSharedViaICloud"));
  return v3;
}

- (ICAccount)placeholderAccount
{
  return (ICAccount *)objc_loadWeakRetained((id *)&self->placeholderAccount);
}

+ (id)newMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v8);

  objc_msgSend(v9, "setAccount:", v6);
  objc_msgSend(v6, "persistentStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assignToPersistentStore:", v10);
  return v9;
}

+ (id)newMediaWithIdentifier:(id)a3 attachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v8);

  objc_msgSend(v6, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assignToPersistentStore:", v11);

  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccount:", v12);

  objc_msgSend(v9, "setAttachment:", v6);
  objc_msgSend(v6, "setMedia:", v9);
  v13 = objc_msgSend(v6, "isPasswordProtected");

  objc_msgSend(v9, "setIsPasswordProtected:", v13);
  if (objc_msgSend(v9, "isPasswordProtected"))
    objc_msgSend(v9, "initializeCryptoProperties");
  return v9;
}

+ (id)newMediaWithAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v6, v7);

  if (v4)
  {
    objc_msgSend(v4, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistentStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assignToPersistentStore:", v11);

    objc_msgSend(v4, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccount:", v12);

    objc_msgSend(v8, "setAttachment:", v4);
    objc_msgSend(v4, "setMedia:", v8);
    objc_msgSend(v8, "setIsPasswordProtected:", objc_msgSend(v4, "isPasswordProtected"));
    if (objc_msgSend(v8, "isPasswordProtected"))
      objc_msgSend(v8, "initializeCryptoProperties");
  }

  return v8;
}

+ (id)newMediaWithAttachment:(id)a3 forData:(id)a4 filename:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  char v17;
  id v18;
  void *v19;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a1, "newMediaWithAttachment:", v10);
  if (!objc_msgSend(v11, "length"))
  {
    v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:].cold.2(v14);

    objc_msgSend(v13, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:].cold.1();

  objc_msgSend(v13, "setFilename:", v11);
  v17 = objc_msgSend(v13, "writeData:error:", v12, a6);

  if ((v17 & 1) == 0)
  {
    if (a6)
      v18 = *a6;
    else
      v18 = 0;
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forData:filename:error:]", 1, 1, CFSTR("Failed to write media to disk: %@"), v18);
    objc_msgSend(v10, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deleteObject:", v13);

    v13 = 0;
  }

  return v13;
}

+ (id)newMediaWithAttachment:(id)a3 forFileWrapper:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newMediaWithAttachment:", v8);
  +[ICNoteContext filenameFromFileWrapper:](ICNoteContext, "filenameFromFileWrapper:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    v12 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ICMedia(Management) newMediaWithAttachment:forFileWrapper:error:].cold.2();

    objc_msgSend(v10, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:].cold.1();

  objc_msgSend(v10, "setFilename:", v11);
  if ((objc_msgSend(v10, "writeDataFromFileWrapper:error:", v9, a5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forFileWrapper:error:]", 1, 1, CFSTR("Failed to write media to disk: %@"), *a5);
    objc_msgSend(v8, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteObject:", v10);

    v10 = 0;
  }

  return v10;
}

+ (id)newMediaWithAttachment:(id)a3 forURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newMediaWithAttachment:", v8);
  objc_msgSend(v9, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilename:", v11);

  v12 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ICMedia(Management) newMediaWithAttachment:forURL:error:].cold.1(v10, v12);

  if ((objc_msgSend(v10, "writeDataFromFileURL:error:", v9, a5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forURL:error:]", 1, 1, CFSTR("Failed to write media to disk: %@"), *a5);
    objc_msgSend(v8, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteObject:", v10);

    v10 = 0;
  }

  return v10;
}

+ (void)deleteMedia:(id)a3
{
  objc_msgSend(a3, "markForDeletion");
}

+ (void)undeleteMedia:(id)a3
{
  objc_msgSend(a3, "unmarkForDeletion");
}

+ (void)purgeMedia:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

+ (id)mediaWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier = %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)mediaIdentifiersForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("ICMedia"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("attachment.note.account == %@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E771AAD0);
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ICMedia(Management) mediaIdentifiersForAccount:].cold.1();
  }
  else
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

+ (void)enumerateMediaInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", 0, 0, 0, a3, a4, a5, a6);
}

+ (id)allMediaInContext:(id)a3
{
  return (id)objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", 0, a3);
}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (NSString)recordType
{
  return (NSString *)CFSTR("Media");
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  id v49;
  objc_super v50;

  v10 = a3;
  v11 = a4;
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0D641A0];
    -[ICMedia className](self, "className");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v13, v14);

LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  v50.receiver = self;
  v50.super_class = (Class)ICMedia;
  if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v50, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, v11, 0, a6))goto LABEL_11;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssetCryptoTag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia setAssetCryptoTag:](self, "setAssetCryptoTag:", v15);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssetCryptoInitializationVector"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia setAssetCryptoInitializationVector:](self, "setAssetCryptoInitializationVector:", v16);

  -[ICMedia assetCryptoTag](self, "assetCryptoTag");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ICMedia assetCryptoInitializationVector](self, "assetCryptoInitializationVector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[ICMedia setIsPasswordProtected:](self, "setIsPasswordProtected:", 1);
  }
  objc_msgSend(v10, "encryptedValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FilenameEncrypted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && (-[ICMedia isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
  {
    objc_msgSend(v21, "ic_stringValue");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Filename"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Filename"));
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v26 = (void *)v23;
    -[ICMedia setFilename:](self, "setFilename:", v23);
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FilenameExtension"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FilenameExtension"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia identifier](self, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingPathExtension:", v26);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia setFilename:](self, "setFilename:", v42);

    v43 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.1(v10, v43);

    -[ICCloudSyncingObject updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Corrected filename"));
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Asset"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fileURL");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_21;
  v29 = (void *)v28;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fileURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "fileExistsAtPath:", v32);

  if (v33)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IsArchivedDirectory"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v35 = -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:](self, "writeDataFromAsset:accountID:isArchivedDirectory:error:", v27, v11, objc_msgSend(v34, "BOOLValue"), &v49);
    v36 = v49;

    if (!v35)
    {
      v37 = (void *)MEMORY[0x1E0D641A0];
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 1, CFSTR("Error writing data from asset for %@: %@"), v38, v36);

    }
  }
  else
  {
LABEL_21:
    -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {

    }
    else if (!-[ICCloudSyncingObject isMergingUnappliedEncryptedRecord](self, "isMergingUnappliedEncryptedRecord"))
    {
      -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
    }
  }
  v44 = -[ICMedia markedForDeletion](self, "markedForDeletion");
  -[ICMedia attachment](self, "attachment");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "markedForDeletion");

  if (v44 != v46)
  {
    v47 = -[ICMedia markedForDeletion](self, "markedForDeletion");
    -[ICMedia attachment](self, "attachment");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setMarkedForDeletion:", v47);

  }
  v24 = 1;
LABEL_12:

  return v24;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICMedia className](self, "className", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICMedia(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v7, v8);

    return 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v32, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICMedia isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICMedia assetCryptoInitializationVector](self, "assetCryptoInitializationVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("AssetCryptoInitializationVector"));

    -[ICMedia assetCryptoTag](self, "assetCryptoTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("AssetCryptoTag"));

    -[ICMedia encryptedMediaURL](self, "encryptedMediaURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_18:

      return v10;
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("Asset"));
    -[ICMedia identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("FilenameEncrypted"));

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia mediaArchiveURL](self, "mediaArchiveURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "fileExistsAtPath:", v20);

  if (v21)
  {
    -[ICMedia mediaArchiveURL](self, "mediaArchiveURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_15;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsArchivedDirectory"));
LABEL_11:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("Asset"));
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMedia mediaURL](self, "mediaURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "fileExistsAtPath:", v26);

  if (v27)
  {
    -[ICMedia mediaURL](self, "mediaURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v28);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_15;
    goto LABEL_11;
  }
  v23 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[ICMedia className](self, "className");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia identifier](self, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v29;
    v35 = 2112;
    v36 = v30;
    _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEFAULT, "Trying to push an %@ with no media file: %@", buf, 0x16u);

  }
LABEL_15:

  -[ICMedia filename](self, "filename");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[ICMedia filename](self, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("FilenameEncrypted"));
    goto LABEL_17;
  }
  return v10;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(a3, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICMedia mediaWithIdentifier:context:](ICMedia, "mediaWithIdentifier:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[ICMedia newMediaWithIdentifier:account:](ICMedia, "newMediaWithIdentifier:account:", v11, v9);

  objc_msgSend(v12, "mergeCloudKitRecord:accountID:approach:", v8, v7, 0);
  objc_msgSend(v12, "setServerRecord:", v8);

  objc_msgSend(v12, "setInCloud:", 1);
  objc_msgSend(v12, "clearChangeCountWithReason:", CFSTR("Created object"));
  objc_msgSend(v12, "updateParentReferenceIfNecessary");

  return v12;
}

- (BOOL)needsToBePushedToCloud
{
  unsigned int v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  v3 = -[ICCloudSyncingObject needsToBePushedToCloud](&v7, sel_needsToBePushedToCloud);
  -[ICMedia attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && v3)
  {
    do
    {
      v5 = v4;
      v3 = objc_msgSend(v4, "isBeingEditedLocallyOnDevice");
      objc_msgSend(v4, "parentAttachment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v4 && !v3);
    LOBYTE(v3) = v3 ^ 1;
  }

  return v3;
}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject objectWasPushedToCloudWithOperation:serverRecord:](&v7, sel_objectWasPushedToCloudWithOperation_serverRecord_, a3, a4);
  -[ICMedia managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__ICMedia_CloudKit__objectWasPushedToCloudWithOperation_serverRecord___block_invoke;
  v6[3] = &unk_1E76C73F8;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

uint64_t __70__ICMedia_CloudKit__objectWasPushedToCloudWithOperation_serverRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFlagToExcludeFromCloudBackup");
}

- (void)fixBrokenReferences
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for %@", (uint8_t *)&v17, 0xCu);

  }
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "%@ attachment=%@", (uint8_t *)&v17, 0x16u);

  }
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMedia attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "%@ note=%@", (uint8_t *)&v17, 0x16u);

  }
  -[ICMedia attachment](self, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));

  -[ICMedia attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "note");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));

}

- (BOOL)hasAllMandatoryFields
{
  BOOL v3;
  void *v4;
  _BOOL4 v5;
  objc_super v7;

  if ((-[ICMedia isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[ICMedia filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") != 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  v5 = -[ICCloudSyncingObject hasAllMandatoryFields](&v7, sel_hasAllMandatoryFields);
  if (v5)
    LOBYTE(v5) = -[ICMedia hasFile](self, "hasFile") && v3;
  return v5;
}

- (BOOL)isInICloudAccount
{
  ICMedia *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICMedia managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ICMedia_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__ICMedia_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInICloudAccount");

}

- (void)deleteFromLocalDatabase
{
  +[ICMedia purgeMedia:](ICMedia, "purgeMedia:", self);
}

- (id)objectsToBeDeletedBeforeThisObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICMedia;
  -[ICCloudSyncingObject objectsToBeDeletedBeforeThisObject](&v8, sel_objectsToBeDeletedBeforeThisObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICMedia attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (void)accountWillChangeToAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error moving media files %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)accountWillChangeToAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error creating media directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setAttachment:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Setting attachment (%@) on media (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)hasFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error checking if media file exists: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error writing media file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to finish archive %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDataFromAsset:(void *)a1 accountID:(NSObject *)a2 isArchivedDirectory:error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Media URL is nil for media %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeDataFromAsset:accountID:isArchivedDirectory:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error writing data from asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDataFromAsset:accountID:isArchivedDirectory:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "Failed to move or link a media asset. Falling back to copy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __27__ICMedia_writeData_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Unable to write data for media; target URL is nil",
    v1,
    2u);
}

void __27__ICMedia_writeData_error___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error writing data for media: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to remove temporary directory %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to remove temporary archive file %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to copy directory attachment to file %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to finish archive %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to write file wrapper to temporary file %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_3(&dword_1BD918000, v0, v1, "Failed to create temporary directory %@, error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Could not write media file wrapper to URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Cannot construct media URL {mediaID: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Cannot remove decrypted media data {mediaID: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Cannot encrypt media data — rolling back generation… {mediaID: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeDataWithBlock:(NSObject *)a3 error:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  v7 = a2;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Cannot write media data — rolling back generation… {mediaID: %@, error: %@}", v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)containerAccount
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Couldn't find account for media %@, using default account %@ for container directory.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)prepareExportableMediaURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Unable to get media modification date because %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
