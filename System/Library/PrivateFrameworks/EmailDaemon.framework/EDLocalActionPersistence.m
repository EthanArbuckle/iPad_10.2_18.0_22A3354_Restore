@implementation EDLocalActionPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EDPersistenceForeignKeyPlaceholder *v10;
  EDPersistenceForeignKeyPlaceholder *v11;
  EDPersistenceForeignKeyPlaceholder *v12;
  EDPersistenceForeignKeyPlaceholder *v13;
  EDPersistenceForeignKeyPlaceholder *v14;
  void *v15;
  EDPersistenceForeignKeyPlaceholder *v16;
  EDPersistenceForeignKeyPlaceholder *v17;
  void *v18;
  EDPersistenceForeignKeyPlaceholder *v19;
  EDPersistenceForeignKeyPlaceholder *v20;
  void *v21;
  EDPersistenceForeignKeyPlaceholder *v22;
  void *v23;
  void *v25;
  void *v26;
  EDPersistenceForeignKeyPlaceholder *v27;
  void *v28;
  EDPersistenceForeignKeyPlaceholder *v29;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localMessageActionsTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionMessagesTableSchema");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionLabelsTableSchema");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionFlagsTableSchema");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "columnForName:", CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  objc_msgSend(v35, "columnForName:", CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  objc_msgSend(v32, "columnForName:", CFSTR("action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v5, "columnForName:", CFSTR("mailbox"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v10, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[0] = v29;
  v11 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v5, "columnForName:", CFSTR("source_mailbox"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v11, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[1] = v27;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v5, "columnForName:", CFSTR("destination_mailbox"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v12, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[2] = v13;
  v14 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v33, "columnForName:", CFSTR("message"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v14, "initWithColumn:tableName:onDelete:onUpdate:", v15, v34, 3, 0);
  v37[3] = v16;
  v17 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v33, "columnForName:", CFSTR("destination_message"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v17, "initWithColumn:tableName:onDelete:onUpdate:", v18, v34, 2, 0);
  v37[4] = v19;
  v20 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v35, "columnForName:", CFSTR("label"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v20, "initWithColumn:tableName:onDelete:onUpdate:", v21, v9, 2, 0);
  v37[5] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  *a4 = (id)MEMORY[0x1E0C9AA60];
  v36[0] = v5;
  v36[1] = v33;
  v36[2] = v35;
  v36[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)localMessageActionsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("source_mailbox"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("destination_mailbox"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action_type"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("user_initiated"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("local_message_actions"), 2, v8);

  v10 = *MEMORY[0x1E0D1EE00];
  v13[0] = CFSTR("mailbox");
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v11);

  return v9;
}

+ (id)actionLabelsTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("do_add"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("label"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("action_labels"), 1, v6);

  v12 = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  v11 = CFSTR("label");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return v7;
}

+ (id)actionFlagsTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flag_type"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flag_value"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("action_flags"), 1, v6);

  v10 = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  return v7;
}

+ (id)actionMessagesTableSchema
{
  id v2;
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
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("action_phase"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_id"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("destination_message"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("action_messages"), 1, v8);

  v16 = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v10);

  v15 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v11);

  v14 = CFSTR("destination_message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v12);

  return v9;
}

- (EDLocalActionPersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7;
  id v8;
  EDLocalActionPersistence *v9;
  EDLocalActionPersistence *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDLocalActionPersistence;
  v9 = -[EDLocalActionPersistence init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_gmailLabelPersistence, a4);
  }

  return v10;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDLocalActionPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_39 != -1)
    dispatch_once(&log_onceToken_39, block);
  return (OS_os_log *)(id)log_log_39;
}

void __31__EDLocalActionPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_39;
  log_log_39 = (uint64_t)v1;

}

- (EDLocalActionPersistence)init
{
  -[EDLocalActionPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDLocalActionPersistence init]", "EDLocalActionPersistence.m", 155, "0");
}

- (id)messageActionsForAccountURL:(id)a3 previousActionID:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  EDLocalActionPersistence *v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;

  v20 = a3;
  v19 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[EDLocalActionPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence messageActionsForAccountURL:previousActionID:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke;
  v24[3] = &unk_1E949C7A0;
  v10 = v20;
  v30 = a4;
  v25 = v10;
  v26 = self;
  v11 = v6;
  v27 = v11;
  v12 = v19;
  v28 = v12;
  v13 = v21;
  v29 = v13;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v24);

  if (objc_msgSend(v13, "count"))
  {
    -[EDLocalActionPersistence database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence messageActionsForAccountURL:previousActionID:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_3;
    v22[3] = &unk_1E949B7F0;
    v23 = v13;
    objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v22);

  }
  if (objc_msgSend(v11, "count"))
    -[EDLocalActionPersistence handledFailedCopyForMessages:](self, "handledFailedCopyForMessages:", v11);
  v16 = v29;
  v17 = v12;

  return v17;
}

uint64_t __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "ef_SQLEscapedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("SELECT ROWID, action_type, user_initiated, mailbox, source_mailbox, destination_mailbox FROM local_message_actions WHERE ((mailbox IN (SELECT ROWID FROM mailboxes WHERE url GLOB '%@*')) AND (ROWID > ?)) ORDER BY ROWID"), v5);

  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_2;
  v12[3] = &unk_1E949C778;
  v12[4] = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v13 = v10;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v7, "executeWithIndexedBindings:usingBlock:error:", v9, v12, 0);

  return 1;
}

void __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("action_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  switch(v4)
  {
    case 1:
    case 2:
    case 5:
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "_transferActionForRow:connection:failedMessages:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_flagChangeActionForRow:connection:", v10, *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "_labelChangeActionForRow:connection:", v10, *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "_flagChangeAllActionForRow:connection:", v10, *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 8:
    case 9:
    case 10:
      objc_msgSend(*(id *)(a1 + 32), "_transferUndownloadedActionForRow:connection:", v10, *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      if (!v5)
        goto LABEL_9;
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
      break;
    default:
LABEL_9:
      v7 = *(void **)(a1 + 64);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ROWID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      v6 = 0;
      break;
  }

}

uint64_t __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("DELETE FROM local_message_actions WHERE ROWID IN (%@);"), v5);

  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "executeUsingBlock:error:", 0, &v11);
  v9 = v11;
  if ((v8 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("deleting actions"));

  return 1;
}

