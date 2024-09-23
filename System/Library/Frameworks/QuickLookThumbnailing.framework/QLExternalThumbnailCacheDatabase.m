@implementation QLExternalThumbnailCacheDatabase

- (QLExternalThumbnailCacheDatabase)initWithURL:(id)a3
{
  id v5;
  QLExternalThumbnailCacheDatabase *v6;
  QLExternalThumbnailCacheDatabase *v7;
  QLExternalThumbnailCacheDatabase *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLExternalThumbnailCacheDatabase;
    v6 = -[QLExternalThumbnailCacheDatabase init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_databaseURL, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)open
{
  QLExternalThumbnailCacheDatabase *v2;
  NSObject *v3;
  BOOL v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_db)
  {
    _log_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[QLExternalThumbnailCacheDatabase open].cold.1();

    v4 = 1;
  }
  else
  {
    -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:](v2, "_openDatabaseAtURL:", v2->_databaseURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&v2->_db, v5);
    v4 = v2->_db != 0;

  }
  objc_sync_exit(v2);

  return v4;
}

- (id)_openDatabaseAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;

  v4 = a3;
  v21 = 0;
  -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:](self, "_createDatabaseIfNeededAtURL:error:", v4, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  if (!v5)
  {
    _log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.5();

    v8 = objc_msgSend(v6, "code");
    if (v8 > 0x1A || ((1 << v8) & 0x5000800) == 0)
      goto LABEL_18;
    _log_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.4();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtURL:error:", v4, 0);

    v20 = v6;
    -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:](self, "_createDatabaseIfNeededAtURL:error:", v4, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    v6 = v12;
    if (!v5)
    {
LABEL_18:
      _log_1();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.1();

      goto LABEL_21;
    }
  }
  v13 = v6;
  v19 = v6;
  -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:](self, "_setupDatabaseTablesIfNeeded:error:", v5, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;

  _log_1();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.2();

LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[QLExternalThumbnailCacheDatabase _openDatabaseAtURL:].cold.3();

  objc_msgSend(v14, "useSerialQueue");
LABEL_22:

  return v14;
}

- (id)_createDatabaseIfNeededAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD aBlock[4];
  id v24;
  _QWORD *v25;
  id *v26;
  _QWORD v27[6];
  _QWORD v28[4];

  v6 = a3;
  _log_1();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:].cold.4();

  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
LABEL_7:
    v11 = objc_alloc_init(MEMORY[0x1E0DE81C8]);
    objc_msgSend(v11, "setShouldUseWALJournalMode:", 0);
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke;
    v27[3] = &unk_1E5D7C458;
    v27[4] = self;
    v27[5] = v28;
    objc_msgSend(v11, "setSqliteErrorHandler:", v27);
    aBlock[0] = v12;
    aBlock[1] = 3221225472;
    aBlock[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2;
    aBlock[3] = &unk_1E5D7C480;
    v26 = a4;
    v8 = v11;
    v24 = v8;
    v25 = v28;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v8, "setLabel:", CFSTR("External thumbnail cache"));
    if ((objc_msgSend(v8, "openAtURL:sharedCache:error:", v6, 0, a4) & 1) != 0)
    {
      if (objc_msgSend(v8, "setupPragmas"))
      {
        objc_msgSend(v8, "setSynchronousMode:", 1);
        objc_msgSend(v8, "lastError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v22[0] = v12;
          v22[1] = 3221225472;
          v22[2] = __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_76;
          v22[3] = &unk_1E5D7C4A8;
          v22[4] = self;
          objc_msgSend(v8, "setSqliteErrorHandler:", v22);
          _log_1();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:].cold.1();

          v17 = v8;
          goto LABEL_15;
        }
      }
      v13[2](v13);
    }
    else
    {
      _log_1();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:].cold.2((uint64_t *)a4, v15, v16);

    }
    objc_msgSend(v8, "close:", 0);
    v17 = 0;
LABEL_15:

    _Block_object_dispose(v28, 8);
    goto LABEL_16;
  }
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, a4),
        v9,
        (v10 & 1) != 0))
  {

    goto LABEL_7;
  }
  _log_1();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[QLExternalThumbnailCacheDatabase _createDatabaseIfNeededAtURL:error:].cold.3((uint64_t *)a4, v19, v20);

  v17 = 0;
