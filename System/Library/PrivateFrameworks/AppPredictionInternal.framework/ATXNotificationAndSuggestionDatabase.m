@implementation ATXNotificationAndSuggestionDatabase

- (ATXNotificationAndSuggestionDatabase)init
{
  void *v3;
  ATXNotificationAndSuggestionDatabase *v4;
  uint64_t v5;
  ATXNotificationManagementMAConstants *mobileAssetConstants;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("notificationAndSuggestionDB.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationAndSuggestionDatabase;
  v4 = -[ATXAbstractVersionedDatabase initWithDbPath:](&v8, sel_initWithDbPath_, v3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    mobileAssetConstants = v4->_mobileAssetConstants;
    v4->_mobileAssetConstants = (ATXNotificationManagementMAConstants *)v5;

  }
  return v4;
}

- (int64_t)latestVersion
{
  return 22;
}

- (BOOL)migrate
{
  int64_t v3;
  BOOL v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  _BOOL4 v29;
  _QWORD v31[8];
  const __CFString *v32;
  _QWORD v33[2];
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[2];
  _QWORD v37[4];
  const __CFString *v38;
  _QWORD v39[2];
  _QWORD v40[3];
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v3 = -[ATXAbstractVersionedDatabase currentSchemaVersion](self, "currentSchemaVersion");
  if (v3 == -[ATXNotificationAndSuggestionDatabase latestVersion](self, "latestVersion"))
    return 1;
  switch(v3)
  {
    case 0:
      v43[0] = CFSTR("CREATE TABLE IF NOT EXISTS notifications( uuid TEXT PRIMARY KEY,   receiveTimestamp REAL NOT NULL,   deliveryMethod INTEGER NOT NULL,   urgency INTEGER NOT NULL,   bundleId TEXT,   threadId TEXT,   contactId TEXT,   isGroupMessage INTEGER NOT NULL,   isMessage INTEGER NOT NULL,   latestOutcome INTEGER,   latestOutcomeTimestamp REAL,   isProminent INTEGER NOT NULL,   isActive INTEGER NOT NULL) WITHOUT ROWID");
      v43[1] = CFSTR("CREATE TABLE IF NOT EXISTS suggestions( uuid TEXT PRIMARY KEY,   createdTimestamp REAL NOT NULL,   triggerNotificationUUID TEXT,   deliverySuggestion BLOB NOT NULL,   suggestionType INTEGER NOT NULL,   scope INTEGER NOT NULL,   entityIdentifier TEXT,   shownTimestamp REAL,   latestOutcome INTEGER NOT NULL,   latestOutcomeTimestamp REAL NOT NULL,   isActive INTEGER NOT NULL) WITHOUT ROWID");
      v43[2] = CFSTR("CREATE TABLE IF NOT EXISTS biome_bookmark( bookmarkName TEXT PRIMARY KEY,   updatedTimestamp REAL NOT NULL,   bookmarkData BLOB) WITHOUT ROWID");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v12);

      if (v13)
        goto LABEL_16;
      goto LABEL_24;
    case 1:
LABEL_16:
      v42 = CFSTR("ALTER TABLE notifications ADD COLUMN numExpansions INTEGER NOT NULL DEFAULT 0");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v14);

      if (v15)
        goto LABEL_17;
      goto LABEL_24;
    case 2:
LABEL_17:
      v41 = CFSTR("ALTER TABLE notifications ADD COLUMN rawIdentifier TEXT");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v16);

      if (v17)
        goto LABEL_18;
      goto LABEL_24;
    case 3:
LABEL_18:
      v40[0] = CFSTR("CREATE INDEX smartPauseIndex ON notifications (bundleId, threadId, receiveTimestamp)");
      v40[1] = CFSTR("CREATE INDEX urgencyTuningIndex ON notifications (urgency, deliveryMethod, bundleId, receiveTimestamp)");
      v40[2] = CFSTR("CREATE INDEX candidateSelectionIndex ON notifications (bundleId, threadId, receiveTimestamp) WHERE isActive=1 AND isProminent=1");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v18);

      if (v19)
        goto LABEL_19;
      goto LABEL_24;
    case 4:
LABEL_19:
      v39[0] = CFSTR("ALTER TABLE suggestions ADD COLUMN feedbackKey TEXT");
      v39[1] = CFSTR("CREATE INDEX feedbackIndex ON suggestions (feedbackKey, shownTimestamp)");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v20);

      if (v21)
        goto LABEL_20;
      goto LABEL_24;
    case 5:
LABEL_20:
      v38 = CFSTR("CREATE INDEX nonprominentCandidateSelectionIndex ON notifications (bundleId, threadId, receiveTimestamp) WHERE isActive=1 AND isProminent=0");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v22);

      if (v23)
        goto LABEL_21;
      goto LABEL_24;
    case 6:
LABEL_21:
      v37[0] = CFSTR("ALTER TABLE notifications ADD COLUMN receivedMode TEXT");
      v37[1] = CFSTR("ALTER TABLE notifications ADD COLUMN firstUI INTEGER");
      v37[2] = CFSTR("ALTER TABLE notifications ADD COLUMN mostRecentUI INTEGER");
      v37[3] = CFSTR("ALTER TABLE notifications ADD COLUMN deliveryReason INTEGER");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v24);

      if (v25)
        goto LABEL_22;
      goto LABEL_24;
    case 7:
LABEL_22:
      v36[0] = CFSTR("CREATE INDEX sendMessagesToDigestIndex ON notifications(bundleId, receiveTimestamp)");
      v36[1] = CFSTR("CREATE INDEX receiveTimestampIndex ON notifications(receiveTimestamp)");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v26);

      if (v27)
        goto LABEL_23;
      goto LABEL_24;
    case 8:
LABEL_23:
      v35 = CFSTR("CREATE INDEX feedbackAndCreatedTimestamp ON suggestions (feedbackKey, createdTimestamp)");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v28);

      if (!v29)
        goto LABEL_24;
      goto LABEL_4;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
LABEL_4:
      if (-[ATXNotificationAndSuggestionDatabase _hasIndexNamed:](self, "_hasIndexNamed:", CFSTR("latestOutcomeIndex")))
        goto LABEL_6;
      v34 = CFSTR("CREATE INDEX IF NOT EXISTS latestOutcomeIndex ON notifications (latestOutcome);");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v5);

      if (v6)
        goto LABEL_6;
      goto LABEL_24;
    case 19:
LABEL_6:
      if (-[ATXNotificationAndSuggestionDatabase _hasColumnOnTable:named:](self, "_hasColumnOnTable:named:", CFSTR("notifications"), CFSTR("recordTimestamp")))
      {
        goto LABEL_9;
      }
      if (-[ATXNotificationAndSuggestionDatabase _hasColumnOnTable:named:](self, "_hasColumnOnTable:named:", CFSTR("notifications"), CFSTR("notificationID")))
      {
        goto LABEL_9;
      }
      v33[0] = CFSTR("ALTER TABLE notifications ADD COLUMN recordTimestamp REAL");
      v33[1] = CFSTR("ALTER TABLE notifications ADD COLUMN notificationID TEXT");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v7);

      if (v8)
        goto LABEL_9;
      goto LABEL_24;
    case 20:
LABEL_9:
      if (-[ATXNotificationAndSuggestionDatabase _hasColumnOnTable:named:](self, "_hasColumnOnTable:named:", CFSTR("notifications"), CFSTR("notificationBodyLength")))
      {
        goto LABEL_11;
      }
      v32 = CFSTR("ALTER TABLE notifications ADD COLUMN notificationBodyLength INTEGER");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v9);

      if (v10)
        goto LABEL_11;
LABEL_24:
      v4 = 0;
      break;
    case 21:
LABEL_11:
      v31[0] = CFSTR("ALTER TABLE notifications ADD COLUMN notificationTitleLength INTEGER");
      v31[1] = CFSTR("ALTER TABLE notifications ADD COLUMN notificationSubtitleLength INTEGER");
      v31[2] = CFSTR("ALTER TABLE notifications ADD COLUMN summaryLength INTEGER");
      v31[3] = CFSTR("ALTER TABLE notifications ADD COLUMN isDeliveredInPrioritySection INTEGER NOT NULL DEFAULT 0");
      v31[4] = CFSTR("ALTER TABLE notifications ADD COLUMN isSummarized INTEGER NOT NULL DEFAULT 0");
      v31[5] = CFSTR("ALTER TABLE notifications ADD COLUMN isPartOfStack INTEGER NOT NULL DEFAULT 0");
      v31[6] = CFSTR("ALTER TABLE notifications ADD COLUMN isStackSummary INTEGER NOT NULL DEFAULT 0");
      v31[7] = CFSTR("ALTER TABLE notifications ADD COLUMN isDeterminedUrgentByModel INTEGER NOT NULL DEFAULT 0");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[ATXNotificationAndSuggestionDatabase _anyColumnWithNameFromColumnNames:existsOnTable:](self, "_anyColumnWithNameFromColumnNames:existsOnTable:", &unk_1E83CF908, CFSTR("notifications"))|| -[ATXNotificationAndSuggestionDatabase _runMigrationSteps:](self, "_runMigrationSteps:", v11);

      break;
    default:
      return 1;
  }
  return v4;
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
        v13[2] = __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke;
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

uint64_t __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v5;
}

- (BOOL)_hasColumnOnTable:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[ATXAbstractVersionedDatabase db](self, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasColumnOnTable:named:", v7, v6);

  return v9;
}

