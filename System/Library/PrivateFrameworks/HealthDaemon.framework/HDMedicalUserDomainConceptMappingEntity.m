@implementation HDMedicalUserDomainConceptMappingEntity

+ (id)databaseTable
{
  return CFSTR("medical_user_domain_concept_mappings");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_63;
}

+ (id)uniquedColumns
{
  return &unk_1E6DF9C80;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDMedicalUserDomainConceptEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("data_id");
  v7[0] = v2;
  +[HDDataEntity defaultForeignKey](HDMedicalRecordEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString **v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("user_domain_concepts.uuid")))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[HDUserDomainConceptEntity joinClausesForProperty:](HDMedicalUserDomainConceptEntity, "joinClausesForProperty:", CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSet:", v6);

    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = HDUserDomainConceptEntityPropertyUserDomainConceptID;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("objects.uuid")))
    {
      v17.receiver = a1;
      v17.super_class = (Class)&OBJC_METACLASS___HDMedicalUserDomainConceptMappingEntity;
      objc_msgSendSuper2(&v17, sel_joinClausesForProperty_, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v12 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[HDMedicalRecordEntity joinClausesForProperty:](HDMedicalRecordEntity, "joinClausesForProperty:", CFSTR("uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v12, "initWithSet:", v13);

    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = HDDataEntityPropertyDataID;
  }
  objc_msgSend(v8, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v9, v10, 0, *v11, *v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);

  v15 = (void *)objc_msgSend(v7, "copy");
LABEL_7:

  return v15;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertUserDomainConceptID:(int64_t)a3 medicalRecordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v9;
  _QWORD v11[6];

  objc_msgSend(a5, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  v11[5] = a4;
  LOBYTE(a6) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertUserDomainConceptID_medicalRecordID_transaction_error__statementKey, a6, &__block_literal_global_151, v11, 0);

  return (char)a6;
}

const __CFString *__103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO medical_user_domain_concept_mappings (udc_id, data_id) VALUES (?, ?)");
}

uint64_t __103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)migrateMappingsFromUserDomainConceptID:(int64_t)a3 toUserDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v9;
  _QWORD v11[6];

  objc_msgSend(a5, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a4;
  v11[5] = a3;
  LOBYTE(a6) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_209_3, v11, 0);

  return (char)a6;
}

const __CFString *__122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("UPDATE OR REPLACE medical_user_domain_concept_mappings SET (udc_id) = (?) WHERE udc_id = ?");
}

uint64_t __122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)updateMappingFromRecordWithPersistentID:(int64_t)a3 withMapToUDCWithPersistentID:(int64_t)a4 toMapToUDCWithPersistentID:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  void *v11;
  _QWORD v13[7];

  objc_msgSend(a6, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke_2;
  v13[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a5;
  v13[5] = a4;
  v13[6] = a3;
  LOBYTE(a7) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error__statementKey, a7, &__block_literal_global_212_0, v13, 0);

  return (char)a7;
}

const __CFString *__157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke()
{
  return CFSTR("UPDATE OR REPLACE medical_user_domain_concept_mappings SET (udc_id) = (?) WHERE udc_id = ?AND data_id = ?");
}

uint64_t __157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  return sqlite3_bind_int64(a2, 3, a1[6]);
}

+ (id)unitTest_medicalRecordIDsForUserDomainConceptID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  objc_msgSend(a4, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_3;
  v12[3] = &unk_1E6CE8CF8;
  v8 = v13;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error__lookupKey, a5, &__block_literal_global_215_0, v14, v12))v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

const __CFString *__109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("SELECT data_id FROM medical_user_domain_concept_mappings WHERE udc_id = ?");
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)unitTest_userDomainConceptIDsForMedicalRecordID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  objc_msgSend(a4, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_3;
  v12[3] = &unk_1E6CE8CF8;
  v8 = v13;
  if (objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error__lookupKey, a5, &__block_literal_global_221, v14, v12))v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

const __CFString *__109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke()
{
  return CFSTR("SELECT udc_id FROM medical_user_domain_concept_mappings WHERE data_id = ?");
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

@end