LABEL_16:

  return v17;
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "logError:onDB:statement:", v8, a2, a3);
  v9 = objc_msgSend(v8, "code");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      _log_1();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1(a1, v3, v4);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DE81E8], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_retainAutorelease(v2);
    **(_QWORD **)(a1 + 48) = v5;

  }
}

uint64_t __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_76(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "logError:onDB:statement:", a4, a2, a3);
}

- (id)_setupDatabaseTablesIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v21;
  int v22;
  _QWORD v23[5];
  int v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _log_1();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.5();

  objc_msgSend(v5, "userVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntValue");
    if (v9)
    {
      v10 = v9;
      _log_1();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.4(v10, v11);
      v12 = 1;
    }
    else
    {
      _log_1();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.3(v15);

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke;
      v23[3] = &__block_descriptor_44_e23_B16__0__PQLConnection_8l;
      v24 = 0;
      v23[4] = a4;
      v12 = objc_msgSend(v5, "performWithFlags:action:", 10, v23);
      objc_msgSend(v5, "userVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v17 == 1)
        goto LABEL_19;
      _log_1();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "userVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntValue");
        *(_DWORD *)buf = 67109376;
        v26 = v22;
        v27 = 1024;
        v28 = 1;
        _os_log_error_impl(&dword_1AE3F5000, v11, OS_LOG_TYPE_ERROR, "database is at version %u instead of %d", buf, 0xEu);

      }
    }

LABEL_19:
    objc_msgSend(v5, "userVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntValue");
    if (v12 && !v19)
      -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.2();

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v5, "close:", 0);

      v5 = 0;
    }
    v5 = v5;
    v14 = v5;
    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(v5, "lastError");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _log_1();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:].cold.1(v5, v13);

  objc_msgSend(v5, "close:", 0);
  v14 = 0;
LABEL_24:

  return v14;
}

uint64_t __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  v3 = ql_external_thumbnail_cache_create_tables_initial(a2, &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    _log_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1((int *)(a1 + 40), (uint64_t)v4, v5);

    if (*(_QWORD *)(a1 + 32))
      **(_QWORD **)(a1 + 32) = objc_retainAutorelease(v4);
  }

  return v3;
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  PQLConnection *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = (PQLConnection *)a3;
  v8 = 0;
  v5 = -[PQLConnection close:](v4, "close:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    _log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase _closeDatabaseOnItsQueue:].cold.1();

  }
  if (self->_db == v4)
  {
    self->_db = 0;

  }
}

- (void)close
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[PQLConnection serialQueue](self->_db, "serialQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PQLConnection serialQueue](self->_db, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__QLExternalThumbnailCacheDatabase_close__block_invoke;
    block[3] = &unk_1E5D7C4F0;
    block[4] = self;
    dispatch_sync(v4, block);

  }
}

void __41__QLExternalThumbnailCacheDatabase_close__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_closeDatabaseOnItsQueue:", v2);

}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _log_1();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
    {
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1AE3F5000, v10, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (v11)
  {
    -[QLExternalThumbnailCacheDatabase logError:onDB:statement:].cold.1();
  }

}

- (BOOL)insertOrReplaceThumbnailRepresentingFPItem:(id)a3 size:(unint64_t)a4 modificationDate:(id)a5 fileExtension:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  PQLConnection *db;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  _QWORD block[5];
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  db = self->_db;
  if (db)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    -[PQLConnection serialQueue](db, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__QLExternalThumbnailCacheDatabase_insertOrReplaceThumbnailRepresentingFPItem_size_modificationDate_fileExtension_error___block_invoke;
    block[3] = &unk_1E5D7C518;
    v27 = &v29;
    block[4] = self;
    v17 = v12;
    v25 = v17;
    v28 = a4;
    v26 = v14;
    dispatch_sync(v16, block);

    if (*((_BYTE *)v30 + 24))
    {
      _log_1();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v17;
        v35 = 2048;
        v36 = a4;
        v37 = 2112;
        v38 = v13;
        _os_log_debug_impl(&dword_1AE3F5000, v18, OS_LOG_TYPE_DEBUG, "Successfully inserted or updated thumbnail for FPItem: %@, size: %lu, date: %@.", buf, 0x20u);
      }

    }
    else
    {
      _log_1();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[PQLConnection lastError](self->_db, "lastError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLExternalThumbnailCacheDatabase insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:].cold.2((uint64_t)v17, v22, (uint64_t)buf, v21);
      }

      if (a7)
      {
        -[PQLConnection lastError](self->_db, "lastError");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v20 = *((_BYTE *)v30 + 24) != 0;

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    _log_1();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:].cold.1();

    v20 = 0;
  }

  return v20;
}

