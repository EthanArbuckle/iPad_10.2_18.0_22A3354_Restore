@implementation EDAddBusinessesSchemaUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EDAddBusinessesSchemaUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (id)log_log_2;
}

void __39__EDAddBusinessesSchemaUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3 databaseName:(id)a4 updateProtectedSchema:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  sqlite3 *v13;
  NSObject *v14;
  void *v15;
  sqlite3 *v16;
  id v17;
  NSObject *v18;
  void *v19;
  sqlite3 *v20;
  id v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  void *v25;
  sqlite3 *v26;
  void *v27;
  sqlite3 *v28;
  NSObject *v29;
  uint8_t v31[16];
  uint8_t v32[2];
  __int16 v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = sqlite3_exec((sqlite3 *)objc_msgSend(v8, "sqlDB"), "DROP TABLE IF EXISTS businesses", 0, 0, 0);
  if (v10)
  {
    +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Failed to drop businesses table", buf, 2u);
    }
    goto LABEL_28;
  }
  if (!v5)
    goto LABEL_19;
  if (!objc_msgSend(v8, "columnExists:inTable:type:", CFSTR("domain"), CFSTR("addresses"), 0))
  {
LABEL_15:
    objc_msgSend(a1, "_businessesTableSchema");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject definitionWithDatabaseName:](v11, "definitionWithDatabaseName:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (sqlite3 *)objc_msgSend(v8, "sqlDB");
    v21 = objc_retainAutorelease(v19);
    v10 = sqlite3_exec(v20, (const char *)objc_msgSend(v21, "UTF8String"), 0, 0, 0);
    if (v10)
    {
      +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 0;
        v23 = "Failed to create businesses table";
        v24 = (uint8_t *)&v33;
LABEL_22:
        _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, v23, v24, 2u);
        goto LABEL_27;
      }
      goto LABEL_27;
    }

LABEL_19:
    objc_msgSend(a1, "_businessAddressesTableSchema");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject definitionWithDatabaseName:](v11, "definitionWithDatabaseName:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (sqlite3 *)objc_msgSend(v8, "sqlDB");
    v21 = objc_retainAutorelease(v25);
    v10 = sqlite3_exec(v26, (const char *)objc_msgSend(v21, "UTF8String"), 0, 0, 0);
    if (!v10)
    {
      objc_msgSend(a1, "_businessCategoriesTableSchema");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject definitionWithDatabaseName:](v22, "definitionWithDatabaseName:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (sqlite3 *)objc_msgSend(v8, "sqlDB");
      v21 = objc_retainAutorelease(v27);
      v10 = sqlite3_exec(v28, (const char *)objc_msgSend(v21, "UTF8String"), 0, 0, 0);
      if (v10)
      {
        +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1D2F2C000, v29, OS_LOG_TYPE_DEFAULT, "Failed to create business_categories table", v31, 2u);
        }

      }
      goto LABEL_27;
    }
    +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      v23 = "Failed to create sender_businesses table";
      v24 = v32;
      goto LABEL_22;
    }
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@.addresses DROP COLUMN domain;"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (sqlite3 *)objc_msgSend(v8, "sqlDB");
  v11 = objc_retainAutorelease(v12);
  v10 = sqlite3_exec(v13, (const char *)-[NSObject UTF8String](v11, "UTF8String"), 0, 0, 0);
  if (v10)
  {
    +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Failed to drop address and domain columns", v35, 2u);
    }

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@.addresses DROP COLUMN business;"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (sqlite3 *)objc_msgSend(v8, "sqlDB");
  v17 = objc_retainAutorelease(v15);
  v10 = sqlite3_exec(v16, (const char *)objc_msgSend(v17, "UTF8String"), 0, 0, 0);
  if (!v10)
  {

    goto LABEL_15;
  }
  +[EDAddBusinessesSchemaUpgradeStep log](EDAddBusinessesSchemaUpgradeStep, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Failed to drop address and domain columns", v34, 2u);
  }

LABEL_28:
  return v10;
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

+ (id)_businessesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("address_comment"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("domain"), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("businesses"), 2, v5);

  v9[0] = CFSTR("address_comment");
  v9[1] = CFSTR("domain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", v7, 1);

  return v6;
}

+ (id)_businessAddressesTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("business"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("business_addresses"), 1, v5);

  v9 = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUniquenessConstraintForColumns:conflictResolution:", v7, 1);

  return v6;
}

@end
