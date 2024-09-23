@implementation HDUserDomainConceptEducationContentSectionDataStringsEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_education_content_section_data_strings");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_7;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("section_data_id");
  +[HDHealthEntity defaultForeignKey](HDUserDomainConceptEducationContentSectionDataEntity, "defaultForeignKey");
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

+ (BOOL)insertEducationContentSectionDataString:(id)a3 sectionDataPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v9 = a3;
  objc_msgSend(a5, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E6CE82D8;
  v14 = v9;
  v15 = a4;
  v11 = v9;
  LOBYTE(a6) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error__statementKey, a6, &__block_literal_global_19, v13, 0);

  return (char)a6;
}

const __CFString *__145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_education_content_section_data_strings (section_data_id, string_value) VALUES (?, ?)");
}

uint64_t __145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return HDSQLiteBindStringToStatement();
}

+ (BOOL)enumerateSectionDataStringsForEducationContentSectionDataID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __160__HDUserDomainConceptEducationContentSectionDataStringsEntity_enumerateSectionDataStringsForEducationContentSectionDataID_transaction_error_enumerationHandler___block_invoke;
  v13[3] = &unk_1E6CE82B0;
  v14 = v10;
  v11 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionDataStringsEntity _enumerateSectionDataRowsForEducationContentSectionDataPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, a4, (uint64_t)a5, v13);

  return (char)a5;
}

uint64_t __160__HDUserDomainConceptEducationContentSectionDataStringsEntity_enumerateSectionDataStringsForEducationContentSectionDataID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionDataPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
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
  v13[2] = __168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_205, v13, v8);

  return v11;
}

+ (BOOL)addSectionDataStringsToCodable:(id)a3 sectionDataID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __126__HDUserDomainConceptEducationContentSectionDataStringsEntity_addSectionDataStringsToCodable_sectionDataID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CE8CF8;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionDataStringsEntity _enumerateSectionDataRowsForEducationContentSectionDataPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __126__HDUserDomainConceptEducationContentSectionDataStringsEntity_addSectionDataStringsToCodable_sectionDataID_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addStringValues:", v2);

  return 1;
}

const __CFString *__168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT string_value FROM user_domain_concept_education_content_section_data_strings WHERE (section_data_id = ?) ORDER BY ROWID");
}

uint64_t __168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
