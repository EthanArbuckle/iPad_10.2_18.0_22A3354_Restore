@implementation HDSimpleGraphDatabaseRelationshipEntity

- (HDSimpleGraphDatabaseRelationshipEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9
{
  id v16;
  char v17;
  void *v19;
  _QWORD v20[9];

  v16 = a8;
  if ((objc_msgSend(v16, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseRelationshipEntity.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke_2;
  v20[3] = &__block_descriptor_72_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a4;
  v20[5] = a3;
  v20[6] = a5;
  v20[7] = a6;
  v20[8] = a7;
  v17 = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error__key, a9, &__block_literal_global_187, v20, 0);

  return v17;
}

const __CFString *__123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke()
{
  return CFSTR("INSERT INTO relationships (subject_id, relationship_type, object_id, version, slots) VALUES (?, ?, ?, ?, ?)");
}

uint64_t __123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_bind_int64(a2, 3, a1[6]);
  sqlite3_bind_int64(a2, 4, a1[7]);
  return sqlite3_bind_int64(a2, 5, a1[8]);
}

+ (BOOL)updateSlots:(unint64_t)a3 subjectNodeID:(int64_t)a4 relationshipID:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v13;
  char v14;
  void *v16;
  _QWORD v17[7];

  v13 = a6;
  if ((objc_msgSend(v13, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseRelationshipEntity.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  v14 = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateSlots_subjectNodeID_relationshipID_database_error__key, a7, &__block_literal_global_204_4, v17, 0);

  return v14;
}

const __CFString *__99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke()
{
  return CFSTR("UPDATE relationships SET slots = ? WHERE subject_id = ? AND relationship_type = ?");
}

uint64_t __99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  return sqlite3_bind_int64(a2, 3, a1[6]);
}

+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 relationshipID:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke_2;
  v7[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = a3;
  v7[5] = a4;
  return objc_msgSend(a5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteRelationshipsWithSubjectID_relationshipID_database_error__key, a6, &__block_literal_global_208_0, v7, 0);
}

const __CFString *__106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke()
{
  return CFSTR("DELETE FROM relationships WHERE subject_id = ? AND relationship_type = ? ");
}

uint64_t __106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke_2;
  v7[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = a3;
  v7[5] = a4;
  return objc_msgSend(a5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteRelationshipsWithSubjectID_lessThanVersion_database_error__key, a6, &__block_literal_global_212_2, v7, 0);
}

const __CFString *__107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke()
{
  return CFSTR("DELETE FROM relationships WHERE subject_id = ? AND version < ? ");
}

uint64_t __107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 subjectNodeID:(int64_t)a5 relationshipID:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v15;
  int64_t v16;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v15 = a7;
  if ((objc_msgSend(v15, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseRelationshipEntity.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[6] = &v29;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_2;
  v20[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a5;
  v20[5] = a6;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_3;
  v19[3] = &unk_1E6CF1808;
  v19[4] = &v25;
  v19[5] = &v21;
  if ((objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &maxVersion_slots_subjectNodeID_relationshipID_database_error__key, a8, &__block_literal_global_215_1, v20, v19) & 1) != 0)
  {
    if (*((_BYTE *)v30 + 24))
    {
      if (a3)
        *a3 = v26[3];
      if (a4)
        *a4 = v22[3];
      v16 = 1;
    }
    else
    {
      v16 = 2;
    }
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

const __CFString *__104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke()
{
  return CFSTR("SELECT MAX(version), MAX(slots) FROM relationships WHERE subject_id = ? AND relationship_type = ? GROUP BY subject_id, relationship_type LIMIT 1");
}

uint64_t __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_3(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return 0;
}

+ (BOOL)removeRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v13;
  char v14;
  void *v16;
  _QWORD v17[7];

  v13 = a6;
  if ((objc_msgSend(v13, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseRelationshipEntity.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__HDSimpleGraphDatabaseRelationshipEntity_removeRelationshipWithType_subjectNodeID_objectNodeID_database_error___block_invoke;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a4;
  v17[5] = a3;
  v17[6] = a5;
  v14 = objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM relationships WHERE subject_id = ? AND relationship_type = ? AND object_id = ?"), a7, v17, 0);

  return v14;
}

uint64_t __112__HDSimpleGraphDatabaseRelationshipEntity_removeRelationshipWithType_subjectNodeID_objectNodeID_database_error___block_invoke(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  return sqlite3_bind_int64(a2, 3, a1[6]);
}

+ (BOOL)enumerateRelationshipsWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E0D29890];
    v16 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 204);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithProperty:notEqualToValue:", CFSTR("object_id"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "compoundPredicateWithPredicate:otherPredicate:", v12, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v19;
  }
  objc_msgSend(a1, "queryWithDatabase:predicate:", v13, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E6CEED78;
  v25 = v14;
  v26 = a1;
  v21 = v14;
  v22 = objc_msgSend(v20, "enumerateProperties:error:enumerationHandler:", &unk_1E6DF9EF0, a6, v24);

  return v22;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 32);
  +[HDSimpleGraphDatabaseRelationshipEntity _relationshipForRow:]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a4);

  return v7;
}

+ (HDSimpleGraphRelationship)_relationshipForRow:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_opt_self();
  v0 = HDSQLiteColumnAsInt64();
  v1 = HDSQLiteColumnAsInt64();
  v2 = HDSQLiteColumnAsInt64();
  v3 = HDSQLiteColumnAsInt64();
  v4 = HDSQLiteColumnAsInt64();
  return -[HDSimpleGraphRelationship initWithRowID:subjectID:type:objectID:version:slots:]([HDSimpleGraphRelationship alloc], "initWithRowID:subjectID:type:objectID:version:slots:", v0, v1, v2, v3, v4, HDSQLiteColumnAsInt64());
}

+ (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  BOOL v21;
  _QWORD v22[5];
  BOOL v23;

  v9 = a4;
  v12 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &__block_descriptor_41_e15___NSString_8__0l;
  if (v9)
    v13 = &enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler__skipDeletedKey;
  else
    v13 = &enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler__includedDeletedKey;
  v22[4] = a1;
  v23 = v9;
  v19 = a1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_2;
  v20[3] = &__block_descriptor_41_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a3;
  v21 = v9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E6CEEDA0;
  v18 = v12;
  v14 = v12;
  v15 = objc_msgSend(a5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", v13, a6, v22, v20, v17);

  return v15;
}

id __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  int v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_opt_self();
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedDatabaseTable");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v1)
    v5 = objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ != ?"), CFSTR("rowid"), CFSTR("subject_id"), CFSTR("relationship_type"), CFSTR("object_id"), CFSTR("version"), CFSTR("slots"), v3, CFSTR("subject_id"), CFSTR("object_id"));
  else
    v5 = objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("rowid"), CFSTR("subject_id"), CFSTR("relationship_type"), CFSTR("object_id"), CFSTR("version"), CFSTR("slots"), v3, CFSTR("subject_id"), v8);
  v6 = (void *)v5;

  return v6;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  result = sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    return sqlite3_bind_int64(a2, 2, 204);
  return result;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  +[HDSimpleGraphDatabaseRelationshipEntity _relationshipForRow:]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

+ (id)databaseTable
{
  return CFSTR("relationships");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_80;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("subject_id");
  +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey](HDSimpleGraphDatabaseNodeEntity, "nodeEntityForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("object_id");
  v7[0] = v2;
  +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey](HDSimpleGraphDatabaseNodeEntity, "nodeEntityForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("subject_id");
  v3[1] = CFSTR("relationship_type");
  v3[2] = CFSTR("object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8 = CFSTR("object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("object_id_index"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
