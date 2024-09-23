@implementation MFPersistenceDatabaseConnection_iOS

- (int64_t)transactionTypeForWriting
{
  return 1;
}

- (BOOL)performWithOptions:(unint64_t)a3 transactionError:(id *)a4 block:(id)a5
{
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
  v9 = -[EDPersistenceDatabaseConnection performWithOptions:transactionError:block:](&v14, sel_performWithOptions_transactionError_block_, a3, a4, v8);
  if (!v9)
  {
    +[EDPersistenceDatabaseConnection log](MFPersistenceDatabaseConnection_iOS, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Resetting mailbox cache after database transaction failed", v13, 2u);
    }

    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadMailboxCacheWithConnection:", self);

  }
  return v9;
}

- (int)configureSQLConnection
{
  sqlite3 *v3;
  int function;
  __CFString *v5;
  _QWORD *inited;
  _MFSearchMatcherContext *v7;
  _MFSearchMatcherContext *CPSearchContext;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = -[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB");
  function = sqlite3_extended_result_codes(v3, 1);
  if (function)
  {
    v5 = CFSTR("enabling extended error codes");
  }
  else
  {
    inited = initICUSearchContext();
    self->_ICUSearchContext = inited;
    function = sqlite3_create_function(v3, "icusearch", 3, 1, inited, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ICUSearch, 0, 0);
    if (function)
    {
      v5 = CFSTR("creating custom icusearch function");
    }
    else
    {
      v7 = objc_alloc_init(_MFSearchMatcherContext);
      CPSearchContext = self->_CPSearchContext;
      self->_CPSearchContext = v7;

      function = sqlite3_create_function(v3, "cpsearch", 3, 1, self->_CPSearchContext, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))CPSearch, 0, 0);
      if (function)
      {
        v5 = CFSTR("creating custom cpsearch function");
      }
      else
      {
        function = sqlite3_exec_retry(v3, "PRAGMA cache_size = 1000;", 0, 0, 0);
        if (function)
        {
          v5 = CFSTR("setting cache_size");
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
          function = -[EDPersistenceDatabaseConnection configureSQLConnection](&v12, sel_configureSQLConnection);
          if (!function)
          {
            v5 = 0;
            goto LABEL_12;
          }
          v9 = (void *)MEMORY[0x1E0CB3940];
          -[EDPersistenceDatabaseConnection fullPath](self, "fullPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("configuring sql connection for %@"), v10);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  MFLogSQLiteError(v3, function, v5);
LABEL_12:

  return function;
}

- (void)handleSQLResult:(int)a3 message:(id)a4
{
  sqlite3 *v6;
  id v7;

  v7 = a4;
  v6 = -[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB");
  if ((a3 - 100) >= 2 && a3)
    MFLogSQLiteError(v6, a3, v7);
  switch((char)a3)
  {
    case 5:
      -[MFPersistenceDatabaseConnection_iOS _handleBusyError](self);
      break;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
      break;
    case 10:
      if (-[EDPersistenceDatabaseConnection protectedDatabaseAttached](self, "protectedDatabaseAttached"))
      {
        -[MFPersistenceDatabaseConnection_iOS _handleProtectedDataIOError]((uint64_t)self);
      }
      else if (-[EDPersistenceDatabaseConnection sqlDB](self, "sqlDB"))
      {
        -[MFPersistenceDatabaseConnection_iOS _handleIOError](self);
      }
      else
      {
        -[MFPersistenceDatabaseConnection_iOS _handleInvalidDatabaseIOError](self);
      }
      break;
    case 11:
      goto LABEL_7;
    case 13:
      -[MFPersistenceDatabaseConnection_iOS _handleFullDatabase](self);
      break;
    default:
      if (a3 == 26)
LABEL_7:
        -[MFPersistenceDatabaseConnection_iOS _handleCorruptDatabase](self);
      break;
  }

}

- (void)dealloc
{
  void *ICUSearchContext;
  objc_super v4;

  ICUSearchContext = self->_ICUSearchContext;
  if (ICUSearchContext)
    freeICUSearchContext(ICUSearchContext, a2);
  v4.receiver = self;
  v4.super_class = (Class)MFPersistenceDatabaseConnection_iOS;
  -[EDPersistenceDatabaseConnection dealloc](&v4, sel_dealloc);
}

- (void)_handleCorruptDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Abort if mobilemail: database corrupt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleFullDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Abort if mobilemail: file system out of space", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (uint64_t)_handleProtectedDataIOError
{
  void *v1;
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = (void *)result;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isInternal") & 1) != 0)
  {

LABEL_5:
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      EFContentProtectionDumpDiagnosticState();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Warning %@", (uint8_t *)&v9, 0xCu);

    }
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[MFPersistenceDatabaseConnection_iOS _handleProtectedDataIOError].cold.2();

    goto LABEL_10;
  }
  v3 = EFIsSeedBuild();

  if ((v3 & 1) != 0)
    goto LABEL_5;
LABEL_10:
  MFLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    MEMORY[0x1A85AFB64]();
    EFContentProtectionStateDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPersistenceDatabaseConnection_iOS _handleProtectedDataIOError].cold.1(v8, (uint8_t *)&v9, v7);
  }

  return objc_msgSend(v1, "setHadIOError:", 1);
}

- (void)_handleInvalidDatabaseIOError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Abort if mobilemail: database I/O error, missing sqlDB pointer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleIOError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Abort if mobilemail: database I/O error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleBusyError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Abort if mobilemail: SQLITE_BUSY", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_logFileSystemStats
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    MFMailDirectory();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v1, "attributesOfFileSystemForPath:error:", v2, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;

    if (v3)
    {
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2B10]);
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2B00]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "#Warning %@/%@ bytes (free/total)", buf, 0x16u);
      }

    }
    else
    {
      if (!v4)
        goto LABEL_7;
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Warning failure to get file system size: %@", buf, 0xCu);
      }
    }

LABEL_7:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CPSearchContext, 0);
}

- (void)_handleProtectedDataIOError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4F90000, v0, v1, "Access to protected data went away during transaction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