- (id)_transferActionForRow:(id)a3 connection:(id)a4 failedMessages:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  SEL v39;
  char v40;
  void *v41;
  id v42;
  _QWORD v44[4];
  id v45;
  EDLocalActionPersistence *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  SEL v54;
  char v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v42 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "databaseIDValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("action_type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "databaseIDValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("source_mailbox"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "databaseIDValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("destination_mailbox"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "databaseIDValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v36 = (void *)objc_opt_new();
  v35 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  objc_msgSend(v42, "preparedStatementForQueryString:", CFSTR("SELECT action_phase, remote_id, message, destination_message FROM action_messages WHERE action = ?"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v19;
  v20 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v15;
  v38 = v11;
  v22 = v9;
  v39 = a2;
  v61[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke;
  v56[3] = &unk_1E949C7F0;
  v56[4] = self;
  v25 = v17;
  v60 = v17;
  v26 = v36;
  v57 = v26;
  v27 = v35;
  v58 = v27;
  v28 = v34;
  v59 = v28;
  objc_msgSend(v41, "executeWithIndexedBindings:usingBlock:error:", v23, v56, 0);

  if (objc_msgSend(v26, "count") || objc_msgSend(v27, "count") || objc_msgSend(v28, "count"))
  {
    -[EDLocalActionPersistence mailboxURLForDatabaseID:](self, "mailboxURLForDatabaseID:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x1E0D1E7C8]);
    v44[0] = v24;
    v44[1] = 3221225472;
    v44[2] = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_2;
    v44[3] = &unk_1E949C818;
    v50 = v22;
    v31 = v29;
    v55 = v40;
    v45 = v31;
    v46 = self;
    v51 = v37;
    v52 = v25;
    v53 = v38;
    v54 = v39;
    v47 = v26;
    v48 = v27;
    v49 = v28;
    v32 = (void *)objc_msgSend(v30, "initWithBuilder:", v44);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action_phase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("remote_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("destination_message"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "databaseIDValue");

  objc_msgSend(*(id *)(a1 + 32), "messageForDatabaseID:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (*(_QWORD *)(a1 + 64) && !v14)
  {
    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_cold_1((uint64_t *)(a1 + 64), v16);

  }
  if (v13 || v5 == 4 && v9)
  {
    v17 = objc_alloc(MEMORY[0x1E0D1E7D0]);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_63;
    v25 = &unk_1E949C7C8;
    v18 = v11;
    v19 = *(_QWORD *)(a1 + 32);
    v26 = v18;
    v27 = v19;
    v28 = v9;
    v29 = v15;
    v20 = (void *)objc_msgSend(v17, "initWithBuilder:", &v22);
    if (v5 != 1)
    {
      if (v5 == 3)
      {
        if (*(_QWORD *)(a1 + 64))
        {
          v21 = (id *)(a1 + 48);
          goto LABEL_19;
        }
      }
      else if (v5 == 4)
      {
        v21 = (id *)(a1 + 56);
LABEL_19:
        objc_msgSend(*v21, "addObject:", v20, v22, v23, v24, v25, v26, v27, v28);
      }

      goto LABEL_21;
    }
    v21 = (id *)(a1 + 40);
    goto LABEL_19;
  }
LABEL_21:

}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "messageForDatabaseID:", objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourceMessage:", v5);

    v3 = v6;
  }
  objc_msgSend(v3, "setSourceRemoteID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setDestinationMessage:", *(_QWORD *)(a1 + 56));

}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E748]), "initWithDatabaseID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v8, "setPersistentID:", v3);

  objc_msgSend(v8, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setUserInitiated:", *(unsigned __int8 *)(a1 + 112));
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v8, "setSourceMailboxURL:", v4);
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v8, "setDestinationMailboxURL:", v5);
  v6 = *(_QWORD *)(a1 + 96) - 1;
  if (v6 < 6 && ((0x33u >> v6) & 1) != 0)
  {
    objc_msgSend(v8, "setTransferType:", qword_1D317A4F0[v6]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 40), CFSTR("EDLocalActionPersistence.m"), 309, CFSTR("Creating a transfer action when we don't have a transfer action type"));

  }
  objc_msgSend(v8, "setItemsToDownload:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setItemsToCopy:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, "setItemsToDelete:", *(_QWORD *)(a1 + 64));

}

- (id)_transferUndownloadedActionForRow:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  _QWORD v29[4];
  id v30;
  EDLocalActionPersistence *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  SEL v37;
  char v38;

  v6 = a3;
  v28 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action_type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source_mailbox"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("destination_mailbox"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v15, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_opt_new();
  -[EDLocalActionPersistence _findMessagesForAction:remoteIDs:messages:connection:](self, "_findMessagesForAction:remoteIDs:messages:connection:", v8, v18, 0, v28);
  if (objc_msgSend(v18, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDLocalActionPersistence.m"), 328, CFSTR("A transfer all action should always have exactly one remote ID associated with it"));

  }
  objc_msgSend(v18, "anyObject", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDLocalActionPersistence mailboxURLForDatabaseID:](self, "mailboxURLForDatabaseID:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("1")) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0D1E7E8]);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__EDLocalActionPersistence__transferUndownloadedActionForRow_connection___block_invoke;
    v29[3] = &unk_1E949C840;
    v33 = v8;
    v38 = v17;
    v30 = v20;
    v31 = self;
    v34 = v14;
    v35 = v26;
    v36 = v10;
    v37 = a2;
    v32 = v19;
    v21 = (void *)objc_msgSend(v22, "initWithBuilder:", v29);

  }
  return v21;
}

void __73__EDLocalActionPersistence__transferUndownloadedActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E748]), "initWithDatabaseID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, "setPersistentID:", v3);

  objc_msgSend(v8, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setUserInitiated:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceMailboxURL:", v4);
  objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDestinationMailboxURL:", v5);
  v6 = *(_QWORD *)(a1 + 80) - 8;
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), CFSTR("EDLocalActionPersistence.m"), 356, CFSTR("Creating a transfer action when we don't have a transfer action type"));

  }
  else
  {
    objc_msgSend(v8, "setTransferType:", qword_1D317A520[v6]);
  }
  objc_msgSend(v8, "setOldestPersistedRemoteID:", *(_QWORD *)(a1 + 48));

}

