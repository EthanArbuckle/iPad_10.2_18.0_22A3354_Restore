@implementation EDConversationPersistence

+ (int64_t)conversationNotificationLevelForConversationFlags:(unint64_t)a3
{
  if ((a3 & 4) != 0)
    return 1;
  else
    return 2 * (a3 & 1);
}

- (BOOL)hasSubscribedConversations
{
  void *v2;
  char v3;

  -[EDConversationPersistence conversationManager](self, "conversationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSubscribedConversations");

  return v3;
}

- (EDUbiquitousConversationManager)conversationManager
{
  return self->_conversationManager;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "conversationsTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conversationIDMessageIDTableSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columnForName:", CFSTR("conversation_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 2);

  v10 = (void *)MEMORY[0x1E0C9AA60];
  *a3 = (id)MEMORY[0x1E0C9AA60];
  *a4 = v10;
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (EFSQLTableSchema)conversationsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("flags"), 0, &unk_1E94E46D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("sync_key"), 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("conversations"), 2, CFSTR("conversation_id"), v5);

  objc_msgSend(v6, "addIndexForColumns:", &unk_1E94E54A0);
  return (EFSQLTableSchema *)v6;
}

+ (EFSQLTableSchema)conversationIDMessageIDTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("conversation_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("message_id"), 0, &unk_1E94E46D0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("date_sent"), 0, &unk_1E94E46D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("conversation_id_message_id"), v6, &unk_1E94E54B8);

  objc_msgSend(v7, "addIndexForColumns:", &unk_1E94E54D0);
  return (EFSQLTableSchema *)v7;
}

+ (NSString)conversationsTableName
{
  return (NSString *)CFSTR("conversations");
}

- (EDConversationPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v6;
  id v7;
  EDConversationPersistence *v8;
  EDConversationPersistence *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notificationQueue;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EDConversationPersistence;
  v8 = -[EDConversationPersistence init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_database, v6);
    objc_storeStrong((id *)&v9->_hookRegistry, a4);
    v10 = dispatch_queue_create("com.apple.email.ConversationPersistenceNotification", MEMORY[0x1E0C80D50]);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v10;

  }
  return v9;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EDConversationPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1)
    dispatch_once(&log_onceToken_24, block);
  return (id)log_log_24;
}

void __32__EDConversationPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;

}

+ (unint64_t)conversationFlagsForConversationNotificationLevel:(int64_t)a3
{
  if (a3 == 1)
    return 4;
  else
    return a3 == 2;
}

- (void)initializeConversationManagerAndPerformInitialSync
{
  EDUbiquitousConversationManager *v3;
  EDUbiquitousConversationManager *conversationManager;
  id v5;
  id v6;

  v3 = -[EDUbiquitousConversationManager initWithDelegate:]([EDUbiquitousConversationManager alloc], "initWithDelegate:", self);
  conversationManager = self->_conversationManager;
  self->_conversationManager = v3;

  +[EDConversationDailyCloudExportActivityManager scheduleWithConversationExportDelegate:conversationManager:](EDConversationDailyCloudExportActivityManager, "scheduleWithConversationExportDelegate:conversationManager:", self, self->_conversationManager);
  +[EDConversationPruningActivityManager scheduleWithConversationManager:](EDConversationPruningActivityManager, "scheduleWithConversationManager:", self->_conversationManager);
  -[EDConversationPersistence conversationManager](self, "conversationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performInitialSync");

  -[EDConversationPersistence hookRegistry](self, "hookRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceDidInitializeConversationSubscriptionProvider");

}

- (id)syncedConversationIDsBySyncKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDConversationPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence syncedConversationIDsBySyncKey]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke;
  v8[3] = &unk_1E949B7F0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

uint64_t __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT conversation_id, sync_key FROM conversations WHERE sync_key NOT NULL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke_2;
  v8[3] = &unk_1E949AF78;
  v9 = *(id *)(a1 + 32);
  v7 = 0;
  objc_msgSend(v4, "executeUsingBlock:error:", v8, &v7);
  v5 = v7;
  objc_msgSend(v3, "handleError:message:", v5, CFSTR("Selecting synced conversations"));

  return 1;
}

void __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("conversation_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sync_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v6);

}

