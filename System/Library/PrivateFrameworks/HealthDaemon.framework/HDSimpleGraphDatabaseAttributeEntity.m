@implementation HDSimpleGraphDatabaseAttributeEntity

- (HDSimpleGraphDatabaseAttributeEntity)init
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

+ (BOOL)addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  char v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;

  v16 = a4;
  v17 = a8;
  if ((objc_msgSend(v17, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseAttributeEntity.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke_2;
  v22[3] = &unk_1E6CF1740;
  v23 = v16;
  v24 = a5;
  v25 = a3;
  v26 = a6;
  v27 = a7;
  v18 = v16;
  v19 = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &addAttributeWithType_value_nodeID_version_slots_database_error__key, a9, &__block_literal_global_55, v22, 0);

  return v19;
}

const __CFString *__103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke()
{
  return CFSTR("INSERT INTO attributes (node_id, attribute_type, value, version, slots) VALUES (?, ?, ?, ?, ?)");
}

uint64_t __103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[5]);
  sqlite3_bind_int64(a2, 2, a1[6]);
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 4, a1[7]);
  return sqlite3_bind_int64(a2, 5, a1[8]);
}

+ (BOOL)updateSlots:(unint64_t)a3 nodeID:(int64_t)a4 type:(int64_t)a5 database:(id)a6 error:(id *)a7
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseAttributeEntity.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  v14 = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateSlots_nodeID_type_database_error__key, a7, &__block_literal_global_204_0, v17, 0);

  return v14;
}

const __CFString *__79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke()
{
  return CFSTR("UPDATE attributes SET slots = ? WHERE node_id = ? AND attribute_type = ?");
}

uint64_t __79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  return sqlite3_bind_int64(a2, 3, a1[6]);
}

+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 type:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  char v12;
  void *v14;
  _QWORD v15[6];

  v11 = a5;
  if ((objc_msgSend(v11, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseAttributeEntity.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v15[5] = a4;
  v12 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteAttributesWithNodeID_type_database_error__key, a6, &__block_literal_global_207, v15, 0);

  return v12;
}

const __CFString *__87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke()
{
  return CFSTR("DELETE FROM attributes WHERE node_id = ? AND attribute_type = ?");
}

uint64_t __87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  char v12;
  void *v14;
  _QWORD v15[6];

  v11 = a5;
  if ((objc_msgSend(v11, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseAttributeEntity.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v15[5] = a4;
  v12 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteAttributesWithNodeID_lessThanVersion_database_error__key, a6, &__block_literal_global_211, v15, 0);

  return v12;
}

const __CFString *__98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke()
{
  return CFSTR("DELETE FROM attributes WHERE node_id = ? AND version < ?");
}

uint64_t __98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 nodeID:(int64_t)a5 type:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v13;
  int64_t v14;
  _QWORD v16[7];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v13 = a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[6] = &v26;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a5;
  v17[5] = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_3;
  v16[3] = &unk_1E6CF1808;
  v16[4] = &v22;
  v16[5] = &v18;
  if ((objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &maxVersion_slots_nodeID_type_database_error__key, a8, &__block_literal_global_214_0, v17, v16) & 1) != 0)
  {
    if (*((_BYTE *)v27 + 24))
    {
      if (a3)
        *a3 = v23[3];
      if (a4)
        *a4 = v19[3];
      v14 = 1;
    }
    else
    {
      v14 = 2;
    }
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

const __CFString *__84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke()
{
  return CFSTR("SELECT MAX(version), MAX(slots) FROM attributes WHERE node_id = ? AND attribute_type = ? GROUP BY node_id, attribute_type LIMIT 1");
}

uint64_t __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_3(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return 0;
}

+ (BOOL)enumerateAttributesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("value"), CFSTR("hgNULL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "compoundPredicateWithPredicate:otherPredicate:", v12, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v17;
  }
  objc_msgSend(a1, "queryWithDatabase:predicate:", v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &unk_1E6CEED78;
  v23 = v14;
  v24 = a1;
  v19 = v14;
  v20 = objc_msgSend(v18, "enumerateProperties:error:enumerationHandler:", &unk_1E6DF8CF0, a6, v22);

  return v20;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 32);
  +[HDSimpleGraphDatabaseAttributeEntity _attributeForRow:](*(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a4);

  return v7;
}

+ (HDSimpleGraphAttribute)_attributeForRow:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  HDSimpleGraphAttribute *v8;

  objc_opt_self();
  v3 = HDSQLiteColumnAsInt64();
  v4 = HDSQLiteColumnAsInt64();
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnAsInt64();
  v8 = -[HDSimpleGraphAttribute initWithRowID:type:value:nodeID:version:slots:]([HDSimpleGraphAttribute alloc], "initWithRowID:type:value:nodeID:version:slots:", v3, v5, v6, v4, v7, HDSQLiteColumnAsInt64());

  return v8;
}

+ (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
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
  v22[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &__block_descriptor_41_e15___NSString_8__0l;
  if (v9)
    v13 = &enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler__skipDeletedKey;
  else
    v13 = &enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler__includedDeletedKey;
  v22[4] = a1;
  v23 = v9;
  v19 = a1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_2;
  v20[3] = &__block_descriptor_41_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a3;
  v21 = v9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E6CEEDA0;
  v18 = v12;
  v14 = v12;
  v15 = objc_msgSend(a5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", v13, a6, v22, v20, v17);

  return v15;
}

id __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1)
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
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseAttributeEntity, "disambiguatedDatabaseTable");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v1)
    v5 = objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ != ?"), CFSTR("rowid"), CFSTR("node_id"), CFSTR("attribute_type"), CFSTR("value"), CFSTR("version"), CFSTR("slots"), v3, CFSTR("node_id"), CFSTR("value"));
  else
    v5 = objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("rowid"), CFSTR("node_id"), CFSTR("attribute_type"), CFSTR("value"), CFSTR("version"), CFSTR("slots"), v3, CFSTR("node_id"), v8);
  v6 = (void *)v5;

  return v6;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  result = sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    return HDSQLiteBindStringToStatement();
  return result;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  +[HDSimpleGraphDatabaseAttributeEntity _attributeForRow:](*(_QWORD *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

+ (id)predicateForAttributesWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("attribute_type"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)databaseTable
{
  return CFSTR("attributes");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_23;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("node_id");
  +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey](HDSimpleGraphDatabaseNodeEntity, "nodeEntityForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("node_id");
  v3[1] = CFSTR("attribute_type");
  v3[2] = CFSTR("value");
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
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v8[0] = CFSTR("attribute_type");
  v8[1] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("type_value_index"), v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