- (BOOL)_anyColumnWithNameFromColumnNames:(id)a3 existsOnTable:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[ATXAbstractVersionedDatabase db](self, "db", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v14, "hasColumnOnTable:named:", v7, v13);

        if ((v13 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_hasIndexNamed:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ATXAbstractVersionedDatabase db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasIndexNamed:", v4);

  return v6;
}

- (id)getBookmarkDataFromName:(id)a3
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
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = 0;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync_notxn_0(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke(uint64_t a1)
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
  v8[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bookmarkData FROM biome_bookmark WHERE bookmarkName = :bookmarkName"), v8, v7, v5);

}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":bookmarkName", *(_QWORD *)(a1 + 32));
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (void)setBookmarkData:(id)a3 forName:(id)a4
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
  v11[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke;
  v11[3] = &unk_1E82DB9D8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync_notxn_0(queue, v11);

}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_2;
  v6[3] = &unk_1E82DCB88;
  v7 = a1[5];
  v8 = a1[6];
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3;
  v4[3] = &unk_1E82DCC28;
  v5 = a1[5];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO biome_bookmark VALUES (:bookmarkName, :ts, :bookmarkData)"), v6, 0, v4);

}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bookmarkName", v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":ts");
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":bookmarkData", *(_QWORD *)(a1 + 40));

}

uint64_t __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (void)insertNotificationFromEvent:(id)a3 deliveryMethod:(int64_t)a4 modeIdentifier:(id)a5 deliveryReason:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->super._queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke;
  v17[3] = &unk_1E82DEA20;
  v17[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync_notxn_0(queue, v17);

}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_2;
  v8[3] = &unk_1E82DE9F8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v12 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3;
  v6[3] = &unk_1E82DCC28;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO notifications VALUES (:uuid, :receiveTimestamp, :deliveryMethod, :urgency, :bundleId, :threadId, :contactId, :isGroupMessage, :isMessage, :latestOutcome, :latestOutcomeTimestamp, :isProminent, :isActive, 0, :rawIdentifier, :modeIdentifier, NULL, NULL, :deliveryReason, :recordTimestamp, :notificationID, :notificationBodyLength, :notificationTitleLength, :notificationSubtitleLength, :summaryLength, :isSummarized, :isPartOfStack, :isStackSummary, :isDeliveredInPrioritySection, :isDeterminedUrgentByModel)"), v8, 0, v6);

}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  id v37;

  v37 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toNSString:", ":uuid", v5);

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(v37, "bindNamedParam:toDouble:", ":receiveTimestamp");
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":deliveryMethod", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":urgency", objc_msgSend(v6, "urgency"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toNSString:", ":bundleId", v8);

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toNSString:", ":threadId", v10);

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v37, "bindNamedParam:toNSString:", ":contactId", v15);
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rawIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rawIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(v37, "bindNamedParam:toNSString:", ":rawIdentifier", v20);
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isGroupMessage", objc_msgSend(v21, "isGroupMessage"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isMessage", objc_msgSend(v22, "isMessage"));

  objc_msgSend(v37, "bindNamedParam:toInteger:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(v37, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");
  objc_msgSend(v37, "bindNamedParam:toNSString:", ":modeIdentifier", *(_QWORD *)(a1 + 40));
  objc_msgSend(v37, "bindNamedParam:toInt64AsNSNumber:", ":deliveryReason", *(_QWORD *)(a1 + 48));
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isProminent", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationNonprominence") ^ 1);
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isActive", 1);
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recordDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    objc_msgSend(v37, "bindNamedParam:toDouble:", ":recordTimestamp");

  }
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "notificationID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toNSString:", ":notificationID", v28);

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":notificationBodyLength", objc_msgSend(v29, "bodyLength"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":notificationTitleLength", objc_msgSend(v30, "titleLength"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":notificationSubtitleLength", objc_msgSend(v31, "subtitleLength"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInteger:", ":summaryLength", objc_msgSend(v32, "summaryLength"));

  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isDeliveredInPrioritySection", objc_msgSend(*(id *)(a1 + 32), "isDeliveredInPrioritySection"));
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isSummarized", objc_msgSend(v33, "isSummarized"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isPartOfStack", objc_msgSend(v34, "isPartOfStack"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isStackSummary", objc_msgSend(v35, "isStackSummary"));

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bindNamedParam:toInt64:", ":isDeterminedUrgentByModel", objc_msgSend(v36, "isDeterminedUrgentByModel"));

}

uint64_t __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (void)updateNotificationFromEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ATXNotificationAndSuggestionDatabase *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "eventType");
  queue = self->super._queue;
  if (v5 == 19)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke;
    v13[3] = &unk_1E82DACB0;
    v13[4] = self;
    v14 = v4;
    v7 = v4;
    dispatch_sync_notxn_0(queue, v13);
    v8 = v14;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_76;
    v10[3] = &unk_1E82DACB0;
    v11 = v4;
    v12 = self;
    v9 = v4;
    dispatch_sync_notxn_0(queue, v10);
    v8 = v11;
  }

}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v7 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE notifications SET numExpansions = numExpansions + 1 WHERE uuid = :uuid"), v6, 0, v4);

}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "notification");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":uuid", v5);

}

uint64_t __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_76(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "eventType");
  objc_msgSend(*(id *)(a1 + 40), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == 5;
  v5 = (uint64_t *)&kATXUpdateNotificationExcludingLatestOutcomeQuery;
  if (v2 != 5)
    v5 = (uint64_t *)&kATXUpdateNotificationIncludingLatestOutcomeQuery;
  v6 = *v5;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2_77;
  v10[3] = &unk_1E82DCF50;
  v12 = v4;
  v11 = *(id *)(a1 + 32);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_78;
  v8[3] = &unk_1E82DCC28;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v6, v10, 0, v8);

}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_2_77(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v6, "bindNamedParam:toInteger:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    objc_msgSend(v6, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");
  }
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":isProminent", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationNonprominence") ^ 1);
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":isActive", objc_msgSend(*(id *)(a1 + 32), "eventCausesNotificationInactivity") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":uuid", v5);

}

uint64_t __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_78(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (void)updateNotificationUIForNotifications:(id)a3 nextUI:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke;
  v9[3] = &unk_1E82DEAD0;
  v10 = v6;
  v11 = a4;
  v9[4] = self;
  v8 = v6;
  dispatch_sync_notxn_0(queue, v9);

}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_2;
  v4[3] = &unk_1E82DEA88;
  v3 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE notifications SET   firstUI = COALESCE(firstUI, :nextUI),   mostRecentUI = :nextUI WHERE   uuid IN _pas_nsarray(:notificationUUIDs) "), v4, 0, &__block_literal_global_82);

}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":nextUI", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v5, "bindNamedParam:toNSArray:", ":notificationUUIDs", v4);

}

uint64_t __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v10;
}

- (void)insertSuggestion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync_notxn_0(queue, v7);

}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v7 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO suggestions VALUES (:uuid, :createdTimestamp, :triggerNotificationUUID, :deliverySuggestion, :suggestionType, :scope, :entityIdentifier, :shownTimestamp, :latestOutcome, :latestOutcomeTimestamp, :isActive, :feedbackKey)"), v6, 0, v4);

}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":uuid", v6);

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":createdTimestamp");

  objc_msgSend(*(id *)(a1 + 32), "triggerNotificationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":triggerNotificationUUID", v9);

  objc_msgSend(*(id *)(a1 + 32), "encodeAsProto");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":deliverySuggestion", v10);

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":suggestionType", objc_msgSend(*(id *)(a1 + 32), "subtype"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":scope", objc_msgSend(*(id *)(a1 + 32), "scope"));
  objc_msgSend(*(id *)(a1 + 32), "entityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":entityIdentifier", v11);

  objc_msgSend(v4, "bindNamedParamToNull:", ":shownTimestamp");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":latestOutcome", 7);
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":isActive", 1);
  objc_msgSend(*(id *)(a1 + 32), "feedbackKey");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":feedbackKey", v13);

}

uint64_t __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (void)updateSuggestionFromEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync_notxn_0(queue, v7);

}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v7 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE suggestions SET shownTimestamp = COALESCE(shownTimestamp, :shownTimestamp), latestOutcome = :latestOutcome, latestOutcomeTimestamp = :latestOutcomeTimestamp, isActive = (isActive & :isActive) WHERE uuid = :uuid"), v6, 0, v4);

}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "eventType") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "bindNamedParam:toDouble:", ":shownTimestamp");

  }
  else
  {
    objc_msgSend(v7, "bindNamedParamToNull:", ":shownTimestamp");
  }
  objc_msgSend(v7, "bindNamedParam:toInt64:", ":latestOutcome", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(*(id *)(a1 + 32), "eventDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":latestOutcomeTimestamp");

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":isActive", objc_msgSend(*(id *)(a1 + 32), "eventCausesSuggestionInactivity") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "suggestionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":uuid", v6);

}

uint64_t __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3_cold_1(a1, (uint64_t)v3);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  id v11;
  NSObject *queue;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  int64_t v18;
  int64_t v19;
  double v20;
  SEL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v11 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  queue = self->super._queue;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke;
  v15[3] = &unk_1E82DEB48;
  v18 = a4;
  v19 = a5;
  v15[4] = self;
  v16 = v11;
  v20 = a6;
  v17 = &v22;
  v21 = a2;
  v13 = v11;
  dispatch_sync_notxn_0(queue, v15);
  LOBYTE(a4) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return a4;
}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2;
  v11[3] = &unk_1E82DEAF8;
  v13 = *(_OWORD *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 72);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3;
  v10[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4;
  v7[3] = &unk_1E82DEB20;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT count(*) AS numOfSuggestions FROM suggestions WHERE suggestionType = :suggestionType AND scope = :scope AND entityIdentifier = :entityId AND createdTimestamp >= :timestamp"), v11, v10, v7);

}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":suggestionType", v3);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":scope", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":entityId", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp", *(double *)(a1 + 56));

}

uint64_t __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumnAlias:", "numOfSuggestions") > 0;
  return *MEMORY[0x1E0D81780];
}