- (id)messageIDsForConversationID:(int64_t)a3 limit:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDConversationPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence messageIDsForConversationID:limit:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke;
  v11[3] = &unk_1E949BEC8;
  v11[5] = a3;
  v11[6] = a4;
  v11[4] = &v12;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12[0] = CFSTR(":conversation_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR(":limit");
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT message_id FROM conversation_id_message_id WHERE conversation_id = :conversation_id ORDER BY date_sent DESC LIMIT :limit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke_2;
  v11[3] = &unk_1E949B090;
  v11[4] = a1[4];
  objc_msgSend(v7, "executeWithNamedBindings:usingBlock:error:", v6, v11, &v10);
  v8 = v10;
  objc_msgSend(v3, "handleError:message:", v8, CFSTR("Selecting message IDs for conversation ID"));

  return 1;
}

void __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
}

- (int64_t)conversationIDForMessageIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
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
  -[EDConversationPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence conversationIDForMessageIDs:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke;
  v10[3] = &unk_1E949AFC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __int128 v11;
  id v12;
  _QWORD v13[4];
  __int128 v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE message_id IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2;
  v13[3] = &unk_1E949ADD0;
  v11 = *(_OWORD *)(a1 + 32);
  v8 = (id)v11;
  v14 = v11;
  v12 = 0;
  objc_msgSend(v7, "executeUsingBlock:error:", v13, &v12);
  v9 = v12;
  objc_msgSend(v3, "handleError:message:", v9, CFSTR("Selecting conversation ID for message IDs"));

  return 1;
}

void __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v6 = a2;
  v7 = v6;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= *MEMORY[0x1E0D1DC08])
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conversation_id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "databaseIDValue");

  }
  else
  {
    +[EDConversationPersistence log](EDConversationPersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2_cold_1(a1, v8, v9);

    *a4 = 1;
  }

}

- (unint64_t)persistenceConversationFlagsForConversationID:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EDConversationPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence persistenceConversationFlagsForConversationID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke;
  v8[3] = &unk_1E949B778;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  _QWORD v10[5];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT flags FROM conversations WHERE conversations.conversation_id = :conversation_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR(":conversation_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v6, v10, &v9);
  v7 = v9;

  objc_msgSend(v3, "handleError:message:", v7, CFSTR("Selecting flags for conversation ID"));
  return 1;
}

void __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "unsignedIntegerValue");

}

- (int64_t)createConversationWithFlags:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EDConversationPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence createConversationWithFlags:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__EDConversationPersistence_createConversationWithFlags___block_invoke;
  v8[3] = &unk_1E949B778;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __57__EDConversationPersistence_createConversationWithFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO conversations (flags) values (:flags)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR(":flags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v6, 0, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Creating conversation."));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "lastInsertedDatabaseID");

  return v7;
}

- (void)markConversationWithIDs:(id)a3 mute:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = 4;
  else
    v5 = 0;
  -[EDConversationPersistence setPersistenceConversationFlags:forConversationIDs:reason:](self, "setPersistenceConversationFlags:forConversationIDs:reason:", v5, a3, 4);
}

- (void)markConversationWithIDs:(id)a3 notify:(BOOL)a4
{
  -[EDConversationPersistence setPersistenceConversationFlags:forConversationIDs:reason:](self, "setPersistenceConversationFlags:forConversationIDs:reason:", a4, a3, 4);
}

- (void)setPersistenceConversationFlags:(unint64_t)a3 forConversationIDs:(id)a4 reason:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v16;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "longLongValue");
        -[EDConversationPersistence conversationManager](self, "conversationManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "syncKeyForUpdatedConversation:flags:", v12, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, v14);
        if (!a3)
        {

          v14 = 0;
        }
        -[EDConversationPersistence setPersistenceConversationFlags:syncKey:forConversationID:reason:](self, "setPersistenceConversationFlags:syncKey:forConversationID:reason:", a3, v14, v12, a5);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  -[EDConversationPersistence conversationManager](self, "conversationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFlags:forConversations:", a3, v18);

}

