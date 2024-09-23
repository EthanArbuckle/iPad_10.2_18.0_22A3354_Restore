@implementation EDBusinessPersistence

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EDBusinessPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1)
    dispatch_once(&log_onceToken_12, block);
  return (id)log_log_12;
}

void __28__EDBusinessPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;

}

- (EDBusinessPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v7;
  id v8;
  EDBusinessPersistence *v9;
  EDBusinessPersistence *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)EDBusinessPersistence;
  v9 = -[EDBusinessPersistence init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    -[EDPersistenceDatabase protectedDatabasePersistence](v10->_database, "protectedDatabasePersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDProtectedDatabasePersistence deleteMergeHandler](EDProtectedDatabasePersistence, "deleteMergeHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerMergeHandler:forTable:", v12, CFSTR("business_addresses"));

    -[EDPersistenceDatabase protectedDatabasePersistence](v10->_database, "protectedDatabasePersistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDProtectedDatabasePersistence replaceMergeHandler](EDProtectedDatabasePersistence, "replaceMergeHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerMergeHandler:forTable:", v14, CFSTR("business_categories"));

    objc_storeStrong((id *)&v10->_hookRegistry, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("businessPersistence", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    objc_msgSend(v8, "registerProtectedDataReconciliationHookResponder:", v10);
  }

  return v10;
}

+ (NSString)businessesTableName
{
  return (NSString *)CFSTR("businesses");
}

+ (NSString)businessesDomainColumnName
{
  return (NSString *)CFSTR("domain");
}

+ (NSString)businessesDisplayNameColumnName
{
  return (NSString *)CFSTR("address_comment");
}

+ (NSString)businessAddressesTableName
{
  return (NSString *)CFSTR("business_addresses");
}

+ (NSString)businessAddressesAddressColumnName
{
  return (NSString *)CFSTR("address");
}

+ (NSString)businessAddressesBusinessColumnName
{
  return (NSString *)CFSTR("business");
}

+ (NSString)businessAddressesCategoryColumnName
{
  return (NSString *)CFSTR("category");
}

+ (NSString)businessCategoriesTableName
{
  return (NSString *)CFSTR("business_categories");
}

+ (NSString)businessCategoriesBusinessColumnName
{
  return (NSString *)CFSTR("business");
}

+ (NSString)businessCategoriesCategoryColumnName
{
  return (NSString *)CFSTR("category");
}

+ (id)businessCategoriesTableSchema
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

+ (id)businessesTableSchema
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

+ (id)businessAddressesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("business"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("category"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("business_addresses"), 1, v6);

  v10 = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v8, 1);

  return v7;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v6;
  void *v7;
  EDPersistenceAssociationPlaceholder *v8;
  void *v9;
  void *v10;
  EDPersistenceAssociationPlaceholder *v11;
  EDPersistenceAssociationPlaceholder *v12;
  void *v13;
  EDPersistenceAssociationPlaceholder *v14;
  EDPersistenceAssociationPlaceholder *v15;
  void *v16;
  EDPersistenceAssociationPlaceholder *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  +[EDBusinessPersistence businessAddressesTableSchema](EDBusinessPersistence, "businessAddressesTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBusinessPersistence businessCategoriesTableSchema](EDBusinessPersistence, "businessCategoriesTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v6, "columnForName:", CFSTR("address"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v8, "initWithColumn:tableName:", v9, v10);

  v12 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v6, "columnForName:", CFSTR("business"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v12, "initWithColumn:tableName:", v13, CFSTR("businesses"));

  v15 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v7, "columnForName:", CFSTR("business"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v15, "initWithColumn:tableName:", v16, CFSTR("businesses"));

  *a3 = (id)MEMORY[0x1E0C9AA60];
  v21[0] = v11;
  v21[1] = v14;
  v21[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = (id)MEMORY[0x1E0C9AA60];
  +[EDBusinessPersistence businessesTableSchema](EDBusinessPersistence, "businessesTableSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)insertOrUpdateUserOverrideForAddressIDs:(id)a3 category:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    -[EDBusinessPersistence database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence insertOrUpdateUserOverrideForAddressIDs:category:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__EDBusinessPersistence_insertOrUpdateUserOverrideForAddressIDs_category___block_invoke;
    v9[3] = &unk_1E949AF28;
    v9[4] = self;
    v10 = v8;
    v11 = a4;
    objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v9);

  }
}

uint64_t __74__EDBusinessPersistence_insertOrUpdateUserOverrideForAddressIDs_category___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBusinessAddressesCategoryColumnForAddressIDs:category:connection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (int64_t)findOrCreateBusinessIDForAddress:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "preferredGroupedSenderGrouping");

  v17 = 0;
  -[EDBusinessPersistence _businessExternalIDForEmailAddress:grouping:businessIDsToCombine:](self, "_businessExternalIDForEmailAddress:grouping:businessIDsToCombine:", v6, v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = -[EDBusinessPersistence businessIDForBusinessExternalID:](self, "businessIDForBusinessExternalID:", v10);
  v16 = v12;
  if (v12 == *MEMORY[0x1E0D1DC08])
  {
    -[EDBusinessPersistence _persistedDisplayNameForExternalID:](self, "_persistedDisplayNameForExternalID:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[EDBusinessPersistence _combineBusinesses:connection:newBusinessID:](self, "_combineBusinesses:connection:newBusinessID:", v11, v7, &v16);
      -[EDBusinessPersistence _updateDisplayNameForBusinessID:displayName:connection:](self, "_updateDisplayNameForBusinessID:displayName:connection:", v16, v13, v7);
    }
    else
    {
      -[EDBusinessPersistence _persistedDomainForExternalID:](self, "_persistedDomainForExternalID:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[EDBusinessPersistence _insertBusinessWithDomain:displayName:connection:](self, "_insertBusinessWithDomain:displayName:connection:", v14, v13, v7);

    }
    v12 = v16;
  }

  return v12;
}

- (int64_t)_insertBusinessWithDomain:(id)a3 displayName:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  int64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("businesses"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("domain"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("address_comment"));
  v18 = 0;
  v11 = objc_msgSend(v9, "executeInsertStatement:error:", v10, &v18);
  v12 = v18;
  if (v11)
  {
    v13 = objc_msgSend(v9, "lastInsertedDatabaseID");
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", v7, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v13;
      v21 = 2114;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully inserted business with ID %lld, domain %{public}@ and display name %{public}@", buf, 0x20u);

    }
  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D1DC08];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", v7, 1);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v8);
      objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _insertBusinessWithDomain:displayName:connection:].cold.1();
    }
  }

  return v13;
}

