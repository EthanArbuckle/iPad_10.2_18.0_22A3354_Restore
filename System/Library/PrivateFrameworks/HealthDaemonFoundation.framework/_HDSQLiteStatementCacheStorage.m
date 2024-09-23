@implementation _HDSQLiteStatementCacheStorage

- (CFDictionaryRef)allStatementSQLStrings
{
  CFDictionaryRef *v1;
  id v2;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    CFDictionaryApplyFunction(v1[3], (CFDictionaryApplierFunction)collectStatementStrings, v2);
    CFDictionaryApplyFunction(v1[2], (CFDictionaryApplierFunction)collectStatementStrings, v2);
    v1 = (CFDictionaryRef *)objc_msgSend(v2, "copy");

  }
  return v1;
}

- (void)clearStatements
{
  if (a1)
  {
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 16));
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 24));
  }
}

- (const)statementForSQL:(uint64_t)a1
{
  id v3;
  const void *Value;

  v3 = a2;
  if (a1)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v3);
    if (!Value)
      Value = (const void *)-[_HDSQLiteStatementCacheStorage statementForSQL:](*(_QWORD *)(a1 + 8), v3);
  }
  else
  {
    Value = 0;
  }

  return Value;
}

- (_QWORD)initWithParentStorage:(_QWORD *)a1
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_HDSQLiteStatementCacheStorage;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      a1[2] = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], &kSQLite3StatementDictionaryValueCallbacks);
      a1[3] = CFDictionaryCreateMutable(0, 0, 0, &kSQLite3StatementDictionaryValueCallbacks);
    }
  }

  return a1;
}

- (_HDSQLiteStatementCacheStorage)init
{
  return (_HDSQLiteStatementCacheStorage *)-[_HDSQLiteStatementCacheStorage initWithParentStorage:](self, 0);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_statementsBySQL);
  CFRelease(self->_statementsByKey);
  v3.receiver = self;
  v3.super_class = (Class)_HDSQLiteStatementCacheStorage;
  -[_HDSQLiteStatementCacheStorage dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentStorage, 0);
}

@end
