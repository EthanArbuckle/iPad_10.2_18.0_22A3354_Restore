@implementation EDTableMetadataPersistence

+ (int64_t)largestDeletedRowIDForTableName:(id)a3 withConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int64_t v12;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("largest_deleted_rowid"), CFSTR("table_metadata"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("table_name"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "equalTo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v9);

  objc_msgSend(v7, "setLimit:", 1);
  v14 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__EDTableMetadataPersistence_largestDeletedRowIDForTableName_withConnection___block_invoke;
  v15[3] = &unk_1E949B090;
  v15[4] = &v16;
  LOBYTE(v8) = objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v7, v15, &v14);
  v10 = v14;
  if ((v8 & 1) == 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Getting largest_deleted_rowid for %@"), v5);
    objc_msgSend(v6, "handleError:message:", v10, v11);

  }
  v12 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v12;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("table_name"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("largest_deleted_rowid"), 0, &unk_1E94E4C28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("table_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithName:columns:primaryKeyColumns:", CFSTR("table_metadata"), v9, v10);

  v12 = (void *)MEMORY[0x1E0C9AA60];
  *a3 = (id)MEMORY[0x1E0C9AA60];
  *a4 = v12;
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)updateLargestDeletedRowID:(int64_t)a3 forTableName:(id)a4 withConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc(MEMORY[0x1E0D1F060]);
  v21[0] = CFSTR("table_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTable:conflictTarget:", CFSTR("table_metadata"), v10);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("table_name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("largest_deleted_rowid"));

  objc_msgSend(v11, "excludedColumnExpressionForColumnName:", CFSTR("largest_deleted_rowid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("largest_deleted_rowid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "greaterThan:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWhereClause:", v15);

  v20 = 0;
  v16 = objc_msgSend(v8, "executeUpsertStatement:error:", v11, &v20);
  v17 = v20;
  if ((v16 & 1) == 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Updating largest_deleted_rowid for %@"), v7);
    objc_msgSend(v8, "handleError:message:", v17, v18);

  }
  return v16;
}

void __77__EDTableMetadataPersistence_largestDeletedRowIDForTableName_withConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

@end
