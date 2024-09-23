@implementation ASUSQLiteDatabaseStoreDescriptor

- (ASUSQLiteDatabaseStoreDescriptor)initWithSchemaName:(id)a3 tableNames:(id)a4 sessionClass:(Class)a5 transactionClass:(Class)a6
{
  id v10;
  id v11;
  ASUSQLiteDatabaseStoreDescriptor *v12;
  uint64_t v13;
  NSString *schemaName;
  uint64_t v15;
  NSArray *tableNames;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASUSQLiteDatabaseStoreDescriptor;
  v12 = -[ASUSQLiteDatabaseStoreDescriptor init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    schemaName = v12->_schemaName;
    v12->_schemaName = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    tableNames = v12->_tableNames;
    v12->_tableNames = (NSArray *)v15;

    v12->_sessionClass = a5;
    v12->_transactionClass = a6;
  }

  return v12;
}

- (NSString)schemaName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (Class)sessionClass
{
  return self->_sessionClass;
}

- (Class)transactionClass
{
  return self->_transactionClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_schemaName, 0);
}

@end
