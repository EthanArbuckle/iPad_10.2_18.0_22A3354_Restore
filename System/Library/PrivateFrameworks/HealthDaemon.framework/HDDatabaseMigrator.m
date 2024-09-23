@implementation HDDatabaseMigrator

- (id)whitetailUnprotectedMigrationSteps
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HDDatabaseMigrator_Whitetail__whitetailUnprotectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E6CEA670;
  v6[4] = self;
  HDCreateMigrationStep(9203, 10001, (uint64_t)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

void *__67__HDDatabaseMigrator_Whitetail__whitetailUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("INSERT INTO key_value (category, provenance, domain, key, value, mod_date) SELECT category, provenance, 'BASAL_ENERGY_INGESTION', key, value, mod_date FROM key_value WHERE domain = 'ACTIVE_ENERGY_INGESTION'"), a3) ^ 1);
  return result;
}

- (id)whitetailProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke;
  v69[3] = &unk_1E6CEA670;
  v69[4] = self;
  HDCreateMigrationStep(9210, 10002, (uint64_t)v69);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v68[0] = v4;
  v68[1] = 3221225472;
  v68[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_2;
  v68[3] = &unk_1E6CEA670;
  v68[4] = self;
  HDCreateMigrationStep(10002, 10003, (uint64_t)v68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v67[0] = v4;
  v67[1] = 3221225472;
  v67[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_3;
  v67[3] = &unk_1E6CEA670;
  v67[4] = self;
  HDCreateMigrationStep(10003, 10004, (uint64_t)v67);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v66[0] = v4;
  v66[1] = 3221225472;
  v66[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_4;
  v66[3] = &unk_1E6CEA670;
  v66[4] = self;
  HDCreateMigrationStep(10004, 10005, (uint64_t)v66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v65[0] = v4;
  v65[1] = 3221225472;
  v65[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_5;
  v65[3] = &unk_1E6CEA670;
  v65[4] = self;
  HDCreateMigrationStep(10005, 10006, (uint64_t)v65);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v64[0] = v4;
  v64[1] = 3221225472;
  v64[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_6;
  v64[3] = &unk_1E6CEA670;
  v64[4] = self;
  HDCreateMigrationStep(10006, 10007, (uint64_t)v64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v63[0] = v4;
  v63[1] = 3221225472;
  v63[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_7;
  v63[3] = &unk_1E6CEA670;
  v63[4] = self;
  HDCreateMigrationStep(10007, 10009, (uint64_t)v63);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v62[0] = v4;
  v62[1] = 3221225472;
  v62[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_8;
  v62[3] = &unk_1E6CEA670;
  v62[4] = self;
  HDCreateMigrationStep(10009, 10010, (uint64_t)v62);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v61[0] = v4;
  v61[1] = 3221225472;
  v61[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_9;
  v61[3] = &unk_1E6CEA670;
  v61[4] = self;
  HDCreateMigrationStep(10010, 10011, (uint64_t)v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v60[0] = v4;
  v60[1] = 3221225472;
  v60[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_10;
  v60[3] = &unk_1E6CEA670;
  v60[4] = self;
  HDCreateMigrationStep(10011, 10012, (uint64_t)v60);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v59[0] = v4;
  v59[1] = 3221225472;
  v59[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_11;
  v59[3] = &unk_1E6CEA670;
  v59[4] = self;
  HDCreateMigrationStep(10012, 10013, (uint64_t)v59);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v58[0] = v4;
  v58[1] = 3221225472;
  v58[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_12;
  v58[3] = &unk_1E6CEA670;
  v58[4] = self;
  HDCreateMigrationStep(10013, 10014, (uint64_t)v58);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v57[0] = v4;
  v57[1] = 3221225472;
  v57[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_13;
  v57[3] = &unk_1E6CEA670;
  v57[4] = self;
  HDCreateMigrationStep(10014, 10015, (uint64_t)v57);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v56[0] = v4;
  v56[1] = 3221225472;
  v56[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_14;
  v56[3] = &unk_1E6CEA670;
  v56[4] = self;
  HDCreateMigrationStep(10015, 10016, (uint64_t)v56);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_15;
  v55[3] = &unk_1E6CEA670;
  v55[4] = self;
  HDCreateMigrationStep(10016, 10017, (uint64_t)v55);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v54[0] = v4;
  v54[1] = 3221225472;
  v54[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_16;
  v54[3] = &unk_1E6CEA670;
  v54[4] = self;
  HDCreateMigrationStep(10017, 10018, (uint64_t)v54);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_17;
  v53[3] = &unk_1E6CEA670;
  v53[4] = self;
  HDCreateMigrationStep(10018, 10019, (uint64_t)v53);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v52[0] = v4;
  v52[1] = 3221225472;
  v52[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_18;
  v52[3] = &unk_1E6CEA670;
  v52[4] = self;
  HDCreateMigrationStep(10019, 10021, (uint64_t)v52);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v51[0] = v4;
  v51[1] = 3221225472;
  v51[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_19;
  v51[3] = &unk_1E6CEA670;
  v51[4] = self;
  HDCreateMigrationStep(10021, 10022, (uint64_t)v51);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v50[0] = v4;
  v50[1] = 3221225472;
  v50[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_20;
  v50[3] = &unk_1E6CEA670;
  v50[4] = self;
  HDCreateMigrationStep(10022, 10023, (uint64_t)v50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_21;
  v49[3] = &unk_1E6CEA670;
  v49[4] = self;
  HDCreateMigrationStep(10023, 10025, (uint64_t)v49);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v48[0] = v4;
  v48[1] = 3221225472;
  v48[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_22;
  v48[3] = &unk_1E6CEA670;
  v48[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 10025, 10027, v48);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v47[0] = v4;
  v47[1] = 3221225472;
  v47[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_23;
  v47[3] = &unk_1E6CEA670;
  v47[4] = self;
  HDCreateMigrationStep(10027, 10028, (uint64_t)v47);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v46[0] = v4;
  v46[1] = 3221225472;
  v46[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_24;
  v46[3] = &unk_1E6CEA670;
  v46[4] = self;
  HDCreateMigrationStep(10028, 10029, (uint64_t)v46);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_25;
  v45[3] = &unk_1E6CEA670;
  v45[4] = self;
  HDCreateMigrationStep(10029, 10030, (uint64_t)v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v44[0] = v4;
  v44[1] = 3221225472;
  v44[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_26;
  v44[3] = &unk_1E6CEA670;
  v44[4] = self;
  HDCreateMigrationStep(10030, 10031, (uint64_t)v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_27;
  v43[3] = &unk_1E6CEA670;
  v43[4] = self;
  HDCreateMigrationStep(10031, 10032, (uint64_t)v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  v42[0] = v4;
  v42[1] = 3221225472;
  v42[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_28;
  v42[3] = &unk_1E6CEA670;
  v42[4] = self;
  HDCreateMigrationStep(10032, 10033, (uint64_t)v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_29;
  v41[3] = &unk_1E6CEA670;
  v41[4] = self;
  HDCreateMigrationStep(10033, 10034, (uint64_t)v41);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_30;
  v40[3] = &unk_1E6CEA670;
  v40[4] = self;
  HDCreateMigrationStep(10034, 10035, (uint64_t)v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_31;
  v39[3] = &unk_1E6CEA670;
  v39[4] = self;
  HDCreateMigrationStep(10035, 10036, (uint64_t)v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_32;
  v38[3] = &unk_1E6CEA670;
  v38[4] = self;
  HDCreateMigrationStep(10036, 10037, (uint64_t)v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  return v3;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("CREATE TABLE fitness_friend_activity_snapshots (active_hours REAL, active_hours_goal REAL, brisk_minutes_goal REAL, friend_uuid BLOB, workout_data BLOB, achievement_data BLOB, energy_burned REAL, walk_run_distance REAL, energy_burned_goal REAL, data_id INTEGER PRIMARY KEY, deep_breathing_session_count INTEGER, brisk_minutes REAL, uploaded_date REAL, steps INTEGER, snapshot_index INTEGER, source_uuid BLOB)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(&unk_1E6DF8978, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(&unk_1E6DF8978);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE activity_caches ADD COLUMN %@ INTEGER;"),
          *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_1E6DF8978, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return v10 ^ 1u;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("CREATE TABLE ccdas (data_id INTEGER PRIMARY KEY REFERENCES samples (data_id) ON DELETE CASCADE, document_data BLOB, title TEXT NOT NULL, patient_name TEXT NOT NULL, author_name TEXT NOT NULL, custodian_name TEXT NOT NULL);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DF8990, a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("ALTER TABLE metadata_values ADD COLUMN value_type INTEGER NOT NULL DEFAULT 0;");
  v7[1] = CFSTR("UPDATE metadata_values SET value_type = (CASE WHEN metadata_values.string_value IS NOT NULL THEN 0 WHEN metadata_values.numerical_value IS NOT NULL THEN 1 WHEN metadata_values.date_value IS NOT NULL THEN 2 END);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE data_series;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS data_series (data_id INTEGER PRIMARY KEY REFERENCES samples(data_id) ON DELETE CASCADE, frozen INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN vulcan_count INTEGER;"),
                                    a3) ^ 1);
  return result;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE activity_caches ADD COLUMN vulcan_condition INTEGER;"),
                                    a3) ^ 1);
  return result;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN vulcan_condition INTEGER;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE fitness_friend_activity_snapshots;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS fitness_friend_activity_snapshots (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, snapshot_index INTEGER, source_uuid BLOB, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, energy_burned_goal REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_run_distance REAL, vulcan_condition INTEGER, uploaded_date REAL)"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL)"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE fitness_friend_achievements (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, definition_identifier TEXT, completed_date REAL, value, extra_data BLOB, workout_activity_type INTEGER)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE activity_caches RENAME TO activity_caches_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, active_energy_burned_anchor INTEGER, active_hours_anchor INTEGER, brisk_minutes_anchor INTEGER, energy_burned_goal_anchor INTEGER, step_count_anchor INTEGER, vulcan_count_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, deep_breathing_session_anchor INTEGER, flights INTEGER, flights_anchor INTEGER)"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO activity_caches (data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor) SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor from activity_caches_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE activity_caches_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE TABLE object_authorizations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, object BLOB NOT NULL REFERENCES objects(uuid) ON DELETE CASCADE, source BLOB NOT NULL, status INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, modification_date REAL NOT NULL)"), a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE fitness_friend_workouts"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, source_first_party_workout_app INTEGER)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE workouts ADD COLUMN total_w_steps REAL;"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE workout_events ADD COLUMN w_step_style INTEGER;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN timezone_offset INTEGER;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[4];

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  objc_msgSend(v3, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke;
  v17[3] = &unk_1E6CEA698;
  v17[4] = v18;
  v8 = objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MAX(data_id) FROM objects"), a3, 0, v17);

  if ((v8 & 1) == 0
    || (objc_msgSend(v3, "transaction"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v3, "fetchLegacySyncIdentity:error:", v9, a3),
        v9,
        v10 == -1))
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v3, "transaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke_2;
    v16[3] = &unk_1E6CEA6C0;
    v16[4] = v18;
    v16[5] = v10;
    v13 = objc_msgSend(v12, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO key_value (category, domain, key, value, provenance, mod_date, sync_identity) values (0, '', 'HDMaxObjectPersistentID', ?, 0, 0.0, ?)"), a3, v16, 0);

    v14 = v13 ^ 1u;
  }
  _Block_object_dispose(v18, 8);
  return v14;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE OR IGNORE data_provenances SET origin_device='Watch0,0' WHERE origin_build LIKE '12S%' OR origin_build LIKE '13S%' OR origin_build LIKE '13V%' OR origin_build LIKE '14S%'"));
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE OR IGNORE data_provenances SET local_device='Watch0,0' WHERE local_build LIKE '12S%' OR local_build LIKE '13S%' OR local_build LIKE '13V%' OR local_build LIKE '14S%'"));
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE OR IGNORE data_provenances SET origin_device='iPhone0,0' WHERE (origin_build LIKE '12%' OR origin_build LIKE '13%' OR origin_build LIKE '14%') AND origin_device NOT LIKE 'Watch%'"));
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE OR IGNORE data_provenances SET local_device='iPhone0,0' WHERE (origin_build LIKE '12%' OR origin_build LIKE '13%' OR origin_build LIKE '14%') AND local_device NOT LIKE 'Watch%'"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE fitness_friend_workouts"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, is_watch_workout INTEGER)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE OR IGNORE data_provenances SET origin_device='Watch0,0' WHERE origin_device='iPhone0,0' AND (origin_build LIKE '12S%' OR origin_build LIKE '13S%' OR origin_build LIKE '13V%' OR origin_build LIKE '14S%')"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v26 = 0;
  objc_msgSend(v3, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke;
  v20[3] = &unk_1E6CEA698;
  v20[4] = &v21;
  v8 = objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT value FROM key_value_secure WHERE key = 'birthdate'"), a3, 0, v20);

  if (v22[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_dateOfBirthDateComponentsWithDate:", v22[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "transaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "protectedDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke_2;
    v18[3] = &unk_1E6CEA6E8;
    v15 = v12;
    v19 = v15;
    v8 = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE key_value_secure SET value = ? WHERE key = 'birthdate'"), a3, v18, 0);

  }
  v16 = v8 ^ 1u;
  _Block_object_dispose(&v21, 8);

  return v16;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DELETE FROM objects WHERE NOT EXISTS (SELECT samples.data_id FROM samples WHERE samples.data_id=objects.data_id);"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE data_provenances RENAME TO data_provenances_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_product_type TEXT NOT NULL, origin_build TEXT NOT NULL, local_product_type TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, tz_name TEXT NOT NULL, UNIQUE(sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name))"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO data_provenances (rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name) SELECT rowid, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version, '' FROM data_provenances_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE IF EXISTS data_provenances_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE UNIQUE INDEX ff_unique_columns ON fitness_friend_activity_snapshots (friend_uuid, snapshot_index, source_uuid);"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("DELETE FROM key_value_secure WHERE domain = 'com.apple.healthd.workout' AND key = 'companionWorkoutCreditAnchorKey';");
  v7[1] = CFSTR("INSERT OR REPLACE INTO key_value_secure (category, domain, key, value, provenance, mod_date) values (100, 'com.apple.healthd.workout', 'companionWorkoutCreditAnchorKey', COALESCE((select max(data_id) from objects), 0), 0, 0.0);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE data_series ADD COLUMN insertion_era INTEGER NOT NULL DEFAULT 0"), a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS cda_documents (data_id INTEGER PRIMARY KEY REFERENCES samples (data_id) ON DELETE CASCADE, document_data BLOB, title TEXT NOT NULL, patient_name TEXT NOT NULL, author_name TEXT NOT NULL, custodian_name TEXT NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO cda_documents SELECT * FROM ccdas;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE IF EXISTS ccdas;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;
  _QWORD v4[5];

  result = *(void **)(a1 + 32);
  if (result)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __69__HDDatabaseMigrator_Whitetail___addFieldsToLocationSeriesWithError___block_invoke;
    v4[3] = &unk_1E6CEA710;
    v4[4] = result;
    return (void *)objc_msgSend(result, "performHFDMigrationToVersion:handler:error:", 10032, v4, a3);
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX IF NOT EXISTS samples_type_dates ON samples (data_type, start_date, end_date);"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX IF NOT EXISTS samples_end ON samples (data_type, end_date);"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE fitness_friend_workouts"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, is_watch_workout INTEGER, is_indoor_workout INTEGER)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX IF NOT EXISTS samples_type_anchor ON samples (data_type, data_id);"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_31()
{
  return 0;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CB7500]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "dictionaryRepresentation", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "synchronize");
  objc_msgSend(v3, "transaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unprotectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "executeSQLStatements:error:", &unk_1E6DF89A8, a3);

  return v14 ^ 1u;
}

uint64_t __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB198](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __69__HDDatabaseMigrator_Whitetail___addFieldsToLocationSeriesWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a2;
  v4 = a1 + 32;
  v5 = operator new(0x20uLL);
  *v5 = &off_1E6CEA740;
  v5[1] = v4;
  v5[2] = &v10;
  v5[3] = &v11;
  v13 = v5;
  v6 = health::DataStore::performWriteTransactionWithLambda(a2, (uint64_t)v12);
  v7 = v13;
  if (v13 == v12)
  {
    v8 = 4;
    v7 = v12;
    goto LABEL_5;
  }
  if (v13)
  {
    v8 = 5;
LABEL_5:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v6 ^ 1u;
}

- (void)yukon_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13000, _HDAddFrozenAndExpectedSyncAnchorColumns);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13001, _HDAddSyncAnchorUpdateDateColumns);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13002, _HDAddUniqueConstraintToSessionControllersTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13003, _HDAddAlarmEventsTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 13004, _HDAddSourceOwnerBundleIdentifierAndDropSyncPrimary, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13005, _HDAddSourceOrderModificationDate);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13006, _HDAddLatestActivityDateToWorkoutSessionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13007, _HDResetReceivedAnchorsForCategoryAndQuantitySamples);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13008, _HDAddEventOptionsToAlarmEventsTable);
}

- (void)yukon_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13000, _HDAddQuantitySampleStatisticsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13001, _HDAddMenstrualCycleDaySummaryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13002, _HDUpdateActivityCacheTableForYukon);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13003, _HDAddConceptIndexTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13004, _HDRemoveDuplicatedHeartRateContextMetadata);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13005, _HDAddLocaleToMedicalRecords);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13006, _HDUpdateFitnessFriendActivitySnapshotsTableForYukon);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13007, _HDUpdateDiagnosticTestReportColumnNames);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13008, _HDUpdateFitnessFriendWorkoutTableForYukon);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13009, _HDUpdateConceptIndexTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13010, _HDUpdateVaccinationRecordColumnNames);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 13011, _HDMoveClinicalCredentialsToKeychain, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13012, _HDRemoveMenstrualCycleDaySummaryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13013, _HDAddAllergyIntoleranceStatus);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13014, _HDResetClinicalAccountEntityLastSubmittedRow);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13015, _HDAddOntologyVersionToConceptIndex);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 13200, _HDAddDerivedFlagsToDataProvenances, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13400, _HDAddCountryToMedicalRecord);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13401, _HDAddMedicalRecordState);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 13402, _HDWipeWorkoutAnchors);
}

- (id)monarchUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke;
  v21[3] = &unk_1E6CF2E90;
  v21[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8114, 9000, v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_2;
  v20[3] = &unk_1E6CF2E90;
  v20[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9000, 9001, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_3;
  v19[3] = &unk_1E6CF2E90;
  v19[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9001, 9002, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_4;
  v18[3] = &unk_1E6CF2E90;
  v18[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9002, 9003, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_5;
  v17[3] = &unk_1E6CF2E90;
  v17[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9003, 9004, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_6;
  v16[3] = &unk_1E6CF2E90;
  v16[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9004, 9005, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_7;
  v15[3] = &unk_1E6CF2E90;
  v15[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9005, 9006, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_8;
  v14[3] = &unk_1E6CF2E90;
  v14[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9006, 9007, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE IF EXISTS nano_pairing;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, registry_uuid BLOB UNIQUE NOT NULL, persistent_uuid BLOB, health_uuid BLOB, sync_provenance INTEGER NOT NULL, activated INTEGER NOT NULL);"));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__HDDatabaseMigrator_Monarch___migrateNanoPairingSchema___block_invoke;
  v17[3] = &unk_1E6CE8540;
  v17[4] = &v18;
  v8 = objc_msgSend(v7, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid FROM key_value WHERE domain='NanoPairing' AND key='RegistryPairingUUID' AND value IS NOT NULL"), a3, 0, v17);

  if (v8 && *((_BYTE *)v19 + 24))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1"), CFSTR("RegistryPairingUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1"), CFSTR("PersistentPairingUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1"), CFSTR("HealthPairingUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1"), CFSTR("ActivationFinished"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("INSERT INTO nano_pairing(registry_uuid, persistent_uuid, health_uuid, sync_provenance, activated) SELECT (%@), (%@), (%@), 1, (%@);"),
      v10,
      v11,
      v12,
      v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  objc_msgSend(v5, "addObject:", CFSTR("DELETE FROM key_value WHERE domain='NanoPairing';"));
  v15 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v21[0] = CFSTR("ALTER TABLE sources RENAME TO sources_old;");
    v21[1] = CFSTR("CREATE TABLE IF NOT EXISTS sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT, name TEXT, source_options INTEGER, local_device INTEGER, product_type TEXT, deleted INTEGER NOT NULL, mod_date REAL, provenance INTEGER NOT NULL)");
    v21[2] = CFSTR("INSERT INTO sources(rowid, uuid, bundle_id, name, source_options, local_device, product_type, deleted, mod_date, provenance) SELECT rowid, hk_new_source_uuid(bundle_id, product_type), bundle_id, name, source_options, local_device, product_type, 0, NULL, 0 FROM sources_old;");
    v21[3] = CFSTR("CREATE INDEX IF NOT EXISTS sources_index_0 ON sources(bundle_id)");
    v21[4] = CFSTR("DROP TABLE sources_old;");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend((id)v3, "transaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unprotectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke;
    v16[3] = &unk_1E6CF2EB8;
    v16[4] = &v17;
    objc_msgSend(v7, "accessDatabaseUsingBlock:", v16);

    v9 = *((_DWORD *)v18 + 6);
    if (v9)
    {
      v10 = 1;
    }
    else
    {
      v11 = objc_msgSend((id)v3, "executeSQLStatements:error:", v5, a3);
      objc_msgSend((id)v3, "transaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unprotectedDatabase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke_2;
      v15[3] = &unk_1E6CF2EB8;
      v15[4] = &v17;
      objc_msgSend(v13, "accessDatabaseUsingBlock:", v15);

      v10 = v11 ^ 1u;
      v9 = *((_DWORD *)v18 + 6);
    }
    if (v9)
      v3 = 1;
    else
      v3 = v10;
    _Block_object_dispose(&v17, 8);

  }
  return v3;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS source_devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, manufacturer TEXT NOT NULL, model TEXT NOT NULL, hardware TEXT NOT NULL, firmware TEXT NOT NULL, software TEXT NOT NULL, localIdentifier TEXT NOT NULL, FDAUDI TEXT NOT NULL, creation_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, uuid BLOB UNIQUE NOT NULL)"));
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (_QWORD *)MEMORY[0x1E0D297D8];
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) VALUES ('__NONE__', '', '', '', '', '', '__NONE__', '', %f, 0, %@())"), v8, *MEMORY[0x1E0D297D8]);
  objc_msgSend(v5, "addObject:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) SELECT COALESCE(name, ''), '', '', '', '', '', bundle_id, '', %f, 0, %@() FROM sources WHERE source_options = 0 AND product_type = 'Bluetooth'"), v8, *v10);

  objc_msgSend(v5, "addObject:", v12);
  v13 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v13;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE authorization RENAME TO authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, provenance INTEGER NOT NULL, UNIQUE(source_id, object_type));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO authorization(source_id, object_type, status, request, date_modified, provenance) SELECT source_id, code, status, request, 0.0, 0 FROM authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE authorization_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE IF EXISTS authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE authorization RENAME TO authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL REFERENCES sources(ROWID) ON DELETE CASCADE, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, provenance INTEGER NOT NULL, UNIQUE(source_id, object_type));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO authorization SELECT ROWID, source_id, object_type, status, request, date_modified, provenance FROM authorization_old WHERE EXISTS (SELECT ROWID FROM sources WHERE sources.ROWID = authorization_old.source_id);"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE authorization_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE authorization ADD object_anchor INTEGER NOT NULL DEFAULT 0"), a3) ^ 1);
  return result;
}

void *__63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DELETE FROM authorization WHERE object_type = 70;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE datatype_source_order RENAME TO datatype_source_order_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS datatype_source_order (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, data_type INTEGER NOT NULL, source INTEGER NOT NULL REFERENCES sources (ROWID) ON DELETE CASCADE, user_preferred INTEGER NOT NULL, provenance INTEGER NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO datatype_source_order SELECT ROWID, data_type, source, user_preferred_order, 0 FROM datatype_source_order_old WHERE EXISTS (SELECT ROWID FROM sources WHERE sources.ROWID = datatype_source_order_old.source);"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE datatype_source_order_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

- (id)monarchProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke;
  v37[3] = &unk_1E6CF2E90;
  v37[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8120, 9000, v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_2;
  v36[3] = &unk_1E6CF2E90;
  v36[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9000, 9001, v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_3;
  v35[3] = &unk_1E6CF2E90;
  v35[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9001, 9002, v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_4;
  v34[3] = &unk_1E6CF2E90;
  v34[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9002, 9004, v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_5;
  v33[3] = &unk_1E6CF2E90;
  v33[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 9004, 9005, v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_6;
  v32[3] = &unk_1E6CF2E90;
  v32[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9005, 9006, v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_7;
  v31[3] = &unk_1E6CF2E90;
  v31[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9006, 9007, v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_8;
  v30[3] = &unk_1E6CF2E90;
  v30[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9007, 9009, v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_9;
  v29[3] = &unk_1E6CF2E90;
  v29[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9009, 9010, v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_10;
  v28[3] = &unk_1E6CF2E90;
  v28[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9010, 9011, v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_11;
  v27[3] = &unk_1E6CF2E90;
  v27[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9011, 9012, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_12;
  v26[3] = &unk_1E6CF2E90;
  v26[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9012, 9013, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_13;
  v25[3] = &unk_1E6CF2E90;
  v25[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9013, 9014, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_14;
  v24[3] = &unk_1E6CF2E90;
  v24[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9014, 9015, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_15;
  v23[3] = &unk_1E6CF2E90;
  v23[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9015, 9016, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_16;
  v22[3] = &unk_1E6CF2E90;
  v22[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9016, 9017, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  return v3;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("CREATE TABLE IF NOT EXISTS unit_strings (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, unit_string TEXT UNIQUE);");
  v8[1] = CFSTR("ALTER TABLE quantity_samples add column original_quantity REAL;");
  v8[2] = CFSTR("ALTER TABLE quantity_samples add column original_unit INTEGER REFERENCES unit_strings(ROWID);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_device TEXT NOT NULL, origin_build TEXT NOT NULL, local_device TEXT NOT NULL, local_build TEXT NOT NULL, UNIQUE(sync_provenance, origin_device, origin_build, local_device, local_build));"));
  v11[0] = CFSTR("INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (1, 0, 'UnknownDevice', '[8.0, 8.2)', 'UnknownDevice', 'UnknownBuild')");
  v11[1] = CFSTR("INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (2, 0, 'UnknownDevice', '[8.2, 9.0)', 'UnknownDevice', 'UnknownBuild')");
  v11[2] = CFSTR("INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (3, 1, 'UnknownDevice', '[8.2, 9.0)', 'UnknownDevice', 'UnknownBuild')");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v10[0] = CFSTR("ALTER TABLE objects RENAME TO objects_old;");
  v10[1] = CFSTR("CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, creation_date REAL, source INTEGER, provenance INTEGER REFERENCES data_provenances(ROWID), type INTEGER, uuid BLOB);");
  v10[2] = CFSTR("INSERT INTO objects (data_id, creation_date, source, type, uuid, provenance) SELECT data_id, creation_date, source, type, uuid, (CASE WHEN data_id <= COALESCE(value, 0) THEN 1 ELSE (CASE objects_old.provenance WHEN 0 THEN 2 WHEN 1 THEN 3 END) END) FROM objects_old LEFT JOIN (SELECT value from key_value_secure WHERE category=100 AND key_value_secure.provenance=0 AND domain='OBJECT_ANCHOR' AND key='OBJECT_ANCHOR_8_2');");
  v10[3] = CFSTR("CREATE UNIQUE INDEX objects_uuid ON objects(uuid);");
  v10[4] = CFSTR("DROP TABLE objects_old;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "addObject:", CFSTR("DELETE FROM key_value_secure WHERE category=100 AND domain='OBJECT_ANCHOR';"));
  v8 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v8;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("INSERT INTO category_samples (data_id, value) SELECT data_id, CASE WHEN quantity < 0.5 THEN 0 ELSE 1 END FROM quantity_samples LEFT JOIN samples USING (data_id) WHERE data_type = 69");
  v8[1] = CFSTR("DELETE FROM quantity_samples WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 69)");
  v8[2] = CFSTR("UPDATE samples SET data_type = 70 WHERE data_type = 69");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("CREATE TABLE menstruation_samples (data_id INTEGER PRIMARY KEY, start_cycle INTEGER, menstrual_flow INTEGER);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[6];
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("CREATE TEMPORARY TABLE source_device_map (source INTEGER PRIMARY KEY, device INTEGER, provenance INTEGER)");
  v41[1] = CFSTR("INSERT INTO source_device_map(source, device, provenance)                                        SELECT sources.ROWID, source_devices.ROWID, sources.provenance                                        FROM sources JOIN logical_sources ON sources.logical_source_id = logical_sources.ROWID                                        JOIN source_devices ON logical_sources.bundle_id = source_devices.localIdentifier;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "executeSQLStatements:error:", v7, a3);

  if (v8 && objc_msgSend(v3, "executeSQLStatements:error:", &unk_1E6DF8D80, a3))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = -1;
    objc_msgSend(v3, "transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprotectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke;
    v36[3] = &unk_1E6CE8540;
    v36[4] = &v37;
    v12 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM source_devices WHERE source_devices.name = '__NONE__' AND source_devices.localIdentifier = '__NONE__'"), a3, 0, v36);

    if ((v12 & 1) != 0)
    {
      if (v38[3] == -1)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v3, "transaction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v3, "fetchLegacySyncIdentity:error:", v21, a3);

        if (v22 == -1)
        {

          goto LABEL_15;
        }
        objc_msgSend(v3, "transaction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "unprotectedDatabase");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v11;
        v33[1] = 3221225472;
        v33[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_2;
        v33[3] = &unk_1E6CE82D8;
        v25 = v20;
        v34 = v25;
        v35 = v22;
        v26 = objc_msgSend(v24, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid, sync_identity) VALUES ('__NONE__', '', '', '', '', '', '__NONE__', '', ?, 0, ?, ?)"), a3, v33, 0);

        if (!v26)
        {

          goto LABEL_15;
        }
        objc_msgSend(v3, "transaction");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "unprotectedDatabase");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastInsertRowID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "longLongValue");
        v38[3] = v30;

      }
      objc_msgSend(v3, "transaction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "protectedDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_3;
      v32[3] = &unk_1E6CF2F08;
      v32[4] = v3;
      v32[5] = &v37;
      v15 = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, source_id FROM data_provenances"), a3, 0, v32);

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v3, "transaction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unprotectedDatabase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "executeUncachedSQL:error:", CFSTR("DROP TABLE IF EXISTS source_device_map"), a3);

        if ((v18 & 1) != 0)
        {
          v19 = objc_msgSend(v3, "executeSQLStatements:error:", &unk_1E6DF8D98, a3) ^ 1;
LABEL_16:
          _Block_object_dispose(&v37, 8);
          return v19;
        }
      }
    }
LABEL_15:
    v19 = 1;
    goto LABEL_16;
  }
  return 1;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("UPDATE devices SET device_enabled = 1 WHERE device_enabled = 'TRUE' OR device_enabled = 'true'");
  v8[1] = CFSTR("ALTER TABLE devices RENAME TO devices_old");
  v8[2] = CFSTR("CREATE TABLE IF NOT EXISTS devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, device_uuid BLOB, device_name TEXT, device_service INTEGER, device_last_connect REAL, device_enabled BOOLEAN default 1, UNIQUE(device_uuid, device_service))");
  v8[3] = CFSTR("INSERT INTO devices(rowid, device_uuid, device_name, device_service, device_last_connect, device_enabled) SELECT rowid, device_uuid, device_name, device_service, device_last_connect, device_enabled FROM devices_old");
  v8[4] = CFSTR("DROP TABLE devices_old");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("DELETE FROM samples WHERE data_id IN (SELECT data_id FROM menstruation_samples)");
  v8[1] = CFSTR("DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM menstruation_samples)");
  v8[2] = CFSTR("DELETE FROM objects WHERE data_id IN (SELECT data_id FROM menstruation_samples)");
  v8[3] = CFSTR("DROP TABLE menstruation_samples");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  id v15;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "table:hasColumnWithName:error:", CFSTR("data_provenances"), CFSTR("ROWID"), a3);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE data_provenances RENAME TO provenance_old;"));
    objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_device TEXT NOT NULL, origin_build TEXT NOT NULL, local_device TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, UNIQUE(sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version));"));
    objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO data_provenances SELECT data_id, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version from provenance_old;"));
    objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE provenance_old;"));
  }
  objc_msgSend(v3, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "foreignKeyExistsFromTable:column:toTable:column:error:", CFSTR("objects"), CFSTR("provenance"), CFSTR("data_provenances"), CFSTR("ROWID"), &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
  {
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
      v13 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE objects RENAME TO objects_old;"));
    objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB, provenance INTEGER NOT NULL REFERENCES data_provenances (ROWID) ON DELETE CASCADE, type INTEGER, creation_date REAL);"));
    objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO objects SELECT data_id, uuid, provenance, type, creation_date from objects_old WHERE EXISTS (SELECT ROWID FROM data_provenances WHERE ROWID=provenance);"));
    objc_msgSend(v5, "addObject:", CFSTR("CREATE UNIQUE INDEX objects_uuid ON objects(uuid);"));
    objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE objects_old;"));
  }
  v13 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;
LABEL_12:

  return v13;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("DELETE FROM category_samples WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)");
  v8[1] = CFSTR("DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)");
  v8[2] = CFSTR("DELETE FROM objects WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)");
  v8[3] = CFSTR("DELETE FROM samples WHERE data_type = 93 OR data_type = 95");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE key_value_secure SET value='ft' WHERE key='2' AND value='in';"),
                                    a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeOfColumn:inTable:error:", CFSTR("energy_burned_goal_date"), CFSTR("activity_caches"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("INTEGER")))
    {
      objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE activity_caches RENAME TO activity_caches_old"));
      objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE activity_caches (data_id INTEGER PRIMARY KEY, energy_burned REAL, energy_burned_goal REAL, step_count_anchor INTEGER, energy_burned_goal_date REAL, steps REAL, active_hours_goal REAL, active_energy_burned_anchor INTEGER, brisk_minutes_anchor INTEGER, brisk_minutes_goal REAL, walk_distance REAL, energy_burned_goal_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, brisk_minutes REAL, active_hours_anchor INTEGER, cache_index INTEGER, active_hours REAL)"));
      objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO activity_caches SELECT data_id, energy_burned, energy_burned_goal, step_count_anchor, energy_burned_goal_date, steps, active_hours_goal, active_energy_burned_anchor, brisk_minutes_anchor, brisk_minutes_goal, walk_distance, energy_burned_goal_anchor, walking_and_running_distance_anchor, workout_anchor, brisk_minutes, active_hours_anchor, cache_index, active_hours from activity_caches_old;"));
      objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE activity_caches_old"));
    }
    v9 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;
  }
  else
  {
    NSLog(CFSTR("no energy_burned_goal_date column"));
    v9 = 1;
  }

  return v9;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  objc_msgSend(v3, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke;
  v15[3] = &unk_1E6CE8540;
  v15[4] = v16;
  v8 = objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MAX(data_id) FROM objects"), a3, 0, v15);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprotectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke_2;
    v14[3] = &unk_1E6CE8D48;
    v14[4] = v16;
    v11 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE authorization SET deleted_object_anchor = ?"), a3, v14, 0);

    v12 = v11 ^ 1u;
  }
  else
  {
    v12 = 1;
  }
  _Block_object_dispose(v16, 8);
  return v12;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v63 = 0;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke;
  v59[3] = &unk_1E6CE8540;
  v59[4] = &v60;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM sources WHERE local_device = 1;"),
          a3,
          0,
          v59) & 1) == 0)
    goto LABEL_27;
  if (v61[3])
    goto LABEL_4;
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v39 = 1;
  v58[0] = v9;
  v58[1] = 3221225472;
  v58[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2;
  v58[3] = &unk_1E6CE8540;
  v58[4] = &v36;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MAX(sync_anchor) FROM sources;"),
          a3,
          0,
          v58) & 1) == 0)
  {
    _Block_object_dispose(&v36, 8);
    goto LABEL_27;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v28 = v11;
  objc_msgSend(v11, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.health.%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceDisplayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = (uint64_t)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__61;
  v33 = __Block_byref_object_dispose__61;
  v34 = 0;
  v56[0] = v9;
  v56[1] = 3221225472;
  v56[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_404;
  v56[3] = &unk_1E6CE9508;
  v15 = v14;
  v57 = v15;
  v55[0] = v9;
  v55[1] = 3221225472;
  v55[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2_405;
  v55[3] = &unk_1E6CE8540;
  v55[4] = &v29;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM logical_sources WHERE bundle_id = ?"), a3, v56, v55) & 1) == 0)
  {
    v23 = 1;
    goto LABEL_26;
  }
  if (!*(_QWORD *)(v30 + 40))
  {
    v53[0] = v9;
    v53[1] = 3221225472;
    v53[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_3;
    v53[3] = &unk_1E6CE9508;
    v54 = v15;
    if (!objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO logical_sources (bundle_id) VALUES (?)"), a3, v53, 0))
    {
      v23 = 1;

      goto LABEL_26;
    }
    objc_msgSend(v8, "lastInsertRowID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v16;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
    *MEMORY[0x1E0D297B0],
    *MEMORY[0x1E0D297B0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  objc_msgSend(v3, "transaction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unprotectedDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v9;
  v48[1] = 3221225472;
  v48[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_4;
  v48[3] = &unk_1E6CE8540;
  v48[4] = &v49;
  v20 = objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", v25, a3, 0, v48);

  if ((v20 & 1) != 0)
  {
    v41[0] = v9;
    v41[1] = 3221225472;
    v41[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_5;
    v41[3] = &unk_1E6CF2F30;
    v42 = v28;
    v45 = &v29;
    v43 = v26;
    v44 = v27;
    v46 = &v36;
    v47 = &v49;
    if (objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO sources(uuid, logical_source_id, name, source_options, local_device, product_type, deleted, mod_date, provenance, sync_anchor, sync_identity) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), a3, v41, 0))
    {
      objc_msgSend(v8, "lastInsertRowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "longLongValue");
      v61[3] = v22;

      v23 = 0;
    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
    v23 = 1;
  }
  _Block_object_dispose(&v49, 8);

LABEL_26:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v36, 8);
  if (!v23)
  {
LABEL_4:
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v36 = v9;
    v37 = 3221225472;
    v38 = (uint64_t)__78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_6;
    v39 = (uint64_t)&unk_1E6CE8540;
    v40 = &v49;
    if (objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM source_devices WHERE name='__NONE__' AND manufacturer='' AND model='' AND hardware='' AND firmware='' AND software='' AND localIdentifier='__NONE__' AND FDAUDI=''"), a3, 0, &v36)&& v50[3])
    {
      v29 = v9;
      v30 = 3221225472;
      v31 = (uint64_t)__78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_7;
      v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF2F80;
      v33 = v6;
      v34 = &v60;
      v35 = &v49;
      if (objc_msgSend(v33, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version FROM data_provenances WHERE source_id=0 OR device_id=0"), a3, 0, &v29))v10 = objc_msgSend(v3, "executeSQL:error:", CFSTR("DELETE FROM data_provenances WHERE source_id=0 OR device_id=0"), a3) ^ 1;
      else
        v10 = 1;

    }
    else
    {
      v10 = 1;
    }
    _Block_object_dispose(&v49, 8);
    goto LABEL_28;
  }
LABEL_27:
  v10 = 1;
LABEL_28:
  _Block_object_dispose(&v60, 8);

  return v10;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unsigned int v9;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protectedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "columnIsNullable:inTable:error:", CFSTR("provenance"), CFSTR("objects"), a3);

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", CFSTR("ALTER TABLE objects RENAME TO objects_old;"));
      objc_msgSend(v8, "addObject:", CFSTR("CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB, provenance INTEGER NOT NULL REFERENCES data_provenances (ROWID) ON DELETE CASCADE, type INTEGER, creation_date REAL);"));
      objc_msgSend(v8, "addObject:", CFSTR("INSERT INTO objects SELECT data_id, uuid, provenance, type, creation_date from objects_old WHERE EXISTS (SELECT ROWID FROM data_provenances WHERE ROWID=provenance);"));
      objc_msgSend(v8, "addObject:", CFSTR("DROP TABLE objects_old;"));
      objc_msgSend(v8, "addObject:", CFSTR("CREATE UNIQUE INDEX objects_uuid ON objects(uuid);"));
      v9 = objc_msgSend(v3, "executeSQLStatements:error:", v8, a3) ^ 1;

    }
    else
    {
      return *a3 != 0;
    }
  }
  else
  {
    return 0;
  }
  return v9;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v41 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke;
  v37[3] = &unk_1E6CE8540;
  v37[4] = &v38;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MAX(ROWID) FROM sources WHERE provenance=1 and deleted=0 and product_type LIKE 'Watch1,%';"),
          a3,
          0,
          v37) & 1) != 0)
  {
    if (v39[3])
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v3, "transaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unprotectedDatabase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_2;
      v31[3] = &unk_1E6CE8CF8;
      v14 = v11;
      v32 = v14;
      v15 = objc_msgSend(v13, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid FROM sources"), a3, 0, v31);

      if ((v15 & 1) != 0)
      {
        if (objc_msgSend(v14, "count"))
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("AND source_id NOT IN (%@)"), v17);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = &stru_1E6D11BB8;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID, origin_device, origin_build, local_device, local_build, device_id, source_version FROM data_provenances WHERE sync_provenance=1 %@;"),
          v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v9;
        v26[1] = 3221225472;
        v26[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_3;
        v26[3] = &unk_1E6CF2FA8;
        v29 = &v33;
        v27 = v6;
        v30 = &v38;
        v21 = v10;
        v28 = v21;
        if (objc_msgSend(v27, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v20, a3, 0, v26)&& *((_BYTE *)v34 + 24))
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("DELETE FROM data_provenances WHERE ROWID IN (%@);"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v3, "executeSQL:error:", v23, a3) ^ 1;
        }
        else
        {
          v19 = 1;
        }

      }
      else
      {
        v19 = 1;
      }

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 1;
  }
  _Block_object_dispose(&v38, 8);

  return v19;
}

void *__61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE workouts ADD COLUMN total_basal_energy_burned REAL"), a3) ^ 1);
  return result;
}

uint64_t __57__HDDatabaseMigrator_Monarch___migrateNanoPairingSchema___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t result;

  result = sqlite3_create_function_v2(db, "hk_new_source_uuid", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteNewSourceUUIDWithBundleIdentifierAndProductType, 0, 0, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke_2(uint64_t a1, sqlite3 *db)
{
  uint64_t result;

  result = sqlite3_create_function_v2(db, "hk_new_source_uuid", 2, 0, 0, 0, 0, 0, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 40));
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[3];
  uint64_t v19;

  v5 = HDSQLiteColumnAsInt64();
  v6 = HDSQLiteColumnAsInt64();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v7 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v7, "transaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unprotectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_4;
  v17[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = v6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_5;
  v16[3] = &unk_1E6CE8540;
  v16[4] = v18;
  v17[0] = MEMORY[0x1E0C809B0];
  LOBYTE(v6) = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT device FROM source_device_map WHERE source = ?"), a3, v17, v16);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_6;
    v15[3] = &unk_1E6CF2EE0;
    v15[4] = v18;
    v15[5] = v5;
    v13 = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE data_provenances SET device_id = ? WHERE ROWID = ?"), a3, v15, 0);

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(v18, 8);
  return v13;
}

void __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_5(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_404()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2_405(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_4(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_5(_QWORD *a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  sqlite3_int64 v5;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "longLongValue"));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 4, 2);
  sqlite3_bind_int(a2, 5, 1);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 7, 0);
  sqlite3_bind_double(a2, 8, 0.0);
  sqlite3_bind_int(a2, 9, 0);
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(_QWORD *)(v4 + 24) + 1;
  *(_QWORD *)(v4 + 24) = v5;
  sqlite3_bind_int64(a2, 10, v5);
  return sqlite3_bind_int64(a2, 11, *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_6(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[4];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v6 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v18[4] = &v22;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_8;
  v19[3] = &unk_1E6CF2F58;
  v21 = a2;
  v20 = *(_OWORD *)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_9;
  v18[3] = &unk_1E6CE8540;
  if ((objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM data_provenances WHERE sync_provenance=? AND origin_device=? AND origin_build=? AND local_device=? AND local_build=? AND source_id=? AND device_id=? AND source_version=?"), a3, v19, v18) & 1) == 0)goto LABEL_6;
  if (!v23[3])
  {
    v8 = *(void **)(a1 + 32);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_10;
    v15[3] = &unk_1E6CF2F58;
    v17 = a2;
    v16 = *(_OWORD *)(a1 + 40);
    if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO data_provenances (sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"), a3, v15, 0) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "lastInsertRowID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "longLongValue");
      v23[3] = v10;

      goto LABEL_5;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v11 = *(void **)(a1 + 32);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_11;
  v14[3] = &unk_1E6CF2EE0;
  v14[4] = &v22;
  v14[5] = a2;
  v12 = objc_msgSend(v11, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE objects SET provenance=? WHERE provenance=?"), a3, v14, 0);
LABEL_7:
  _Block_object_dispose(&v22, 8);
  return v12;
}

void __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_8(_QWORD *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3_int64 v9;
  sqlite3_int64 v10;
  id v11;

  v4 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 1, v4);
  MEMORY[0x1BCCAB1D4](a1[6], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  v9 = HDSQLiteColumnAsInt64();
  if (!v9)
    v9 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  sqlite3_bind_int64(a2, 6, v9);
  v10 = HDSQLiteColumnAsInt64();
  if (!v10)
    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  sqlite3_bind_int64(a2, 7, v10);
  MEMORY[0x1BCCAB1D4](a1[6], 8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_9(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_10(_QWORD *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3_int64 v9;
  sqlite3_int64 v10;
  id v11;

  v4 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 1, v4);
  MEMORY[0x1BCCAB1D4](a1[6], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](a1[6], 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  v9 = HDSQLiteColumnAsInt64();
  if (!v9)
    v9 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  sqlite3_bind_int64(a2, 6, v9);
  v10 = HDSQLiteColumnAsInt64();
  if (!v10)
    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  sqlite3_bind_int64(a2, 7, v10);
  MEMORY[0x1BCCAB1D4](a1[6], 8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_11(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v3 = HDSQLiteColumnAsInt64();
  return sqlite3_bind_int64(a2, 2, v3);
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

BOOL __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[5];
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = HDSQLiteColumnAsInt64();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v19[4] = &v21;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_4;
  v20[3] = &unk_1E6CF2EE0;
  v20[4] = *(_QWORD *)(a1 + 56);
  v20[5] = a2;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_5;
  v19[3] = &unk_1E6CE8540;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM data_provenances WHERE sync_provenance=1 AND origin_device=? AND origin_build=? AND local_device=? AND local_build=? AND source_id=? AND device_id=? AND source_version=?;"),
                                                                 a3,
                                                                 v20,
                                                                 v19);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_6;
  if (!v22[3])
  {
    v9 = *(void **)(a1 + 32);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_6;
    v18[3] = &unk_1E6CF2EE0;
    v18[4] = *(_QWORD *)(a1 + 56);
    v18[5] = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO data_provenances(sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version) VALUES (?,?,?,?,?,?,?,?);"),
                                                                   a3,
                                                                   v18,
                                                                   0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastInsertRowID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "longLongValue");
      v22[3] = v11;

      goto LABEL_5;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v12 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  v14 = *(void **)(a1 + 32);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_7;
  v17[3] = &unk_1E6CF2EE0;
  v17[4] = &v21;
  v17[5] = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE objects SET provenance=? WHERE provenance=?;"),
                                                                 a3,
                                                                 v17,
                                                                 0);
  v15 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
LABEL_7:
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  sqlite3_int64 v8;
  id v9;

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v8 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 6, v8);
  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_5(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_6(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  sqlite3_int64 v8;
  id v9;

  sqlite3_bind_int64(a2, 1, 1);
  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v8 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 7, v8);
  MEMORY[0x1BCCAB1D4](*(_QWORD *)(a1 + 40), 6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_7(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

- (id)boulderUnprotectedMigrationSteps
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)boulderProtectedMigrationSteps
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HDDatabaseMigrator_Boulder__boulderProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E6CF2E90;
  v6[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 9017, 9100, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

uint64_t __61__HDDatabaseMigrator_Boulder__boulderProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t buf[16];
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke;
  v35[3] = &unk_1E6CE8CF8;
  v9 = v5;
  v36 = v9;
  v10 = objc_msgSend(v7, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM sources WHERE product_type LIKE 'Watch%'"), a3, 0, v35);

  if (v10)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM data_provenances WHERE sync_provenance = 0 AND origin_build = '[8.0, 8.2)' AND source_id IN (%@) LIMIT 1;"),
        v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = -1;
      objc_msgSend(v3, "transaction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "protectedDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v8;
      v30[1] = 3221225472;
      v30[2] = __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke_2;
      v30[3] = &unk_1E6CE8540;
      v30[4] = &v31;
      v15 = objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v12, a3, 0, v30);

      if ((v15 & 1) != 0)
      {
        if (v32[3] != -1)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", CFSTR("UPDATE data_provenances SET origin_build = '[8.2, 9.0)' WHERE origin_build = '[8.0, 8.2)'"));
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE data_provenances SET sync_provenance = 1 WHERE origin_build = '[8.2, 9.0)' AND source_id IN (%@)"), v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);

          v29 = 0;
          v18 = objc_msgSend(v3, "executeSQLStatements:error:", v16, &v29);
          v19 = v29;
          v20 = v19;
          if ((v18 & 1) == 0)
          {
            objc_msgSend(v19, "userInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "domain");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.SQLite")))
            {
              v24 = objc_msgSend(v22, "code");

              if (v24 == 19)
              {
                _HKInitializeLogging();
                v25 = *MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1B7802000, v25, OS_LOG_TYPE_FAULT, "Attempt to fix sync provenance failed due to a SQL constraint. Skipping migration step.", buf, 2u);
                }

                v26 = 0;
                goto LABEL_19;
              }
            }
            else
            {

            }
          }
          v26 = v18 ^ 1u;
LABEL_19:

          goto LABEL_20;
        }
        v26 = 0;
      }
      else
      {
        v26 = 1;
      }
LABEL_20:
      _Block_object_dispose(&v31, 8);

      goto LABEL_21;
    }
    v26 = 0;
  }
  else
  {
    v26 = 1;
  }
LABEL_21:

  return v26;
}

uint64_t __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

uint64_t __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (id)erieUnprotectedMigrationSteps
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)erieProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke;
  v9[3] = &unk_1E6CEA670;
  v9[4] = self;
  HDCreateMigrationStep(10202, 10204, (uint64_t)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke_2;
  v8[3] = &unk_1E6CEA670;
  v8[4] = self;
  HDCreateMigrationStep(10204, 10205, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

uint64_t __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

- (void)peace_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12000, _HDAddWorkoutBuilderTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12001, _HDAddWorkoutSessionControllerTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12002, _HDAddClientBundleIdentifierToWorkoutSession);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12010, _HDAddAuthorizationMode);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12011, _HDAddClientApplicationIdentifierToWorkoutSession);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12012, _HDRemoveExistingWorkoutBuildersAndSessions);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12013, _HDSplitAuthorizationAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12014, _HDAddSyncProtocolVersionToCloudSyncStore);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12015, _HDMakeStatisticsColumnNullable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12016, _HDAddRequestedTargetStateToWorkoutSession);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12017, _HDAddHasFailedToWorkoutSession);
}

- (void)peace_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12000, _HDAddWorkoutEventForeignKey);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12001, _CreateQuantitySampleSeriesEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12002, _AddCondenserVersionToWorkoutEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12003, _AddTemplateUniqueNameToFitnessFriendAchievements);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12010, _AddiOSVersionToFHIRResources);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12011, _AddCondenserDateToWorkoutEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12012, _AddHFDKeyToSeriesSampleEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12013, _CreateClinicalRecordEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12014, _MakeQuantitySampleSeriesEntityHFDKeyUnique);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12015, _CreateQuantitySampleSeriesUnfrozenIndex);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12016, _RemoveLegacyAchievements);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12017, _HDMigrateClinicalSources);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12018, _MakeSeriesSampleEntityHFDKeyUnique);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 12019, _HDAddHealthRecordsAccountCount);
}

- (void)azul_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14000, _HDUpdateClientSideDataCollectionLastCollectedDatum);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14001, _HDAddShouldCollectEventsColumnToWorkoutBuildersTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14002, _HDAddOnboardingCompletionTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14003, _HDResetAnchorsForCloudSyncStoresWithGaps);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14004, _HDResetReceivedNanoSyncAnchorsForCategoryAndQuantitySamples);
}

- (void)azul_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14000, _HDAddSleepScheduleTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14001, _HDAddECGSampleTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14002, _HDAddContributorsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14003, _HDAddDeviceRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14004, _HDAddProtectedOnboardingCompletionTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14005, _HDAddFHIRVersionToClinicalRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 14006, _HDAddContributorsColumnToProvenance, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14007, _HDCreatePartialIndexForDeletedObjects);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14008, _HDAddAppleIDAndCallerIDToContributorsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14009, _HDAddECGSymptomsColumnToECGSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14010, _HDMigrateECGClassificationAverageHRAndPayload);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14011, _HDRemovePlaceholderAndAddSyncProvenanceToContributorsTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 14013, _HDAddFirstSeenDateToOriginalFHIRResourcesTable, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14014, _HDAddCoverageRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14015, _HDAddSCWIColumnToFriendWorkoutTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 14016, _HDAddRequestedScopeToClinicalCredentialsTable, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14021, _HDFixInvalidContributorInDataProvenancesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14025, _HDAddOverrideDayIndexRemoveWindDownFromSleepScheduleTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14026, _HDUpdateMedicalRecordsCoverageDiagnosticreportProcedureTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14028, _HDRepairECGSymptomsStatus);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14029, _HDMigrateAndDeleteProtectedOnboardingCompletionTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14030, _HDRecreateCHRConditionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14031, _HDUpdateSleepAndAppetiteChangesCategoryValues);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14032, _HDRepairECGSymptomsStatusForNilSymptomsMetadata);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14035, _HDUpdateNullTypeValesInObjectsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14200, _HDRenameSCWIAndAddSeymourMediaTypeColumnToFriendWorkoutTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 14201, _HDUpdateCoverageAddIdentifierColumnsTable);
}

- (id)emetUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke;
  v9[3] = &unk_1E6CF2E90;
  v9[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11203, 11300, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke_2;
  v8[3] = &unk_1E6CF2E90;
  v8[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11300, 11301, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE sync_anchors RENAME TO sync_anchors_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER NOT NULL, acked INTEGER NOT NULL, received INTEGER NOT NULL, schema TEXT NOT NULL, type INTEGER NOT NULL, store INTEGER NOT NULL, epoch INTEGER NOT NULL, UNIQUE(store, epoch, type, schema));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO sync_anchors (next, acked, received, schema, type, store, epoch) SELECT next, acked, received, 'main', type, store, epoch FROM sync_anchors_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE sync_anchors_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DROP TABLE IF EXISTS subscription_data_anchors"), a3) ^ 1);
  return result;
}

- (id)emetProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke;
  v21[3] = &unk_1E6CF2E90;
  v21[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 11200, 11300, v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_2;
  v20[3] = &unk_1E6CF2E90;
  v20[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11300, 11301, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_3;
  v19[3] = &unk_1E6CF2E90;
  v19[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11301, 11302, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_4;
  v18[3] = &unk_1E6CF2E90;
  v18[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11302, 11303, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_5;
  v17[3] = &unk_1E6CF2E90;
  v17[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11303, 11304, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_6;
  v16[3] = &unk_1E6CF2E90;
  v16[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11304, 11305, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_7;
  v15[3] = &unk_1E6CF2E90;
  v15[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11305, 11306, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_8;
  v14[3] = &unk_1E6CF2E90;
  v14[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11306, 11307, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_t *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  char v25;
  id v26;
  int v27;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("termbase.sqlite"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v9, 0);

  objc_msgSend(v3, "transaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "deleteDataEntitySubclassTablesIfExist:intermediateTables:error:", &unk_1E6DF93E0, &unk_1E6DF93F8, a3)&& objc_msgSend(v12, "deleteDataEntitySubclassTablesIfExist:intermediateTables:error:", &unk_1E6DF9410, &unk_1E6DF9428, a3))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "transaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "protectedDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dumpSchemaWithError:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v29 = v12;
      v30 = v3;
      v31 = a3;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = objc_msgSend(&unk_1E6DF9440, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        v20 = (os_log_t *)MEMORY[0x1E0CB52B0];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(&unk_1E6DF9440);
            v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            if ((objc_msgSend(MEMORY[0x1E0D29850], "databaseSchemas:containTable:", v16, v22) & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v23);

            }
            else
            {
              _HKInitializeLogging();
              v24 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v22;
                _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "Skipping deletion from nonexistent table \"%@\", buf, 0xCu);
              }
            }
          }
          v18 = objc_msgSend(&unk_1E6DF9440, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v18);
      }
      v25 = objc_msgSend(v30, "executeSQLStatements:error:", v13, v31);

      if ((v25 & 1) != 0)
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE medical_records (data_id INTEGER PRIMARY KEY, note TEXT, entered_in_error INTEGER NON NULL, modified_date REAL, fhir_identifier BLOB, refinement_version BLOB, sort_date REAL NON NULL, sort_date_key_path TEXT NON NULL)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE account_owner_samples (data_id INTEGER PRIMARY KEY, name TEXT NOT NULL, birth_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE allergy_record_samples (data_id INTEGER PRIMARY KEY, allergy_codings BLOB NOT NULL, onset_date BLOB, asserter TEXT, reactions BLOB, criticality_coding BLOB, last_occurence_date BLOB, recorded_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE condition_record_samples (data_id INTEGER PRIMARY KEY, condition_codings BLOB NOT NULL, category_codings BLOB NOT NULL, asserter TEXT, abatement BLOB, onset BLOB, recorded_date BLOB, clinical_status_coding BLOB, verification_status_coding BLOB, severity_codings BLOB, body_sites_codings BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE diagnostic_test_report_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB, panel_name TEXT NOT NULL, results BLOB, effective_start_date BLOB, status BLOB NOT NULL, effective_end_date BLOB, issue_date BLOB NOT NULL)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE diagnostic_test_result_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB NOT NULL, value BLOB, reference_ranges BLOB, effective_start_date BLOB, category TEXT NOT NULL, issue_date BLOB, effective_end_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE medication_dispense_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, quantity BLOB, preparation_date BLOB, hand_over_date BLOB, dosage_instructions BLOB, status_coding BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE medication_order_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, prescriber TEXT, number_of_fills INTEGER NOT NULL, signetur TEXT, written_date BLOB, ended_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE medication_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, assertion_type TEXT, asserter TEXT, assertion_date BLOB, dosage TEXT, not_taken INTEGER NOT NULL, effective_start_date BLOB, effective_end_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE procedure_record_samples (data_id INTEGER PRIMARY KEY, procedure_codings BLOB NOT NULL, orderer TEXT, order_date BLOB, performer TEXT, organization TEXT, execution_start_date BLOB, outcome TEXT, complications BLOB NOT NULL, reasons BLOB NOT NULL, not_performed INTEGER NOT NULL, execution_end_date BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE vaccination_record_samples (data_id INTEGER PRIMARY KEY, vaccination_codings BLOB NOT NULL, expiration_date BLOB, dose_number TEXT, dose_quantity TEXT, performer TEXT, body_site_coding BLOB, reaction TEXT, not_given INTEGER NOT NULL, administration_date BLOB NOT NULL, status_coding BLOB, patient_reported INTEGER NOT NULL, route_codings BLOB, reasons_codings BLOB, reasons_not_given_codings BLOB)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE unknown_record_samples (data_id INTEGER PRIMARY KEY, display_name TEXT)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE clinical_gateways (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, external_id TEXT NOT NULL, last_reported_status INTEGER NOT NULL, revision INTEGER NOT NULL, raw_content BLOB NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_provenance INTEGER NOT NULL, UNIQUE(external_id))"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE clinical_accounts (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, identifier BLOB NOT NULL UNIQUE, user_enabled_flag INTEGER NOT NULL, relogin_needed_flag INTEGER NOT NULL, creation_date REAL NOT NULL, last_fetch_date REAL, last_full_fetch_date REAL, last_submitted_rowid INTEGER, last_extracted_rowid INTEGER, last_extracted_rules_version INTEGER, credential_id INTEGER REFERENCES clinical_credentials (ROWID) ON DELETE SET NULL, gateway_id INTEGER NOT NULL UNIQUE REFERENCES clinical_gateways (ROWID) ON DELETE NO ACTION, sync_identifier BLOB NOT NULL UNIQUE, modification_date REAL NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_provenance INTEGER NOT NULL)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE clinical_deleted_accounts (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_identifier BLOB NOT NULL, deletion_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, UNIQUE(sync_identifier))"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE fhir_resources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT NOT NULL, account_id INTEGER NOT NULL REFERENCES clinical_accounts (ROWID) ON DELETE CASCADE, id TEXT NOT NULL, sync_provenance INTEGER NOT NULL, raw_content BLOB NOT NULL, fhir_version TEXT NOT NULL, received_date REAL NOT NULL, received_date_timezone TEXT NOT NULL, UNIQUE(type, account_id, id))"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE clinical_credentials (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, access_token BLOB NOT NULL, token_type TEXT NOT NULL, refresh_token BLOB, expiration_date REAL, scope TEXT, patient_id TEXT, creation_date REAL NOT NULL)"));
        objc_msgSend(v26, "addObject:", CFSTR("CREATE TABLE clinical_authorization_sessions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, query TEXT NOT NULL, state BLOB NOT NULL UNIQUE, code TEXT, creation_date REAL NOT NULL, gateway_id INTEGER REFERENCES clinical_gateways (ROWID) ON DELETE CASCADE, account_id INTEGER REFERENCES clinical_accounts (ROWID) ON DELETE CASCADE, CHECK ((account_id IS NULL AND gateway_id IS NOT NULL) OR (account_id IS NOT NULL AND gateway_id IS NULL)))"));
        v27 = objc_msgSend(v30, "executeSQLStatements:error:", v26, v31);

        return v27 ^ 1u;
      }
      return 1;
    }

  }
  return 1;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke;
  v11[3] = &unk_1E6CE8D20;
  v12 = v5;
  v13 = v3;
  v8 = v5;
  LODWORD(a3) = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid, metadata FROM workout_events WHERE metadata IS NOT NULL"), a3, 0, v11);

  v9 = a3 ^ 1;
  return v9;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  if (!-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](*(void **)(a1 + 32), CFSTR("medical_records"), &unk_1E6DF9368, CFSTR("CREATE TABLE medical_records (data_id INTEGER PRIMARY KEY, note TEXT, entered_in_error INTEGER NON NULL, modified_date REAL, fhir_identifier TEXT NON NULL, extraction_version INTEGER NON NULL, sort_date REAL NON NULL, sort_date_key_path TEXT NON NULL)"), a3))return 1;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(&unk_1E6DFEF28, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(&unk_1E6DFEF28, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, v10, &unk_1E6DF9380, v11, a3);

        if (!(_DWORD)v10)
        {
          v12 = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](result, CFSTR("procedure_record_samples"), &unk_1E6DF9398, CFSTR("CREATE TABLE procedure_record_samples (data_id INTEGER PRIMARY KEY, procedure_codings BLOB NOT NULL, performers BLOB, execution_start_date BLOB, execution_end_date BLOB, not_performed INTEGER NOT NULL, status_coding BLOB NOT NULL, category_codings BLOB, reason_codings BLOB, reasons_not_performed_codings BLOB, outcome_codings BLOB, complications_codings BLOB, follow_ups_codings BLOB, body_sites_codings BLOB)"), a3) ^ 1);
  return result;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](result, CFSTR("diagnostic_test_result_samples"), &unk_1E6DF93B0, CFSTR("CREATE TABLE IF NOT EXISTS diagnostic_test_result_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB NOT NULL, value BLOB, reference_ranges BLOB, effective_start_date BLOB, category TEXT NOT NULL, issue_date BLOB, effective_end_date BLOB, status_coding BLOB NOT NULL, interpretation_codings BLOB, comments TEXT, body_site_codings BLOB, method_codings BLOB, performers BLOB)"), a3) ^ 1);
  return result;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE fhir_resources ADD COLUMN source_url TEXT"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE fhir_resources ADD COLUMN extraction_hints INTEGER"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS fhir_resources_last_seen (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, resource_id INTEGER NOT NULL REFERENCES fhir_resources(ROWID) ON DELETE CASCADE, last_seen_date REAL NOT NULL)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  if (-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](*(void **)(a1 + 32), CFSTR("medication_record_samples"), &unk_1E6DF93C8, CFSTR("CREATE TABLE medication_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, assertion_type INTEGER NOT NULL, asserter TEXT, assertion_date BLOB, status_coding BLOB NOT NULL, dosages BLOB, reason_for_use_codings BLOB, not_taken INTEGER NOT NULL, reasons_not_taken_codings BLOB, effective_start_date BLOB, effective_end_date BLOB, earliest_dosage_date BLOB)"), a3)&& -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, CFSTR("medication_dispense_record_samples"), &unk_1E6DF93C8, CFSTR("CREATE TABLE medication_dispense_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, quantity_dispensed BLOB, preparation_date BLOB, hand_over_date BLOB, dosages BLOB, earliest_dosage_date BLOB, status_coding BLOB, days_supply_quantity BLOB)"), a3))
  {
    return -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, CFSTR("medication_order_samples"), &unk_1E6DF93C8, CFSTR("CREATE TABLE medication_order_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, prescriber TEXT, number_of_fills INTEGER NOT NULL, dosages BLOB, earliest_dosage_date BLOB, written_date BLOB, ended_date BLOB, status_coding BLOB NOT NULL, reason_codings BLOB, reason_ended_codings BLOB)"), a3) ^ 1;
  }
  return 1;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE clinical_accounts ADD patient_hash TEXT"), a3) ^ 1);
  return result;
}