- (id)_flagChangeActionForRow:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  -[EDLocalActionPersistence _findMessagesForAction:remoteIDs:messages:connection:](self, "_findMessagesForAction:remoteIDs:messages:connection:", v9, v14, v15, v7);
  -[EDLocalActionPersistence _flagChangeForAction:connection:](self, "_flagChangeForAction:connection:", v9, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    -[EDLocalActionPersistence mailboxURLForDatabaseID:](self, "mailboxURLForDatabaseID:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D1E6E8]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__EDLocalActionPersistence__flagChangeActionForRow_connection___block_invoke;
    v22[3] = &unk_1E949C868;
    v27 = v9;
    v19 = v17;
    v23 = v19;
    v28 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v20 = (void *)objc_msgSend(v18, "initWithBuilder:", v22);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __63__EDLocalActionPersistence__flagChangeActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E748]), "initWithDatabaseID:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setPersistentID:", v3);

  objc_msgSend(v4, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setUserInitiated:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v4, "setRemoteIDs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setMessages:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setFlagChange:", *(_QWORD *)(a1 + 56));

}

- (id)_flagChangeAllActionForRow:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  -[EDLocalActionPersistence _findMessagesForAction:remoteIDs:messages:connection:](self, "_findMessagesForAction:remoteIDs:messages:connection:", v9, v14, v15, v7);
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDLocalActionPersistence _flagChangeForAction:connection:](self, "_flagChangeForAction:connection:", v9, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDLocalActionPersistence mailboxURLForDatabaseID:](self, "mailboxURLForDatabaseID:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("1")) & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0D1E6F8]);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __66__EDLocalActionPersistence__flagChangeAllActionForRow_connection___block_invoke;
      v23[3] = &unk_1E949C890;
      v27 = v9;
      v24 = v18;
      v28 = v13;
      v25 = v16;
      v26 = v17;
      v19 = (void *)objc_msgSend(v21, "initWithBuilder:", v23);

    }
  }
  else
  {
    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[EDLocalActionPersistence _flagChangeAllActionForRow:connection:].cold.1(buf, objc_msgSend(v14, "count"), v20);

    v19 = 0;
  }

  return v19;
}

void __66__EDLocalActionPersistence__flagChangeAllActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E748]), "initWithDatabaseID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setPersistentID:", v3);

  objc_msgSend(v4, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setUserInitiated:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v4, "setOldestPersistedRemoteID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setFlagChange:", *(_QWORD *)(a1 + 48));

}

- (id)_labelChangeActionForRow:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v30 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseIDValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v31 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  -[EDLocalActionPersistence _findMessagesForAction:remoteIDs:messages:connection:](self, "_findMessagesForAction:remoteIDs:messages:connection:", v8, v31);
  v25 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  objc_msgSend(v29, "preparedStatementForQueryString:", CFSTR("SELECT label, do_add FROM action_labels WHERE action = ?"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDLocalActionPersistence gmailLabelPersistence](self, "gmailLabelPersistence");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke;
  v40[3] = &unk_1E949C8B8;
  v16 = v26;
  v41 = v16;
  v17 = v25;
  v42 = v17;
  v18 = v24;
  v43 = v18;
  objc_msgSend(v27, "executeWithIndexedBindings:usingBlock:error:", v14, v40, 0);

  if ((objc_msgSend(v31, "count") || objc_msgSend(v28, "count"))
    && (objc_msgSend(v17, "count") || objc_msgSend(v18, "count")))
  {
    -[EDLocalActionPersistence mailboxURLForDatabaseID:](self, "mailboxURLForDatabaseID:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D1E738]);
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke_2;
    v32[3] = &unk_1E949C8E0;
    v38 = v8;
    v21 = v19;
    v33 = v21;
    v39 = v12;
    v34 = v31;
    v35 = v28;
    v36 = v17;
    v37 = v18;
    v22 = (void *)objc_msgSend(v20, "initWithBuilder:", v32);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "labelForDatabaseID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("do_add"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = 48;
    if (v8)
      v9 = 40;
    objc_msgSend(*(id *)(a1 + v9), "addObject:", v5);
  }

}

void __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E748]), "initWithDatabaseID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setPersistentID:", v3);

  objc_msgSend(v4, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setUserInitiated:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v4, "setRemoteIDs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setMessages:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setLabelsToAdd:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setLabelsToRemove:", *(_QWORD *)(a1 + 64));

}

- (void)_findMessagesForAction:(int64_t)a3 remoteIDs:(id)a4 messages:(id)a5 connection:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(a6, "preparedStatementForQueryString:", CFSTR("SELECT remote_id, message FROM action_messages WHERE action = ?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__EDLocalActionPersistence__findMessagesForAction_remoteIDs_messages_connection___block_invoke;
  v17[3] = &unk_1E949C8B8;
  v17[4] = self;
  v15 = v11;
  v18 = v15;
  v16 = v10;
  v19 = v16;
  objc_msgSend(v12, "executeWithIndexedBindings:usingBlock:error:", v14, v17, 0);

}

void __81__EDLocalActionPersistence__findMessagesForAction_remoteIDs_messages_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("remote_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageForDatabaseID:", objc_msgSend(v6, "databaseIDValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (id *)(a1 + 40);
    v9 = v7;
LABEL_5:
    objc_msgSend(*v8, "addObject:", v9);
    goto LABEL_6;
  }
  if (v4)
  {
    v8 = (id *)(a1 + 48);
    v9 = v4;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_flagChangeForAction:(int64_t)a3 connection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0D1E778]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke;
  v10[3] = &unk_1E949C908;
  v7 = v5;
  v11 = v7;
  v12 = a3;
  v8 = (void *)objc_msgSend(v6, "initWithBuilder:", v10);

  return v8;
}

void __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:", CFSTR("SELECT flag_type, flag_value FROM action_flags WHERE action = ?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke_2;
  v10[3] = &unk_1E949AF78;
  v7 = v3;
  v11 = v7;
  v9 = 0;
  objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, v10, &v9);
  v8 = v9;

}

