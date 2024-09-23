@implementation CADDiagnosticsDatabaseCollectorDBInfo

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 context:(id)a4
{
  id v6;
  CADDiagnosticsDatabaseCollectorDBInfo *v7;
  const __CFString *v8;
  uint64_t v9;
  NSURL *outputURL;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  v7 = -[CADDiagnosticsDatabaseCollectorDBInfo init](&v12, sel_init);
  if (v7)
  {
    if (objc_msgSend(v6, "redactLogs"))
      v8 = CFSTR("Calendar-redacted.sqlitedb.gz");
    else
      v8 = CFSTR("Calendar.sqlitedb.gz");
    objc_msgSend(v6, "temporaryFileForName:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    outputURL = v7->_outputURL;
    v7->_outputURL = (NSURL *)v9;

    v7->_mainDatabase = a3;
    CFRetain(a3);
  }

  return v7;
}

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithMainDatabase:(CalDatabase *)a3 auxDatabase:(void *)a4 context:(id)a5
{
  id v8;
  CADDiagnosticsDatabaseCollectorDBInfo *v9;
  uint64_t UID;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSURL *outputURL;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  v9 = -[CADDiagnosticsDatabaseCollectorDBInfo init](&v16, sel_init);
  if (v9)
  {
    UID = CalAuxDatabaseGetUID();
    if (objc_msgSend(v8, "redactLogs"))
      v11 = CFSTR("Calendar-aux%i-redacted.sqlitedb.gz");
    else
      v11 = CFSTR("Calendar-aux%i.sqlitedb.gz");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, UID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "temporaryFileForName:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    outputURL = v9->_outputURL;
    v9->_outputURL = (NSURL *)v13;

    v9->_mainDatabase = a3;
    CFRetain(a3);
    v9->_auxDatabase = a4;
    CFRetain(a4);

  }
  return v9;
}

- (CADDiagnosticsDatabaseCollectorDBInfo)initWithPossiblyUnmigratedDatabaseDirectory:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  CADDiagnosticsDatabaseCollectorDBInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  CADDiagnosticsDatabaseCollectorDBInfo *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *v24;
  void *v25;
  uint64_t v26;
  NSURL *walOutputURL;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSURL *outputURL;
  uint64_t v33;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  v8 = -[CADDiagnosticsDatabaseCollectorDBInfo init](&v36, sel_init);
  if (v8)
  {
    CalDatabaseMovedAsideDatabaseFilePathInDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_movedAsideDatabasePath, v9);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "fileExistsAtPath:", v9))
    {
LABEL_17:
      v13 = v8;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v7, "log:", CFSTR("Found moved aside database at %@"), v9);
    objc_msgSend(v6, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Calendar")) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", CFSTR("Calendars")) & 1) != 0)
    {
      v12 = &stru_1E6A39768;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v7, "redactLogs") & 1) != 0)
    {
      ppDb = 0;
      v14 = objc_retainAutorelease(v9);
      if (sqlite3_open_v2((const char *)objc_msgSend(v14, "fileSystemRepresentation"), &ppDb, 1, 0) || !ppDb)
      {
        objc_msgSend(v7, "logError:", CFSTR("Couldn't open database at path %@"), v14, v33);
      }
      else
      {
        ppStmt = 0;
        v15 = sqlite3_prepare_v2(ppDb, "SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion'", -1, &ppStmt, 0);
        if ((_DWORD)v15 || !ppStmt)
        {
          objc_msgSend(v7, "logError:", CFSTR("Couldn't check moved-aside database version at path %@: %i"), v14, v15);
          sqlite3_close(ppDb);
        }
        else
        {
          v16 = sqlite3_step(ppStmt);
          if ((_DWORD)v16 == 100)
          {
            v17 = sqlite3_column_int(ppStmt, 0);
          }
          else
          {
            objc_msgSend(v7, "logError:", CFSTR("Unexpectedly got result %i for sqlite3_step"), v16);
            v17 = 0;
          }
          sqlite3_finalize(ppStmt);
          v28 = sqlite3_close(ppDb);
          if ((_DWORD)v28)
            objc_msgSend(v7, "logError:", CFSTR("Error closing database: %i"), v28);
          if ((_DWORD)v17 == 18010)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calendar-unableToMigrate-%@redacted.sqlitedb.gz"), v12);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "temporaryFileForName:", v29);
            v30 = objc_claimAutoreleasedReturnValue();
            outputURL = v8->_outputURL;
            v8->_outputURL = (NSURL *)v30;

            goto LABEL_16;
          }
          objc_msgSend(v7, "logError:", CFSTR("Cannot attach moved aside database because it is version %i and the current version is %i"), v17, 18010);
        }
      }

      v13 = 0;
      goto LABEL_27;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@"), v12, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringByAppendingString:", CFSTR("-wal"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("gz"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "temporaryFileForName:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v8->_outputURL;
    v8->_outputURL = (NSURL *)v23;

    objc_msgSend(v21, "stringByAppendingPathExtension:", CFSTR("gz"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "temporaryFileForName:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    walOutputURL = v8->_walOutputURL;
    v8->_walOutputURL = (NSURL *)v26;

LABEL_16:
    goto LABEL_17;
  }
  v13 = 0;
LABEL_28:

  return v13;
}

- (void)dealloc
{
  void *auxDatabase;
  CalDatabase *mainDatabase;
  objc_super v5;

  auxDatabase = self->_auxDatabase;
  if (auxDatabase)
    CFRelease(auxDatabase);
  mainDatabase = self->_mainDatabase;
  if (mainDatabase)
    CFRelease(mainDatabase);
  v5.receiver = self;
  v5.super_class = (Class)CADDiagnosticsDatabaseCollectorDBInfo;
  -[CADDiagnosticsDatabaseCollectorDBInfo dealloc](&v5, sel_dealloc);
}

- (void)determineExpectedOutputFiles:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setStatus:forFile:", 0, self->_outputURL);
  if (self->_walOutputURL)
    objc_msgSend(v4, "setStatus:forFile:", 0);

}

- (void)collect:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "canceled") & 1) == 0)
  {
    if (self->_movedAsideDatabasePath)
      -[CADDiagnosticsDatabaseCollectorDBInfo collectMovedAsideDatabase:](self, "collectMovedAsideDatabase:", v4);
    else
      -[CADDiagnosticsDatabaseCollectorDBInfo collectStandardDatabase:](self, "collectStandardDatabase:", v4);
  }

}

