@implementation ACHDatabaseSchemaProvider

- (NSString)schemaName
{
  return (NSString *)(id)*MEMORY[0x24BE01218];
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  int64_t v3;

  v3 = 23;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return 3;
  else
    return v3;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 == 2)
  {
    v7 = v6;
    -[ACHDatabaseSchemaProvider _addAddAvailableCountryCodesColumnMigrationToMigrator:](self, "_addAddAvailableCountryCodesColumnMigrationToMigrator:", v6);
    -[ACHDatabaseSchemaProvider _addVersion5MigratorToMigrator:](self, "_addVersion5MigratorToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addValidateEarnedInstanceRowStepToMigrator:](self, "_addValidateEarnedInstanceRowStepToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:](self, "_addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addAddSuffixesColumnMigrationToMigrator:](self, "_addAddSuffixesColumnMigrationToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addGracePredicateColumnsMigrationToMigrator:](self, "_addGracePredicateColumnsMigrationToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addGraceExpressionColumnsMigrationToMigrator:](self, "_addGraceExpressionColumnsMigrationToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:](self, "_addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addMisnamedTemplateRemovalToMigrator:](self, "_addMisnamedTemplateRemovalToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addEarnedInstancesExternalIdentifierMigrationToMigrator:](self, "_addEarnedInstancesExternalIdentifierMigrationToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addNullTemplatesRemovalToMigrator:](self, "_addNullTemplatesRemovalToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _updateGoalFor31DaysSeptemberMonthlyChallenge:](self, "_updateGoalFor31DaysSeptemberMonthlyChallenge:", v7);
    -[ACHDatabaseSchemaProvider _addTemplateRowIdBumpToMigrator:](self, "_addTemplateRowIdBumpToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _removeErroneousFitnessPlusTemplates:](self, "_removeErroneousFitnessPlusTemplates:", v7);
    -[ACHDatabaseSchemaProvider _removeErroneousWorkoutTemplates:](self, "_removeErroneousWorkoutTemplates:", v7);
    -[ACHDatabaseSchemaProvider _addSyncIdentityColumnToEarnedInstanceEntityToMigrator:](self, "_addSyncIdentityColumnToEarnedInstanceEntityToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addSyncIdentityColumnToTemplateEntityToMigrator:](self, "_addSyncIdentityColumnToTemplateEntityToMigrator:", v7);
    -[ACHDatabaseSchemaProvider _addPrereqisiteTemplateNameFieldToTemplates:](self, "_addPrereqisiteTemplateNameFieldToTemplates:", v7);
    -[ACHDatabaseSchemaProvider _removeMoveGoalMultiplierEarnedInstances:](self, "_removeMoveGoalMultiplierEarnedInstances:", v7);
    -[ACHDatabaseSchemaProvider _removePerfectMonthEarnedInstances:](self, "_removePerfectMonthEarnedInstances:", v7);
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v7 = v6;
    -[ACHDatabaseSchemaProvider _addResetSyncAnchorsMigrationStepToMigrator:](self, "_addResetSyncAnchorsMigrationStepToMigrator:", v6);
    -[ACHDatabaseSchemaProvider _addSyncAnchorSaveOffMigrationStepToMigrator:](self, "_addSyncAnchorSaveOffMigrationStepToMigrator:", v7);
LABEL_5:
    v6 = v7;
  }

}

- (void)_addResetSyncAnchorsMigrationStepToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 2, 0, &__block_literal_global_6);
}

uint64_t __73__ACHDatabaseSchemaProvider__addResetSyncAnchorsMigrationStepToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15[0] = a4;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements reset sync anchors migration from %ld", (uint8_t *)&v14, 0xCu);
  }

  v16[0] = CFSTR("DELETE FROM sync_anchors WHERE schema = 'ACHAchievementsPlugin'");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14 = 67109378;
    LODWORD(v15[0]) = v10;
    WORD2(v15[0]) = 2112;
    *(_QWORD *)((char *)v15 + 6) = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements reset sync anchors migration success: %{BOOL}d, error: %@", (uint8_t *)&v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addSyncAnchorSaveOffMigrationStepToMigrator:(id)a3
{
  objc_msgSend(a3, "addLockstepMigrationForSchema:toVersion:requiringVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 3, 13002, 0, &__block_literal_global_190);
}

uint64_t __74__ACHDatabaseSchemaProvider__addSyncAnchorSaveOffMigrationStepToMigrator___block_invoke()
{
  return 0;
}

- (void)_addAddAvailableCountryCodesColumnMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 4, 0, &__block_literal_global_191);
}