void __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  switch(v5)
  {
    case 1:
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changesReadTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 2:
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changesDeletedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 3:
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changesRepliedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 4:
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changesFlaggedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 5:
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "changesDraftTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 6:
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "changesForwardedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 7:
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "changesRedirectedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 8:
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "changesJunkLevelSetByUserTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 9:
      v16 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "changesJunkLevelTo:", objc_msgSend(v8, "unsignedIntegerValue"));
      goto LABEL_12;
    case 10:
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flag_value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "changesFlagColorTo:", objc_msgSend(v8, "unsignedIntegerValue"));
LABEL_12:

      break;
    default:
      break;
  }

}

- (id)messageForDatabaseID:(int64_t)a3
{
  -[EDLocalActionPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDLocalActionPersistence messageForDatabaseID:]", "EDLocalActionPersistence.m", 516, "0");
}

- (BOOL)persistFlagChangeAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE buf[24];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v5);

  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "messages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "count");
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Creating flag change action for %lu messages in mailbox %{public}llu", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 1;
  -[EDLocalActionPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence persistFlagChangeAction:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__EDLocalActionPersistence_persistFlagChangeAction___block_invoke;
  v14[3] = &unk_1E949C190;
  v16 = buf;
  v17 = v6;
  v14[4] = self;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

BOOL __52__EDLocalActionPersistence_persistFlagChangeAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL8 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox) VALUES (?, ?)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = &unk_1E94E4778;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v7 = objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, 0, &v26);
  v8 = v26;

  if ((v7 & 1) != 0)
  {
    v9 = objc_msgSend(v3, "lastInsertedDatabaseID");
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "flagChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_addFlagChange:actionID:connection:", v11, v9, v3);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "messages", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(a1 + 32), "_addActionMessageForMessage:destinationMessage:actionID:actionPhase:connection:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15++), 0, v9, 0, v3);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    goto LABEL_17;
  }
  objc_msgSend(v8, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
  {

    goto LABEL_16;
  }
  v17 = objc_msgSend(v8, "code") == 19;

  if (!v17)
  {
LABEL_16:
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Adding flag change action"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_17;
  }
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134349056;
    v29 = v19;
    _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Got foreign key constraint error adding action for mailbox %{public}llu", buf, 0xCu);
  }

LABEL_17:
  v20 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;

  return v20;
}

- (BOOL)persistFlagChangeUndownloadedAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  __int128 *p_buf;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v5);

  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134349056;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Creating flag change all action in mailbox %{public}llu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 1;
  -[EDLocalActionPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence persistFlagChangeUndownloadedAction:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__EDLocalActionPersistence_persistFlagChangeUndownloadedAction___block_invoke;
  v13[3] = &unk_1E949C190;
  p_buf = &buf;
  v16 = v6;
  v13[4] = self;
  v10 = v4;
  v14 = v10;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  v11 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v11;
}

BOOL __64__EDLocalActionPersistence_persistFlagChangeUndownloadedAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v18;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("local_message_actions"), 4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E94E4790, CFSTR("action_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("mailbox"));

  v18 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeInsertStatement:rowsChanged:", v4, &v18);
  v6 = v18;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v8 = v18 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = *MEMORY[0x1E0D1DC08];
  }
  else
  {
    v9 = objc_msgSend(v3, "lastInsertedDatabaseID");
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "flagChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "_addFlagChange:actionID:connection:", v11, v9, v3);

    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v7)
    v12 = v6 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("action_messages"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("action"));

    objc_msgSend(*(id *)(a1 + 40), "oldestPersistedRemoteID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("remote_id"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E94E47A8, CFSTR("action_phase"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeInsertStatement:error:", v13, 0);

    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v16 = v7 != 0;

  return v16;
}

- (BOOL)_addFlagChange:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(void *, uint64_t, uint64_t, _QWORD);
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, int, uint64_t, uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, ?, ?)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __63__EDLocalActionPersistence__addFlagChange_actionID_connection___block_invoke;
  v17 = &unk_1E949C930;
  v19 = &v28;
  v10 = v9;
  v20 = &v22;
  v21 = a4;
  v18 = v10;
  v11 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(&v14);
  v11[2](v11, objc_msgSend(v7, "readChanged", v14, v15, v16, v17), 1, objc_msgSend(v7, "read"));
  v11[2](v11, objc_msgSend(v7, "deletedChanged"), 2, objc_msgSend(v7, "deleted"));
  v11[2](v11, objc_msgSend(v7, "repliedChanged"), 3, objc_msgSend(v7, "replied"));
  v11[2](v11, objc_msgSend(v7, "flaggedChanged"), 4, objc_msgSend(v7, "flagged"));
  v11[2](v11, objc_msgSend(v7, "draftChanged"), 5, objc_msgSend(v7, "draft"));
  v11[2](v11, objc_msgSend(v7, "forwardedChanged"), 6, objc_msgSend(v7, "forwarded"));
  v11[2](v11, objc_msgSend(v7, "redirectedChanged"), 7, objc_msgSend(v7, "redirected"));
  v11[2](v11, objc_msgSend(v7, "junkLevelSetByUserChanged"), 8, objc_msgSend(v7, "junkLevelSetByUser"));
  v11[2](v11, objc_msgSend(v7, "junkLevelChanged"), 9, objc_msgSend(v7, "junkLevel"));
  v11[2](v11, objc_msgSend(v7, "flagColorChanged"), 10, objc_msgSend(v7, "flagColor"));
  if (*((_BYTE *)v29 + 24))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v8, "handleError:message:", v23[5], CFSTR("Adding flag change records"));
    v12 = *((_BYTE *)v29 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __63__EDLocalActionPersistence__addFlagChange_actionID_connection___block_invoke(_QWORD *a1, int a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    v4 = a2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v8 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v13 + 40);
    LOBYTE(v8) = objc_msgSend(v8, "executeWithIndexedBindings:usingBlock:error:", v12, 0, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (_BYTE)v8;

  }
}