- (void)setPersistenceConversationFlags:(unint64_t)a3 syncKey:(id)a4 forConversationID:(int64_t)a5 reason:(int64_t)a6
{
  id v10;
  EDPersistenceDatabaseGenerationWindow *v11;
  void *v12;
  void *v13;
  EDPersistenceDatabaseGenerationWindow *v14;
  NSObject *v15;
  _QWORD v16[4];
  EDPersistenceDatabaseGenerationWindow *v17;
  id v18;
  _BYTE *v19;
  int64_t v20;
  unint64_t v21;
  _BYTE buf[24];
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (!a5 || *MEMORY[0x1E0D1DC08] == a5)
  {
    +[EDConversationPersistence log](EDConversationPersistence, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2114;
      v23 = v10;
      v24 = 2048;
      v25 = a6;
      _os_log_fault_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_FAULT, "Invalid conversation ID (%lld) when setting conversation flags (%llu) for sync key \"%{public}@\" with reason: %lld", buf, 0x2Au);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v23 = 0;
    v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDConversationPersistence database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence setPersistenceConversationFlags:syncKey:forConversationID:reason:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke;
    v16[3] = &unk_1E949BEF0;
    v14 = v11;
    v17 = v14;
    v19 = buf;
    v20 = a5;
    v21 = a3;
    v18 = v10;
    objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v16);

    -[EDConversationPersistence _notifyOfFlagChangeForConversationID:oldFlags:newFlags:reason:generationWindow:](self, "_notifyOfFlagChangeForConversationID:oldFlags:newFlags:reason:generationWindow:", a5, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), a3, a6, v14);
    _Block_object_dispose(buf, 8);
  }

}

uint64_t __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v16;
  id v17;
  _QWORD v18[5];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT flags FROM conversations WHERE conversation_id = :conversation_id LIMIT 1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR(":conversation_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke_2;
  v18[3] = &unk_1E949B090;
  v18[4] = *(_QWORD *)(a1 + 48);
  v7 = objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v6, v18, &v17);
  v8 = v17;

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE conversations SET flags = :flags, sync_key = :sync_key WHERE conversation_id = :conversation_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR(":flags"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR(":sync_key"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR(":conversation_id"));

    v16 = v8;
    v13 = objc_msgSend(v9, "executeWithNamedBindings:usingBlock:error:", v10, 0, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v14, CFSTR("Setting conversation flags"));

    v8 = v14;
  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Finding old conversation flags"));
    v13 = 0;
  }

  return v13;
}

void __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "unsignedLongLongValue");

}

- (void)updateAssociationTableForMessagePersistentIDs:(id)a3 conversationID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  EDConversationPersistence *v12;
  int64_t v13;

  v6 = a3;
  -[EDConversationPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence updateAssociationTableForMessagePersistentIDs:conversationID:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke;
  v10[3] = &unk_1E949AF28;
  v9 = v6;
  v11 = v9;
  v12 = self;
  v13 = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);

}

uint64_t __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;
  _QWORD v12[6];

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT message_id, date_sent from messages where ROWID IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke_2;
  v12[3] = &unk_1E949BF18;
  v8 = *(_QWORD *)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v12[5] = v8;
  objc_msgSend(v7, "executeUsingBlock:error:", v12, &v11);
  v9 = v11;
  objc_msgSend(v3, "handleError:message:", v9, CFSTR("Selecting message IDs to update conversation association table."));

  return 1;
}

void __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("date_sent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "updateAssociationTableForMessageID:dateSent:conversationID:", v7, v9, *(_QWORD *)(a1 + 40));

  }
}

- (void)updateAssociationTableForMessageIDs:(id)a3 conversationID:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[EDConversationPersistence updateAssociationTableForMessageID:dateSent:conversationID:](self, "updateAssociationTableForMessageID:dateSent:conversationID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, a4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)updateAssociationTableForMessageID:(id)a3 dateSent:(id)a4 conversationID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  -[EDConversationPersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence updateAssociationTableForMessageID:dateSent:conversationID:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke;
  v14[3] = &unk_1E949AF28;
  v17 = a5;
  v13 = v8;
  v15 = v13;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

}