void __121__QLExternalThumbnailCacheDatabase_insertOrReplaceThumbnailRepresentingFPItem_size_modificationDate_fileExtension_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "versionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "execute:", CFSTR("INSERT OR REPLACE INTO thumbnails(fpitemId, versionId, last_hit_date, size, file_extension) VALUES (%@, %@, %@, %llu, %@)"), v2, v3, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (id)deleteOldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[QLExternalThumbnailCacheDatabase oldestThumbnailsToFreeAtLeastSpace:error:](self, "oldestThumbnailsToFreeAtLeastSpace:error:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!self->_db)
  {
    _log_1();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCacheDatabaseErrorDomain"), 1, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v8;
  }
  v9 = v7 == 0;
  _log_1();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE3F5000, v11, OS_LOG_TYPE_INFO, "Won't delete thumbnails from database because an error occured.", buf, 2u);
    }

    v8 = 0;
    return v8;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:].cold.3((uint64_t)v8, a3, v11);

  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x2020000000;
  v26 = 0;
  -[PQLConnection serialQueue](self->_db, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__QLExternalThumbnailCacheDatabase_deleteOldestThumbnailsToFreeAtLeastSpace_error___block_invoke;
  block[3] = &unk_1E5D7C2D0;
  v22 = buf;
  block[4] = self;
  v13 = v8;
  v21 = v13;
  dispatch_sync(v12, block);

  if (!v24[24])
  {
    if (a4)
    {
      -[PQLConnection lastError](self->_db, "lastError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    _log_1();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PQLConnection lastError](self->_db, "lastError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnailsToFreeAtLeastSpace:error:].cold.2(v15, (uint64_t)v27, v14);
    }

    v13 = 0;
  }
  v16 = v21;
  v17 = v13;

  _Block_object_dispose(buf, 8);
  return v17;
}

void __83__QLExternalThumbnailCacheDatabase_deleteOldestThumbnailsToFreeAtLeastSpace_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("DELETE FROM thumbnails ORDER BY last_hit_date LIMIT %llu"), objc_msgSend(*(id *)(a1 + 40), "count"));

}

- (BOOL)deleteOldestThumbnail
{
  PQLConnection *db;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  db = self->_db;
  _log_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (db)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnail].cold.2();

    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[PQLConnection serialQueue](self->_db, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__QLExternalThumbnailCacheDatabase_deleteOldestThumbnail__block_invoke;
    v9[3] = &unk_1E5D7C2F8;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v6, v9);

    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase deleteOldestThumbnail].cold.1();

    return 0;
  }
  return v7;
}

void __57__QLExternalThumbnailCacheDatabase_deleteOldestThumbnail__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("DELETE FROM thumbnails ORDER BY last_hit_date LIMIT 1"));

}

- (unint64_t)totalThumbnailsSize
{
  PQLConnection *db;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  db = self->_db;
  if (db)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[PQLConnection serialQueue](db, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__QLExternalThumbnailCacheDatabase_totalThumbnailsSize__block_invoke;
    v8[3] = &unk_1E5D7C540;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    _log_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase totalThumbnailsSize].cold.1();

    return 0;
  }
  return v5;
}

void __55__QLExternalThumbnailCacheDatabase_totalThumbnailsSize__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT SUM(size) FROM thumbnails"));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "longLongValue");
}

- (unint64_t)totalThumbnailCount
{
  PQLConnection *db;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  db = self->_db;
  if (db)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[PQLConnection serialQueue](db, "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__QLExternalThumbnailCacheDatabase_totalThumbnailCount__block_invoke;
    v8[3] = &unk_1E5D7C540;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    _log_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase totalThumbnailCount].cold.1();

    return 0;
  }
  return v5;
}

void __55__QLExternalThumbnailCacheDatabase_totalThumbnailCount__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT COUNT(*) FROM thumbnails"));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "longLongValue");
}