uint64_t __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB18C](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, &v25);
  v9 = v25;
  v10 = *MEMORY[0x1E0CB2CD0];
  if (objc_msgSend(v8, "containsValueForKey:", *MEMORY[0x1E0CB2CD0]))
  {
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 32), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, "finishDecoding");
  if (!v9)
  {
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "hk_codableMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v27 = v6;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Failed to create codable workout event metadata for %lld", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to create codable workout event metadata"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v18);
          else
            _HKLogDroppedError();
        }

        goto LABEL_21;
      }
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "transaction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "protectedDatabase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke_204;
    v22[3] = &unk_1E6CE82D8;
    v14 = v16;
    v23 = v14;
    v24 = v6;
    v15 = objc_msgSend(v20, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE workout_events SET metadata = ? WHERE rowid = ?"), a3, v22, 0);

    goto LABEL_22;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v27 = v6;
    v28 = 2114;
    v29 = v9;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Failed to unarchive workout event metadata for %lld: %{public}@", buf, 0x16u);
  }
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_21:
    v14 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  v14 = 0;
  v15 = 0;
  *a3 = objc_retainAutorelease(v9);
LABEL_22:

  return v15;
}

uint64_t __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke_204(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 1);
  }
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

- (uint64_t)_recreateMedicalRecordTable:(void *)a3 intermediateTables:(void *)a4 creationSQL:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  _QWORD v23[5];
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT uuid, provenance, data_type FROM %@ INNER JOIN objects USING (data_id) INNER JOIN samples USING (data_id)"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "protectedDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__HDDatabaseMigrator_Emet___recreateMedicalRecordTable_intermediateTables_creationSQL_error___block_invoke;
  v23[3] = &unk_1E6CE8D20;
  v23[4] = a1;
  v24 = v13;
  v16 = v13;
  v17 = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a5, 0, v23);

  if (v17
    && (objc_msgSend(a1, "transaction"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "protectedDatabase"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "deleteDataEntitySubclassTable:intermediateTables:error:", v9, v10, a5),
        v19,
        v18,
        v20))
  {
    v21 = objc_msgSend(a1, "executeSQL:error:", v11, a5);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __93__HDDatabaseMigrator_Emet___recreateMedicalRecordTable_intermediateTables_creationSQL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, sqlite3_stmt *);
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;

  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v10 = v7;
  if (v9)
  {
    v11 = v5;
    v33 = v6;
    v12 = v6;
    v13 = v8;
    objc_msgSend(v9, "transaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "protectedDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke;
    v42[3] = &unk_1E6CE9508;
    v17 = v11;
    v43 = v17;
    v18 = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM objects where uuid = ?"), a3, v42, 0);

    if (v18)
    {
      objc_msgSend(v9, "transaction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "protectedDatabase");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v16;
      v36 = 3221225472;
      v37 = __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke_2;
      v38 = &unk_1E6CE7C30;
      v39 = v17;
      v40 = v12;
      v41 = v13;
      v21 = objc_msgSend(v20, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO objects (uuid, provenance, type, creation_date) VALUES (?, ?, ?, ?);"),
              a3,
              &v35,
              0);

      v22 = 0;
      if (v21)
      {
        objc_msgSend(v9, "transaction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "protectedDatabase");
        v32 = v12;
        v24 = v5;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastInsertRowID");
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v5 = v24;
        v12 = v32;

      }
    }
    else
    {
      v22 = 0;
      v21 = 0;
    }

    v26 = v22;
    if (v21)
    {
      objc_msgSend(v9, "transaction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "protectedDatabase");
      v28 = v5;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __119__HDDatabaseMigrator_Emet___insertDeletedSampleTombstoneWithUUID_provenanceIdentifier_dataTypeCode_deletionDate_error___block_invoke;
      v38 = &unk_1E6CE7750;
      v39 = v26;
      v40 = v10;
      v30 = objc_msgSend(v29, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO samples (data_id, data_type, start_date, end_date) VALUES (?, ?, ?, ?);"),
              a3,
              &v35,
              0);

      v5 = v28;
    }
    else
    {
      v30 = 0;
    }
    v6 = v33;

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

uint64_t __119__HDDatabaseMigrator_Emet___insertDeletedSampleTombstoneWithUUID_provenanceIdentifier_dataTypeCode_deletionDate_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_null(a2, 3);
  return sqlite3_bind_null(a2, 4);
}

uint64_t __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 2);
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)sky_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15000, _HDAddCloudSyncStoreShardColumns);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15001, _HDAddCKRecordCacheTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15002, _HDAddOnboardingCompletionsCountryCodeProvenanceColumn);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15003, _HDAddAppSDKVersionFlagColumn);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 15004, _HDAddNeedsFetchColumnToCachedCKRecordZoneEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15005, _HDResetUnprotectedCKRecordCache);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 15006, _HDAddZoneStateColumnToCachedCKRecordZoneEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 15007, _HDAddUserRecordIDToCKDatabaseCache, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15500, _HDAddEpochManagementForCloudCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15501, _HDAddWorkoutBuilderActivitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15502, _HDFixWorkoutBuilderActivitiesForeignKey);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15503, _HDMakeWorkoutBuilderActivityEndDateNullable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15504, _HDResetUnprotectedInconsistentCloudCache);
}

