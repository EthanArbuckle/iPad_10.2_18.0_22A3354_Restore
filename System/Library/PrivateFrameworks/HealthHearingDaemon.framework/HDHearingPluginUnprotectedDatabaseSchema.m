@implementation HDHearingPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 9;
}

- (NSArray)databaseEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 3, 0, &__block_literal_global_1);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 4, 0, &__block_literal_global_191);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 5, 0, &__block_literal_global_194);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 6, 0, &__block_literal_global_197);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 7, 0, &__block_literal_global_198);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 8, 0, &__block_literal_global_201);
  objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v6, 9, 0, &__block_literal_global_202);

}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeSQLStatements:error:", &unk_24DC67040, a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", CFSTR("DROP TABLE IF EXISTS hearing_headphone_audio_exposure_data;"),
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", CFSTR("DELETE FROM hearing_headphone_audio_exposure_statistics;"),
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", CFSTR("DELETE FROM hearing_headphone_audio_exposure_statistics;"),
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", CFSTR("DELETE FROM key_value WHERE domain='Hearing' and key='_LargestSevenDayDoseToday';"),
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", CFSTR("DELETE FROM hearing_headphone_audio_exposure_statistics;"),
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeSQLStatements:error:", &unk_24DC67058, a5);

  return a5 ^ 1;
}

@end
