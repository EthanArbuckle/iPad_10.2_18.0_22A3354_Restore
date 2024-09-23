@implementation HDUserDomainConceptEducationContentSectionEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_education_content_sections");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_72;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("education_content_id");
  +[HDHealthEntity defaultForeignKey](HDUserDomainConceptEducationContentEntity, "defaultForeignKey");
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

const __CFString *__149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_education_content_sections (education_content_id, section_type) VALUES (?, ?)");
}

uint64_t __149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "sectionType"));
}

+ (BOOL)insertLocalizedEducationContentSectionsFor:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  int64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(a3, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = *(_QWORD *)v34;
    v31 = v10;
    v32 = v9;
    v28 = a4;
    v27 = *(_QWORD *)v34;
    while (2)
    {
      v14 = 0;
      v29 = v11;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v30 = v14;
        v18 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v14);
        v15 = v9;
        objc_opt_self();
        objc_msgSend(v15, "protectedDatabase");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v12;
        v41[1] = 3221225472;
        v41[2] = __149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke_2;
        v41[3] = &unk_1E6CE82D8;
        v43 = a4;
        v17 = v18;
        v42 = v17;
        LODWORD(v18) = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction__statementKey, a6, &__block_literal_global_175, v41, 0);

        if (!(_DWORD)v18)
        {

          goto LABEL_21;
        }
        objc_msgSend(v15, "protectedDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastInsertRowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {

          LOBYTE(v18) = 0;
          goto LABEL_21;
        }
        v21 = objc_msgSend(v20, "longLongValue");
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v17, "sectionData");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v18);
              if (!+[HDUserDomainConceptEducationContentSectionDataEntity insertEducationContentSectionData:sectionPersistentID:transaction:error:](HDUserDomainConceptEducationContentSectionDataEntity, "insertEducationContentSectionData:sectionPersistentID:transaction:error:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v21, v15, a6))
              {

                LOBYTE(v18) = 0;
                v10 = v31;
                v9 = v32;
                goto LABEL_21;
              }
            }
            v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v23)
              continue;
            break;
          }
        }

        v14 = v30 + 1;
        v10 = v31;
        v9 = v32;
        a4 = v28;
        v12 = MEMORY[0x1E0C809B0];
        v13 = v27;
      }
      while (v30 + 1 != v29);
      v11 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      LOBYTE(v18) = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }
LABEL_21:

  return (char)v18;
}

+ (BOOL)enumerateLocalizedEducationContentSectionsWithEducationContentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
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
  v15[2] = __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E6CEB1D8;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionEntity _enumerateLocalizedEducationContentSectionRowsWithEducationContentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, v13, (uint64_t)a5, v15);

  return (char)a5;
}

uint64_t __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *(_QWORD *)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &unk_1E6D00940;
  v9 = v7;
  v16 = v9;
  if (+[HDUserDomainConceptEducationContentSectionDataEntity enumerateSectionDataForEducationContentSectionID:transaction:error:enumerationHandler:](HDUserDomainConceptEducationContentSectionDataEntity, "enumerateSectionDataForEducationContentSectionID:transaction:error:enumerationHandler:", v5, v8, a3, v15))
  {
    objc_msgSend(v9, "hk_mapToDictionary:", &__block_literal_global_205_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69A8]), "initWithSectionDataTypeMapping:sectionType:", v10, v6);
    v13 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v12, a3);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v6, v8, v7);

}

+ (uint64_t)_enumerateLocalizedEducationContentSectionRowsWithEducationContentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
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
  v13[2] = __158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_212_1, v13, v8);

  return v11;
}

+ (BOOL)addSectionsToCodable:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
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
  v15[2] = __110__HDUserDomainConceptEducationContentSectionEntity_addSectionsToCodable_educationContentID_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE8D20;
  v16 = v11;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionEntity _enumerateLocalizedEducationContentSectionRowsWithEducationContentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __110__HDUserDomainConceptEducationContentSectionEntity_addSectionsToCodable_educationContentID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  HDCodableOntologyLocalizedEducationContentSection *v7;
  _BOOL8 v8;

  v5 = HDSQLiteColumnWithNameAsInt64();
  v6 = HDSQLiteColumnWithNameAsInt64();
  v7 = objc_alloc_init(HDCodableOntologyLocalizedEducationContentSection);
  -[HDCodableOntologyLocalizedEducationContentSection setSectionType:](v7, "setSectionType:", v6);
  v8 = +[HDUserDomainConceptEducationContentSectionDataEntity addSectionDataToCodable:educationContentSectionID:transaction:error:](HDUserDomainConceptEducationContentSectionDataEntity, "addSectionDataToCodable:educationContentSectionID:transaction:error:", v7, v5, *(_QWORD *)(a1 + 32), a3);
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addSections:", v7);

  return v8;
}

const __CFString *__158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT * FROM user_domain_concept_education_content_sections WHERE (education_content_id = ?) ORDER BY ROWID");
}

uint64_t __158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
