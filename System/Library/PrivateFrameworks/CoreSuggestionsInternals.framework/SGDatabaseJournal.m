@implementation SGDatabaseJournal

- (id)_getCurrentFile
{
  SGDatabaseJournalFile *currentFile;

  currentFile = self->_currentFile;
  if (!currentFile)
  {
    -[SGDatabaseJournal _addCurrentFileToLog](self, "_addCurrentFileToLog");
    currentFile = self->_currentFile;
  }
  return currentFile;
}

- (void)_clearCurrentFile
{
  -[SGDatabaseJournalFile clear](self->_currentFile, "clear");
}

- (void)_addCurrentFileToLog
{
  void *v3;
  NSString *directoryPath;
  id v5;
  unint64_t serialNumber;
  NSString *uuid;
  void *v8;
  SGDatabaseJournalFile *v9;
  SGDatabaseJournalFile *currentFile;
  id v11;

  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  directoryPath = self->_directoryPath;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  serialNumber = self->_serialNumber;
  uuid = self->_uuid;
  self->_serialNumber = serialNumber + 1;
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("J-%20llu.%@.suggestdDbJournal"), serialNumber, uuid);
  -[NSString stringByAppendingPathComponent:](directoryPath, "stringByAppendingPathComponent:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  v9 = -[SGDatabaseJournalFile initWithPath:]([SGDatabaseJournalFile alloc], "initWithPath:", v11);
  currentFile = self->_currentFile;
  self->_currentFile = v9;

}

- (void)_closeCurrentFile
{
  SGDatabaseJournalFile *currentFile;

  -[SGDatabaseJournalFile destroyAndUnlinkIfEmpty](self->_currentFile, "destroyAndUnlinkIfEmpty");
  currentFile = self->_currentFile;
  self->_currentFile = 0;

}

- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *queue;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  SGDatabaseJournal *v27;
  id v28;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self->_inMemory)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_29;
    v20[3] = &unk_1E7DB7800;
    v21 = v10;
    v22 = v8;
    v23 = v9;
    objc_msgSend(v21, "writeTransaction:", v20);

  }
  else
  {
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    v13 = objc_msgSend(v8, "length");
    if (v13 >= 6)
      v14 = 6;
    else
      v14 = v13;
    objc_msgSend(v8, "substringToIndex:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("select"));

    if (v17)
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "skipping select query", buf, 2u);
      }

    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke;
      block[3] = &unk_1E7DB77B0;
      v25 = v9;
      v26 = v8;
      v27 = self;
      v28 = v11;
      dispatch_sync(queue, block);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  SGDatabaseJournalFile *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  char v23;
  NSObject *v24;
  char v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  BOOL *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (self->_inMemory)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournal.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_inMemory"));

  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v12;
    _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "executing journal file: %@", buf, 0xCu);
  }

  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  v15 = -[SGDatabaseJournalFile initWithPath:]([SGDatabaseJournalFile alloc], "initWithPath:", v12);
  -[SGDatabaseJournalFile read](v15, "read");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3710];
    +[SGDatabaseJournal _allowedTypesForQueryKeyedArchives](SGDatabaseJournal, "_allowedTypesForQueryKeyedArchives");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", v18, v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_autoreleasePoolPop(v14);
  if (!v16)
  {
    v26 = 0;
    v25 = 1;
    goto LABEL_25;
  }
  if (!v19)
  {
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v12;
      _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "Got nil after trying to unarchive a db journal: %@", buf, 0xCu);
    }

    v19 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__query"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    sgLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v12;
      _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "No __query key set in journal file: %@", buf, 0xCu);
    }

LABEL_22:
    v25 = 0;
    v26 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__query"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("DELETE FROM snippets WHERE entityId NOT IN (SELECT id FROM entities.entity)"));

  if ((v23 & 1) != 0)
  {
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v12;
      _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "ignoring journal file: %@", buf, 0xCu);
    }

    v25 = 1;
  }
  else
  {
    v29 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__query"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDatabaseJournal _binderForDictionary:](SGDatabaseJournal, "_binderForDictionary:", v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __52__SGDatabaseJournal__executeFile_onDb_becameLocked___block_invoke;
    v40[3] = &unk_1E7DB7828;
    v32 = v19;
    v41 = v32;
    v42 = &v44;
    v43 = a5;
    objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v30, v31, 0, v40);

    objc_autoreleasePoolPop(v29);
    v25 = 1;
    v19 = v32;
  }
  v26 = 1;
LABEL_25:
  if (*((_BYTE *)v45 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v34 = objc_msgSend(v33, "removeItemAtPath:error:", v12, &v39);
    v35 = v39;

    if ((v34 & 1) != 0)
    {
      sgLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v12;
        _os_log_debug_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEBUG, "SGDatabaseJournal deleted journal file: %@", buf, 0xCu);
      }
    }
    else
    {
      sgLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v49 = v12;
        v50 = 2112;
        v51 = v35;
        _os_log_error_impl(&dword_1C3607000, v36, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to delete journal file: %@: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v35 = 0;
    v34 = 1;
  }
  if (!v26)
    v34 = v25;
  _Block_object_dispose(&v44, 8);

  return v34;
}