- (id)pathExtensionForItem:(id)a3 error:(id *)a4
{
  id v6;
  PQLConnection *db;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  db = self->_db;
  if (db)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    -[PQLConnection serialQueue](db, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke;
    v13[3] = &unk_1E5D7C568;
    v13[4] = self;
    v14 = v6;
    v15 = &v17;
    v16 = &v23;
    dispatch_sync(v8, v13);

    if (a4)
    {
      v9 = (void *)v18[5];
      if (v9)
        *a4 = objc_retainAutorelease(v9);
    }
    v10 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCacheDatabaseErrorDomain"), 1, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase pathExtensionForItem:error:].cold.1();

    v10 = 0;
  }

  return v10;
}

void __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "whereClauseForItem:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "fetch:", CFSTR("SELECT file_extension FROM thumbnails WHERE %@"), v3);

  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _log_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke_cold_1(v4, v6);

    objc_msgSend(v4, "error");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "next"))
  {
    objc_msgSend(v4, "stringAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
LABEL_7:
    v9 = *(_QWORD *)(v8 + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

  }
}

- (id)oldestThumbnailsToFreeAtLeastSpace:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  if (!self->_db)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCacheDatabaseErrorDomain"), 1, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase pathExtensionForItem:error:].cold.1();
    goto LABEL_12;
  }
  if (-[QLExternalThumbnailCacheDatabase totalThumbnailsSize](self, "totalThumbnailsSize") < a3)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCacheDatabaseErrorDomain"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_1AE3F5000, v7, OS_LOG_TYPE_INFO, "Can't free space (%lu) because less than this space is stored in the DB.", (uint8_t *)&buf, 0xCu);
    }
LABEL_12:

    v8 = 0;
    goto LABEL_17;
  }
  v9 = -[QLExternalThumbnailCacheDatabase totalThumbnailCount](self, "totalThumbnailCount");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[PQLConnection serialQueue](self->_db, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke;
  v13[3] = &unk_1E5D7C590;
  v13[4] = self;
  v13[5] = &v14;
  v13[8] = v9;
  v13[9] = vcvtpd_u64_f64((double)v9 * 10.0 / 100.0);
  v13[6] = &buf;
  v13[7] = a3;
  dispatch_sync(v10, v13);

  if (a4)
  {
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v8 = (id)v15[5];
  _Block_object_dispose(&buf, 8);

LABEL_17:
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    v2 = 0;
    while ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") < *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "db");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT fpItemId, versionId, file_extension, size FROM thumbnails ORDER BY last_hit_date LIMIT %llu OFFSET %llu"), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"));

      objc_msgSend(v4, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "error");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        _log_1();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke_cold_1();

        return;
      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "enumerateObjectsOfClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v21;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v15 = *(void **)(v14 + 40);
              *(_QWORD *)(v14 + 40) = v13;

              v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            }
            objc_msgSend(v12, "addObject:", v11);
            v2 += objc_msgSend(v11, "size");
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v8);
      }

      if (v2 >= *(_QWORD *)(a1 + 56))
        return;
    }
  }
}

- (BOOL)removeAllThumbnails:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = self->_db == 0;
  _log_1();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCacheDatabase removeAllThumbnails:].cold.1();

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLExternalThumbnailCacheDatabaseErrorDomain"), 1, 0);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[QLExternalThumbnailCacheDatabase removeAllThumbnails:].cold.3();

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[PQLConnection serialQueue](self->_db, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__QLExternalThumbnailCacheDatabase_removeAllThumbnails___block_invoke;
    v13[3] = &unk_1E5D7C2F8;
    v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(v8, v13);

    if (!*((_BYTE *)v15 + 24))
    {
      _log_1();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PQLConnection lastError](self->_db, "lastError");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLExternalThumbnailCacheDatabase removeAllThumbnails:].cold.2(v10, (uint64_t)v18, v9);
      }

      if (a3)
      {
        -[PQLConnection lastError](self->_db, "lastError");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  return v11;
}

void __56__QLExternalThumbnailCacheDatabase_removeAllThumbnails___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("DELETE FROM thumbnails"));

}

