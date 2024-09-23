@implementation ACCSQLiteStatement

- (ACCSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5
{
  id v8;
  id v9;
  ACCSQLiteStatement *v10;
  ACCSQLiteStatement *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACCSQLiteStatement;
  v10 = -[ACCSQLiteStatement init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_SQLite, v8);
    objc_storeStrong((id *)&v11->_SQL, a4);
    v11->_handle = a5;
    v11->_reset = 1;
  }

  return v11;
}

- (void)finalizeStatement
{
  NSString *v3;
  NSObject *v4;
  const char *v5;
  NSString *SQL;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    SQL = self->_SQL;
    v7 = 138412290;
    v8 = SQL;
    v4 = MEMORY[0x24BDACB70];
    v5 = "[#ACCEventLogger] accsqlite: Statement not reset after last use: \"%@\";
    goto LABEL_7;
  }
  if (sqlite3_finalize(self->_handle) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = self->_SQL;
    v7 = 138412290;
    v8 = v3;
    v4 = MEMORY[0x24BDACB70];
    v5 = "[#ACCEventLogger] accsqlite: Error finalizing prepared statement: \"%@\";
LABEL_7:
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
  }
}

- (void)resetAfterStepError
{
  if (!self->_reset)
  {
    sqlite3_reset(self->_handle);
    sqlite3_clear_bindings(self->_handle);
    -[NSMutableArray removeAllObjects](self->_temporaryBoundObjects, "removeAllObjects");
    self->_reset = 1;
  }
}

- (BOOL)step
{
  int v3;
  NSString *SQL;
  _DWORD v6[2];
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_reset)
    self->_reset = 0;
  v3 = sqlite3_step(self->_handle);
  if ((v3 & 0xFE) != 0x64)
  {
    -[ACCSQLiteStatement resetAfterStepError](self, "resetAfterStepError");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v6[0] = 67109378;
      v6[1] = v3;
      v7 = 2112;
      v8 = SQL;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Failed to step (%d): \"%@\", (uint8_t *)v6, 0x12u);
    }
  }
  return v3 == 100;
}

- (void)reset
{
  NSString *SQL;
  NSObject *v4;
  const char *v5;
  NSString *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_reset)
  {
    if (sqlite3_reset(self->_handle))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      SQL = self->_SQL;
      v7 = 138412290;
      v8 = SQL;
      v4 = MEMORY[0x24BDACB70];
      v5 = "[#ACCEventLogger] accsqlite: Error resetting prepared statement: \"%@\";
LABEL_8:
      _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
      return;
    }
    if (sqlite3_clear_bindings(self->_handle))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v6 = self->_SQL;
      v7 = 138412290;
      v8 = v6;
      v4 = MEMORY[0x24BDACB70];
      v5 = "[#ACCEventLogger] accsqlite: Error clearing prepared statement bindings: \"%@\";
      goto LABEL_8;
    }
    -[NSMutableArray removeAllObjects](self->_temporaryBoundObjects, "removeAllObjects");
    self->_reset = 1;
  }
}

