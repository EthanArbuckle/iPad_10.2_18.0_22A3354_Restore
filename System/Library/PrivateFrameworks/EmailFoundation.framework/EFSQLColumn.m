@implementation EFSQLColumn

- (NSString)name
{
  void *v2;

  v2 = (void *)sqlite3_column_name(self->_statement, self->_index);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (EFSQLColumn)initWithSQLiteStatement:(sqlite3_stmt *)a3 index:(int64_t)a4
{
  EFSQLColumn *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EFSQLColumn;
  result = -[EFSQLColumn init](&v7, sel_init);
  if (result)
  {
    result->_index = a4;
    result->_statement = a3;
  }
  return result;
}

- (int64_t)int64Value
{
  int v3;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1)
    return sqlite3_column_int64(self->_statement, self->_index);
  if (v3 != 5)
  {
    if ((v3 - 2) > 2)
      v5 = CFSTR("UNKNOWN");
    else
      v5 = off_1E62A6F98[v3 - 2];
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), CFSTR("SQLITE_INTEGER"), v5));
    qword_1EEF0D640 = objc_msgSend(v6, "UTF8String");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  return 0;
}

- (NSString)stringValue
{
  unsigned __int8 *v3;
  sqlite3_stmt *statement;
  int index;

  if (sqlite3_column_type(self->_statement, self->_index) == 5)
  {
    v3 = 0;
  }
  else
  {
    statement = self->_statement;
    index = self->_index;
    v3 = (unsigned __int8 *)sqlite3_column_text(statement, index);
    if (v3)
      v3 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, sqlite3_column_bytes(statement, index), 4);
  }
  return (NSString *)v3;
}

- (NSNumber)numberValue
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  -[EFSQLColumn objectValue](self, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    NSStringFromClass(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v8;
    v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), v9, v10));
    qword_1EEF0D640 = objc_msgSend(v11, "UTF8String");
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v11);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }

  return (NSNumber *)v4;
}

- (id)objectValue
{
  sqlite3_stmt *statement;
  int index;
  void *v4;
  id v5;
  const unsigned __int8 *v6;
  void *v7;
  const void *v8;
  int v9;

  statement = self->_statement;
  index = self->_index;
  switch(sqlite3_column_type(statement, index))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(statement, index));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(statement, index));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      v6 = sqlite3_column_text(statement, index);
      v4 = (void *)objc_msgSend(v5, "initWithBytes:length:encoding:", v6, sqlite3_column_bytes(statement, index), 4);
      break;
    case 4:
      v7 = (void *)MEMORY[0x1E0C99D50];
      v8 = sqlite3_column_blob(statement, index);
      v9 = sqlite3_column_bytes(statement, index);
      objc_msgSend(v7, "dataWithBytes:length:", v8, v9 & ~(v9 >> 31));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (BOOL)BOOLValue
{
  int v3;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1)
    return sqlite3_column_int(self->_statement, self->_index) != 0;
  if (v3 != 5)
  {
    if ((v3 - 2) > 2)
      v5 = CFSTR("UNKNOWN");
    else
      v5 = off_1E62A6F98[v3 - 2];
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), CFSTR("SQLITE_INTEGER"), v5));
    qword_1EEF0D640 = objc_msgSend(v6, "UTF8String");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  return 0;
}

- (NSDate)dateValue
{
  int v3;
  void *v4;
  __CFString *v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = sqlite3_column_type(self->_statement, self->_index);
  if ((v3 - 1) >= 2)
  {
    if (v3 != 5)
    {
      v6 = CFSTR("UNKNOWN");
      if (v3 == 4)
        v6 = CFSTR("SQLITE_BLOB");
      if (v3 == 3)
        v6 = CFSTR("SQLITE_TEXT");
      v7 = v6;
      v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), CFSTR("SQLITE_INTEGER"), v7));
      qword_1EEF0D640 = objc_msgSend(v8, "UTF8String");
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v8);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v9, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(self->_statement, self->_index));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v4;
}

- (int64_t)integerValue
{
  int v3;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 1)
    return sqlite3_column_int(self->_statement, self->_index);
  if (v3 != 5)
  {
    if ((v3 - 2) > 2)
      v5 = CFSTR("UNKNOWN");
    else
      v5 = off_1E62A6F98[v3 - 2];
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), CFSTR("SQLITE_INTEGER"), v5));
    qword_1EEF0D640 = objc_msgSend(v6, "UTF8String");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  return 0;
}

- (EFSQLColumn)initWithPreparedStatement:(id)a3 index:(int64_t)a4
{
  id v6;
  EFSQLColumn *v7;

  v6 = objc_retainAutorelease(a3);
  v7 = -[EFSQLColumn initWithSQLiteStatement:index:](self, "initWithSQLiteStatement:index:", objc_msgSend(v6, "compiled"), a4);

  return v7;
}

- (NSData)dataValue
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  if (sqlite3_column_type(self->_statement, self->_index) == 5)
  {
    v3 = 0;
  }
  else
  {
    -[EFSQLColumn objectValue](self, "objectValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    v3 = v4;
    if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      NSStringFromClass(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      v11 = v9;
      v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), v10, v11));
      qword_1EEF0D640 = objc_msgSend(v12, "UTF8String");
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v12);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }

  }
  return (NSData *)v3;
}

- (double)doubleValue
{
  int v3;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = sqlite3_column_type(self->_statement, self->_index);
  if (v3 == 2)
    return sqlite3_column_double(self->_statement, self->_index);
  if (v3 != 5)
  {
    if ((v3 - 1) > 3)
      v5 = CFSTR("UNKNOWN");
    else
      v5 = off_1E62A6FB0[v3 - 1];
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected %@, got %@"), CFSTR("SQLITE_FLOAT"), v5));
    qword_1EEF0D640 = objc_msgSend(v6, "UTF8String");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Type mismatch -- %@"), v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  return 0.0;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[EFSQLColumn index](self, "index");
  -[EFSQLColumn name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumn objectValue](self, "objectValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p index=%ld name=%@ value=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)index
{
  return self->_index;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

@end