uint64_t __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT conversation_id FROM conversations where conversation_id = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_2;
  v19[3] = &unk_1E949B090;
  v19[4] = &v20;
  v8 = objc_msgSend(v7, "executeUsingBlock:error:", v19, &v18);
  v9 = v18;
  if ((v8 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Executing querying for conversation id"));
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO conversation_id_message_id (conversation_id, message_id, date_sent) VALUES (:conversation_id, :message_id, :date_sent)"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a1[4], CFSTR(":message_id"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR(":conversation_id"));

    objc_msgSend(v11, "setObject:forKeyedSubscript:", a1[5], CFSTR(":date_sent"));
    v17 = v9;
    v13 = -[NSObject executeWithNamedBindings:usingBlock:error:](v10, "executeWithNamedBindings:usingBlock:error:", v11, 0, &v17);
    v14 = v17;

    if ((v13 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v14, CFSTR("Setting conversation association table entries"));

  }
  else
  {
    +[EDConversationPersistence log](EDConversationPersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_cold_1(v15, (uint64_t)v24, v10);
    }
    v13 = 1;
    v14 = v9;
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (void)updateConversationNotificationLevel:(int64_t)a3 forConversationIDs:(id)a4
{
  id v6;

  v6 = a4;
  -[EDConversationPersistence setPersistenceConversationFlags:forConversationIDs:reason:](self, "setPersistenceConversationFlags:forConversationIDs:reason:", +[EDConversationPersistence conversationFlagsForConversationNotificationLevel:](EDConversationPersistence, "conversationFlagsForConversationNotificationLevel:", a3), v6, 4);

}

- (void)pruneConversationTables:(double)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  -[EDConversationPersistence database](self, "database");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence pruneConversationTables:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EDConversationPersistence_pruneConversationTables___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  *(double *)&v6[4] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v4, v6);

}

uint64_t __53__EDConversationPersistence_pruneConversationTables___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM conversations WHERE conversation_id NOT IN (SELECT DISTINCT conversation_id from messages) AND (sync_key IS NULL AND conversation_id NOT IN (SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE date_sent > :older_than));"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR(":older_than");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v6, 0, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Pruning conversations table"));

  return v7;
}

- (void)clearConversationFlagsAndSyncKeyForConversationIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  EDPersistenceDatabaseGenerationWindow *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  EDPersistenceDatabaseGenerationWindow *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  EDPersistenceDatabaseGenerationWindow *v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDConversationPersistence database](self, "database", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence clearConversationFlagsAndSyncKeyForConversationIDs:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__EDConversationPersistence_clearConversationFlagsAndSyncKeyForConversationIDs___block_invoke;
  v23[3] = &unk_1E949AFA0;
  v7 = v4;
  v24 = v7;
  v8 = v18;
  v25 = v8;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v23);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    v12 = *MEMORY[0x1E0D1DC08];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "longLongValue");
        v15 = v14;
        if (v14)
          v16 = v14 == v12;
        else
          v16 = 1;
        if (v16)
        {
          +[EDConversationPersistence log](EDConversationPersistence, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v27 = v15;
            _os_log_fault_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_FAULT, "Invalid conversation ID (%lld) when clearing conversation flags", buf, 0xCu);
          }

        }
        else
        {
          -[EDConversationPersistence _notifyOfFlagChangeForConversationID:oldFlags:newFlags:reason:generationWindow:](self, "_notifyOfFlagChangeForConversationID:oldFlags:newFlags:reason:generationWindow:", v14, 0, 0, 0, v8);
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v10);
  }

}

