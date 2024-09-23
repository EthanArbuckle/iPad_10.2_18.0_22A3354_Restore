@implementation HDSQLiteStatement

- (HDSQLiteStatement)initWithSQL:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  HDSQLiteStatement *v8;
  HDSQLiteStatement *v9;
  uint64_t v10;
  NSString *sql;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteStatement;
  v8 = -[HDSQLiteStatement init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a4);
    v10 = objc_msgSend(v6, "copy");
    sql = v9->_sql;
    v9->_sql = (NSString *)v10;

  }
  return v9;
}

- (BOOL)performStatementWithError:(id *)a3 bindingHandler:(id)a4
{
  return -[HDSQLiteStatement enumerateStatementWithError:bindingHandler:block:](self, "enumerateStatementWithError:bindingHandler:block:", a3, a4, 0);
}

- (BOOL)enumerateStatementWithError:(id *)a3 bindingHandler:(id)a4 block:(id)a5
{
  return -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](self->_database, "executeSQL:error:bindingHandler:enumerationHandler:", self->_sql, a3, a4, a5);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p \"%@\">"), objc_opt_class(), self, self->_sql);
}

- (HDSQLiteDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
