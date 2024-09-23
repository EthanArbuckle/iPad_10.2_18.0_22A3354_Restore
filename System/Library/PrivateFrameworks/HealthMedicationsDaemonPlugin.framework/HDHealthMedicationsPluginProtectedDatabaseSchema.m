@implementation HDHealthMedicationsPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D2C4F0], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "medicationsFutureMigrationsEnabled");

  if (v3)
    return 100000;
  else
    return 18002;
}

- (NSArray)databaseEntities
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerMigrationStepsWithMigrator:(id)a3 schemaName:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke;
  v18[3] = &unk_1E6E014D8;
  v18[4] = self;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 16001, 0, v18);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_2;
  v17[3] = &unk_1E6E014D8;
  v17[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 16002, 0, v17);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_3;
  v16[3] = &unk_1E6E014D8;
  v16[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 16003, 0, v16);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_4;
  v15[3] = &unk_1E6E014D8;
  v15[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 16004, 1, v15);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_5;
  v14[3] = &unk_1E6E014D8;
  v14[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 16400, 1, v14);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_6;
  v13[3] = &unk_1E6E014D8;
  v13[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 17009, 0, v13);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_7;
  v12[3] = &unk_1E6E014D8;
  v12[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 17011, 1, v12);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_8;
  v11[3] = &unk_1E6E014D8;
  v11[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 18000, 1, v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_9;
  v10[3] = &unk_1E6E014D8;
  v10[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 18001, 1, v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_10;
  v9[3] = &unk_1E6E014D8;
  v9[4] = self;
  objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", v7, 18002, 0, v9);

}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_dropMedicationIngredientsTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_dropAndReAddMedicationScheduleTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_createMedicationDismissedInteractionsTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addCompatibilityVersionColumnsWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveLifestyleFactorsFromUserDefaultsToKeyValueDomain:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addUniqueConstraintToScheduleMedicationIdentifier:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addScheduleTypeToMedicationScheduleTable:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addDisplayOptionsToMedicationScheduleTable:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createMedicationDismissedPregnancyLactationInteractionsTableWithTransaction:error:", a3, a5);
}

- (id)_getLegacySyncIdentityWithTransaction:(id)a3 errorOut:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
    *MEMORY[0x1E0D297B0],
    *MEMORY[0x1E0D297B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v5, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__HDHealthMedicationsPluginProtectedDatabaseSchema__getLegacySyncIdentityWithTransaction_errorOut___block_invoke;
  v10[3] = &unk_1E6E01460;
  v10[4] = &v11;
  LODWORD(a4) = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a4, 0, v10);

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __99__HDHealthMedicationsPluginProtectedDatabaseSchema__getLegacySyncIdentityWithTransaction_errorOut___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (int64_t)_sydney_dropMedicationIngredientsTableWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E11610, a4) ^ 1;

  return v6;
}

- (int64_t)_sydney_dropAndReAddMedicationScheduleTableWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E11628, a4) ^ 1;

  return v6;
}

- (int64_t)_sydney_createMedicationDismissedInteractionsTableWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E11640, a4) ^ 1;

  return v6;
}

- (int64_t)_sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, sqlite3_stmt *);
  void *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "executeUncachedSQL:error:", CFSTR("CREATE TABLE medication_schedules_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, medication_uuid BLOB NOT NULL, medication_identifier TEXT NOT NULL, start_date_time REAL NOT NULL, end_date_time REAL, created_time_zone TEXT NOT NULL, frequency_type INTEGER NOT NULL, cycle_start_date_components BLOB, note TEXT, creation_date REAL NOT NULL, deleted INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, sync_identity INTEGER NOT NULL)"), a4))
  {
    -[HDHealthMedicationsPluginProtectedDatabaseSchema _getLegacySyncIdentityWithTransaction:errorOut:](self, "_getLegacySyncIdentityWithTransaction:errorOut:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity) SELECT ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, ? FROM medication_schedules;"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __123__HDHealthMedicationsPluginProtectedDatabaseSchema__sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction_error___block_invoke;
      v16 = &unk_1E6E00DB8;
      v17 = v8;
      if (objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a4, &v13, 0))
      {
        v18[0] = CFSTR("DROP TABLE medication_schedules;");
        v18[1] = CFSTR("ALTER TABLE medication_schedules_new RENAME TO medication_schedules;");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2, v13, v14, v15, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "executeSQLStatements:error:", v10, a4) ^ 1;

      }
      else
      {
        v11 = 1;
      }

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __123__HDHealthMedicationsPluginProtectedDatabaseSchema__sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue"));
}

- (int64_t)_addCompatibilityVersionColumnsWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E11658, a4) ^ 1;

  return v6;
}