uint64_t __83__ACHDatabaseSchemaProvider__addAddAvailableCountryCodesColumnMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  _QWORD v16[2];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  ACHLogDatabase();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16[0] = a4;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements country codes migration from %ld", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v7, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("DROP TABLE IF EXISTS ACHAchievementsPlugin_templates");
  v17[1] = CFSTR("DROP TABLE IF EXISTS ACHAchievementsPlugin_earned_instances");
  v17[2] = CFSTR("CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         unique_name TEXT UNIQUE NOT NULL,         version INTEGER,         minimum_engine_version INTEGER,         created_date REAL,         creator_device INTEGER,         source_name TEXT,         predicate TEXT,         value_expression TEXT,         progress_expression TEXT,         goal_expression TEXT,         triggers INTEGER,         earn_limit INTEGER,         visibility_predicate TEXT,         visibility_start_date TEXT,         visibility_end_date TEXT,         availability_predicate TEXT,         availability_start_date TEXT,         availability_end_date TEXT,         available_country_codes TEXT,         alertability_predicate TEXT,         alert_dates TEXT,         duplicateremoval_strategy INTEGER,         duplicateremoval_calendar_unit INTEGER,         earn_date INTEGER,         display_order INTEGER,         displays_earned_instance_count INTEGER,         canonical_unit TEXT,         sync_provenance INTEGER)");
  v17[3] = CFSTR("CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_earned_instances         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         template_unique_name TEXT,         created_date REAL,         earned_date TEXT,         value_in_canonical_unit REAL,         value_canonical_unit TEXT,         creator_device INTEGER,         sync_provenance INTEGER)");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "executeSQLStatements:error:", v10, a5);

  ACHLogDatabase();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *a5;
    v15 = 67109378;
    LODWORD(v16[0]) = v11;
    WORD2(v16[0]) = 2112;
    *(_QWORD *)((char *)v16 + 6) = v13;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Activity Achievements country codes migration success: %{BOOL}d, error: %@", (uint8_t *)&v15, 0x12u);
  }

  return v11 ^ 1u;
}

- (void)_addVersion5MigratorToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 5, 0, &__block_literal_global_200);
}

uint64_t __60__ACHDatabaseSchemaProvider__addVersion5MigratorToMigrator___block_invoke()
{
  return 0;
}

