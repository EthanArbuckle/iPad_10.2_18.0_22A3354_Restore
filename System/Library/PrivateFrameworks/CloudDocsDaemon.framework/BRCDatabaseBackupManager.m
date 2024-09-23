@implementation BRCDatabaseBackupManager

- (BRCDatabaseBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  id v7;
  id v8;
  BRCDatabaseBackupManager *v9;
  BRCDatabaseBackupManager *v10;
  uint64_t v11;
  NSURL *destinationDirectory;
  void *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCDatabaseBackupManager;
  v9 = -[BRCDatabaseBackupManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userURL, a3);
    objc_storeStrong((id *)&v10->_outputUserURL, a4);
    -[BRCDatabaseBackupManager desiredBackupDataDirectoryForUserURL:](v10, "desiredBackupDataDirectoryForUserURL:", v10->_outputUserURL);
    v11 = objc_claimAutoreleasedReturnValue();
    destinationDirectory = v10->_destinationDirectory;
    v10->_destinationDirectory = (NSURL *)v11;

    if (!v10->_destinationDirectory)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_INFO, "[INFO] ~/Library/Application Support/CloudDocs/session does not exist. No need to back up.%@", buf, 0xCu);
      }

    }
  }

  return v10;
}

- (void)backUpWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  char v20;
  BRCDatabaseBackupStorage *v21;
  void *v22;
  BRCDatabaseBackupStorage *v23;
  NSURL *userURL;
  BRCDatabaseBackupStorage *v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  BRCDatabaseBackupStorage *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "fileExistsAtPath:", v8);

    if (v9)
    {
      -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v11 = objc_msgSend(v6, "removeItemAtURL:error:", v10, &v38);
      v12 = v38;

      if ((v11 & 1) == 0)
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        {
          -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v40 = v16;
          v41 = 2112;
          v42 = v12;
          v43 = 2112;
          v44 = v13;
          v17 = "[ERROR] Unable to delete existing destination directory at %@: %@%@";
LABEL_20:
          _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, v17, buf, 0x20u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v12 = 0;
    }
    v18 = v12;
    -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v12;
    v20 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 0, 0, &v37);
    v12 = v37;

    if ((v20 & 1) != 0)
    {
      v21 = [BRCDatabaseBackupStorage alloc];
      -[BRCDatabaseBackupManager databaseURL](self, "databaseURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BRCDatabaseBackupStorage initWithDatabaseURL:](v21, "initWithDatabaseURL:", v22);

      userURL = self->_userURL;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke;
      v35[3] = &unk_1E87607B0;
      v25 = v23;
      v36 = v25;
      v34 = v12;
      v26 = -[BRCDatabaseBackupManager enumerateRootURL:usingBlock:error:](self, "enumerateRootURL:usingBlock:error:", userURL, v35, &v34);
      v27 = v34;

      -[BRCDatabaseBackupStorage flushAndClose](v25, "flushAndClose");
      -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v27;
      BRCRecursivelyChangeOwnerAndGroupToMobile(v28, &v33);
      v12 = v33;

      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v31;
        v41 = 2112;
        v42 = v12;
        v43 = 2112;
        v44 = v29;
        _os_log_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] Calling completion block with URL: %@, error: %@%@", buf, 0x20u);

      }
      if (v26)
      {
        -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v32, 0);

      }
      else
      {
        ((void (**)(id, void *, id))v4)[2](v4, 0, v12);
      }

      goto LABEL_17;
    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v16;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v13;
      v17 = "[ERROR] Could not create destination directory %@: %@%@";
      goto LABEL_20;
    }
LABEL_14:

    ((void (**)(id, void *, id))v4)[2](v4, 0, v12);
LABEL_17:

    goto LABEL_18;
  }
  v4[2](v4, 0, 0);
LABEL_18:

}

void __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v13;
  id v14;
  id v15;
  BRCDatabaseBackupRecord *v16;
  void *v17;
  NSObject *v18;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = -[BRCDatabaseBackupRecord initWithRelativePath:fileID:docID:genCount:isDirectory:]([BRCDatabaseBackupRecord alloc], "initWithRelativePath:fileID:docID:genCount:isDirectory:", v15, v14, v13, a7, a8);

  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "addRecord:", v16);
}

- (id)desiredBackupDataDirectoryForUserURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Application Support/CloudDocs"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("session"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("backup"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSURL)databaseURL
{
  void *v2;
  void *v3;

  -[BRCDatabaseBackupManager destinationDirectory](self, "destinationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("backup_manifest.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSArray)urlPropertiesToFetch
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9AC80];
  v5[0] = *MEMORY[0x1E0C998C8];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C999A8];
  v5[2] = *MEMORY[0x1E0C998F8];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)enumerateRootURL:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  LOBYTE(v10) = 1;
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Mobile Documents/"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v22 = a5;
    v15 = 0;
    v16 = *(_QWORD *)v26;
LABEL_3:
    v17 = 0;
    v18 = v15;
    while (1)
    {
      if (*(_QWORD *)v26 != v16)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
      v20 = (void *)MEMORY[0x1D17A6BE8]();
      v24 = v18;
      v10 = -[BRCDatabaseBackupManager enumerateURL:rootURL:usingBlock:error:](self, "enumerateURL:rootURL:usingBlock:error:", v19, v8, v9, &v24);
      v15 = v24;

      objc_autoreleasePoolPop(v20);
      if (!v10)
        break;
      ++v17;
      v18 = v15;
      if (v14 == v17)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
          goto LABEL_3;
        LOBYTE(v10) = 1;
        break;
      }
    }
    a5 = v22;
  }
  else
  {
    v15 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v10;
}

