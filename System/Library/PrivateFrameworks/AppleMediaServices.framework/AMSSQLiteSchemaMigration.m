@implementation AMSSQLiteSchemaMigration

- (AMSSQLiteSchemaMigration)initWithConnection:(id)a3
{
  id v5;
  AMSSQLiteSchemaMigration *v6;
  AMSSQLiteSchemaMigration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteSchemaMigration;
  v6 = -[AMSSQLiteSchemaMigration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_success = 1;
  }

  return v7;
}

- (void)executeOptionalStatement:(id)a3
{
  -[AMSSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:error:](self, "_executeStatement:canFailMigration:bindings:error:", a3, 0, 0, 0);
}

- (void)executeOptionalStatement:(id)a3 bindings:(id)a4
{
  -[AMSSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:error:](self, "_executeStatement:canFailMigration:bindings:error:", a3, 0, a4, 0);
}

- (void)executeStatement:(id)a3
{
  -[AMSSQLiteSchemaMigration executeStatement:error:](self, "executeStatement:error:", a3, 0);
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[AMSSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:error:](self, "_executeStatement:canFailMigration:bindings:error:", a3, 1, 0, 0);
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
  -[AMSSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:error:](self, "_executeStatement:canFailMigration:bindings:error:", a3, 1, a4, 0);
}

- (BOOL)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  AMSSQLiteConnection *connection;
  BOOL v13;
  id v14;
  id v15;
  BOOL v16;
  BOOL v17;
  id v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (self->_success)
  {
    connection = self->_connection;
    v19 = 0;
    v13 = -[AMSSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", v10, &v19, v11);
    v14 = v19;
    v15 = v19;
    if (v8)
    {
      v16 = self->_success && v13;
      self->_success = v16;
    }
    if (v13)
    {
      v17 = 1;
    }
    else
    {
      objc_storeStrong((id *)&self->_error, v14);
      if (a6)
      {
        v15 = objc_retainAutorelease(v15);
        v17 = 0;
        *a6 = v15;
      }
      else
      {
        v17 = 0;
      }
    }
  }
  else
  {
    v17 = 0;
    v15 = 0;
  }

  return v17;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
