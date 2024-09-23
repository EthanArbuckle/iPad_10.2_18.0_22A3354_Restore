@implementation ASUSQLiteSchemaMigration

- (ASUSQLiteSchemaMigration)initWithConnection:(id)a3
{
  id v5;
  ASUSQLiteSchemaMigration *v6;
  ASUSQLiteSchemaMigration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteSchemaMigration;
  v6 = -[ASUSQLiteSchemaMigration init](&v9, sel_init);
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
  -[ASUSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 0, 0);
}

- (void)_executeStatement:(int)a3 canFailMigration:(void *)a4 bindings:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      v9 = *(void **)(a1 + 8);
      v14 = 0;
      v10 = objc_msgSend(v9, "executeStatement:error:bindings:", v7, &v14, v8);
      v11 = v14;
      v12 = v14;
      if (a3)
      {
        if (*(_BYTE *)(a1 + 24))
          v13 = v10;
        else
          v13 = 0;
        *(_BYTE *)(a1 + 24) = v13;
      }
      if ((v10 & 1) == 0)
        objc_storeStrong((id *)(a1 + 16), v11);
    }
    else
    {
      v12 = 0;
    }

  }
}

- (void)executeOptionalStatement:(id)a3 bindings:(id)a4
{
  -[ASUSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 0, a4);
}

- (void)executeStatement:(id)a3
{
  -[ASUSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 1, 0);
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
  -[ASUSQLiteSchemaMigration _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 1, a4);
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
