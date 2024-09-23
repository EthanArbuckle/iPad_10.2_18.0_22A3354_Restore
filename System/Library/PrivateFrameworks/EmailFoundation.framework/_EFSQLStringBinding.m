@implementation _EFSQLStringBinding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (void)bindTo:(sqlite3_stmt *)a3 withSQLIndex:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  -[_EFSQLStringBinding stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "containsString:", &stru_1E62A9FF8))
    {
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(a3, v4, (const char *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      v10 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      if (v10)
        v11 = (const char *)v10;
      else
        v11 = "";
      sqlite3_bind_text(a3, v4, v11, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_EFSQLStringBinding;
    -[EFSQLBinding bindTo:withSQLIndex:](&v12, sel_bindTo_withSQLIndex_, a3, v4);
  }

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_EFSQLStringBinding)initWithString:(id)a3
{
  id v4;
  _EFSQLStringBinding *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLStringBinding;
  v5 = -[_EFSQLStringBinding init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

@end
