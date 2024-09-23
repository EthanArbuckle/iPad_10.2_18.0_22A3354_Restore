@implementation BMSQLResultSet

- (BMSQLResultSet)initWithStatement:(sqlite3_stmt *)a3 database:(id)a4
{
  id v7;
  BMSQLResultSet *v8;
  BMSQLResultSet *v9;
  const char *v10;
  uint64_t v11;
  NSString *query;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSQLResultSet;
  v8 = -[BMSQLResultSet init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_stmt = a3;
    objc_storeStrong((id *)&v8->_database, a4);
    v9->_finished = 0;
    v9->_cursor = 0;
    if (a3)
    {
      v10 = sqlite3_sql(a3);
      if (v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v10);
        query = v9->_query;
        v9->_query = (NSString *)v11;

      }
    }
  }

  return v9;
}

- (BMSQLResultSet)initWithQuery:(id)a3 error:(id)a4 database:(id)a5
{
  id v8;
  id v9;
  BMSQLResultSet *v10;
  BMSQLResultSet *v11;
  uint64_t v12;
  NSString *query;

  v8 = a3;
  v9 = a4;
  v10 = -[BMSQLResultSet initWithStatement:database:](self, "initWithStatement:database:", 0, a5);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    v12 = objc_msgSend(v8, "copy");
    query = v11->_query;
    v11->_query = (NSString *)v12;

    objc_storeStrong((id *)&v11->_error, a4);
    v11->_finished = 1;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_finalize(self->_stmt);
  v3.receiver = self;
  v3.super_class = (Class)BMSQLResultSet;
  -[BMSQLResultSet dealloc](&v3, sel_dealloc);
}

- (BOOL)next
{
  BMSQLResultSet *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MEMORY[0x193FECFB4](self, a2);
  LOBYTE(v2) = -[BMSQLResultSet _next](v2, "_next");
  objc_autoreleasePoolPop(v3);
  return (char)v2;
}

- (BOOL)_next
{
  os_unfair_lock_s *p_lock;
  BOOL v4;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  const unsigned __int8 *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSError *v18;
  NSError *v19;
  uint64_t v20;
  const void *v21;
  NSDictionary *row;
  NSError *error;
  NSDictionary *v24;
  sqlite3 *v25;
  void *v26;
  void *v27;
  id v28;
  NSError *v29;
  NSError *v30;
  NSDictionary *v31;
  NSDictionary *v32;
  NSError *v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_finished || !self->_stmt)
    goto LABEL_2;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cursor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMSQLResultSet _next].cold.1(v7, (uint64_t)self, buf, v6);
  }

  v8 = sqlite3_step(self->_stmt);
  v9 = v8;
  if ((_DWORD)v8 == 101)
  {
    self->_finished = 1;
    row = self->_row;
    self->_row = 0;

    error = self->_error;
    self->_error = 0;

LABEL_27:
    _logQueryResult(self->_stmt);
LABEL_2:
    v4 = 0;
    goto LABEL_3;
  }
  if ((_DWORD)v8 != 100)
  {
    v24 = self->_row;
    self->_row = 0;

    v25 = -[BMSQLDatabase db](self->_database, "db");
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cursor);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Failed to fetch row %@ in query %@"), v27, self->_query);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    BMSQLDatabaseError(v9, v25, (const char *)objc_msgSend(v28, "UTF8String"));
    v29 = (NSError *)objc_claimAutoreleasedReturnValue();
    v30 = self->_error;
    self->_error = v29;

    self->_finished = 1;
    goto LABEL_27;
  }
  v10 = sqlite3_column_count(self->_stmt);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  if (!v10)
  {
LABEL_28:
    v31 = (NSDictionary *)objc_msgSend(v35, "copy");
    v32 = self->_row;
    self->_row = v31;

    ++self->_cursor;
    v4 = 1;
    goto LABEL_29;
  }
  v4 = 0;
  v11 = 0;
  while (2)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_name(self->_stmt, v11));
    switch(sqlite3_column_type(self->_stmt, v11))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v11));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_stmt, v11));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 3:
        v14 = sqlite3_column_text(self->_stmt, v11);
        if (!v14)
          goto LABEL_21;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
        if (!objc_msgSend(v12, "hasSuffix:", CFSTR("_json")))
        {
          v17 = v15;
          goto LABEL_22;
        }
        objc_msgSend(v15, "dataUsingEncoding:", 4);
        v16 = objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v34 = (void *)v16;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (NSError *)v36;
        v19 = v18;
        if (v17)
        {
          objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 5);
          v20 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v20;
LABEL_22:
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v17, v12);

          v4 = ++v11 >= v10;
          if (v10 == v11)
            goto LABEL_28;
          continue;
        }
        self->_finished = 1;
        v33 = self->_error;
        self->_error = v18;

LABEL_29:
LABEL_3:
        os_unfair_lock_unlock(p_lock);
        return v4;
      case 4:
        v21 = sqlite3_column_blob(self->_stmt, v11);
        if (!v21)
          goto LABEL_21;
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v21, sqlite3_column_bytes(self->_stmt, v11));
LABEL_20:
        v17 = (void *)v13;
        goto LABEL_22;
      default:
LABEL_21:
        v17 = 0;
        goto LABEL_22;
    }
  }
}

- (NSArray)columns
{
  os_unfair_lock_s *p_lock;
  NSArray *columns;
  int v5;
  void *v6;
  int i;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  columns = self->_columns;
  if (!columns)
  {
    v5 = sqlite3_column_count(self->_stmt);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_name(self->_stmt, i));
        objc_msgSend(v6, "addObject:", v8);

      }
    }
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    v10 = self->_columns;
    self->_columns = v9;

    columns = self->_columns;
  }
  v11 = columns;
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[BMSQLResultSet query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cursor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> query: %@, current row: %@"), v4, self, v5, v6);

  return v7;
}

- (NSDictionary)row
{
  return self->_row;
}

- (NSError)error
{
  return self->_error;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (NSString)query
{
  return self->_query;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)_next
{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 + 56);
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "Fetching row %@ in result set for query %@", buf, 0x16u);

}

@end