- (BOOL)persistTransferAction:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  _QWORD v37[4];
  __CFString *v38;
  EDLocalActionPersistence *v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Persisting the transferAction: %@", buf, 0xCu);
  }

  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = *MEMORY[0x1E0D1DC08];
  -[__CFString sourceMailboxURL](v4, "sourceMailboxURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[__CFString sourceMailboxURL](v4, "sourceMailboxURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[__CFString destinationMailboxURL](v4, "destinationMailboxURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[__CFString destinationMailboxURL](v4, "destinationMailboxURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v12));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[EDLocalActionPersistence database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence persistTransferAction:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __50__EDLocalActionPersistence_persistTransferAction___block_invoke;
  v37[3] = &unk_1E949C958;
  v15 = v4;
  v38 = v15;
  v39 = self;
  v42 = &v48;
  v16 = v9;
  v40 = v16;
  v17 = v36;
  v41 = v17;
  v43 = &v44;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v37);

  v18 = -[__CFString transferType](v15, "transferType");
  if (v18 >= 4)
    v35 = 0;
  else
    v35 = off_1E949CA10[v18];
  -[__CFString itemsToDownload](v15, "itemsToDownload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v19, "count");
  -[__CFString itemsToCopy](v15, "itemsToCopy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v20, "count");
  -[__CFString itemsToDelete](v15, "itemsToDelete");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v45[3];
    -[__CFString itemsToDownload](v15, "itemsToDownload");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v32, "count");
    -[__CFString itemsToCopy](v15, "itemsToCopy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    -[__CFString itemsToDelete](v15, "itemsToDelete");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 138545154;
    v53 = v35;
    v54 = 2048;
    v55 = v24;
    v56 = 2048;
    v57 = v33 + v34 + v22;
    v58 = 2048;
    v59 = v25;
    v60 = 2048;
    v61 = v27;
    v62 = 2048;
    v63 = v29;
    v64 = 2112;
    v65 = v16;
    v66 = 2112;
    v67 = v17;
    _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Created %{public}@ action %lld for %lu messages (%lu download, %lu copy, %lu delete) in source mailbox %@, destination %@", buf, 0x52u);

  }
  v30 = *((_BYTE *)v49 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

BOOL __50__EDLocalActionPersistence_persistTransferAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL8 v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _QWORD v61[7];

  v61[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, user_initiated, mailbox, source_mailbox, destination_mailbox) VALUES (?, ?, ?, ?, ?)"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "transferType");
  if (v4 >= 4)
    v5 = 0;
  else
    v5 = qword_1D317A538[v4];
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mailboxDatabaseIDForURL:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "userInitiated"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v61[2] = v11;
  v61[3] = v12;
  v61[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v15 = objc_msgSend(v44, "executeWithIndexedBindings:usingBlock:error:", v14, 0, &v57);
  v16 = v57;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_31;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "lastInsertedDatabaseID");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemsToDownload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v22 = *(void **)(a1 + 40);
        objc_msgSend(v21, "sourceMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "destinationMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_addActionMessageForMessage:destinationMessage:actionID:actionPhase:connection:", v23, v24, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 1, v3);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v18);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemsToCopy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        v30 = *(void **)(a1 + 40);
        objc_msgSend(v29, "sourceMessage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "destinationMessage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_addActionMessageForMessage:destinationMessage:actionID:actionPhase:connection:", v31, v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 3, v3);

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v26);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemsToDelete");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v33);
        v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v37, "sourceMessage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = *(void **)(a1 + 40);
        if (v38)
        {
          objc_msgSend(v37, "sourceMessage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "destinationMessage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_addActionMessageForMessage:destinationMessage:actionID:actionPhase:connection:", v40, v41, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 4, v3);

        }
        else
        {
          objc_msgSend(v37, "sourceRemoteID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_addActionMessageForSourceRemoteID:actionID:connection:", v40, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v3);
        }

      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v34);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v42 = 1;
  }
  else
  {
LABEL_31:
    objc_msgSend(v3, "handleError:message:", v16, CFSTR("Adding copy action"));
    v42 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  }

  return v42;
}

- (BOOL)persistTransferUndownloadedAction:(id)a3
{
  id v4;
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
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  EDLocalActionPersistence *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = *MEMORY[0x1E0D1DC08];
  objc_msgSend(v4, "sourceMailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "sourceMailboxURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v4, "destinationMailboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "destinationMailboxURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  -[EDLocalActionPersistence database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence persistTransferUndownloadedAction:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __62__EDLocalActionPersistence_persistTransferUndownloadedAction___block_invoke;
  v28 = &unk_1E949C980;
  v15 = v4;
  v29 = v15;
  v30 = self;
  v16 = v8;
  v31 = v16;
  v17 = v12;
  v32 = v17;
  v33 = &v39;
  v34 = &v35;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, &v25);

  v18 = objc_msgSend(v15, "transferType", v25, v26, v27, v28);
  if (v18 >= 4)
    v19 = 0;
  else
    v19 = off_1E949CA10[v18];
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v36[3];
    v22 = *((unsigned __int8 *)v40 + 24);
    *(_DWORD *)buf = 138544130;
    v44 = v19;
    v45 = 2048;
    v46 = v21;
    v47 = 2112;
    v48 = v17;
    v49 = 1024;
    v50 = v22;
    _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Created %{public}@ action %lld for undownloaded message in mailbox %@ (success = %d)", buf, 0x26u);
  }

  v23 = *((_BYTE *)v40 + 24) != 0;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

BOOL __62__EDLocalActionPersistence_persistTransferUndownloadedAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v23;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "transferType");
  if (v4 >= 4)
    v5 = 0;
  else
    v5 = qword_1D317A558[v4];
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mailboxURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mailboxDatabaseIDForURL:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("local_message_actions"), 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("action_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("mailbox"));

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("source_mailbox"));
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("destination_mailbox"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "userInitiated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("user_initiated"));

  v23 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "executeInsertStatement:rowsChanged:", v9, &v23);
  v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && v23)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "lastInsertedDatabaseID");
    if (objc_msgSend(*(id *)(a1 + 32), "transferType") == 3)
      v16 = 4;
    else
      v16 = 3;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("action_messages"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("action"));

    objc_msgSend(*(id *)(a1 + 32), "oldestPersistedRemoteID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("remote_id"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("action_phase"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "executeInsertStatement:error:", v17, 0);
    v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  v21 = v15 != 0;

  return v21;
}