uint64_t __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  int64_t v19;
  int64_t v20;
  double v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__29;
  v27 = __Block_byref_object_dispose__29;
  queue = self->super._queue;
  v28 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke;
  v16[3] = &unk_1E82DEB48;
  v19 = a4;
  v20 = a5;
  v16[4] = self;
  v17 = v11;
  v21 = a6;
  v18 = &v23;
  v22 = a2;
  v13 = v11;
  dispatch_sync_notxn_0(queue, v16);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2;
  v11[3] = &unk_1E82DEAF8;
  v13 = *(_OWORD *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 72);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3;
  v10[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4;
  v7[3] = &unk_1E82DEB20;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT latestOutcome AS eventType FROM suggestions WHERE suggestionType = :suggestionType AND scope = :scope AND entityIdentifier = :entityId AND createdTimestamp >= :timestamp ORDER BY createdTimestamp DESC LIMIT 1"), v11, v10, v7);

}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":suggestionType", v3);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":scope", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":entityId", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp", *(double *)(a1 + 56));

}

uint64_t __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getIntegerForColumnAlias:", "eventType");

  v7 = objc_msgSend(v5, "initWithLong:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *MEMORY[0x1E0D81780];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4
{
  NSObject *queue;
  id v9;
  _QWORD v11[13];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__29;
  v24[4] = __Block_byref_object_dispose__29;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29;
  v22[4] = __Block_byref_object_dispose__29;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__29;
  v20[4] = __Block_byref_object_dispose__29;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__29;
  v18[4] = __Block_byref_object_dispose__29;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = (id)objc_opt_new();
  queue = self->super._queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke;
  v11[3] = &unk_1E82DEBD8;
  *(double *)&v11[10] = a4;
  v11[4] = self;
  v11[5] = v24;
  v11[6] = v22;
  v11[7] = v20;
  v11[8] = v18;
  v11[9] = &v12;
  v11[11] = a3;
  v11[12] = a2;
  dispatch_sync_notxn_0(queue, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  return v9;
}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[6];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v10[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_2;
  v10[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v2 = *(_QWORD *)(a1 + 96);
  v10[5] = *(_QWORD *)(a1 + 88);
  v6[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_3;
  v6[3] = &unk_1E82DEB90;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[4] = *(_QWORD *)(a1 + 80);
  v5[4] = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT MAX(IIF(isActive=1, receiveTimestamp, 0)) AS latestTimestamp, uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod AND urgency = :urgency GROUP BY bundleId LIMIT :limit"), v10, v6, v5);

}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":defaultAction", 1);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":supplementaryAction", 2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":longLook", 7);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":appLaunch", 9);
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":limit", 1000);
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp", *(double *)(a1 + 32));
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":deliveryMethod", 1);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":urgency", *(_QWORD *)(a1 + 40));

}

uint64_t __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 *v21;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "integerValue"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "getNSStringForColumnAlias:", "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithUUIDString:", v12);
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(v4, "getNSStringForColumnAlias:", "bundleId");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1[7] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v21 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v21;
}

uint64_t __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3
{
  NSObject *queue;
  id v7;
  _QWORD v9[13];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__29;
  v24[4] = __Block_byref_object_dispose__29;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29;
  v22[4] = __Block_byref_object_dispose__29;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__29;
  v20[4] = __Block_byref_object_dispose__29;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__29;
  v18[4] = __Block_byref_object_dispose__29;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__29;
  v16[4] = __Block_byref_object_dispose__29;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = (id)objc_opt_new();
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke;
  v9[3] = &unk_1E82DEC48;
  *(double *)&v9[11] = a3;
  v9[4] = self;
  v9[5] = v24;
  v9[6] = v22;
  v9[7] = v18;
  v9[8] = v20;
  v9[9] = v16;
  v9[10] = &v10;
  v9[12] = a2;
  dispatch_sync_notxn_0(queue, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  return v7;
}

void __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  __int128 v2;
  id v3;
  _QWORD v4[5];
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v9[4] = *(_QWORD *)(a1 + 88);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E82DEC20;
  v2 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 72);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 96);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT MAX(IIF(isActive=1 AND isProminent=1, receiveTimestamp, 0)) AS latestTimestamp, IIF(isActive=1 AND isProminent=1, uuid, NULL) AS uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod AND isMessage = 1 GROUP BY bundleId LIMIT :limit"), v9, v5, v4);

}

void __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":defaultAction", 1);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":supplementaryAction", 2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":longLook", 7);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":appLaunch", 9);
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":limit", 1000);
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp", *(double *)(a1 + 32));
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":deliveryMethod", 1);

}

uint64_t __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "integerValue"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[8] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
    v21 = *MEMORY[0x1E0D81780];

  }
  else
  {
    v21 = *MEMORY[0x1E0D81780];
  }

  return v21;
}

uint64_t __114__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3
{
  NSObject *queue;
  id v7;
  _QWORD v9[13];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__29;
  v24[4] = __Block_byref_object_dispose__29;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29;
  v22[4] = __Block_byref_object_dispose__29;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__29;
  v20[4] = __Block_byref_object_dispose__29;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__29;
  v18[4] = __Block_byref_object_dispose__29;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__29;
  v16[4] = __Block_byref_object_dispose__29;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = (id)objc_opt_new();
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke;
  v9[3] = &unk_1E82DEC48;
  *(double *)&v9[11] = a3;
  v9[4] = self;
  v9[5] = v24;
  v9[6] = v22;
  v9[7] = v18;
  v9[8] = v20;
  v9[9] = v16;
  v9[10] = &v10;
  v9[12] = a2;
  dispatch_sync_notxn_0(queue, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  return v7;
}

void __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  __int128 v2;
  id v3;
  _QWORD v4[5];
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_2;
  v9[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v9[4] = *(_QWORD *)(a1 + 88);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E82DEC20;
  v2 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 72);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 96);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT MAX(IIF(isActive=1 AND isProminent=1, receiveTimestamp, 0)) AS latestTimestamp, IIF(isActive=1 AND isProminent=1, uuid, NULL) AS uuid, SUM(IIF(latestOutcome IN (:defaultAction, :supplementaryAction, :longLook, :appLaunch), 1, 0)) AS numEngagedNotifications, SUM(1) AS numNotifications, bundleId FROM notifications WHERE receiveTimestamp >= :timestamp AND deliveryMethod = :deliveryMethod GROUP BY bundleId LIMIT :limit"), v9, v5, v4);

}

void __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":defaultAction", 1);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":supplementaryAction", 2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":longLook", 7);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":appLaunch", 9);
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":limit", 1000);
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp", *(double *)(a1 + 32));
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":deliveryMethod", 1);

}

uint64_t __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numEngagedNotifications"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "numNotifications")- objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "integerValue"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[8] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
    v21 = *MEMORY[0x1E0D81780];

  }
  else
  {
    v21 = *MEMORY[0x1E0D81780];
  }

  return v21;
}

uint64_t __104__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)mostRecentActiveNotifications
{
  void *v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v4 = (void *)objc_opt_new();
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke;
  v10[3] = &unk_1E82DEAD0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = a2;
  dispatch_sync_notxn_0(queue, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_2;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_3;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid, receiveTimestamp, urgency, bundleId, threadId, contactId, rawIdentifier, isGroupMessage FROM notifications WHERE isActive=1 ORDER BY receiveTimestamp DESC LIMIT 100"), 0, v5, v4);

}

uint64_t __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "getNSStringForColumnName:table:", "uuid", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  objc_msgSend(v3, "getDoubleForColumnName:table:", "receiveTimestamp", 0);
  v8 = v7;
  v9 = objc_msgSend(v3, "getIntegerForColumnName:table:", "urgency", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "bundleId", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "threadId", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "contactId", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "rawIdentifier", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "getIntegerForColumnName:table:", "isGroupMessage", 0);

  v15 = objc_alloc(MEMORY[0x1E0CF91D8]);
  if (v12)
  {
    v27[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (!v13)
  {
    LOBYTE(v24) = v14 == 1;
    v22 = (void *)objc_msgSend(v15, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v6, 0, 0, 0, 0, 0, v8, v10, v11, 0, 0, v16, 0, v24, 0, v9);
    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
  v17 = v11;
  v18 = v10;
  v19 = v6;
  v20 = v14 == 1;
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = v20;
  v6 = v19;
  v10 = v18;
  v11 = v17;
  v22 = (void *)objc_msgSend(v15, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v6, 0, 0, 0, 0, 0, v8, v10, v17, 0, 0, v16, v21, v24, 0, v9);

  if (v12)
LABEL_6:

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);

  return *MEMORY[0x1E0D81780];
}

uint64_t __69__ATXNotificationAndSuggestionDatabase_mostRecentActiveNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)numProminentActiveNotificationsByGroupingColumn:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("    SELECT %@ as groupVal, uuid, MAX(receiveTimestamp), COUNT(*) as groupCount     FROM notifications     WHERE isActive=1 AND isProminent=1 AND groupVal IS NOT NULL     GROUP BY groupVal    LIMIT 1000    "), v6);

  v8 = (void *)objc_opt_new();
  queue = self->super._queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke;
  v15[3] = &unk_1E82DEC98;
  v15[4] = self;
  v16 = v7;
  v10 = v8;
  v17 = v10;
  v18 = a2;
  v11 = v7;
  dispatch_sync_notxn_0(queue, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_2;
  v6[3] = &unk_1E82DEC70;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_3;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, v5);

}

uint64_t __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "groupVal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "uuid", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  v7 = objc_msgSend(v3, "getIntegerForColumnAlias:", "groupCount");

  v8 = objc_alloc(MEMORY[0x1E0D81638]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFirst:second:", v9, v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v4);
  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v11;
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_numProminentActiveNotificationsByGroupingColumn___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E82DC728;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(queue, block);

}

void __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v2 = (void *)objc_opt_new();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__29;
  v12[4] = __Block_byref_object_dispose__29;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E82DEC70;
  v5 = v2;
  v11 = v5;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E82DCC78;
  v6 = *(_QWORD *)(a1 + 48);
  v9[4] = v12;
  v9[5] = v6;
  v7 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM notifications WHERE isActive = 1"), 0, v10, v9);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "count");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    objc_msgSend(v8, "count");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(v12, 8);
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  unsigned __int8 *v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3_cold_1();

  v6 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v6;
}