- (void)sky_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15000, _HDRemoveOtherCardioFitnessMedications);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15001, _HDAddAdHocConceptTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15002, _HDAddSecureCKRecordCacheTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15003, _HDUpdateMedicalRecordsDiagnosticResultTableAddReferenceRangeStatus);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15004, _HDRecreateCHRMedicationTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15005, _HDAddSampleAggregateCacheEntitiesTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15006, _HDUpdateAllergyRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15007, _HDAddUserDomainConceptEntities);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15008, _HDAddSharingAuthorizationAndRelationshipTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15009, _HDAddAnchorDateToCachedQueriesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15010, _HDAddSummarySharingTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15011, _HDAddQuantitySeriesDataTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15012, _HDAddLocationSeriesDataTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15013, _HDAddSignedClinicalDataIssuerEntitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 15014, _HDUpdateClinicalAccountsTableForIssuerBackingAndOsloStatus, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15015, _HDAddOriginalSignedClinicalDataRecordEntitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15016, _HDAddSignedClinicalDataRecordEntitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15018, _HDUpdateMedicalRecordEntitiesTableForSCD);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15019, _HDAddSessionColumnToObjectAuthorizationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15020, _HDAddDateAcceptedToSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15021, _HDPurgeDeletedUserDomainConcepts);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15022, _HDAddClinicalAccountColumnsForFetchFailureTracking);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 15023, _HDRemoveDeletedAndSyncedColumnFromSharedSummaryTransactionsTable, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15024, _HDAddCategoryColumnToUserDomainConceptPropertyTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15025, _HDAddDisplayNameAndRenameAuthorizationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15026, _HDRenameSignedClinicalDataToVerifiableClinicalRecordsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15027, _HDAddUniquenessChecksumToOriginalSignedClinicalDataTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15028, _HDUpdateRecordSamplesAddReferenceColumn);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15029, _HDAddInvitationUUIDToSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15030, _HDAddRelevantDateAndDataValueToSignedClinicalDataTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15031, _HDRemoveInvitationNotNullConstraintFromSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15032, _HDAddOwnerParticipantToSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15033, _HDAddNotificationStatusToSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15034, _HDResetProtectedCKRecordCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15035, _HDAddDeletedAndLastModifiedDateColumnsToOriginalSignedClinicalDataTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15036, _HDMigrateCycleTrackingOnboarding);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15037, _HDResetProtectedCKRecordCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15038, _HDDeleteMedicalRecordsDiagnosticResultTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15039, _HDAddForeignKeyReferenceFromConceptIndexToObjects);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15040, _HDClearResumableQueryCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15041, _HDAddToBeDeletedColumnToSharingAuthorizationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15042, _HDMakeOriginalRecordsRawContentNullable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15043, _HDAddUserWheelchairModeColumnToSummarySharingEntryTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15200, _HDAddDeletedColumnToClinicalCredentials);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15500, _HDAddWorkoutActivitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15502, _HDRenameWorkoutActivityForeignKey);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15504, _HDFixWorkoutActivityForeignKey);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15506, _HDSourceTypeToSignedClinicalDataTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15507, _HDAddAttachmentAndReferencesEntities);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15509, _HDAddVisionPrescriptionEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15510, _HDAddLotNumberToVaccinationRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 15511, _HDResetProtectedInconsistentCloudCache);
}

