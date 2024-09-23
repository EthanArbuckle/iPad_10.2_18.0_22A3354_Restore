@implementation EDServerMessagePersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EDPersistenceForeignKeyPlaceholder *v9;
  void *v10;
  EDPersistenceForeignKeyPlaceholder *v11;
  EDPersistenceForeignKeyPlaceholder *v12;
  void *v13;
  EDPersistenceForeignKeyPlaceholder *v14;
  EDPersistenceForeignKeyPlaceholder *v15;
  void *v16;
  EDPersistenceForeignKeyPlaceholder *v17;
  void *v18;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serverMessagesTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serverLabelsTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnForName:", CFSTR("server_message"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPersistenceDatabaseSchema mailboxesTableName](EDPersistenceDatabaseSchema, "mailboxesTableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v5, "columnForName:", CFSTR("message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v9, "initWithColumn:tableName:onDelete:onUpdate:", v10, v22, 3, 0);
  v24[0] = v11;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v5, "columnForName:", CFSTR("mailbox"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v12, "initWithColumn:tableName:onDelete:onUpdate:", v13, v8, 2, 0);
  v24[1] = v14;
  v15 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v6, "columnForName:", CFSTR("label"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v15, "initWithColumn:tableName:onDelete:onUpdate:", v16, v8, 2, 0);
  v24[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  *a4 = (id)MEMORY[0x1E0C9AA60];
  v23[0] = v5;
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)serverMessagesTableSchema
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
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];
  _QWORD v24[16];

  v24[14] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("mailbox"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sequence_identifier"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("read"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("deleted"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v17;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("replied"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v16;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flagged"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v15;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("draft"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("forwarded"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("redirected"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("junk_level_set_by_user"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("junk_level"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("flag_color"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("remote_id"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("server_messages"), 2, v10);

  v23[0] = CFSTR("mailbox");
  v23[1] = CFSTR("remote_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addUniquenessConstraintForColumns:conflictResolution:", v12, 1);

  v22 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addIndexForColumns:", v13);

  return v11;
}

+ (id)serverLabelsTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("server_message"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("label"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("server_message");
  v9[1] = CFSTR("label");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("server_labels"), v5, v6);

  return v7;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDServerMessagePersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_86 != -1)
    dispatch_once(&log_onceToken_86, block);
  return (OS_os_log *)(id)log_log_86;
}

void __33__EDServerMessagePersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_86;
  log_log_86 = (uint64_t)v1;

}

- (EDServerMessagePersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4 mailboxID:(int64_t)a5 useNumericSearch:(BOOL)a6 supportsLabels:(BOOL)a7
{
  id v14;
  id v15;
  EDServerMessagePersistence *v16;
  EDServerMessagePersistence *v17;
  void *v19;
  objc_super v20;

  v14 = a3;
  v15 = a4;
  if (*MEMORY[0x1E0D1DC08] == a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDServerMessagePersistence.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailboxID != EMDatabaseIDUndefined"));

  }
  v20.receiver = self;
  v20.super_class = (Class)EDServerMessagePersistence;
  v16 = -[EDServerMessagePersistence init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_database, a3);
    objc_storeStrong((id *)&v17->_gmailLabelPersistence, a4);
    v17->_mailboxID = a5;
    v17->_useNumericSearch = a6;
    v17->_supportsLabels = a7;
  }

  return v17;
}

- (EDServerMessagePersistence)init
{
  -[EDServerMessagePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDServerMessagePersistence init]", "EDServerMessagePersistence.m", 168, "0");
}

- (unint64_t)messageCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence messageCount]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__EDServerMessagePersistence_messageCount__block_invoke;
  v7[3] = &unk_1E949AFC8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __42__EDServerMessagePersistence_messageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count() FROM server_messages WHERE (mailbox = %lld)"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__EDServerMessagePersistence_messageCount__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Executing count query"));

  return 1;
}

void __42__EDServerMessagePersistence_messageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");

  *a4 = 1;
}

- (unint64_t)unreadMessageCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence unreadMessageCount]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EDServerMessagePersistence_unreadMessageCount__block_invoke;
  v7[3] = &unk_1E949AFC8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__EDServerMessagePersistence_unreadMessageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count() FROM server_messages WHERE (mailbox = %lld) AND (read = 0)"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__EDServerMessagePersistence_unreadMessageCount__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Executing unread count query"));

  return 1;
}

void __48__EDServerMessagePersistence_unreadMessageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");

  *a4 = 1;
}

- (unint64_t)undeletedMessageCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence undeletedMessageCount]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke;
  v7[3] = &unk_1E949AFC8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count() FROM server_messages WHERE (mailbox = %lld) AND (deleted = 0)"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Executing unread count query"));

  return 1;
}

void __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");

  *a4 = 1;
}

- (unsigned)maximumIMAPUID
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence maximumIMAPUID]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke;
  v6[3] = &unk_1E949AFC8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MAX(remote_id) FROM server_messages WHERE (mailbox = %lld)"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Executing max uid query"));

  return 1;
}

