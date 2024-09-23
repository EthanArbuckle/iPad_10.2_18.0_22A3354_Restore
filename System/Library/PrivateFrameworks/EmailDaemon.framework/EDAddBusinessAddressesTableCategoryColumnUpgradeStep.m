@implementation EDAddBusinessAddressesTableCategoryColumnUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (id)log_log_1;
}

void __59__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  sqlite3 *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint8_t v25[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("address"), CFSTR("business_categories"), 0))
  {
    v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v4, "sqlDB"), "ALTER TABLE business_categories RENAME TO old_business_categories;",
           0,
           0,
           0);
    if (v5)
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.5();
      goto LABEL_30;
    }
    objc_msgSend(a1, "_businessCategoriesTableSchema");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject definitionWithDatabaseName:](v6, "definitionWithDatabaseName:", &stru_1E94A4508);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (sqlite3 *)objc_msgSend(v4, "sqlDB");
    v9 = objc_retainAutorelease(v7);
    v5 = sqlite3_exec(v8, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
    if (v5)
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.4();
LABEL_14:

      goto LABEL_30;
    }
    v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v4, "sqlDB"), "INSERT INTO business_categories (business, category) SELECT business, category FROM old_business_categories;",
           0,
           0,
           0);
    if (v5)
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.3();
      goto LABEL_14;
    }
    v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v4, "sqlDB"), "DROP TABLE old_business_categories;", 0, 0, 0);
    if (v5)
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.2();
      goto LABEL_14;
    }

  }
  if ((objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("category"), CFSTR("business_addresses"), 0) & 1) != 0
    || (v5 = sqlite3_exec((sqlite3 *)objc_msgSend(v4, "sqlDB"), (const char *)objc_msgSend(CFSTR("ALTER TABLE business_addresses ADD COLUMN category INTEGER;"),
                               "UTF8String"),
               0,
               0,
               0)) == 0)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("business"), CFSTR("business_categories"));
    -[NSObject addResultColumn:](v6, "addResultColumn:", CFSTR("category"));
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2020000000;
    v24 = 1;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_runWithConnection___block_invoke;
    v18[3] = &unk_1E949ADD0;
    v20 = buf;
    v19 = v4;
    v17 = 0;
    v11 = objc_msgSend(v19, "executeSelectStatement:withBlock:error:", v6, v18, &v17);
    v12 = v17;
    if (v11)
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 134217984;
        v26 = 0;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Successfully populated %lu rows in the business_addresses table.", v25, 0xCu);
      }

      if (v22[24])
      {
        v5 = 0;
LABEL_29:

        _Block_object_dispose(buf, 8);
        goto LABEL_30;
      }
    }
    else
    {
      +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.1(v15, v25, v14);
      }

    }
    v5 = 1;
    goto LABEL_29;
  }
  +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Failed to add category column in business_addresses table", buf, 2u);
  }
LABEL_30:

  return v5;
}

void __74__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_runWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("business_addresses"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("category"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhereClause:", v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v11 + 24))
  {
    v12 = *(void **)(a1 + 32);
    v21 = 0;
    v13 = objc_msgSend(v12, "executeUpdateStatement:error:", v8, &v21);
    v14 = v21;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  *(_BYTE *)(v11 + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v5, "longLongValue");
      v17 = objc_msgSend(v7, "integerValue");
      *(_DWORD *)buf = 134218240;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated category for business ID %lld to %ld", buf, 0x16u);
    }
  }
  else
  {
    +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log](EDAddBusinessAddressesTableCategoryColumnUpgradeStep, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(v5, "longLongValue");
      v19 = objc_msgSend(v7, "integerValue");
      objc_msgSend(v14, "ef_publicDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v23 = v18;
      v24 = 2048;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_ERROR, "Failed to update category for business ID %lld to %ld due to error %@{public}", buf, 0x20u);

    }
  }

}

+ (id)_businessCategoriesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("business"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("category"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("business_categories"), 1, v5);

  v9 = CFSTR("business");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", v7, 1);

  return v6;
}

+ (void)runWithConnection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to update business_addresses table due to error %@{public}", buf, 0xCu);

}

+ (void)runWithConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Failed to drop old_business_categories table", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithConnection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Failed to drop populate business_categories table with existing user overrides", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithConnection:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Failed to create new business_categories table", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithConnection:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Failed to rename business_categories table", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
