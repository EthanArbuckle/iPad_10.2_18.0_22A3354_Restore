@implementation ML3DatabaseStatement

uint64_t __42__ML3DatabaseStatement_bindValuesInArray___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "bindValue:forParameterAtPosition:", a2, (a3 + 1));
}

- (void)bindValue:(id)a3 forParameterAtPosition:(int)a4
{
  if (a3)
    objc_msgSend(a3, "ml_bindToSQLiteStatement:atPosition:", self->_sqliteStatement, *(_QWORD *)&a4);
  else
    sqlite3_bind_null(self->_sqliteStatement, a4);
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (sqlite3_stmt)sqliteStatement
{
  return self->_sqliteStatement;
}

- (void)bindValuesInArray:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__ML3DatabaseStatement_bindValuesInArray___block_invoke;
  v3[3] = &unk_1E5B652A0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (int)reset
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement)
    LODWORD(sqliteStatement) = sqlite3_reset(sqliteStatement);
  self->_isExecuting = 0;
  return (int)sqliteStatement;
}

- (BOOL)clearBindingsAfterRunning
{
  return self->_clearBindingsAfterRunning;
}

- (ML3DatabaseStatement)initWithSQLiteStatement:(sqlite3_stmt *)a3 SQL:(id)a4
{
  id v6;
  ML3DatabaseStatement *v7;
  ML3DatabaseStatement *v8;
  uint64_t v9;
  NSString *sql;
  ML3DatabaseStatement *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  if (a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)ML3DatabaseStatement;
    v7 = -[ML3DatabaseStatement init](&v14, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_sqliteStatement = a3;
      v9 = objc_msgSend(v6, "copy");
      sql = v8->_sql;
      v8->_sql = (NSString *)v9;

      v8->_isExecuting = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    +[MLException exceptionWithName:reason:userInfo:](MLException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("attempt to create a database statement without an underlying sqlite3_stmt"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

    v11 = 0;
  }

  return v11;
}

- (NSString)sql
{
  NSString *sql;
  sqlite3_stmt *sqliteStatement;
  void *v5;
  NSString *v6;
  NSString *v7;

  sql = self->_sql;
  if (!sql)
  {
    sqliteStatement = self->_sqliteStatement;
    if (sqliteStatement)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql(sqliteStatement));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_sql;
    self->_sql = v6;

    sql = self->_sql;
  }
  return sql;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isReadOnly
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  return !sqliteStatement || sqlite3_stmt_readonly(sqliteStatement) != 0;
}

- (int)step
{
  sqlite3_stmt *sqliteStatement;
  void *v5;

  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatement.m"), 68, CFSTR("attempt to step database statement that has already been finalized")), v5, (sqliteStatement = self->_sqliteStatement) != 0))
  {
    LODWORD(sqliteStatement) = sqlite3_step(sqliteStatement);
  }
  self->_isExecuting = 1;
  return (int)sqliteStatement;
}

- (int)finalizeStatement
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement)
  {
    LODWORD(sqliteStatement) = sqlite3_finalize(sqliteStatement);
    self->_sqliteStatement = 0;
  }
  self->_isExecuting = 0;
  return (int)sqliteStatement;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_sqliteStatement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatement.m"), 38, CFSTR("%@ %p has a dangling SQLite resource. (%p) A connection should have free'd this resource."), objc_opt_class(), self, self->_sqliteStatement);

  }
  v5.receiver = self;
  v5.super_class = (Class)ML3DatabaseStatement;
  -[ML3DatabaseStatement dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseStatement;
  -[ML3DatabaseStatement description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ML3DatabaseStatement isExecuting](self, "isExecuting");
  -[ML3DatabaseStatement sql](self, "sql");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ executing=%d, sql='%@'"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isBusy
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement)
    LOBYTE(sqliteStatement) = sqlite3_stmt_busy(sqliteStatement) != 0;
  return (char)sqliteStatement;
}

- (int)clearBindings
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement)
    LODWORD(sqliteStatement) = sqlite3_clear_bindings(sqliteStatement);
  return (int)sqliteStatement;
}

- (void)bindInt:(int)a3 forParameterAtPosition:(int)a4
{
  sqlite3_bind_int(self->_sqliteStatement, a4, a3);
}

- (void)bindInt64:(int64_t)a3 forParameterAtPosition:(int)a4
{
  sqlite3_bind_int64(self->_sqliteStatement, a4, a3);
}

- (void)bindDouble:(double)a3 forParameterAtPosition:(int)a4
{
  sqlite3_bind_double(self->_sqliteStatement, a4, a3);
}

- (void)bindNullForParameterAtPosition:(int)a3
{
  sqlite3_bind_null(self->_sqliteStatement, a3);
}

- (void)bindBytes:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (!a3)
    a3 = "";
  sqlite3_bind_blob(sqliteStatement, a5, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)bindBytesNoCopy:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (!a3)
    a3 = "";
  sqlite3_bind_blob(sqliteStatement, a5, a3, a4, 0);
}

- (void)bindUTF8String:(const char *)a3 forParameterAtPosition:(int)a4
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (!a3)
    a3 = "";
  sqlite3_bind_text(sqliteStatement, a4, a3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)bindUTF8StringNoCopy:(const char *)a3 forParameterAtPosition:(int)a4
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (!a3)
    a3 = "";
  sqlite3_bind_text(sqliteStatement, a4, a3, -1, 0);
}

- (void)bindUTF8StringNoCopy:(const char *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqlite3_stmt *sqliteStatement;

  sqliteStatement = self->_sqliteStatement;
  if (!a3)
    a3 = "";
  sqlite3_bind_text(sqliteStatement, a5, a3, a4, 0);
}

- (void)bindValuesForParameterNames:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ML3DatabaseStatement_bindValuesForParameterNames___block_invoke;
  v3[3] = &unk_1E5B65278;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)setClearBindingsAfterRunning:(BOOL)a3
{
  self->_clearBindingsAfterRunning = a3;
}

void __52__ML3DatabaseStatement_bindValuesForParameterNames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR(":%@"), a2);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  objc_msgSend(*(id *)(a1 + 32), "bindValue:forParameterAtPosition:", v8, sqlite3_bind_parameter_index(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24), v7));
}

@end
