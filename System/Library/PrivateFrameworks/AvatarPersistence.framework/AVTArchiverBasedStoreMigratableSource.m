@implementation AVTArchiverBasedStoreMigratableSource

- (AVTArchiverBasedStoreMigratableSource)initWithStoreLocation:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTArchiverBasedStoreMigratableSource *v9;
  AVTArchiverBasedStoreMigratableSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTArchiverBasedStoreMigratableSource;
  v9 = -[AVTArchiverBasedStoreMigratableSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeLocation, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (BOOL)migrationNeeded
{
  void *v2;
  BOOL v3;

  -[AVTArchiverBasedStoreMigratableSource storeLocation](self, "storeLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[AVTArchiverBasedStorePersistence contentExistsAtLocation:](AVTArchiverBasedStorePersistence, "contentExistsAtLocation:", v2);

  return v3;
}

- (id)createSourceBackend
{
  AVTArchiverBasedStoreBackend *v3;
  void *v4;
  void *v5;
  AVTArchiverBasedStoreBackend *v6;

  v3 = [AVTArchiverBasedStoreBackend alloc];
  -[AVTArchiverBasedStoreMigratableSource storeLocation](self, "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTArchiverBasedStoreMigratableSource environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTArchiverBasedStoreBackend initWithStoreLocation:domainIdentifier:environment:](v3, "initWithStoreLocation:domainIdentifier:environment:", v4, &stru_24DD33C98, v5);

  return v6;
}

- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5
{
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  AVTAvatarRecord *v11;
  void *v12;
  void *v13;
  AVTAvatarRecord *v14;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = -(double)a5;
  v8 = a3;
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [AVTAvatarRecord alloc];
  objc_msgSend(v8, "avatarData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AVTAvatarRecord initWithAvatarData:identifier:orderDate:](v11, "initWithAvatarData:identifier:orderDate:", v12, v13, v10);
  return v14;
}

- (BOOL)finalizeMigration:(id *)a3
{
  void *v4;

  -[AVTArchiverBasedStoreMigratableSource storeLocation](self, "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[AVTArchiverBasedStorePersistence removeFilesAtLocation:error:](AVTArchiverBasedStorePersistence, "removeFilesAtLocation:error:", v4, a3);

  return (char)a3;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end
