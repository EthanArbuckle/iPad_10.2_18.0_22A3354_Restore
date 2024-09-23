@implementation HDSimpleGraphDatabaseNodeEntity

- (HDSimpleGraphDatabaseNodeEntity)init
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

+ (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  id v15;
  char v16;
  void *v18;
  _QWORD v19[7];
  BOOL v20;

  v15 = a7;
  if ((objc_msgSend(v15, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseNodeEntity.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke_2;
  v19[3] = &__block_descriptor_57_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  v20 = a6;
  v16 = objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertNodeWithID_version_slots_deleted_database_error__key, a8, &__block_literal_global_235, v19, 0);

  return v16;
}

const __CFString *__89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke()
{
  return CFSTR("INSERT INTO nodes (rowid, version, slots, deleted) VALUES (?, ?, ?, ?)");
}

uint64_t __89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == 0xFFFFFFFF80000000)
    sqlite3_bind_null(a2, 1);
  else
    sqlite3_bind_int64(a2, 1, v4);
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
  return sqlite3_bind_int(a2, 4, *(unsigned __int8 *)(a1 + 56));
}

+ (BOOL)updateNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  id v15;
  char v16;
  void *v18;
  _QWORD v19[7];
  BOOL v20;

  v15 = a7;
  if ((objc_msgSend(v15, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseNodeEntity.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke_2;
  v19[3] = &__block_descriptor_57_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a4;
  v19[5] = a5;
  v20 = a6;
  v19[6] = a3;
  v16 = objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateNodeWithID_version_slots_deleted_database_error__key, a8, &__block_literal_global_200_3, v19, 0);

  return v16;
}

const __CFString *__89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke()
{
  return CFSTR("UPDATE nodes SET version = ?, slots = ?, deleted = ? WHERE rowid = ?");
}

uint64_t __89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int(a2, 3, *(unsigned __int8 *)(a1 + 56));
  return sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 48));
}

+ (BOOL)deleteNodeWithID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v9;
  char v10;
  void *v12;
  _QWORD v13[5];

  v9 = a4;
  if ((objc_msgSend(v9, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseNodeEntity.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a3;
  v10 = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteNodeWithID_database_error__key, a5, &__block_literal_global_203_1, v13, 0);

  return v10;
}

const __CFString *__67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke()
{
  return CFSTR("DELETE FROM nodes WHERE rowid = ?");
}

uint64_t __67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

+ (id)nodeForID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  __CFString *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, sqlite3_stmt *);
  void *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t v40;

  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__198;
  v35 = __Block_byref_object_dispose__198;
  v36 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v25 = &v31;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke;
  v29 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v30 = a3;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke_2;
  v24 = &unk_1E6CFF750;
  v9 = CFSTR("SELECT rowid, version, slots, deleted FROM nodes WHERE rowid=?");
  v10 = v7;
  v11 = &v26;
  v12 = &v21;
  v13 = objc_opt_self();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler_, v13, CFSTR("HDSimpleGraphDatabaseNodeEntity.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"), v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);

  }
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __106__HDSimpleGraphDatabaseNodeEntity__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler___block_invoke;
  v37[3] = &unk_1E6D014F8;
  v39 = v12;
  v40 = v13;
  v38 = v10;
  v14 = v12;
  v15 = v10;
  v16 = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rowid, version, slots, deleted FROM nodes WHERE rowid=?"), a5, v11, v37);

  if (v16)
    v17 = (void *)v32[5];
  else
    v17 = 0;
  v18 = v17;
  _Block_object_dispose(&v31, 8);

  return v18;
}