- (void)setAllNotificationsToClearedExceptProminent
{
  NSObject *queue;
  _QWORD v3[5];

  queue = self->super._queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke;
  v3[3] = &unk_1E82DAC38;
  v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE notifications SET latestOutcome = :latestOutcome, isActive = :isActive WHERE isProminent = :isProminent"), &__block_literal_global_128_0, 0, &__block_literal_global_129);

}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":isActive", 0);
  objc_msgSend(v2, "bindNamedParam:toInteger:", ":latestOutcome", 3);
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":isProminent", 0);

}

uint64_t __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v10;
}

- (void)setAllNotificationsToModified
{
  NSObject *queue;
  _QWORD v3[5];

  queue = self->super._queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke;
  v3[3] = &unk_1E82DAC38;
  v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE notifications SET latestOutcome = :latestOutcome, isActive = :isActive, isProminent = (isProminent & :isActive) WHERE isActive != :isActive "), &__block_literal_global_130, 0, &__block_literal_global_131);

}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "bindNamedParam:toInt64:", ":isActive", 0);
  objc_msgSend(v2, "bindNamedParam:toInteger:", ":latestOutcome", 18);

}

uint64_t __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v10;
}

- (id)currentActiveSuggestions
{
  void *v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  __CFString *v11;
  id v12;
  SEL v13;

  v4 = (void *)objc_opt_new();
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke;
  v10[3] = &unk_1E82DEC98;
  v10[4] = self;
  v11 = CFSTR("    SELECT entityIdentifier, deliverySuggestion     FROM suggestions     WHERE isActive=1 LIMIT 1000");
  v13 = a2;
  v6 = v4;
  v12 = v6;
  dispatch_sync_notxn_0(queue, v10);
  v7 = v12;
  v8 = v6;

  return v8;
}

void __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9[2];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2;
  v8[3] = &unk_1E82DED60;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  *(_OWORD *)v9 = v6;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_137;
  v7[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v7[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, v8, v7);

}

uint64_t __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "entityIdentifier", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "getNSDataForColumnName:table:", "deliverySuggestion", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8F90]), "initWithProtoData:", v5);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v4);
    }
    else
    {
      __atxlog_handle_notification_management();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    v9 = *MEMORY[0x1E0D81780];

  }
  else
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Encountered nil entityIdentifier in %@. Skipping result.", (uint8_t *)&v19, 0xCu);

    }
    v9 = *MEMORY[0x1E0D81780];
  }

  return v9;
}

uint64_t __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_137(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3
{
  void *v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  SEL v15;

  v6 = (void *)objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke;
  v12[3] = &unk_1E82DED88;
  v12[4] = self;
  v14 = a3;
  v8 = v6;
  v13 = v8;
  v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_2;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v3 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  v6[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v3;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT     bundleId,     threadId,     MAX(receiveTimestamp) AS receiveTimestamp,     uuid,     contactId,     urgency,     isMessage,     isGroupMessage FROM notifications WHERE     isActive = 1 AND     isProminent = 1 GROUP BY     bundleId,     threadId ORDER BY     receiveTimestamp DESC LIMIT     :numStacksLimit "), v8, v6, v5);

}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":numStacksLimit", *(_QWORD *)(a1 + 32));
}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "threadId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnAlias:", "receiveTimestamp");
  v7 = v6;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "contactId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "getIntegerForColumnAlias:", "urgency");
  v11 = objc_msgSend(v3, "getIntegerForColumnAlias:", "isMessage");
  v12 = objc_msgSend(v3, "getIntegerForColumnAlias:", "isGroupMessage");

  v13 = objc_alloc(MEMORY[0x1E0CF91D8]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  v15 = (void *)objc_msgSend(v13, "initWithUUID:timestamp:", v14, v7);

  objc_msgSend(v15, "setBundleID:", v4);
  objc_msgSend(v15, "setThreadID:", v5);
  if (v9)
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContactIDs:", v16);

  }
  objc_msgSend(v15, "setUrgency:", v10);
  objc_msgSend(v15, "setIsMessage:", v11 != 0);
  objc_msgSend(v15, "setIsGroupMessage:", v12 != 0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

  return *MEMORY[0x1E0D81780];
}

uint64_t __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3
{
  void *v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  SEL v15;

  v6 = (void *)objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke;
  v12[3] = &unk_1E82DED88;
  v12[4] = self;
  v14 = a3;
  v8 = v6;
  v13 = v8;
  v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_2;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v3 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  v6[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v3;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT     bundleId,     threadId,     MAX(receiveTimestamp) AS receiveTimestamp,     uuid,     contactId,     urgency,     isMessage,     isGroupMessage FROM notifications WHERE     isActive = 1 AND     isProminent = 0 GROUP BY     bundleId,     threadId ORDER BY     receiveTimestamp DESC LIMIT     :numStacksLimit "), v8, v6, v5);

}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":numStacksLimit", *(_QWORD *)(a1 + 32));
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "threadId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnAlias:", "receiveTimestamp");
  v7 = v6;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "contactId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "getIntegerForColumnAlias:", "urgency");
  v11 = objc_msgSend(v3, "getIntegerForColumnAlias:", "isMessage");
  v12 = objc_msgSend(v3, "getIntegerForColumnAlias:", "isGroupMessage");

  v13 = objc_alloc(MEMORY[0x1E0CF91D8]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  v15 = (void *)objc_msgSend(v13, "initWithUUID:timestamp:", v14, v7);

  objc_msgSend(v15, "setBundleID:", v4);
  objc_msgSend(v15, "setThreadID:", v5);
  if (v9)
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContactIDs:", v16);

  }
  objc_msgSend(v15, "setUrgency:", v10);
  objc_msgSend(v15, "setIsMessage:", v11 != 0);
  objc_msgSend(v15, "setIsGroupMessage:", v12 != 0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

  return *MEMORY[0x1E0D81780];
}

uint64_t __88__ATXNotificationAndSuggestionDatabase_getTopOfNonProminentStackNotificationsWithLimit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4 positiveEngagementEnums:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *queue;
  double v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SEL v40;

  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v13 = v9;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  if (v10)
    v15 = v10;
  else
    v15 = v12;
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v18 = v17 + -300.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v20 = v19 + -3600.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v22 = v21 + -86400.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  queue = self->super._queue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke;
  v31[3] = &unk_1E82DEDD8;
  v35 = v18;
  v36 = v20;
  v37 = v22;
  v38 = v24 + -604800.0;
  v39 = a4;
  v31[4] = self;
  v32 = v14;
  v33 = v16;
  v25 = v11;
  v34 = v25;
  v40 = a2;
  v26 = v16;
  v27 = v14;
  dispatch_sync_notxn_0(queue, v31);
  v28 = v34;
  v29 = v25;

  return v29;
}

void __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_2;
  v8[3] = &unk_1E82DEDB0;
  v4 = *(_OWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 64);
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 96);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v7 = *(id *)(a1 + 56);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 104);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, threadId, SUM(IIF(notifications.receiveTimestamp > :lastFiveMinutesTimestamp, 1, 0)) AS lastFiveMinutesNotifications, SUM(IIF(notifications.receiveTimestamp > :lastFiveMinutesTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastFiveMinutesPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastHourTimestamp, 1, 0)) AS lastHourNotifications, SUM(IIF(notifications.receiveTimestamp > :lastHourTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastHourPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastDayTimestamp, 1, 0)) AS lastDayNotifications, SUM(IIF(notifications.receiveTimestamp > :lastDayTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastDayPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :lastWeekTimestamp, 1, 0)) AS lastWeekNotifications, SUM(IIF(notifications.receiveTimestamp > :lastWeekTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS lastWeekPositiveEngagements, SUM(IIF(notifications.receiveTimestamp > :cutoffTimestamp, 1, 0)) AS allNotifications, SUM(IIF(notifications.receiveTimestamp > :cutoffTimestamp AND latestOutcome IN _pas_nsarray(:positiveEngagementOutcomes), 1, 0)) AS allPositiveEngagements FROM notifications WHERE bundleId IN _pas_nsarray(:candidateNotificationBundleIds) AND receiveTimestamp > :cutoffTimestamp GROUP BY bundleId, threadId "), v8, v6, v5);

}

void __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":lastFiveMinutesTimestamp", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":lastHourTimestamp", *(double *)(a1 + 56));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":lastDayTimestamp", *(double *)(a1 + 64));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":lastWeekTimestamp", *(double *)(a1 + 72));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":cutoffTimestamp", *(double *)(a1 + 80));
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":positiveEngagementOutcomes", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":candidateNotificationBundleIds", *(_QWORD *)(a1 + 40));

}

uint64_t __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ATXSmartPauseDatabaseQueryResult *v6;
  uint64_t v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "threadId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXSmartPauseDatabaseQueryResult initWithBundleId:threadId:]([ATXSmartPauseDatabaseQueryResult alloc], "initWithBundleId:threadId:", v4, v5);
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesNotifications:](v6, "setCountLastFiveMinutesNotifications:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastFiveMinutesNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesPositiveEngagements:](v6, "setCountLastFiveMinutesPositiveEngagements:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastFiveMinutesPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourNotifications:](v6, "setCountLastHourNotifications:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastHourNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourPositiveEngagements:](v6, "setCountLastHourPositiveEngagements:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastHourPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayNotifications:](v6, "setCountLastDayNotifications:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastDayNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayPositiveEngagements:](v6, "setCountLastDayPositiveEngagements:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastDayPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekNotifications:](v6, "setCountLastWeekNotifications:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastWeekNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekPositiveEngagements:](v6, "setCountLastWeekPositiveEngagements:", objc_msgSend(v3, "getIntegerForColumnAlias:", "lastWeekPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountNotifications:](v6, "setCountNotifications:", objc_msgSend(v3, "getIntegerForColumnAlias:", "allNotifications"));
  v7 = objc_msgSend(v3, "getIntegerForColumnAlias:", "allPositiveEngagements");

  -[ATXSmartPauseDatabaseQueryResult setCountPositiveEngagements:](v6, "setCountPositiveEngagements:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __113__ATXNotificationAndSuggestionDatabase_getSmartPauseFeaturesForBundleIds_sinceTimestamp_positiveEngagementEnums___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  queue = self->super._queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke;
  v19[3] = &unk_1E82DEE28;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v23 = a5;
  v13 = v11;
  v22 = v13;
  v24 = a2;
  v14 = v10;
  v15 = v9;
  dispatch_sync_notxn_0(queue, v19);
  v16 = v22;
  v17 = v13;

  return v17;
}