- (id)butlerUnprotectedMigrationSteps
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)butlerProtectedMigrationSteps
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HDDatabaseMigrator_Butler__butlerProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E6CEA670;
  v6[4] = self;
  HDCreateMigrationStep(10037, 10100, (uint64_t)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Butler__butlerProtectedMigrationSteps__block_invoke()
{
  return 0;
}

- (void)dawn_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17000, _HDAddDeviceContextTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17001, _HDAddUnprotectedDeviceKeyValueStorageTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17002, _HDAddIsMirroringToWorkoutSessionTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17004, _HDMigrateCycleTrackingOvulationConfirmationNotificationStateKeyValueDomainCategory);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17005, _HDMigrateCycleTrackingUnconfirmedDeviationNotificationStateKeyValueDomainCategory);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17006, _HDMigrateCycleTrackingUpdatedFertileWindowNotificationFireDateKeyValueDomainCategory);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17007, _HDAddChildSyncIdentityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17008, _HDResetAnchorsForAssociationsForNanoSync);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17009, _HDAddNotificationInstructionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17010, _HDAddTableForCloudSyncRequests);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17011, _HDAddFirstActivityConfigToWorkoutSessionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17012, _HDResetLocalDeviceSource);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17200, _HDAddAdditionalColumnsToCloudSyncRequests);
}

- (void)dawn_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17000, _HDAddLinkCollectionDataColumnToUDCTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17001, _HDAddProtectedDeviceKeyValueStorageTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17002, _HDAddWorkoutZonesSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17003, _HDAddWorkoutZonesAssociationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17004, _HDMigrateCycleTrackingKeyValueDomainCategory);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17005, _HDAddHashedMedicationIdentifierToMedicationDoseEventTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17006, _HDAddStateOfMindSamplesTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17007, _HDAddScoredAssessmentSamplesTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17008, _HDRemoveOnDeleteCascadeFromAssociationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 17009, _HDMigrateClinicalAccountSyncAnchors, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 17010, _HDMigrateClinicalGatewaySyncAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 17011, _HDMigrateOriginalResources, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 17012, _HDMigrateOriginalSignedClinicalDataRecords, 1);
}

- (void)crystal_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18000, _HDResetAllReceivedSyncAnchorsOnVisionDevices);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18001, _HDAddClientOptionsToAlarmEventsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18003, _HDAddLastAssociationAnchorToSubscriptions);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18004, _HDResetReceivedNanoSyncAnchorsOnWatchForActivityCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18005, _HDResetReceivedNanoSyncAnchorsOnWatch);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18006, _HDUpdateSDKVersionTokenFieldOnSubscriptionsTable);
}

- (void)crystal_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18000, _HDAddRPEFieldsToAssociationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18001, _HDAddPauseRingsScheduleTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18002, _HDAddPauseColumnToActivityCache);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18003, _HDAddActivityGoalSchedulesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18005, _HDUpdateTypeAndCreationDateFieldOnAssociationsTableForWorkoutEffortChildren);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 18006, _HDUpdateTypeAndCreationDateFieldOnAssociationsTableForNonWorkoutEffortChildren);
}

