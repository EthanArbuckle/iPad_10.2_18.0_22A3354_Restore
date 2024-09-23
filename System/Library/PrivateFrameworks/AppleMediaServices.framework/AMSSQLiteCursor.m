@implementation AMSSQLiteCursor

- (AMSSQLiteCursor)initWithStatement:(id)a3
{
  id v5;
  AMSSQLiteCursor *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSSQLiteCursor;
  v6 = -[AMSSQLiteCursor init](&v8, sel_init);
  if (v6)
  {
    v6->_statement = (sqlite3_stmt *)objc_msgSend(v5, "sqlite3_stmt");
    objc_storeStrong((id *)&v6->_statementWrapper, a3);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (id)stringForColumnName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AMSSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)stringForColumnIndex:(int)a3
{
  void *v5;

  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sqlite3_column_text(self->_statement, a3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (int)columnIndexForColumnName:(id)a3
{
  id v4;
  NSDictionary *columnIndexByName;
  NSDictionary *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  columnIndexByName = self->_columnIndexByName;
  if (!columnIndexByName)
  {
    -[AMSSQLiteStatement columnIndexByName](self->_statementWrapper, "columnIndexByName");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_columnIndexByName;
    self->_columnIndexByName = v6;

    columnIndexByName = self->_columnIndexByName;
  }
  -[NSDictionary objectForKey:](columnIndexByName, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "intValue");
  else
    v10 = -1;

  return v10;
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (id)dataForColumnIndex:(int)a3
{
  void *v5;
  const void *v6;

  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, sqlite3_column_bytes(self->_statement, a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)dataForColumnName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AMSSQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)dateForColumnIndex:(int)a3
{
  int v5;
  void *v6;
  double v7;
  void *v8;

  v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = (double)sqlite3_column_int64(self->_statement, a3);
  }
  else
  {
    if (v5 != 2)
    {
      v8 = 0;
      return v8;
    }
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = sqlite3_column_double(self->_statement, a3);
  }
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)dateForColumnName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AMSSQLiteCursor dateForColumnIndex:](self, "dateForColumnIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (double)doubleForColumnName:(id)a3
{
  int v4;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0)
    return 0.0;
  else
    return sqlite3_column_double(self->_statement, v4);
}

- (int)intForColumnName:(id)a3
{
  int v4;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0)
    return 0;
  else
    return sqlite3_column_int(self->_statement, v4);
}

- (int64_t)int64ForColumnName:(id)a3
{
  int v4;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0)
    return 0;
  else
    return sqlite3_column_int64(self->_statement, v4);
}

- (id)numberForColumnIndex:(int)a3
{
  int v5;
  void *v6;

  v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_statement, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_statement, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)numberForColumnName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AMSSQLiteCursor numberForColumnIndex:](self, "numberForColumnIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)URLForColumnIndex:(int)a3
{
  void *v3;
  void *v4;

  -[AMSSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[AMSSQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AMSSQLiteCursor URLForColumnIndex:](self, "URLForColumnIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)_columnTypeForColumnIndex:(int)a3
{
  return sqlite3_column_type(self->_statement, a3);
}

@end
