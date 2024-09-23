@implementation _GEOConfigDBInsertOperation

- (id)init:(id)a3 rowId:(int64_t)a4 type:(id)a5 key:(id)a6 value:(id)a7 parentId:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOConfigDBInsertOperation *v18;
  _GEOConfigDBInsertOperation *v19;
  objc_super v22;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_GEOConfigDBInsertOperation;
  v18 = -[_GEOConfigDBOperationBase init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_configDB, a3);
    v19->_rowId = a4;
    objc_storeStrong((id *)&v19->_type, a5);
    objc_storeStrong((id *)&v19->_key, a6);
    objc_storeStrong((id *)&v19->_value, a7);
    v19->_parentId = a8;
  }

  return v19;
}

- (BOOL)performOperation
{
  _GEOConfigDBInsertOperation *v2;
  uint64_t (*v3)(void *, _QWORD, int64_t, NSString *, int64_t, NSString *, NSString *);
  void *v4;

  v2 = self;
  v3 = -[_GEOConfigDB addFunction](self->_configDB, "addFunction");
  -[_GEOConfigDB db](v2->_configDB, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3(v4, 0, v2->_rowId, v2->_key, v2->_parentId, v2->_type, v2->_value);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_configDB, 0);
}

@end
