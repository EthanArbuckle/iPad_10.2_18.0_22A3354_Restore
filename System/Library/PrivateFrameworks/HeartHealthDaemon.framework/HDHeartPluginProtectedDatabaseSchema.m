@implementation HDHeartPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "futureMigrationsEnabled");

  if (v3)
    return 100000;
  else
    return 4;
}

- (NSArray)databaseEntities
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", objc_opt_class());
}

- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[HDHeartPluginProtectedDatabaseSchema crystal_addMigrationStepsForSchemaName:migrator:](self, "crystal_addMigrationStepsForSchemaName:migrator:", v9, v6);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "futureMigrationsEnabled");

  if (v8)
    -[HDHeartPluginProtectedDatabaseSchema future_addMigrationStepsForSchemaName:migrator:](self, "future_addMigrationStepsForSchemaName:migrator:", v9, v6);

}

- (void)addMigrationTo:(int64_t)a3 onMigrator:(id)a4 forSchema:(id)a5 function:(void *)a6
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__HDHeartPluginProtectedDatabaseSchema_addMigrationTo_onMigrator_forSchema_function___block_invoke;
  v6[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v6[4] = a6;
  objc_msgSend(a4, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", a5, a3, 0, v6);
}

uint64_t __85__HDHeartPluginProtectedDatabaseSchema_addMigrationTo_onMigrator_forSchema_function___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)crystal_addMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
  -[HDHeartPluginProtectedDatabaseSchema addMigrationTo:onMigrator:forSchema:function:](self, "addMigrationTo:onMigrator:forSchema:function:", 4, a4, a3, _HDDropHeartCLogTables);
}

@end
