@implementation _GEOConfigDBClearExpireOperation

- (id)init:(id)a3 keyPath:(id)a4
{
  id v7;
  id v8;
  _GEOConfigDBClearExpireOperation *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOConfigDBClearExpireOperation;
  v9 = -[_GEOConfigDBOperationBase init](&v12, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)performOperation
{
  NSString *keyPath;
  GEOSQLiteDB *v3;
  NSString *v4;
  GEOSQLiteDB *v5;
  NSString *v6;
  BOOL v7;
  _QWORD v9[4];
  GEOSQLiteDB *v10;
  NSString *v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  keyPath = self->_keyPath;
  v3 = self->_db;
  v4 = keyPath;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __ClearExpireForKey_block_invoke;
  v9[3] = &unk_1E1BFFB28;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  v12 = v13;
  v7 = -[GEOSQLiteDB executeStatement:statementBlock:](v5, "executeStatement:statementBlock:", CFSTR("ClearExpireForKey"), v9);

  _Block_object_dispose(v13, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
