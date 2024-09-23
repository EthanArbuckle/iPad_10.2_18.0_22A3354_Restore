@implementation CKSQLiteCompiledStatementDecoder

- (CKSQLiteCompiledStatementDecoder)initWithStatement:(id)a3
{
  id v5;
  CKSQLiteCompiledStatementDecoder *v6;
  CKSQLiteCompiledStatementDecoder *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *propertyValues;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKSQLiteCompiledStatementDecoder;
  v6 = -[CKSQLiteCompiledStatementDecoder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statement, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    propertyValues = v7->_propertyValues;
    v7->_propertyValues = v8;

  }
  return v7;
}

- (BOOL)ck_isDecodingForCKSQLiteDatabase
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (float)decodeFloatForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (int)decodeIntForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_intValue(v4, v5, v6, v7);

  return v8;
}

- (int)decodeInt32ForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_longValue(v4, v5, v6, v7);

  return v8;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_longLongValue(v4, v5, v6, v7);

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return (id)objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a4, (uint64_t)a4);
}

- (id)fillProperties
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCompiledStatement *statement;
  const char *v6;
  uint64_t v7;
  _QWORD v9[5];

  objc_msgSend_removeAllObjects(self->_propertyValues, a2, v2, v3);
  statement = self->_statement;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6BBDA4;
  v9[3] = &unk_1E1F5FB40;
  v9[4] = self;
  objc_msgSend_enumerateResultColumnsWithBlock_(statement, v6, (uint64_t)v9, v7);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyValues, 0);
  objc_storeStrong((id *)&self->_statement, 0);
}

@end