uint64_t __80__EDConversationPersistence_clearConversationFlagsAndSyncKeyForConversationIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("UPDATE conversation SET flags = :flags, sync_key = NULL WHERE conversation_id IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  v11 = 0;
  v8 = objc_msgSend(v7, "executeWithNamedBindings:usingBlock:error:", &unk_1E94E56C8, 0, &v11);
  v9 = v11;
  if ((v8 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Pruning conversations table"));

  return v8;
}

- (void)_notifyOfFlagChangeForConversationID:(int64_t)a3 oldFlags:(unint64_t)a4 newFlags:(unint64_t)a5 reason:(int64_t)a6 generationWindow:(id)a7
{
  int64_t v12;
  void *v13;
  id v14;

  v14 = a7;
  v12 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", a5);
  -[EDConversationPersistence hookRegistry](self, "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceDidChangeConversationNotificationLevel:conversationID:generationWindow:", v12, a3, v14);

  -[EDConversationPersistence _postChangeNotificationForConversationID:flags:oldFlags:reason:](self, "_postChangeNotificationForConversationID:flags:oldFlags:reason:", a3, a5, a4, a6);
}

- (void)_postChangeNotificationForConversationID:(int64_t)a3 flags:(unint64_t)a4 oldFlags:(unint64_t)a5 reason:(int64_t)a6
{
  NSObject *notificationQueue;
  _QWORD block[9];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__EDConversationPersistence__postChangeNotificationForConversationID_flags_oldFlags_reason___block_invoke;
  block[3] = &unk_1E949BF40;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(notificationQueue, block);
}

void __92__EDConversationPersistence__postChangeNotificationForConversationID_flags_oldFlags_reason___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("MessageConversationIsVIP");
  v2 = a1 + 5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[5] & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("MessageConversationIsMuted");
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*v2 >> 2) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = EDConversationFlagsChanged;
  v8 = a1[4];
  v14[0] = CFSTR("EDConversationFlagsChangedConversationIDKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v5;
  v14[1] = CFSTR("EDConversationFlagsChangesKey");
  v14[2] = CFSTR("EDConversationFlagsKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  v14[3] = CFSTR("EDConversationFlagsOldFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  v14[4] = CFSTR("EDConversationFlagsReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, v8, v13);

}

- (int64_t)previousSyncAnchorForDailyExport
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = *MEMORY[0x1E0D1DC08];
  -[EDConversationPersistence database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence previousSyncAnchorForDailyExport]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke;
  v6[3] = &unk_1E949BF68;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT value FROM properties WHERE key = '%@'"), CFSTR("SyncAnchorForLastDailyConversationExport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke_2;
  v9[3] = &unk_1E949B090;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "executeUsingBlock:error:", v9, &v8);
  v6 = v8;
  objc_msgSend(v3, "handleError:message:", v6, CFSTR("Selecting previous conversation daily export sync anchor"));

  return 1;
}

void __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (int64_t)currentSyncAnchorForDailyExport
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = *MEMORY[0x1E0D1DC08];
  -[EDConversationPersistence database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence currentSyncAnchorForDailyExport]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke;
  v6[3] = &unk_1E949BF68;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v7;
  _QWORD v8[5];

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT max(ROWID) as syncAnchor from messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke_2;
  v8[3] = &unk_1E949B090;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "executeUsingBlock:error:", v8, &v7);
  v5 = v7;
  objc_msgSend(v3, "handleError:message:", v5, CFSTR("Selecting current conversation sync anchor for daily export"));

  return 1;
}

void __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (void)setNewPreviousSyncAnchorForDailyExport:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  -[EDConversationPersistence database](self, "database");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence setNewPreviousSyncAnchorForDailyExport:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__EDConversationPersistence_setNewPreviousSyncAnchorForDailyExport___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v6[4] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v4, v6);

}

uint64_t __68__EDConversationPersistence_setNewPreviousSyncAnchorForDailyExport___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("SyncAnchorForLastDailyConversationExport"), CFSTR(":key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR(":value"));

  v10 = 0;
  v7 = objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v5, 0, &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Updating previous conversation sync anchor for daily export"));

  return v7;
}

- (id)flaggedConversationsChangedBetweenStartAnchor:(int64_t)a3 endAnchor:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDConversationPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDConversationPersistence flaggedConversationsChangedBetweenStartAnchor:endAnchor:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke;
  v11[3] = &unk_1E949BEC8;
  v11[5] = a3;
  v11[6] = a4;
  v11[4] = &v12;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[5];

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT DISTINCT conversations.conversation_id AS conversation_id FROM conversations LEFT JOIN messages on messages.conversation_id = conversations.conversation_id WHERE messages.ROWID > :start AND messages.ROWID < :end AND conversations.flags != 0;"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR(":start"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR(":end"));

  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke_2;
  v11[3] = &unk_1E949B090;
  v11[4] = a1[4];
  objc_msgSend(v4, "executeWithNamedBindings:usingBlock:error:", v5, v11, &v10);
  v8 = v10;
  objc_msgSend(v3, "handleError:message:", v8, CFSTR("Selecting current conversation sync anchor for daily export"));

  return 1;
}

void __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conversation_id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (EDPersistenceDatabase)database
{
  return (EDPersistenceDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_destroyWeak((id *)&self->_database);
}

void __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Multiple conversations found for message_ids %@", (uint8_t *)&v4);
}

void __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Attempting to update association table for conversation that does not exist %@", (uint8_t *)a2);

}

@end
