@implementation _EDThreadPersistence_ThreadMessages

- (_EDThreadPersistence_ThreadMessages)initWithSQLHelper:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadObjectID:(id)a6 wrappedMessages:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _EDThreadPersistence_ThreadMessages *v17;
  _EDThreadPersistence_ThreadMessages *v18;
  uint64_t v19;
  NSArray *wrappedMessages;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_EDThreadPersistence_ThreadMessages;
  v17 = -[_EDThreadPersistence_ThreadMessages init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sqlHelper, a3);
    objc_storeStrong((id *)&v18->_messagePersistence, a4);
    v18->_threadScopeDatabaseID = a5;
    objc_storeStrong((id *)&v18->_threadObjectID, a6);
    v19 = objc_msgSend(v16, "copy");
    wrappedMessages = v18->_wrappedMessages;
    v18->_wrappedMessages = (NSArray *)v19;

  }
  return v18;
}

- (id)debugDescription
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thread scope DB ID: %lld"), -[_EDThreadPersistence_ThreadMessages threadScopeDatabaseID](self, "threadScopeDatabaseID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[_EDThreadPersistence_ThreadMessages threadObjectID](self, "threadObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("conversation ID: %lld"), objc_msgSend(v7, "conversationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ef_map:", &__block_literal_global_79);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("wrapped messages: {%@}(count: %u)"), v11, objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (EMThread)thread
{
  EMThread *thread;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EMThread *v11;
  EMThread *v12;

  thread = self->_thread;
  if (!thread)
  {
    -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_mapSelector:", sel_message);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D1E198]);
    -[_EDThreadPersistence_ThreadMessages _threadQuery](self, "_threadQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EDThreadPersistence_ThreadMessages threadObjectID](self, "threadObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithMessages:originatingQuery:threadScope:", v5, v7, v9);

    objc_msgSend(v10, "thread");
    v11 = (EMThread *)objc_claimAutoreleasedReturnValue();
    v12 = self->_thread;
    self->_thread = v11;

    thread = self->_thread;
  }
  return thread;
}

- (id)_threadQuery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D1E248];
  -[_EDThreadPersistence_ThreadMessages threadObjectID](self, "threadObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForMessagesWithThreadScope:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v8 = objc_opt_class();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTargetClass:predicate:sortDescriptors:", v8, v5, v9);

  return v10;
}

