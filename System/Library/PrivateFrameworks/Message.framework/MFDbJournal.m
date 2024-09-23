@implementation MFDbJournal

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)_journals;
    _journals = (uint64_t)v2;

  }
}

- (MFDbJournal)initWithMailbox:(id)a3
{
  id v5;
  MFDbJournal *v6;
  MFDbJournal *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *path;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDbJournal;
  v6 = -[MFDbJournal init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_lock, 0);
    v7->_fd = -1;
    objc_storeStrong((id *)&v7->_mailbox, a3);
    objc_msgSend(v5, "fullPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Journal"));
    else
      NSTemporaryDirectory();
    v10 = objc_claimAutoreleasedReturnValue();
    path = v7->_path;
    v7->_path = (NSString *)v10;

  }
  return v7;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  pthread_mutex_destroy(&self->_lock);
  fd = self->_fd;
  if (fd != -1)
    close(fd);
  v4.receiver = self;
  v4.super_class = (Class)MFDbJournal;
  -[MFDbJournal dealloc](&v4, sel_dealloc);
}

+ (id)_journalForMailbox:(id)a3
{
  id v3;
  id v4;
  MFDbJournal *v5;

  v3 = a3;
  v4 = (id)_journals;
  objc_sync_enter(v4);
  objc_msgSend((id)_journals, "objectForKey:", v3);
  v5 = (MFDbJournal *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[MFDbJournal initWithMailbox:]([MFDbJournal alloc], "initWithMailbox:", v3);
    objc_msgSend((id)_journals, "setObject:forKey:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

+ (id)legacyJournal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  MFDbJournal *v7;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Mail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Vault"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v6)
  {
    v7 = -[MFDbJournal initWithMailbox:]([MFDbJournal alloc], "initWithMailbox:", 0);
    objc_storeStrong((id *)&v7->_path, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)_processJournalFile:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  size_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  int v12;
  ssize_t v13;
  size_t v14;
  unint64_t v15;
  void *v16;
  ssize_t v17;
  ssize_t v18;
  int v19;
  sqlite3 *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  int v26;
  int v27;
  int v28;
  int v30;
  int *v31;
  char *v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  _BYTE v36[24];
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = -1431655766;
  v34 = -1431655766;
  v7 = NSPageSize();
  EDLibraryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 138412290;
    *(_QWORD *)v36 = v5;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "processing journal file %@", (uint8_t *)&v35, 0xCu);
  }

  v9 = malloc_type_malloc(v7, 0xE40C48CCuLL);
  if (!v9)
    __assert_rtn("-[MFDbJournal _processJournalFile:connection:]", "MFDbJournal.m", 140, "buf && \"failed to allocate buffer during journal merge\");
  v10 = objc_retainAutorelease(v5);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
  v12 = v11;
  if (v11 == -1)
  {
    v21 = v10;
    EDLibraryLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v30 = *__error();
      v31 = __error();
      v32 = strerror(*v31);
      v35 = 67109890;
      *(_DWORD *)v36 = v30;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = CFSTR("opening journal file");
      *(_WORD *)&v36[14] = 2112;
      *(_QWORD *)&v36[16] = v21;
      v37 = 2080;
      v38 = v32;
      _os_log_error_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_ERROR, "Error %d %@ at path %@: %s", (uint8_t *)&v35, 0x26u);
    }

    goto LABEL_22;
  }
  v13 = read(v11, &v33, 4uLL);
  if (v13 != 4)
  {
    EDLibraryLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 134218240;
      *(_QWORD *)v36 = 4;
      *(_WORD *)&v36[8] = 2048;
      *(_QWORD *)&v36[10] = v13;
      v23 = "read wrong number of version bytes from journal, expected: %lu actual: %zd";
      v24 = v21;
      v25 = 22;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v33 == 1)
  {
    while (1)
    {
      if (read(v12, &v34, 4uLL) < 1)
      {
        v26 = 0;
        goto LABEL_23;
      }
      v14 = v34;
      v15 = v34 + 4;
      if (v15 > v7)
      {
        v16 = malloc_type_realloc(v9, v34 + 4, 0x96530317uLL);
        if (!v16)
        {
          EDLibraryLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          LOWORD(v35) = 0;
          v23 = "realloc failed when merging journal with database";
          v24 = v21;
          v25 = 2;
LABEL_21:
          _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v35, v25);
          goto LABEL_22;
        }
        v14 = v34;
        v7 = v15;
        v9 = v16;
      }
      v17 = read(v12, v9, v14);
      v18 = v17;
      if (v17 != v34)
      {
        EDLibraryLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v35 = 134218240;
          *(_QWORD *)v36 = v34;
          *(_WORD *)&v36[8] = 2048;
          *(_QWORD *)&v36[10] = v18;
          _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "read wrong number of bytes from journal, expected: %lu actual: %zd", (uint8_t *)&v35, 0x16u);
        }
        goto LABEL_22;
      }
      *((_BYTE *)v9 + v17) = 0;
      v19 = sqlite3_exec((sqlite3 *)objc_msgSend(v6, "sqlDB"), (const char *)v9, 0, 0, 0);
      if (v19)
      {
        v20 = (sqlite3 *)objc_msgSend(v6, "sqlDB");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("executing SQL statement from journal (%s)"), v9);
        v21 = objc_claimAutoreleasedReturnValue();
        MFLogSQLiteError(v20, v19, v21);
        goto LABEL_22;
      }
    }
  }
  EDLibraryLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 67109376;
    *(_DWORD *)v36 = 1;
    *(_WORD *)&v36[4] = 2048;
    *(_QWORD *)&v36[6] = v33;
    v23 = "found journal file of wrong version, expected: %d actual: %lu";
    v24 = v21;
    v25 = 18;
    goto LABEL_21;
  }