- (BOOL)enumerateURL:(id)a3 rootURL:(id)a4 usingBlock:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t i;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v39;
  NSObject *v40;
  char v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (**v50)(id, _QWORD, void *, NSObject *, void *, void *, uint64_t, uint64_t);
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  id v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  NSObject *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v50 = (void (**)(id, _QWORD, void *, NSObject *, void *, void *, uint64_t, uint64_t))a5;
  if (!v11)
  {
    brc_bread_crumbs();
    v51 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupManager enumerateURL:rootURL:usingBlock:error:].cold.1((uint64_t)v51, v23);
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v14 & 1) == 0)
  {
    brc_bread_crumbs();
    v51 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      -[BRCDatabaseBackupManager enumerateURL:rootURL:usingBlock:error:].cold.2(v11, (uint64_t)v51, v23);
LABEL_25:
    v16 = 1;
    goto LABEL_26;
  }
  v64 = 0;
  v15 = *MEMORY[0x1E0C998C8];
  v63 = 0;
  v49 = v15;
  v16 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v64);
  v51 = v64;
  v17 = 0;
  if ((v16 & 1) != 0)
  {
    -[BRCDatabaseBackupManager urlPropertiesToFetch](self, "urlPropertiesToFetch");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v18;
    objc_msgSend(v19, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v18, 2, &__block_literal_global_16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v21 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v10;
      v68 = 2112;
      v69 = v21;
      _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_INFO, "[INFO] Enumarating URL: %@%@", buf, 0x16u);
    }
    v41 = v16;
    v42 = v11;
    v43 = v10;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v20;
    v23 = v17;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v54)
    {
      v52 = *(_QWORD *)v60;
      v48 = *MEMORY[0x1E0C9AC80];
      v47 = *MEMORY[0x1E0C998F8];
      v46 = *MEMORY[0x1E0C999A8];
      v45 = *MEMORY[0x1E0C999D0];
      do
      {
        for (i = 0; i != v54; ++i)
        {
          v25 = v23;
          if (*(_QWORD *)v60 != v52)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x1D17A6BE8]();
          v58 = v23;
          objc_msgSend(v26, "resourceValuesForKeys:error:", v53, &v58);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v58;

          if (v28)
          {
            v55 = v26;
            v57 = v23;
            objc_msgSend(v28, "objectForKeyedSubscript:", v49);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "substringFromIndex:", objc_msgSend(v51, "length") + 1);
            v30 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v48);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v47);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v46);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            v56 = v27;
            if (v33)
              v35 = BRCGenerationCountFromData(v33);
            else
              v35 = 0;
            objc_msgSend(v28, "objectForKeyedSubscript:", v45);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "BOOLValue");

            ((void (**)(id, void *, void *, NSObject *, void *, void *, uint64_t, uint64_t))v50)[2](v50, v55, v29, v30, v31, v32, v35, v37);
            v27 = v56;
            v23 = v57;
          }
          else
          {
            brc_bread_crumbs();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              v67 = v26;
              v68 = 2112;
              v69 = v23;
              v70 = 2112;
              v71 = v29;
              _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] Failed to fetch resource values for %@. Error: %@%@", buf, 0x20u);
            }
          }

          objc_autoreleasePoolPop(v27);
        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v54);
    }

    v11 = v42;
    v10 = v43;
    v16 = v41;
  }
  else
  {
    brc_bread_crumbs();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    v23 = v17;
    if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v67 = v11;
      v68 = 2112;
      v69 = v17;
      v70 = 2112;
      v71 = v39;
      _os_log_error_impl(&dword_1CBD43000, v40, (os_log_type_t)0x90u, "[ERROR] Could not get the canonical path for the root URL %@. Error: %@%@", buf, 0x20u);
    }

    if (a6)
    {
      v23 = objc_retainAutorelease(v17);
      *a6 = v23;
    }
  }
LABEL_26:

  return v16;
}

uint64_t __66__BRCDatabaseBackupManager_enumerateURL_rootURL_usingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] Enumeration error: %@. Error: %@%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)cleanOnDisk
{
  void *v3;
  NSURL *destinationDirectory;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  destinationDirectory = self->_destinationDirectory;
  v10 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", destinationDirectory, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      -[NSURL path](self->_destinationDirectory, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to remove directory %@: %@%@", buf, 0x20u);

    }
  }

}

- (NSURL)userURL
{
  return self->_userURL;
}

- (void)setUserURL:(id)a3
{
  objc_storeStrong((id *)&self->_userURL, a3);
}

- (NSURL)outputUserURL
{
  return self->_outputUserURL;
}

- (void)setOutputUserURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputUserURL, a3);
}

- (NSURL)destinationDirectory
{
  return self->_destinationDirectory;
}

- (void)setDestinationDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_outputUserURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
}

void __54__BRCDatabaseBackupManager_backUpWithCompletionBlock___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v3 = v0;
  _os_log_debug_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] %@%@", v2, 0x16u);
}

- (void)enumerateURL:(uint64_t)a1 rootURL:(NSObject *)a2 usingBlock:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CBD43000, a2, (os_log_type_t)0x90u, "[ERROR] rootURL is nil, nothing to enumerate.%@", (uint8_t *)&v2, 0xCu);
}

- (void)enumerateURL:(NSObject *)a3 rootURL:usingBlock:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  v7 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] %@ does not exist, nothing to enumerate.%@", v6, 0x16u);

}

@end
