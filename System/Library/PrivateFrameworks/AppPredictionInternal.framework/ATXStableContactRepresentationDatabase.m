@implementation ATXStableContactRepresentationDatabase

- (ATXStableContactRepresentationDatabase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXStableContactRepresentationDatabase;
  return -[ATXAbstractVersionedDatabase initWithDefaultPath:](&v3, sel_initWithDefaultPath_, CFSTR("stableContactRepresentationDB.db"));
}

- (int64_t)latestVersion
{
  return 2;
}

- (BOOL)migrate
{
  int64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = -[ATXAbstractVersionedDatabase currentSchemaVersion](self, "currentSchemaVersion");
  if (v3 == -[ATXStableContactRepresentationDatabase latestVersion](self, "latestVersion"))
    return 1;
  if (v3 == 1)
    goto LABEL_5;
  if (v3)
    return 1;
  v10[0] = CFSTR("CREATE TABLE IF NOT EXISTS canonicalContactRepresentation( cnContactId TEXT PRIMARY KEY,   canonicalCnContactId TEXT NOT NULL) WITHOUT ROWID");
  v10[1] = CFSTR("CREATE TABLE IF NOT EXISTS contactInfo( canonicalCnContactId TEXT PRIMARY KEY,   firstName TEXT,   lastName TEXT,   email1 TEXT,   email2 TEXT,   email3 TEXT,   phoneNumber1 TEXT,   phoneNumber2 TEXT,   phoneNumber3 TEXT) WITHOUT ROWID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXStableContactRepresentationDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v4);

  if (v5)
  {
LABEL_5:
    v9[0] = CFSTR("DROP TABLE IF EXISTS canonicalContactRepresentation");
    v9[1] = CFSTR("CREATE TABLE IF NOT EXISTS cnContactIdToStableContactIdentifier( cnContactId TEXT PRIMARY KEY,   stableContactIdentifier TEXT NOT NULL) WITHOUT ROWID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXStableContactRepresentationDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v6);

    if (v7)
      return 1;
  }
  return 0;
}

- (BOOL)_runMigrationSteps:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id obj;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[ATXAbstractVersionedDatabase db](self, "db");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke;
        v13[3] = &unk_1E82DCB60;
        v13[4] = v8;
        v13[5] = &v18;
        objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v4);
  }

  v10 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->super._queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke;
  v11[3] = &unk_1E82DB9D8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync_notxn(queue, v11);

}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_2;
  v7[3] = &unk_1E82DCB88;
  v8 = a1[5];
  v9 = a1[6];
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3;
  v4[3] = &unk_1E82DCBB0;
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO cnContactIdToStableContactIdentifier VALUES (:cnContactId, :stableContactIdentifier)"), v7, 0, v4);

}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":cnContactId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":stableContactIdentifier", *(_QWORD *)(a1 + 40));

}

uint64_t __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3_cold_1(a1, v3, v4);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (id)stableContactIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync_notxn(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT stableContactIdentifier FROM cnContactIdToStableContactIdentifier WHERE cnContactId = :cnContactId"), v8, v7, v5);

}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":cnContactId", *(_QWORD *)(a1 + 32));
}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "stableContactIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4_cold_1(a1, v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (id)cnContactId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync_notxn(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT cnContactId FROM cnContactIdToStableContactIdentifier WHERE stableContactIdentifier = :stableContactIdentifier"), v8, v7, v5);

}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":stableContactIdentifier", *(_QWORD *)(a1 + 32));
}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "cnContactId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4_cold_1(a1, v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (id)deleteAllData
{
  NSObject *queue;
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke;
  v5[3] = &unk_1E82DCCA0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2;
  v3[3] = &unk_1E82DCC78;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM cnContactIdToStableContactIdentifier"), 0, 0, v3);

}

uint64_t __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2_cold_1(a1);

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

void __61__ATXStableContactRepresentationDatabase__runMigrationSteps___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Error running migration query: %@ %@", (uint8_t *)&v4, 0x16u);
}

void __124__ATXStableContactRepresentationDatabase_insertCnContactIdToStableContactIdentifierWithCnContactId_stableContactIdentifier___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "Error inserting cnContactId %@, stableContactIdentifier %@: %@", (uint8_t *)&v7, 0x20u);

}

void __66__ATXStableContactRepresentationDatabase_stableContactIdentifier___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v3, v4, "Error fetching stableContactIdentifier for cnContactId %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __54__ATXStableContactRepresentationDatabase_cnContactId___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v3, v4, "Error fetching cnContactId for stableContactIdentifier %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __55__ATXStableContactRepresentationDatabase_deleteAllData__block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v2, v3, "Error deleting cnContactIdToStableContactIdentifier in %@. Error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