- (id)cinarUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke;
  v13[3] = &unk_1E6CEA670;
  v13[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 11013, 11200, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_2;
  v12[3] = &unk_1E6CEA670;
  v12[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11200, 11201, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_3;
  v11[3] = &unk_1E6CEA670;
  v11[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11201, 11202, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_4;
  v10[3] = &unk_1E6CEA670;
  v10[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11202, 11203, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v19, "addObject:", CFSTR("ALTER TABLE sources RENAME TO sources_old;"));
  objc_msgSend(v19, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT NOT NULL, name TEXT NOT NULL, source_options INTEGER NOT NULL, local_device INTEGER NOT NULL, product_type TEXT NOT NULL, deleted INTEGER NOT NULL, mod_date REAL NOT NULL, provenance INTEGER NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_primary INTEGER NOT NULL);"));
  objc_msgSend(v19, "addObject:", CFSTR("INSERT INTO sources SELECT ROWID, uuid, bundle_id, name, source_options, local_device, product_type, deleted, mod_date, provenance, sync_anchor, 0 FROM sources_old;"));
  objc_msgSend(v19, "addObject:", CFSTR("DROP TABLE sources_old;"));
  objc_msgSend(v19, "addObject:", CFSTR("UPDATE sources SET sync_primary = 1 WHERE deleted = 1;"));
  if ((objc_msgSend(v3, "executeSQLStatements:error:", v19, a3) & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "transaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unprotectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke;
    v27[3] = &unk_1E6CFD9A8;
    v18 = v5;
    v28 = v18;
    v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, bundle_id, (provenance <> 0) as is_remote FROM sources WHERE deleted = 0 ORDER BY bundle_id, is_remote, ROWID;"),
           a3,
           0,
           v27);

    if ((v8 & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v18, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v10)
      {
        v17 = v5;
        v11 = *(_QWORD *)v24;
        v20 = 1;
        obj = v9;
LABEL_6:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
          objc_msgSend(v3, "transaction", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "unprotectedDatabase");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke_2;
          v22[3] = &unk_1E6CEA6E8;
          v22[4] = v13;
          LOBYTE(v13) = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE sources SET sync_primary = 1 WHERE ROWID = ?;"),
                          a3,
                          v22,
                          0);

          if ((v13 & 1) == 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
            if (v10)
              goto LABEL_6;
            v20 = 0;
            break;
          }
        }
        v9 = obj;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 1;
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

void *__59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE sources SET bundle_id = '', name = '', product_type = '', source_options = 0 WHERE deleted = 1;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("DROP INDEX IF EXISTS sources_bundle_id_uuid"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX sources_bundle_id_uuid ON sources (bundle_id, uuid)"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP INDEX IF EXISTS datatype_source_order_data_type"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX datatype_source_order_data_type ON datatype_source_order (data_type, ROWID)"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE source_devices RENAME TO source_devices_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE source_devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, manufacturer TEXT NOT NULL, model TEXT NOT NULL, hardware TEXT NOT NULL, firmware TEXT NOT NULL, software TEXT NOT NULL, localIdentifier TEXT NOT NULL, FDAUDI TEXT NOT NULL, creation_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, uuid BLOB UNIQUE NOT NULL, UNIQUE(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, sync_provenance, uuid));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT OR REPLACE INTO source_devices (ROWID, name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) SELECT * FROM source_devices_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE source_devices_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v19;
  id v20;
  id obj;
  _QWORD aBlock[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke;
  v27[3] = &unk_1E6CFD9A8;
  v20 = v5;
  v28 = v20;
  v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid FROM sources WHERE bundle_id LIKE 'com.apple.private.health.localdevice'"), a3, 0, v27);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE sources SET bundle_id = 'com.apple.health.' || %@(uuid), sync_anchor = COALESCE((SELECT MAX(sync_anchor) + 1 FROM sources), 1) WHERE rowid = ?"), *MEMORY[0x1E0D297A8], v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v20;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      v19 = 1;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke_2;
        aBlock[3] = &unk_1E6CEA6E8;
        aBlock[4] = v13;
        v14 = _Block_copy(aBlock);
        objc_msgSend(v3, "transaction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "unprotectedDatabase");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a3, v14, 0);

        if ((v17 & 1) == 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

uint64_t __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

  }
  return 1;
}

uint64_t __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

uint64_t __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

uint64_t __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

- (id)cinarProtectedMigrationSteps
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HDDatabaseMigrator_Cinar__cinarProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E6CEA670;
  v6[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11051, 11200, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Cinar__cinarProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE object_authorizations RENAME TO object_authorizations_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS object_authorizations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, object BLOB NOT NULL REFERENCES objects (uuid) ON DELETE CASCADE, source BLOB NOT NULL, status INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, modification_date REAL NOT NULL, UNIQUE(object, source, sync_provenance));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT OR REPLACE INTO object_authorizations (ROWID, object, source, status, sync_provenance, modification_date) SELECT * FROM object_authorizations_old ORDER BY ROWID;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE object_authorizations_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX IF NOT EXISTS activity_caches_cache_index ON activity_caches (cache_index);"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

- (void)sydney_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16000, _HDAddVersionFieldsToSyncAnchorEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16001, _HDResetWorkoutSyncAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16002, _HDChangeForeignKeyOnBuilderStatisticsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16003, _HDAddSyncIdentityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16004, _HDAddLogicalSourceEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16005, _HDAddWorkoutAssociatedObjectTimestampColumn);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16006, _HDAddLogicalSourceOrderEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16007, _HDAddMultiActivityFieldsToWorkoutSessionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16008, _HDValidatedAnchorsToSyncAnchorEntityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16009, _HDAddRequestedDatesToWorkoutSessionsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16010, _HDAddUnprotectedWorkoutOwnerIndices);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16011, _HDRefactorSourcesToAddLogicalSourceID, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16012, _HDSwapDataTypeSourceOrderToLogicalSourceOrder);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16013, _HDAddSourceIndices);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16014, _HDAddLegacySyncIdentityToSyncIdentityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16015, _HDSyncIdentityUpdateForDeviceEntity);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16016, _HDSyncIdentityUpdateForSourceEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16017, _IncrementSourceOrderSyncAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16200, _HDSyncIdentityUpdateForLogicalSourceOrderEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16201, _HDSyncIdentityUpdateForAuthorizationEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16202, _HDSyncIdentityUpdateForOnboardingCompletionEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16203, _HDSyncIdentityUpdateForUnProtectedKeyValueEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16204, _HDResetAllReceivedSyncAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16400, _HDAddSyncIdentityToCloudSyncStoreEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16500, _HDResetAnchorsForAssociationsForNanoSync_0);
}

- (void)sydney_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16000, _HDAddAttachmentAndReferencesEntities_0);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16001, _HDAddVisionPrescriptionEntityTable_0);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16002, _HDAddWorkoutStatisticsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16003, _HDCopyWorkoutTotalsToPrimaryActivity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16004, _HDAddUDCLocalizedStringTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16005, _HDModifyConceptIndexTableOntologyVersionColumn);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16006, _HDAddSyncProvenanceToCredentialsTable, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16007, _HDAddClinicalAccountEventsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16008, _HDAddMedicationDoseEventSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16009, _HDFixWorkoutStatisticsForeignKey);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16010, _HDAddMedicationUUIDToMedicationDoseEventSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16011, _HDAddAttachmentMetadata);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16012, _HDAddAttachmentEncryptionKeyColumn);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16013, _HDAddDisplaySubtitleColumn);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16014, _HDAddNotNullConstraintsToAttachmentsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16015, _HDAddProtectedWorkoutOwnerIndices);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16016, _HDFixLapLengthColumnInActivitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16017, _HDDeleteHearingReductionSamples);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16018, _HDMigrateBloodPressureIdentifierAuthorizationsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16019, _HDAddUserDomainConceptEducationContentTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16020, _HDAddVersionColumnToActivityCacheTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16021, _HDUpdateClinicalRecordEntities);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16022, _HDRecreateSeriesDataTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16024, _HDUpdateGlassesTypeToGlassesDecription);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16026, _HDUpdateMedicalRecordsDiagnosticReportTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16028, _HDUpdateMissingDurationInWorkoutActivitiesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16029, _HDUpdateMedicalRecordEntitiesTableWithOrigin);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16030, _HDSanitizeHFDRebuildState);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16031, _HDMigrateHFDToSQLite);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16032, _HDAddSourceURLIndexToOriginalFHIRResourcesTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16033, _HDDeleteRunningStrideLengthSamples);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16034, _HDAddUserDomainConceptNamedQuantityTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16035, _HDDeleteDeprecated261Samples);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16036, _HDDeleteDeprecated261WorkoutStatistics);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16037, _HDDeleteArchivalHFD);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16038, _HDMoveAdHocConceptIntoCorrectIDNamespace);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16039, _HDForceMedicalRecordReextractionToRelinkUDCs);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16040, _HDFixStatisticsAndRemoveUnusedColumnsFromWorkoutsTable, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16041, _HDMoveGlassesDescriptionToMetadata);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16042, _HDDropDeprecatedUDCPropertyTypesFromPropertyTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16044, _HDAddSchemaVersionToAttachmentReferences);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16045, _HDMigrateUDCPreferredNameProperties);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16200, _HDAddCHRAccountsDeletionReason);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16201, _HDSyncIdentityUpdateForSignedClinicalDataIssuersEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16202, _HDSyncIdentityUpdateForOriginalSignedClinicalDataRecordEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16203, _HDSyncIdentityUpdateForUserDomainConceptEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16204, _HDSyncIdentityUpdateForOriginalFHIRResourceEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16205, _HDSyncIdentityUpdateForFHIRCredentialEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16206, _HDSyncIdentityUpdateForClinicalGatewayEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16207, _HDSyncIdentityUpdateForClinicalDeletedAccountEntity);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16208, _HDSyncIdentityUpdateForClinicalAccountEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16209, _HDSyncIdentityUpdateForSharingRelationshipEntity);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16210, _HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities, 1);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16211, _HDSyncIdentityUpdateForDataProvenanceEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16212, _HDSyncIdentityUpdateForContributorEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16213, _HDSyncIdentityUpdateForProtectedKeyValueEntity);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16214, _HDSyncIdentityUpdateForObjectAuthorizationEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16400, _HDAddVerifiableDataToVisionPrescriptionEntity);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16401, _HDAddMedicalDownloadableAttachmentsTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16402, _HDAddClinicalNoteRecordSamplesTable);
  -[HDDatabaseMigrator addMigrationTo:function:foreignKeys:](self, "addMigrationTo:function:foreignKeys:", 16403, _HDAddUniquenessChecksumToOriginalFHIRResourceEntity, 1);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16404, _HDAdvanceUDCSyncAnchors);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 16405, _HDAddPKCEVerifierToAuthSession);
}

- (void)future_addUnprotectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100000, _HDAddProfileAuthorizationTable);
}

- (void)future_addProtectedMigrationSteps
{
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100001, _HDAddCarePlanAndGoalRecordSamplesTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100002, _HDMovedCoverageOutOfFuture);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100003, _HDAddDeviceRecordSamplesTable_0);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100013, _HDAddMedicalHealthTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100014, _HDAddMedicalHealthConcreteRecordTables);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100015, _HDAddMedicalHealthLabResultTable);
  -[HDDatabaseMigrator addMigrationTo:function:](self, "addMigrationTo:function:", 100017, _HDAddEncounterRecordTable);
}

- (HDDatabaseMigrator)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HDDatabaseMigrator)initWithTransaction:(id)a3
{
  id v6;
  HDDatabaseMigrator *v7;
  HDDatabaseMigrator *v8;
  HDDatabaseSchemaManager *v9;
  HDDatabaseSchemaManager *schemaManager;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrator.mm"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HDDatabaseMigrator;
  v7 = -[HDDatabaseMigrator init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_transaction, a3);
    v9 = -[HDDatabaseSchemaManager initWithTransaction:]([HDDatabaseSchemaManager alloc], "initWithTransaction:", v8->_transaction);
    schemaManager = v8->_schemaManager;
    v8->_schemaManager = v9;

  }
  return v8;
}

- (_HKBehavior)behavior
{
  return -[HDDatabaseMigrationTransaction behavior](self->_transaction, "behavior");
}

- (void)addPrimaryMigrationSteps
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  void *v38;
  HDDatabaseMigrator *v39;

  v3 = -[HDDatabaseMigrationTransaction isProtectedMigration](self->_transaction, "isProtectedMigration");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v34 = (id)objc_opt_new();
    v35 = v4;
    v36 = 3221225472;
    v37 = __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke;
    v38 = &unk_1E6CEA670;
    v39 = self;
    +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8041, 8046, &v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v5);

    +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8046, 8047, &__block_literal_global_216);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v6);

    -[HDDatabaseMigrator okemoZursProtectedMigrationSteps](self, "okemoZursProtectedMigrationSteps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v7);

    -[HDDatabaseMigrator monarchProtectedMigrationSteps](self, "monarchProtectedMigrationSteps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v8);

    -[HDDatabaseMigrator boulderProtectedMigrationSteps](self, "boulderProtectedMigrationSteps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v9);

    -[HDDatabaseMigrator eagleProtectedMigrationSteps](self, "eagleProtectedMigrationSteps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v10);

    -[HDDatabaseMigrator whitetailProtectedMigrationSteps](self, "whitetailProtectedMigrationSteps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v11);

    -[HDDatabaseMigrator butlerProtectedMigrationSteps](self, "butlerProtectedMigrationSteps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v12);

    -[HDDatabaseMigrator corryProtectedMigrationSteps](self, "corryProtectedMigrationSteps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v13);

    -[HDDatabaseMigrator erieProtectedMigrationSteps](self, "erieProtectedMigrationSteps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v14);

    -[HDDatabaseMigrator tigrisProtectedMigrationSteps](self, "tigrisProtectedMigrationSteps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v15);

    -[HDDatabaseMigrator cinarProtectedMigrationSteps](self, "cinarProtectedMigrationSteps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v16);

    -[HDDatabaseMigrator emetProtectedMigrationSteps](self, "emetProtectedMigrationSteps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v17);

    -[HDDatabaseMigrator addMigrationSteps:](self, "addMigrationSteps:", v34);
    -[HDDatabaseMigrator peace_addProtectedMigrationSteps](self, "peace_addProtectedMigrationSteps");
    -[HDDatabaseMigrator yukon_addProtectedMigrationSteps](self, "yukon_addProtectedMigrationSteps");
    -[HDDatabaseMigrator azul_addProtectedMigrationSteps](self, "azul_addProtectedMigrationSteps");
    -[HDDatabaseMigrator sky_addProtectedMigrationSteps](self, "sky_addProtectedMigrationSteps");
    -[HDDatabaseMigrator sydney_addProtectedMigrationSteps](self, "sydney_addProtectedMigrationSteps");
    -[HDDatabaseMigrator dawn_addProtectedMigrationSteps](self, "dawn_addProtectedMigrationSteps");
    -[HDDatabaseMigrator crystal_addProtectedMigrationSteps](self, "crystal_addProtectedMigrationSteps");
    -[HDDatabaseMigrator behavior](self, "behavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "futureMigrationsEnabled");

    if (v19)
      -[HDDatabaseMigrator future_addProtectedMigrationSteps](self, "future_addProtectedMigrationSteps");
  }
  else
  {
    v34 = (id)objc_opt_new();
    v35 = v4;
    v36 = 3221225472;
    v37 = __55__HDDatabaseMigrator__primaryUnprotectedMigrationSteps__block_invoke;
    v38 = &unk_1E6CEA670;
    v39 = self;
    +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8041, 8044, &v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v20);

    -[HDDatabaseMigrator okemoZursUnprotectedMigrationSteps](self, "okemoZursUnprotectedMigrationSteps");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v21);

    -[HDDatabaseMigrator monarchUnprotectedMigrationSteps](self, "monarchUnprotectedMigrationSteps");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v22);

    -[HDDatabaseMigrator boulderUnprotectedMigrationSteps](self, "boulderUnprotectedMigrationSteps");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v23);

    -[HDDatabaseMigrator eagleUnprotectedMigrationSteps](self, "eagleUnprotectedMigrationSteps");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v24);

    -[HDDatabaseMigrator whitetailUnprotectedMigrationSteps](self, "whitetailUnprotectedMigrationSteps");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v25);

    -[HDDatabaseMigrator butlerUnprotectedMigrationSteps](self, "butlerUnprotectedMigrationSteps");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v26);

    -[HDDatabaseMigrator corryUnprotectedMigrationSteps](self, "corryUnprotectedMigrationSteps");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v27);

    -[HDDatabaseMigrator erieUnprotectedMigrationSteps](self, "erieUnprotectedMigrationSteps");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v28);

    -[HDDatabaseMigrator tigrisUnprotectedMigrationSteps](self, "tigrisUnprotectedMigrationSteps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v29);

    -[HDDatabaseMigrator cinarUnprotectedMigrationSteps](self, "cinarUnprotectedMigrationSteps");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v30);

    -[HDDatabaseMigrator emetUnprotectedMigrationSteps](self, "emetUnprotectedMigrationSteps");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v31);

    -[HDDatabaseMigrator addMigrationSteps:](self, "addMigrationSteps:", v34);
    -[HDDatabaseMigrator peace_addUnprotectedMigrationSteps](self, "peace_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator yukon_addUnprotectedMigrationSteps](self, "yukon_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator azul_addUnprotectedMigrationSteps](self, "azul_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator sky_addUnprotectedMigrationSteps](self, "sky_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator sydney_addUnprotectedMigrationSteps](self, "sydney_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator dawn_addUnprotectedMigrationSteps](self, "dawn_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator crystal_addUnprotectedMigrationSteps](self, "crystal_addUnprotectedMigrationSteps");
    -[HDDatabaseMigrator behavior](self, "behavior");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "futureMigrationsEnabled");

    if (v33)
      -[HDDatabaseMigrator future_addUnprotectedMigrationSteps](self, "future_addUnprotectedMigrationSteps");
  }

}

- (void)addMigrationTo:(int64_t)a3 foreignKeys:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[HDDatabaseMigrationStep initForSchema:toVersion:requiringVersion:foreignKeys:handler:]([HDDatabaseMigrationStep alloc], "initForSchema:toVersion:requiringVersion:foreignKeys:handler:", 0, a3, -1, a4, v8);
  v11[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseMigrator addMigrationSteps:](self, "addMigrationSteps:", v10);

}

- (void)addMigrationTo:(int64_t)a3 function:(void *)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HDDatabaseMigrator_addMigrationTo_function___block_invoke;
  v4[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v4[4] = a4;
  -[HDDatabaseMigrator addMigrationTo:foreignKeys:handler:](self, "addMigrationTo:foreignKeys:handler:", a3, 0, v4);
}

uint64_t __46__HDDatabaseMigrator_addMigrationTo_function___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)addMigrationTo:(int64_t)a3 function:(void *)a4 foreignKeys:(int64_t)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HDDatabaseMigrator_addMigrationTo_function_foreignKeys___block_invoke;
  v5[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v5[4] = a4;
  -[HDDatabaseMigrator addMigrationTo:foreignKeys:handler:](self, "addMigrationTo:foreignKeys:handler:", a3, a5, v5);
}

uint64_t __58__HDDatabaseMigrator_addMigrationTo_function_foreignKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)addMigrationForSchema:(id)a3 toVersion:(int64_t)a4 foreignKeyStatus:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[HDDatabaseMigrationStep initForSchema:toVersion:requiringVersion:foreignKeys:handler:]([HDDatabaseMigrationStep alloc], "initForSchema:toVersion:requiringVersion:foreignKeys:handler:", v10, a4, -1, a5, v11);
  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseMigrator addMigrationSteps:](self, "addMigrationSteps:", v13);

}

- (void)addLockstepMigrationForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeyStatus:(int64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  if (a4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrator.mm"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalVersion != HDSQLiteRequiredPrimarySchemaVersionAny"));

  }
  v15 = -[HDDatabaseMigrationStep initForSchema:toVersion:requiringVersion:foreignKeys:handler:]([HDDatabaseMigrationStep alloc], "initForSchema:toVersion:requiringVersion:foreignKeys:handler:", v13, a4, a5, a6, v14);
  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseMigrator addMigrationSteps:](self, "addMigrationSteps:", v16);

}

