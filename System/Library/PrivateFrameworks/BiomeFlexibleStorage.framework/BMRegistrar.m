@implementation BMRegistrar

+ (id)managedStreamIdentifiers
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v2 = (id *)getBMAppIntentIdentifierSymbolLoc_ptr;
  v20 = getBMAppIntentIdentifierSymbolLoc_ptr;
  if (!getBMAppIntentIdentifierSymbolLoc_ptr)
  {
    v3 = (void *)BiomeLibraryLibrary();
    v2 = (id *)dlsym(v3, "BMAppIntentIdentifier");
    v18[3] = (uint64_t)v2;
    getBMAppIntentIdentifierSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v17, 8);
  if (!v2)
    +[BMRegistrar managedStreamIdentifiers].cold.1();
  v4 = *v2;
  v21[0] = v4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v5 = (id *)getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr;
  v20 = getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr)
  {
    v6 = (void *)BiomeLibraryLibrary();
    v5 = (id *)dlsym(v6, "BMSiriRemembersInteractionHistoryIdentifier");
    v18[3] = (uint64_t)v5;
    getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v17, 8);
  if (!v5)
    +[BMRegistrar managedStreamIdentifiers].cold.2();
  v7 = *v5;
  v21[1] = v7;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = (id *)getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr;
  v20 = getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr)
  {
    v9 = (void *)BiomeLibraryLibrary();
    v8 = (id *)dlsym(v9, "BMSiriRemembersMessageHistoryIdentifier");
    v18[3] = (uint64_t)v8;
    getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
    +[BMRegistrar managedStreamIdentifiers].cold.3();
  v10 = *v8;
  v21[2] = v10;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v11 = (id *)getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr;
  v20 = getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr)
  {
    v12 = (void *)BiomeLibraryLibrary();
    v11 = (id *)dlsym(v12, "BMSiriRemembersCallHistoryIdentifier");
    v18[3] = (uint64_t)v11;
    getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v17, 8);
  if (!v11)
    +[BMRegistrar managedStreamIdentifiers].cold.4();
  v22 = *v11;
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = v22;
  objc_msgSend(v13, "arrayWithObjects:count:", v21, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BMRegistrar)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BMRegistrar *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D01D10], "localFlexibleStorageDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("registrations.db"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BMRegistrar initWithRegistrarURL:](self, "initWithRegistrarURL:", v6);
  return v7;
}

- (BMRegistrar)initWithRegistrarURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BMRegistrar *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  BMRegistrar *v18;
  BMRegistrar *v19;
  NSObject *v20;
  objc_super v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D01CC0]);
  v6 = objc_alloc(MEMORY[0x1E0D01D30]);
  v7 = (void *)objc_msgSend(v6, "initWithType:name:", 5, *MEMORY[0x1E0D01C38]);
  v24 = 0;
  objc_msgSend(v5, "requestAccessToResource:mode:error:", v7, 3, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (!v8)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_1B399A000, v15, OS_LOG_TYPE_INFO, "Not creating BMRegistrar because we are unable to access BFS storage directory %@", buf, 0xCu);
    }

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v23);
  v12 = v23;

  if (v12)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMRegistrar initWithRegistrarURL:].cold.1((uint64_t)v12, v13);

    v14 = 0;
    v9 = v12;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.SiriInference"));

  if ((v17 & 1) == 0)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B399A000, v20, OS_LOG_TYPE_INFO, "Not creating BMRegistrar because calling process is missing SiriInference entitlement", buf, 2u);
    }

    v9 = 0;
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v22.receiver = self;
  v22.super_class = (Class)BMRegistrar;
  v18 = -[BMSQLStore initWithURL:](&v22, sel_initWithURL_, v4);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_accessAssertion, v8);
  -[BMRegistrar registerSiriRemembersClients](v19, "registerSiriRemembersClients");
  self = v19;
  v9 = 0;
  v14 = self;
LABEL_17:

  return v14;
}

+ (id)centralRegistrar
{
  return objc_alloc_init((Class)a1);
}