- (BOOL)addThreadReplacingExisting:(BOOL)a3 journaled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  _EDThreadPersistence_PersistedThread *v12;
  void *v13;
  void *v14;
  _EDThreadPersistence_PersistedThread *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  BOOL v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v4 = a4;
  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[_EDThreadPersistence_ThreadMessages threadObjectID](self, "threadObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "conversationID");
    -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218752;
    v24 = v18;
    v25 = 1024;
    v26 = objc_msgSend(v19, "count");
    v27 = 1024;
    v28 = v4;
    v29 = 1024;
    v30 = v5;
    _os_log_debug_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEBUG, "Adding thread %lld with %u messages. Journaled: %{BOOL}d, replace: %{BOOL}d", buf, 0x1Eu);

  }
  v8 = CFSTR("INSERT OR IGNORE INTO threads( scope,   conversation,   newest_read_message,   newest_message,   display_message,   date,   display_date,   read_later_date,   read,   flagged,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_unflagged,   has_attachments,   count,   journaled) VALUES( :scope,   :conversation_id,   :newest_read_message,   :newest_message,   :display_message,   :date,   :display_date,   :read_later_date,   :read,   :flagged,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_unflagged,   :has_attachments,   :count,   :journaled);");
  if (v5)
    v8 = CFSTR("INSERT OR REPLACE INTO threads( scope,   conversation,   newest_read_message,   newest_message,   display_message,   date,   display_date,   read_later_date,   read,   flagged,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_unflagged,   has_attachments,   count,   journaled) VALUES( :scope,   :conversation_id,   :newest_read_message,   :newest_message,   :display_message,   :date,   :display_date,   :read_later_date,   :read,   :flagged,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_unflagged,   :has_attachments,   :count,   :journaled);");
  v9 = v8;
  -[_EDThreadPersistence_ThreadMessages sqlHelper](self, "sqlHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke;
  v21[3] = &unk_1E94A2BB8;
  v21[4] = self;
  v22 = v4;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2;
  v20[3] = &unk_1E949EFC8;
  v11 = objc_msgSend(v10, "executeUpdateSQL:bindings:errorHandler:", v9, v21, v20);

  if (v11 > 1)
  {
    v12 = [_EDThreadPersistence_PersistedThread alloc];
    -[_EDThreadPersistence_ThreadMessages sqlHelper](self, "sqlHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_EDThreadPersistence_PersistedThread initWithMessages:threadDatabaseID:](v12, "initWithMessages:threadDatabaseID:", self, objc_msgSend(v14, "lastInsertedDatabaseID"));

    -[_EDThreadPersistence_PersistedThread addMailboxes](v15, "addMailboxes");
    -[_EDThreadPersistence_PersistedThread addSenders](v15, "addSenders");
    -[_EDThreadPersistence_PersistedThread addRecipientsForType:](v15, "addRecipientsForType:", 1);
    -[_EDThreadPersistence_PersistedThread addRecipientsForType:](v15, "addRecipientsForType:", 2);

  }
  return v11 > 1;
}

- (void)_collectDebuggingInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_0_6(&dword_1D2F2C000, v0, v1, "thread_scopes — count: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (id)updateThreadTableWithJournaled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _EDThreadPersistence_PersistedThread *v13;
  _EDThreadPersistence_PersistedThread *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[6];
  BOOL v28;
  _QWORD v29[7];
  _BYTE buf[24];
  unint64_t v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  +[EDThreadPersistence log](EDThreadPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[_EDThreadPersistence_ThreadMessages threadObjectID](self, "threadObjectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "conversationID");
    -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v23, "count");
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    _os_log_debug_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEBUG, "Updating thread %lld with %u messages. Journaled: %{BOOL}d", buf, 0x18u);

  }
  -[_EDThreadPersistence_ThreadMessages thread](self, "thread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conversationID");

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  -[_EDThreadPersistence_ThreadMessages sqlHelper](self, "sqlHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke;
  v27[3] = &unk_1E94A2C90;
  v27[4] = self;
  v27[5] = v8;
  v28 = v3;
  v11 = objc_msgSend(v9, "executeUpsertSQL:bindings:errorHandler:", CFSTR("INSERT INTO threads( scope,   conversation,   date,   display_date,   read_later_date,   count,   journaled,   has_unflagged,   has_attachments,   read,   flagged,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag) VALUES( :scope,   :conversation_id,   :date,   :display_date,   :read_later_date,   (SELECT count(DISTINCT ifnull(message_id, ROWID || '-fake-message-id')) FROM temp_thread_scope_message WHERE conversation_id = :conversation_id),   :journaled,   :has_unflagged,   :has_attachments,   :read,   :flagged,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag) ON CONFLICT (scope, conversation) DO UPDATE SET   date = max(date, excluded.date),   display_date = max(display_date, excluded.display_date),   read_later_date = max(read_later_date, excluded.read_later_date),   count = excluded.count,   journaled = journaled OR excluded.journaled,   has_attachments = has_attachments OR excluded.has_attachments,   has_attachments = has_attachments OR excluded.has_attachments,   read = read AND excluded.read,   flagged = flagged OR excluded.flagged,   draft = draft OR excluded.draft,   replied = replied OR excluded.replied,   forwarded = forwarded OR excluded.forwarded,   redirected = redirected OR excluded.redirected,   junk_level_set_by_user = junk_level_set_by_user OR excluded.junk_level_set_by_user,   junk_level = min(junk_level, excluded.junk_level),   has_red_flag = has_red_flag OR excluded.has_red_flag,   has_orange_flag = has_orange_flag OR excluded.has_orange_flag,   has_yellow_flag = has_yellow_flag OR excluded.has_yellow_flag,   has_green_flag = has_green_flag OR excluded.has_green_flag,   has_blue_flag = has_blue_flag OR excluded.has_blue_flag,   has_purple_flag = has_purple_flag OR excluded.has_purple_flag,   has_gray_flag = has_gray_flag OR excluded.has_gray_flag WHERE count != excluded.count;"),
          v27,
          &__block_literal_global_111);

  v31 = v11;
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
    goto LABEL_5;
  -[_EDThreadPersistence_ThreadMessages sqlHelper](self, "sqlHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = 3221225472;
  v26[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_114;
  v26[3] = &unk_1E94A2C00;
  v26[4] = self;
  v25[1] = 3221225472;
  v25[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_115;
  v25[3] = &unk_1E94A2CD8;
  v25[4] = buf;
  v26[0] = v10;
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_116;
  v24[3] = &unk_1E949B090;
  v24[4] = buf;
  v25[0] = v10;
  objc_msgSend(v12, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT ROWID FROM threads WHERE scope = :scope AND conversation = :conversation_id;"),
    v26,
    v25,
    v24);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
  {
LABEL_5:
    v13 = [_EDThreadPersistence_PersistedThread alloc];
    v14 = -[_EDThreadPersistence_PersistedThread initWithMessages:threadDatabaseID:](v13, "initWithMessages:threadDatabaseID:", self, *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    -[_EDThreadPersistence_PersistedThread updateNewestReadAndDisplayMessage](v14, "updateNewestReadAndDisplayMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D1DD68];
    v29[0] = *MEMORY[0x1E0D1DD60];
    v29[1] = v16;
    v17 = *MEMORY[0x1E0D1DD78];
    v29[2] = *MEMORY[0x1E0D1DD80];
    v29[3] = v17;
    v18 = *MEMORY[0x1E0D1DDC0];
    v29[4] = *MEMORY[0x1E0D1DDC8];
    v29[5] = v18;
    v29[6] = *MEMORY[0x1E0D1DD58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v19);

    if (-[_EDThreadPersistence_PersistedThread addMailboxes](v14, "addMailboxes"))
      objc_msgSend(v15, "addObject:", *MEMORY[0x1E0D1DE08]);
    if (-[_EDThreadPersistence_PersistedThread addSenders](v14, "addSenders"))
      objc_msgSend(v15, "addObject:", *MEMORY[0x1E0D1DE60]);
    if (-[_EDThreadPersistence_PersistedThread addRecipientsForType:](v14, "addRecipientsForType:", 1))
      objc_msgSend(v15, "addObject:", *MEMORY[0x1E0D1DE90]);
    if (-[_EDThreadPersistence_PersistedThread addRecipientsForType:](v14, "addRecipientsForType:", 2))
      objc_msgSend(v15, "addObject:", *MEMORY[0x1E0D1DD20]);

  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(buf, 8);
  return v15;
}

- (id)_newestUnreadWrappedMessagesWithNewestReadWrappedMessage:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96___EDThreadPersistence_ThreadMessages__newestUnreadWrappedMessagesWithNewestReadWrappedMessage___block_invoke;
  v11[3] = &unk_1E94A2D00;
  v7 = v5;
  v12 = v7;
  -[_EDThreadPersistence_ThreadMessages _iterateNewestUnreadWrappedMessagesInWrappedMessages:iteratorBlock:](self, "_iterateNewestUnreadWrappedMessagesInWrappedMessages:iteratorBlock:", v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v9 = v7;

  return v9;
}

- (id)_displayWrappedMessageWithNewestReadWrappedMessage:(id *)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__38;
  v16 = __Block_byref_object_dispose__38;
  v17 = 0;
  -[_EDThreadPersistence_ThreadMessages wrappedMessages](self, "wrappedMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90___EDThreadPersistence_ThreadMessages__displayWrappedMessageWithNewestReadWrappedMessage___block_invoke;
  v11[3] = &unk_1E94A2D28;
  v11[4] = &v12;
  -[_EDThreadPersistence_ThreadMessages _iterateNewestUnreadWrappedMessagesInWrappedMessages:iteratorBlock:](self, "_iterateNewestUnreadWrappedMessagesInWrappedMessages:iteratorBlock:", v6, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13[5])
  {
    objc_storeStrong(v13 + 5, v7);
    if (!v13[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDThreadPersistence_ThreadMessages.m"), 585, CFSTR("Unable to find display message"));

      if (!a3)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (a3)
LABEL_4:
    *a3 = objc_retainAutorelease(v7);
LABEL_5:
  v8 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)_iterateNewestUnreadWrappedMessagesInWrappedMessages:(id)a3 iteratorBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "message", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "flags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "read");

        if (v14)
        {
          v8 = v11;
          goto LABEL_11;
        }
        v6[2](v6, v11);
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (int64_t)threadScopeDatabaseID
{
  return self->_threadScopeDatabaseID;
}

- (EMThreadObjectID)threadObjectID
{
  return self->_threadObjectID;
}

- (NSArray)wrappedMessages
{
  return self->_wrappedMessages;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);
  objc_storeStrong((id *)&self->_wrappedMessages, 0);
  objc_storeStrong((id *)&self->_threadObjectID, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end
