@implementation HDUserDomainConceptEducationContentSectionDataEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_education_content_section_data");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_9;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("section_id");
  +[HDHealthEntity defaultForeignKey](HDUserDomainConceptEducationContentSectionEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertEducationContentSectionData:(id)a3 sectionPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke_2;
  v27[3] = &unk_1E6CE82D8;
  v29 = a4;
  v12 = v9;
  v28 = v12;
  LODWORD(v9) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertEducationContentSectionData_sectionPersistentID_transaction_error__statementKey, a6, &__block_literal_global_21, v27, 0);

  if ((_DWORD)v9)
  {
    objc_msgSend(v10, "protectedDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastInsertRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "longLongValue");
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v12, "stringValues", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            if (!+[HDUserDomainConceptEducationContentSectionDataStringsEntity insertEducationContentSectionDataString:sectionDataPersistentID:transaction:error:](HDUserDomainConceptEducationContentSectionDataStringsEntity, "insertEducationContentSectionDataString:sectionDataPersistentID:transaction:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v15, v10, a6))
            {
              v21 = 0;
              goto LABEL_14;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
          if (v18)
            continue;
          break;
        }
      }
      v21 = 1;
LABEL_14:

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

const __CFString *__128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_education_content_section_data (section_id, metadata_kind, version, timestamp, deleted) VALUES (?, ?, ?, ?, ?)");
}

uint64_t __128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "sectionDataType"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  sqlite3_bind_double(a2, 4, v4);
  return sqlite3_bind_int(a2, 5, objc_msgSend(*(id *)(a1 + 32), "deleted"));
}

+ (BOOL)enumerateSectionDataForEducationContentSectionID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a4;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E6CEB1D8;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionDataEntity _enumerateSectionDataRowsForEducationContentSectionPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, v13, (uint64_t)a5, v15);

  return (char)a5;
}

uint64_t __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;

  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v9 = v8;
  v10 = HDSQLiteColumnWithNameAsBoolean();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = *(_QWORD *)(a1 + 32);
  v26 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke_2;
  v24 = &unk_1E6CEB1B0;
  v13 = v11;
  v25 = v13;
  v14 = +[HDUserDomainConceptEducationContentSectionDataStringsEntity enumerateSectionDataStringsForEducationContentSectionDataID:transaction:error:enumerationHandler:](HDUserDomainConceptEducationContentSectionDataStringsEntity, "enumerateSectionDataStringsForEducationContentSectionDataID:transaction:error:enumerationHandler:", v5, v12, &v26, &v21);
  v15 = v26;
  v16 = v15;
  if (v14)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB6998]);
    v18 = (void *)objc_msgSend(v17, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v13, v6, v7, v10, v9, v21, v22, v23, v24);
    v19 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v19 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v15);
  }

  return v19;
}

uint64_t __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];

  v8 = a5;
  v9 = a3;
  objc_opt_self();
  objc_msgSend(v9, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_215, v13, v8);

  return v11;
}

+ (BOOL)addSectionDataToCodable:(id)a3 educationContentSectionID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a3;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __124__HDUserDomainConceptEducationContentSectionDataEntity_addSectionDataToCodable_educationContentSectionID_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE8D20;
  v16 = v11;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionDataEntity _enumerateSectionDataRowsForEducationContentSectionPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __124__HDUserDomainConceptEducationContentSectionDataEntity_addSectionDataToCodable_educationContentSectionID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  HDCodableSectionData *v11;
  _BOOL8 v12;

  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v9 = v8;
  v10 = HDSQLiteColumnWithNameAsBoolean();
  v11 = objc_alloc_init(HDCodableSectionData);
  -[HDCodableSectionData setSectionDataType:](v11, "setSectionDataType:", v6);
  -[HDCodableSectionData setVersion:](v11, "setVersion:", v7);
  -[HDCodableSectionData setTimestamp:](v11, "setTimestamp:", v9);
  -[HDCodableSectionData setDeleted:](v11, "setDeleted:", v10);
  v12 = +[HDUserDomainConceptEducationContentSectionDataStringsEntity addSectionDataStringsToCodable:sectionDataID:transaction:error:](HDUserDomainConceptEducationContentSectionDataStringsEntity, "addSectionDataStringsToCodable:sectionDataID:transaction:error:", v11, v5, *(_QWORD *)(a1 + 32), a3);
  if (v12)
    objc_msgSend(*(id *)(a1 + 40), "addSectionData:", v11);

  return v12;
}

const __CFString *__157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT * FROM user_domain_concept_education_content_section_data WHERE (section_id = ?) ORDER BY ROWID");
}

uint64_t __157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