+ (id)migrations
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("CREATE TABLE BFS_MANAGED_DBS( client_bundle TEXT NOT NULL,  db_path TEXT NOT NULL,  source_streams_rowid INTEGER,  registration_date INTEGER(4) DEFAULT (strftime('%s','now')),  last_communication_date INTEGER(4) DEFAULT (strftime('%s','now')),   PRIMARY KEY (client_bundle, db_path, source_streams_rowid)); CREATE INDEX client_idx ON BFS_MANAGED_DBS (client_bundle); CREATE INDEX source_idx ON BFS_MANAGED_DBS (source_streams_rowid); "));
  objc_msgSend(v2, "addObject:", CFSTR("CREATE TABLE SOURCE_STREAMS( stream_name TEXT PRIMARY KEY ON CONFLICT IGNORE);"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)registerClientWithBundleID:(id)a3 databaseURL:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BMSQLStore db](self, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startSavePointWithName:error:", CFSTR("registerClient"), 0);

  -[BMSQLStore db](self, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "executeUpdate:", CFSTR("INSERT INTO SOURCE_STREAMS (stream_name) VALUES (?)"), v13);

  if (!v14)
    goto LABEL_4;
  -[BMSQLStore db](self, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "executeQuery:", CFSTR("SELECT rowid FROM SOURCE_STREAMS WHERE stream_name == ?"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "next") & 1) != 0)
  {
    v18 = objc_msgSend(v17, "longForColumnIndex:", 0);
    -[BMSQLStore db](self, "db");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "executeUpdate:", CFSTR("INSERT INTO BFS_MANAGED_DBS (client_bundle, db_path, source_streams_rowid) VALUES (?,?,?) ON CONFLICT(client_bundle, db_path, source_streams_rowid) DO UPDATE SET last_communication_date=strftime('%s','now')"), v8, v20, v21);

    if (!v22)
    {
LABEL_4:
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v10, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMSQLStore db](self, "db");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastError");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v8;
        v35 = 2112;
        v36 = v30;
        v37 = 2112;
        v38 = v32;
        _os_log_fault_impl(&dword_1B399A000, v23, OS_LOG_TYPE_FAULT, "Failed to put %@ under management for stream %@. %@", buf, 0x20u);

      }
      -[BMSQLStore db](self, "db");
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSObject rollbackToSavePointWithName:error:](v24, "rollbackToSavePointWithName:error:", CFSTR("registerClient"), 0);
      v25 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[BMRegistrar registerClientWithBundleID:databaseURL:source:].cold.1(v10, v26);

  }
  -[BMSQLStore db](self, "db");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "releaseSavePointWithName:error:", CFSTR("registerClient"), 0);

  __biome_log_for_category();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_1B399A000, v24, OS_LOG_TYPE_DEFAULT, "Registered client %@ for stream %@", buf, 0x16u);

  }
  v25 = 1;
LABEL_13:

  return v25;
}

- (void)registerSiriRemembersClients
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BMRegistrar_registerSiriRemembersClients__block_invoke;
  block[3] = &unk_1E6649F80;
  block[4] = self;
  if (registerSiriRemembersClients_onceToken != -1)
    dispatch_once(&registerSiriRemembersClients_onceToken, block);
}

void __43__BMRegistrar_registerSiriRemembersClients__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _BYTE v50[128];
  _BYTE v51[128];
  uint8_t v52[128];
  _BYTE buf[24];
  void *v54;
  uint64_t *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("/var/mobile/Library/com.apple.siri.inference/siriremembers.sqlite3"), "stringByStandardizingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPath:", v2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("/var/mobile/Library/com.apple.siri.inference/siriremembers2.sqlite3"), "stringByStandardizingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend((id)objc_opt_class(), "managedStreamIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v30)
  {
    v27 = *(_QWORD *)v42;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v31 = v5;
        v7 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "registrationsForStream:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "databaseURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v14);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          }
          while (v11);
        }

        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v7;
          _os_log_debug_impl(&dword_1B399A000, v15, OS_LOG_TYPE_DEBUG, "SiriRemembers has current registrations: %@ for stream: %@", buf, 0x16u);
        }

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v49[0] = v29;
        v49[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v16);
              v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
              if ((objc_msgSend(v9, "containsObject:", v20) & 1) == 0)
              {
                __biome_log_for_category();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v7;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v20;
                  _os_log_impl(&dword_1B399A000, v21, OS_LOG_TYPE_DEFAULT, "Injecting SiriRemembers BFS registration for stream: %@, url: %@", buf, 0x16u);
                }

                v22 = *(void **)(a1 + 32);
                v45 = 0;
                v46 = &v45;
                v47 = 0x2050000000;
                v23 = (void *)getBMSourceClass_softClass;
                v48 = getBMSourceClass_softClass;
                if (!getBMSourceClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __getBMSourceClass_block_invoke;
                  v54 = &unk_1E6649FD0;
                  v55 = &v45;
                  __getBMSourceClass_block_invoke((uint64_t)buf);
                  v23 = (void *)v46[3];
                }
                v24 = objc_retainAutorelease(v23);
                _Block_object_dispose(&v45, 8);
                v25 = (void *)objc_msgSend([v24 alloc], "initWithIdentifier:", v7);
                objc_msgSend(v22, "registerClientWithBundleID:databaseURL:source:", CFSTR("com.apple.siriinferenced"), v20, v25);

              }
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
          }
          while (v17);
        }

        v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v30);
  }

}