- (BOOL)executeQueriesOnDatabase:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v6 = 1;
  if (!self->_inMemory)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke;
    block[3] = &unk_1E7DB7878;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(queue, block);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (BOOL)deleteAllJournaledQueries
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SGDatabaseJournal_deleteAllJournaledQueries__block_invoke;
  v5[3] = &unk_1E7DB78A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)startJournaling
{
  BOOL v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (self->_inMemory)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SGDatabaseJournal_startJournaling__block_invoke;
  v5[3] = &unk_1E7DB78A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v2 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)stopJournaling
{
  BOOL v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (self->_inMemory)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SGDatabaseJournal_stopJournaling__block_invoke;
  v5[3] = &unk_1E7DB78A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v2 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)journaling
{
  return self->_journaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __35__SGDatabaseJournal_stopJournaling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

uint64_t __36__SGDatabaseJournal_startJournaling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40) ^ 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

void __46__SGDatabaseJournal_deleteAllJournaledQueries__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "Removing all journal files at %@", buf, 0xCu);
  }

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  +[SGPaths suggestionsSubdirectory:](SGPaths, "suggestionsSubdirectory:", CFSTR("journals"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "hasPrefix:", v5);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v18 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v7, &v18);
    v8 = v18;

    if (v8)
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to remove journal directory: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v17 = v8;
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v17);
    v12 = v17;

    if (v12)
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to re-create directory for storing journals: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGDatabaseJournal not removing bogus journal directory: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_autoreleasePoolPop(v2);
}

void __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_closeCurrentFile");
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "filename");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "Executing queries from journals to %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke_51;
  v5[3] = &unk_1E7DB7850;
  v4 = *(_OWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  p_buf = &buf;
  objc_msgSend((id)v4, "writeTransaction:", v5);

  _Block_object_dispose(&buf, 8);
}

void __46__SGDatabaseJournal_executeQueriesOnDatabase___block_invoke_51(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  dirent *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int *v20;
  char *v21;
  dirent **v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "SGDatabaseJournal.executeQueriesOnDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v3 = (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "UTF8String");
  v4 = scandir(v3, &v22, 0, MEMORY[0x1E0C81560]);
  if (v4 < 0)
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = *__error();
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 67109378;
      v24 = v19;
      v25 = 2080;
      v26 = v21;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to open journal directory: error(%i): %s", buf, 0x12u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_29;
  }
  v5 = v4;
  if (!v4)
  {
    LODWORD(v6) = 0;
    goto LABEL_25;
  }
  v6 = 0;
  while (1)
  {
    v7 = v22[v6];
    if (v7->d_type != 8)
    {
      free(v22[v6]);
      goto LABEL_14;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7->d_name);
    free(v7);
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    buf[0] = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "_executeFile:onDb:becameLocked:", v8, *(_QWORD *)(a1 + 40), buf) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (buf[0])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_autoreleasePoolPop(v9);
      goto LABEL_24;
    }
    objc_autoreleasePoolPop(v9);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(_DWORD *)(v10 + 24) + 1;
    *(_DWORD *)(v10 + 24) = v11;
    if ((v11 & 1) == 0)
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        v24 = v13;
        _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "journal execution checking lock state after %u files", buf, 8u);
      }

      if ((objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked") & 1) == 0)
        break;
    }

LABEL_14:
    if (v5 == ++v6)
    {
      LODWORD(v6) = v5;
      goto LABEL_25;
    }
  }
  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v24 = v16;
    _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_INFO, "journal execution exiting early after %u files because device is locked", buf, 8u);
  }

LABEL_24:
LABEL_25:
  v17 = v6 + 1;
  if ((int)v6 + 1 < v5)
  {
    v18 = 8 * v6 + 8;
    do
    {
      free(*(dirent **)((char *)v22 + v18));
      ++v17;
      v18 += 8;
    }
    while (v5 > v17);
  }
  free(v22);
LABEL_29:

}

uint64_t __52__SGDatabaseJournal__executeFile_onDb_becameLocked___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BYTE *v5;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("__query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when replaying query: %@: %@", (uint8_t *)&v8, 0x16u);

  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v5 = *(_BYTE **)(a1 + 48);
    if (v5)
      *v5 = 1;
  }

  return 0;
}