- (void)_addValidateEarnedInstanceRowStepToMigrator:(id)a3
{
  objc_msgSend(a3, "addLockstepMigrationForSchema:toVersion:requiringVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 6, 15506, 0, &__block_literal_global_201);
}

uint64_t __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t v26[4];
  _QWORD v27[3];
  __int128 buf;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  objc_msgSend(v9, "unprotectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a4;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements backup sync anchors migration from %ld (unprotected query)", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v10, "executeUncachedSQL:error:", CFSTR("create table if not exists ACHAchievementsPlugin_sync_anchors_backup as select next from sync_anchors WHERE schema = 'ACHAchievementsPlugin' and type = 2"), a5))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v30 = -1;
    ACHLogDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 134217984;
      v27[0] = a4;
      _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements validate earned instance max rowID migration from %ld (unprotected query)", v26, 0xCu);
    }

    v13 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_206;
    v25[3] = &unk_24D13B008;
    v25[4] = &buf;
    v14 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("select max(next) from ACHAchievementsPlugin_sync_anchors_backup"), a5, 0, v25);
    ACHLogDatabase();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *a5;
      *(_DWORD *)v26 = 67109378;
      LODWORD(v27[0]) = v14;
      WORD2(v27[0]) = 2112;
      *(_QWORD *)((char *)v27 + 6) = v16;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration success (unprotected query): %{BOOL}d, error: %@", v26, 0x12u);
    }

    if (v14)
    {
      if ((*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) & 0x8000000000000000) != 0)
      {
        ACHLogDatabase();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration early success (sync table is empty)", v26, 2u);
        }
        v22 = 0;
      }
      else
      {
        objc_msgSend(v9, "protectedDatabase");
        v17 = objc_claimAutoreleasedReturnValue();
        ACHLogDatabase();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 134217984;
          v27[0] = a4;
          _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements validate earned instance max rowID migration from %ld", v26, 0xCu);
        }

        v24[0] = v13;
        v24[1] = 3221225472;
        v24[2] = __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_210;
        v24[3] = &unk_24D13B030;
        v24[4] = &buf;
        v19 = -[NSObject executeUncachedSQL:error:bindingHandler:enumerationHandler:](v17, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE ACHAchievementsPlugin_earned_instances SET rowid = ifnull(max(rowid, ?), rowid) WHERE rowid=(SELECT max(rowid) FROM ACHAchievementsPlugin_earned_instances)"), a5, v24, 0);
        ACHLogDatabase();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *a5;
          *(_DWORD *)v26 = 67109378;
          LODWORD(v27[0]) = v19;
          WORD2(v27[0]) = 2112;
          *(_QWORD *)((char *)v27 + 6) = v21;
          _os_log_impl(&dword_21407B000, v20, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration success: %{BOOL}d, error: %@", v26, 0x12u);
        }

        v22 = v19 ^ 1u;
      }

    }
    else
    {
      v22 = 1;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

uint64_t __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_206(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_210(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

- (void)_addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 7, 0, &__block_literal_global_213);
}

uint64_t __81__ACHDatabaseSchemaProvider__addDropSyncAnchorSaveOffTableIfNecessaryToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15[0] = a4;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements drop sync anchor backup migration from %ld", (uint8_t *)&v14, 0xCu);
  }

  v16[0] = CFSTR("drop table if exists ACHAchievementsPlugin_sync_anchors_backup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14 = 67109378;
    LODWORD(v15[0]) = v10;
    WORD2(v15[0]) = 2112;
    *(_QWORD *)((char *)v15 + 6) = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements drop sync anchor backup migration success: %{BOOL}d, error: %@", (uint8_t *)&v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addAddSuffixesColumnMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 8, 0, &__block_literal_global_216);
}

uint64_t __70__ACHDatabaseSchemaProvider__addAddSuffixesColumnMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  ACHLogDatabase();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16[0] = a4;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements available suffixes migration from %ld", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v7, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD available_suffixes TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "executeSQLStatements:error:", v10, a5);

  ACHLogDatabase();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *a5;
    v15 = 67109378;
    LODWORD(v16[0]) = v11;
    WORD2(v16[0]) = 2112;
    *(_QWORD *)((char *)v16 + 6) = v13;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Activity Achievements available suffixes migration success: %{BOOL}d, error: %@", (uint8_t *)&v15, 0x12u);
  }

  return v11 ^ 1u;
}

- (void)_addGracePredicateColumnsMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 9, 0, &__block_literal_global_219);
}

uint64_t __74__ACHDatabaseSchemaProvider__addGracePredicateColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add grace predicate columns", (uint8_t *)v14, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD grace_predicate TEXT");
  v17[1] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD grace_visibility_predicate TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements grace predicate columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addGraceExpressionColumnsMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 10, 0, &__block_literal_global_224);
}

uint64_t __75__ACHDatabaseSchemaProvider__addGraceExpressionColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add grace expression columns", (uint8_t *)v14, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD grace_value_expression TEXT");
  v17[1] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD grace_progress_expression TEXT");
  v17[2] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD grace_goal_expression TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements grace expression columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 11, 0, &__block_literal_global_231);
}

uint64_t __88__ACHDatabaseSchemaProvider__addDailyTargetExpressionAndUnitColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add daily target and daily target unit columns", (uint8_t *)v14, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD daily_target REAL");
  v17[1] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD daily_target_canonical_unit TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements daily target and daily target unit columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addMisnamedTemplateRemovalToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 12, 0, &__block_literal_global_240);
}