uint64_t __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (BOOL)enumerateNodesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 limit:(unint64_t)a5 database:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];

  v12 = a4;
  v30[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a8;
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), &unk_1E6DFE858);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "compoundPredicateWithPredicate:otherPredicate:", v14, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v19;
  }
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v15, v14, a5, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("rowid");
  v30[1] = CFSTR("version");
  v30[2] = CFSTR("slots");
  v30[3] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __115__HDSimpleGraphDatabaseNodeEntity_enumerateNodesWithPredicate_skipDeleted_limit_database_error_enumerationHandler___block_invoke;
  v26[3] = &unk_1E6D0F980;
  v28 = v16;
  v29 = a1;
  v27 = v15;
  v22 = v16;
  v23 = v15;
  v24 = objc_msgSend(v20, "enumerateProperties:error:enumerationHandler:", v21, a7, v26);

  return v24;
}

uint64_t __115__HDSimpleGraphDatabaseNodeEntity_enumerateNodesWithPredicate_skipDeleted_limit_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[HDSimpleGraphDatabaseNodeEntity _callEnumerationHandlerForRow:database:error:enumerationHandler:](*(_QWORD *)(a1 + 48), a3, *(void **)(a1 + 32), a4, *(void **)(a1 + 40));
}

+ (uint64_t)_callEnumerationHandlerForRow:(void *)a3 database:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  uint64_t (**v7)(id, void *, _QWORD);
  id v8;
  HDSimpleGraphNode *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HDSimpleGraphNode *v13;
  uint64_t v14;

  v7 = a5;
  v8 = a3;
  objc_opt_self();
  objc_opt_self();
  v9 = [HDSimpleGraphNode alloc];
  v10 = HDSQLiteColumnAsInt64();
  v11 = HDSQLiteColumnAsInt64();
  v12 = HDSQLiteColumnAsInt64();
  v13 = -[HDSimpleGraphNode initWithRowID:attributes:relationships:version:slots:deleted:](v9, "initWithRowID:attributes:relationships:version:slots:deleted:", v10, 0, 0, v11, v12, HDSQLiteColumnAsInt64() != 0);

  if (v13)
    v14 = v7[2](v7, v13, a4);
  else
    v14 = 0;

  return v14;
}

+ (id)nodeEntityForeignKey
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", a1, CFSTR("rowid"), 2);
}

+ (id)databaseTable
{
  return CFSTR("nodes");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_99;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseAttributeEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (!v6)
  {
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedDatabaseTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "hasPrefix:", v11);

    if (v12)
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("subject_id"));
      v15 = CFSTR("object_id");
      if ((v14 & 1) != 0
        || (v16 = objc_msgSend(v9, "isEqualToString:", CFSTR("object_id")), v15 = CFSTR("subject_id"), v16))
      {
        v17 = v15;
        if (v17)
        {
          v18 = v17;
          v19 = (void *)MEMORY[0x1E0D29870];
          objc_msgSend(a1, "disambiguatedDatabaseTable");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v20, objc_opt_class(), 0, CFSTR("rowid"), v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_8;
        }
      }

    }
    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_METACLASS___HDSimpleGraphDatabaseNodeEntity;
    objc_msgSendSuper2(&v23, sel_joinClausesForProperty_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = (void *)MEMORY[0x1E0D29870];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v8, objc_opt_class(), 0, CFSTR("rowid"), CFSTR("node_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_11:
  return v10;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseAttributeEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", v5))
  {

  }
  else
  {
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hasPrefix:", v6);

    if (!v7)
    {
      v11.receiver = a1;
      v11.super_class = (Class)&OBJC_METACLASS___HDSimpleGraphDatabaseNodeEntity;
      objc_msgSendSuper2(&v11, sel_disambiguatedSQLForProperty_, v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v8 = v4;
LABEL_6:
  v9 = v8;

  return v9;
}

uint64_t __106__HDSimpleGraphDatabaseNodeEntity__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSimpleGraphDatabaseNodeEntity _callEnumerationHandlerForRow:database:error:enumerationHandler:](*(_QWORD *)(a1 + 48), a2, *(void **)(a1 + 32), a3, *(void **)(a1 + 40));
}

@end
