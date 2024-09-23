@implementation FCCKDatabaseEncryptedZoneMigrator

- (id)initWithSchema:(void *)a3 recordEncryptionMiddleware:(void *)a4 deprecatedBlock:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)FCCKDatabaseEncryptedZoneMigrator;
    v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v12 = objc_msgSend(v10, "copy");
      v13 = a1[3];
      a1[3] = (id)v12;

    }
  }

  return a1;
}

- (id)databaseMigrationZoneNamesFromVersion:(int64_t)a3 toVersion:(int64_t)a4
{
  if (self)
    self = (FCCKDatabaseEncryptedZoneMigrator *)self->_schema;
  return -[FCCKPrivateDatabaseSchema zoneNamesWithChangesFromVersion:toVersion:](self, a3, a4);
}

- (BOOL)databaseMigrationShouldMigrateEntireZone:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C94A30]) ^ 1;
}

- (id)databaseMigrationRecordNamesToMigrateInZone:(id)a3 fromVersion:(int64_t)a4 toVersion:(int64_t)a5
{
  FCCKPrivateDatabaseSchema *schema;
  void *v9;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C94A30]))
  {
    if (self)
      schema = self->_schema;
    else
      schema = 0;
    -[FCCKPrivateDatabaseSchema recordNamesInDefaultZoneChangedFromVersion:toVersion:](schema, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)databaseMigrationShouldDropRecord:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  if (self)
  {
    v6 = self->_deprecatedBlock;
    if (v6)
    {
      v7 = v6;
      LOBYTE(self) = (*((uint64_t (**)(void))self->_deprecatedBlock + 2))();

    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (id)databaseMigrationMigrateRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  FCCKPrivateDatabaseSchema *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  FCCKDatabaseRecordMiddleware *recordEncryptionMiddleware;
  FCCKDatabaseRecordMiddleware *v18;
  void *v19;
  id v20;
  FCCKDatabaseRecordMiddleware *v21;
  FCCKDatabaseRecordMiddleware *v22;
  id v23;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  if (self && self->_recordEncryptionMiddleware)
  {
    v10 = v8;
    v11 = self->_schema;
    v12 = v10;
    if (v9)
      v13 = v9[5];
    else
      v13 = 0;
    -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:]((FCCKRecordZoneIDMapping *)v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "hasChanges");
    if (v15)
    {
      v16 = (void *)MEMORY[0x1A8580B64]();
      recordEncryptionMiddleware = self->_recordEncryptionMiddleware;
      v26 = 0;
      v18 = recordEncryptionMiddleware;
      -[FCCKDatabaseRecordMiddleware serverToClientRecord:inDatabase:error:](v18, "serverToClientRecord:inDatabase:error:", v12, v9, &v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v26;

      v21 = self->_recordEncryptionMiddleware;
      v25 = v20;
      v22 = v21;
      -[FCCKDatabaseRecordMiddleware clientToServerRecord:inDatabase:error:](v22, "clientToServerRecord:inDatabase:error:", v19, v9, &v25);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v25;

      objc_autoreleasePoolPop(v16);
      if (!a5)
        goto LABEL_11;
      goto LABEL_10;
    }
    v23 = 0;
    if (a5)
    {
LABEL_10:
      v23 = objc_retainAutorelease(v23);
      *a5 = v23;
    }
  }
  else
  {
    v23 = v8;
    v12 = v23;
  }
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deprecatedBlock, 0);
  objc_storeStrong((id *)&self->_recordEncryptionMiddleware, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
