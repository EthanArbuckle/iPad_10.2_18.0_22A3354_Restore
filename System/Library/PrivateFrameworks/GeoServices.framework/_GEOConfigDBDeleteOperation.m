@implementation _GEOConfigDBDeleteOperation

- (BOOL)performOperation
{
  _GEOConfigDBDeleteOperation *v2;
  uint64_t (*v3)(void *, _QWORD, int64_t);
  void *v4;

  v2 = self;
  v3 = -[_GEOConfigDB clearFunction](self->_configDB, "clearFunction");
  -[_GEOConfigDB db](v2->_configDB, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3(v4, 0, v2->_rowId);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDB, 0);
}

- (id)init:(id)a3 rowId:(int64_t)a4
{
  id v7;
  _GEOConfigDBDeleteOperation *v8;
  _GEOConfigDBDeleteOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOConfigDBDeleteOperation;
  v8 = -[_GEOConfigDBOperationBase init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configDB, a3);
    v9->_rowId = a4;
  }

  return v9;
}

@end