LABEL_22:

  v26 = 1;
LABEL_23:
  free(v9);
  if ((v12 & 0x80000000) == 0)
    close(v12);
  if (v26)
  {
    v27 = *__error();
    if (v27)
      v28 = v27;
    else
      v28 = -1;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (int64_t)mergeAllJournalsUsingConnection:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFDbJournal legacyJournal](MFDbJournal, "legacyJournal");
  v5 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "preparedStatementForQueryString:", CFSTR("SELECT url FROM mailboxes WHERE reconcile = '1'"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __47__MFDbJournal_mergeAllJournalsUsingConnection___block_invoke;
  v42[3] = &unk_1E4E8A048;
  v7 = v27;
  v43 = v7;
  v41 = 0;
  v29 = v6;
  v8 = objc_msgSend(v6, "executeUsingBlock:error:", v42, &v41);
  v9 = v41;
  v30 = v9;
  if ((v8 & 1) == 0)
    objc_msgSend(v31, "handleError:message:", v9, CFSTR("getting mailboxes to be reconciled"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(a1, "_journalForMailbox:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "mailboxType") == 7)
            objc_msgSend(v4, "insertObject:atIndex:", v16, 0);
          else
            objc_msgSend(v4, "addObject:", v16);
        }
        else
        {
          EDLibraryLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v14;
            _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "Could not find mailbox for %@", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v17 = 0;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
LABEL_20:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v19)
        objc_enumerationMutation(obj);
      v21 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * v20);
      v22 = objc_msgSend(v21, "mergeUsingConnection:", v31);
      v23 = (id)_journals;
      objc_sync_enter(v23);
      if (v21[2])
        objc_msgSend((id)_journals, "removeObjectForKey:");
      objc_sync_exit(v23);

      v17 |= v22;
      if ((v17 & 1) != 0)
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v18)
          goto LABEL_20;
        break;
      }
    }
  }

  EDLibraryLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    MFDBJournalMergeResultString(v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v25;
    _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "MFProtectedDatabaseMergeResult %@", buf, 0xCu);

  }
  return v17;
}

void __47__MFDbJournal_mergeAllJournalsUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (int64_t)mergeUsingConnection:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  int fd;
  MFDbJournal *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  char v25;
  id v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  int v37;
  char *v38;
  int64_t v39;
  id v40;
  __int128 v42;
  pthread_mutex_t *v43;
  NSObject *obj;
  id v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[7];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  __int128 buf;
  uint64_t v57;
  int v58;
  uint8_t v59[32];
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  fd = self->_fd;
  if (fd != -1)
  {
    close(fd);
    self->_fd = -1;
  }
  v6 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = p_lock;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6->_path, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingFunction:context:", _sortFilenamesAlphabetically, 0);
  v60 = 0u;
  v61 = 0u;
  memset(v59, 0, sizeof(v59));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v59, &buf, 16);
  if (v11)
  {
    v12 = **(_QWORD **)&v59[16];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (**(_QWORD **)&v59[16] != v12)
          objc_enumerationMutation(v10);
        -[NSString stringByAppendingPathComponent:](v6->_path, "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)&v59[8] + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v59, &buf, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v7, "count"))
  {
    EDLibraryLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "No journal files found", (uint8_t *)&buf, 2u);
    }
    goto LABEL_40;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = v7;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v16)
  {
LABEL_40:

    v39 = 0;
    goto LABEL_44;
  }
  obj = v15;
  v46 = *(_QWORD *)v52;
  v18 = *MEMORY[0x1E0CB2AF0];
  *(_QWORD *)&v17 = 138412546;
  v42 = v17;
