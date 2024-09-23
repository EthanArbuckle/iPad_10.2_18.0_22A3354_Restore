@implementation _WKWebExtensionSQLiteStatement

- (_WKWebExtensionSQLiteStatement)init
{

  return 0;
}

- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  _WKWebExtensionSQLiteStatement *v11;
  _WKWebExtensionSQLiteStatement *v12;
  NSObject *v13;
  sqlite3 *v14;
  id v15;
  uint64_t v16;
  _WKWebExtensionSQLiteStatement *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_WKWebExtensionSQLiteStatement;
  v11 = -[_WKWebExtensionSQLiteStatement init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    -[_WKWebExtensionSQLiteDatabase queue](v12->_database, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v13);

    v14 = (sqlite3 *)objc_msgSend(v9, "handle");
    v15 = objc_retainAutorelease(v10);
    v16 = sqlite3_prepare_v2(v14, (const char *)objc_msgSend(v15, "UTF8String"), -1, &v12->_handle, 0);
    if (!(_DWORD)v16)
    {
      v17 = v12;
      goto LABEL_6;
    }
    objc_msgSend(v9, "reportErrorWithCode:query:error:", v16, v15, a5);
  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (_WKWebExtensionSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4
{
  return -[_WKWebExtensionSQLiteStatement initWithDatabase:query:error:](self, "initWithDatabase:query:error:", a3, a4, 0);
}

- (void)dealloc
{
  sqlite3_stmt *handle;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  handle = self->_handle;
  if (handle)
  {
    -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41___WKWebExtensionSQLiteStatement_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = handle;
    dispatch_async(v4, block);

  }
  v5.receiver = self;
  v5.super_class = (Class)_WKWebExtensionSQLiteStatement;
  -[_WKWebExtensionSQLiteStatement dealloc](&v5, sel_dealloc);
}

- (int)execute
{
  NSObject *v3;
  uint64_t v4;
  int v5;

  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = sqlite3_step(self->_handle);
  v5 = v4;
  if ((v4 - 100) >= 2 && (_DWORD)v4 != 0)
    -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:statement:error:](self->_database, "reportErrorWithCode:statement:error:", v4, self->_handle, 0);
  return v5;
}

- (BOOL)execute:(id *)a3
{
  NSObject *v5;
  uint64_t v6;

  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = sqlite3_step(self->_handle);
  if ((v6 - 100) < 2 || (_DWORD)v6 == 0)
    return 1;
  -[_WKWebExtensionSQLiteDatabase reportErrorWithCode:statement:error:](self->_database, "reportErrorWithCode:statement:error:", v6, self->_handle, a3);
  return 0;
}

- (id)fetch
{
  NSObject *v3;

  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[_WKWebExtensionSQLiteRowEnumerator initWithResultsOfStatement:]([_WKWebExtensionSQLiteRowEnumerator alloc], "initWithResultsOfStatement:", self);
}

- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4
{
  void (**v5)(id, _WKWebExtensionSQLiteRow *, _BYTE *);
  NSObject *v6;
  _WKWebExtensionSQLiteRow *v7;
  int v8;
  char v10;

  v5 = (void (**)(id, _WKWebExtensionSQLiteRow *, _BYTE *))a3;
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = 0;
  v10 = 0;
  do
  {
    v8 = sqlite3_step(self->_handle);
    if (v8 != 100)
      break;
    if (!v7)
      v7 = -[_WKWebExtensionSQLiteRow initWithStatement:]([_WKWebExtensionSQLiteRow alloc], "initWithStatement:", self);
    v5[2](v5, v7, &v10);
  }
  while (!v10);

  return v8 == 101;
}

- (void)reset
{
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = sqlite3_reset(self->_handle);
  if (v4)
  {
    v5 = v4;
    v6 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 1024;
      v11 = v5;
      _os_log_debug_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEBUG, "Could not reset statement: %@ (%d)", (uint8_t *)&v8, 0x12u);

    }
  }
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = sqlite3_finalize(self->_handle);
  if (v4)
  {
    v5 = v4;
    v6 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 1024;
      v11 = v5;
      _os_log_debug_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEBUG, "Could not finalize statement: %@ (%d)", (uint8_t *)&v8, 0x12u);

    }
  }
  self->_handle = 0;
}

- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  id v6;
  NSObject *v7;
  sqlite3_stmt *handle;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  handle = self->_handle;
  v9 = objc_retainAutorelease(v6);
  v10 = sqlite3_bind_text(handle, v4, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    v11 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 1024;
      v16 = v10;
      _os_log_debug_impl(&dword_196BCC000, v11, OS_LOG_TYPE_DEBUG, "Could not bind string: %@ (%d)", (uint8_t *)&v13, 0x12u);

    }
  }

}

- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = sqlite3_bind_int(self->_handle, v4, a3);
  if (v8)
  {
    v9 = v8;
    v10 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = v9;
      _os_log_debug_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEBUG, "Could not bind int: %@ (%d)", (uint8_t *)&v12, 0x12u);

    }
  }
}

- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = sqlite3_bind_int64(self->_handle, v4, a3);
  if (v8)
  {
    v9 = v8;
    v10 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = v9;
      _os_log_debug_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEBUG, "Could not bind integer: %@ (%d)", (uint8_t *)&v12, 0x12u);

    }
  }
}

- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = sqlite3_bind_double(self->_handle, v4, a3);
  if (v8)
  {
    v9 = v8;
    v10 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = v9;
      _os_log_debug_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEBUG, "Could not bind double: %@ (%d)", (uint8_t *)&v12, 0x12u);

    }
  }
}

- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  id v6;
  NSObject *v7;
  sqlite3_stmt *handle;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  handle = self->_handle;
  v9 = objc_retainAutorelease(v6);
  v10 = sqlite3_bind_blob(handle, v4, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    v11 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 1024;
      v16 = v10;
      _os_log_debug_impl(&dword_196BCC000, v11, OS_LOG_TYPE_DEBUG, "Could not bind blob: %@ (%d)", (uint8_t *)&v13, 0x12u);

    }
  }

}

- (void)bindNullAtParameterIndex:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = sqlite3_bind_null(self->_handle, v3);
  if (v6)
  {
    v7 = v6;
    v8 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[_WKWebExtensionSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 1024;
      v13 = v7;
      _os_log_debug_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEBUG, "Could not bind null: %@ (%d)", (uint8_t *)&v10, 0x12u);

    }
  }
}

- (NSDictionary)columnNamesToIndexes
{
  NSObject *v3;
  NSDictionary *columnNamesToIndexes;
  NSDictionary *v5;
  int v6;
  NSDictionary *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;

  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  columnNamesToIndexes = self->_columnNamesToIndexes;
  if (columnNamesToIndexes)
  {
    v5 = columnNamesToIndexes;
  }
  else
  {
    v6 = sqlite3_column_count(self->_handle);
    v7 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v6);
    if (v6 >= 1)
    {
      v8 = 0;
      do
      {
        v9 = sqlite3_column_name(self->_handle, v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, v11);

        v8 = (v8 + 1);
      }
      while (v6 != (_DWORD)v8);
    }
    v12 = self->_columnNamesToIndexes;
    self->_columnNamesToIndexes = v7;
    v13 = v7;

    v5 = self->_columnNamesToIndexes;
  }
  return v5;
}

- (NSArray)columnNames
{
  NSObject *v3;
  NSArray *columnNames;
  NSArray *v5;
  int v6;
  NSArray *v7;
  int i;
  void *v9;
  NSArray *v10;
  NSArray *v11;

  -[_WKWebExtensionSQLiteDatabase queue](self->_database, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  columnNames = self->_columnNames;
  if (columnNames)
  {
    v5 = columnNames;
  }
  else
  {
    v6 = sqlite3_column_count(self->_handle);
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(self->_handle, i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v7, "addObject:", v9);

      }
    }
    v10 = self->_columnNames;
    self->_columnNames = v7;
    v11 = v7;

    v5 = self->_columnNames;
  }
  return v5;
}

- (BOOL)_isValid
{
  return self->_handle != 0;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (_WKWebExtensionSQLiteDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnNamesToIndexes, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
