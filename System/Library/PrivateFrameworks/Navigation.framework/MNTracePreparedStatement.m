@implementation MNTracePreparedStatement

- (MNTracePreparedStatement)init
{
  MNTracePreparedStatement *result;

  result = (MNTracePreparedStatement *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)initForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MNTracePreparedStatement *v10;
  MNTracePreparedStatement *v11;
  MNTracePreparedStatement *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNTracePreparedStatement;
  v10 = -[MNTracePreparedStatement init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!-[MNTracePreparedStatement _prepareStatementForTrace:statement:outError:](v10, "_prepareStatementForTrace:statement:outError:", v8, v9, a5))
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11->_db = (sqlite3 *)objc_msgSend(v8, "db");
  }
  v12 = v11;
LABEL_6:

  return v12;
}

+ (id)preparedStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[MNTracePreparedStatement initForTrace:statement:outError:]([MNTracePreparedStatement alloc], "initForTrace:statement:outError:", v8, v7, a5);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MNTracePreparedStatement finalize](self, "finalize");
  v3.receiver = self;
  v3.super_class = (Class)MNTracePreparedStatement;
  -[MNTracePreparedStatement dealloc](&v3, sel_dealloc);
}

- (void)finalize
{
  sqlite3_finalize(self->_preparedStatement);
  self->_db = 0;
  self->_preparedStatement = 0;
}

- (BOOL)execute
{
  BOOL v3;

  if (-[MNTracePreparedStatement step](self, "step"))
    v3 = -[MNTracePreparedStatement reset](self, "reset");
  else
    v3 = 0;
  return v3 & -[MNTracePreparedStatement clearBindings](self, "clearBindings");
}

- (BOOL)step
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_step(self->_preparedStatement);
  v4 = v3 & 0xFFFFFFFE;
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    v6 = v3;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = sqlite3_errstr(v3);
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Error (%d:%s) calling sqlite3_step(): \"%s\"), v6, v8, sqlite3_errmsg(self->_db));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "result == SQLITE_DONE || result == SQLITE_ROW";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  return v4 == 100;
}

- (BOOL)reset
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_reset(self->_preparedStatement);
  v4 = v3;
  if ((_DWORD)v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = sqlite3_errstr(v3);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error (%d:%s) calling sqlite3_reset(): \"%s\"), v4, v7, sqlite3_errmsg(self->_db));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  return (_DWORD)v4 == 0;
}

- (BOOL)clearBindings
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_clear_bindings(self->_preparedStatement);
  v4 = v3;
  if ((_DWORD)v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = sqlite3_errstr(v3);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error (%d:%s) calling sqlite3_clear_bindings(): \"%s\"), v4, v7, sqlite3_errmsg(self->_db));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  return (_DWORD)v4 == 0;
}

- (void)bind:(unint64_t)a3 int:(int)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = sqlite3_bind_int(self->_preparedStatement, a3, a4);
  if ((_DWORD)v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = sqlite3_errstr(v5);
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Error (%d:%s) calling sqlite3_bind_int(): \"%s\"), v6, v8, sqlite3_errmsg(self->_db));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "result == SQLITE_OK";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
}

