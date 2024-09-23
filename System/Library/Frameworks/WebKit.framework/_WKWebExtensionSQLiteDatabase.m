@implementation _WKWebExtensionSQLiteDatabase

- (_WKWebExtensionSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _WKWebExtensionSQLiteDatabase *v8;
  uint64_t v9;
  NSURL *url;
  _WKWebExtensionSQLiteDatabase *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_WKWebExtensionSQLiteDatabase;
  v8 = -[_WKWebExtensionSQLiteDatabase init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_WKWebExtensionSQLiteDatabase;
  -[_WKWebExtensionSQLiteDatabase dealloc](&v2, sel_dealloc);
}

- (int)close
{
  int v3;
  NSObject *v4;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = sqlite3_close_v2(self->_handle);
  if (v3)
  {
    v4 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self, "lastErrorMessage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 1024;
      v10 = v3;
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to close database: %{public}@ (%d)", (uint8_t *)&v7, 0x12u);

    }
  }
  else
  {
    self->_handle = 0;
  }
  return v3;
}

- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  NSURL *url;
  void *v12;
  void *v13;
  void *v14;
  WebKit *v15;
  WebKit *v16;
  NSObject *v17;
  NSError *v18;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  if (url)
  {
    v12 = (void *)-[NSURL copy](url, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3308]);

  }
  if (a3)
  {
    v9 = sqlite3_errmsg(self->_handle);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("Message"));

    }
  }
  if (v8)
  {
    v14 = (void *)objc_msgSend(v8, "copy", v9);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("SQL"));

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebKit.SQLite"), a3, v10);
  v15 = (WebKit *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5)
  {
    *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    v17 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      WebKit::privacyPreservingDescription(v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_error_impl(&dword_196BCC000, v17, OS_LOG_TYPE_ERROR, "Unhandled SQLite error: %{public}@", (uint8_t *)&v21, 0xCu);

    }
  }

  return 0;
}

- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5
{
  uint64_t v7;
  char *v9;
  char *v10;
  void *v11;
  BOOL v12;

  v7 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!a4)
    return -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v7, 0, a5);
  v9 = sqlite3_expanded_sql(a4);
  if (!v9)
    return -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v7, 0, a5);
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v7, v11, a5);

  sqlite3_free(v10);
  return v12;
}

- (BOOL)enableWAL:(id *)a3
{
  int v5;
  _WKWebExtensionSQLiteDatabase *v7;
  __CFString *v8;
  _WKWebExtensionSQLiteStatement *v9;
  _WKWebExtensionSQLiteStatement *v10;
  sqlite3_stmt *v11;
  _WKWebExtensionSQLiteDatabase *v12;
  uint64_t v13;
  BOOL v14;

  v5 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(self, a3, CFSTR("PRAGMA synchronous = NORMAL"));
  if (v5 != 101 && v5 != 0)
    return 0;
  v7 = self;
  v8 = CFSTR("PRAGMA journal_mode = WAL");
  v9 = -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:]([_WKWebExtensionSQLiteStatement alloc], "initWithDatabase:query:error:", v7, CFSTR("PRAGMA journal_mode = WAL"), a3);
  v10 = v9;
  if (v9)
  {
    v11 = -[_WKWebExtensionSQLiteStatement handle](v9, "handle");
    v12 = v7;
    v13 = sqlite3_step(v11);
    if ((_DWORD)v13 == 100 && (v13 = sqlite3_step(v11), (_DWORD)v13 == 101))
    {
      v14 = 1;
    }
    else
    {
      -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:statement:error:](v12, "reportErrorWithCode:statement:error:", v13, v11, a3);
      v14 = 0;
    }

    -[_WKWebExtensionSQLiteStatement invalidate](v10, "invalidate");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4
{
  return -[_WKWebExtensionSQLiteDatabase openWithAccessType:vfs:error:](self, "openWithAccessType:vfs:error:", a3, 0, a4);
}

- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5
{
  return -[_WKWebExtensionSQLiteDatabase openWithAccessType:protectionType:vfs:error:](self, "openWithAccessType:protectionType:vfs:error:", a3, 0, a4, a5);
}

- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6
{
  id v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  BOOL v15;

  v10 = a5;
  if ((unint64_t)a3 > 2)
    v11 = 0x8000;
  else
    v11 = dword_1978CDE50[a3];
  v12 = v11 | 0x300000;
  v13 = v11 | 0x200000;
  if (a4 == 3)
    v11 |= 0x100000u;
  if (a4 == 2)
    v11 = v13;
  if ((unint64_t)a4 >= 2)
    v14 = v11;
  else
    v14 = v12;
  v15 = -[_WKWebExtensionSQLiteDatabase _openWithFlags:vfs:error:](self, "_openWithFlags:vfs:error:", v14, v10, a6);

  return v15;
}

- (BOOL)_openWithFlags:(int)a3 vfs:(id)a4 error:(id *)a5
{
  id v8;
  NSURL *url;
  void *v10;
  const char *v11;
  NSURL *v12;
  void *v13;
  id v14;
  WebKit *v15;
  NSURL *v16;
  void *v17;
  sqlite3 **p_handle;
  uint64_t v19;
  BOOL v20;
  BOOL v22;
  void *v23;
  NSObject *v25;
  NSURL *v26;
  int v27;
  NSURL *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  url = self->_url;
  +[_WKWebExtensionSQLiteDatabase inMemoryDatabaseURL](_WKWebExtensionSQLiteDatabase, "inMemoryDatabaseURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(url) = -[NSURL isEqual:](url, "isEqual:", v10);

  if ((_DWORD)url)
  {
    v11 = (const char *)objc_msgSend(CFSTR("file::memory:"), "UTF8String");
  }
  else
  {
    v12 = self->_url;
    +[_WKWebExtensionSQLiteDatabase privateOnDiskDatabaseURL](_WKWebExtensionSQLiteDatabase, "privateOnDiskDatabaseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = -[NSURL isEqual:](v12, "isEqual:", v13);

    if ((v12 & 1) != 0)
    {
      v11 = "";
    }
    else
    {
      -[NSURL path](self->_url, "path");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");

      -[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent");
      v15 = (WebKit *)objc_claimAutoreleasedReturnValue();
      WebKit::ensureDirectoryExists(v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        if (!a5)
        {
          v20 = 0;
          goto LABEL_18;
        }
        v25 = qword_1ECE710C8;
        if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_ERROR))
        {
          v26 = self->_url;
          v27 = 138477827;
          v28 = v26;
          _os_log_error_impl(&dword_196BCC000, v25, OS_LOG_TYPE_ERROR, "Unable to create parent folder for database at path: %{private}@", (uint8_t *)&v27, 0xCu);
        }
        objc_msgSend((id)objc_opt_class(), "_errorWith_WKSQLiteErrorCode:userInfo:", 14, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
  p_handle = &self->_handle;
  v19 = sqlite3_open_v2(v11, &self->_handle, a3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  if (!(_DWORD)v19)
  {
    v20 = 1;
    goto LABEL_18;
  }
  sqlite3_close_v2(*p_handle);
  v20 = 0;
  *p_handle = 0;
  v22 = (a3 & 4) == 0 && (_DWORD)v19 == 14;
  if (a5 && !v22)
  {
    objc_msgSend((id)objc_opt_class(), "_errorWith_WKSQLiteErrorCode:userInfo:", v19, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v20 = 0;
    *a5 = v23;
  }
LABEL_18:

  return v20;
}

+ (id)inMemoryDatabaseURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file::memory:"));
}

+ (id)privateOnDiskDatabaseURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("webkit::privateondisk:"));
}

+ (id)_errorWith_WKSQLiteErrorCode:(int)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("Message"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebKit.SQLite"), a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (sqlite3)handle
{
  return self->_handle;
}

- (NSURL)url
{
  return self->_url;
}

- (int)lastErrorCode
{
  return self->_lastErrorCode;
}

- (NSString)lastErrorMessage
{
  return self->_lastErrorMessage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastErrorMessage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