void __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntValue");

  *a4 = 1;
}

- (unsigned)minimumIMAPUID
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence minimumIMAPUID]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke;
  v6[3] = &unk_1E949AFC8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MIN(remote_id) FROM server_messages WHERE (mailbox = %lld)"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "executeUsingBlock:error:", v10, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Executing min uid query"));

  return 1;
}

void __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntValue");

  *a4 = 1;
}

- (id)serverMessagesForRemoteIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDServerMessagePersistence_serverMessagesForRemoteIDs___block_invoke;
  v10[3] = &unk_1E94A1A38;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "ef_enumerateObjectsInBatchesOfSize:block:", 500, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __57__EDServerMessagePersistence_serverMessagesForRemoteIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_remoteIDStringForRemoteIDArray:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("remote_id IN (%@)"), v5);
  objc_msgSend(*(id *)(a1 + 32), "_serverMessagesWithWhereClause:limitClause:returnLastEntries:", v3, &stru_1E94A4508, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);

}

- (id)serverMessagesForIMAPUIDs:(id)a3 limit:(unint64_t)a4 returnLastEntries:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, void *, uint64_t);
  void *v29;
  EDServerMessagePersistence *v30;
  id v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint8_t buf[32];
  _QWORD v39[6];
  _QWORD v40[6];
  const __CFString *v41;
  _QWORD v42[3];

  v5 = a5;
  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  do
    v9 = __ldxr((unsigned int *)&serverMessagesForIMAPUIDsCounter);
  while (__stxr(v9 + 1, (unsigned int *)&serverMessagesForIMAPUIDsCounter));
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkPLShouldLogRegisteredEvent[0])(12, (uint64_t)CFSTR("EDServerMessagePersistence")))
  {
    v41 = CFSTR("call");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogRegisteredEvent[0])(12, (uint64_t)CFSTR("EDServerMessagePersistence"), v11, MEMORY[0x1E0C9AA60]);

  }
  if (a4)
    v12 = a4;
  else
    v12 = 100;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __80__EDServerMessagePersistence_serverMessagesForIMAPUIDs_limit_returnLastEntries___block_invoke;
  v29 = &unk_1E94A1A60;
  v32 = &v34;
  v30 = self;
  v33 = v5;
  v14 = v13;
  v31 = v14;
  objc_msgSend(v8, "ed_enumerateUIDsWithLimit:reverseEnumeration:usingBlock:", a4, v5, &v26);
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkPLShouldLogRegisteredEvent[0])(12, (uint64_t)CFSTR("EDServerMessagePersistence")))
  {
    v39[0] = CFSTR("call");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9, v26, v27, v28, v29, v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v15;
    v39[1] = CFSTR("iterations");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v35 + 6));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v16;
    v39[2] = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v17;
    v39[3] = CFSTR("first");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "firstIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v18;
    v39[4] = CFSTR("last");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "lastIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v19;
    v39[5] = CFSTR("limit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[5] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogRegisteredEvent[0])(12, (uint64_t)CFSTR("EDServerMessagePersistence"), (uint64_t)v21, MEMORY[0x1E0C9AA60]);
  }
  if (a4 && objc_msgSend(v14, "count") > a4)
  {
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[EDServerMessagePersistence serverMessagesForIMAPUIDs:limit:returnLastEntries:].cold.1(buf, objc_msgSend(v14, "count"), a4, v22);

    objc_msgSend(v14, "subarrayWithRange:", 0, a4);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v14;
  }
  v24 = v23;

  _Block_object_dispose(&v34, 8);
  return v24;
}

id __80__EDServerMessagePersistence_serverMessagesForIMAPUIDs_limit_returnLastEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(a2, "ed_uidQueryExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" LIMIT %llu"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_serverMessagesWithWhereClause:limitClause:returnLastEntries:", v5, v6, *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "imapUID"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v8;
}

- (id)deleteAllClearedUIDMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT message AS message_row_id FROM server_messages WHERE mailbox = %lld AND remote_id < 0"), -[EDServerMessagePersistence mailboxID](self, "mailboxID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDServerMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence deleteAllClearedUIDMessages]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke;
  v15[3] = &unk_1E949AFA0;
  v9 = v5;
  v16 = v9;
  v17 = v3;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v15);

  objc_autoreleasePoolPop(v4);
  -[EDServerMessagePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence deleteAllClearedUIDMessages]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125;
  v14[3] = &unk_1E949AFA0;
  v14[4] = self;
  v14[5] = v3;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

  v12 = v3;
  return v12;
}

