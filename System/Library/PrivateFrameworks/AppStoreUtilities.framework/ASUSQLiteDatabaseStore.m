@implementation ASUSQLiteDatabaseStore

- (ASUSQLiteDatabaseStore)initWithDatabase:(id)a3
{
  id v5;
  ASUSQLiteDatabaseStore *v6;
  ASUSQLiteDatabaseStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteDatabaseStore;
  v6 = -[ASUSQLiteDatabaseStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

+ (ASUSQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return 0;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return 1;
}

- (void)modifyUsingTransaction:(id)a3
{
  -[ASUSQLiteDatabase modifyStore:usingTransaction:](self->_database, "modifyStore:usingTransaction:", self, a3);
}

- (void)asyncModifyUsingTransaction:(id)a3 completion:(id)a4
{
  -[ASUSQLiteDatabase modifyStore:usingTransaction:completion:](self->_database, "modifyStore:usingTransaction:completion:", self, a3, a4);
}

- (void)readUsingSession:(id)a3
{
  -[ASUSQLiteDatabase readStore:usingSession:](self->_database, "readStore:usingSession:", self, a3);
}

- (void)asyncReadUsingSession:(id)a3 completion:(id)a4
{
  -[ASUSQLiteDatabase readStore:usingSession:completion:](self->_database, "readStore:usingSession:completion:", self, a3, a4);
}

- (ASUSQLiteDatabase)database
{
  return (ASUSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