uint64_t __67__ACHDatabaseSchemaProvider__addMisnamedTemplateRemovalToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint8_t buf[8];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Removing misnamed templates", buf, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_templates where unique_name = '%@%@%@'"), CFSTR("Best"), CFSTR("Mile"), CFSTR("Duration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = '%@%@%@'"), CFSTR("Best"), CFSTR("Mile"), CFSTR("Duration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_templates where unique_name = '%@%@%@'"), CFSTR("Best"), CFSTR("Kilometer"), CFSTR("Duration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = '%@%@%@'"), CFSTR("Best"), CFSTR("Kilometer"), CFSTR("Duration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "executeSQLStatements:error:", v13, a5);

  ACHLogDatabase();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Removed misnamed templates", buf, 2u);
  }

  return v14 ^ 1u;
}

- (void)_addEarnedInstancesExternalIdentifierMigrationToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 13, 0, &__block_literal_global_250);
}

uint64_t __86__ACHDatabaseSchemaProvider__addEarnedInstancesExternalIdentifierMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint8_t buf[16];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Adding external identifier Column to earned_instances table and removing affected templates and earned instances", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_templates where unique_name in (%@)"), CFSTR("'FiftyKilometersCyclingWorkout', 'FiftyMilesCyclingWorkout', 'OneHundredKilometersCyclingWorkout', 'OneHundredMilesCyclingWorkout', 'HalfMarathonWorkout', 'WheelchairHalfMarathonWorkout', 'MarathonWorkout', 'WheelchairMarathonWorkout', 'DuathlonWorkout', 'SprintTriathlonWorkout', 'FiftyKilometerTriathlonWorkout', 'HalfDistanceTriathlonWorkout', 'FullDistanceTriathlonWorkout', 'FiveKilometerWorkout', 'FiveKilometerWheelchairWorkout', 'TenKilometerWorkout', 'TenKilometerWheelchairWorkout'"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name in (%@)"), CFSTR("'FiftyKilometersCyclingWorkout', 'FiftyMilesCyclingWorkout', 'OneHundredKilometersCyclingWorkout', 'OneHundredMilesCyclingWorkout', 'HalfMarathonWorkout', 'WheelchairHalfMarathonWorkout', 'MarathonWorkout', 'WheelchairMarathonWorkout', 'DuathlonWorkout', 'SprintTriathlonWorkout', 'FiftyKilometerTriathlonWorkout', 'HalfDistanceTriathlonWorkout', 'FullDistanceTriathlonWorkout', 'FiveKilometerWorkout', 'FiveKilometerWheelchairWorkout', 'TenKilometerWorkout', 'TenKilometerWheelchairWorkout'"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = v9;
  v14[2] = CFSTR("ALTER TABLE ACHAchievementsPlugin_earned_instances ADD external_identifier TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "executeSQLStatements:error:", v10, a5);

  return v11 ^ 1u;
}

- (void)_addNullTemplatesRemovalToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 14, 0, &__block_literal_global_259);
}

uint64_t __64__ACHDatabaseSchemaProvider__addNullTemplatesRemovalToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Removing First/BestWorkout-(null) templates", v13, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("DELETE FROM ACHAchievementsPlugin_templates where unique_name = 'FirstWorkout-(null)'");
  v14[1] = CFSTR("DELETE FROM ACHAchievementsPlugin_templates where unique_name = 'BestWorkout-(null)'");
  v14[2] = CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = 'FirstWorkout-(null)'");
  v14[3] = CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = 'BestWorkout-(null)'");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Removed First/BestWorkout-(null) templates", v13, 2u);
  }

  return v10 ^ 1u;
}

- (void)_updateGoalFor31DaysSeptemberMonthlyChallenge:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 15, 0, &__block_literal_global_268);
}

uint64_t __75__ACHDatabaseSchemaProvider__updateGoalFor31DaysSeptemberMonthlyChallenge___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHLogDatabase();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Updating goal for 31 days September MonthlyChallenge", (uint8_t *)v14, 2u);
  }

  objc_msgSend(v6, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("UPDATE ACHAchievementsPlugin_templates SET goal_expression = '27', predicate = 'numberOfDaysClosingAllThreeRingsInCurrentMonth >= 27' where unique_name = 'MonthlyChallengeTypeAllThreeRings_2022_09' and goal_expression = '31'");
  v17[1] = CFSTR("UPDATE ACHAchievementsPlugin_templates SET goal_expression = '27', predicate = 'numberOfDaysClosingMoveRingInCurrentMonth >= 27' where unique_name = 'MonthlyChallengeTypeMoveRing_2022_09' and goal_expression = '31'");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "executeSQLStatements:error:", v9, a5);

  ACHLogDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Updated goal for 31 days September MonthlyChallenge with success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addTemplateRowIdBumpToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 16, 0, &__block_literal_global_273);
}