- (void)collectStandardDatabase:(id)a3
{
  NSURL **p_outputURL;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t mainDatabase;
  const void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (!self->_mainDatabase)
  {
    -[NSURL lastPathComponent](self->_outputURL, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logError:", CFSTR("No main database; can't collect %@"), v12);

    v9 = 0;
    goto LABEL_18;
  }
  p_outputURL = &self->_outputURL;
  if (self->_auxDatabase)
    v5 = CFSTR("an auxiliary");
  else
    v5 = CFSTR("the main");
  -[NSURL lastPathComponent](self->_outputURL, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "log:", CFSTR("Collecting %@ database (for output file %@)"), v5, v6);

  -[NSURL lastPathComponent](*p_outputURL, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "temporaryFileForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  mainDatabase = (uint64_t)self->_mainDatabase;
  if (self->_auxDatabase)
  {
    mainDatabase = CalDatabaseCreateWithAuxDatabaseRef();
    v11 = (const void *)mainDatabase;
  }
  else
  {
    v11 = 0;
  }

  if (!mainDatabase)
  {
    objc_msgSend(v14, "logError:", CFSTR("Unable to create database"));
    goto LABEL_18;
  }
  if (!CalDatabaseBackupDatabaseFile())
  {
    objc_msgSend(v14, "logError:", CFSTR("Unable to backup database"));
    if (v11)
      CFRelease(v11);
    goto LABEL_18;
  }
  if (v11)
    CFRelease(v11);
  if (!-[CADDiagnosticsDatabaseCollectorDBInfo redactAndCompress:context:](self, "redactAndCompress:context:", v9, v14))
  {
LABEL_18:
    p_outputURL = &self->_outputURL;
    v13 = 3;
    goto LABEL_19;
  }
  v13 = 2;
LABEL_19:
  objc_msgSend(v14, "setStatus:forFile:", v13, *p_outputURL);

}

- (void)collectMovedAsideDatabase:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "redactLogs"))
  {
    if (-[CADDiagnosticsDatabaseCollectorDBInfo collectMovedAsideDatabaseWithoutRedacting:](self, "collectMovedAsideDatabaseWithoutRedacting:", v5))
    {
      goto LABEL_3;
    }
LABEL_5:
    v4 = 3;
    goto LABEL_6;
  }
  if (!-[CADDiagnosticsDatabaseCollectorDBInfo redactAndCollectMovedAsideDatabase:](self, "redactAndCollectMovedAsideDatabase:", v5))goto LABEL_5;
LABEL_3:
  v4 = 2;
LABEL_6:
  objc_msgSend(v5, "setStatus:forFile:", v4, self->_outputURL);

}

- (BOOL)backupDatabaseFromPath:(id)a3 toPath:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  const char *v13;
  BOOL v14;
  sqlite3_backup *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  sqlite3 *v23;
  sqlite3 *ppDb;

  v7 = a4;
  v8 = a5;
  ppDb = 0;
  v23 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__CADDiagnosticsDatabaseCollectorDBInfo_backupDatabaseFromPath_toPath_context___block_invoke;
  v18[3] = &unk_1E6A38440;
  v20 = 0;
  v9 = v8;
  v21 = 0;
  v22 = 0;
  v19 = v9;
  v10 = a3;
  v11 = (void (**)(_QWORD))MEMORY[0x1BCC9D8DC](v18);
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

  v14 = 0;
  if (!sqlite3_open_v2(v13, &ppDb, 1, 0))
  {
    if (ppDb)
    {
      v14 = 0;
      if (!sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), &v23, 6, 0))
      {
        if (v23)
        {
          v15 = sqlite3_backup_init(v23, "main", ppDb, "main");
          if (v15)
          {
            v16 = sqlite3_backup_step(v15, -1);
            if ((_DWORD)v16 != 101)
              objc_msgSend(v9, "logError:", CFSTR("Unexpected result to sqlite3_backup_step: %i"), v16);
            v14 = 1;
          }
          else
          {
            v14 = 0;
          }
        }
      }
    }
  }
  v11[2](v11);

  return v14;
}

