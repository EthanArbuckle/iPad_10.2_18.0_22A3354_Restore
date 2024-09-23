@implementation MFSqliteMessageIDStore

- (MFSqliteMessageIDStore)initWithLibrary:(id)a3 URLString:(id)a4
{
  id v7;
  id v8;
  MFSqliteMessageIDStore *v9;
  MFSqliteMessageIDStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFSqliteMessageIDStore;
  v9 = -[MFSqliteMessageIDStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_url, a4);
    v10->_mailboxRowid = -1;
  }

  return v10;
}

- (void)_loadMailboxRowidIfNecessary:(id)a3
{
  id v4;
  void *v5;
  sqlite3_stmt *v6;
  id v7;

  v4 = a3;
  if (self->_mailboxRowid == -1)
  {
    v7 = v4;
    objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("SELECT ROWID from mailboxes WHERE url = ?;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");
    if (v6)
    {
      sqlite3_bind_text(v6, 1, -[NSString UTF8String](self->_url, "UTF8String"), -1, 0);
      if (sqlite3_step(v6) == 100)
        self->_mailboxRowid = sqlite3_column_int64(v6, 0);
      sqlite3_reset(v6);
    }

    v4 = v7;
  }

}

- (id)knownMessageIDsFromSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__21;
  v17 = __Block_byref_object_dispose__21;
  v18 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary database](self->_library, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore knownMessageIDsFromSet:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MFSqliteMessageIDStore_knownMessageIDsFromSet___block_invoke;
  v10[3] = &unk_1E4E89F60;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __49__MFSqliteMessageIDStore_knownMessageIDsFromSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT 1 FROM pop_uids WHERE mailbox = ? AND uid = ? AND flags IS NULL;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      while (1)
      {
        objc_msgSend(v7, "nextObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          break;
        v8 = objc_retainAutorelease(v9);
        sqlite3_bind_text(v6, 2, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);
        if (sqlite3_step(v6) == 100)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v8);
        sqlite3_reset(v6);
      }

    }
  }

  return 1;
}

- (id)messageIDsAddedBeforeDate:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  -[MFMailMessageLibrary database](self->_library, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore messageIDsAddedBeforeDate:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__MFSqliteMessageIDStore_messageIDsAddedBeforeDate___block_invoke;
  v9[3] = &unk_1E4E8EFB8;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __52__MFSqliteMessageIDStore_messageIDsAddedBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT uid FROM pop_uids WHERE mailbox = ? AND date_added < ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      sqlite3_bind_int(v6, 2, (int)*(double *)(a1 + 48));
      while (sqlite3_step(v6) == 100)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v6, 0));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        if (v8)
        {
          objc_msgSend(v8, "addObject:", v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

        }
      }
      sqlite3_reset(v6);
    }

  }
  return 1;
}

- (void)deleteUIDsNotInArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MFMailMessageLibrary database](self->_library, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore deleteUIDsNotInArray:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MFSqliteMessageIDStore_deleteUIDsNotInArray___block_invoke;
  v8[3] = &unk_1E4E8A760;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __47__MFSqliteMessageIDStore_deleteUIDsNotInArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  void *v6;
  void *v7;
  const unsigned __int8 *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  sqlite3_stmt *v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  id v17;
  int v18;
  BOOL v19;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == -1)
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v21 = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_INFO, "no entry for mailbox %@?", (uint8_t *)&v21, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT uid FROM pop_uids WHERE mailbox = ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      while (sqlite3_step(v5) == 100)
      {
        v8 = sqlite3_column_text(v5, 0);
        if (v8)
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v8);
          if ((objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
            objc_msgSend(v6, "addObject:", v9);

        }
      }
      sqlite3_reset(v5);

    }
    else
    {
      v6 = 0;
    }
    v12 = objc_msgSend(v6, "count");
    if (v12)
    {
      objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM pop_uids WHERE mailbox = ? AND uid = ?;"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (sqlite3_stmt *)objc_msgSend(v13, "compiled");
      v15 = v14;
      if (v14)
      {
        sqlite3_bind_int64(v14, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
        v16 = v12 - 1;
        do
        {
          objc_msgSend(v6, "objectAtIndex:", v16);
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v17, "UTF8String"), -1, 0);
          v18 = sqlite3_step(v15);
          sqlite3_reset(v15);

          v19 = v16-- != 0;
        }
        while (v19 && v18 == 101);
      }
      v4 = v13;
    }

  }
  return 1;
}

- (unsigned)numberOfMessageIDs
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MFMailMessageLibrary database](self->_library, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore numberOfMessageIDs]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MFSqliteMessageIDStore_numberOfMessageIDs__block_invoke;
  v6[3] = &unk_1E4E8A698;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__MFSqliteMessageIDStore_numberOfMessageIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT COUNT() FROM pop_uids WHERE mailbox = ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      if (sqlite3_step(v6) == 100)
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(v6, 0);
    }
    sqlite3_reset(v6);

  }
  return 1;
}

- (void)deleteAllUIDs
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[MFMailMessageLibrary database](self->_library, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore deleteAllUIDs]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MFSqliteMessageIDStore_deleteAllUIDs__block_invoke;
  v5[3] = &unk_1E4E8AB20;
  v5[4] = self;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);

}

uint64_t __39__MFSqliteMessageIDStore_deleteAllUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM pop_uids WHERE mailbox = ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      sqlite3_step(v6);
    }
    sqlite3_reset(v6);

  }
  return 1;
}

- (unint64_t)flagsForUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[MFMailMessageLibrary database](self->_library, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSqliteMessageIDStore flagsForUID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__MFSqliteMessageIDStore_flagsForUID___block_invoke;
  v10[3] = &unk_1E4E89F60;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __38__MFSqliteMessageIDStore_flagsForUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadMailboxRowidIfNecessary:", v3);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT flags FROM pop_uids WHERE mailbox = ? AND uid = ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      sqlite3_bind_text(v6, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      if (sqlite3_step(v6) == 100)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v6, 0);
      sqlite3_reset(v6);
    }

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