uint64_t __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  _QWORD v10[5];
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_2;
  v10[3] = &unk_1E949AF78;
  v10[4] = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(v3, "executeUsingBlock:error:", v10, &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_cold_1(v7, (uint64_t)v11, v6);
    }

  }
  return 1;
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("message_row_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

uint64_t __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint64_t v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM server_messages WHERE server_messages.mailbox = %lld AND server_messages.remote_id < 0"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v5, "executeWithNamedBindings:rowsChanged:error:", v6, &v14, &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125_cold_2(v11, (uint64_t)buf, v10);
    }
    goto LABEL_7;
  }
  v9 = v14;
  if (v9 != objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125_cold_1(v14, objc_msgSend(*(id *)(a1 + 40), "count"), buf, v10);
LABEL_7:

  }
  return 1;
}

- (id)serverMessagesForMessageIDHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  EDServerMessagePersistence *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(v4, "ef_map:", &__block_literal_global_73);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT server_messages.ROWID, server_messages.message, server_messages.mailbox, server_messages.read, server_messages.deleted, server_messages.replied, server_messages.flagged, server_messages.draft, server_messages.forwarded, server_messages.redirected, server_messages.junk_level_set_by_user, server_messages.junk_level, server_messages.flag_color, server_messages.remote_id, messages.message_id AS message_id_header, messages.ROWID AS message_row_id FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE (server_messages.mailbox = %lld AND messages.message_id IN (%@) AND server_messages.remote_id < 0)"), -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  -[EDServerMessagePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence serverMessagesForMessageIDHeaders:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2;
  v15[3] = &unk_1E949B0B8;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v18 = v5;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v15);

  v13 = v5;
  return v13;
}

id __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithString:", v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v3, "int64Value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_3;
  v13[3] = &unk_1E949C8B8;
  v13[4] = a1[5];
  v5 = v3;
  v6 = a1[6];
  v14 = v5;
  v15 = v6;
  v12 = 0;
  v7 = objc_msgSend(v4, "executeUsingBlock:error:", v13, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2_cold_1(v10, (uint64_t)v16, v9);
    }

  }
  return 1;
}

void __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  EDExistingMessageWithMessageIDHeader *v8;
  void *v9;
  EDExistingMessageWithMessageIDHeader *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_serverMessageForRow:connection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("message_id_header"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64Value");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("message_row_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64Value");

  if (v3 && v5 && v7)
  {
    v8 = [EDExistingMessageWithMessageIDHeader alloc];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", v5);
    v10 = -[EDExistingMessageWithMessageIDHeader initWithMessageIDHash:serverMessage:messagePersistentID:](v8, "initWithMessageIDHash:serverMessage:messagePersistentID:", v9, v3, v7);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
  }

}

- (id)_serverMessagesWithWhereClause:(id)a3 limitClause:(id)a4 returnLastEntries:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  EDServerMessagePersistence *v23;
  BOOL v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = &stru_1E94A4508;
  if (v5)
    v10 = CFSTR(" DESC");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM server_messages WHERE (mailbox = %lld) AND (%@) ORDER BY remote_id%@%@"), CFSTR("ROWID, message, mailbox, read, deleted, replied, flagged, draft, forwarded, redirected, junk_level_set_by_user, junk_level, flag_color, remote_id"), -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v8, v11, v9);
  -[EDServerMessagePersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence _serverMessagesWithWhereClause:limitClause:returnLastEntries:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke;
  v20[3] = &unk_1E94A1A88;
  v16 = v13;
  v21 = v16;
  v24 = v5;
  v17 = v12;
  v22 = v17;
  v23 = self;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v20);

  v18 = v17;
  return v18;
}

uint64_t __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke_2;
  v9[3] = &unk_1E94A18B0;
  v13 = *(_BYTE *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v4, "executeUsingBlock:error:", v9, 0);

  return 1;
}

void __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v4, "_serverMessageForRow:connection:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertObject:atIndex:", v7, 0);
  }
  else
  {
    objc_msgSend(v4, "_serverMessageForRow:connection:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
  }

}