uint64_t __61__ACHDatabaseSchemaProvider__addTemplateRowIdBumpToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint8_t v16[8];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Skipping template row id update migration on watch", v16, 2u);
    }
    v11 = 0;
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Updating template row ids", v16, 2u);
    }

    objc_msgSend(v6, "protectedDatabase");
    v9 = objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates_backup AS SELECT rowid, unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit FROM ACHAchievementsPlugin_templates");
    v17[1] = CFSTR("DELETE FROM ACHAchievementsPlugin_templates");
    v17[2] = CFSTR("INSERT INTO ACHAchievementsPlugin_templates (unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit) SELECT unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit FROM ACHAchievementsPlugin_templates_backup");
    v17[3] = CFSTR("DROP TABLE IF EXISTS ACHAchievementsPlugin_templates_backup");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject executeSQLStatements:error:](v9, "executeSQLStatements:error:", v12, a5);

    ACHLogDatabase();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "Updated template row ids", v16, 2u);
    }

    v11 = v13 ^ 1u;
  }

  return v11;
}

- (void)_removeErroneousFitnessPlusTemplates:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 17, 0, &__block_literal_global_283);
}

uint64_t __66__ACHDatabaseSchemaProvider__removeErroneousFitnessPlusTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[6];
  uint8_t buf[4];
  _BYTE v54[18];
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "protectedDatabase");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = objc_msgSend(&unk_24D15B8E8, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v38)
  {
    v34 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(&unk_24D15B8E8);
        v7 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'FirstFitnessPlusWorkoutAward-%@'"), v7);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'BestFitnessPlusWorkoutAward-%@'"), v7);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:");
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v8 = objc_msgSend(&unk_24D15B8D0, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v45 != v10)
                objc_enumerationMutation(&unk_24D15B8D0);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'FitnessPlusModalityLifetimeWorkoutAward-%@-%lu'"), v7, objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "unsignedIntegerValue"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v12);

            }
            v9 = objc_msgSend(&unk_24D15B8D0, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          }
          while (v9);
        }

      }
      v38 = objc_msgSend(&unk_24D15B8E8, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v38);
  }
  objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v54 = v13;
    *(_WORD *)&v54[8] = 2112;
    *(_QWORD *)&v54[10] = v14;
    v55 = 2112;
    v56 = v15;
    _os_log_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEFAULT, "Removing erroneous FitnessPlus templates/earned instances where templates not in: %@, %@, %@", buf, 0x20u);
  }

  v39 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'FirstFitnessPlusWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)"), CFSTR("%"), v13);
  v17 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v14;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'BestFitnessPlusWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)"), CFSTR("%"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'FitnessPlusModalityLifetimeWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)"), CFSTR("%"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)"), v17);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)"), v18);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)"), v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)"), v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)"), v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Removing erroneous FitnessPlus templates/earned instances", buf, 2u);
  }

  v30 = (void *)v20;
  v52[0] = v20;
  v52[1] = v43;
  v52[2] = v41;
  v52[3] = v21;
  v52[4] = v22;
  v52[5] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v33, "executeSQLStatements:error:", v25, a5);

  ACHLogDatabase();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *a5;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v54 = v26;
    *(_WORD *)&v54[4] = 2112;
    *(_QWORD *)&v54[6] = v28;
    _os_log_impl(&dword_21407B000, v27, OS_LOG_TYPE_DEFAULT, "Removed erroneous FitnessPlus templates/earned instances: %{BOOL}d, error: %@", buf, 0x12u);
  }

  return v26 ^ 1u;
}

- (void)_removeErroneousWorkoutTemplates:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 18, 0, &__block_literal_global_349);
}