- (id)whereClauseForItem:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  _log_1();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[QLExternalThumbnailCacheDatabase whereClauseForItem:].cold.1(v3, v4);

  v5 = (void *)MEMORY[0x1E0DE81D0];
  objc_msgSend(v3, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "versionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatInjection:", CFSTR("fpItemId = %@ AND versionId = %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (PQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_openDatabaseAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, v0, v1, "Could not create database after resetting it. Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_openDatabaseAtURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, v0, v1, "Could not setup the tables of the database. Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_openDatabaseAtURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Thumbnails database open and upgraded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_openDatabaseAtURL:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Corrupt database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_openDatabaseAtURL:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, v0, v1, "Could not open the database: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AE3F5000, v0, v1, "Successfully opened database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createDatabaseIfNeededAtURL:(uint64_t)a3 error:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, a3, "Opening the database failed with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_createDatabaseIfNeededAtURL:(uint64_t)a3 error:.cold.3(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, a3, "Failed to create directory hierarchy with error: %@.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_createDatabaseIfNeededAtURL:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AE3F5000, v0, v1, "Opening database at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__QLExternalThumbnailCacheDatabase__createDatabaseIfNeededAtURL_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, a3, "Prequelite failed, but did not indicate what the error was! Since we received error %lu before, using that.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_setupDatabaseTablesIfNeeded:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, a2, v5, "Hit error %@, closing db %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_9();
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.2()
{
  __assert_rtn("-[QLExternalThumbnailCacheDatabase _setupDatabaseTablesIfNeeded:error:]", "QLExternalThumbnailCacheDatabase.m", 327, "(db.userVersion.unsignedIntValue >= QLExternalThumbnailCacheDatabaseVersionMax) || !result");
}

- (void)_setupDatabaseTablesIfNeeded:(os_log_t)log error:.cold.3(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109376;
  v1[1] = 0;
  v2 = 1024;
  v3 = 0;
  _os_log_debug_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_DEBUG, "migrating database from version %d to %d", (uint8_t *)v1, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)_setupDatabaseTablesIfNeeded:(int)a1 error:(NSObject *)a2 .cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109632;
  v2[1] = a1;
  v3 = 1024;
  v4 = 0;
  v5 = 1024;
  v6 = 1;
  _os_log_debug_impl(&dword_1AE3F5000, a2, OS_LOG_TYPE_DEBUG, "no database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupDatabaseTablesIfNeeded:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AE3F5000, v0, v1, "Upgrading database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__QLExternalThumbnailCacheDatabase__setupDatabaseTablesIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a1 + 1;
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_ERROR, "can't migrate from version %d to %d: %@", (uint8_t *)v5, 0x18u);
  OUTLINED_FUNCTION_2();
}

- (void)_closeDatabaseOnItsQueue:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, v0, (uint64_t)v0, "Could not close database %@: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)logError:onDB:statement:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, v0, (uint64_t)v0, "Sqlite failed on %@ with error [%@]", v1);
  OUTLINED_FUNCTION_2();
}

- (void)insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't add thumbnail to DB because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)insertOrReplaceThumbnailRepresentingFPItem:(uint64_t)a3 size:(NSObject *)a4 modificationDate:fileExtension:error:.cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, a4, a3, "Could not insert or replace thumbnail for FPItem:, %@. Error: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_11();
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't delete oldest thumbnails from database because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:(NSObject *)a3 error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a3, (uint64_t)a3, "Could not delete thumbnails from DB to free space. Error: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_11();
}

- (void)deleteOldestThumbnailsToFreeAtLeastSpace:(NSObject *)a3 error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_12(&dword_1AE3F5000, a3, (uint64_t)a3, "Removing oldest thumbnails to free space (%lu). Removing thumbnails: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)deleteOldestThumbnail
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Removing oldest thumbnail.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)totalThumbnailsSize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't get thumbnails size sum from the DB because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)totalThumbnailCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't get thumbnail count from the DB because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pathExtensionForItem:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't get path extension for item identifier because DB is not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__QLExternalThumbnailCacheDatabase_pathExtensionForItem_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, v4, "Can't get path extension for item identifier because of database error: %@.", v5);

}

void __77__QLExternalThumbnailCacheDatabase_oldestThumbnailsToFreeAtLeastSpace_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Could not obtain data of old thumbnails to free space", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeAllThumbnails:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Can't delete all thumbnails from database because it's not open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeAllThumbnails:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a3, (uint64_t)a3, "Could not delete all thumbnails from database. Error: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_11();
}

- (void)removeAllThumbnails:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Removing all thumbnails from database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)whereClauseForItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "versionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_12(&dword_1AE3F5000, a2, v6, "Using fpItemId=%@ and versionId=%@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

@end
