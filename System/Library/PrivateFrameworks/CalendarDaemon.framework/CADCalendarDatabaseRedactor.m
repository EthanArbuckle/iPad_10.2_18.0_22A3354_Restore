@implementation CADCalendarDatabaseRedactor

- (CADCalendarDatabaseRedactor)initWithPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  CADCalendarDatabaseRedactor *v8;
  uint64_t v9;
  NSURL *path;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADCalendarDatabaseRedactor;
  v8 = -[CADCalendarDatabaseRedactor init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    path = v8->_path;
    v8->_path = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (BOOL)redact
{
  id v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;
  sqlite3 *ppDb;

  -[CADCalendarDatabaseRedactor path](self, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (!v4)
    return 0;
  ppDb = 0;
  v5 = sqlite3_open_v2(v4, &ppDb, 2, 0);
  if ((_DWORD)v5)
  {
    -[CADDiagnosticLogContext logError:](self->_context, "logError:", CFSTR("Sqlite error opening database: %d\n"), v5);
    return 0;
  }
  if (-[CADCalendarDatabaseRedactor _redactOmatic:](self, "_redactOmatic:", ppDb))
    v6 = -[CADCalendarDatabaseRedactor _specialRedactions:](self, "_specialRedactions:", ppDb);
  else
    v6 = 0;
  sqlite3_close(ppDb);
  return v6;
}

- (BOOL)_redactOmatic:(sqlite3 *)a3
{
  char *v5;
  char *v6;
  const char **v7;
  uint64_t v8;
  uint64_t *v9;
  void (__cdecl *v10)(void *);
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t *v17;
  const void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int n;
  sqlite3_stmt *pStmt;
  sqlite3_stmt *ppStmt;
  char *v27;
  char *zSql;

  v5 = strdup("SELECT rowid");
  v6 = strdup(" ");
  sqlite3_exec(a3, "BEGIN", 0, 0, 0);
  v7 = (const char **)&dbRedactionActions;
  v9 = &qword_1EF144020;
  v8 = qword_1EF144020;
  v10 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
  while (1)
  {
    v11 = v9;
    if (v8)
      break;
    zSql = 0;
    asprintf(&zSql, "%s, %s", v5, (const char *)v9[1]);
    free(v5);
    v5 = zSql;
    v27 = 0;
    asprintf(&v27, "%s %s = ?,", v6, (const char *)v11[1]);
    free(v6);
    v6 = v27;
LABEL_16:
    v9 = v11 + 3;
    v8 = v11[3];
    if (!v8 && !v11[4])
    {
      free(v5);
      free(v6);
      sqlite3_exec(a3, "COMMIT", 0, 0, 0);
      return 1;
    }
  }
  zSql = 0;
  asprintf(&zSql, "%s FROM %s", v5, *v7);
  free(v5);
  v12 = strrchr(v6, 44);
  if (v12)
    *v12 = 0;
  v27 = 0;
  asprintf(&v27, "UPDATE %s SET %s WHERE rowid = ?", *v7, v6);
  free(v6);
  pStmt = 0;
  ppStmt = 0;
  v13 = sqlite3_prepare_v2(a3, zSql, -1, &ppStmt, 0);
  if ((_DWORD)v13)
  {
    -[CADDiagnosticLogContext logError:](self->_context, "logError:", CFSTR("Select Prep Error: %d, statement: %s"), v13, zSql);
    return 0;
  }
  v14 = sqlite3_prepare_v2(a3, v27, -1, &pStmt, 0);
  if ((_DWORD)v14)
  {
    -[CADDiagnosticLogContext logError:](self->_context, "logError:", CFSTR("Update Prep Error: %d, statement: %s"), v14, v27);
    return 0;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
LABEL_14:
    sqlite3_exec(a3, "COMMIT", 0, 0, 0);
    sqlite3_finalize(ppStmt);
    sqlite3_finalize(pStmt);
    free(zSql);
    free(v27);
    v5 = strdup("SELECT rowid");
    v6 = strdup(" ");
    sqlite3_exec(a3, "BEGIN", 0, 0, 0);
    v7 = (const char **)v11;
    goto LABEL_16;
  }
  while (1)
  {
    v15 = sqlite3_column_int(ppStmt, 0);
    if (v7[3])
    {
      v16 = 1;
    }
    else
    {
      v16 = 1;
      v17 = (uint64_t *)(v7 + 6);
      do
      {
        v18 = sqlite3_column_blob(ppStmt, v16);
        n = 0;
        n = sqlite3_column_bytes(ppStmt, v16);
        v19 = (const void *)((uint64_t (*)(CADCalendarDatabaseRedactor *, const void *, int *))*(v17 - 1))(self, v18, &n);
        sqlite3_bind_blob(pStmt, v16++, v19, n, v10);
        v20 = *v17;
        v17 += 3;
      }
      while (!v20);
    }
    sqlite3_bind_int(pStmt, v16, v15);
    v21 = sqlite3_step(pStmt);
    if ((_DWORD)v21 != 101)
      break;
    sqlite3_reset(pStmt);
    if (sqlite3_step(ppStmt) != 100)
      goto LABEL_14;
  }
  -[CADDiagnosticLogContext logError:](self->_context, "logError:", CFSTR("Sqlite step error: %d"), v21, v23);
  return 0;
}

- (BOOL)_specialRedactions:(sqlite3 *)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  void *v8;
  void *v9;
  sqlite3_stmt *v10;
  id v11;
  sqlite3_stmt *pStmt;
  sqlite3_stmt *ppStmt;
  _BYTE v15[20];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  sqlite3_exec(a3, "BEGIN", 0, 0, 0);
  sqlite3_exec(a3, "UPDATE location SET latitude = 0, longitude = 0", 0, 0, 0);
  v4 = strdup("SELECT rowid, key from _SqliteDatabaseProperties where key like '%-CalDAVInfo'");
  v5 = strdup("UPDATE _SqliteDatabaseProperties SET key = ? where rowid = ?");
  pStmt = 0;
  ppStmt = 0;
  sqlite3_prepare_v2(a3, v4, -1, &ppStmt, 0);
  sqlite3_prepare_v2(a3, v5, -1, &pStmt, 0);
  while (sqlite3_step(ppStmt) == 100)
  {
    v6 = sqlite3_column_int(ppStmt, 0);
    v7 = sqlite3_column_text(ppStmt, 1);
    strlen((const char *)v7);
    ICSRedactBytes();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15, 20, 4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d-CalDAVInfo"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = pStmt;
    v11 = objc_retainAutorelease(v9);
    sqlite3_bind_text(v10, 1, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0);
    sqlite3_bind_int(pStmt, 2, v6);
    sqlite3_step(pStmt);
    sqlite3_reset(pStmt);

  }
  sqlite3_finalize(ppStmt);
  sqlite3_finalize(pStmt);
  free(v4);
  free(v5);
  sqlite3_exec(a3, "COMMIT", 0, 0, 0);
  return 1;
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