- (BOOL)_updateDisplayNameForBusinessID:(int64_t)a3 displayName:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("businesses"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("address_comment"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWhereClause:", v12);

  v17 = 0;
  v13 = objc_msgSend(v8, "executeUpdateStatement:error:", v9, &v17);
  v14 = v17;
  if (v13)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a3;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated display name for business with ID %lld\nError: %@{public}", buf, 0x16u);
    }
  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence _updateDisplayNameForBusinessID:displayName:connection:].cold.1();
  }

  return v13;
}

- (BOOL)_updateBusinessAddressesTableforBusinessID:(id)a3 newBusinessID:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("business_addresses"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("business"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhereClause:", v12);

  v19 = 0;
  objc_msgSend(v9, "executeUpdateStatement:error:", v10, &v19);
  v13 = v19;
  v18 = v13;
  v14 = objc_msgSend(v9, "executeUpdateStatement:error:", v10, &v18);
  v15 = v18;

  if (v14)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Successfully updated business ID in business_addresses from %@ to %@", buf, 0x16u);
    }
  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence _updateBusinessAddressesTableforBusinessID:newBusinessID:connection:].cold.1();
  }

  return v14;
}

- (BOOL)_deleteBusinessEntryForBusinessID:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1EFE0]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTable:where:", CFSTR("businesses"), v9);

  v15 = 0;
  v11 = objc_msgSend(v6, "executeDeleteStatement:error:", v10, &v15);
  v12 = v15;
  if (v11)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Successfully deleted old business ID: %@", buf, 0xCu);
    }
  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence _deleteBusinessEntryForBusinessID:connection:].cold.1();
  }

  return v11;
}

- (int64_t)_businessIDForDomain:(id)a3 displayName:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = *MEMORY[0x1E0D1DC08];
  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithResult:table:", v11, CFSTR("businesses"));

  v13 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("domain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "equalTo:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_comment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "combined:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWhere:", v19);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__EDBusinessPersistence__businessIDForDomain_displayName_connection___block_invoke;
  v22[3] = &unk_1E949B090;
  v22[4] = &v23;
  objc_msgSend(v9, "executeSelectStatement:withBlock:error:", v12, v22, 0);
  v20 = v24[3];

  _Block_object_dispose(&v23, 8);
  return v20;
}

void __69__EDBusinessPersistence__businessIDForDomain_displayName_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (id)_businessIDsForHighLevelDomain:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("businesses"));

  v11 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("domain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_comment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notEqualTo:", &stru_1E94A4508);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combined:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v17);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__EDBusinessPersistence__businessIDsForHighLevelDomain_connection___block_invoke;
  v20[3] = &unk_1E949AF78;
  v18 = v7;
  v21 = v18;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v10, v20, 0);

  return v18;
}

void __67__EDBusinessPersistence__businessIDsForHighLevelDomain_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1EF38];
  v10 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address_comment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairWithFirst:second:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