- (id)_serverMessageForRow:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1E780]);
  v8 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke;
  v46[3] = &unk_1E94A1AB0;
  v9 = v6;
  v47 = v9;
  v10 = (void *)objc_msgSend(v7, "initWithBuilder:", v46);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ROWID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "databaseIDValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ROWID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[EDServerMessagePersistence supportsLabels](self, "supportsLabels"))
    {
      objc_msgSend(v32, "preparedStatementForQueryString:", CFSTR("SELECT label FROM server_labels WHERE server_message = ?"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[EDServerMessagePersistence gmailLabelPersistence](self, "gmailLabelPersistence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v8;
      v43[1] = 3221225472;
      v43[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2;
      v43[3] = &unk_1E949E598;
      v19 = v16;
      v44 = v19;
      v20 = v29;
      v45 = v20;
      v42 = 0;
      v21 = objc_msgSend(v30, "executeWithIndexedBindings:usingBlock:error:", v18, v43, &v42);
      v22 = v42;

      if ((v21 & 1) == 0)
        objc_msgSend(v32, "handleError:message:", v22, CFSTR("Fetching server labels"));

    }
    else
    {
      v20 = 0;
    }
    v25 = objc_alloc(MEMORY[0x1E0D1E798]);
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_156;
    v36[3] = &unk_1E94A1AD8;
    v26 = v31;
    v37 = v26;
    v38 = v9;
    v39 = v12;
    v40 = v10;
    v41 = v20;
    v27 = v20;
    v24 = (void *)objc_msgSend(v25, "initWithIMAPServerMessageBuilder:", v36);

  }
  else
  {
    v23 = objc_alloc(MEMORY[0x1E0D1E798]);
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2_158;
    v33[3] = &unk_1E94A1B00;
    v34 = v9;
    v35 = v10;
    v24 = (void *)objc_msgSend(v23, "initWithServerMessageBuilder:", v33);

  }
  return v24;
}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke(uint64_t a1, void *a2)
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
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("read"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRead:", objc_msgSend(v3, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("deleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDeleted:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("replied"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReplied:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("flagged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFlagged:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("draft"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDraft:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forwarded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setForwarded:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("redirected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRedirected:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level_set_by_user"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setJunkLevelSetByUser:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("junk_level"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setJunkLevel:", objc_msgSend(v11, "int64Value"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("flag_color"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFlagColor:", objc_msgSend(v12, "int64Value"));

}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "databaseIDValue");

  objc_msgSend(*(id *)(a1 + 32), "labelForDatabaseID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "labelURLForDatabaseID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0D1EF48], "ec_redactedStringForMailboxURL:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v10 = 134218242;
      v11 = v5;
      v12 = 2112;
      v13 = v9;
      _os_log_fault_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_FAULT, "Unable to find label: %lld, %@", (uint8_t *)&v10, 0x16u);
      if (v7)

    }
  }

}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_156(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setPersistentID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessagePersistentID:", v4);

  objc_msgSend(v5, "setImapUID:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  objc_msgSend(v5, "setServerFlags:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v5, "setLabels:");

}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2_158(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersistentID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMessagePersistentID:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("remote_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteID:", v8);

  objc_msgSend(v9, "setServerFlags:", *(_QWORD *)(a1 + 40));
}

- (BOOL)addServerMessage:(id)a3 invalidMessage:(BOOL *)a4 duplicateRemoteID:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  EDServerMessagePersistence *v16;
  uint64_t *v17;
  BOOL *v18;
  BOOL *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence addServerMessage:invalidMessage:duplicateRemoteID:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__EDServerMessagePersistence_addServerMessage_invalidMessage_duplicateRemoteID___block_invoke;
  v14[3] = &unk_1E94A1B28;
  v11 = v8;
  v15 = v11;
  v16 = self;
  v17 = &v20;
  v18 = a4;
  v19 = a5;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  v12 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __80__EDServerMessagePersistence_addServerMessage_invalidMessage_duplicateRemoteID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
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
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _BYTE *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[13];
  _QWORD v56[15];

  v56[13] = *MEMORY[0x1E0C80C00];
  v51 = a2;
  objc_msgSend(v51, "preparedStatementForQueryString:", CFSTR("INSERT INTO server_messages (message, mailbox, read, deleted, replied, flagged, draft, forwarded, redirected, junk_level_set_by_user, junk_level, flag_color, remote_id) VALUES (:message, :mailbox, :read, :deleted, :replied, :flagged, :draft, :forwarded, :redirected, :junk_level_set_by_user, :junk_level, :flag_color, :remote_id)"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messagePersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v56[0] = v6;
  v55[0] = CFSTR(":message");
  v55[1] = CFSTR(":mailbox");
  v40 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v48;
  v55[2] = CFSTR(":remote_id");
  objc_msgSend(*(id *)(a1 + 32), "remoteIDObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v49;
  v55[3] = CFSTR(":read");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v50, "read"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v46;
  v55[4] = CFSTR(":deleted");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v47, "deleted"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v44;
  v55[5] = CFSTR(":replied");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v45, "replied"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v42;
  v55[6] = CFSTR(":flagged");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v43, "flagged"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v39;
  v55[7] = CFSTR(":draft");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v41, "draft"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v37;
  v55[8] = CFSTR(":forwarded");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v38, "forwarded"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v13;
  v55[9] = CFSTR(":redirected");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "redirected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v16;
  v55[10] = CFSTR(":junk_level_set_by_user");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "junkLevelSetByUser"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v19;
  v55[11] = CFSTR(":junk_level");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "junkLevel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v22;
  v55[12] = CFSTR(":flag_color");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "flagColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
  LODWORD(v15) = objc_msgSend(v53, "executeWithNamedBindings:usingBlock:error:", v52, 0, &v54);
  v26 = v54;
  v27 = v26;
  if (!(_DWORD)v15)
  {
    objc_msgSend(v26, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
    {
      v31 = objc_msgSend(v27, "code") == 19;

      if (v31)
      {
        objc_msgSend(v27, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE18]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

        v35 = *(_BYTE **)(a1 + 56);
        if (v35 && v34 == 787 || (v35 = *(_BYTE **)(a1 + 64)) != 0 && v34 == 2067)
          *v35 = 1;

        v29 = 1;
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v51, "handleError:message:", v27, CFSTR("Adding server message"));
    v29 = 0;
LABEL_20:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "labels");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "supportsLabels") && objc_msgSend(v28, "count"))
    v29 = objc_msgSend(*(id *)(a1 + 40), "_addLabels:removeLabels:forUID:connection:", v28, 0, objc_msgSend(*(id *)(a1 + 32), "imapUID"), v51);
  else
    v29 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v29;

LABEL_21:
  return v29;
}

- (BOOL)attachMessage:(int64_t)a3 toServerMessageWithRemoteID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  if (-[EDServerMessagePersistence useNumericSearch](self, "useNumericSearch"))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "ef_quotedSQLEscapedString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[EDServerMessagePersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence attachMessage:toServerMessageWithRemoteID:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__EDServerMessagePersistence_attachMessage_toServerMessageWithRemoteID___block_invoke;
  v13[3] = &unk_1E949C190;
  v15 = &v17;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v13);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v8;
}

uint64_t __72__EDServerMessagePersistence_attachMessage_toServerMessageWithRemoteID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE server_messages SET message = %lld WHERE (mailbox = %lld) AND (remote_id = %@)"), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "mailboxID"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", v4, CFSTR("updating server message"));

  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v5;
}

