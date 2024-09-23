@implementation EDCategoryPersistence

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EDCategoryPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1)
    dispatch_once(&log_onceToken_15, block);
  return (OS_os_log *)(id)log_log_15;
}

void __28__EDCategoryPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;

}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id result;

  result = (id)MEMORY[0x1E0C9AA60];
  *a3 = (id)MEMORY[0x1E0C9AA60];
  *a4 = result;
  return result;
}

- (EDCategoryPersistence)initWithDatabase:(id)a3 hookResponder:(id)a4
{
  id v8;
  id v9;
  EDCategoryPersistence *v10;
  EDCategoryPersistence *v11;
  EDCategoryPersistence *v12;
  EDCategoryCoreAnalyticsLogger *v13;
  EDCategoryCoreAnalyticsLogger *analyticsLogger;
  uint64_t v15;
  EFLocked *cachedCurrentCategorizationVersion;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDCategoryPersistence-BlackPearl.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

  }
  v19.receiver = self;
  v19.super_class = (Class)EDCategoryPersistence;
  v10 = -[EDCategoryPersistence init](&v19, sel_init);
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_database, a3);
    objc_storeStrong((id *)&v11->_hookResponder, a4);
    if (_os_feature_enabled_impl())
    {
      v13 = objc_alloc_init(EDCategoryCoreAnalyticsLogger);
      analyticsLogger = v12->_analyticsLogger;
      v12->_analyticsLogger = v13;

    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EEF0]), "initWithObject:", &unk_1E94E4670);
    cachedCurrentCategorizationVersion = v12->_cachedCurrentCategorizationVersion;
    v12->_cachedCurrentCategorizationVersion = (EFLocked *)v15;

  }
  return v12;
}

- (BOOL)persistCategorizationResult:(id)a3 forGlobalID:(int64_t)a4 categorizationVersion:(int64_t)a5 connection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = objc_alloc(MEMORY[0x1E0D1F058]);
  +[EDMessagePersistence messageGlobalDataTableName](EDMessagePersistence, "messageGlobalDataTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTable:", v12);

  objc_msgSend(v9, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "state");

  if (v15 == 2)
  {
    +[EDMessagePersistence messageGlobalDataUserCategoryColumnName](EDMessagePersistence, "messageGlobalDataUserCategoryColumnName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E94E4688, v16);

  }
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "category");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataModelCategoryColumnName](EDMessagePersistence, "messageGlobalDataModelCategoryColumnName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "category");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "subtype"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName](EDMessagePersistence, "messageGlobalDataModelSubcategoryColumnName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, v24);

  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "category");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "isHighImpact"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataHighImpactColumnName](EDMessagePersistence, "messageGlobalDataHighImpactColumnName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, v28);

  objc_msgSend(v9, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringRepresentationWithError:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    +[EDMessagePersistence messageGlobalDataModelAnalyticsColumnName](EDMessagePersistence, "messageGlobalDataModelAnalyticsColumnName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, v31);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataCategoryModelVersionColumnName](EDMessagePersistence, "messageGlobalDataCategoryModelVersionColumnName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, v33);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "in:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWhereClause:", v37);

  LOBYTE(v37) = objc_msgSend(v10, "executeUpdateStatement:error:", v13, 0);
  return (char)v37;
}

- (BOOL)persistCategorizationResultMap:(id)a3
{
  id v4;
  EDPersistenceDatabaseGenerationWindow *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  EDCategoryPersistence *v16;
  int64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    v6 = -[EDCategoryPersistence currentCategorizationVersion](self, "currentCategorizationVersion");
    -[EDCategoryPersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence persistCategorizationResultMap:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke;
    v14[3] = &unk_1E949AF28;
    v9 = v4;
    v15 = v9;
    v16 = self;
    v17 = v6;
    v10 = objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v14);

    -[EDCategoryPersistence hookResponder](self, "hookResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceDidChangeCategorizationForMessages:generationWindow:", v12, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke_2;
  v9[3] = &unk_1E949BB70;
  v5 = (void *)a1[4];
  v4 = a1[5];
  v6 = a1[6];
  v10 = v3;
  v11 = v6;
  v9[4] = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return 1;
}

void __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "persistCategorizationResult:forGlobalID:categorizationVersion:connection:", v5, objc_msgSend(v6, "globalMessageID"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)changeCategoryType:(unint64_t)a3 messages:(id)a4
{
  id v6;
  EDPersistenceDatabaseGenerationWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v6 = a4;
  v7 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDCategoryPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence changeCategoryType:messages:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__EDCategoryPersistence_changeCategoryType_messages___block_invoke;
  v12[3] = &unk_1E949B068;
  v14 = a3;
  v11 = v6;
  v13 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

  -[EDCategoryPersistence hookResponder](self, "hookResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceDidChangeCategorizationForMessages:generationWindow:", v11, v7);

}

uint64_t __53__EDCategoryPersistence_changeCategoryType_messages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDCategoryPersistence log](EDCategoryPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Setting category %lu for messages %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D1F058]);
  +[EDMessagePersistence messageGlobalDataTableName](EDMessagePersistence, "messageGlobalDataTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTable:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataUserCategoryColumnName](EDMessagePersistence, "messageGlobalDataUserCategoryColumnName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "in:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhereClause:", v14);

  v22 = 0;
  v15 = objc_msgSend(v3, "executeUpdateStatement:error:", v10, &v22);
  v16 = v22;
  if (v16)
  {
    +[EDCategoryPersistence log](EDCategoryPersistence, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v16, "ef_publicDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v24 = v20;
      v25 = 2112;
      v26 = v19;
      v27 = 2114;
      v28 = v21;
      _os_log_error_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_ERROR, "Failed to update category %lu for messages %@ error %{public}@", buf, 0x20u);

    }
  }

  return v15;
}