- (id)_categoryOverridesForBusinessIDs:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = (id)0xAAAAAAAAAAAAAAAALL;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithResult:table:", v8, CFSTR("business_categories"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "in:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWhere:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__EDBusinessPersistence__categoryOverridesForBusinessIDs_connection___block_invoke;
  v14[3] = &unk_1E949B090;
  v14[4] = &v15;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v9, v14, 0);
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __69__EDBusinessPersistence__categoryOverridesForBusinessIDs_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("category"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)_setUserOverrideForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[EDBusinessPersistence _insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:category:connection:](self, "_insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:category:connection:", a3, a4, v8);
  -[EDBusinessPersistence addressIDsForBusinessID:connection:](self, "addressIDsForBusinessID:connection:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[EDBusinessPersistence _updateBusinessAddressesCategoryColumnForAddressIDs:category:connection:](self, "_updateBusinessAddressesCategoryColumnForAddressIDs:category:connection:", v9, a4, v8);

  return a4;
}

- (BOOL)setBusiness:(int64_t)a3 forAddress:(int64_t)a4 connection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v21;

  v7 = a5;
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("business_categories"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v13);

  objc_msgSend(v10, "setLimit:", 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("business_addresses"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("address"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("business"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("category"));
  v21 = 0;
  v17 = objc_msgSend(v7, "executeInsertStatement:error:", v14, &v21);
  v18 = v21;
  if ((v17 & 1) == 0)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence setBusiness:forAddress:connection:].cold.1();

  }
  return v17;
}

- (void)removeUserOverridesForBusinessIDs:(id)a3
{
  EDPersistenceDatabase *database;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDBusinessPersistence *v9;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    database = self->_database;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence removeUserOverridesForBusinessIDs:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__EDBusinessPersistence_removeUserOverridesForBusinessIDs___block_invoke;
    v7[3] = &unk_1E949AFA0;
    v8 = v6;
    v9 = self;
    -[EDPersistenceDatabase __performWriteWithCaller:usingBlock:](database, "__performWriteWithCaller:usingBlock:", v5, v7);

  }
}

uint64_t __59__EDBusinessPersistence_removeUserOverridesForBusinessIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(a1 + 40), "_removeUserOverrideForBusinessID:connection:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "longLongValue", (_QWORD)v10), v3))
        {
          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_removeUserOverrideForBusinessID:(int64_t)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  id v26;
  id v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!a3 || *MEMORY[0x1E0D1DC08] == a3)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence _removeUserOverrideForBusinessID:connection:].cold.1(v11, v15, v16);
    LOBYTE(v17) = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D1EFE0]);
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "equalTo:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "initWithTable:where:", CFSTR("business_categories"), v10);

    v27 = 0;
    v12 = objc_msgSend(v6, "executeDeleteStatement:error:", v11, &v27);
    v13 = v27;
    if (v12)
    {
      -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistenceDidChangeCategoryForBusiness:](v14, "persistenceDidChangeCategoryForBusiness:", a3);
    }
    else
    {
      +[EDBusinessPersistence log](EDBusinessPersistence, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[EDBusinessPersistence _removeUserOverrideForBusinessID:connection:].cold.3((uint64_t)v13, a3, v14);
    }

    -[EDBusinessPersistence addressIDsForBusinessID:connection:](self, "addressIDsForBusinessID:connection:", a3, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("business_addresses"));
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("category"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "in:", v18);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWhereClause:", v22);

    v26 = v13;
    LODWORD(v22) = objc_msgSend(v6, "executeUpdateStatement:error:", v19, &v26);
    v23 = v26;

    v17 = v12 & v22;
    if (v17 == 1)
    {
      -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistenceDidChangeCategoryForAddressIDs:](v24, "persistenceDidChangeCategoryForAddressIDs:", v18);
    }
    else
    {
      +[EDBusinessPersistence log](EDBusinessPersistence, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[EDBusinessPersistence _removeUserOverrideForBusinessID:connection:].cold.2((uint64_t)v23, (uint64_t)v28, objc_msgSend(v18, "count"));
    }

  }
  return v17;
}

- (void)insertOrUpdateUserOverrideForBusinessIDs:(id)a3 category:(unint64_t)a4
{
  EDPersistenceDatabase *database;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  EDBusinessPersistence *v11;
  unint64_t v12;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    database = self->_database;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence insertOrUpdateUserOverrideForBusinessIDs:category:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__EDBusinessPersistence_insertOrUpdateUserOverrideForBusinessIDs_category___block_invoke;
    v9[3] = &unk_1E949AF28;
    v10 = v8;
    v11 = self;
    v12 = a4;
    -[EDPersistenceDatabase __performWriteWithCaller:usingBlock:](database, "__performWriteWithCaller:usingBlock:", v7, v9);

  }
}

