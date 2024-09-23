@implementation HDUserDomainConceptEducationContentEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_education_content");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_42;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDUserDomainConceptEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  BOOL v22;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  int64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "propertyCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          v16 = v25;
          objc_opt_self();
          objc_msgSend(v16, "protectedDatabase");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke_2;
          v30[3] = &unk_1E6CE82D8;
          v32 = a4;
          v18 = v15;
          v31 = v18;
          LODWORD(v15) = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_83, v30, 0);

          if (!(_DWORD)v15
            || (objc_msgSend(v16, "protectedDatabase"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v19, "lastInsertRowID"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v19,
                !v20))
          {

LABEL_14:
            v22 = 0;
            goto LABEL_15;
          }
          v21 = +[HDUserDomainConceptEducationContentSectionEntity insertLocalizedEducationContentSectionsFor:educationContentID:transaction:error:](HDUserDomainConceptEducationContentSectionEntity, "insertLocalizedEducationContentSectionsFor:educationContentID:transaction:error:", v18, objc_msgSend(v20, "longLongValue"), v16, a6);

          if (!v21)
            goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_15:

  return v22;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __151__HDUserDomainConceptEducationContentEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v19[3] = &unk_1E6CF5E88;
  v20 = v10;
  v12 = v10;
  v13 = a6;
  v14 = v19;
  v15 = objc_opt_self();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6CEB1D8;
  v22 = v13;
  v23 = v14;
  v16 = v14;
  v17 = v13;
  LOBYTE(a7) = +[HDUserDomainConceptEducationContentEntity _enumerateLocalizedEducationContentRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v15, a4, v17, (uint64_t)a7, v21);

  return (char)a7;
}

uint64_t __151__HDUserDomainConceptEducationContentEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
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
  v15[2] = __108__HDUserDomainConceptEducationContentEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE8D20;
  v16 = v11;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentEntity _enumerateLocalizedEducationContentRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __108__HDUserDomainConceptEducationContentEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDCodableOntologyLocalizedEducationContent *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  _BOOL8 v11;

  v5 = objc_alloc_init(HDCodableOntologyLocalizedEducationContent);
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v9 = v8;
  v10 = HDSQLiteColumnWithNameAsBoolean();
  -[HDCodableOntologyLocalizedEducationContent setVersion:](v5, "setVersion:", v7);
  -[HDCodableOntologyLocalizedEducationContent setTimestamp:](v5, "setTimestamp:", v9);
  -[HDCodableOntologyLocalizedEducationContent setDeleted:](v5, "setDeleted:", v10);
  v11 = +[HDUserDomainConceptEducationContentSectionEntity addSectionsToCodable:educationContentID:transaction:error:](HDUserDomainConceptEducationContentSectionEntity, "addSectionsToCodable:educationContentID:transaction:error:", v5, v6, *(_QWORD *)(a1 + 32), a3);
  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "setOntologyLocalizedEducationContent:", v5);

  return v11;
}

+ (uint64_t)_enumerateLocalizedEducationContentRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
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
  v13[2] = __145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_212, v13, v8);

  return v11;
}

const __CFString *__127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_education_content (udc_id, version, timestamp, deleted) VALUES (?, ?, ?, ?)");
}

uint64_t __127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  sqlite3_bind_double(a2, 3, v4);
  return sqlite3_bind_int(a2, 4, objc_msgSend(*(id *)(a1 + 32), "isDeleted"));
}

const __CFString *__145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT * FROM user_domain_concept_education_content WHERE (udc_id = ?) ORDER BY ROWID");
}

uint64_t __145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;

  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v9 = v8;
  v10 = HDSQLiteColumnWithNameAsBoolean();
  v11 = *(_QWORD *)(a1 + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v17[3] = &unk_1E6CF5EF0;
  v12 = v6;
  v18 = v12;
  if (+[HDUserDomainConceptEducationContentSectionEntity enumerateLocalizedEducationContentSectionsWithEducationContentID:transaction:error:enumerationHandler:](HDUserDomainConceptEducationContentSectionEntity, "enumerateLocalizedEducationContentSectionsWithEducationContentID:transaction:error:enumerationHandler:", v5, v11, a3, v17))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69A0]), "initWithSections:version:timestamp:deleted:", v12, v7, v10, v9);
    v15 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v13 + 16))(v13, v14, a3);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

@end