- (void)addMigrationSteps:(id)a3
{
  id v5;
  NSMutableArray *migrationSteps;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (self->_hasPerformedMigration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrator.mm"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_hasPerformedMigration"));

    v5 = v10;
  }
  migrationSteps = self->_migrationSteps;
  if (migrationSteps)
  {
    -[NSMutableArray addObjectsFromArray:](migrationSteps, "addObjectsFromArray:", v5);
  }
  else
  {
    v7 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
    v8 = self->_migrationSteps;
    self->_migrationSteps = v7;

  }
}

uint64_t __55__HDDatabaseMigrator__primaryUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _deleteDatabaseStatusForVersion:errorMessage:error:](*(_QWORD *)(a1 + 32), a2, a3);
}

- (uint64_t)_deleteDatabaseStatusForVersion:(uint64_t)a1 errorMessage:(uint64_t)a2 error:(uint64_t)a3
{
  __CFString *v6;
  uint64_t v7;

  v6 = CFSTR("Unsupported Okemo database");
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("%@ (version %ld)"), CFSTR("Unsupported Okemo database"), a2);
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _deleteDatabaseStatusForVersion:errorMessage:error:](*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke_2()
{
  return 0;
}

uint64_t __74__HDDatabaseMigrator__runMigrationStep_currentVersion_finalVersion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  __CFString *v29;
  const __CFString *v30;
  NSObject *v31;
  uint64_t v32;
  __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  BOOL v39;
  __CFString *v40;
  void *v41;
  void *v42;
  int v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  id v55;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  id v60;
  uint8_t buf[4];
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v7 = *(_QWORD *)(a1 + 72);
    v60 = 0;
    v8 = objc_msgSend(v6, "currentVersionForSchema:protectionClass:error:", v5, v7, &v60);
    v9 = (__CFString *)v60;
    if (v8 == -1)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v52 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v62 = v52;
        v63 = 2114;
        v64 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve current version for schema '%{public}@': %{public}@.", buf, 0x16u);
      }
      v11 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_52;
    }
  }
  else
  {
    v9 = 0;
    v8 = *(_QWORD *)(a1 + 64);
  }
  objc_msgSend(*(id *)(a1 + 48), "migrationHandler");
  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v13, "transaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = **(_QWORD **)(a1 + 80);
  v59 = v9;
  v16 = ((uint64_t (**)(_QWORD, void *, void *, uint64_t, __CFString **))v12)[2](v12, v13, v14, v15, &v59);
  v17 = v59;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v9 = v17;
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v20 = *(_QWORD *)(a1 + 88);
    v21 = *(_QWORD *)(a1 + 72);
    v58 = v17;
    v22 = objc_msgSend(v19, "setVersion:schema:protectionClass:error:", v20, v18, v21, &v58);
    v9 = v58;

    if (v22)
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        v24 = v23;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 40), "transaction");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isProtectedMigration");
          v27 = CFSTR("unprotected");
          if (v26)
            v27 = CFSTR("protected");
          v28 = *(const __CFString **)(a1 + 32);
          v29 = *(__CFString **)(a1 + 88);
          *(_DWORD *)buf = 138543874;
          v62 = v27;
          if (v28)
            v30 = v28;
          else
            v30 = &stru_1E6D11BB8;
          v63 = 2114;
          v64 = v30;
          v65 = 2048;
          v66 = v29;
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "Successfully migrated %{public}@ schema '%{public}@' to %ld", buf, 0x20u);

        }
      }
      if (!*(_QWORD *)(a1 + 32))
        **(_QWORD **)(a1 + 80) = *(_QWORD *)(a1 + 88);
    }
    else
    {
      _HKInitializeLogging();
      v31 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v53 = *(const __CFString **)(a1 + 32);
        if (!v53)
          v53 = &stru_1E6D11BB8;
        v54 = *(const __CFString **)(a1 + 88);
        *(_DWORD *)buf = 138543874;
        v62 = v53;
        v63 = 2048;
        v64 = v54;
        v65 = 2114;
        v66 = v9;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Data migration succeeded for '%{public}@' to %ld but setting schema version failed: %{public}@", buf, 0x20u);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 96))
  {
    v57 = v9;
    v32 = objc_msgSend(v4, "validateForeignKeysForTable:databaseName:error:", 0, 0, &v57);
    v33 = v57;

    v9 = v33;
    if (v32 == 1)
    {
      _HKInitializeLogging();
      v35 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v33;
        _os_log_fault_impl(&dword_1B7802000, v35, OS_LOG_TYPE_FAULT, "Foreign key constraint violation encountered after migration step: %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Foreign key constraint violation encountered"));
      v36 = objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)v36;
    }
    else if (v32 == 2)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v33;
        _os_log_fault_impl(&dword_1B7802000, v34, OS_LOG_TYPE_FAULT, "Error encountered when validating foreign keys: %{public}@", buf, 0xCu);
      }
    }
  }
  v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v37)
    v38 = v37 == 3;
  else
    v38 = 1;
  v11 = v38;
  if (v37)
    v39 = v37 == 3;
  else
    v39 = 1;
  if (!v39)
  {
    v55 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(main schema version %lu)"), *(_QWORD *)(a1 + 64));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "transaction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isProtectedMigration");
    v44 = *(const __CFString **)(a1 + 32);
    v45 = objc_msgSend(*(id *)(a1 + 48), "finalSchemaVersion");
    v46 = &stru_1E6D11BB8;
    v47 = CFSTR("unprotected");
    if (v44)
      v48 = v44;
    else
      v48 = &stru_1E6D11BB8;
    if (v43)
      v47 = CFSTR("protected");
    if (*(_QWORD *)(a1 + 32))
      v46 = v40;
    objc_msgSend(v41, "stringWithFormat:", CFSTR("migration of %@ (schema: %@) from %ld to %ld %@"), v47, v48, v8, v45, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v55;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error during %@"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 100, v50, v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Error missing for an unsuccessful %@"), v49);
    }

  }
LABEL_52:

  return v11;
}

- (int64_t)migrateFromVersion:(int64_t)a3 toVersion:(int64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char **v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  char v48;
  uint8_t *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  int64_t v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  void *v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  NSMutableArray *v77;
  NSMutableArray *v78;
  id v79;
  void *v80;
  void *v81;
  int64_t v82;
  id v83;
  id *v84;
  id v85;
  id v86;
  NSMutableArray *obj;
  char *obja;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t j;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  uint64_t v99;
  id v100;
  int64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 buf;
  BOOL (*v107)(uint64_t, void *);
  void *v108;
  uint64_t v109;
  uint8_t v110[32];
  __int128 v111;
  __int128 v112;
  unint64_t v113;
  uint64_t v114;
  int64_t *v115;
  unint64_t v116;
  char v117;
  uint8_t v118[32];
  __int128 v119;
  __int128 v120;
  uint8_t v121[4];
  int64_t v122;
  __int16 v123;
  int64_t v124;
  __int16 v125;
  id v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v77 = self->_migrationSteps;
  v101 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", sel__runMigrationSteps_currentVersion_expectedFinalVersion_error_, self, CFSTR("HDDatabaseMigrator.mm"), 432, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentVersion"));

    if (a5)
      goto LABEL_3;
LABEL_125:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", sel__runMigrationSteps_currentVersion_expectedFinalVersion_error_, self, CFSTR("HDDatabaseMigrator.mm"), 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_125;
LABEL_3:
  v82 = v101;
  v100 = 0;
  v78 = v77;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v78;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  v84 = a5;
  if (v8)
  {
    v97 = 0;
    v9 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v103 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v11, "schemaName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = v97;
          if (!v97)
            v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v97 = v13;
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v97, "setObject:forKeyedSubscript:", v14, v12);
          }
          objc_msgSend(v14, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v7, "addObject:", v11);
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    }
    while (v8);
  }
  else
  {
    v97 = 0;
  }

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_300);
  objc_msgSend(v97, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = 0u;
  v120 = 0u;
  memset(v118, 0, sizeof(v118));
  v85 = v16;
  v91 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", v118, v110, 16);
  if (v91)
  {
    v90 = **(_QWORD **)&v118[16];
    do
    {
      for (j = 0; j != v91; ++j)
      {
        if (**(_QWORD **)&v118[16] != v90)
          objc_enumerationMutation(v85);
        objc_msgSend(v97, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v118[8] + 8 * j));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_303_0);
        v18 = 0;
        while (v18 < objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "requiredPrimarySchemaVersion");
          v21 = v20;
          if (v20 == -1)
          {
            ++v18;
          }
          else
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v107 = ___ZL23_HDSortedMigrationStepsP7NSArrayIP23HDDatabaseMigrationStepE_block_invoke_3;
            v108 = &__block_descriptor_40_e40_B32__0__HDDatabaseMigrationStep_8Q16_B24l;
            v109 = v20;
            v22 = objc_msgSend(v7, "indexOfObjectPassingTest:", &buf);
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<HDDatabaseMigrationStep *> * _Nonnull _HDSortedMigrationSteps(NSArray<HDDatabaseMigrationStep *> * _Nonnull __strong)");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("HDDatabaseMigrator.mm"), 611, CFSTR("Unable to find a primary migration step resulting in %ld, which is required for migration step %@"), v21, v19);

            }
            v23 = v18 + 1;
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v22 + 1, v18 + 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "subarrayWithRange:", 0, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "insertObjects:atIndexes:", v25, v24);

            objc_msgSend(v17, "removeObjectsInRange:", 0, v23);
            v18 = 0;
          }

        }
        objc_msgSend(v7, "addObjectsFromArray:", v17);

      }
      v91 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", v118, v110, 16);
    }
    while (v91);
  }

  v92 = v7;
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDDatabaseMigrator transaction](self, "transaction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isProtectedMigration");
  v28 = 1;
  if (v27)
    v28 = 2;
  v95 = v28;

  v111 = 0u;
  v112 = 0u;
  memset(v110, 0, sizeof(v110));
  v29 = v92;
  v30 = 0;
  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v110, v121, 16);
  if (v31)
  {
    v32 = **(_QWORD **)&v110[16];
    while (2)
    {
      for (k = 0; k != v31; ++k)
      {
        if (**(_QWORD **)&v110[16] != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*(_QWORD *)&v110[8] + 8 * k);
        objc_msgSend(v34, "schemaName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v30, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36)
          {
            v38 = objc_msgSend(v36, "integerValue");
          }
          else
          {
            v38 = -[HDDatabaseSchemaManager currentVersionForSchema:protectionClass:error:](self->_schemaManager, "currentVersionForSchema:protectionClass:error:", v35, v95, &v100);
            if (v38 == -1)
            {

              v86 = 0;
              v40 = v98;
              goto LABEL_56;
            }
            if (!v30)
              v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v39, v35);

          }
        }
        else
        {
          v38 = v82;
        }
        if (objc_msgSend(v34, "finalSchemaVersion") > v38)
          objc_msgSend(v98, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v110, v121, 16);
      if (v31)
        continue;
      break;
    }
  }

  v40 = v98;
  v86 = v98;
LABEL_56:

  v83 = v100;
  if (!v86)
  {
    _HKInitializeLogging();
    v63 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v121 = 134218498;
      v122 = v101;
      v123 = 2048;
      v124 = a4;
      v125 = 2114;
      v126 = v83;
      _os_log_error_impl(&dword_1B7802000, v63, OS_LOG_TYPE_ERROR, "Unable to sort and prune migration steps from %ld to %ld: %{public}@.", v121, 0x20u);
    }
    v79 = v83;
    if (v79)
    {
      if (v84)
        *v84 = objc_retainAutorelease(v79);
      else
        _HKLogDroppedError();
    }
    v57 = 1;
    goto LABEL_115;
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v79 = v86;
  v41 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (!v41)
  {
LABEL_99:
    v57 = 0;
    goto LABEL_115;
  }
  v42 = &selRef__loadFeatureEvaluators;
  v96 = *(_QWORD *)v103;
LABEL_59:
  v43 = 0;
  obja = v42[20];
  v93 = v41;
  while (1)
  {
    if (*(_QWORD *)v103 != v96)
      objc_enumerationMutation(v79);
    v99 = v43;
    v44 = *(id *)(*((_QWORD *)&v102 + 1) + 8 * v43);
    if (!v84)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", obja, self, CFSTR("HDDatabaseMigrator.mm"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    }
    v45 = v101;
    v46 = objc_msgSend(v44, "finalSchemaVersion");
    objc_msgSend(v44, "schemaName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      if (objc_msgSend(v44, "requiredPrimarySchemaVersion") != -1
        && v45 != objc_msgSend(v44, "requiredPrimarySchemaVersion"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v84, 3, CFSTR("Invalid current main schema version %lu for migration step %@"), v45, v44);

        goto LABEL_112;
      }
    }
    else
    {
      if ((uint64_t)v46 > a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", obja, self, CFSTR("HDDatabaseMigrator.mm"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepFinalSchemaVersion <= finalVersion"));

        if (v45 < v46)
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v118 = 134218240;
            *(_QWORD *)&v118[4] = v46;
            *(_WORD *)&v118[12] = 2048;
            *(_QWORD *)&v118[14] = a4;
            _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "Skipping migration step to %ld because expected current schema version is %ld.", v118, 0x16u);
          }
        }
LABEL_96:

        goto LABEL_97;
      }
      if (v45 >= v46)
        goto LABEL_96;
    }
    v48 = 0;
    *(_QWORD *)v118 = 0;
    *(_QWORD *)&v118[8] = v118;
    *(_QWORD *)&v118[16] = 0x2020000000;
    v49 = &v118[24];
    *(_QWORD *)&v118[24] = 1;
    while (1)
    {
      *(_QWORD *)v49 = 1;
      if (objc_msgSend(v44, "foreignKeyStatus") == 1)
        break;
LABEL_74:
      -[HDDatabaseMigrator transaction](self, "transaction");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "isProtectedMigration"))
      {
        -[HDDatabaseMigrator transaction](self, "transaction");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "protectedDatabase");
      }
      else
      {
        -[HDDatabaseMigrator transaction](self, "transaction");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "unprotectedDatabase");
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDDatabaseMigrator transaction](self, "transaction");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "isProtectedMigration"))
        v54 = 2;
      else
        v54 = 1;

      *(_QWORD *)v110 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v110[8] = 3221225472;
      *(_QWORD *)&v110[16] = __74__HDDatabaseMigrator__runMigrationStep_currentVersion_finalVersion_error___block_invoke;
      *(_QWORD *)&v110[24] = &unk_1E6D0CD50;
      v113 = v45;
      *(_QWORD *)&v111 = v47;
      *((_QWORD *)&v111 + 1) = self;
      v114 = v54;
      *((_QWORD *)&v112 + 1) = v118;
      *(_QWORD *)&v112 = v44;
      v115 = &v101;
      v116 = v46;
      v117 = v48 & 1;
      if ((objc_msgSend(v52, "performTransactionWithType:error:usingBlock:", 1, v84, v110) & 1) == 0)
        *(_QWORD *)(*(_QWORD *)&v118[8] + 24) = 1;

      v49 = (uint8_t *)(*(_QWORD *)&v118[8] + 24);
      if (*(_QWORD *)(*(_QWORD *)&v118[8] + 24) != 3)
        goto LABEL_85;
    }
    if (-[HDDatabaseMigrator executeSQL:error:](self, "executeSQL:error:", CFSTR("PRAGMA foreign_keys = OFF"), v84))
    {
      v48 = 1;
      goto LABEL_74;
    }
    _HKInitializeLogging();
    v55 = *MEMORY[0x1E0CB52B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
LABEL_85:
      if ((v48 & 1) == 0)
        goto LABEL_89;
      goto LABEL_86;
    }
    v58 = *v84;
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v58;
    _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "Failed to disable foreign keys: %{public}@", (uint8_t *)&buf, 0xCu);
    if ((v48 & 1) == 0)
      goto LABEL_89;
LABEL_86:
    if (!-[HDDatabaseMigrator executeSQL:error:](self, "executeSQL:error:", CFSTR("PRAGMA foreign_keys = ON"), v84))
    {
      *(_QWORD *)(*(_QWORD *)&v118[8] + 24) = 1;
      _HKInitializeLogging();
      v56 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v59 = *v84;
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v59;
        _os_log_error_impl(&dword_1B7802000, v56, OS_LOG_TYPE_ERROR, "Failed to enable foreign keys: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_89:
    v57 = *(_QWORD *)(*(_QWORD *)&v118[8] + 24);
    _Block_object_dispose(v118, 8);

    if (v57)
      break;
LABEL_97:
    v43 = v99 + 1;
    if (v99 + 1 == v93)
    {
      v41 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
      v42 = &selRef__loadFeatureEvaluators;
      if (!v41)
        goto LABEL_99;
      goto LABEL_59;
    }
  }
  if (v57 == 2)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      -[HDDatabaseMigrator transaction](self, "transaction");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v70, "isProtectedMigration"))
        v71 = CFSTR("protected");
      else
        v71 = CFSTR("unprotected");
      objc_msgSend(v44, "schemaName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v44, "finalSchemaVersion");
      *(_DWORD *)v110 = 138543874;
      *(_QWORD *)&v110[4] = v71;
      *(_WORD *)&v110[12] = 2112;
      *(_QWORD *)&v110[14] = v72;
      *(_WORD *)&v110[22] = 2048;
      *(_QWORD *)&v110[24] = v73;
      _os_log_fault_impl(&dword_1B7802000, v64, OS_LOG_TYPE_FAULT, "Fatal error encountered attempting migration for %{public}@ (schema: %@) to %ld; migration will be aborted.",
        v110,
        0x20u);

    }
    v57 = 2;
  }
  else
  {
    if (v57 != 1)
      goto LABEL_115;
LABEL_112:
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      -[HDDatabaseMigrator transaction](self, "transaction");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v66, "isProtectedMigration"))
        v67 = CFSTR("protected");
      else
        v67 = CFSTR("unprotected");
      objc_msgSend(v44, "schemaName");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v44, "finalSchemaVersion");
      *(_DWORD *)v110 = 138543874;
      *(_QWORD *)&v110[4] = v67;
      *(_WORD *)&v110[12] = 2112;
      *(_QWORD *)&v110[14] = v68;
      *(_WORD *)&v110[22] = 2048;
      *(_QWORD *)&v110[24] = v69;
      _os_log_fault_impl(&dword_1B7802000, v64, OS_LOG_TYPE_FAULT, "Database migration interrupted attempting migration for %{public}@ (schema: %@) to %ld; migration will be retried.",
        v110,
        0x20u);

    }
    v57 = 1;
  }

LABEL_115:
  return v57;
}

- (void)invalidate
{
  -[NSMutableArray removeAllObjects](self->_migrationSteps, "removeAllObjects");
}

- (int64_t)performHFDMigrationToVersion:(int64_t)a3 handler:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v8 = a4;
  -[HDDatabaseMigrator transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke;
  v13[3] = &unk_1E6D0CDA0;
  v15 = a3;
  v10 = v8;
  v14 = v10;
  v11 = objc_msgSend(v9, "accessHistoricHFDWithError:block:", a5, v13);

  return v11;
}