uint64_t __75__EDBusinessPersistence_insertOrUpdateUserOverrideForBusinessIDs_category___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(a1 + 40), "_setUserOverrideForBusinessID:category:connection:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "longLongValue", (_QWORD)v10), *(_QWORD *)(a1 + 48), v3))
        {
          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)categoryTypeForAddressID:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[EDBusinessPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence categoryTypeForAddressID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke;
  v8[3] = &unk_1E949B778;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v13;
  _QWORD v14[5];
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("category"), CFSTR("business_addresses"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_2;
  v14[3] = &unk_1E949B090;
  v14[4] = *(_QWORD *)(a1 + 32);
  LOBYTE(v6) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v14, &v13);
  v8 = v13;
  if ((v6 & 1) == 0)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_cold_1(v11, (uint64_t)v15, v10);
    }

  }
  return 1;
}

void __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)_updateBusinessAddressesCategoryColumnForAddressIDs:(id)a3 category:(unint64_t)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("business_addresses"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("category"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "in:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhereClause:", v13);

  v19 = 0;
  v14 = objc_msgSend(v9, "executeUpdateStatement:error:", v10, &v19);
  v15 = v19;
  if (v14)
  {
    -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject persistenceDidChangeCategoryForAddressIDs:](v16, "persistenceDidChangeCategoryForAddressIDs:", v8);
  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218498;
      v21 = a4;
      v22 = 2048;
      v23 = v18;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "Failed to insert category %lu to business_addresses table for %lu address IDs due to error %{public}@", buf, 0x20u);
    }
  }

  return v14;
}

- (BOOL)_insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  int64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!a3 || *MEMORY[0x1E0D1DC08] == a3)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDBusinessPersistence _removeUserOverrideForBusinessID:connection:].cold.1(v11, v17, v18);
    LOBYTE(v14) = 0;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D1F060]);
    v28[0] = CFSTR("business");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithTable:conflictTarget:", CFSTR("business_categories"), v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("business"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("category"));

    v21 = 0;
    v14 = objc_msgSend(v8, "executeUpsertStatement:error:", v11, &v21);
    v15 = v21;
    if (v14)
    {
      -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistenceDidChangeCategoryForBusiness:](v16, "persistenceDidChangeCategoryForBusiness:", a3);
    }
    else
    {
      +[EDBusinessPersistence log](EDBusinessPersistence, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        EMStringFromCategoryType();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v23 = a3;
        v24 = 2112;
        v25 = v20;
        v26 = 2114;
        v27 = v15;
        _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "Failed to insert business_categories entry for business ID: %lld, category: %@ due to error %{public}@", buf, 0x20u);

      }
    }

  }
  return v14;
}

- (id)addressIDsForBusinessID:(int64_t)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = (id)0xAAAAAAAAAAAAAAAALL;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithResult:table:", v7, CFSTR("business_addresses"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__EDBusinessPersistence_addressIDsForBusinessID_connection___block_invoke;
  v14[3] = &unk_1E949B090;
  v14[4] = &v15;
  objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v8, v14, 0);
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __60__EDBusinessPersistence_addressIDsForBusinessID_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

- (void)backfillBusinessesTables
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[EDBusinessPersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence backfillBusinessesTables]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke;
  v5[3] = &unk_1E949B7F0;
  v5[4] = self;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);

}

uint64_t __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_businessesTablesNeedBackfillWithConnection:", v3) & 1) != 0)
  {
    v27 = 0;
    +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v27);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v27;
    v6 = *MEMORY[0x1E0D1EE00];
    objc_msgSend(v4, "addResultColumn:", *MEMORY[0x1E0D1EE00]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("business_addresses"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notIn:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWhere:", v9);

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    v25 = __Block_byref_object_dispose__0;
    v26 = (id)0xAAAAAAAAAAAAAAAALL;
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2;
    v18[3] = &unk_1E949B7A0;
    v11 = v5;
    v19 = v11;
    v20 = &v21;
    objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v18, 0);
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend((id)v22[5], "count");
      *(_DWORD *)buf = 134217984;
      v29 = v13;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Backfilling %lld addresses without business IDs.", buf, 0xCu);
    }

    v14 = (void *)v22[5];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_51;
    v16[3] = &unk_1E949B7C8;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v3;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v16);

    _Block_object_dispose(&v21, 8);
  }

  return 1;
}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "second");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9 = v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v8);
  objc_msgSend(v10, "setDisplayName:", v9);
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v8;
    v13 = v16;

  }
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v19);

}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setBusiness:forAddress:connection:", objc_msgSend(*(id *)(a1 + 32), "findOrCreateBusinessIDForAddress:connection:", v5, *(_QWORD *)(a1 + 40)), objc_msgSend(v6, "longLongValue"), *(_QWORD *)(a1 + 40));

}

- (BOOL)_businessesTablesNeedBackfillWithConnection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("business_addresses"));

  v7 = objc_msgSend(v3, "countForSelectStatement:", v6);
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, v10);

  LOBYTE(v7) = objc_msgSend(v3, "countForSelectStatement:", v11) > v7;
  return v7;
}