id __53__EDCategoryPersistence_changeCategoryType_messages___block_invoke_58(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelAnalyticsForMessage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__1;
  v16[3] = __Block_byref_object_dispose__1;
  v17 = 0;
  -[EDCategoryPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence modelAnalyticsForMessage:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke;
  v14[3] = &unk_1E949B778;
  v14[4] = &v15;
  v14[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v14);

  v6 = *(void **)(v16[0] + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v7, "JSONObjectWithData:options:error:", v8, 4, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;

    if (v10)
    {
      +[EDCategoryPersistence log](EDCategoryPersistence, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[EDCategoryPersistence modelAnalyticsForMessage:].cold.1((uint64_t)v16, (uint64_t)v10, v11);

    }
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messageGlobalDataModelAnalyticsColumnName](EDMessagePersistence, "messageGlobalDataModelAnalyticsColumnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataTableName](EDMessagePersistence, "messageGlobalDataTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v10);

  v16 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke_2;
  v17[3] = &unk_1E949B090;
  v17[4] = *(_QWORD *)(a1 + 32);
  LOBYTE(v9) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v7, v17, &v16);
  v11 = v16;
  if ((v9 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to read modelAnalytics for messageID:%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:message:", v11, v14);

  }
  return 1;
}

void __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (void)initializeCategorizationVersion:(id)a3
{
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = _setCategorizationVersionUsingConnection(a3, (uint64_t)&v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    +[EDCategoryPersistence log](EDCategoryPersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDCategoryPersistence initializeCategorizationVersion:].cold.1(v6, buf, v5);
    }

  }
}

- (void)_initializeCategorizationVersion
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  -[EDCategoryPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence _initializeCategorizationVersion]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EDCategoryPersistence__initializeCategorizationVersion__block_invoke;
  v6[3] = &unk_1E949B068;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);

}

uint64_t __57__EDCategoryPersistence__initializeCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v11 = 0;
  v4 = _setCategorizationVersionUsingConnection(v3, (uint64_t)&v11);
  v5 = v11;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("EDCategoryPersistence-BlackPearl.m"), 260, CFSTR("Could not initialize categorization version. Error:%@"), v10);

  }
  return 1;
}

- (void)incrementCategorizationVersion
{
  int64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = -[EDCategoryPersistence currentCategorizationVersion](self, "currentCategorizationVersion");
  -[EDCategoryPersistence database](self, "database");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence incrementCategorizationVersion]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v6[4] = v3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v4, v6);

}

uint64_t __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F060]);
  v9[0] = CFSTR("key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTable:conflictTarget:", CFSTR("properties"), v5);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("CategorizationVersion"), CFSTR("key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32) + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  objc_msgSend(v3, "executeUpsertStatement:error:", v6, 0);
  return 1;
}

- (int64_t)currentCategorizationVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  -[EDCategoryPersistence cachedCurrentCategorizationVersion](self, "cachedCurrentCategorizationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v16 = v5;
  if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDCategoryPersistence database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDCategoryPersistence currentCategorizationVersion]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke;
    v12[3] = &unk_1E949BBD8;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v12);

  }
  +[EDCategoryPersistence log](EDCategoryPersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v14[3];
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Current categorization version set to %ld.", buf, 0xCu);
  }

  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v16 = 0;
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("value"), CFSTR("properties"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", CFSTR("CategorizationVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v6);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___categorizationVersionUsingConnection_block_invoke;
  v17[3] = &unk_1E949B090;
  v17[4] = &v18;
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v17, &v16);
  v8 = v19[3];
  _Block_object_dispose(&v18, 8);

  v9 = v16;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v10 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(v10 + 24) = 1;
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke_2;
    block[3] = &unk_1E949AEB8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v11, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "cachedCurrentCategorizationVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:", v13);

  return 1;
}