- (BOOL)persistLabelChangeAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  EDLocalActionPersistence *v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v5);

  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "messages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "count");
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Creating label change action for %lu messages in mailbox %{public}llu", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 1;
  -[EDLocalActionPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence persistLabelChangeAction:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__EDLocalActionPersistence_persistLabelChangeAction___block_invoke;
  v14[3] = &unk_1E949C190;
  v17 = buf;
  v18 = v6;
  v11 = v4;
  v15 = v11;
  v16 = self;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

BOOL __53__EDLocalActionPersistence_persistLabelChangeAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO local_message_actions (action_type, mailbox) VALUES (?, ?)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = &unk_1E94E47C0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, 0, 0);

  v7 = objc_msgSend(v3, "lastInsertedDatabaseID");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "messages", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_addActionMessageForMessage:destinationMessage:actionID:actionPhase:connection:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11), 0, v7, 0, v3);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (v12 = *(void **)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "labelsToAdd"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "_setLabelsOnAction:labels:add:connection:", v7, v13, 1, v3), v13, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "labelsToRemove");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v14, "_setLabelsOnAction:labels:add:connection:", v7, v15, 0, v3);

    v16 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_setLabelsOnAction:(int64_t)a3 labels:(id)a4 add:(BOOL)a5 connection:(id)a6
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  BOOL v20;
  id obj;
  uint64_t v23;
  _BOOL4 v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v24 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26 = a6;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v23 = *(_QWORD *)v29;
    v9 = 0x1E0CB3000uLL;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v26, "preparedStatementForQueryString:", CFSTR("INSERT INTO action_labels (action, label, do_add) VALUES (?, ?, ?)"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 2024), "numberWithLongLong:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v13;
        objc_msgSend(v11, "persistentID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v14;
        v15 = v9;
        objc_msgSend(*(id *)(v9 + 2024), "numberWithBool:", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v18 = objc_msgSend(v12, "executeWithIndexedBindings:usingBlock:error:", v17, 0, &v27);
        v19 = v27;

        v9 = v15;
        if ((v18 & 1) == 0)
        {
          objc_msgSend(v26, "handleError:message:", v19, CFSTR("Adding flag change messages"));

          v20 = 0;
          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_11:

  return v20;
}

- (BOOL)_addActionMessageForMessage:(id)a3 destinationMessage:(id)a4 actionID:(int64_t)a5 actionPhase:(int64_t)a6 connection:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v34 = v13;
  objc_msgSend(v12, "persistentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  if ((a6 & 0xFFFFFFFFFFFFFFFDLL) != 1 || v15)
  {
    objc_msgSend(v11, "persistentID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    if (v19)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v33 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v15)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("action_messages"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("action"));

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, CFSTR("message"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("remote_id"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("destination_message"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("action_phase"));
    v35 = 0;
    v26 = objc_msgSend(v13, "executeInsertStatement:error:", v24, &v35);
    v27 = v35;
    v28 = v27;
    if ((v26 & 1) != 0)
      goto LABEL_19;
    objc_msgSend(v27, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
    {
      v30 = objc_msgSend(v28, "code") == 19;

      if (v30)
      {
LABEL_19:
        v17 = 1;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    objc_msgSend(v34, "handleError:message:", v28, CFSTR("Adding flag change messages"));
    v17 = 0;
    goto LABEL_25;
  }
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v37 = a5;
    v38 = 2114;
    v39 = v12;
    v40 = 2114;
    v41 = v11;
    v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "Adding action message for transfer without destination message ID - action ID: %lld, destination message: %{public}@, source message: %{public}@\n%{public}@", buf, 0x2Au);

  }
  v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)_addActionMessageForSourceRemoteID:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v15;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1D824B334]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("action_messages"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("action"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("remote_id"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E94E47C0, CFSTR("action_phase"));
  v15 = 0;
  v12 = objc_msgSend(v8, "executeInsertStatement:error:", v10, &v15);
  v13 = v15;
  if ((v12 & 1) == 0)
    objc_msgSend(v8, "handleError:message:", v13, CFSTR("Adding flag change messages"));

  objc_autoreleasePoolPop(v9);
  return v12;
}

- (BOOL)updateTransferAction:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  EDLocalActionPersistence *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "completedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v7, "failedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = objc_msgSend(v7, "phaseForResults");
    *(_DWORD *)buf = 138544130;
    v30 = v6;
    v31 = 2048;
    v32 = v10;
    v33 = 2048;
    v34 = v12;
    v35 = 2048;
    v36 = v13;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Persisting results for action %{public}@, completed %lu, failed %lu for phase %lu", buf, 0x2Au);

  }
  -[EDLocalActionPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence updateTransferAction:withResults:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__EDLocalActionPersistence_updateTransferAction_withResults___block_invoke;
  v20[3] = &unk_1E949C9A8;
  v16 = v6;
  v21 = v16;
  v17 = v7;
  v22 = v17;
  v23 = self;
  v24 = &v25;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v20);

  v18 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  return v18;
}

uint64_t __61__EDLocalActionPersistence_updateTransferAction_withResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  __CFString *v60;
  __CFString *v61;
  NSObject *v62;
  void *v63;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[3];

  v80[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "databaseID");

  objc_msgSend(*(id *)(a1 + 40), "failedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "failedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_deleteCopyItems:actionID:connection:", v9, v5, v3);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "failedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithFailedItems:forPhase:", v11, objc_msgSend(*(id *)(a1 + 40), "phaseForResults"));

    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "failedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v13;
      v75 = 2048;
      v76 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Action %{public}@ had %lu failed items", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "itemsToDownload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "itemsToCopy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "itemsToDelete");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count") == 0;

  if (v42)
  {
    objc_msgSend(*(id *)(a1 + 48), "removeMessageAction:", v5);
    goto LABEL_29;
  }
LABEL_9:
  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "completedItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithCompletedItems:forPhase:", v18, objc_msgSend(*(id *)(a1 + 40), "phaseForResults"));

  if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") != 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "sourceMailboxURL");
      v22 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "transferType") == 1
        && (v23 = *(void **)(a1 + 48),
            objc_msgSend(*(id *)(a1 + 32), "destinationMailboxURL"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v23, "moveSupportedFromMailboxURL:toURL:", v22, v24),
            v24,
            (v25 & 1) == 0))
      {
        v48 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "completedItems");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "_updateCopyItems:toPhase:actionID:connection:", v49, 4, v5, v3);

        objc_msgSend(*(id *)(a1 + 32), "itemsToCopy");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count") == 0;

        if (v51)
        {
          v65 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "sourceMailboxURL");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v65, "mailboxURLIsInRemoteAccount:", v66);

          if (!v67)
          {
            +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "persistentID");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v74 = v71;
              _os_log_impl(&dword_1D2F2C000, v70, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);

            }
            objc_msgSend(*(id *)(a1 + 48), "removeMessageAction:", v5);
            v30 = 0;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            goto LABEL_41;
          }
          v30 = v22;
          +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "persistentID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v74 = v69;
            _os_log_impl(&dword_1D2F2C000, v68, OS_LOG_TYPE_DEFAULT, "Action %{public}@ finished copying items", buf, 0xCu);

          }
          goto LABEL_19;
        }
      }
      else
      {
        v26 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "completedItems");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_deleteCopyItems:actionID:connection:", v27, v5, v3);

        objc_msgSend(*(id *)(a1 + 32), "itemsToCopy");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count") == 0;

        if (v29)
        {
          v30 = v22;
          +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "persistentID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v74 = v32;
            _os_log_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 48), "removeMessageAction:", v5);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_19:
          v22 = v30;
          goto LABEL_41;
        }
      }
      v30 = 0;
      goto LABEL_41;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") != 4)
      goto LABEL_49;
    v33 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "completedItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_deleteCopyItems:actionID:connection:", v34, v5, v3);

    objc_msgSend(*(id *)(a1 + 32), "itemsToDelete");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v35, "count") == 0;

    if (!(_DWORD)v33)
      goto LABEL_49;
    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v37;
      _os_log_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "removeMessageAction:", v5);