+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4 grouping:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = a4;
  if (a5 != 2
    && objc_msgSend(v7, "length")
    && (objc_msgSend(v8, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v10))
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBusinessPersistence _commonDomains](EDBusinessPersistence, "_commonDomains");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)_commonDomains
{
  if (_commonDomains_onceToken != -1)
    dispatch_once(&_commonDomains_onceToken, &__block_literal_global_7);
  return (id)_commonDomains_sCommonDomains;
}

void __39__EDBusinessPersistence__commonDomains__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E94E5488);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_commonDomains_sCommonDomains;
  _commonDomains_sCommonDomains = v0;

}

- (BOOL)_combineBusinesses:(id)a3 connection:(id)a4 newBusinessID:(int64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t i;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  void *v35;
  int64_t *v36;
  void *v37;
  id v39;
  uint8_t v40;
  _BYTE v41[15];

  v8 = a3;
  v39 = a4;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");
  v11 = *MEMORY[0x1E0D1DC08];
  if (v10)
    v12 = v10;
  else
    v12 = *MEMORY[0x1E0D1DC08];

  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    if (v12 == v11)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "longLongValue");

      if (v12 == v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDBusinessPersistence.m"), 567, CFSTR("Unable to find valid business ID to combine businesses into"));

        v12 = v11;
      }
    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[EDBusinessPersistence _categoryOverridesForBusinessIDs:connection:](self, "_categoryOverridesForBusinessIDs:connection:", v8, v39);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v17;
    v18 = objc_msgSend(v17, "count");
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _setUserOverrideForBusinessID:category:connection:](self, "_setUserOverrideForBusinessID:category:connection:", v12, objc_msgSend(v20, "unsignedIntegerValue"), v39);

    }
    v36 = a5;
    for (i = 0; ; ++i)
    {
      v22 = objc_msgSend(v8, "count");
      v13 = i >= v22;
      if (i >= v22)
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "longLongValue") == v11)
      {
        if (i)
        {
          +[EDBusinessPersistence log](EDBusinessPersistence, "log");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[EDBusinessPersistence _combineBusinesses:connection:newBusinessID:].cold.1(&v40, v41, v24);

        }
      }
      else
      {
        if (v18 < 2)
        {
          v29 = 1;
        }
        else
        {
          v25 = objc_alloc(MEMORY[0x1E0D1EFE0]);
          objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("business"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "equalTo:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithTable:where:", CFSTR("business_categories"), v27);

          v29 = objc_msgSend(v39, "executeDeleteStatement:error:", v28, 0);
        }
        if (objc_msgSend(v23, "longLongValue") != v12)
        {
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[EDBusinessPersistence _updateBusinessAddressesTableforBusinessID:newBusinessID:connection:](self, "_updateBusinessAddressesTableforBusinessID:newBusinessID:connection:", v23, v30, v39);

            LOBYTE(v29) = v31
                       && -[EDBusinessPersistence _deleteBusinessEntryForBusinessID:connection:](self, "_deleteBusinessEntryForBusinessID:connection:", v23, v39);
          }
          -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "persistenceIsMergingBusinessID:intoBusinessID:", objc_msgSend(v23, "longLongValue"), v12);

        }
        if ((v29 & 1) == 0)
        {
          +[EDBusinessPersistence log](EDBusinessPersistence, "log");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[EDBusinessPersistence _combineBusinesses:connection:newBusinessID:].cold.2();

          break;
        }
      }

    }
    if (v36)
      *v36 = v12;

  }
  else
  {
    if (a5)
      *a5 = v12;
    v13 = 1;
  }

  return v13;
}

- (id)businessExternalIDForBusinessID:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[EDBusinessPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence businessExternalIDForBusinessID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke;
  v9[3] = &unk_1E949B818;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v13;
  _QWORD v14[4];
  __int128 v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("domain"), CFSTR("businesses"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("address_comment"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_2;
  v14[3] = &unk_1E949ADD0;
  v15 = *(_OWORD *)(a1 + 32);
  LOBYTE(v6) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v14, &v13);
  v8 = v13;
  if ((v6 & 1) == 0)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_cold_1(v11, (uint64_t)v16, v10);
    }

  }
  return 1;
}

void __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_externalIDForPersistedDomain:displayName:grouping:", v4, v6, objc_msgSend(v8, "preferredGroupedSenderGrouping"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (int64_t)businessIDForBusinessExternalID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = *MEMORY[0x1E0D1DC08];
  -[EDBusinessPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence businessIDForBusinessExternalID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke;
  v10[3] = &unk_1E949AF00;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_persistedDomainForExternalID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_persistedDisplayNameForExternalID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  v6 = (void *)objc_msgSend(v5, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("businesses"));
  v7 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_comment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combined:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v13);

  v18 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_2;
  v19[3] = &unk_1E949B090;
  v19[4] = *(_QWORD *)(a1 + 48);
  LOBYTE(v12) = objc_msgSend(v17, "executeSelectStatement:withBlock:error:", v6, v19, &v18);
  v14 = v18;
  if ((v12 & 1) == 0)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_cold_1();
    }

  }
  return 1;
}