- (NSDictionary)registeredClientsByStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSQLStore db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:", CFSTR("SELECT s.stream_name, r.client_bundle FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.rowid=r.source_streams_rowid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "next"))
  {
    do
    {
      objc_msgSend(v5, "stringForColumnIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringForColumnIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v6);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v7);

    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v11;
}

- (NSDictionary)streamRegistrationCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSQLStore db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:", CFSTR("SELECT s.stream_name, count(r.client_bundle) FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.rowid=r.source_streams_rowid GROUP BY s.stream_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "next"))
  {
    do
    {
      objc_msgSend(v5, "stringForColumnIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intForColumnIndex:", 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v6);

    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v8;
}

- (id)registrationsForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BMRegistrarRegistration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSQLStore db](self, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:", CFSTR("SELECT r.client_bundle, r.db_path, r.registration_date, r.last_communication_date FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.stream_name = ? AND s.rowid=r.source_streams_rowid"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "next"))
  {
    do
    {
      v8 = objc_alloc_init(_BMRegistrarRegistration);
      -[_BMRegistrarRegistration setSourceStreamID:](v8, "setSourceStreamID:", v4);
      objc_msgSend(v7, "stringForColumnIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BMRegistrarRegistration setBundleID:](v8, "setBundleID:", v9);

      v10 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v7, "stringForColumnIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURLWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BMRegistrarRegistration setDatabaseURL:](v8, "setDatabaseURL:", v12);

      objc_msgSend(v7, "dateForColumnIndex:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BMRegistrarRegistration setRegistrationDate:](v8, "setRegistrationDate:", v13);

      objc_msgSend(v7, "dateForColumnIndex:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BMRegistrarRegistration setLastCommunicationDate:](v8, "setLastCommunicationDate:", v14);

      objc_msgSend(v5, "addObject:", v8);
    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (BOOL)propagateDeletionOfEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  BMRemoteSQLStoreManager *v23;
  void *v24;
  BMRemoteSQLStoreManager *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v38;
  uint64_t v39;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  void *context;
  uint64_t v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v38 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v66 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", objc_msgSend((id)objc_opt_class(), "stream"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v12);
          }
          else
          {
            v78 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v14, "mutableCopy");
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v7);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v4;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v41)
    {
      v39 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v62 != v39)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          -[BMRegistrar registrationsForStream:](self, "registrationsForStream:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            v44 = j;
            objc_msgSend(obj, "objectForKeyedSubscript:", v17);
            v19 = objc_claimAutoreleasedReturnValue();
            __biome_log_for_category();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v17;
              v71 = 2112;
              v72 = v19;
              _os_log_impl(&dword_1B399A000, v20, OS_LOG_TYPE_DEFAULT, "Handling deletions in stream %@: %@", buf, 0x16u);
            }
            v42 = v19;

            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v43 = v18;
            v45 = v18;
            v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
            if (v48)
            {
              v46 = *(_QWORD *)v58;
              do
              {
                v21 = 0;
                do
                {
                  if (*(_QWORD *)v58 != v46)
                    objc_enumerationMutation(v45);
                  v50 = v21;
                  v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v21);
                  context = (void *)MEMORY[0x1B5E2A5E8]();
                  v23 = [BMRemoteSQLStoreManager alloc];
                  v51 = v22;
                  objc_msgSend(v22, "databaseURL");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = -[BMRemoteSQLStoreManager initWithURL:](v23, "initWithURL:", v24);

                  v55 = 0u;
                  v56 = 0u;
                  v53 = 0u;
                  v54 = 0u;
                  objc_msgSend(obj, "objectForKeyedSubscript:", v17);
                  v52 = (id)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = *(_QWORD *)v54;
                    do
                    {
                      for (k = 0; k != v27; ++k)
                      {
                        if (*(_QWORD *)v54 != v28)
                          objc_enumerationMutation(v52);
                        -[BMRemoteSQLStoreManager deleteRowsDerivedFromStream:eventIdentifier:](v25, "deleteRowsDerivedFromStream:eventIdentifier:", v17, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "objectForKeyedSubscript:", v17);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v31)
                        {
                          __biome_log_for_category();
                          v32 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                          {
                            objc_msgSend(v30, "objectForKeyedSubscript:", v17);
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v51, "bundleID");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v51, "databaseURL");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412802;
                            v70 = v33;
                            v71 = 2112;
                            v72 = (uint64_t)v34;
                            v73 = 2112;
                            v74 = v35;
                            _os_log_impl(&dword_1B399A000, v32, OS_LOG_TYPE_INFO, "Deleted %@ rows on behalf of %@ from %@.", buf, 0x20u);

                          }
                        }

                      }
                      v27 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
                    }
                    while (v27);
                  }

                  objc_autoreleasePoolPop(context);
                  v21 = v50 + 1;
                }
                while (v50 + 1 != v48);
                v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
              }
              while (v48);
            }

            v18 = v43;
            j = v44;
            v36 = v42;
          }
          else
          {
            __biome_log_for_category();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v17;
              _os_log_impl(&dword_1B399A000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring deletions from stream %@ because no relevant registrations exist.", buf, 0xCu);
            }
          }

        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v41);
    }

    v3 = v38;
  }

  return 1;
}