- (BOOL)deleteServerMessagesWithRemoteIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[EDServerMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence deleteServerMessagesWithRemoteIDs:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__EDServerMessagePersistence_deleteServerMessagesWithRemoteIDs___block_invoke;
  v9[3] = &unk_1E949AF00;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

uint64_t __64__EDServerMessagePersistence_deleteServerMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_remoteIDStringForRemoteIDArray:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM server_messages WHERE (mailbox = %lld) AND (remote_id in (%@))"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", v5, CFSTR("removing server messages"));

  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v6;
}

- (BOOL)deleteAllServerMessagesInMailbox
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[EDServerMessagePersistence database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence deleteAllServerMessagesInMailbox]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__EDServerMessagePersistence_deleteAllServerMessagesInMailbox__block_invoke;
  v6[3] = &unk_1E949BBD8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __62__EDServerMessagePersistence_deleteAllServerMessagesInMailbox__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM server_messages WHERE mailbox = %llu"), objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", v4, CFSTR("removing all server messages"));

  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return v5;
}

- (BOOL)applyFlagChange:(id)a3 toMessagesWithRemoteIDs:(id)a4
{
  id v6;
  id v7;
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
  id v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasChanges") & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "readChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("read = %d"), objc_msgSend(v6, "read"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
    if (objc_msgSend(v6, "deletedChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleted = %d"), objc_msgSend(v6, "deleted"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    if (objc_msgSend(v6, "repliedChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("replied = %d"), objc_msgSend(v6, "replied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
    if (objc_msgSend(v6, "flaggedChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flagged = %d"), objc_msgSend(v6, "flagged"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

    }
    if (objc_msgSend(v6, "draftChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("draft = %d"), objc_msgSend(v6, "draft"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);

    }
    if (objc_msgSend(v6, "forwardedChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("forwarded = %d"), objc_msgSend(v6, "forwarded"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

    }
    if (objc_msgSend(v6, "redirectedChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("redirected = %d"), objc_msgSend(v6, "redirected"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v15);

    }
    if (objc_msgSend(v6, "junkLevelSetByUserChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("junk_level_set_by_user = %d"), objc_msgSend(v6, "junkLevelSetByUser"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v16);

    }
    if (objc_msgSend(v6, "junkLevelChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("junk_level = %d"), objc_msgSend(v6, "junkLevel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v17);

    }
    if (objc_msgSend(v6, "flagColorChanged"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flag_color = %d"), objc_msgSend(v6, "flagColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v18);

    }
    -[EDServerMessagePersistence _remoteIDStringForRemoteIDArray:](self, "_remoteIDStringForRemoteIDArray:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("UPDATE server_messages SET %@ WHERE (mailbox = %lld) AND (remote_id in (%@))"), v21, -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    -[EDServerMessagePersistence database](self, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence applyFlagChange:toMessagesWithRemoteIDs:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__EDServerMessagePersistence_applyFlagChange_toMessagesWithRemoteIDs___block_invoke;
    v28[3] = &unk_1E949BBD8;
    v30 = &v31;
    v25 = v22;
    v29 = v25;
    objc_msgSend(v23, "__performWriteWithCaller:usingBlock:", v24, v28);

    v26 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    v26 = 1;
  }

  return v26;
}

uint64_t __70__EDServerMessagePersistence_applyFlagChange_toMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", *(_QWORD *)(a1 + 32), CFSTR("Setting flags"));
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v4;
}

- (BOOL)applySortedFlags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[EDServerMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence applySortedFlags:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__EDServerMessagePersistence_applySortedFlags___block_invoke;
  v9[3] = &unk_1E949AF00;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

BOOL __47__EDServerMessagePersistence_applySortedFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD aBlock[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDServerMessagePersistence_applySortedFlags___block_invoke_2;
  aBlock[3] = &unk_1E94A1B50;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v4 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        if (*(_BYTE *)(v9 + 24))
        {
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", v10, CFSTR("Setting flags"), (_QWORD)v13);

        }
        else
        {
          *(_BYTE *)(v9 + 24) = 0;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

  v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  return v11;
}

id __47__EDServerMessagePersistence_applySortedFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("UPDATE server_messages SET "));
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "read"))
    v6 = CFSTR("read = 1");
  else
    v6 = CFSTR("read = 0");
  objc_msgSend(v4, "appendString:", v6);

  objc_msgSend(v3, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "deleted"))
    v8 = CFSTR(", deleted = 1");
  else
    v8 = CFSTR(", deleted = 0");
  objc_msgSend(v4, "appendString:", v8);

  objc_msgSend(v3, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "replied"))
    v10 = CFSTR(", replied = 1");
  else
    v10 = CFSTR(", replied = 0");
  objc_msgSend(v4, "appendString:", v10);

  objc_msgSend(v3, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "flagged"))
    v12 = CFSTR(", flagged = 1");
  else
    v12 = CFSTR(", flagged = 0");
  objc_msgSend(v4, "appendString:", v12);

  objc_msgSend(v3, "second");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "draft"))
    v14 = CFSTR(", draft = 1");
  else
    v14 = CFSTR(", draft = 0");
  objc_msgSend(v4, "appendString:", v14);

  objc_msgSend(v3, "second");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "forwarded"))
    v16 = CFSTR(", forwarded = 1");
  else
    v16 = CFSTR(", forwarded = 0");
  objc_msgSend(v4, "appendString:", v16);

  objc_msgSend(v3, "second");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "redirected"))
    v18 = CFSTR(", redirected = 1");
  else
    v18 = CFSTR(", redirected = 0");
  objc_msgSend(v4, "appendString:", v18);

  objc_msgSend(v3, "second");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", junk_level = %d"), objc_msgSend(v19, "junkLevel"));

  objc_msgSend(v3, "second");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", flag_color = %d"), objc_msgSend(v20, "flagColor"));

  v21 = objc_msgSend(*(id *)(a1 + 32), "mailboxID");
  objc_msgSend(v3, "first");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" WHERE (mailbox = %lld) AND (remote_id = %@)"), v21, v22);

  return v4;
}

