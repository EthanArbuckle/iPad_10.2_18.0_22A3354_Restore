@implementation HDStateOfMindDomainEntity

+ (id)databaseTable
{
  return CFSTR("state_of_mind_domains");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_92;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDStateOfMindEntity, "defaultForeignKey");
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

+ (id)predicateForDomainsForObjectID:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("data_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)domainsForObjectID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[4] = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke_2;
  v17[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke_3;
  v15[3] = &unk_1E6CE8CF8;
  v12 = v10;
  v16 = v12;
  LODWORD(a5) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &domainsForObjectID_transaction_error__selectKey, a5, v18, v17, v15);

  if ((_DWORD)a5)
    v13 = (void *)objc_msgSend(v12, "copy");
  else
    v13 = 0;

  return v13;
}

id __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("domain"), v2, CFSTR("data_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __66__HDStateOfMindDomainEntity_domainsForObjectID_transaction_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (BOOL)insertDomainsForObjectID:(int64_t)a3 domains:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  _QWORD v28[5];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v22 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "integerValue");
        v15 = v22;
        v16 = objc_opt_self();
        objc_msgSend(v15, "databaseForEntityClass:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v27[5] = v14;
        v28[0] = v12;
        v28[1] = 3221225472;
        v28[2] = __79__HDStateOfMindDomainEntity__insertDomainForObjectID_domain_transaction_error___block_invoke;
        v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v28[4] = v16;
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __79__HDStateOfMindDomainEntity__insertDomainForObjectID_domain_transaction_error___block_invoke_2;
        v27[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
        v27[4] = a3;
        LODWORD(v14) = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertDomainForObjectID_domain_transaction_error__insertKey, a6, v28, v27, 0);

        if (!(_DWORD)v14)
        {
          v18 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_11:

  return v18;
}

id __79__HDStateOfMindDomainEntity__insertDomainForObjectID_domain_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@) VALUES (?, ?)"), v2, CFSTR("data_id"), CFSTR("domain"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __79__HDStateOfMindDomainEntity__insertDomainForObjectID_domain_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
