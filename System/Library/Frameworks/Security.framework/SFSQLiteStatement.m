@implementation SFSQLiteStatement

- (BOOL)step
{
  int v3;
  NSObject *v4;
  NSString *SQL;
  _DWORD v7[2];
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_reset)
    self->_reset = 0;
  v3 = sqlite3_step(self->_handle);
  if ((v3 & 0xFE) != 0x64)
  {
    -[SFSQLiteStatement resetAfterStepError](self, "resetAfterStepError");
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v7[0] = 67109378;
      v7[1] = v3;
      v8 = 2112;
      v9 = SQL;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Failed to step (%d): \"%@\", (uint8_t *)v7, 0x12u);
    }

  }
  return v3 == 100;
}

- (void)reset
{
  NSObject *v3;
  NSString *SQL;
  const char *v5;
  NSString *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_reset)
  {
    if (sqlite3_reset(self->_handle))
    {
      secLogObjForScope("SecError");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        return;
      }
      SQL = self->_SQL;
      v7 = 138412290;
      v8 = SQL;
      v5 = "sfsqlite: Error resetting prepared statement: \"%@\";
    }
    else
    {
      if (!sqlite3_clear_bindings(self->_handle))
      {
        -[NSMutableArray removeAllObjects](self->_temporaryBoundObjects, "removeAllObjects");
        self->_reset = 1;
        return;
      }
      secLogObjForScope("SecError");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v6 = self->_SQL;
      v7 = 138412290;
      v8 = v6;
      v5 = "sfsqlite: Error clearing prepared statement bindings: \"%@\";
    }
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
    goto LABEL_9;
  }
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
      -[SFSQLiteStatement bindValue:atIndex:](self, "bindValue:atIndex:", v5, v4);

      ++v4;
    }
    while (v4 < objc_msgSend(v6, "count"));
  }

}

- (void)bindValue:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SFObjCType typeForValue:](SFObjCType, "typeForValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isIntegerNumber"))
    {
      if ((unint64_t)objc_msgSend(v8, "size") > 4)
        -[SFSQLiteStatement bindInt64:atIndex:](self, "bindInt64:atIndex:", objc_msgSend(v7, "longLongValue"), a4);
      else
        -[SFSQLiteStatement bindInt:atIndex:](self, "bindInt:atIndex:", objc_msgSend(v7, "intValue"), a4);
    }
    else
    {
      if ((objc_msgSend(v8, "isFloatingPointNumber") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 208, CFSTR("Expected number type to be either integer or floating point"));

      }
      if (objc_msgSend(v8, "code") != 11 && objc_msgSend(v8, "code") != 10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 209, CFSTR("Unexpected floating point number type: %@"), v8);

      }
      objc_msgSend(v7, "doubleValue");
      -[SFSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSQLiteStatement bindBlob:atIndex:](self, "bindBlob:atIndex:", v7, a4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(buf, 170, 16);
    objc_msgSend(v7, "getUUIDBytes:", buf);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 16);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v8 = (void *)v9;
    -[SFSQLiteStatement retainedTemporaryBoundObject:](self, "retainedTemporaryBoundObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLiteStatement bindBlob:atIndex:](self, "bindBlob:atIndex:", v10, a4);
LABEL_16:

LABEL_18:
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSQLiteStatement bindText:atIndex:](self, "bindText:atIndex:", v7, a4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    -[SFSQLiteStatement bindDouble:atIndex:](self, "bindDouble:atIndex:", a4);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLiteStatement retainedTemporaryBoundObject:](self, "retainedTemporaryBoundObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLiteStatement bindText:atIndex:](self, "bindText:atIndex:", v10, a4);
    goto LABEL_16;
  }
  secLogObjForScope("SecError");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = objc_opt_class();
    v12 = *(id *)&buf[4];
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "sfsqlite: Can't bind object of type %@", buf, 0xCu);

  }
