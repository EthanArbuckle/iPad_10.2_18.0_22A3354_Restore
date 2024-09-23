@implementation HDUserDomainConceptLocalizedStringEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_localized_strings");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_4;
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
  BOOL v19;
  id v22;
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
  v22 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a3, "propertyCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "type");
          if ((HKIsDeprecatedPropertyType() & 1) == 0)
          {
            v15 = v14;
            v16 = v22;
            objc_opt_self();
            objc_msgSend(v16, "protectedDatabase");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke_2;
            v27[3] = &unk_1E6CE82D8;
            v28 = v15;
            v29 = a4;
            v18 = v15;
            LODWORD(v16) = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertLocalizedString_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_16, v27, 0);

            if (!(_DWORD)v16)
            {
              v19 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_13:

  return v19;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __150__HDUserDomainConceptLocalizedStringEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v18[3] = &unk_1E6CEA338;
  v19 = v10;
  v12 = v10;
  v13 = v18;
  v14 = a6;
  v15 = objc_opt_self();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __131__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6CE82B0;
  v21 = v13;
  v16 = v13;
  LOBYTE(a7) = +[HDUserDomainConceptLocalizedStringEntity _enumerateLocalizedStringRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v15, a4, v14, (uint64_t)a7, v20);

  return (char)a7;
}

uint64_t __150__HDUserDomainConceptLocalizedStringEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
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
  _QWORD v13[4];
  id v14;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__HDUserDomainConceptLocalizedStringEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CE8CF8;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptLocalizedStringEntity _enumerateLocalizedStringRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __107__HDUserDomainConceptLocalizedStringEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  HDCodableUserDomainConceptLocalizedStringProperty *v9;

  v2 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v7 = v6;
  v8 = HDSQLiteColumnWithNameAsBoolean();
  v9 = objc_alloc_init(HDCodableUserDomainConceptLocalizedStringProperty);
  -[HDCodableUserDomainConceptLocalizedStringProperty setType:](v9, "setType:", v2);
  -[HDCodableUserDomainConceptLocalizedStringProperty setVersion:](v9, "setVersion:", v5);
  -[HDCodableUserDomainConceptLocalizedStringProperty setTimestamp:](v9, "setTimestamp:", v7);
  -[HDCodableUserDomainConceptLocalizedStringProperty setStringValue:](v9, "setStringValue:", v3);
  -[HDCodableUserDomainConceptLocalizedStringProperty setLocale:](v9, "setLocale:", v4);
  -[HDCodableUserDomainConceptLocalizedStringProperty setDeleted:](v9, "setDeleted:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addLocalizedStringProperties:", v9);

  return 1;
}

+ (uint64_t)_enumerateLocalizedStringRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
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
  v13[2] = __134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_218, v13, v8);

  return v11;
}

const __CFString *__105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_localized_strings (udc_id, property_type, string_value, locale, version, timestamp, deleted) VALUES (?, ?, ?, ?, ?, ?, ?)");
}

uint64_t __105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  double v6;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  sqlite3_bind_double(a2, 6, v6);
  return sqlite3_bind_int(a2, 7, objc_msgSend(*(id *)(a1 + 32), "isDeleted"));
}

const __CFString *__134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT property_type, string_value, locale, version, timestamp, deleted FROM user_domain_concept_localized_strings WHERE (udc_id = ?) ORDER BY ROWID");
}

uint64_t __134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __131__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;

  v2 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D08]), "initWithType:stringValue:locale:version:timestamp:deleted:", v2, v3, v4, v5, HDSQLiteColumnWithNameAsBoolean(), v6);
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v8;
}

@end