- (void)bindInt:(int)a3 atIndex:(unint64_t)a4
{
  NSString *v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  NSString *SQL;
  int v11;
  unint64_t v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    SQL = self->_SQL;
    v11 = 138412290;
    v12 = (unint64_t)SQL;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\";
    v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_int(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    v11 = 134218242;
    v12 = a4;
    v13 = 2112;
    v14 = v6;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Error binding int at %ld: \"%@\";
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  NSString *v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  NSString *SQL;
  int v11;
  unint64_t v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    SQL = self->_SQL;
    v11 = 138412290;
    v12 = (unint64_t)SQL;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\";
    v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_int64(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    v11 = 134218242;
    v12 = a4;
    v13 = 2112;
    v14 = v6;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Error binding int64 at %ld: \"%@\";
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  NSString *v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  NSString *SQL;
  int v11;
  unint64_t v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_reset)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    SQL = self->_SQL;
    v11 = 138412290;
    v12 = (unint64_t)SQL;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\";
    v9 = 12;
    goto LABEL_7;
  }
  if (sqlite3_bind_double(self->_handle, a4 + 1, a3) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_SQL;
    v11 = 134218242;
    v12 = a4;
    v13 = 2112;
    v14 = v6;
    v7 = MEMORY[0x24BDACB70];
    v8 = "[#ACCEventLogger] accsqlite: Error binding double at %ld: \"%@\";
    v9 = 22;
LABEL_7:
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSString *SQL;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  NSString *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_reset)
  {
    if (!v6)
    {
      -[ACCSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
      goto LABEL_10;
    }
    if (sqlite3_bind_blob(self->_handle, a4 + 1, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = SQL;
      v9 = MEMORY[0x24BDACB70];
      v10 = "[#ACCEventLogger] accsqlite: Error binding blob at %ld: \"%@\";
      v11 = 22;
LABEL_8:
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_SQL;
    v13 = 138412290;
    v14 = (unint64_t)v12;
    v9 = MEMORY[0x24BDACB70];
    v10 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\";
    v11 = 12;
    goto LABEL_8;
  }
LABEL_10:

}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSString *SQL;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  NSString *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_reset)
  {
    if (!v6)
    {
      -[ACCSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
      goto LABEL_10;
    }
    if (sqlite3_bind_text(self->_handle, a4 + 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = SQL;
      v9 = MEMORY[0x24BDACB70];
      v10 = "[#ACCEventLogger] accsqlite: Error binding text at %ld: \"%@\";
      v11 = 22;
LABEL_8:
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_SQL;
    v13 = 138412290;
    v14 = (unint64_t)v12;
    v9 = MEMORY[0x24BDACB70];
    v10 = "[#ACCEventLogger] accsqlite: Statement is not reset: \"%@\";
    v11 = 12;
    goto LABEL_8;
  }
LABEL_10:

}

- (void)bindNullAtIndex:(unint64_t)a3
{
  uint8_t v3[16];

  if (sqlite3_bind_null(self->_handle, a3 + 1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: sqlite3_bind_null error", v3, 2u);
    }
  }
}

- (id)retainedTemporaryBoundObject:(id)a3
{
  id v4;
  NSMutableArray *temporaryBoundObjects;
  NSMutableArray *v6;
  NSMutableArray *v7;

  v4 = a3;
  temporaryBoundObjects = self->_temporaryBoundObjects;
  if (!temporaryBoundObjects)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_temporaryBoundObjects;
    self->_temporaryBoundObjects = v6;

    temporaryBoundObjects = self->_temporaryBoundObjects;
  }
  -[NSMutableArray addObject:](temporaryBoundObjects, "addObject:", v4);
  return v4;
}

- (void)bindValue:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ACCObjCType typeForValue:](ACCObjCType, "typeForValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isIntegerNumber"))
    {
      if ((unint64_t)objc_msgSend(v7, "size") <= 4)
      {
LABEL_4:
        -[ACCSQLiteStatement bindInt:atIndex:](self, "bindInt:atIndex:", objc_msgSend(v6, "intValue"), a4);
LABEL_13:

        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v7, "code") == 10)
    {
      goto LABEL_4;
    }
    -[ACCSQLiteStatement bindInt64:atIndex:](self, "bindInt64:atIndex:", objc_msgSend(v6, "longLongValue"), a4);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ACCSQLiteStatement bindBlob:atIndex:](self, "bindBlob:atIndex:", v6, a4);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(v6, "getUUIDBytes:", &v11);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v11, 16);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = (void *)v8;
    -[ACCSQLiteStatement retainedTemporaryBoundObject:](self, "retainedTemporaryBoundObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLiteStatement bindBlob:atIndex:](self, "bindBlob:atIndex:", v9, a4);
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ACCSQLiteStatement bindText:atIndex:](self, "bindText:atIndex:", v6, a4);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ACCSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[ACCSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLiteStatement retainedTemporaryBoundObject:](self, "retainedTemporaryBoundObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLiteStatement bindText:atIndex:](self, "bindText:atIndex:", v9, a4);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 138412290;
    *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
    v10 = *(id *)((char *)&v11 + 4);
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Can't bind object of type %@", (uint8_t *)&v11, 0xCu);

  }
LABEL_14:

}

- (void)bindValues:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCSQLiteStatement bindValue:atIndex:](self, "bindValue:atIndex:", v5, v4);

      ++v4;
    }
    while (v4 < objc_msgSend(v6, "count"));
  }

}

- (unint64_t)columnCount
{
  return sqlite3_column_count(self->_handle);
}

- (int)columnTypeAtIndex:(unint64_t)a3
{
  return sqlite3_column_type(self->_handle, a3);
}

- (id)columnNameAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(self->_handle, a3));
}

- (int)intAtIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_handle, a3);
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_handle, a3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_handle, a3);
}

- (id)blobAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;

  v3 = a3;
  v5 = (void *)sqlite3_column_blob(self->_handle, a3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, sqlite3_column_bytes(self->_handle, v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)textAtIndex:(unint64_t)a3
{
  void *v3;

  v3 = (void *)sqlite3_column_text(self->_handle, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  int v5;
  void *v6;
  id result;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = -[ACCSQLiteStatement columnTypeAtIndex:](self, "columnTypeAtIndex:") - 1;
  v6 = 0;
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[ACCSQLiteStatement int64AtIndex:](self, "int64AtIndex:", a3));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      v8 = (void *)MEMORY[0x24BDD16E0];
      -[ACCSQLiteStatement doubleAtIndex:](self, "doubleAtIndex:", a3);
      objc_msgSend(v8, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[ACCSQLiteStatement textAtIndex:](self, "textAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[ACCSQLiteStatement blobAtIndex:](self, "blobAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
LABEL_9:
      result = v6;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = 0;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Unexpected column type: %d", (uint8_t *)v9, 8u);
      }
      result = 0;
      break;
  }
  return result;
}

- (id)allObjects
{
  unint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[ACCSQLiteStatement columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[ACCSQLiteStatement objectAtIndex:](self, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v4, "setObject:atIndexedSubscript:", v6, i);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:atIndexedSubscript:", v7, i);

      }
    }
  }
  return v4;
}

- (id)allObjectsByColumnName
{
  unint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[ACCSQLiteStatement columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[ACCSQLiteStatement columnNameAtIndex:](self, "columnNameAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCSQLiteStatement objectAtIndex:](self, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  return v4;
}

- (ACCSQLite)SQLite
{
  return (ACCSQLite *)objc_loadWeakRetained((id *)&self->_SQLite);
}

- (NSString)SQL
{
  return self->_SQL;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (NSMutableArray)temporaryBoundObjects
{
  return self->_temporaryBoundObjects;
}

- (void)setTemporaryBoundObjects:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryBoundObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_SQL, 0);
  objc_destroyWeak((id *)&self->_SQLite);
}

@end