void __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_2;
  v10[3] = &unk_1E82DEE00;
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v12 = v4;
  v13 = v5;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_3;
  v8[3] = &unk_1E82DEC70;
  v9 = v6;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_4;
  v7[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v7[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid, receiveTimestamp, urgency, bundleId, threadId, contactId, rawIdentifier, isGroupMessage, isMessage   FROM notifications   WHERE receiveTimestamp > :startTimestamp AND receiveTimestamp < :endTimestamp   LIMIT :limit"), v10, v8, v7);

}

void __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTimestamp");
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTimestamp");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":limit", *(_QWORD *)(a1 + 48));

}

uint64_t __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumnAlias:", "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  objc_msgSend(v4, "getDoubleForColumnAlias:", "receiveTimestamp");
  v9 = v8;
  v10 = objc_msgSend(v4, "getIntegerForColumnAlias:", "urgency");
  objc_msgSend(v4, "getNSStringForColumnAlias:", "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnAlias:", "threadId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getNSStringForColumnAlias:", "contactId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "getIntegerForColumnAlias:", "isGroupMessage");
  v15 = objc_msgSend(v4, "getIntegerForColumnAlias:", "isMessage");

  v16 = objc_alloc(MEMORY[0x1E0CF91D8]);
  v17 = v16;
  if (v13)
  {
    v18 = v14 == 1;
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = v18;
    v20 = (void *)objc_msgSend(v17, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v7, 0, 0, 0, 0, 0, v9, v11, v12, 0, v19, v22, 0, v10);

  }
  else
  {
    LOBYTE(v22) = v14 == 1;
    v20 = (void *)objc_msgSend(v16, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v7, 0, 0, 0, 0, 0, v9, v11, v12, 0, MEMORY[0x1E0C9AA60], v22, 0, v10);
  }
  objc_msgSend(v20, "setIsMessage:", v15 == 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

  return *MEMORY[0x1E0D81780];
}

uint64_t __97__ATXNotificationAndSuggestionDatabase_allNotificationsBetweenStartTimestamp_endTimestamp_limit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3
{
  id v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  queue = self->super._queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke;
  v13[3] = &unk_1E82DEC98;
  v13[4] = self;
  v14 = v5;
  v8 = v6;
  v15 = v8;
  v16 = a2;
  v9 = v5;
  dispatch_sync_notxn_0(queue, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 48);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT count(*) AS received, bundleId FROM notifications WHERE receiveTimestamp > :startTimestamp GROUP BY bundleId"), v7, v5, v4);

}

void __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":startTimestamp");

}

uint64_t __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "getIntegerForColumnAlias:", "received");

  objc_msgSend(v5, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v4);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __82__ATXNotificationAndSuggestionDatabase_notificationsReceivedPerBundleIdSinceDate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)resolutionsForNotifications:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;

  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_161);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)objc_opt_new();
  queue = self->super._queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_2;
  v17[3] = &unk_1E82DEC98;
  v17[4] = self;
  v18 = v9;
  v12 = v10;
  v19 = v12;
  v20 = a2;
  v13 = v9;
  dispatch_sync_notxn_0(queue, v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_3;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_4;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 48);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid, numExpansions, latestOutcome, latestOutcomeTimestamp FROM notifications WHERE uuid IN _pas_nsarray(:notificationUUIDs) LIMIT :limit"), v7, v5, v4);

}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toNSArray:", ":notificationUUIDs", v2);
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":limit", 1000);

}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  ATXUserNotificationResolution *v11;
  unsigned __int8 *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumnAlias:", "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  objc_msgSend(v4, "getDoubleForColumnAlias:", "latestOutcomeTimestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "getInt64ForColumnAlias:", "numExpansions");
  v10 = objc_msgSend(v4, "getIntegerForColumnAlias:", "latestOutcome");

  v11 = -[ATXUserNotificationResolution initWithNotificationUUID:numExpansions:resolutionType:resolutionTimestamp:]([ATXUserNotificationResolution alloc], "initWithNotificationUUID:numExpansions:resolutionType:resolutionTimestamp:", v7, v9, ATXUserNotificationResolutionTypeForNotificationEventType(v10), v8);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v12;
}

uint64_t __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)_countNotificationsPerAppWithFilters:(id)a3 stmtBinder:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v7 = a4;
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(" AND "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT bundleId, COUNT(*) AS numNotifications FROM notifications WHERE %@ GROUP BY bundleId LIMIT :numRowsLimit"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  queue = self->super._queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke;
  v18[3] = &unk_1E82DEE98;
  v18[4] = self;
  v19 = v9;
  v21 = v7;
  v12 = v10;
  v20 = v12;
  v22 = a2;
  v13 = v7;
  v14 = v9;
  dispatch_sync_notxn_0(queue, v18);
  v15 = v20;
  v16 = v12;

  return v16;
}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_2;
  v8[3] = &unk_1E82DEE70;
  v9 = *(id *)(a1 + 56);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v7 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v8, v6, v5);

}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  v3(v2, v4);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":numRowsLimit", 1000);

}

uint64_t __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "numNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

uint64_t __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__ATXNotificationAndSuggestionDatabase_messageNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  v5 = _Block_copy(v8);
  -[ATXNotificationAndSuggestionDatabase _countNotificationsPerAppWithFilters:stmtBinder:](self, "_countNotificationsPerAppWithFilters:stmtBinder:", &unk_1E83CF920, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __90__ATXNotificationAndSuggestionDatabase_messageNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTime", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTime", *(double *)(a1 + 40));

}

- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__ATXNotificationAndSuggestionDatabase_timeSensitiveNonmessageNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  v5 = _Block_copy(v8);
  -[ATXNotificationAndSuggestionDatabase _countNotificationsPerAppWithFilters:stmtBinder:](self, "_countNotificationsPerAppWithFilters:stmtBinder:", &unk_1E83CF938, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __106__ATXNotificationAndSuggestionDatabase_timeSensitiveNonmessageNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTime", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTime", *(double *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":timeSensitiveUrgency", 1);

}

- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__ATXNotificationAndSuggestionDatabase_totalNotificationsPerAppFromStartTime_toEndTime___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  v5 = _Block_copy(v8);
  -[ATXNotificationAndSuggestionDatabase _countNotificationsPerAppWithFilters:stmtBinder:](self, "_countNotificationsPerAppWithFilters:stmtBinder:", &unk_1E83CF950, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __88__ATXNotificationAndSuggestionDatabase_totalNotificationsPerAppFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTime", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTime", *(double *)(a1 + 40));

}

- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3
{
  void *v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  double v14;
  SEL v15;

  v6 = (void *)objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke;
  v12[3] = &unk_1E82DED88;
  v12[4] = self;
  v14 = a3;
  v8 = v6;
  v13 = v8;
  v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId, SUM(IIF(isMessage = 0 AND urgency != :urgency, 1, 0)) AS numBasicNotifications, SUM(IIF(isMessage = 1, 1, 0)) AS numMessageNotifications, SUM(IIF(isMessage = 0 AND urgency = :urgency, 1, 0)) AS numTimeSenstiveNonMessageNotifications FROM notifications WHERE receiveTimestamp >= :startTime GROUP BY bundleId ORDER BY numBasicNotifications DESC"), v7, v5, v4);

}

void __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v2 = *(double *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":startTime", v2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":urgency", 1);

}

uint64_t __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getIntegerForColumnAlias:", "numBasicNotifications");
  v6 = objc_msgSend(v3, "getIntegerForColumnAlias:", "numMessageNotifications");
  v7 = objc_msgSend(v3, "getIntegerForColumnAlias:", "numTimeSenstiveNonMessageNotifications");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C90]), "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v9;
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_appSortedByNumOfNotificationsSinceTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (double)receiveTimeStampOfFirstNotification
{
  NSObject *queue;
  double v3;
  _QWORD v5[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke;
  v5[3] = &unk_1E82DCCA0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[5];
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_2;
  v5[3] = &unk_1E82DCC00;
  v2 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT receiveTimestamp FROM notifications WHERE receiveTimestamp != 0 ORDER BY receiveTimestamp ASC LIMIT 1"), 0, v5, v4);

}

uint64_t __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumnAlias:", "receiveTimestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E0D81788];
}

uint64_t __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  queue = self->super._queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke;
  v14[3] = &unk_1E82DEC98;
  v17 = a4;
  v14[4] = self;
  v15 = v6;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  dispatch_sync_notxn_0(queue, v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_2;
  v8[3] = &unk_1E82DEA88;
  v10 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3;
  v6[3] = &unk_1E82DEC70;
  v7 = *(id *)(a1 + 48);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_197;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid, isActive FROM notifications WHERE receiveTimestamp > :timestamp and bundleId == :bundleId ORDER BY receiveTimestamp ASC"), v8, v6, v4);

}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", *(_QWORD *)(a1 + 32));

}

uint64_t __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  if (!v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3_cold_1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumnAlias:", "isActive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v10;
}

uint64_t __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_197(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_197_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)allBundleIdsOfNotificationsOnLockscreen
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync_notxn_0(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3;
  v3[3] = &unk_1E82DEC70;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT bundleId FROM notifications WHERE isActive = 1 AND receiveTimestamp > :cutoff AND latestOutcome IN (:receivedAndDeliveredProminently, :receivedAndDeliveredNonprominently) ORDER BY receiveTimestamp LIMIT 100"), &__block_literal_global_201, v3, &__block_literal_global_206);

}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":receivedAndDeliveredProminently", 16);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":receivedAndDeliveredNonprominently", 17);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":cutoff", v2 + -86400.0);

}

uint64_t __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    __atxlog_handle_notification_management();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v12;
}

