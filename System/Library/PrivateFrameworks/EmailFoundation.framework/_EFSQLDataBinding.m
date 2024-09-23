@implementation _EFSQLDataBinding

- (_EFSQLDataBinding)initWithData:(id)a3
{
  id v4;
  _EFSQLDataBinding *v5;
  uint64_t v6;
  NSData *dataValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLDataBinding;
  v5 = -[_EFSQLDataBinding init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v6;

  }
  return v5;
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  -[_EFSQLDataBinding dataValue](self, "dataValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    sqlite3_bind_blob64(a3, v4, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_EFSQLDataBinding;
    -[EFSQLBinding bindTo:withSQLIndex:](&v10, sel_bindTo_withSQLIndex_, a3, v4);
  }

}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
