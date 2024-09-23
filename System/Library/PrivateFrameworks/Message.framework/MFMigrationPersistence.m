@implementation MFMigrationPersistence

- (MFMigrationPersistence)init
{
  MFMigrationPersistence *v2;
  MFMigrationPersistence *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMigrationPersistence;
  v2 = -[MFMigrationPersistence init](&v5, sel_init);
  v3 = v2;
  if (v2)
    MFSetUserAgent(v2);
  return v3;
}

+ (BOOL)migrateDatabaseAtPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  MFProtectedDatabasePersistence_iOS *v6;
  MFPersistenceDatabase_iOS *v7;
  void *v8;
  void *v9;
  MFPersistenceDatabase_iOS *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D1EB80]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F028]), "initWithAllowedProtocolPrefixes:", 0x1E4F68F08);
  objc_msgSend(MEMORY[0x1E0D1EB78], "registerAdditionalPropertiesForPropertyMapper:", v5);
  v6 = -[EDProtectedDatabasePersistence initWithBasePath:hookRegistry:]([MFProtectedDatabasePersistence_iOS alloc], "initWithBasePath:hookRegistry:", v3, v4);
  v7 = [MFPersistenceDatabase_iOS alloc];
  +[EDPersistenceDatabaseSchema schema](MFPersistenceDatabaseSchema_iOS, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPersistenceDatabaseSchema protectedSchema](MFPersistenceDatabaseSchema_iOS, "protectedSchema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MFPersistenceDatabase_iOS initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:](v7, "initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:", v3, CFSTR("Envelope Index"), 3, v8, v9, v5, v6);

  v11 = (void *)MEMORY[0x1A85B0E24]();
  -[MFPersistenceDatabase_iOS openConnectionIsWriter:](v10, "openConnectionIsWriter:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "close");

  objc_autoreleasePoolPop(v11);
  return v13 != 0;
}

- (BOOL)canRegisterForAPSPush
{
  return 0;
}

- (BOOL)canUseSpotlightIndex
{
  return 0;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)isMaild
{
  return 0;
}

- (BOOL)isMobileMail
{
  return 0;
}

@end