uint64_t __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_205(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_205_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
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
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke;
  v5[3] = &unk_1E82DCCA0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2;
  v10[3] = &unk_1E82DCC78;
  v11 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions"), 0, 0, v10);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_207;
    v8[3] = &unk_1E82DCC78;
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM notifications"), 0, 0, v8);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "db");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6[0] = v3;
      v6[1] = 3221225472;
      v6[2] = __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_208;
      v6[3] = &unk_1E82DCC78;
      v7 = *(_OWORD *)(a1 + 40);
      objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM biome_bookmark"), 0, 0, v6);

    }
  }
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_207(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_207_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

uint64_t __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_208(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_208_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

- (id)pruneNotificationsBeforeTimestamp:(double)a3
{
  NSObject *queue;
  id v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  queue = self->super._queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E82DEF00;
  *(double *)&v6[6] = a3;
  v6[4] = self;
  v6[5] = &v7;
  v6[7] = a2;
  dispatch_sync_notxn_0(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[6];
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_2;
  v5[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v5[4] = *(_QWORD *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3;
  v4[3] = &unk_1E82DCC78;
  v2 = *(_QWORD *)(a1 + 56);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM notifications WHERE bundleId != :excludeBundleId AND (receiveTimestamp < :deletionCutoffTimestamp OR receiveTimestamp > :nowTimestamp)"), v5, 0, v4);

}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  void *v3;
  id v4;

  v2 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":deletionCutoffTimestamp", v2);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":nowTimestamp");

  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":excludeBundleId", CFSTR("com.apple.tips"));
}

uint64_t __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3(uint64_t a1, void *a2)
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
    __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

- (id)pruneSuggestionsBeforeTimestamp:(double)a3
{
  NSObject *queue;
  id v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  queue = self->super._queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E82DEF00;
  *(double *)&v6[6] = a3;
  v6[4] = self;
  v6[5] = &v7;
  v6[7] = a2;
  dispatch_sync_notxn_0(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[6];
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_2;
  v5[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v5[4] = *(_QWORD *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3;
  v4[3] = &unk_1E82DCC78;
  v2 = *(_QWORD *)(a1 + 56);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE createdTimestamp < :deletionCutoffTimestamp"), v5, 0, v4);

}

uint64_t __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":deletionCutoffTimestamp", *(double *)(a1 + 32));
}

uint64_t __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3(uint64_t a1, void *a2)
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
    __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  ATXNotificationAndSuggestionDatabase *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->super._queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke;
  v11 = &unk_1E82DACB0;
  v12 = self;
  v6 = v4;
  v13 = v6;
  dispatch_sync_notxn_0(queue, &v8);
  if (objc_msgSend(v6, "didDefer", v8, v9, v10, v11, v12))
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]";
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }

  }
  else
  {
    -[ATXNotificationAndSuggestionDatabase analyze](self, "analyze");
  }

}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__29;
  v43 = __Block_byref_object_dispose__29;
  v44 = 0;
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Pruning notifications", buf, 0xCu);
  }

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_216;
  v37[3] = &unk_1E82DEC70;
  v6 = v3;
  v38 = v6;
  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2;
  v36[3] = &unk_1E82DEF28;
  v36[4] = &v39;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT bundleId FROM notifications GROUP BY bundleId ORDER BY count(*) DESC "), 0, v37, v36);

  if (v40[5] && !objc_msgSend(v6, "count"))
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_2(v10, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9 = v8;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
LABEL_9:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(*(id *)(a1 + 32), "_pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:", v14, *(_QWORD *)(a1 + 40));
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        if (v16 - v9 > 5.0 && objc_msgSend(*(id *)(a1 + 40), "didDefer"))
        {
          __atxlog_handle_notification_management();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
            _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
          }

          v18 = 0;
        }
        else
        {
          v18 = 1;
        }
        objc_autoreleasePoolPop(v15);
        if (!v18)
          break;
        if (v11 == ++v13)
        {
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
          if (v11)
            goto LABEL_9;
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:

      v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "ATXNotificationAndSuggestionDatabase_maxNumberOfNotifications");
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        v47 = 2048;
        v48 = v19;
        _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%s: Pruning notifications table to max %ld rows", buf, 0x16u);
      }

      v21 = *(id **)(a1 + 32);
      v22 = objc_msgSend(v21[5], "ATXNotificationAndSuggestionDatabase_pruningBatchSize");
      v23 = *(_QWORD *)(a1 + 40);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_219;
      v31[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v31[4] = v19;
      objc_msgSend(v21, "prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:", CFSTR("DELETE FROM notifications RETURNING 1 ORDER BY receiveTimestamp DESC LIMIT :batchSize OFFSET :maxNumberOfNotifications "), v22, v23, v31, 0, &__block_literal_global_222);
      __atxlog_handle_notification_management();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v46 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%s: Finished pruning notifications", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v39, 8);
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_216(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
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
    __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_219(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInteger:", ":maxNumberOfNotifications", *(_QWORD *)(a1 + 32));
}

uint64_t __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_221(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_221_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)prepAndRunQuery:(id)a3 batchSize:(int64_t)a4 XPCActivity:(id)a5 onPrep:(id)a6 onRow:(id)a7 onError:(id)a8
{
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  double v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  id v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  _QWORD v44[4];
  id v45;
  int64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  _BYTE v51[24];
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v37 = a5;
  v13 = a6;
  v14 = a7;
  v40 = a8;
  __atxlog_handle_notification_management();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:].cold.2(a4, v15, v16, v17, v18, v19, v20, v21);

  v22 = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v24 = v23;
  v25 = 1000;
  v26 = MEMORY[0x1E0C809B0];
  do
  {
    v27 = (void *)MEMORY[0x1CAA48B6C](v22);
    *(_QWORD *)v51 = 0;
    *(_QWORD *)&v51[8] = v51;
    *(_QWORD *)&v51[16] = 0x2020000000;
    v52 = 0;
    -[ATXAbstractVersionedDatabase db](self, "db");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v26;
    v44[1] = 3221225472;
    v44[2] = __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke;
    v44[3] = &unk_1E82DEF70;
    v29 = v13;
    v45 = v29;
    v46 = a4;
    v41[0] = v26;
    v41[1] = 3221225472;
    v41[2] = __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke_2;
    v41[3] = &unk_1E82DEF98;
    v30 = v14;
    v42 = v30;
    v43 = v51;
    objc_msgSend(v28, "prepAndRunQuery:onPrep:onRow:onError:", v39, v44, v41, v40);

    if (!*(_DWORD *)(*(_QWORD *)&v51[8] + 24))
    {
      __atxlog_handle_notification_management();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:].cold.1(v34);
      goto LABEL_18;
    }
    __atxlog_handle_notification_management();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v33 = *(_DWORD *)(*(_QWORD *)&v51[8] + 24);
      *(_DWORD *)buf = 136315394;
      v48 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
      v49 = 1024;
      v50 = v33;
      _os_log_debug_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEBUG, "%s: Deleted %d rows", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v32 - v24 > 5.0 && objc_msgSend(v37, "didDefer"))
    {
      __atxlog_handle_notification_management();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
        _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, "%s: XPC deferral, unable to finish batched deletion", buf, 0xCu);
      }
LABEL_18:

      _Block_object_dispose(v51, 8);
      objc_autoreleasePoolPop(v27);
      goto LABEL_19;
    }

    _Block_object_dispose(v51, 8);
    objc_autoreleasePoolPop(v27);
    --v25;
  }
  while (v25);
  __atxlog_handle_notification_management();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v51 = 136315394;
    *(_QWORD *)&v51[4] = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
    *(_WORD *)&v51[12] = 2048;
    *(_QWORD *)&v51[14] = 1000 * a4;
    _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEFAULT, "%s: Reached maximum number of rows to delete: %ld", v51, 0x16u);
  }

LABEL_19:
}

void __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v5;
  }
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":batchSize", *(_QWORD *)(a1 + 40));

}

uint64_t __99__ATXNotificationAndSuggestionDatabase_prepAndRunQuery_batchSize_XPCActivity_onPrep_onRow_onError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return *MEMORY[0x1E0D81780];
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:(id)a3 XPCActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  ATXNotificationAndSuggestionDatabase *v17;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_notification_management();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationAndSuggestionDatabase _pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:].cold.2();

  v9 = -[ATXNotificationManagementMAConstants ATXNotificationAndSuggestionDatabase_pruningBatchSize](self->_mobileAssetConstants, "ATXNotificationAndSuggestionDatabase_pruningBatchSize");
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke;
  v15[3] = &unk_1E82DCB88;
  v16 = v6;
  v17 = self;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2;
  v13[3] = &unk_1E82DCC28;
  v11 = v16;
  v14 = v11;
  -[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:](self, "prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:", CFSTR("DELETE FROM notifications WHERE bundleId = :bundleId RETURNING 1 ORDER BY receiveTimestamp DESC LIMIT :batchSize OFFSET :maxNumberOfNotificationsPerApp "), v9, v7, v15, 0, v13);

  __atxlog_handle_notification_management();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationAndSuggestionDatabase _pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:].cold.1();

}

void __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":maxNumberOfNotificationsPerApp", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "ATXNotificationAndSuggestionDatabase_maxNumberOfNotificationsPerApp"));

}