uint64_t __62__ACHDatabaseSchemaProvider__removeErroneousWorkoutTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  void *v32;
  id v34;
  id obj;
  id obja;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)*MEMORY[0x24BE01338];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v9, "unsignedIntegerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("'FirstWorkout-%@'"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v9, "unsignedIntegerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("'BestWorkout-%@'"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "addObject:", v12);
        objc_msgSend(v37, "addObject:", v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v6);
  }

  objc_msgSend(v38, "componentsJoinedByString:", CFSTR(","));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
  v17 = objc_claimAutoreleasedReturnValue();
  obja = (id)v16;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT unique_name FROM ACHAchievementsPlugin_templates where unique_name LIKE 'FirstWorkout-%%' AND source_name='BuiltIn' AND unique_name NOT IN (%@)"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT unique_name FROM ACHAchievementsPlugin_templates where unique_name LIKE 'BestWorkout-%%' AND source_name='BuiltIn' AND unique_name NOT IN (%@)"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)"), v19);
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)"), v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)"), v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogDatabase();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Removing erroneous Workout templates/earned instances", buf, 2u);
  }

  objc_msgSend(v34, "protectedDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v20;
  v47[1] = v21;
  v26 = (void *)v21;
  v47[2] = v22;
  v47[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "executeSQLStatements:error:", v27, a5);

  ACHLogDatabase();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *a5;
    *(_DWORD *)buf = 67109378;
    v44 = v28;
    v45 = 2112;
    v46 = v30;
    _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "Removed erroneous Workout templates/earned instances: %{BOOL}d, error: %@", buf, 0x12u);
  }

  return v28 ^ 1u;
}