void __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (id)businessExternalIDForEmailAddress:(id)a3 grouping:(int64_t)a4
{
  -[EDBusinessPersistence _businessExternalIDForEmailAddress:grouping:businessIDsToCombine:](self, "_businessExternalIDForEmailAddress:grouping:businessIDsToCombine:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_businessExternalIDForEmailAddress:(id)a3 grouping:(int64_t)a4 businessIDsToCombine:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  id v33;
  id v35;

  v8 = a3;
  objc_msgSend(v8, "emailAddressValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "emailAddressValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayName");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E94A4508;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  v18 = v12;
  objc_msgSend(v18, "emailAddressValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "simpleAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v18, "stringValue");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  objc_msgSend(v18, "emailAddressValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "highLevelDomain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = v25;
  }
  else
  {
    objc_msgSend(v18, "emailAddressValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "domain");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v23)
      v30 = v23;
    else
      v30 = v17;
    if (v28)
      v30 = (void *)v28;
    v26 = v30;

  }
  if (+[EDBusinessPersistence _shouldUseSimpleAddressForHighLevelDomain:displayName:grouping:](EDBusinessPersistence, "_shouldUseSimpleAddressForHighLevelDomain:displayName:grouping:", v25, v17, a4))
  {
    v31 = 2;
  }
  else
  {
    v31 = a4;
  }
  if (v31)
  {
    -[EDBusinessPersistence _externalIDForDomain:displayName:simpleAddress:grouping:](self, "_externalIDForDomain:displayName:simpleAddress:grouping:", v26, v17, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EDBusinessPersistence _existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress:](self, "_existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress:", v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v35 = 0;
      -[EDBusinessPersistence _externalIDWithCommonPrefixForHighLevelDomain:displayName:businessIDsToCombine:](self, "_externalIDWithCommonPrefixForHighLevelDomain:displayName:businessIDsToCombine:", v26, v17, &v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v35;
      if (!a5)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  v33 = 0;
  if (a5)
LABEL_24:
    *a5 = objc_retainAutorelease(v33);
LABEL_25:

  return v32;
}

- (id)_existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  EDBusinessPersistence *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[EDBusinessPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence _existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke;
  v10[3] = &unk_1E949B108;
  v7 = v4;
  v12 = self;
  v13 = &v14;
  v11 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

uint64_t __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = +[EDMessagePersistence databaseIDForEmailAddress:connection:](EDMessagePersistence, "databaseIDForEmailAddress:connection:", a1[4], v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForAddress:", a1[4]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke_cold_1(v6, buf, v5);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v7 = (void *)a1[5];
  v15 = 0;
  objc_msgSend(v7, "_businessExternalIDForAddressID:expectedGrouping:connection:error:", v4, 0, v3, &v15);
  v8 = objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v11 = 1;
  else
    v11 = v5 == 0;
  v12 = v11;
  if (!v11)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForAddress:", a1[4]);
      objc_claimAutoreleasedReturnValue();
      -[NSObject ef_publicDescription](v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke_cold_2();
    }

    goto LABEL_14;
  }
LABEL_15:

  return v12;
}

- (id)_businessExternalIDForAddressID:(int64_t)a3 expectedGrouping:(int64_t)a4 connection:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("domain"), CFSTR("businesses"));
  objc_msgSend(v11, "addResultColumn:", CFSTR("address_comment"));
  v12 = (id)objc_msgSend(v11, "join:sourceColumn:targetColumn:", CFSTR("business_addresses"), *MEMORY[0x1E0D1EE00], CFSTR("business"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "equalTo:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWhere:", v15);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__EDBusinessPersistence__businessExternalIDForAddressID_expectedGrouping_connection_error___block_invoke;
  v19[3] = &unk_1E949B840;
  v19[4] = self;
  v19[5] = &v20;
  v19[6] = a4;
  if (objc_msgSend(v10, "executeSelectStatement:withBlock:error:", v11, v19, a6))
    v16 = (void *)v21[5];
  else
    v16 = 0;
  v17 = v16;
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __91__EDBusinessPersistence__businessExternalIDForAddressID_expectedGrouping_connection_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_externalIDForPersistedDomain:displayName:grouping:", v4, v6, *(_QWORD *)(a1 + 48));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)_externalIDWithCommonPrefixForHighLevelDomain:(id)a3 displayName:(id)a4 businessIDsToCombine:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *, _BYTE *);
  void *v30;
  id v31;
  id v32;
  EDBusinessPersistence *v33;
  _BYTE *v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  -[EDBusinessPersistence _groupingTrieForHighLevelDomain:](self, "_groupingTrieForHighLevelDomain:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = *MEMORY[0x1E0D1DC08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *MEMORY[0x1E0D1DC08]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertDisplayName:addressID:", v9, v13);

    objc_msgSend(v10, "findGroups");
    v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") <= v11)
    {
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = v12;
      +[EDBusinessPersistence log](EDBusinessPersistence, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v45 = v14;
        _os_log_debug_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEBUG, "Grouping display name: %@, high level domain: %@, Created some groups: %@", buf, 0x20u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__0;
      v46 = __Block_byref_object_dispose__0;
      v47 = 0;
      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__0;
      v41 = __Block_byref_object_dispose__0;
      v42 = 0;
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __104__EDBusinessPersistence__externalIDWithCommonPrefixForHighLevelDomain_displayName_businessIDsToCombine___block_invoke;
      v30 = &unk_1E949B868;
      v22 = v8;
      v31 = v22;
      v23 = v9;
      v34 = buf;
      v35 = &v37;
      v36 = v43;
      v32 = v23;
      v33 = self;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v27);
      if (a5)
        *a5 = objc_retainAutorelease((id)v38[5]);
      v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v24)
      {
        v25 = v24;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayNameCommonPrefix:", v22, v23, v27, v28, v29, v30, v31);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v25;

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v43, 8);
    }
    else
    {
      +[EDBusinessPersistence log](EDBusinessPersistence, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", v8, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "New display name (%{public}@) is not a part of an existing group for high level domain (%{public}@), creating a new external ID", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayNameCommonPrefix:", v8, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", v8, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "No current businesses found with this high level domain (%{public}@), creating a new external ID", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayNameCommonPrefix:", v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __104__EDBusinessPersistence__externalIDWithCommonPrefixForHighLevelDomain_displayName_businessIDsToCombine___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D1DC08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *MEMORY[0x1E0D1DC08]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", *(_QWORD *)(a1 + 32), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v14;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Existing businesses for high level domain (%{public}@) will be merged under new display name (%{public}@)", (uint8_t *)&v30, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayNameCommonPrefix:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = v8;
    v21 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v20;
LABEL_9:

    *a4 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v8, "containsObject:", v22);

  if (v23)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (int)objc_msgSend(v7, "intValue");
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", *(_QWORD *)(a1 + 40));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", *(_QWORD *)(a1 + 32), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v30 = 138543874;
      v31 = v25;
      v32 = 2114;
      v33 = v26;
      v34 = 2048;
      v35 = v27;
      _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "New display name (%{public}@) for high level domain (%{public}@) is part of business: %lld", (uint8_t *)&v30, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "businessExternalIDForBusinessID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_externalIDForPersistedDomain:(id)a3 displayName:(id)a4 grouping:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "emailAddressValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "simpleAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = 2;
  else
    v12 = a5;
  -[EDBusinessPersistence _externalIDForDomain:displayName:simpleAddress:grouping:](self, "_externalIDForDomain:displayName:simpleAddress:grouping:", v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_persistedDomainForExternalID:(id)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "grouping");
  if (v5 < 2)
    goto LABEL_4;
  if (v5 == 2)
  {
    objc_msgSend(v4, "simpleAddress");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v5 == 3)
  {
LABEL_4:
    objc_msgSend(v4, "highLevelDomain");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v3 = (void *)v6;
  }

  return v3;
}

- (id)_persistedDisplayNameForExternalID:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "grouping") >= 2)
  {
    v4 = &stru_1E94A4508;
  }
  else
  {
    objc_msgSend(v3, "displayName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_externalIDForDomain:(id)a3 displayName:(id)a4 simpleAddress:(id)a5 grouping:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a6)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayNameCommonPrefix:", v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:displayName:", v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForSimpleAddress:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0D1E0F8], "externalIDForHighLevelDomain:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v12;
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

- (id)_groupingTrieForHighLevelDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  EDDisplayNameGroupingTrie *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[EDBusinessPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence _groupingTrieForHighLevelDomain:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDBusinessPersistence__groupingTrieForHighLevelDomain___block_invoke;
  v10[3] = &unk_1E949B890;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  if ((objc_msgSend((id)v14[5], "ef_isEmpty") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(EDDisplayNameGroupingTrie);
    -[EDDisplayNameGroupingTrie insertDisplayNameAndIDPairs:](v8, "insertDisplayNameAndIDPairs:", v14[5]);
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __57__EDBusinessPersistence__groupingTrieForHighLevelDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_businessIDsForHighLevelDomain:connection:", *(_QWORD *)(a1 + 40), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (void)persistenceWillAddProtectedDatabaseIDsFromJournal:(id)a3 andReplaceJournalDatabaseIDsWithProtectedDatabaseIDs:(id)a4 forTable:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a5;
  if ((_os_feature_enabled_impl() & 1) != 0 && objc_msgSend(v6, "isEqualToString:", CFSTR("businesses")))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EDBusinessPersistence.reconciledBusinessIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "addIndexes:", v13);
    }
    else
    {
      v10 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "threadDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("EDBusinessPersistence.reconciledBusinessIDs"));

    }
  }

}

- (void)persistenceDidReconcileProtectedData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDBusinessPersistence.reconciledBusinessIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("EDBusinessPersistence.reconciledBusinessIDs"));

    if (objc_msgSend(v14, "count"))
    {
      -[EDBusinessPersistence _highLevelDomainsForBusinessIDs:](self, "_highLevelDomainsForBusinessIDs:", v14);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v19;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(obj);
            v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
            -[EDBusinessPersistence database](self, "database", v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence persistenceDidReconcileProtectedData]");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke;
            v17[3] = &unk_1E949AF28;
            v17[4] = self;
            v17[5] = v10;
            v17[6] = a2;
            objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v7);
      }

      -[EDBusinessPersistence hookRegistry](self, "hookRegistry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "persistenceDidFinishMergingBusinessesAfterJournalReconciliation");

    }
  }
}