uint64_t __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke_2;
  v8[3] = &unk_1E6D0CD78;
  v5 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = &v12;
  if (objc_msgSend(a2, "accessStoreWithError:block:", a3, v8))
    v6 = v13[3];
  else
    v6 = 1;

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a2;
  v12 = 1;
  v5 = a1 + 48;
  v6 = a1 + 32;
  v7 = operator new(0x30uLL);
  *v7 = &off_1E6D0CE50;
  v7[1] = v5;
  v7[2] = &v12;
  v7[3] = v6;
  v7[4] = &v14;
  v7[5] = &v13;
  v16 = v7;
  v8 = health::DataStore::performWriteTransactionWithLambda(a2, (uint64_t)v15);
  v9 = v16;
  if (v16 == v15)
  {
    v10 = 4;
    v9 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
  return v8;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[HDDatabaseMigrator transaction](self, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isProtectedMigration"))
  {
    -[HDDatabaseMigrator transaction](self, "transaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protectedDatabase");
  }
  else
  {
    -[HDDatabaseMigrator transaction](self, "transaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unprotectedDatabase");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "executeUncachedSQL:error:", v6, a4);
  return v10;
}

- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[HDDatabaseMigrator transaction](self, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isProtectedMigration"))
  {
    -[HDDatabaseMigrator transaction](self, "transaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protectedDatabase");
  }
  else
  {
    -[HDDatabaseMigrator transaction](self, "transaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unprotectedDatabase");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "executeSQLStatements:error:", v6, a4);
  return v10;
}

- (unint64_t)fetchLegacySyncIdentity:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  objc_msgSend(v7, "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrator.mm"), 535, CFSTR("Protected database must not be nil"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
    *MEMORY[0x1E0D297B0],
    *MEMORY[0x1E0D297B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v7, "unprotectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__HDDatabaseMigrator_fetchLegacySyncIdentity_error___block_invoke;
  v15[3] = &unk_1E6CEA698;
  v15[4] = &v16;
  v11 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a4, 0, v15);

  if ((v11 & 1) != 0)
    v12 = v17[3];
  else
    v12 = -1;
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __52__HDDatabaseMigrator_fetchLegacySyncIdentity_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (HDDatabaseMigrationTransaction)transaction
{
  return self->_transaction;
}

- (HDDatabaseSchemaManager)schemaManager
{
  return self->_schemaManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaManager, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_migrationSteps, 0);
}

- (id)okemoZursUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke;
  v21[3] = &unk_1E6CF2E90;
  v21[4] = self;
  HDCreateMigrationStep(8044, 8101, (uint64_t)v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_2;
  v20[3] = &unk_1E6CF2E90;
  v20[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8101, 8103, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_3;
  v19[3] = &unk_1E6CF2E90;
  v19[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8103, 8106, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_4;
  v18[3] = &unk_1E6CF2E90;
  v18[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8106, 8109, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_5;
  v17[3] = &unk_1E6CF2E90;
  v17[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8109, 8110, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_6;
  v16[3] = &unk_1E6CF2E90;
  v16[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8110, 8111, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_7;
  v15[3] = &unk_1E6CF2E90;
  v15[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8111, 8113, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_8;
  v14[3] = &unk_1E6CF2E90;
  v14[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8113, 8114, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

void *__67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DFA4C0, a3) ^ 1);
  return result;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _renameKeyValueSyncStoreColumnInProtectedDabase:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_renameKeyValueSyncStoreColumnInProtectedDabase:(uint64_t)a3 error:
{
  char v4;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a2;
  v6 = CFSTR("key_value");
  if (a2)
    v6 = CFSTR("key_value_secure");
  v7 = v6;
  objc_msgSend(a1, "transaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v4 & 1) != 0)
    objc_msgSend(v8, "protectedDatabase");
  else
    objc_msgSend(v8, "unprotectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "table:hasColumnWithName:error:", v7, CFSTR("sync_store"), a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("new_%@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain STRING, key STRING, value, mod_date REAL, UNIQUE(category, provenance, domain, key));"),
      v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ SELECT * FROM %@;"), v11, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@;"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@;"), v11, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = v13;
    v19[2] = v14;
    v19[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1, "executeSQLStatements:error:", v16, a3) ^ 1;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  os_log_t *v7;
  NSObject *v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 buf;
  void (*v43)(uint64_t, void *, void *);
  void *v44;
  NSObject *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("LastPedometerRecordID"));

  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v8 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Received last pedometer record ID of %ld", (uint8_t *)&buf, 0xCu);
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__183;
  v40 = __Block_byref_object_dispose__183;
  v41 = 0;
  if (v6 >= 1 && objc_msgSend(MEMORY[0x1E0CA5698], "isStepCountingAvailable"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CA5698]);
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__183;
    v34 = __Block_byref_object_dispose__183;
    v35 = 0;
    v10 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v43 = __61__HDDatabaseMigrator_OkemoZurs___lastReceivedPedometerDatum___block_invoke;
    v44 = &unk_1E6CEE790;
    v46 = &v36;
    v47 = &v30;
    v11 = v10;
    v45 = v11;
    objc_msgSend(v9, "queryPedometerDataSinceRecord:withHandler:", v6, &buf);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v12 = (id)v31[5];
    v13 = v12;
    if (v12)
      v14 = objc_retainAutorelease(v12);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v13 = 0;
  }
  v15 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  v16 = v13;
  v17 = v16;
  if (v16)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    goto LABEL_18;
  }
  if (v15)
  {
    if (!-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, CFSTR("STEP_INGESTION"), (uint64_t)a3)|| (-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, CFSTR("DISTANCE_INGESTION"), (uint64_t)a3) & 1) == 0)
    {
LABEL_18:

      return 1;
    }
    v18 = -[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, CFSTR("FLIGHTS_INGESTION"), (uint64_t)a3);

    if (!v18)
      return 1;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerForKey:", CFSTR("LastCaloriesRecordID"));

  _HKInitializeLogging();
  v23 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "Received last calorie record ID of %ld", (uint8_t *)&buf, 0xCu);
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__183;
  v40 = __Block_byref_object_dispose__183;
  v41 = 0;
  if (v22 >= 1 && objc_msgSend(MEMORY[0x1E0CA5678], "isNatalimeterAvailable"))
  {
    v24 = objc_alloc_init(MEMORY[0x1E0CA5678]);
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__183;
    v34 = __Block_byref_object_dispose__183;
    v35 = 0;
    v25 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v43 = __59__HDDatabaseMigrator_OkemoZurs___lastReceivedNatalieDatum___block_invoke;
    v44 = &unk_1E6CEE790;
    v46 = &v36;
    v47 = &v30;
    v26 = v25;
    v45 = v26;
    objc_msgSend(v24, "queryAbsoluteNatalimetryDataSinceRecord:withHandler:", v22, &buf);
    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    v27 = (id)v31[5];
    v28 = v27;
    if (v27)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v27);
      else
        _HKLogDroppedError();
    }

    _Block_object_dispose(&v30, 8);
  }
  v29 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  if (v29)
  {
    if (-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v29, CFSTR("BRISK_MINUTE_INGESTION"), (uint64_t)a3))v19 = -[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v29, CFSTR("ACTIVE_ENERGY_INGESTION"), (uint64_t)a3) ^ 1;
    else
      v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("DROP TABLE IF EXISTS main.activity_caches;");
  v8[1] = CFSTR("DROP TABLE IF EXISTS main.achievements;");
  v8[2] = CFSTR("DELETE FROM key_value WHERE category = 1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("DROP TABLE IF EXISTS nano_pairing;");
  v8[1] = CFSTR("DELETE FROM key_value WHERE category = 0 AND domain = 'NanoPairing';");
  v8[2] = CFSTR("CREATE TABLE nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, persistent_uuid BLOB UNIQUE NOT NULL, health_uuid BLOB NOT NULL, creation_date REAL NOT NULL);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _migrateKeyValueColumnsFromStringToText:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_migrateKeyValueColumnsFromStringToText:(uint64_t)a3 error:
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = CFSTR("key_value");
  if (a2)
    v5 = CFSTR("key_value_secure");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = v5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("tmp_%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain TEXT, key TEXT, value, mod_date REAL, UNIQUE(category, provenance, domain, key));"),
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ SELECT * FROM %@;"), v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@;"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@;"), v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = v10;
  v16[2] = v11;
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "executeSQLStatements:error:", v13, a3) ^ 1;

  return v14;
}

void *__67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DELETE FROM datatype_source_order;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("DROP TABLE IF EXISTS sync_stores;");
  v8[1] = CFSTR("DROP TABLE IF EXISTS sync_anchors;");
  v8[2] = CFSTR("CREATE TABLE IF NOT EXISTS sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER, acked INTEGER, received INTEGER, type INTEGER, store INTEGER, UNIQUE(type, store));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

- (id)okemoZursProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke;
  v41[3] = &unk_1E6CF2E90;
  v41[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8047, 8101, v41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_2;
  v40[3] = &unk_1E6CF2E90;
  v40[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8101, 8102, v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_3;
  v39[3] = &unk_1E6CF2E90;
  v39[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8102, 8103, v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_4;
  v38[3] = &unk_1E6CF2E90;
  v38[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8103, 8104, v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_5;
  v37[3] = &unk_1E6CF2E90;
  v37[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8104, 8105, v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_6;
  v36[3] = &unk_1E6CF2E90;
  v36[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8105, 8106, v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_7;
  v35[3] = &unk_1E6CF2E90;
  v35[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8106, 8107, v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_8;
  v34[3] = &unk_1E6CF2E90;
  v34[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8107, 8109, v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_9;
  v33[3] = &unk_1E6CF2E90;
  v33[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8109, 8110, v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_10;
  v32[3] = &unk_1E6CF2E90;
  v32[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8110, 8111, v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_11;
  v31[3] = &unk_1E6CF2E90;
  v31[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8111, 8112, v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_12;
  v30[3] = &unk_1E6CF2E90;
  v30[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8112, 8114, v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_13;
  v29[3] = &unk_1E6CF2E90;
  v29[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8114, 8115, v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_14;
  v28[3] = &unk_1E6CF2E90;
  v28[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8115, 8116, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_15;
  v27[3] = &unk_1E6CF2E90;
  v27[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8116, 8117, v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_16;
  v26[3] = &unk_1E6CF2E90;
  v26[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8117, 8118, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_17;
  v25[3] = &unk_1E6CF2E90;
  v25[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8118, 8119, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_18;
  v24[3] = &unk_1E6CF2E90;
  v24[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 8119, 8120, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  return v3;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("CREATE TABLE key_value_secure (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain STRING, key STRING, value, mod_date REAL, UNIQUE(category, provenance, domain, key));");
  v8[1] = CFSTR("INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT bundle_id, key, value, 0.0, 102, 0 FROM user_defaults;");
  v8[2] = CFSTR("INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'birthdate', birthdate, 0.0, 101, 0 FROM users;");
  v8[3] = CFSTR("INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'sex', sex, 0.0, 101, 0 FROM users;");
  v8[4] = CFSTR("INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'blood_type', blood_type, 0.0, 101, 0 FROM users;");
  v8[5] = CFSTR("DROP TABLE user_defaults;");
  v8[6] = CFSTR("DROP TABLE users");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = 1;
  if (!-[HDDatabaseMigrator _renameKeyValueSyncStoreColumnInProtectedDabase:error:](*(void **)(a1 + 32), 1, a3))
  {
    v8[0] = CFSTR("UPDATE objects SET provenance = 0 WHERE provenance != 16;");
    v8[1] = CFSTR("UPDATE objects SET provenance = 1 WHERE provenance = 16;");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "executeSQLStatements:error:", v6, a3) ^ 1;

  }
  return v5;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DFA4D8, a3) ^ 1);
  return result;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DROP TABLE IF EXISTS data_session_activities;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[7];

  v18[5] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);"),
      CFSTR("samples"),
      CFSTR("samples"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);"),
      CFSTR("quantity_samples"),
      CFSTR("quantity_samples"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);"),
      CFSTR("category_samples"),
      CFSTR("category_samples"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);"),
      CFSTR("workouts"),
      CFSTR("workouts"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);"),
      CFSTR("activity_caches"),
      CFSTR("activity_caches"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v2;
    v18[1] = v3;
    v18[2] = v4;
    v18[3] = v5;
    v18[4] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v1, "executeSQL:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  return 0;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE workouts SET activity_type=3000 WHERE activity_type=0"), a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "executeSQL:error:", CFSTR("ALTER TABLE activity_caches ADD COLUMN walk_distance REAL;"), a3);
  return 0;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, energy_burned_goal REAL, energy_burned REAL, brisk_minutes REAL, active_hours REAL, cache_index INTEGER, active_hours_goal REAL, brisk_minutes_goal REAL, steps REAL, walk_distance REAL);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE INDEX IF NOT EXISTS metadata_values_index_0 ON metadata_values(object_id);"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _migrateKeyValueColumnsFromStringToText:error:](*(void **)(a1 + 32), 1, a3);
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE INDEX IF NOT EXISTS correlations_index_0 ON correlations(object);"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("ALTER TABLE correlations ADD COLUMN provenance INTEGER;");
  v8[1] = CFSTR("UPDATE correlations SET provenance = 0;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(&unk_1E6DFA4F0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(&unk_1E6DFA4F0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE activity_caches ADD COLUMN %@ INTEGER;"),
          *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&unk_1E6DFA4F0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v11;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  _QWORD v26[4];

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  +[HDKeyValueEntity generateNewDatabaseIdentifier](HDKeyValueEntity, "generateNewDatabaseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;"),
    *MEMORY[0x1E0D297B0],
    *MEMORY[0x1E0D297B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  objc_msgSend(v3, "transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke;
  v25[3] = &unk_1E6CE8540;
  v25[4] = v26;
  v10 = objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, 0, v25);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v3, "transaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_2;
    v22[3] = &unk_1E6D0CFD8;
    v13 = v5;
    v23 = v13;
    v24 = v26;
    v14 = objc_msgSend(v12, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO key_value (domain, key, value, mod_date, category, provenance, sync_identity) VALUES('DATABASE_CREATION', 'IDENTIFIER', ?, 0.0, 0, 0, ?);"),
            a3,
            v22,
            0);

    if (v14)
    {
      objc_msgSend(v3, "transaction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "protectedDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_3;
      v20[3] = &unk_1E6CE9508;
      v21 = v13;
      v17 = objc_msgSend(v16, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO key_value_secure (domain, key, value, mod_date, category, provenance) VALUES('DATABASE_CREATION', 'IDENTIFIER', ?, 0.0, 100, 0);"),
              a3,
              v20,
              0);

      v18 = v17 ^ 1u;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 1;
  }
  _Block_object_dispose(v26, 8);

  return v18;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE key_value_secure SET key = 'LastSessionEndDate', value = (SELECT samples.end_date FROM workouts, samples WHERE workouts.data_id = samples.data_id ORDER BY samples.end_date DESC LIMIT 1) WHERE key = 'LastSessionAnchor';"),
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[12];

  v35[10] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)v3, "transaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unprotectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70__HDDatabaseMigrator_OkemoZurs___clearSamplesWithoutSourcesWithError___block_invoke_2;
    v32[3] = &unk_1E6CE8CF8;
    v8 = v5;
    v33 = v8;
    v9 = objc_msgSend(v7, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid FROM sources"), a3, 0, v32);

    if (v9)
    {
      v28 = a3;
      v27 = v8;
      if (objc_msgSend(v8, "count"))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("WHERE source NOT IN (%@)"), v11);
        v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = &stru_1E6D11BB8;
      }
      v29 = (__CFString *)v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TABLE temp_unattached_objects AS SELECT data_id FROM objects %@"), v12);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("samples"),
        CFSTR("data_id"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("quantity_samples"),
        CFSTR("data_id"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("category_samples"),
        CFSTR("data_id"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("workouts"),
        CFSTR("data_id"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("workout_events"),
        CFSTR("workout_id"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("activity_caches"),
        CFSTR("data_id"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("correlations"),
        CFSTR("object"));
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("correlations"),
        CFSTR("correlation"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("metadata_values"),
        CFSTR("object_id"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);"),
        CFSTR("objects"),
        CFSTR("data_id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v30;
      v35[1] = v13;
      v35[2] = v25;
      v35[3] = v14;
      v35[4] = v24;
      v35[5] = v15;
      v26 = (void *)v16;
      v35[6] = v16;
      v35[7] = v17;
      v35[8] = v18;
      v35[9] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v31;
      v34[1] = CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS temp_index_0 ON temp_unattached_objects (data_id);");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend((id)v3, "executeSQLStatements:error:", v21, v28);

      if (v22)
      {
        objc_msgSend((id)v3, "executeSQLStatements:error:", v20, 0);
        objc_msgSend((id)v3, "executeSQL:error:", CFSTR("DROP INDEX IF EXISTS temp_index_0;"), 0);
      }
      objc_msgSend((id)v3, "executeSQL:error:", CFSTR("DROP TABLE IF EXISTS temp_unattached_objects;"), 0);
      v3 = v22 ^ 1u;

      v8 = v27;
    }
    else
    {
      v3 = 1;
    }

  }
  return v3;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v8[0] = CFSTR("ALTER TABLE devices add column device_enabled BOOLEAN default 1;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("INSERT INTO key_value_secure (category, provenance, domain, key, value, mod_date) SELECT 100, 0, 'OBJECT_ANCHOR', 'OBJECT_ANCHOR_8_2', MAX(data_id), strftime('%s', 'now', '-31 years') FROM objects;"),
                                    a3) ^ 1);
  return result;
}

- (uint64_t)_updateDataCollectorKeyValueContextWithObject:(void *)a3 domain:(uint64_t)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprotectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__HDDatabaseMigrator_OkemoZurs___updateDataCollectorKeyValueContextWithObject_domain_error___block_invoke;
    v13[3] = &unk_1E6CE7750;
    v14 = v7;
    v15 = v8;
    v11 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO key_value (domain, key, value, mod_date, category, provenance) VALUES (?, ?, ?, ?, ?, ?);"),
            a4,
            v13,
            0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __92__HDDatabaseMigrator_OkemoZurs___updateDataCollectorKeyValueContextWithObject_domain_error___block_invoke()
{
  void *v0;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

void __61__HDDatabaseMigrator_OkemoZurs___lastReceivedPedometerDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    HKLogSafeDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v12;
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Received last pedometer datum of %@ (out of %ld results)", (uint8_t *)&v13, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __59__HDDatabaseMigrator_OkemoZurs___lastReceivedNatalieDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    HKLogSafeDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "Received last calorie datum of %{public}@ (out of %ld results)", (uint8_t *)&v13, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __70__HDDatabaseMigrator_OkemoZurs___clearSamplesWithoutSourcesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

- (id)eagleUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke;
  v13[3] = &unk_1E6CF2E90;
  v13[4] = self;
  HDCreateMigrationStep(9007, 9200, (uint64_t)v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_2;
  v12[3] = &unk_1E6CF2E90;
  v12[4] = self;
  HDCreateMigrationStep(9200, 9201, (uint64_t)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_3;
  v11[3] = &unk_1E6CF2E90;
  v11[4] = self;
  HDCreateMigrationStep(9201, 9202, (uint64_t)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_4;
  v10[3] = &unk_1E6CF2E90;
  v10[4] = self;
  HDCreateMigrationStep(9202, 9203, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _updateKeyValueEntityUniquenessWithProtectedDatabase:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_updateKeyValueEntityUniquenessWithProtectedDatabase:(uint64_t)a3 error:
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  if (!a1)
    return 0;
  v5 = CFSTR("key_value");
  if (a2)
    v5 = CFSTR("key_value_secure");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = v5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_old"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_temp"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@;"), v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER NOT NULL, domain TEXT NOT NULL, key TEXT NOT NULL, value, provenance INTEGER NOT NULL, mod_date REAL NOT NULL, UNIQUE(category, domain, key));"),
    v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TABLE %@ (category INTEGER NOT NULL, domain TEXT NOT NULL, key TEXT NOT NULL, value, provenance INTEGER NOT NULL, mod_date REAL NOT NULL, UNIQUE(category, domain, key));"),
    v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (category, domain, key, value, provenance, mod_date) SELECT category, COALESCE(domain, ''), key, value, provenance, mod_date FROM %@ ORDER BY mod_date DESC;"),
    v9,
    v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (rowid, category, domain, key, value, provenance, mod_date) SELECT old.rowid, merged.category, merged.domain, merged.key, merged.value, merged.provenance, merged.mod_date FROM %@ as old, %@ as merged WHERE merged.category = old.category AND merged.domain = COALESCE(old.domain, '') AND merged.key = old.key ORDER BY old.rowid ASC;"),
    v7,
    v8,
    v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@;"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@;"), v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v17);

  v18 = objc_msgSend(a1, "executeSQLStatements:error:", v10, a3) ^ 1;
  return v18;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS sync_stores (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, type INTEGER NOT NULL, creation_date REAL NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE nano_pairing RENAME TO nano_pairing_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, registry_uuid BLOB UNIQUE NOT NULL, persistent_uuid BLOB, health_uuid BLOB, sync_provenance INTEGER NOT NULL REFERENCES sync_stores (ROWID) ON DELETE CASCADE, restored INTEGER NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("DELETE FROM nano_pairing_old WHERE rowid < (SELECT MAX(rowid) FROM nano_pairing_old);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO sync_stores (rowid, uuid, type, creation_date) SELECT 1, registry_uuid, 1, 0.0 FROM nano_pairing_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO nano_pairing SELECT * FROM nano_pairing_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE nano_pairing_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE nano_pairing ADD COLUMN source_bundle_id TEXT;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE nano_pairing ADD COLUMN ids_id TEXT;"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE sync_anchors ADD COLUMN expected INTEGER;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

- (id)eagleProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke;
  v20[3] = &unk_1E6CF2E90;
  v20[4] = self;
  HDCreateMigrationStep(9100, 9201, (uint64_t)v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_2;
  v19[3] = &unk_1E6CF2E90;
  v19[4] = self;
  HDCreateMigrationStep(9201, 9202, (uint64_t)v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_3;
  v18[3] = &unk_1E6CF2E90;
  v18[4] = self;
  HDCreateMigrationStep(9202, 9203, (uint64_t)v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_4;
  v17[3] = &unk_1E6CF2E90;
  v17[4] = self;
  HDCreateMigrationStep(9203, 9204, (uint64_t)v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_5;
  v16[3] = &unk_1E6CF2E90;
  v16[4] = self;
  HDCreateMigrationStep(9204, 9206, (uint64_t)v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_6;
  v15[3] = &unk_1E6CF2E90;
  v15[4] = self;
  HDCreateMigrationStep(9206, 9208, (uint64_t)v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_7;
  v14[3] = &unk_1E6CF2E90;
  v14[4] = self;
  HDCreateMigrationStep(9208, 9209, (uint64_t)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  HDCreateMigrationStep(9209, 9210, (uint64_t)&__block_literal_global_223);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DFA550, a3) ^ 1);
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS binary_samples (data_id INTEGER PRIMARY KEY, payload BLOB)"), a3) ^ 1);
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS data_series (data_id INTEGER PRIMARY KEY REFERENCES samples(data_id), frozen INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0)"), a3) ^ 1);
  return result;
}

uint64_t __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _updateKeyValueEntityUniquenessWithProtectedDatabase:error:](*(void **)(a1 + 32), 1, a3);
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DFA568, a3) ^ 1);
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("INSERT OR REPLACE INTO key_value_secure (category, domain, provenance, mod_date, key, value)                       SELECT category, domain, provenance, mod_date, 'LastSessionAnchor',                         (SELECT workouts.data_id FROM workouts INNER JOIN samples USING(data_id) ORDER BY samples.end_date DESC LIMIT 1)                       FROM key_value_secure WHERE key = 'LastSessionEndDate' ORDER BY value DESC;"),
                                    a3) ^ 1);
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE key_value_secure SET category = 106 WHERE category = 103;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_8()
{
  return 0;
}

- (id)tigrisUnprotectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke;
  v31[3] = &unk_1E6CEA670;
  v31[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 10001, 11000, v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_2;
  v30[3] = &unk_1E6CEA670;
  v30[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 11000, 11001, v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_3;
  v29[3] = &unk_1E6CEA670;
  v29[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 11001, 11002, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_4;
  v28[3] = &unk_1E6CEA670;
  v28[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11002, 11003, v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_5;
  v27[3] = &unk_1E6CEA670;
  v27[4] = self;
  HDCreateMigrationStep(11003, 11004, (uint64_t)v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_6;
  v26[3] = &unk_1E6CEA670;
  v26[4] = self;
  HDCreateMigrationStep(11004, 11005, (uint64_t)v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_7;
  v25[3] = &unk_1E6CEA670;
  v25[4] = self;
  HDCreateMigrationStep(11005, 11006, (uint64_t)v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_8;
  v24[3] = &unk_1E6CEA670;
  v24[4] = self;
  HDCreateMigrationStep(11006, 11007, (uint64_t)v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_9;
  v23[3] = &unk_1E6CEA670;
  v23[4] = self;
  HDCreateMigrationStep(11007, 11009, (uint64_t)v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_10;
  v22[3] = &unk_1E6CEA670;
  v22[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11009, 11010, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_11;
  v21[3] = &unk_1E6CEA670;
  v21[4] = self;
  HDCreateMigrationStep(11010, 11011, (uint64_t)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_12;
  v20[3] = &unk_1E6CEA670;
  v20[4] = self;
  HDCreateMigrationStep(11011, 11012, (uint64_t)v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_13;
  v19[3] = &unk_1E6CEA670;
  v19[4] = self;
  HDCreateMigrationStep(11012, 11013, (uint64_t)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  return v3;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB NOT NULL)"), a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE sources RENAME TO sources_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT NOT NULL, name TEXT NOT NULL, source_options INTEGER NOT NULL, local_device INTEGER NOT NULL, product_type TEXT NOT NULL, deleted INTEGER NOT NULL, mod_date REAL NOT NULL, provenance INTEGER NOT NULL, sync_anchor INTEGER NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO sources SELECT rowid, uuid, COALESCE(bundle_id, ''), COALESCE(name, ''), COALESCE(source_options, 0), COALESCE(local_device, 0), COALESCE(product_type, ''), deleted, COALESCE(mod_date, 0.0), provenance, rowid FROM sources_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE sources_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("DROP TABLE IF EXISTS cloud_sync_stores");
  v7[1] = CFSTR("CREATE TABLE IF NOT EXISTS cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE authorization RENAME TO authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL REFERENCES sources(ROWID) ON DELETE CASCADE, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, modification_epoch INTEGER NOT NULL, provenance INTEGER NOT NULL, object_anchor INTEGER NOT NULL DEFAULT 0, UNIQUE(source_id, object_type));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO authorization (ROWID, source_id, object_type, status, request, date_modified, modification_epoch, provenance, object_anchor) SELECT ROWID, source_id, object_type, status, request, date_modified, 0, provenance, object_anchor FROM authorization_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE authorization_old;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE cloud_sync_stores ADD COLUMN rebase_deadline REAL;"),
                                    a3) ^ 1);
  return result;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE cloud_sync_stores ADD COLUMN last_sync REAL;"),
                                    a3) ^ 1);
  return result;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("ALTER TABLE cloud_sync_stores ADD COLUMN empty_zones BLOB;"),
                                    a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE cloud_sync_stores ADD COLUMN last_check REAL;"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE cloud_sync_stores ADD COLUMN owner_id TEXT;"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("DELETE FROM sync_stores WHERE EXISTS (SELECT * FROM cloud_sync_stores WHERE sync_stores.rowid = cloud_sync_stores.sync_store)"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE cloud_sync_stores"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL, rebase_deadline REAL, last_sync REAL, empty_zones BLOB, last_check REAL, owner_id TEXT NOT NULL, container_id TEXT NOT NULL);"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE sources SET source_options=18 WHERE bundle_id='com.apple.private.health.fitnessmachine'"), a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE cloud_sync_stores RENAME TO cloud_sync_stores_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL, rebase_deadline REAL, last_sync REAL, empty_zones BLOB, last_check REAL, owner_id TEXT NOT NULL, container_id TEXT NOT NULL, has_gap INTEGER NOT NULL);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO cloud_sync_stores SELECT sync_store, server_change_token, baseline_epoch, rebase_deadline, last_sync, empty_zones, last_check, owner_id, container_id, 0 FROM cloud_sync_stores_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE cloud_sync_stores_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE sync_anchors RENAME TO sync_anchors_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER NOT NULL, acked INTEGER NOT NULL, received INTEGER NOT NULL, type INTEGER NOT NULL, store INTEGER NOT NULL, epoch INTEGER NOT NULL, UNIQUE(store, epoch, type));"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO sync_anchors SELECT ROWID, COALESCE(next, 0), COALESCE(acked, 0), COALESCE(received, 0), type, store, 0 FROM sync_anchors_old WHERE type IS NOT NULL AND store IS NOT NULL;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE sync_anchors_old"));
  objc_msgSend(v5, "addObject:", CFSTR("UPDATE sync_anchors SET epoch = (SELECT baseline_epoch FROM cloud_sync_stores WHERE sync_store = store) WHERE EXISTS (SELECT * FROM cloud_sync_stores WHERE sync_store = store)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("DROP INDEX IF EXISTS sources_bundle_id"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX sources_bundle_id_uuid ON sources (bundle_id, uuid)"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

- (id)tigrisProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke;
  v47[3] = &unk_1E6CEA670;
  v47[4] = self;
  +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepWithForeignKeysDisabledFrom:to:handler:", 10200, 11000, v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v46[0] = v4;
  v46[1] = 3221225472;
  v46[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_2;
  v46[3] = &unk_1E6CEA670;
  v46[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11000, 11001, v46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_3;
  v45[3] = &unk_1E6CEA670;
  v45[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11001, 11002, v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11002, 11003, &__block_literal_global_242);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v44[0] = v4;
  v44[1] = 3221225472;
  v44[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_5;
  v44[3] = &unk_1E6CEA670;
  v44[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11003, 11004, v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_6;
  v43[3] = &unk_1E6CEA670;
  v43[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11004, 11005, v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11005, 11007, &__block_literal_global_248_2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v42[0] = v4;
  v42[1] = 3221225472;
  v42[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_8;
  v42[3] = &unk_1E6CEA670;
  v42[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11007, 11008, v42);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_9;
  v41[3] = &unk_1E6CEA670;
  v41[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11008, 11009, v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  HDCreateMigrationStep(11009, 11010, (uint64_t)&__block_literal_global_249_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_11;
  v40[3] = &unk_1E6CEA670;
  v40[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11010, 11011, v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_12;
  v39[3] = &unk_1E6CEA670;
  v39[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11011, 11012, v39);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11012, 11013, &__block_literal_global_250_1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_14;
  v38[3] = &unk_1E6CEA670;
  v38[4] = self;
  HDCreateMigrationStep(11013, 11014, (uint64_t)v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_15;
  v37[3] = &unk_1E6CEA670;
  v37[4] = self;
  HDCreateMigrationStep(11014, 11015, (uint64_t)v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  HDCreateMigrationStep(11015, 11028, (uint64_t)&__block_literal_global_251_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_17;
  v36[3] = &unk_1E6CEA670;
  v36[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11028, 11029, v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11029, 11033, &__block_literal_global_252_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_19;
  v35[3] = &unk_1E6CEA670;
  v35[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11033, 11035, v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11035, 11036, &__block_literal_global_253_1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_21;
  v34[3] = &unk_1E6CEA670;
  v34[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11036, 11040, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11040, 11048, &__block_literal_global_254_1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_23;
  v33[3] = &unk_1E6CEA670;
  v33[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11048, 11049, v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_24;
  v32[3] = &unk_1E6CEA670;
  v32[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11049, 11050, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_25;
  v31[3] = &unk_1E6CEA670;
  v31[4] = self;
  +[HDDatabaseMigrationStep migrationStepFrom:to:handler:](HDDatabaseMigrationStep, "migrationStepFrom:to:handler:", 11050, 11051, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("ALTER TABLE data_provenances RENAME TO data_provenances_old");
  v7[1] = CFSTR("CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_product_type TEXT NOT NULL, origin_build TEXT NOT NULL, local_product_type TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, tz_name TEXT NOT NULL, origin_major_version INTEGER NOT NULL, origin_minor_version INTEGER NOT NULL, origin_patch_version INTEGER NOT NULL, UNIQUE(sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version))");
  v7[2] = CFSTR("INSERT INTO data_provenances (rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version) SELECT rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, -1, 0, 0 FROM data_provenances_old;");
  v7[3] = CFSTR("DROP TABLE IF EXISTS data_provenances_old;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS external_sync_ids (object_id INTEGER NOT NULL REFERENCES objects (data_id) ON DELETE CASCADE, source_id INTEGER NOT NULL, sid TEXT NOT NULL, version REAL NOT NULL, current_flag INTEGER)"), a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke;
  v8[3] = &unk_1E6CFD9A8;
  v8[4] = v3;
  LODWORD(a3) = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT DISTINCT origin_build, origin_product_type FROM data_provenances WHERE origin_major_version=-1 AND origin_minor_version=0 AND origin_patch_version=0"), a3, 0, v8);

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_4()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE activity_caches RENAME TO activity_caches_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, active_energy_burned_anchor INTEGER, active_hours_anchor INTEGER, brisk_minutes_anchor INTEGER, energy_burned_goal_anchor INTEGER, step_count_anchor INTEGER, vulcan_count_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, deep_breathing_session_anchor INTEGER, flights INTEGER, flights_anchor INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO activity_caches (data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor) SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor from activity_caches_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE activity_caches_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("DROP TABLE IF EXISTS external_sync_ids");
  v7[1] = CFSTR("CREATE TABLE IF NOT EXISTS external_sync_ids (object_id INTEGER PRIMARY KEY REFERENCES objects (data_id) ON DELETE CASCADE, source_id INTEGER NOT NULL, object_code INTEGER NOT NULL, sid TEXT NOT NULL, version REAL NOT NULL, deleted INTEGER NON NULL)");
  v7[2] = CFSTR("CREATE INDEX IF NOT EXISTS external_sync_ids_source_object_code_sid_deleted ON external_sync_ids (source_id, object_code, sid, deleted)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_7()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("ALTER TABLE workout_events RENAME TO workout_events_old;");
  v7[1] = CFSTR("CREATE TABLE IF NOT EXISTS workout_events (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, workout_id INTEGER, date REAL, type INTEGER, w_step_style INTEGER, duration REAL NOT NULL);");
  v7[2] = CFSTR("INSERT INTO workout_events (workout_id, date, type, w_step_style, duration) SELECT workout_id, date, type, w_step_style, 0 FROM workout_events_old;");
  v7[3] = CFSTR("DROP TABLE IF EXISTS workout_events_old;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("ALTER TABLE metadata_values ADD COLUMN data_value BLOB");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_10()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS pending_associations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, parent_uuid BLOB NOT NULL, child_uuid BLOB NOT NULL, provenance INTEGER NOT NULL, UNIQUE(parent_uuid, child_uuid));"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE INDEX IF NOT EXISTS pending_associations_child ON pending_associations (child_uuid);"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v7[0] = CFSTR("ALTER TABLE workouts ADD COLUMN total_flights_climbed REAL;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_13()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_16()
{
  return 0;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQLStatements:error:", &unk_1E6DFA5E0, a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_18()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE activity_caches RENAME TO activity_caches_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, flights INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO activity_caches SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, deep_breathing_duration, flights, energy_burned_stats, brisk_minutes_stats FROM activity_caches_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE activity_caches_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_20()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  _QWORD v12[5];

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE workout_events RENAME TO workout_events_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE workout_events_old ADD COLUMN metadata BLOB;"));
  if (objc_msgSend(v3, "executeSQLStatements:error:", v5, a3))
  {
    objc_msgSend(v3, "transaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "protectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke;
    v12[3] = &unk_1E6CFD9A8;
    v12[4] = v3;
    v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT * FROM workout_events_old WHERE w_step_style IS NOT NULL"), a3, 0, v12);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "removeAllObjects");
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS workout_events (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, workout_id INTEGER, date REAL NOT NULL, type INTEGER, duration REAL NOT NULL, metadata BLOB);"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO workout_events (workout_id, date, type, duration, metadata) SELECT workout_id, date, type, duration, metadata FROM workout_events_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE IF EXISTS workout_events_old;"));
  if (v8)
    v9 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3);
  else
    v9 = 0;
  v10 = v9 ^ 1u;

  return v10;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_22()
{
  return 0;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("DROP TABLE IF EXISTS trusted_fitness_machines"), a3) ^ 1);
  return result;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)(objc_msgSend(result, "executeSQL:error:", CFSTR("UPDATE metadata_values SET numerical_value=2 WHERE key_ID=(SELECT ROWID FROM metadata_keys WHERE key='HKVO2MaxTestType') AND numerical_value=4"), a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", CFSTR("ALTER TABLE activity_caches RENAME TO activity_caches_old"));
  objc_msgSend(v5, "addObject:", CFSTR("CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, sequence INTEGER NOT NULL, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, flights INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"));
  objc_msgSend(v5, "addObject:", CFSTR("INSERT INTO activity_caches SELECT data_id, cache_index, 1, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, deep_breathing_duration, flights, energy_burned_stats, brisk_minutes_stats FROM activity_caches_old;"));
  objc_msgSend(v5, "addObject:", CFSTR("DROP TABLE activity_caches_old"));
  v6 = objc_msgSend(v3, "executeSQLStatements:error:", v5, a3) ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1BCCAB1D4](a2, 0);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0uLL;
  v21 = 0;
  HDVersionFromBuildStringForProductType(v6, v7, &v20);
  v18 = v20;
  v19 = v21;
  if (HKNSOperatingSystemVersionIsUnknown())
  {
    if (v6 != CFSTR("UnknownBuild")
      && (!CFSTR("UnknownBuild") || (-[__CFString isEqualToString:](v6, "isEqualToString:") & 1) == 0))
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Unexpected failure in migrating origin build to system versions, build string: %@", buf, 0xCu);
      }
    }
    v9 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "protectedDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke_269;
    v13[3] = &unk_1E6D10350;
    v16 = v20;
    v17 = v21;
    v14 = v6;
    v15 = v7;
    v9 = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE OR IGNORE data_provenances SET origin_major_version=?, origin_minor_version=?,  origin_patch_version=? WHERE origin_build=? AND origin_product_type=?"), a3, v13, 0);

  }
  return v9;
}

uint64_t __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke_269(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[6]);
  sqlite3_bind_int64(a2, 2, a1[7]);
  sqlite3_bind_int64(a2, 3, a1[8]);
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = HDSQLiteColumnAsInt64();
  v16 = CFSTR("HKSwimmingStrokeStyle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke_2;
    v13[3] = &unk_1E6CEB038;
    v14 = v8;
    v15 = v5;
    v11 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE workout_events_old SET metadata = ? WHERE rowid = ?"), a3, v13, 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

- (id)corryUnprotectedMigrationSteps
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)corryProtectedMigrationSteps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke;
  v11[3] = &unk_1E6CEA670;
  v11[4] = self;
  HDCreateMigrationStep(10100, 10200, (uint64_t)v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_2;
  v10[3] = &unk_1E6CEA670;
  v10[4] = self;
  HDCreateMigrationStep(10200, 10201, (uint64_t)v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_3;
  v9[3] = &unk_1E6CEA670;
  v9[4] = self;
  HDCreateMigrationStep(10201, 10202, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "performHFDMigrationToVersion:handler:error:", 10200, &__block_literal_global_246, a3);
  return 0;
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

uint64_t __67__HDDatabaseMigrator_Corry___corry_fixHFDProtectionClassWithError___block_invoke()
{
  return 0;
}

- (int64_t)_corry_rewriteHFDStep1WithError:(id *)a3
{
  return 0;
}

- (int64_t)_corry_rewriteHFDStep2WithError:(id *)a3
{
  return 0;
}

@end