- (void)_addSyncIdentityColumnToEarnedInstanceEntityToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 19, 0, &__block_literal_global_361);
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Adding sync identity column to earned instance entity", buf, 2u);
  }

  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "executeUncachedSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_earned_instances_new         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         template_unique_name TEXT,         created_date REAL,         earned_date TEXT,         value_in_canonical_unit REAL,         value_canonical_unit TEXT,         external_identifier TEXT,         creator_device INTEGER,         sync_provenance INTEGER,         sync_identity INTEGER NOT NULL);"),
                       a5))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
      *MEMORY[0x24BE40E08],
      *MEMORY[0x24BE40E08]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2020000000;
    v24 = 0;
    objc_msgSend(v8, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_366;
    v20[3] = &unk_24D13B008;
    v20[4] = buf;
    v14 = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v11, a5, 0, v20);

    if ((v14 & 1) != 0
      && (v19[0] = v13,
          v19[1] = 3221225472,
          v19[2] = __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_2,
          v19[3] = &unk_24D13B030,
          v19[4] = buf,
          (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO ACHAchievementsPlugin_earned_instances_new(       ROWID,         template_unique_name,         created_date,         earned_date,         value_in_canonical_unit,         value_canonical_unit,         external_identifier,         creator_device,         sync_provenance,         sync_identity)         SELECT ROWID, template_unique_name, created_date, earned_date, value_in_canonical_unit, value_canonical_unit, external_identifier, creator_device, sync_provenance, ? FROM ACHAchievementsPlugin_earned_instances;"),
             a5,
             v19,
             0) & 1) != 0))
    {
      v25[0] = CFSTR("DROP TABLE ACHAchievementsPlugin_earned_instances;");
      v25[1] = CFSTR("ALTER TABLE ACHAchievementsPlugin_earned_instances_new RENAME TO ACHAchievementsPlugin_earned_instances;");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "executeSQLStatements:error:", v15, a5);

      v17 = v16 ^ 1u;
    }
    else
    {
      v17 = 1;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_366(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)_addSyncIdentityColumnToTemplateEntityToMigrator:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 20, 0, &__block_literal_global_373);
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Adding sync identity column to template entity", buf, 2u);
  }

  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "executeUncachedSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates_new         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         unique_name TEXT UNIQUE NOT NULL,         version INTEGER,         minimum_engine_version INTEGER,         created_date REAL,         creator_device INTEGER,         source_name TEXT,         predicate TEXT,         value_expression TEXT,         progress_expression TEXT,         goal_expression TEXT,         triggers INTEGER,         earn_limit INTEGER,         visibility_predicate TEXT,         visibility_start_date TEXT,         visibility_end_date TEXT,         availability_predicate TEXT,         availability_start_date TEXT,         availability_end_date TEXT,         available_country_codes TEXT,         alertability_predicate TEXT,         alert_dates TEXT,         duplicateremoval_strategy INTEGER,         duplicateremoval_calendar_unit INTEGER,         earn_date INTEGER,         display_order INTEGER,         displays_earned_instance_count INTEGER,         canonical_unit TEXT,         sync_provenance INTEGER,         available_suffixes INTEGER,         grace_predicate INTEGER,         grace_visibility_predicate INTEGER,         grace_value_expression INTEGER,         grace_progress_expression INTEGER,         grace_goal_expression INTEGER,         daily_target INTEGER,         daily_target_canonical_unit INTEGER,         sync_identity INTEGER NOT NULL);"),
                       a5))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
      *MEMORY[0x24BE40E08],
      *MEMORY[0x24BE40E08]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2020000000;
    v24 = 0;
    objc_msgSend(v8, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_376;
    v20[3] = &unk_24D13B008;
    v20[4] = buf;
    v14 = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v11, a5, 0, v20);

    if ((v14 & 1) != 0
      && (v19[0] = v13,
          v19[1] = 3221225472,
          v19[2] = __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_2,
          v19[3] = &unk_24D13B030,
          v19[4] = buf,
          (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO ACHAchievementsPlugin_templates_new(       ROWID,         unique_name,         version,         minimum_engine_version,         created_date,         creator_device,         source_name,         predicate,         value_expression,         progress_expression,         goal_expression,         triggers,         earn_limit,         visibility_predicate,         visibility_start_date,         visibility_end_date,         availability_predicate,         availability_start_date,         availability_end_date,         available_country_codes,         alertability_predicate,         alert_dates,         duplicateremoval_strategy,         duplicateremoval_calendar_unit,         earn_date,         display_order,         displays_earned_instance_count,         canonical_unit,         sync_provenance,         available_suffixes,         grace_predicate,         grace_visibility_predicate,         grace_value_expression,         grace_progress_expression,         grace_goal_expression,         daily_target,         daily_target_canonical_unit,         sync_identity)         SELECT ROWID, unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, value_expression, progress_expression, goal_expression, triggers, earn_limit, visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, grace_predicate, grace_visibility_predicate, grace_value_expression, grace_progress_expression, grace_goal_expression, daily_target, daily_target_canonical_unit, ? FROM ACHAchievementsPlugin_templates;"),
             a5,
             v19,
             0) & 1) != 0))
    {
      v25[0] = CFSTR("DROP TABLE ACHAchievementsPlugin_templates;");
      v25[1] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates_new RENAME TO ACHAchievementsPlugin_templates;");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "executeSQLStatements:error:", v15, a5);

      v17 = v16 ^ 1u;
    }
    else
    {
      v17 = 1;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_376(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)_addPrereqisiteTemplateNameFieldToTemplates:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 21, 0, &__block_literal_global_383);
}

uint64_t __73__ACHDatabaseSchemaProvider__addPrereqisiteTemplateNameFieldToTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("ALTER TABLE ACHAchievementsPlugin_templates ADD prerequisite_template_name TEXT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "executeSQLStatements:error:", v7, a5);

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Added prerequisite_template_name to ACHTemplates: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

- (void)_removeMoveGoalMultiplierEarnedInstances:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 22, 0, &__block_literal_global_386);
}

uint64_t __70__ACHDatabaseSchemaProvider__removeMoveGoalMultiplierEarnedInstances___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name IN ('MoveGoal200Percent', 'MoveGoal300Percent', 'MoveGoal400Percent')");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "executeSQLStatements:error:", v7, a5);

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Removed existing 200%%, 300%%, 400%% earned instances: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

- (void)_removePerfectMonthEarnedInstances:(id)a3
{
  objc_msgSend(a3, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", *MEMORY[0x24BE01218], 23, 0, &__block_literal_global_389);
}

uint64_t __64__ACHDatabaseSchemaProvider__removePerfectMonthEarnedInstances___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name LIKE 'PerfectMonth_%'");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "executeSQLStatements:error:", v7, a5);

  ACHLogDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Removed existing Perfect Months earned instances: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

@end