- (BOOL)propagateDeletionOfEventsInStream:(id)a3 withIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  NSObject *log;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[BMRegistrar registrationsForStream:](self, "registrationsForStream:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    __biome_log_for_category();
    log = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412546;
        v38 = v6;
        v39 = 2112;
        v40 = v7;
        _os_log_impl(&dword_1B399A000, log, OS_LOG_TYPE_DEFAULT, "Handling deletions in stream %@: %@", buf, 0x16u);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      log = v8;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v11)
      {
        v12 = v11;
        v30 = v8;
        v13 = *(_QWORD *)v34;
        v14 = 0x1E6649000uLL;
        v31 = v6;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(log);
            v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v17 = objc_alloc(*(Class *)(v14 + 2504));
            objc_msgSend(v16, "databaseURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v17, "initWithURL:", v18);

            objc_msgSend(v19, "deleteRowsDerivedFromStream:eventIdentifiers:", v6, v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v6);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              __biome_log_for_category();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", v6);
                v23 = v13;
                v24 = v7;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "bundleID");
                v26 = v12;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "databaseURL");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v38 = v25;
                v39 = 2112;
                v40 = v27;
                v41 = 2112;
                v42 = v28;
                _os_log_impl(&dword_1B399A000, v22, OS_LOG_TYPE_INFO, "Deleted %@ rows on behalf of %@ from %@.", buf, 0x20u);

                v12 = v26;
                v7 = v24;
                v13 = v23;
                v14 = 0x1E6649000;
                v6 = v31;
              }

            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v12);
        v8 = v30;
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1B399A000, log, OS_LOG_TYPE_DEFAULT, "Ignoring deletions from stream %@ because no relevant registrations exist.", buf, 0xCu);
    }

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

+ (void)managedStreamIdentifiers
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBMSiriRemembersCallHistoryIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BMRegistrar.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

- (void)initWithRegistrarURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B399A000, a2, OS_LOG_TYPE_ERROR, "Failed to create BFS storage directory with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)registerClientWithBundleID:(void *)a1 databaseURL:(NSObject *)a2 source:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1B399A000, a2, OS_LOG_TYPE_FAULT, "Unable to get rowid for stream %@", (uint8_t *)&v4, 0xCu);

}

@end