sqlite3 *__79__CADDiagnosticsDatabaseCollectorDBInfo_backupDatabaseFromPath_toPath_context___block_invoke(uint64_t a1)
{
  sqlite3_backup *v2;
  uint64_t v3;
  sqlite3 *v4;
  uint64_t v5;
  sqlite3 *result;

  v2 = *(sqlite3_backup **)(a1 + 40);
  if (v2)
  {
    v3 = sqlite3_backup_finish(v2);
    if ((_DWORD)v3)
      objc_msgSend(*(id *)(a1 + 32), "logError:", CFSTR("Error finishing the backup: %i"), v3);
  }
  v4 = *(sqlite3 **)(a1 + 48);
  if (v4)
  {
    v5 = sqlite3_close(v4);
    if ((_DWORD)v5)
      objc_msgSend(*(id *)(a1 + 32), "logError:", CFSTR("Error closing source db in backup: %i"), v5);
  }
  result = *(sqlite3 **)(a1 + 56);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    if ((_DWORD)result)
      return (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "logError:", CFSTR("Error closing destination db in backup: %i"), result);
  }
  return result;
}

- (BOOL)redactAndCollectMovedAsideDatabase:(id)a3
{
  id v4;
  void *v5;
  NSString *movedAsideDatabasePath;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "temporaryFileForName:", CFSTR("moved-aside-copy-for-redacting.sqlitedb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  movedAsideDatabasePath = self->_movedAsideDatabasePath;
  objc_msgSend(v5, "absoluteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(movedAsideDatabasePath) = -[CADDiagnosticsDatabaseCollectorDBInfo backupDatabaseFromPath:toPath:context:](self, "backupDatabaseFromPath:toPath:context:", movedAsideDatabasePath, v8, v4);

  if ((movedAsideDatabasePath & 1) != 0)
  {
    v9 = -[CADDiagnosticsDatabaseCollectorDBInfo redactAndCompress:context:](self, "redactAndCompress:context:", v5, v4);
  }
  else
  {
    objc_msgSend(v4, "logError:", CFSTR("Unable to backup database"));
    v9 = 0;
  }

  return v9;
}

- (BOOL)collectMovedAsideDatabaseWithoutRedacting:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_movedAsideDatabasePath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CADDiagnosticsUtils compressFileAt:to:context:](CADDiagnosticsUtils, "compressFileAt:to:context:", v5, self->_outputURL, v4);
  if (v6)
  {
    -[NSString stringByAppendingString:](self->_movedAsideDatabasePath, "stringByAppendingString:", CFSTR("-wal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CADDiagnosticsUtils compressFileAt:to:context:](CADDiagnosticsUtils, "compressFileAt:to:context:", v8, self->_walOutputURL, v4))
    {
      v9 = 2;
    }
    else
    {
      v9 = 3;
    }
    objc_msgSend(v4, "setStatus:forFile:", v9, self->_walOutputURL);

  }
  else
  {
    objc_msgSend(v4, "setStatus:forFile:", 3, self->_walOutputURL);
  }

  return v6;
}

- (BOOL)redactAndCompress:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  int v8;
  CADCalendarDatabaseRedactor *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "redactLogs") && (objc_msgSend(v7, "canceled") & 1) == 0)
  {
    v9 = -[CADCalendarDatabaseRedactor initWithPath:context:]([CADCalendarDatabaseRedactor alloc], "initWithPath:context:", v6, v7);
    v8 = -[CADCalendarDatabaseRedactor redact](v9, "redact");
    if ((v8 & 1) == 0)
      objc_msgSend(v7, "logError:", CFSTR("Calendar database redaction failed; calendar database will not be attached."));

  }
  else
  {
    v8 = 1;
  }
  v10 = objc_msgSend(v7, "canceled");
  v11 = 0;
  if (v8 && !v10)
  {
    if (!+[CADDiagnosticsUtils compressFileAt:to:context:](CADDiagnosticsUtils, "compressFileAt:to:context:", v6, self->_outputURL, v7))
    {
      objc_msgSend(v7, "logError:", CFSTR("Error compressing database file"));
      objc_msgSend(v7, "deleteTemporaryFile:", self->_outputURL);
      v11 = 0;
      if (!v6)
        goto LABEL_13;
      goto LABEL_12;
    }
    v11 = 1;
  }
  if (v6)
LABEL_12:
    objc_msgSend(v7, "deleteTemporaryFile:", v6);
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedAsideDatabasePath, 0);
  objc_storeStrong((id *)&self->_walOutputURL, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
}

@end