- (int64_t)_moveLifestyleFactorsFromUserDefaultsToKeyValueDomain:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  int64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[HDHealthMedicationsPluginProtectedDatabaseSchema _getLegacySyncIdentityWithTransaction:errorOut:](self, "_getLegacySyncIdentityWithTransaction:errorOut:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0D2C388]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = objc_msgSend(&unk_1E6E11670, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(&unk_1E6E11670);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v8, "hk_keyExists:", v13))
          {
            v14 = objc_msgSend(v8, "BOOLForKey:", v13);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO key_value_secure (category, domain, key, value, provenance, sync_identity, mod_date) values (?, ?, ?, ?, ?, ?, ?)"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "protectedDatabase");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __112__HDHealthMedicationsPluginProtectedDatabaseSchema__moveLifestyleFactorsFromUserDefaultsToKeyValueDomain_error___block_invoke;
            v29[3] = &unk_1E6E01500;
            v29[4] = v13;
            v31 = v14;
            v30 = v6;
            v17 = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a4, v29, 0);

            if (!v17)
            {
              v22 = 1;
              goto LABEL_21;
            }
          }
        }
        v10 = objc_msgSend(&unk_1E6E11670, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v10)
          continue;
        break;
      }
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = objc_msgSend(&unk_1E6E11670, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(&unk_1E6E11670);
          objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v19 = objc_msgSend(&unk_1E6E11670, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      }
      while (v19);
    }
    v22 = 0;
LABEL_21:

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

uint64_t __112__HDHealthMedicationsPluginProtectedDatabaseSchema__moveLifestyleFactorsFromUserDefaultsToKeyValueDomain_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  sqlite3_bind_int64(a2, 1, 105);
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int(a2, 4, *(unsigned __int8 *)(a1 + 48));
  sqlite3_bind_int(a2, 5, 0);
  sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 40), "unsignedLongValue"));
  Current = CFAbsoluteTimeGetCurrent();
  return sqlite3_bind_double(a2, 7, Current);
}

- (int64_t)_addUniqueConstraintToScheduleMedicationIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int64_t v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _HDGetMaximumSyncAnchor(v5, 1, (uint64_t)a4);
  v7 = _HDGetMaximumSyncAnchor(v5, 2, (uint64_t)a4);
  if (v6 == -1 || v7 == -1)
  {

LABEL_20:
    v20 = 1;
    goto LABEL_21;
  }
  if (v6 <= v7)
    v9 = v7;
  else
    v9 = v6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v5, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = ___HDCalculateMedicationScheduleSyncAnchorOffset_block_invoke;
  v22[3] = &unk_1E6E01460;
  v22[4] = &v23;
  v11 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MIN(ROWID) from medication_schedules"), a4, 0, v22);

  if ((v11 & 1) != 0)
  {
    v12 = v24[3];
    if (v12)
      v13 = v9 - v12 + 1;
    else
      v13 = 0;
    if (v12 <= v9)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = -1;
  }
  _Block_object_dispose(&v23, 8);

  if (v14 < 0)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, sync_anchor)     SELECT ROWID,     uuid,     medication_uuid,     medication_identifier,     start_date_time,     end_date_time,     created_time_zone,     frequency_type,     cycle_start_date_components,     note,     max(creation_date),     deleted,     sync_provenance,     sync_identity,     minimum_compatibility_version,     origin_compatibility_version,     (ROWID + %lld)     FROM medication_schedules     WHERE deleted = 0     GROUP BY medication_identifier"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, sync_anchor)     SELECT ROWID,     uuid,     medication_uuid,     null,     start_date_time,     end_date_time,     created_time_zone,     frequency_type,     cycle_start_date_components,     note,     creation_date,     deleted,     sync_provenance,     sync_identity,     minimum_compatibility_version,     origin_compatibility_version,     (ROWID + %lld)     FROM medication_schedules     WHERE deleted = 1"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("CREATE TABLE medication_schedules_new     (     ROWID                         INTEGER PRIMARY KEY AUTOINCREMENT,      uuid                          BLOB UNIQUE    NOT NULL,      medication_uuid               BLOB           NOT NULL,      medication_identifier         TEXT UNIQUE,      start_date_time               REAL           NOT NULL,      end_date_time                 REAL,      created_time_zone             TEXT           NOT NULL,      frequency_type                INTEGER        NOT NULL,      cycle_start_date_components   BLOB,      note                          TEXT,      creation_date                 REAL           NOT NULL,      deleted                       INTEGER        NOT NULL,      sync_provenance               INTEGER        NOT NULL,      sync_identity                 INTEGER        NOT NULL,      minimum_compatibility_version INTEGER        NOT NULL,      origin_compatibility_version  INTEGER        NOT NULL,      sync_anchor                   INTEGER UNIQUE NOT NULL     )");
  v27[1] = v15;
  v27[2] = v16;
  v27[3] = CFSTR("DELETE                      FROM medication_schedule_interval_data                      WHERE NOT EXISTS(SELECT *                      FROM medication_schedules_new                      WHERE medication_schedule_interval_data.schedule_id = medication_schedules_new.ROWID)");
  v27[4] = CFSTR("DROP TABLE medication_schedules");
  v27[5] = CFSTR("ALTER TABLE medication_schedules_new RENAME TO medication_schedules");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "executeSQLStatements:error:", v18, a4);

  v20 = v19 ^ 1u;
LABEL_21:

  return v20;
}

- (int64_t)_addScheduleTypeToMedicationScheduleTable:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E11688, a4) ^ 1;

  return v6;
}

- (int64_t)_addDisplayOptionsToMedicationScheduleTable:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E116A0, a4) ^ 1;

  return v6;
}

- (int64_t)_createMedicationDismissedPregnancyLactationInteractionsTableWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E6E116B8, a4) ^ 1;

  return v6;
}

@end