uint64_t __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeCategorizationVersion");
}

- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[EDCategoryPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProtectedDatabaseBackgroundProcessingForDuration:error:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)addCategoryColumnsToMessagesSelectComponent:(id)a3 globalMessagesSelectComponent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  +[EDMessagePersistence messageGlobalDataModelCategoryColumnName](EDMessagePersistence, "messageGlobalDataModelCategoryColumnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResultColumn:", v6);

  +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName](EDMessagePersistence, "messageGlobalDataModelSubcategoryColumnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResultColumn:", v7);

  +[EDMessagePersistence messageGlobalDataUserCategoryColumnName](EDMessagePersistence, "messageGlobalDataUserCategoryColumnName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResultColumn:", v8);

  +[EDMessagePersistence messageGlobalDataHighImpactColumnName](EDMessagePersistence, "messageGlobalDataHighImpactColumnName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResultColumn:", v9);

  +[EDBusinessPersistence businessAddressesTableName](EDBusinessPersistence, "businessAddressesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBusinessPersistence businessAddressesAddressColumnName](EDBusinessPersistence, "businessAddressesAddressColumnName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leftOuterJoin:sourceColumn:targetColumn:", v10, CFSTR("sender"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDBusinessPersistence businessAddressesCategoryColumnName](EDBusinessPersistence, "businessAddressesCategoryColumnName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageBusinessCategoryColumnAlias](EDMessagePersistence, "messageBusinessCategoryColumnAlias");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addResultColumn:alias:", v13, v14);

}

+ (id)categoryForResultRow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v3 = a3;
  +[EDMessagePersistence messageGlobalDataModelCategoryColumnName](EDMessagePersistence, "messageGlobalDataModelCategoryColumnName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "columnExistsWithName:", v4))
  {
    +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName](EDMessagePersistence, "messageGlobalDataModelSubcategoryColumnName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "columnExistsWithName:", v5))
    {
      +[EDMessagePersistence messageGlobalDataUserCategoryColumnName](EDMessagePersistence, "messageGlobalDataUserCategoryColumnName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "columnExistsWithName:", v6) & 1) != 0)
      {
        +[EDMessagePersistence messageGlobalDataHighImpactColumnName](EDMessagePersistence, "messageGlobalDataHighImpactColumnName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v3, "columnExistsWithName:", v7);

        if ((v8 & 1) == 0)
        {
          v12 = 0;
          goto LABEL_12;
        }
        +[EDMessagePersistence messageGlobalDataUserCategoryColumnName](EDMessagePersistence, "messageGlobalDataUserCategoryColumnName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberValue");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v4, "integerValue");
        if (v11 == -1)
        {

        }
        else if (v4)
        {
          goto LABEL_17;
        }
        +[EDMessagePersistence messageBusinessCategoryColumnAlias](EDMessagePersistence, "messageBusinessCategoryColumnAlias");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v3, "columnExistsWithName:", v14);

        if (!v15)
          goto LABEL_18;
        +[EDMessagePersistence messageBusinessCategoryColumnAlias](EDMessagePersistence, "messageBusinessCategoryColumnAlias");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberValue");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
LABEL_18:
          +[EDMessagePersistence messageGlobalDataModelCategoryColumnName](EDMessagePersistence, "messageGlobalDataModelCategoryColumnName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberValue");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v4 != 0;
          goto LABEL_19;
        }
LABEL_17:
        v18 = 3;
LABEL_19:
        if (v11 == -1)
          v21 = 2;
        else
          v21 = v18;
        +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName](EDMessagePersistence, "messageGlobalDataModelSubcategoryColumnName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        +[EDMessagePersistence messageGlobalDataHighImpactColumnName](EDMessagePersistence, "messageGlobalDataHighImpactColumnName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLValue");

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E110]), "initWithType:subtype:isHighImpact:state:", objc_msgSend(v4, "unsignedIntegerValue"), v25, v28, v21);
        goto LABEL_11;
      }

    }
  }
  v12 = 0;
LABEL_11:

LABEL_12:
  return v12;
}

- (EDCategoryCoreAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

- (void)setAnalyticsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsLogger, a3);
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDCategoryChangeHookResponder)hookResponder
{
  return self->_hookResponder;
}

- (EFLocked)cachedCurrentCategorizationVersion
{
  return self->_cachedCurrentCategorizationVersion;
}

- (void)setCachedCurrentCategorizationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCurrentCategorizationVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCurrentCategorizationVersion, 0);
  objc_storeStrong((id *)&self->_hookResponder, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
}

- (void)modelAnalyticsForMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Model Analytics is invalid JSON: %@. Error:%@", (uint8_t *)&v4, 0x16u);
}

+ (void)initializeCategorizationVersion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Couldn not set categorization version set to 1 due to error  %{public}@.", buf, 0xCu);

}

@end
