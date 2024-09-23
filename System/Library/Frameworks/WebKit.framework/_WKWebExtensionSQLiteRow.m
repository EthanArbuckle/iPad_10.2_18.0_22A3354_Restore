@implementation _WKWebExtensionSQLiteRow

- (_WKWebExtensionSQLiteRow)init
{

  return 0;
}

- (_WKWebExtensionSQLiteRow)initWithStatement:(id)a3
{
  id v5;
  _WKWebExtensionSQLiteRow *v6;
  void *v7;
  NSObject *v8;
  _WKWebExtensionSQLiteRow *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionSQLiteRow;
  v6 = -[_WKWebExtensionSQLiteRow init](&v11, sel_init);
  if (v6)
  {
    v6->_handle = (sqlite3_stmt *)objc_msgSend(v5, "handle");
    objc_storeStrong((id *)&v6->_statement, a3);
    -[_WKWebExtensionSQLiteStatement database](v6->_statement, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    v9 = v6;
  }

  return v6;
}

- (_WKWebExtensionSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3
{
  void *v4;
  _WKWebExtensionSQLiteRow *v5;

  objc_msgSend(a3, "statement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_WKWebExtensionSQLiteRow initWithStatement:](self, "initWithStatement:", v4);

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  sqlite3_stmt *handle;
  const unsigned __int8 *v9;
  int v10;

  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[_WKWebExtensionSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:", a3))
  {
    v7 = 0;
  }
  else
  {
    handle = self->_handle;
    v9 = sqlite3_column_text(handle, a3);
    v10 = sqlite3_column_bytes(handle, a3);
    v7 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, v10, 0x8000100u, 0);
  }
  return v7;
}

- (int)intAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  return sqlite3_column_int(self->_handle, v3);
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  return sqlite3_column_int64(self->_handle, v3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  return sqlite3_column_double(self->_handle, v3);
}

- (BOOL)BOOLAtIndex:(unint64_t)a3
{
  return -[_WKWebExtensionSQLiteRow intAtIndex:](self, "intAtIndex:", a3) != 0;
}

- (id)dataAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  -[_WKWebExtensionSQLiteRow uncopiedRawDataAtIndex:](self, "uncopiedRawDataAtIndex:", a3);
  v3 = 0;
  if (!(_BYTE)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, (int)v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)uncopiedDataAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  -[_WKWebExtensionSQLiteRow uncopiedRawDataAtIndex:](self, "uncopiedRawDataAtIndex:", a3);
  v3 = 0;
  if (!(_BYTE)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, (int)v7, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (RawData)uncopiedRawDataAtIndex:(SEL)a3
{
  void *v7;
  NSObject *v8;
  RawData *result;
  sqlite3_stmt *handle;
  RawData *v11;

  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  result = (RawData *)-[_WKWebExtensionSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:", a4);
  if ((_DWORD)result)
  {
    *(_QWORD *)&retstr->var0 = 0;
    retstr->var1 = 0;
    *(_QWORD *)&retstr->var2 = 0;
    retstr->var0 = 1;
  }
  else
  {
    handle = self->_handle;
    result = (RawData *)sqlite3_column_blob(handle, a4);
    if (result)
    {
      v11 = result;
      result = (RawData *)sqlite3_column_bytes(handle, a4);
      retstr->var0 = 0;
      retstr->var1 = v11;
      retstr->var2 = (int)result;
    }
    else
    {
      *(_QWORD *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(_QWORD *)&retstr->var2 = 0;
    }
  }
  return result;
}

- (BOOL)_isNullAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  return sqlite3_column_type(self->_handle, v3) == 5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  switch(sqlite3_column_type(self->_handle, a3))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_handle, a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_handle, a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[_WKWebExtensionSQLiteRow stringAtIndex:](self, "stringAtIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[_WKWebExtensionSQLiteRow dataAtIndex:](self, "dataAtIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
}

@end