LABEL_13:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v52 != v46)
      objc_enumerationMutation(obj);
    v20 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v19);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributesOfItemAtPath:error:", v20, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "objectForKeyedSubscript:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue") > 0;

    if (!v24)
    {
      EDLibraryLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_DEFAULT, "Skipping empty journal file %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_35;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v57 = 0x2020000000;
    v58 = -1431655766;
    v50 = 0;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __36__MFDbJournal_mergeUsingConnection___block_invoke;
    v49[3] = &unk_1E4E8AA58;
    v49[5] = v20;
    v49[6] = &buf;
    v49[4] = v6;
    v25 = objc_msgSend(v45, "performWithOptions:transactionError:block:", 3, &v50, v49);
    v26 = v50;
    v27 = v26;
    if (*(_DWORD *)(*((_QWORD *)&buf + 1) + 24))
    {
      EDLibraryLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v37 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
        v38 = strerror(v37);
        *(_DWORD *)v59 = 138412802;
        *(_QWORD *)&v59[4] = v20;
        *(_WORD *)&v59[12] = 1024;
        *(_DWORD *)&v59[14] = v37;
        *(_WORD *)&v59[18] = 2080;
        *(_QWORD *)&v59[20] = v38;
        _os_log_error_impl(&dword_1A4F90000, v28, OS_LOG_TYPE_ERROR, "An error occurred while processing %@ (error %d: %s)", v59, 0x1Cu);
      }

      v29 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) == 1;
LABEL_31:
      if (v29)
        v34 = 1;
      else
        v34 = 2;
      goto LABEL_34;
    }
    if ((v25 & 1) == 0)
    {
      v35 = objc_msgSend(v26, "code");
      EDLibraryLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v59 = v42;
        *(_QWORD *)&v59[4] = v20;
        *(_WORD *)&v59[12] = 1024;
        *(_DWORD *)&v59[14] = v35;
        _os_log_error_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_ERROR, "An error occurred while committing transaction for %@ (sqlite error %d)", v59, 0x12u);
      }

      v29 = v35 == 778;
      goto LABEL_31;
    }
    EDLibraryLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 138412290;
      *(_QWORD *)&v59[4] = v20;
      _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_DEFAULT, "Successfully reconciled journal file %@", v59, 0xCu);
    }

    v32 = (id)MFRemoveItemAtPath();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "createFileAtPath:contents:attributes:", v20, 0, 0);

    v34 = 0;
LABEL_34:

    _Block_object_dispose(&buf, 8);
    if (v34)
      break;
LABEL_35:
    if (v16 == ++v19)
    {
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v16)
        goto LABEL_13;
      v15 = obj;
      goto LABEL_40;
    }
  }

  if (v34 == 1)
  {
    v39 = 1;
    goto LABEL_46;
  }
  v39 = 2;
LABEL_44:
  v40 = (id)MFRemoveItemAtPath();
  if (v6->_mailbox)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __36__MFDbJournal_mergeUsingConnection___block_invoke_41;
    v47[3] = &unk_1E4E8A760;
    v47[4] = v6;
    v48 = v45;
    objc_msgSend(v48, "performWithOptions:transactionError:block:", 3, 0, v47);

  }
LABEL_46:
  pthread_mutex_unlock(v43);

  return v39;
}

BOOL __36__MFDbJournal_mergeUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_processJournalFile:connection:", *(_QWORD *)(a1 + 40), v3);
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;

  return v4;
}

uint64_t __36__MFDbJournal_mergeUsingConnection___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markMailboxForReconciliation:connection:", 0, *(_QWORD *)(a1 + 40));
}

- (BOOL)_markMailboxForReconciliation:(BOOL)a3 connection:(id)a4
{
  _BOOL4 v4;
  id v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  const char *v9;
  id v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a4, "preparedStatementForQueryString:", CFSTR("UPDATE mailboxes SET reconcile = ? WHERE url = ?"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (sqlite3_stmt *)objc_msgSend(v6, "compiled");
  v8 = v7;
  if (v7)
  {
    if (v4)
      v9 = "1";
    else
      v9 = "0";
    sqlite3_bind_text(v7, 1, v9, 1, 0);
    -[MFMailboxUid URLString](self->_mailbox, "URLString");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v8, 2, (const char *)objc_msgSend(v10, "UTF8String"), -1, 0);

    v11 = sqlite3_step(v8) == 101;
  }
  else
  {
    v11 = 0;
  }
  sqlite3_reset(v8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