LABEL_19:

}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSString *SQL;
  NSObject *v10;
  NSString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_reset)
  {
    if (v6)
    {
      if (sqlite3_bind_text(self->_handle, a4 + 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0))
      {
        secLogObjForScope("SecError");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          SQL = self->_SQL;
          v12 = 134218242;
          v13 = a4;
          v14 = 2112;
          v15 = SQL;
          _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error binding text at %ld: \"%@\", (uint8_t *)&v12, 0x16u);
        }

      }
    }
    else
    {
      -[SFSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      v12 = 138412290;
      v13 = (unint64_t)v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "sfsqlite: Statement is not reset: \"%@\", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  NSObject *v6;
  NSString *SQL;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_reset)
  {
    if (!sqlite3_bind_int64(self->_handle, a4 + 1, a3))
      return;
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v12 = 134218242;
      v13 = a4;
      v14 = 2112;
      v15 = SQL;
      v8 = "sfsqlite: Error binding int64 at %ld: \"%@\";
      v9 = v6;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      v12 = 138412290;
      v13 = (unint64_t)v11;
      v8 = "sfsqlite: Statement is not reset: \"%@\";
      v9 = v6;
      v10 = 12;
      goto LABEL_7;
    }
  }

}

- (id)allObjectsByColumnName
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = -[SFSQLiteStatement columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SFSQLiteStatement_allObjectsByColumnName__block_invoke;
  v9[3] = &unk_1E1FCB958;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  -[SFSQLiteStatement enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (unint64_t)columnCount
{
  void *v5;

  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 241, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return sqlite3_column_count(self->_handle);
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *indexesByColumnName;
  void (**v12)(void);

  v12 = (void (**)(void))a3;
  v4 = -[SFSQLiteStatement columnCount](self, "columnCount");
  v5 = v4;
  if (self->_indexesByColumnName)
  {
    v6 = 0;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_11;
  }
  v7 = 0;
  do
  {
    -[SFSQLiteStatement columnNameAtIndex:](self, "columnNameAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

    }
    if (v12)
      v12[2]();

    ++v7;
  }
  while (v5 != v7);
LABEL_11:
  if (v6)
  {
    v10 = (NSDictionary *)objc_msgSend(v6, "copy");
    indexesByColumnName = self->_indexesByColumnName;
    self->_indexesByColumnName = v10;

  }
}

void __43__SFSQLiteStatement_allObjectsByColumnName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)objectAtIndex:(unint64_t)a3
{
  int v5;
  void *v6;
  NSObject *v7;
  id result;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = -[SFSQLiteStatement columnTypeAtIndex:](self, "columnTypeAtIndex:") - 1;
  v6 = 0;
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SFSQLiteStatement int64AtIndex:](self, "int64AtIndex:", a3));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      v9 = (void *)MEMORY[0x1E0CB37E8];
      -[SFSQLiteStatement doubleAtIndex:](self, "doubleAtIndex:", a3);
      objc_msgSend(v9, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[SFSQLiteStatement textAtIndex:](self, "textAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[SFSQLiteStatement blobAtIndex:](self, "blobAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
LABEL_9:
      result = v6;
      break;
    default:
      secLogObjForScope("SecError");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = 0;
        _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "sfsqlite: Unexpected column type: %d", (uint8_t *)v10, 8u);
      }

      result = 0;
      break;
  }
  return result;
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 274, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return sqlite3_column_int64(self->_handle, v3);
}

- (int)columnTypeAtIndex:(unint64_t)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 247, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return sqlite3_column_type(self->_handle, v3);
}

- (id)columnNameAtIndex:(unint64_t)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 253, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(self->_handle, v3));
}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  NSObject *v6;
  NSString *SQL;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_reset)
  {
    if (!sqlite3_bind_double(self->_handle, a4 + 1, a3))
      return;
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v12 = 134218242;
      v13 = a4;
      v14 = 2112;
      v15 = SQL;
      v8 = "sfsqlite: Error binding double at %ld: \"%@\";
      v9 = v6;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      v12 = 138412290;
      v13 = (unint64_t)v11;
      v8 = "sfsqlite: Statement is not reset: \"%@\";
      v9 = v6;
      v10 = 12;
      goto LABEL_7;
    }
  }

}

