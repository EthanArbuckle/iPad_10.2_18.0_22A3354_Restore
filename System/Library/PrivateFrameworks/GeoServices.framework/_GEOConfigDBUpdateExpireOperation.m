@implementation _GEOConfigDBUpdateExpireOperation

- (id)init:(id)a3 expire:(id)a4
{
  id v7;
  id v8;
  _GEOConfigDBUpdateExpireOperation *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOConfigDBUpdateExpireOperation;
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
  GEOSQLiteDB *db;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  GEOSQLiteDB *v9;
  id v10;
  id v11;
  GEOSQLiteDB *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  GEOSQLiteDB *v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;

  db = self->_db;
  -[GEOConfigExpiringKey keyPath](self->_expire, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOConfigExpiringKey expireTime](self->_expire, "expireTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = (uint64_t)v6;
  -[GEOConfigExpiringKey expireOSVersion](self->_expire, "expireOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = db;
  v10 = v4;
  v11 = v8;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __SetExpire_block_invoke;
  v16[3] = &unk_1E1BFFB00;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v20 = v22;
  v21 = v7;
  v14 = v11;
  v19 = v14;
  LOBYTE(v10) = -[GEOSQLiteDB executeStatement:statementBlock:](v12, "executeStatement:statementBlock:", CFSTR("SetExpire"), v16);

  _Block_object_dispose(v22, 8);
  return (char)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expire, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
