@implementation AVTSideCoreDataStoreMigratableSource

- (AVTSideCoreDataStoreMigratableSource)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTSideCoreDataStoreMigratableSource *v9;
  AVTSideCoreDataStoreMigratableSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTSideCoreDataStoreMigratableSource;
  v9 = -[AVTSideCoreDataStoreMigratableSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (id)createSourceBackend
{
  AVTCoreDataStoreBackend *v3;
  void *v4;
  void *v5;
  AVTCoreDataStoreBackend *v6;

  v3 = [AVTCoreDataStoreBackend alloc];
  -[AVTSideCoreDataStoreMigratableSource configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSideCoreDataStoreMigratableSource environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTCoreDataStoreBackend initWithConfiguration:environment:](v3, "initWithConfiguration:environment:", v4, v5);

  return v6;
}

- (BOOL)finalizeMigration:(id *)a3
{
  void *v4;

  -[AVTSideCoreDataStoreMigratableSource configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "tearDownAndEraseAllContent:", a3);

  return (char)a3;
}

- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5
{
  return a3;
}

- (BOOL)migrationNeeded
{
  void *v2;
  char v3;

  -[AVTSideCoreDataStoreMigratableSource configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentExists");

  return v3;
}

- (AVTCoreDataPersistentStoreLocalConfiguration)configuration
{
  return self->_configuration;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