- (void)enumerateUIDsInRanges:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  EDServerMessagePersistence *v12;
  id v13;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "count"))
  {
    -[EDServerMessagePersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence enumerateUIDsInRanges:withBlock:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke;
    v10[3] = &unk_1E94A1B78;
    v11 = v9;
    v12 = self;
    v13 = v6;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v10);

  }
}

uint64_t __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke(id *a1, void *a2)
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t j;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v22 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(a1[4], "count"); ++i)
    objc_msgSend(v3, "addObject:", CFSTR("(? <= remote_id AND remote_id < ?)"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" OR "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT remote_id FROM server_messages WHERE mailbox = ? AND (%@) ORDER BY remote_id"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1[5], "mailboxID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 0; j < objc_msgSend(a1[4], "count"); ++j)
  {
    objc_msgSend(a1[4], "objectAtIndexedSubscript:", j);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeValue");
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 + v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

  }
  objc_msgSend(v22, "preparedStatementForQueryString:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke_2;
  v24[3] = &unk_1E949B150;
  v25 = a1[6];
  v23 = 0;
  v19 = objc_msgSend(v18, "executeWithIndexedBindings:usingBlock:error:", v10, v24, &v23);
  v20 = v23;

  return v19;
}

void __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  if (v4 <= 0xFFFFFFFFLL)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateUIDsInIndexSet:(id)a3 includingJSON:(id)a4 excludingJSON:(id)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  EDServerMessagePersistence *v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EDServerMessagePersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence enumerateUIDsInIndexSet:includingJSON:excludingJSON:withBlock:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke;
  v20[3] = &unk_1E94A1BA0;
  v19 = v10;
  v21 = v19;
  v22 = self;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v20);

}

uint64_t __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ed_uidQueryExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E08];
  v22 = CFSTR(":mailbox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR(":include"));
    v10 = CFSTR("remote_id IN (SELECT value FROM json_each(:include))");
  }
  else
  {
    v10 = CFSTR("0");
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR(":exclude"));
    v12 = CFSTR("(SELECT value FROM json_each(:exclude))");
  }
  else
  {
    v12 = CFSTR("()");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT remote_id FROM server_messages WHERE mailbox = :mailbox AND ((%@) OR (%@)) AND (NOT remote_id IN %@) ORDER BY remote_id"), v4, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_cold_1((uint64_t)v13, (uint64_t)v8, v14);

  objc_msgSend(v3, "preparedStatementForQueryString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_288;
  v20[3] = &unk_1E949B150;
  v21 = *(id *)(a1 + 64);
  v19 = 0;
  v16 = objc_msgSend(v15, "executeWithNamedBindings:usingBlock:error:", v8, v20, &v19);
  v17 = v19;

  return v16;
}

void __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_288(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  if (v4 <= 0xFFFFFFFFLL)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)downloadStateForUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  EDServerMessagePersistence *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDServerMessagePersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence downloadStateForUIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke;
  v13[3] = &unk_1E949B0B8;
  v8 = v4;
  v14 = v8;
  v15 = self;
  v9 = v5;
  v16 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  v10 = v16;
  v11 = v9;

  return v11;
}