- (void)bindBlob:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSString *SQL;
  NSObject *v10;
  NSString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_reset)
  {
    if (v6)
    {
      if (sqlite3_bind_blob(self->_handle, a4 + 1, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0))
      {
        secLogObjForScope("SecError");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          SQL = self->_SQL;
          v12 = 134218242;
          v13 = a4;
          v14 = 2112;
          v15 = SQL;
          _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error binding blob at %ld: \"%@\", (uint8_t *)&v12, 0x16u);
        }

      }
    }
    else
    {
      -[SFSQLiteStatement bindNullAtIndex:](self, "bindNullAtIndex:", a4);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      v12 = 138412290;
      v13 = (unint64_t)v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "sfsqlite: Statement is not reset: \"%@\", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (SFSQLiteStatement)initWithSQLite:(id)a3 SQL:(id)a4 handle:(sqlite3_stmt *)a5
{
  id v8;
  id v9;
  SFSQLiteStatement *v10;
  SFSQLiteStatement *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSQLiteStatement;
  v10 = -[SFSQLiteStatement init](&v13, sel_init);
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
  NSObject *v3;
  NSString *SQL;
  const char *v5;
  NSString *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_reset)
  {
    if (!sqlite3_finalize(self->_handle))
      return;
    secLogObjForScope("SecError");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v7 = 138412290;
      v8 = SQL;
      v5 = "sfsqlite: Error finalizing prepared statement: \"%@\";
LABEL_7:
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_SQL;
      v7 = 138412290;
      v8 = v6;
      v5 = "sfsqlite: Statement not reset after last use: \"%@\";
      goto LABEL_7;
    }
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

- (void)bindInt:(int)a3 atIndex:(unint64_t)a4
{
  NSObject *v6;
  NSString *SQL;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSString *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_reset)
  {
    if (!sqlite3_bind_int(self->_handle, a4 + 1, a3))
      return;
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      SQL = self->_SQL;
      v12 = 134218242;
      v13 = a4;
      v14 = 2112;
      v15 = SQL;
      v8 = "sfsqlite: Error binding int at %ld: \"%@\";
      v9 = v6;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_SQL;
      v12 = 138412290;
      v13 = (unint64_t)v11;
      v8 = "sfsqlite: Statement is not reset: \"%@\";
      v9 = v6;
      v10 = 12;
      goto LABEL_7;
    }
  }

}

- (void)bindNullAtIndex:(unint64_t)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (sqlite3_bind_null(self->_handle, a3 + 1))
  {
    secLogObjForScope("SecError");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "sfsqlite: sqlite3_bind_null error", v4, 2u);
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

- (unint64_t)indexForColumnName:(id)a3
{
  id v4;
  NSDictionary *indexesByColumnName;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  indexesByColumnName = self->_indexesByColumnName;
  if (!indexesByColumnName)
  {
    -[SFSQLiteStatement enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", 0);
    indexesByColumnName = self->_indexesByColumnName;
  }
  -[NSDictionary objectForKeyedSubscript:](indexesByColumnName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (int)intAtIndex:(unint64_t)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 268, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return sqlite3_column_int(self->_handle, v3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 280, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  return sqlite3_column_double(self->_handle, v3);
}

- (id)blobAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  void *v8;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 286, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  v5 = (void *)sqlite3_column_blob(self->_handle, v3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, sqlite3_column_bytes(self->_handle, v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)textAtIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  void *v8;

  v3 = a3;
  if (self->_reset)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSQLiteStatement.m"), 298, CFSTR("Statement is reset: \"%@\"), self->_SQL);

  }
  v5 = (void *)sqlite3_column_text(self->_handle, v3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)allObjects
{
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SFSQLiteStatement *v10;

  v3 = -[SFSQLiteStatement columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__SFSQLiteStatement_allObjects__block_invoke;
  v8[3] = &unk_1E1FCB958;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[SFSQLiteStatement enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

- (SFSQLite)SQLite
{
  return (SFSQLite *)objc_loadWeakRetained((id *)&self->_SQLite);
}

- (NSString)SQL
{
  return self->_SQL;
}

- (sqlite3_stmt)handle
{
  return self->_handle;
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

- (NSDictionary)indexesByColumnName
{
  return self->_indexesByColumnName;
}

- (void)setIndexesByColumnName:(id)a3
{
  objc_storeStrong((id *)&self->_indexesByColumnName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesByColumnName, 0);
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_SQL, 0);
  objc_destroyWeak((id *)&self->_SQLite);
}

void __31__SFSQLiteStatement_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v4, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a2);

  }
}

@end