LABEL_29:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_49;
  }
  objc_msgSend(*(id *)(a1 + 32), "destinationMailboxURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "completedItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_updateCopyItems:toPhase:actionID:connection:", v21, 3, v5, v3);
  }
  else
  {
    v38 = objc_msgSend(*(id *)(a1 + 32), "transferType");
    v39 = *(void **)(a1 + 40);
    v40 = *(void **)(a1 + 48);
    if (v38 == 1)
    {
      objc_msgSend(v39, "completedItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_updateCopyItems:toPhase:actionID:connection:", v21, 4, v5, v3);
    }
    else
    {
      objc_msgSend(v39, "completedItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_deleteCopyItems:actionID:connection:", v21, v5, v3);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "itemsToDownload");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count") == 0;

  if (!v44)
    goto LABEL_49;
  objc_msgSend(*(id *)(a1 + 32), "destinationMailboxURL");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30 && objc_msgSend(*(id *)(a1 + 32), "transferType") != 1)
  {
    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v46;
      _os_log_impl(&dword_1D2F2C000, v45, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "removeMessageAction:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v47;
    _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Action %{public}@ finished downloading items", buf, 0xCu);

  }
LABEL_41:

  if (v30)
  {
    v52 = objc_msgSend(*(id *)(a1 + 48), "mailboxDatabaseIDForURL:", v30);
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE local_message_actions SET mailbox = :mailbox WHERE ROWID = :action"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = CFSTR(":action");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = CFSTR(":mailbox");
    v80[0] = v54;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v52);
    v55 = objc_claimAutoreleasedReturnValue();
    v80[1] = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = 0;
    LOBYTE(v55) = objc_msgSend(v53, "executeWithNamedBindings:usingBlock:error:", v56, 0, &v72);
    v57 = v72;
    if ((v55 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v57, CFSTR("Updating action phase"));
    objc_msgSend(*(id *)(a1 + 32), "sourceMailboxURL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[NSObject isEqual:](v30, "isEqual:", v58);
    v60 = CFSTR("destination mailbox");
    if (v59)
      v60 = CFSTR("source mailbox");
    v61 = v60;

    +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v74 = v63;
      v75 = 2112;
      v76 = (uint64_t)v61;
      v77 = 2048;
      v78 = v52;
      _os_log_impl(&dword_1D2F2C000, v62, OS_LOG_TYPE_DEFAULT, "Updating action %{public}@ to %@ (%lu)", buf, 0x20u);

    }
  }
LABEL_49:

  return 1;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDLocalActionPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDLocalActionPersistence moveSupportedFromMailboxURL:toURL:]", "EDLocalActionPersistence.m", 962, "0");
}

- (BOOL)mailboxURLIsInRemoteAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E0D1DB68]) & 1) != 0
      || (objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E0D1DB60]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E0D1DB58]);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateCopyItems:(id)a3 toPhase:(int64_t)a4 actionID:(int64_t)a5 connection:(id)a6
{
  void *v10;
  void *v11;
  id v12;

  v12 = a6;
  -[EDLocalActionPersistence _whereClauseToFindCopyItems:](self, "_whereClauseToFindCopyItems:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE action_messages SET action_phase = %ld WHERE action = %llu AND %@"), a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeStatementString:errorMessage:", v11, CFSTR("Updating copy item phase"));

}