uint64_t __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "ed_uidQueryExpressionWithTableName:", CFSTR("server_messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT message_global_data.download_state, server_messages.remote_id FROM message_global_data JOIN messages ON message_global_data.rowid == messages.global_message_id JOIN server_messages ON messages.rowid == server_messages.message WHERE server_messages.mailbox == :mailbox AND %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR(":mailbox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1[5], "mailboxID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke_2;
  v13[3] = &unk_1E949AF78;
  v14 = a1[6];
  v12 = 0;
  v9 = objc_msgSend(v6, "executeWithNamedBindings:usingBlock:error:", v8, v13, &v12);
  v10 = v12;

  return v9;
}

void __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "int64Value");

  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFD)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v8);

  }
}

- (void)setDownloadStateForUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  EDServerMessagePersistence *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  EDServerMessagePersistence *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[EDServerMessagePersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence setDownloadStateForUIDs:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke;
  v10[3] = &unk_1E949AF00;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v10);

  +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15[3];
    *(_DWORD *)buf = 134218240;
    v19 = self;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Updated download_state for %u rows.", buf, 0x12u);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke_2;
  v7[3] = &unk_1E94A1BC8;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return 1;
}

void __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "ed_uidQueryExpressionWithTableName:", CFSTR("server_messages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE message_global_data SET download_state = :new_state WHERE rowid in (SELECT messages.global_message_id FROM server_messages JOIN messages ON messages.rowid == server_messages.message WHERE server_messages.mailbox == :mailbox AND %@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR(":mailbox");
  v16[0] = v5;
  v14 = 0;
  v15[0] = CFSTR(":new_state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = objc_msgSend(v8, "executeWithNamedBindings:rowsChanged:error:", v10, &v14, &v13);
  v12 = v13;

  if ((v11 & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v14;
  else
    objc_msgSend(*(id *)(a1 + 32), "handleError:message:", v12, CFSTR("Updating download state."));

}

- (void)enumerateMessageBatchLimitUIDsWithWindow:(_NSRange)a3 batchSize:(int64_t)a4 newUIDCount:(int64_t)a5 block:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  int64_t v19;

  length = a3.length;
  location = a3.location;
  v13 = a6;
  if (a4 >= 1)
  {
    -[EDServerMessagePersistence database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence enumerateMessageBatchLimitUIDsWithWindow:batchSize:newUIDCount:block:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke;
    v14[3] = &unk_1E94A1BF0;
    v14[4] = self;
    v16 = a4;
    v17 = location;
    v18 = length;
    v19 = a5;
    v15 = v13;
    objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v14);

  }
}

uint64_t __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17[0] = CFSTR(":mailbox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = CFSTR(":batch_size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  v17[2] = CFSTR(":lower");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR(":upper");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 64) - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v7;
  v17[4] = CFSTR(":new_uid_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("WITH cte AS NOT materialized   (SELECT remote_id   FROM server_messages   WHERE mailbox = :mailbox    AND remote_id IS NOT NULL    AND remote_id >= :lower    AND remote_id <= :upper  ORDER BY remote_id DESC) SELECT remote_id, rn FROM   (SELECT *, row_number() OVER () AS rn FROM cte) WHERE rn == 1   OR (rn + :new_uid_count) % :batch_size == 1   OR rn == (SELECT count(*) FROM cte); "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke_2;
  v15[3] = &unk_1E949B150;
  v16 = *(id *)(a1 + 40);
  v14 = 0;
  v11 = objc_msgSend(v10, "executeWithNamedBindings:usingBlock:error:", v9, v15, &v14);
  v12 = v14;

  return v11;
}

void __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "int64Value");

  if (v4 <= 0xFFFFFFFFLL)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)groupInsideWriteTransactionWithDescription:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v6 = a4;
  -[EDServerMessagePersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__EDServerMessagePersistence_groupInsideWriteTransactionWithDescription_block___block_invoke;
  v10[3] = &unk_1E949DD40;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v9, v10);

}