uint64_t __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  ATXNotificationAndSuggestionDatabase *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->super._queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke;
  v11 = &unk_1E82DACB0;
  v12 = self;
  v6 = v4;
  v13 = v6;
  dispatch_sync_notxn_0(queue, &v8);
  if (objc_msgSend(v6, "didDefer", v8, v9, v10, v11, v12))
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]";
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }

  }
  else
  {
    -[ATXNotificationAndSuggestionDatabase analyze](self, "analyze");
  }

}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Pruning suggestions", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 + -2419200.0;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_229;
  v13[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  *(double *)&v13[4] = v4;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE latestOutcome = :latestOutcomeCreated     AND triggerNotificationUUID IN(        SELECT triggerNotificationUUID         FROM suggestions         WHERE latestOutcome = :latestOutcomeCouldNotShow             AND latestOutcomeTimestamp < :timestamp28DaysAgo    ) "), v13, 0, &__block_literal_global_233);

  if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
      v8 = "%s: XPC Activity deferred, skipping remaining work.";
LABEL_11:
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_236;
    v12[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    *(double *)&v12[4] = v4;
    objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions WHERE latestOutcome = :latestOutcomeCouldNotShow     AND latestOutcomeTimestamp < :timestamp28DaysAgo "), v12, 0, &__block_literal_global_238);

    if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
    {
      __atxlog_handle_notification_management();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        v8 = "%s: XPC Activity deferred, skipping remaining work.";
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "db");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_241;
      v11[3] = &unk_1E82DCBD8;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM suggestions ORDER BY latestOutcomeTimestamp DESC LIMIT -1 OFFSET :maxNumberOfSuggestions"), v11, 0, &__block_literal_global_244);

      __atxlog_handle_notification_management();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke";
        v8 = "%s: Finished pruning suggestions";
        goto LABEL_11;
      }
    }
  }

}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_229(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":latestOutcomeCreated", 7);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":latestOutcomeCouldNotShow", 8);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":timestamp28DaysAgo", (uint64_t)*(double *)(a1 + 32));

}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_236(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":latestOutcomeCouldNotShow", 8);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":timestamp28DaysAgo", (uint64_t)*(double *)(a1 + 32));

}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_237(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_237_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_241(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":maxNumberOfSuggestions", objc_msgSend(v2, "ATXNotificationAndSuggestionDatabase_maxNumberOfSuggestions"));

}

uint64_t __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_243(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_243_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)analyze
{
  NSObject *queue;
  _QWORD v3[5];

  queue = self->super._queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke;
  v3[3] = &unk_1E82DAC38;
  v3[4] = self;
  dispatch_sync_notxn_0(queue, v3);
}

void __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Analyzing the db", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("ANALYZE"), 0, 0, &__block_literal_global_248);

  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: Finished analyzing the db", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_247(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_247_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)vacuumDatabase
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
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke;
  v5[3] = &unk_1E82DCCA0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a2;
  dispatch_sync_notxn_0(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2;
  v3[3] = &unk_1E82DCC78;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("VACUUM"), 0, 0, v3);

}

uint64_t __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2(uint64_t a1, void *a2)
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
    __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2_cold_1();

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v8;
}

- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3
{
  void *v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  double v14;
  SEL v15;

  v6 = (void *)objc_opt_new();
  queue = self->super._queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke;
  v12[3] = &unk_1E82DED88;
  v12[4] = self;
  v14 = a3;
  v8 = v6;
  v13 = v8;
  v15 = a2;
  dispatch_sync_notxn_0(queue, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT suggestions.latestOutcome, suggestions.createdTimestamp, suggestions.latestOutcomeTimestamp, suggestions.deliverySuggestion, notifications.bundleId FROM suggestions INNER JOIN notifications ON suggestions.triggerNotificationUUID = notifications.uuid WHERE suggestions.isActive = 0 AND suggestions.latestOutcomeTimestamp > :previouslyLoggedOutcomeTimestamp ORDER BY suggestions.latestOutcomeTimestamp ASC "), v7, v5, v4);

}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":previouslyLoggedOutcomeTimestamp", *(double *)(a1 + 32));
}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 *v18;

  v3 = a2;
  objc_msgSend(v3, "getDoubleForColumnAlias:", "latestOutcomeTimestamp");
  v5 = v4;
  objc_msgSend(v3, "getDoubleForColumnAlias:", "createdTimestamp");
  v7 = v6;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getIntegerForColumnAlias:", "latestOutcome");
  objc_msgSend(v3, "getNSDataForColumnAlias:", "deliverySuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8F90]), "initWithProtoData:", v9);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setBundleId:", v8);
  objc_msgSend(v11, "setTimeToOutcome:", v5 - v7);
  objc_msgSend(v11, "setTargetMode:", 0);
  objc_msgSend(v11, "setIsAddToMode:", 0);
  objc_msgSend(v10, "subObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "subObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsAddToMode:", objc_msgSend(v14, "tuningSuggestionType") == 1);

  }
  objc_msgSend(v10, "subtype");
  ATXSuggestionTypeToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuggestionType:", v15);

  objc_msgSend(v10, "scope");
  ATXNotificationSuggestionScopeToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuggestionScope:", v16);

  ATXNotificationSuggestionEventTypeToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuggestionOutcome:", v17);

  objc_msgSend(v11, "setSuggestionCompletionTimestamp:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  v18 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v18;
}

uint64_t __86__ATXNotificationAndSuggestionDatabase_metricsForSuggestionsSinceCompletionTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (ATXNotificationAndSuggestionDatastorePerfMetrics)notificationAndSuggestionDatastorePerfMetrics
{
  NSObject *queue;
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  ATXNotificationAndSuggestionDatastorePerfMetrics result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v13 = 0;
  v11 = &unk_1C9F35407;
  v12 = 0;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__ATXNotificationAndSuggestionDatabase_notificationAndSuggestionDatastorePerfMetrics__block_invoke;
  v7[3] = &unk_1E82DC528;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync_notxn_0(queue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

void __85__ATXNotificationAndSuggestionDatabase_notificationAndSuggestionDatastorePerfMetrics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "atx_countRowsOfTable:returnValueOnError:", CFSTR("notifications"), -1);
  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "atx_countRowsOfTable:returnValueOnError:", CFSTR("suggestions"), -1);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = v2;
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)feedbackHistoriesForKeys:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = v5;
  v8 = v7;

  queue = self->super._queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke;
  v15[3] = &unk_1E82DEC98;
  v15[4] = self;
  v16 = v8;
  v10 = v6;
  v17 = v10;
  v18 = a2;
  v11 = v8;
  dispatch_sync_notxn_0(queue, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_2;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_3;
  v5[3] = &unk_1E82DEC70;
  v6 = *(id *)(a1 + 48);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT     feedbackKey,     latestOutcome,     createdTimestamp FROM suggestions WHERE     feedbackKey IN _pas_nsarray(:feedbackKeyArray) AND     isActive = 0 ORDER BY     feedbackKey DESC,     createdTimestamp DESC "), v7, v5, v4);

}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":feedbackKeyArray", *(_QWORD *)(a1 + 32));
}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  ATXNotificationSuggestionFeedbackHistoryQueryResult *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 *v14;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "feedbackKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumnAlias:", "latestOutcome");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "getDoubleForColumnAlias:", "createdTimestamp");
  v8 = v7;

  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXNotificationSuggestionFeedbackHistoryQueryResult initWithFeedbackKey:latestOutcome:createdTimestamp:]([ATXNotificationSuggestionFeedbackHistoryQueryResult alloc], "initWithFeedbackKey:latestOutcome:createdTimestamp:", v4, v5, v9);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v10);

  v14 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v14;
}

uint64_t __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)_makeNotificationTelemetryQueryResultFromDatabaseResult:(id)a3
{
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  ATXUserNotificationResolution *v26;
  void *v27;
  ATXUserNotificationResolution *v28;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
  objc_msgSend(v4, "setNotificationUUID:", v7);

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "getDoubleForColumnAlias:", "receiveTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReceiveTimestamp:", v9);

  objc_msgSend(v4, "setDeliveryMethod:", objc_msgSend(v3, "getIntegerForColumnAlias:", "deliveryMethod"));
  objc_msgSend(v4, "setUrgency:", objc_msgSend(v3, "getIntegerForColumnAlias:", "urgency"));
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleId:", v10);

  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsMessage:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v3, "getIntegerForColumnAlias:", "deliveryReason");
  ATXUserNotificationDeliveryReasonToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationReason:", v12);

  objc_msgSend(v3, "getIntegerForColumnAlias:", "firstUI");
  ATXNotificationDeliveryUIToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalDestination:", v13);

  objc_msgSend(v3, "getIntegerForColumnAlias:", "mostRecentUI");
  ATXNotificationDeliveryUIToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFinalDestination:", v14);

  objc_msgSend(v3, "getNSStringForColumnAlias:", "receivedMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReceiveModeIdentifier:", v15);

  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "getDoubleForColumnAlias:", "latestOutcomeTimestamp");
  objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "getInt64ForColumnAlias:", "numExpansions");
  v19 = objc_msgSend(v3, "getIntegerForColumnAlias:", "latestOutcome");
  objc_msgSend(v4, "setBodyLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationBodyLength"));
  objc_msgSend(v4, "setTitleLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationTitleLength"));
  objc_msgSend(v4, "setSubtitleLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "notificationSubtitleLength"));
  objc_msgSend(v4, "setSummaryLength:", objc_msgSend(v3, "getIntegerForColumnAlias:", "summaryLength"));
  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isSummarized");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSummarized:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isPartOfStack");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPartOfStack:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isStackSummary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsStackSummary:", objc_msgSend(v22, "BOOLValue"));

  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isDeliveredInPrioritySection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDeliveredInPrioritySection:", objc_msgSend(v23, "BOOLValue"));

  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "isDeterminedUrgentByModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsDeterminedUrgentByModel:", objc_msgSend(v24, "BOOLValue"));
  v25 = ATXUserNotificationResolutionTypeForNotificationEventType(v19);
  v26 = [ATXUserNotificationResolution alloc];
  objc_msgSend(v4, "notificationUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[ATXUserNotificationResolution initWithNotificationUUID:numExpansions:resolutionType:resolutionTimestamp:](v26, "initWithNotificationUUID:numExpansions:resolutionType:resolutionTimestamp:", v27, v18, v25, v17);

  objc_msgSend(v4, "setResolution:", v28);
  return v4;
}

- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4
{
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  double v16;
  double v17;
  SEL v18;

  v8 = (void *)objc_opt_new();
  queue = self->super._queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke;
  v14[3] = &unk_1E82DF068;
  v14[4] = self;
  v16 = a3;
  v17 = a4;
  v10 = v8;
  v15 = v10;
  v18 = a2;
  dispatch_sync_notxn_0(queue, v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_2;
  v10[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v11 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_3;
  v7[3] = &unk_1E82DF040;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4;
  v6[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v6[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT     uuid,     receiveTimestamp,     deliveryMethod,     urgency,     bundleId,     isMessage,     deliveryReason,     firstUI,     mostRecentUI,     receivedMode,     latestOutcome,     latestOutcomeTimestamp,     numExpansions,     notificationBodyLength,     notificationTitleLength,     notificationSubtitleLength,     summaryLength,     isSummarized,     isPartOfStack,     isStackSummary,     isDeliveredInPrioritySection,     isDeterminedUrgentByModel FROM notifications WHERE     receiveTimestamp > :startTimestamp AND     receiveTimestamp < :endTimestamp "), v10, v7, v6);

}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":startTimestamp", v3);
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":endTimestamp", *(double *)(a1 + 40));

}

uint64_t __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_makeNotificationTelemetryQueryResultFromDatabaseResult:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  double v20;
  SEL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__29;
  v26 = __Block_byref_object_dispose__29;
  v27 = 0;
  queue = self->super._queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke;
  v16[3] = &unk_1E82DF0B8;
  v16[4] = self;
  v17 = v9;
  v20 = a5;
  v18 = v10;
  v19 = &v22;
  v21 = a2;
  v12 = v10;
  v13 = v9;
  dispatch_sync_notxn_0(queue, v16);
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[6];
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_2;
  v7[3] = &unk_1E82DEE00;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_3;
  v6[3] = &unk_1E82DF090;
  v4 = *(_QWORD *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_4;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  v5[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT     uuid,     receiveTimestamp,     deliveryMethod,     urgency,     bundleId,     isMessage,     deliveryReason,     firstUI,     mostRecentUI,     receivedMode,     latestOutcome,     latestOutcomeTimestamp,     numExpansions,     notificationBodyLength,     notificationTitleLength,     notificationSubtitleLength,     summaryLength,     isSummarized,     isPartOfStack,     isStackSummary,     isDeliveredInPrioritySection,     isDeterminedUrgentByModel FROM notifications WHERE     bundleId = :bundleId AND     notificationId = :notificationId AND     recordTimestamp = :recordTimestamp ORDER BY recordTimestamp DESC LIMIT 1 "), v7, v6, v5);

}

void __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":notificationId", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":recordTimestamp", *(double *)(a1 + 48));

}

uint64_t __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_makeNotificationTelemetryQueryResultFromDatabaseResult:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __112__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationWithBundleId_notificationId_recordTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetConstants, 0);
}

void __59__ATXNotificationAndSuggestionDatabase__runMigrationSteps___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, a3, (uint64_t)a3, "Error running migration query: %@ %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __64__ATXNotificationAndSuggestionDatabase_getBookmarkDataFromName___block_invoke_4_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching Biome bookmark %@ from table: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __64__ATXNotificationAndSuggestionDatabase_setBookmarkData_forName___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error updating bookmark %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __113__ATXNotificationAndSuggestionDatabase_insertNotificationFromEvent_deliveryMethod_modeIdentifier_deliveryReason___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error inserting notification event %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __68__ATXNotificationAndSuggestionDatabase_updateNotificationFromEvent___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error updating notification event %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __84__ATXNotificationAndSuggestionDatabase_updateNotificationUIForNotifications_nextUI___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error updating notification UIs: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __57__ATXNotificationAndSuggestionDatabase_insertSuggestion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error inserting suggestion %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __66__ATXNotificationAndSuggestionDatabase_updateSuggestionFromEvent___block_invoke_3_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9_1(a1, a2), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error updating suggestion from event %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __110__ATXNotificationAndSuggestionDatabase_hasSuggestionBeenShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15(&dword_1C9A3B000, v2, v3, "Error fetching suggestions for entity %@ in %@. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_16();
}

void __112__ATXNotificationAndSuggestionDatabase_suggestionEventTypeShownForEntityId_suggestionType_scope_sinceTimestamp___block_invoke_4_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15(&dword_1C9A3B000, v2, v3, "Error fetching event type for entity %@ in %@. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_16();
}

void __116__ATXNotificationAndSuggestionDatabase_engagementStatusOfActiveAndProminentNotificationsWithUrgency_sinceTimestamp___block_invoke_4_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching notifications in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __89__ATXNotificationAndSuggestionDatabase_numberOfActiveNotificationsWithCompletionHandler___block_invoke_3_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_12(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching active notifications in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __83__ATXNotificationAndSuggestionDatabase_setAllNotificationsToClearedExceptProminent__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error updating notification while clearing all except prominent. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __69__ATXNotificationAndSuggestionDatabase_setAllNotificationsToModified__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error updating notification while clearing all. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__ATXNotificationAndSuggestionDatabase_currentActiveSuggestions__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "Unable to load delieverySuggestion from the DB in %s. Skipping the suggestion.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __85__ATXNotificationAndSuggestionDatabase_getTopOfProminentStackNotificationsWithLimit___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0();
  v2 = (const char *)OUTLINED_FUNCTION_7_0(v1);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v4, "Error fetching notifications in %@. Error: %@", v5);

  OUTLINED_FUNCTION_1_1();
}

void __68__ATXNotificationAndSuggestionDatabase_resolutionsForNotifications___block_invoke_5_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching notification resolutions in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __88__ATXNotificationAndSuggestionDatabase__countNotificationsPerAppWithFilters_stmtBinder___block_invoke_4_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching notification counts by bundle ID in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __75__ATXNotificationAndSuggestionDatabase_receiveTimeStampOfFirstNotification__block_invoke_3_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching receive time stamp of first notification %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_3_cold_1()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[ATXNotificationAndSuggestionDatabase allNotificationsFromBundleId:sinceTimestamp:]_block_invoke_3";
  OUTLINED_FUNCTION_3_8();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "%s: Unable to build NSUUID from string uuid %@ fetched from database. Continuing anyway", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __84__ATXNotificationAndSuggestionDatabase_allNotificationsFromBundleId_sinceTimestamp___block_invoke_197_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(&dword_1C9A3B000, v0, v1, "%s: Error fetching notifications for bundleId: %@. Error: %@", v2);
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Failed to fetch one of the bundleIds from the db. Continuing anyway", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __79__ATXNotificationAndSuggestionDatabase_allBundleIdsOfNotificationsOnLockscreen__block_invoke_205_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase allBundleIdsOfNotificationsOnLockscreen]_block_invoke";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error fetching bundleIds. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_2_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_12(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error deleting suggestions in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_207_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_12(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error deleting notifications in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __53__ATXNotificationAndSuggestionDatabase_deleteAllData__block_invoke_208_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_12(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error deleting bookmarks in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __74__ATXNotificationAndSuggestionDatabase_pruneNotificationsBeforeTimestamp___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0();
  v2 = (const char *)OUTLINED_FUNCTION_12(v1);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v4, "Error deleting notifications in %@. Error: %@", v5);

  OUTLINED_FUNCTION_1_1();
}

void __72__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBeforeTimestamp___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0();
  v2 = (const char *)OUTLINED_FUNCTION_12(v1);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v4, "Error deleting suggestions in %@. Error: %@", v5);

  OUTLINED_FUNCTION_1_1();
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_10(&dword_1C9A3B000, v0, v1, "%s: Processing bundleIds in order: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Failed to fetch bundleIds. See logs above. Exiting early.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error fetching bundleIds from db. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __91__ATXNotificationAndSuggestionDatabase_pruneNotificationsBasedOnHardLimitsWithXPCActivity___block_invoke_2_221_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error running deletion across all apps. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)prepAndRunQuery:(os_log_t)log batchSize:XPCActivity:onPrep:onRow:onError:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXNotificationAndSuggestionDatabase prepAndRunQuery:batchSize:XPCActivity:onPrep:onRow:onError:]";
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "%s: Finished batched deletion", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)prepAndRunQuery:(uint64_t)a3 batchSize:(uint64_t)a4 XPCActivity:(uint64_t)a5 onPrep:(uint64_t)a6 onRow:(uint64_t)a7 onError:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_1C9A3B000, a2, a3, "%s: Starting batched deletion, batchSize: %ld", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_10(&dword_1C9A3B000, v0, v1, "%s: Finished deletion for bundleId %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pruneNotificationsBasedOnHardLimitsForBundleId:XPCActivity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_10(&dword_1C9A3B000, v0, v1, "%s: Deleting rows from notifications table for bundleId %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __100__ATXNotificationAndSuggestionDatabase__pruneNotificationsBasedOnHardLimitsForBundleId_XPCActivity___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(&dword_1C9A3B000, v0, v1, "%s: Error deleting entries from notifications table for bundleId: %@. Error: %@", v2);
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error deleting suggestions with Created latestOutcome from the suggestions table. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_237_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error deleting suggestions with CouldNotShow latestOutcome from the suggestions table. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __89__ATXNotificationAndSuggestionDatabase_pruneSuggestionsBasedOnHardLimitsWithXPCActivity___block_invoke_2_243_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:]_block_invoke_2";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error deleting entries from suggestions table. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __47__ATXNotificationAndSuggestionDatabase_analyze__block_invoke_247_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXNotificationAndSuggestionDatabase analyze]_block_invoke";
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: Error analyzing database. Error: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __54__ATXNotificationAndSuggestionDatabase_vacuumDatabase__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0();
  v2 = (const char *)OUTLINED_FUNCTION_12(v1);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v4, "Error vacuuming database in %@. Error: %@", v5);

  OUTLINED_FUNCTION_1_1();
}

void __65__ATXNotificationAndSuggestionDatabase_feedbackHistoriesForKeys___block_invoke_4_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching suggestion feedback in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __96__ATXNotificationAndSuggestionDatabase_telemetryDataForNotificationsFromTimestamp_endTimestamp___block_invoke_4_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (const char *)OUTLINED_FUNCTION_7_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "Error fetching telemetry data in %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