- (void)_deleteCopyItems:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[EDLocalActionPersistence _whereClauseToFindCopyItems:](self, "_whereClauseToFindCopyItems:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM action_messages WHERE action = %llu AND %@"), a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeStatementString:errorMessage:", v9, CFSTR("Deleting copy items"));

}

- (id)_whereClauseToFindCopyItems:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v24;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_msgSend(v11, "destinationMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "destinationMessage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "persistentID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v11, "sourceRemoteID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "sourceRemoteID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ef_quotedSQLEscapedString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);
          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDLocalActionPersistence.m"), 993, CFSTR("Copy item had neither a source remoteID or a destination message"));
LABEL_11:

        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v8 = v16;
    }
    while (v16);
  }

  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("(remote_id IN (%@) OR destination_message IN (%@)"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = objc_msgSend(v5, "count");
    v22 = (void *)MEMORY[0x1E0CB3940];
    if (v21)
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("remote_id IN (%@)"), v18);
    }
    else
    {
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("destination_message IN (%@)"), v18);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)_sourceRemoteIDListForCopyItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "sourceRemoteID", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ef_quotedSQLEscapedString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)updateTransferUndownloadedMessageAction:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  EDLocalActionPersistence *v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "completedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "phaseForResults") != 3 || objc_msgSend(v6, "transferType") != 1)
    goto LABEL_7;
  objc_msgSend(v6, "sourceMailboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationMailboxURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EDLocalActionPersistence moveSupportedFromMailboxURL:toURL:](self, "moveSupportedFromMailboxURL:toURL:", v9, v10))
  {

LABEL_7:
    objc_msgSend(v6, "persistentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDLocalActionPersistence removeMessageAction:](self, "removeMessageAction:", objc_msgSend(v17, "databaseID"));
    v16 = 0;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v8, "count");

  if (!v11)
    goto LABEL_7;
  objc_msgSend(v6, "updateWithCompletedCopyItems:", v8);
  objc_msgSend(v6, "persistentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "databaseID");

  -[EDLocalActionPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence updateTransferUndownloadedMessageAction:withResults:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__EDLocalActionPersistence_updateTransferUndownloadedMessageAction_withResults___block_invoke;
  v19[3] = &unk_1E949C9D0;
  v20 = v8;
  v21 = self;
  v23 = v13;
  v22 = v6;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v19);

  v16 = 1;
  v17 = v20;
LABEL_8:

  return v16;
}

uint64_t __80__EDLocalActionPersistence_updateTransferUndownloadedMessageAction_withResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "sourceRemoteID", (_QWORD)v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_addActionMessageForSourceRemoteID:actionID:connection:", v9, *(_QWORD *)(a1 + 56), v3);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "sourceMailboxURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "mailboxDatabaseIDForURL:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("local_message_actions"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E94E4778, CFSTR("action_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("mailbox"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("ROWID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "equalTo:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWhereClause:", v17);

  objc_msgSend(v3, "executeUpdateStatement:error:", v13, 0);
  return 1;
}

- (void)updateFlagChangeAction:(id)a3 withRemainingUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[EDLocalActionPersistence database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence updateFlagChangeAction:withRemainingUIDs:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EDLocalActionPersistence_updateFlagChangeAction_withRemainingUIDs___block_invoke;
  v12[3] = &unk_1E949AFA0;
  v11 = v6;
  v13 = v11;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

}

uint64_t __69__EDLocalActionPersistence_updateFlagChangeAction_withRemainingUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "databaseID");

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "ed_uidQueryExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM action_messages WHERE action = %lld AND NOT (%@)"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "executeStatementString:errorMessage:", v8, CFSTR("Deleting flag change messages."));
  return 1;
}

- (void)removeMessageAction:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Action %llu finished", buf, 0xCu);
  }

  -[EDLocalActionPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence removeMessageAction:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EDLocalActionPersistence_removeMessageAction___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v8[4] = a3;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v8);

}

uint64_t __48__EDLocalActionPersistence_removeMessageAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM local_message_actions WHERE ROWID = ?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, 0, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Removing completed action"));

  return v7;
}

- (void)removeMessageActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDLocalActionPersistence removeMessageAction:](self, "removeMessageAction:", objc_msgSend(v5, "databaseID"));

    }
    else
    {
      objc_msgSend(v4, "ef_map:", &__block_literal_global_25);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[EDLocalActionPersistence log](EDLocalActionPersistence, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v15 = objc_msgSend(v4, "count");
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%llu Actions finished %{public}@", buf, 0x16u);
      }

      -[EDLocalActionPersistence database](self, "database");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence removeMessageActions:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__EDLocalActionPersistence_removeMessageActions___block_invoke_169;
      v12[3] = &unk_1E949B7F0;
      v11 = v7;
      v13 = v11;
      objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v12);

    }
  }

}

id __49__EDLocalActionPersistence_removeMessageActions___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "stringValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49__EDLocalActionPersistence_removeMessageActions___block_invoke_169(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM local_message_actions WHERE ROWID IN (%@)"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", 0, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Removing completed action"));

  return v6;
}

- (ECLocalMessageActionID)latestActionID
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[EDLocalActionPersistence database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDLocalActionPersistence latestActionID]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__EDLocalActionPersistence_latestActionID__block_invoke;
  v6[3] = &unk_1E949BF68;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ECLocalMessageActionID *)v4;
}

uint64_t __42__EDLocalActionPersistence_latestActionID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT MAX(ROWID) as latest FROM local_message_actions"));
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__EDLocalActionPersistence_latestActionID__block_invoke_2;
  v7[3] = &unk_1E949B090;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "executeUsingBlock:error:", v7, 0);

  return 1;
}

void __42__EDLocalActionPersistence_latestActionID__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1E748]);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("latest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Could not find destination message for database ID %lld", (uint8_t *)&v3, 0xCu);
}

- (void)_flagChangeAllActionForRow:(os_log_t)log connection:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Flag change all action expected to have exactly one remote ID associated with it, but had %lu", buf, 0xCu);
}

@end
