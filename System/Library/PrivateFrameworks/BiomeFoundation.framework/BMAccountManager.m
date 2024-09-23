@implementation BMAccountManager

- (BMAccountManager)initWithUseCase:(id)a3
{
  __CFString *v4;
  BMAccountManager *v5;
  void *v6;
  uint64_t v7;
  BMFileManager *fileManager;
  objc_super v10;

  v4 = (__CFString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BMAccountManager;
  v5 = -[BMAccountManager init](&v10, sel_init);
  if (v5)
  {
    +[BMPaths sharedSyncDirectoryForDomain:](BMPaths, "sharedSyncDirectoryForDomain:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[BMPaths isTestPathOverridden](BMPaths, "isTestPathOverridden") || CFSTR("__na__") == v4)
    {
      +[BMFileManager fileManagerWithDirectAccessToDirectory:cachingOptions:](BMFileManager, "fileManagerWithDirectAccessToDirectory:cachingOptions:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[BMFileManager fileManagerWithMediatedAccessToDirectory:useCase:domain:user:](BMFileManager, "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v6, CFSTR("__legacy__"), 0, geteuid());
      v7 = objc_claimAutoreleasedReturnValue();
    }
    fileManager = v5->_fileManager;
    v5->_fileManager = (BMFileManager *)v7;

  }
  return v5;
}

- (id)_accountIdentifiers
{
  BMFileManager **p_fileManager;
  BMFileManager *fileManager;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  p_fileManager = &self->_fileManager;
  fileManager = self->_fileManager;
  -[BMFileManager directory](fileManager, "directory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[BMFileManager contentsOfDirectoryAtPath:error:](fileManager, "contentsOfDirectoryAtPath:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    __biome_log_for_category(11);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BMAccountManager _accountIdentifiers].cold.1((id *)p_fileManager, (uint64_t)v6, v8);

    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

BOOL __39__BMAccountManager__accountIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BMAccount verifyFormattedLikeIdentifier:](BMAccount, "verifyFormattedLikeIdentifier:", a2);
}

- (id)accounts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMAccount *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMAccountManager _accountIdentifiers](self, "_accountIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[BMAccount initWithIdentifier:]([BMAccount alloc], "initWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)deviceIdentifiersForAccount:(id)a3
{
  id v4;
  void *v5;
  BMAccountManager *v6;
  BMFileManager *fileManager;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BMFileManager *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __int128 v29;
  void *v30;
  void *v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = (void *)objc_opt_new();
  v30 = v4;
  +[BMPaths pathForSharedSyncWithAccount:streamType:domain:](BMPaths, "pathForSharedSyncWithAccount:streamType:domain:", v4, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  fileManager = self->_fileManager;
  v39 = 0;
  -[BMFileManager contentsOfDirectoryAtPath:error:](fileManager, "contentsOfDirectoryAtPath:error:", v5, &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  if (v9)
  {
    v10 = v9;
    __biome_log_for_category(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAccountManager deviceIdentifiersForAccount:].cold.1(v30, (uint64_t)v10, v11);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v36;
    *(_QWORD *)&v13 = 138412802;
    v29 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v5, "stringByAppendingPathComponent:", v17, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[BMStoreDirectory remoteDevices](BMStoreDirectory, "remoteDevices");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v6->_fileManager;
        v34 = 0;
        -[BMFileManager contentsOfDirectoryAtPath:error:](v21, "contentsOfDirectoryAtPath:error:", v20, &v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v34;
        if (v23)
        {
          v24 = v23;
          __biome_log_for_category(0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v30, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v41 = v31;
            v42 = 2114;
            v43 = v17;
            v44 = 2112;
            v45 = v24;
            _os_log_error_impl(&dword_1AEB31000, v25, OS_LOG_TYPE_ERROR, "Failed to retrieve device list for account identifier %@ stream %{public}@ with error: %@", buf, 0x20u);

          }
        }
        objc_msgSend(v22, "_pas_filteredArrayWithTest:", &__block_literal_global_6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObjectsFromArray:", v26);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v14);
  }

  objc_msgSend(v33, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

BOOL __48__BMAccountManager_deviceIdentifiersForAccount___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)_accountIdentifiers
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "directory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_FAULT, "Failed to enumerate accounts in path: %@ with error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

- (void)deviceIdentifiersForAccount:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve streams list for account identifier %@ with error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

@end
