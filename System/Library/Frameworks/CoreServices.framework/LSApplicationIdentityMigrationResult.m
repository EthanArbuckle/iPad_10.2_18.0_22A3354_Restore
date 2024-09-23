@implementation LSApplicationIdentityMigrationResult

- (void)noteIdentityDoesNotNeedMigration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v5, v4);

  }
}

- (LSApplicationIdentityMigrationResult)init
{
  LSApplicationIdentityMigrationResult *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *migratedIdentities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LSApplicationIdentityMigrationResult;
  v2 = -[LSApplicationIdentityMigrationResult init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    migratedIdentities = v2->_migratedIdentities;
    v2->_migratedIdentities = v3;

  }
  return v2;
}

- (id)migratedIdentitiesForIdentity:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_migratedIdentities, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bestMigratedIdentityForIdentity:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_migratedIdentities, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratedIdentities, 0);
}

@end