BOOL __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  EDDisplayNameGroupingTrie *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_businessIDsForHighLevelDomain:connection:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(EDDisplayNameGroupingTrie);
  -[EDDisplayNameGroupingTrie insertDisplayNameAndIDPairs:](v5, "insertDisplayNameAndIDPairs:", v4);
  -[EDDisplayNameGroupingTrie findGroups](v5, "findGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v7 = objc_msgSend(v4, "count");
  v8 = objc_msgSend(v6, "count");
  v9 = v7 - v8;
  if (v7 != v8)
  {
    if (v7 <= v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("EDBusinessPersistence.m"), 912, CFSTR("We ended up with more groups than we started with when combining groups"));

    }
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:maximumUnredactedLength:", *(_QWORD *)(a1 + 40), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Merging %lu businesses for domain %{public}@", buf, 0x16u);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke_92;
    v16[3] = &unk_1E949B8B8;
    v12 = *(_QWORD *)(a1 + 32);
    v18 = &v19;
    v16[4] = v12;
    v17 = v3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  v13 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke_92(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    +[EDBusinessPersistence log](EDBusinessPersistence, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Merging businessIDs %@", (uint8_t *)&v8, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_combineBusinesses:connection:newBusinessID:", v6, *(_QWORD *)(a1 + 40), 0);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }

}

- (id)_highLevelDomainsForBusinessIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDBusinessPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDBusinessPersistence _highLevelDomainsForBusinessIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke;
  v13[3] = &unk_1E949AFA0;
  v8 = v4;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  v10 = v15;
  v11 = v9;

  return v11;
}

uint64_t __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("domain"), CFSTR("businesses"));
  objc_msgSend(v4, "setDistinct:", 1);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke_2;
  v8[3] = &unk_1E949AF78;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v8, 0);

  return 1;
}

void __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_insertBusinessWithDomain:displayName:connection:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to insert business with domain %{public}@ and display name %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_updateDisplayNameForBusinessID:displayName:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "Failed to update display name for business with ID %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateBusinessAddressesTableforBusinessID:newBusinessID:connection:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, v1, (uint64_t)v1, "Failed to update business ID in business_addresses from %@ to %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_deleteBusinessEntryForBusinessID:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "Failed to delete old business ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setBusiness:forAddress:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "Failed to insert business_addresses entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeUserOverrideForBusinessID:(uint64_t)a3 connection:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "Failed to update user override since businessID is 0", v3);
}

- (void)_removeUserOverrideForBusinessID:(uint64_t)a3 connection:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to remove category in business_addresses table for %lu address IDs due to error %{public}@", v3, v4);
}

- (void)_removeUserOverrideForBusinessID:(NSObject *)a3 connection:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a3, (uint64_t)a3, "Failed to remove business_categories entry for business ID: %lld due to error %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to get category type for address ID %lld, due to error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_combineBusinesses:(uint8_t *)a1 connection:(_BYTE *)a2 newBusinessID:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a3, (uint64_t)a3, "Found an invalid business ID when re-computing groups", a1);
}

- (void)_combineBusinesses:connection:newBusinessID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, v0, v1, "Failed to update businesses tables for business id: %@, stopping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to get external ID for business ID %lld, due to error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to get business ID for external ID %{public}@, due to error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to find email address to determine external ID: %@", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __90__EDBusinessPersistence__existingHighLevelDomainAndCommonPrefixExternalIDForEmailAddress___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to determine external ID for address: %@, due to error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

@end