void __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v3 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("__query")));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_getCurrentFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "write:", v4);

  objc_autoreleasePoolPop(v3);
  v6 = *(_BYTE **)(a1 + 48);
  if (v6[40])
  {
    objc_msgSend(v6, "_addCurrentFileToLog");
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    v7 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    +[SGDatabaseJournal _binderForDictionary:](SGDatabaseJournal, "_binderForDictionary:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2;
    v14 = &unk_1E7DB7788;
    v15 = *(id *)(a1 + 40);
    v16 = &v17;
    objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v9, 0, &v11);

    v10 = *(void **)(a1 + 48);
    if (*((_BYTE *)v18 + 24))
      objc_msgSend(v10, "_clearCurrentFile", v11, v12, v13, v14);
    else
      objc_msgSend(v10, "_addCurrentFileToLog", v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }

}

void __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_29(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0D81570], "_binderForDictionary:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2_31;
  v5[3] = &unk_1E7DB77D8;
  v6 = (id)a1[5];
  objc_msgSend(v2, "prepAndRunSQL:onPrep:onRow:onError:", v3, v4, 0, v5);

}

uint64_t __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E0D81780];
}

uint64_t __42__SGDatabaseJournal_runQuery_values_onDb___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v7, 0x16u);
  }

  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

  return 0;
}

+ (SGDatabaseJournal)journalWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  pthread_mutex_lock(&journalWithName__lock);
  v4 = (void *)journalWithName__instances;
  if (!journalWithName__instances)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
    v6 = (void *)journalWithName__instances;
    journalWithName__instances = v5;

    v4 = (void *)journalWithName__instances;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    v7 = (_QWORD *)objc_opt_new();
    objc_msgSend(CFSTR("com.apple.suggestions.databasejournal."), "stringByAppendingString:", v3);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    v11 = (void *)v7[1];
    v7[1] = v10;

    +[SGPaths suggestionsSubdirectory:](SGPaths, "suggestionsSubdirectory:", CFSTR("journals"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[2];
    v7[2] = v13;

    v7[3] = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v7[4];
    v7[4] = v16;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7[2];
    v24 = 0;
    v20 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v24);
    v21 = v24;

    if ((v20 & 1) != 0)
    {
      objc_msgSend((id)journalWithName__instances, "setObject:forKey:", v7, v3);
    }
    else
    {
      sgLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGDatabaseJournal unable to create directory for storing journals: %@", buf, 0xCu);
      }

      v7 = 0;
    }

    objc_autoreleasePoolPop(v8);
  }
  pthread_mutex_unlock(&journalWithName__lock);

  return (SGDatabaseJournal *)v7;
}

+ (id)journalForInMemoryDb
{
  uint64_t v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_opt_new();
  v3 = dispatch_queue_create("com.apple.suggestions.databasejournal.inmemory", 0);
  v4 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = v3;

  v5 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  *(_QWORD *)(v2 + 24) = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v7;

  *(_BYTE *)(v2 + 41) = 1;
  return (id)v2;
}

+ (id)_binderForDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SGDatabaseJournal__binderForDictionary___block_invoke;
  v7[3] = &unk_1E7DB7720;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)_allowedTypesForQueryKeyedArchives
{
  if (_allowedTypesForQueryKeyedArchives__pasOnceToken7 != -1)
    dispatch_once(&_allowedTypesForQueryKeyedArchives__pasOnceToken7, &__block_literal_global_35393);
  return (id)_allowedTypesForQueryKeyedArchives__pasExprOnceResult;
}

void __55__SGDatabaseJournal__allowedTypesForQueryKeyedArchives__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)MEMORY[0x1C3BD4F6C]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  v8 = (void *)_allowedTypesForQueryKeyedArchives__pasExprOnceResult;
  _allowedTypesForQueryKeyedArchives__pasExprOnceResult = v7;

  objc_autoreleasePoolPop(v0);
}

uint64_t __42__SGDatabaseJournal__binderForDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGDatabaseJournal__binderForDictionary___block_invoke_2;
  v4[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
  v4[4] = a2;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __42__SGDatabaseJournal__binderForDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  char isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("__query")) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("qmarksSeparatedByCommas")))
    {
      v19 = v6;
      v20 = v5;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v8)
        goto LABEL_15;
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = 1;
      while (1)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v11 + 1;
            sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 32), v11, objc_msgSend(v13, "longLongValue"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v14 = v11 + 1;
            sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 32), v11, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          v11 = v14;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (!v9)
        {
LABEL_15:

          v6 = v19;
          v5 = v20;
          goto LABEL_21;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v6)
    {
      +[SGSqliteDatabase bindParamToNull:name:](SGSqliteDatabase, "bindParamToNull:name:", *(_QWORD *)(a1 + 32), objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      if ((isKindOfClass & 1) != 0)
        +[SGSqliteDatabase bindParam:name:int64:](SGSqliteDatabase, "bindParam:name:int64:", v17, v18, objc_msgSend(v6, "longLongValue"));
      else
        +[SGSqliteDatabase bindParam:name:nsstring:](SGSqliteDatabase, "bindParam:name:nsstring:", v17, v18, v6);
    }
  }
LABEL_21:

}

@end