- (void)bind:(unint64_t)a3 double:(double)a4
{
  int v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = sqlite3_bind_double(self->_preparedStatement, a3, a4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = sqlite3_errstr(v5);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error (%s) calling sqlite3_bind_double(): %s"), v7, sqlite3_errmsg(self->_db));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
}

- (void)bind:(unint64_t)a3 string:(id)a4
{
  int v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = sqlite3_bind_text(self->_preparedStatement, a3, (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = sqlite3_errstr(v5);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error (%s) calling sqlite3_bind_text(): %s"), v7, sqlite3_errmsg(self->_db));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
}

- (void)bind:(unint64_t)a3 data:(id)a4
{
  int v4;
  sqlite3_stmt *preparedStatement;
  id v7;
  const void *v8;
  int v9;
  int v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  preparedStatement = self->_preparedStatement;
  v7 = objc_retainAutorelease(a4);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = sqlite3_bind_blob(preparedStatement, v4, v8, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = sqlite3_errstr(v10);
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Error (%s) calling sqlite3_bind_blob(): %s"), v12, sqlite3_errmsg(self->_db));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "result == SQLITE_OK";
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
}

- (void)bindNull:(unint64_t)a3
{
  int v4;
  void *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_bind_null(self->_preparedStatement, a3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = sqlite3_errstr(v4);
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Error (%s) calling sqlite3_bind_null(): %s"), v6, sqlite3_errmsg(self->_db));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "result == SQLITE_OK";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
}

- (void)bindParameter:(id)a3 int:(int)a4
{
  uint64_t v4;
  unint64_t v6;

  v4 = *(_QWORD *)&a4;
  v6 = -[MNTracePreparedStatement _bindParameterIndexWithName:](self, "_bindParameterIndexWithName:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[MNTracePreparedStatement bind:int:](self, "bind:int:", v6, v4);
}

- (void)bindParameter:(id)a3 double:(double)a4
{
  unint64_t v6;

  v6 = -[MNTracePreparedStatement _bindParameterIndexWithName:](self, "_bindParameterIndexWithName:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[MNTracePreparedStatement bind:double:](self, "bind:double:", v6, a4);
}

- (void)bindParameter:(id)a3 string:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a4;
  v6 = -[MNTracePreparedStatement _bindParameterIndexWithName:](self, "_bindParameterIndexWithName:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[MNTracePreparedStatement bind:string:](self, "bind:string:", v6, v7);

}

- (void)bindParameter:(id)a3 data:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a4;
  v6 = -[MNTracePreparedStatement _bindParameterIndexWithName:](self, "_bindParameterIndexWithName:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[MNTracePreparedStatement bind:data:](self, "bind:data:", v6, v7);

}

- (void)bindNullParameter:(id)a3
{
  unint64_t v4;

  v4 = -[MNTracePreparedStatement _bindParameterIndexWithName:](self, "_bindParameterIndexWithName:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[MNTracePreparedStatement bindNull:](self, "bindNull:", v4);
}

- (BOOL)stepRow
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_step(self->_preparedStatement);
  v4 = v3;
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = sqlite3_errstr(v3);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error (%d:%s) calling sqlite3_step(): \"%s\"), v4, v7, sqlite3_errmsg(self->_db));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_DONE || result == SQLITE_ROW";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  return (_DWORD)v4 == 100;
}

- (int)columnInt:(unint64_t)a3
{
  return sqlite3_column_int(self->_preparedStatement, a3);
}

- (double)columnDouble:(unint64_t)a3
{
  return sqlite3_column_double(self->_preparedStatement, a3);
}

- (id)columnString:(unint64_t)a3
{
  const unsigned __int8 *v3;
  __CFString *v4;

  v3 = sqlite3_column_text(self->_preparedStatement, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E61D9090;
  }
  return v4;
}

- (id)columnData:(unint64_t)a3
{
  int v3;
  int v5;
  void *v6;

  v3 = a3;
  v5 = sqlite3_column_bytes(self->_preparedStatement, a3);
  if (v5 < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", sqlite3_column_blob(self->_preparedStatement, v3), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)columnObjects:(unint64_t)a3 ofClasses:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = a4;
  objc_msgSend(v7, "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTracePreparedStatement columnData:](self, "columnData:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v9, v8, v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (v12)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "columnObjects error decoding: %@", buf, 0xCu);
    }

  }
  return v11;
}

- (id)columnObjectsOld:(unint64_t)a3 ofClasses:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a4;
  -[MNTracePreparedStatement columnData:](self, "columnData:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedArrayOfObjectsOfClasses:fromData:error:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_prepareStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  sqlite3 *v10;
  id v11;
  int v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  v10 = (sqlite3 *)objc_msgSend(v8, "db");
  v11 = objc_retainAutorelease(v9);
  v12 = sqlite3_prepare_v2(v10, (const char *)objc_msgSend(v11, "UTF8String"), -1, &self->_preparedStatement, 0);
  if (v12)
  {
    v13 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v8, "db"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error (%s) preparing statement \"%@\": %s"), sqlite3_errstr(v12), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v19 = *MEMORY[0x1E0CB2938];
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNTraceErrorDomain"), 9, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v17;

    }
  }

  return v12 == 0;
}

- (unint64_t)_bindParameterIndexWithName:(id)a3
{
  id v4;
  sqlite3_stmt *preparedStatement;
  id v6;
  int v7;
  unint64_t v8;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  preparedStatement = self->_preparedStatement;
  v6 = objc_retainAutorelease(v4);
  v7 = sqlite3_bind_parameter_index(preparedStatement, (const char *)objc_msgSend(v6, "UTF8String"));
  if (v7 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error calling -[MNTracePreparedStatement bindParameter:] because no parameter with the name \"%@\" was found."), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "NO";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_expanded_sql(self->_preparedStatement));
}

@end