uint64_t __79__EDServerMessagePersistence_groupInsideWriteTransactionWithDescription_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (BOOL)addLabels:(id)a3 removeLabels:(id)a4 toMessagesWithRemoteIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  EDServerMessagePersistence *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  -[EDServerMessagePersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDServerMessagePersistence addLabels:removeLabels:toMessagesWithRemoteIDs:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__EDServerMessagePersistence_addLabels_removeLabels_toMessagesWithRemoteIDs___block_invoke;
  v17[3] = &unk_1E94A1C18;
  v13 = v10;
  v22 = &v23;
  v18 = v13;
  v19 = self;
  v14 = v8;
  v20 = v14;
  v15 = v9;
  v21 = v15;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

  LOBYTE(v8) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v8;
}

BOOL __77__EDServerMessagePersistence_addLabels_removeLabels_toMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
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
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_addLabels:removeLabels:forUID:connection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "integerValue", (_QWORD)v10), v3);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  return v8;
}

- (BOOL)_addLabels:(id)a3 removeLabels:(id)a4 forUID:(unsigned int)a5 connection:(id)a6
{
  uint64_t v7;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v36;
  char v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[2];
  _BYTE v60[128];
  _QWORD v61[2];
  _BYTE v62[128];
  _QWORD v63[4];

  v7 = *(_QWORD *)&a5;
  v63[2] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v36 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__33;
  v57 = __Block_byref_object_dispose__33;
  v58 = 0;
  v40 = a6;
  objc_msgSend(v40, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM server_messages WHERE remote_id = ? AND mailbox = ? LIMIT 1"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[EDServerMessagePersistence mailboxID](self, "mailboxID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __72__EDServerMessagePersistence__addLabels_removeLabels_forUID_connection___block_invoke;
  v52[3] = &unk_1E949B090;
  v52[4] = &v53;
  v37 = objc_msgSend(v39, "executeWithIndexedBindings:usingBlock:error:", v12, v52, &v51);
  v13 = v51;

  if ((v37 & 1) != 0)
  {
    if (!v54[5])
    {
LABEL_3:
      v14 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v40, "handleError:message:", v13, CFSTR("Getting server message ID"), v36);
    if (!v54[5])
    {
LABEL_27:
      v14 = 0;
      goto LABEL_28;
    }
  }
  objc_msgSend(v40, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO server_labels (server_message, label) VALUES (?, ?)"), v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = v38;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v48;
    while (2)
    {
      v19 = 0;
      v20 = v13;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v19), "persistentID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "longLongValue");

        v61[0] = v54[5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v20;
        v25 = objc_msgSend(v15, "executeWithIndexedBindings:usingBlock:error:", v24, 0, &v46);
        v13 = v46;

        if ((v25 & 1) == 0)
        {
          objc_msgSend(v40, "handleError:message:", v13, CFSTR("Adding server label"));
LABEL_25:
          v14 = 0;
          goto LABEL_26;
        }
        ++v19;
        v20 = v13;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (v17)
        continue;
      break;
    }
  }

  if ((v37 & 1) == 0)
    goto LABEL_27;
  if (!v54[5])
    goto LABEL_3;
  objc_msgSend(v40, "preparedStatementForQueryString:", CFSTR("DELETE FROM server_labels WHERE server_message = ? AND label = ?"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v36;
  v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v43;
    while (2)
    {
      v28 = 0;
      v29 = v13;
      do
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v28), "persistentID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "longLongValue");

        v59[0] = v54[5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v29;
        v34 = objc_msgSend(v15, "executeWithIndexedBindings:usingBlock:error:", v33, 0, &v41);
        v13 = v41;

        if ((v34 & 1) == 0)
        {
          objc_msgSend(v40, "handleError:message:", v13, CFSTR("Removing server label"));
          goto LABEL_25;
        }
        ++v28;
        v29 = v13;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
      v14 = 1;
      if (v26)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_26:

LABEL_28:
  _Block_object_dispose(&v53, 8);

  return v14;
}

void __72__EDServerMessagePersistence__addLabels_removeLabels_forUID_connection___block_invoke(uint64_t a1, void *a2)
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

- (id)_remoteIDStringForRemoteIDArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[EDServerMessagePersistence useNumericSearch](self, "useNumericSearch"))
    objc_msgSend(v4, "ef_filter:", &__block_literal_global_321);
  else
    objc_msgSend(v4, "valueForKey:", CFSTR("ef_quotedSQLEscapedString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__EDServerMessagePersistence__remoteIDStringForRemoteIDArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_isUnsignedIntegerString");
}

- (BOOL)supportsLabels
{
  return self->_supportsLabels;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (BOOL)useNumericSearch
{
  return self->_useNumericSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)serverMessagesForIMAPUIDs:(uint64_t)a3 limit:(os_log_t)log returnLastEntries:.cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Returned more results (%lu) than requested (%lu)", buf, 0x16u);
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, a2, a3, "Unable to read server messages with 'cleared' UIDs: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125_cold_1(int a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Number of deleted rows (%u) does not match server messages previously found (%u).", buf, 0xEu);
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_125_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, a2, a3, "Unable to delete server messages with 'cleared' UIDs: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, a2, a3, "Unable to look up existing messages based on message-id header: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "enumerateUIDs query '%{public}@', bindings: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
