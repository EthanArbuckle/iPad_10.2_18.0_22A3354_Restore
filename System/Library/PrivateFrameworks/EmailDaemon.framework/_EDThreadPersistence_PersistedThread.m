@implementation _EDThreadPersistence_PersistedThread

- (_EDThreadPersistence_PersistedThread)initWithMessages:(id)a3 threadDatabaseID:(int64_t)a4
{
  id v7;
  _EDThreadPersistence_PersistedThread *v8;
  _EDThreadPersistence_PersistedThread *v9;
  uint64_t v10;
  _EDThreadPersistence_SQLHelper *sqlHelper;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EDThreadPersistence_PersistedThread;
  v8 = -[_EDThreadPersistence_PersistedThread init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messages, a3);
    v9->_threadDatabaseID = a4;
    objc_msgSend(v7, "sqlHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    sqlHelper = v9->_sqlHelper;
    v9->_sqlHelper = (_EDThreadPersistence_SQLHelper *)v10;

  }
  return v9;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thread DB ID: %lld"), -[_EDThreadPersistence_PersistedThread threadDatabaseID](self, "threadDatabaseID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("thread scope DB ID: %lld"), objc_msgSend(v7, "threadScopeDatabaseID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[_EDThreadPersistence_PersistedThread threadObjectID](self, "threadObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("conversation ID: %lld"), objc_msgSend(v10, "conversationID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wrappedMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ef_map:", &__block_literal_global_173);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "wrappedMessages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%u wrapped messages: {%@}"), objc_msgSend(v18, "count"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (EDMessagePersistence)messagePersistence
{
  void *v2;
  void *v3;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messagePersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDMessagePersistence *)v3;
}

- (int64_t)threadScopeDatabaseID
{
  void *v2;
  int64_t v3;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "threadScopeDatabaseID");

  return v3;
}

- (EMThreadObjectID)threadObjectID
{
  void *v2;
  void *v3;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMThreadObjectID *)v3;
}

- (NSArray)wrappedMessages
{
  void *v2;
  void *v3;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wrappedMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (EMThread)thread
{
  void *v2;
  void *v3;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMThread *)v3;
}

- (id)updateNewestReadAndDisplayMessage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  -[_EDThreadPersistence_PersistedThread messages](self, "messages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "_newestUnreadWrappedMessagesWithNewestReadWrappedMessage:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDThreadPersistence_PersistedThread updateNewestReadMessage:](self, "updateNewestReadMessage:", v5);
  if (-[_EDThreadPersistence_PersistedThread updateDisplayMessageWithUnreadWrappedMessages:](self, "updateDisplayMessageWithUnreadWrappedMessages:", v4))
  {
    -[_EDThreadPersistence_PersistedThread addKeyPathsForDisplayMessageChangeToKeyPaths:](self, "addKeyPathsForDisplayMessageChangeToKeyPaths:", v6);
    if (-[_EDThreadPersistence_PersistedThread setPriorityForDisplayMessageSender](self, "setPriorityForDisplayMessageSender"))
    {
      objc_msgSend(v6, "ef_addObjectIfAbsent:", *MEMORY[0x1E0D1DE60]);
    }
  }

  return v6;
}

- (BOOL)updateNewestReadMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView](self, "_ensureTempMessagesView");
  if (v4)
  {
    -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke;
    v9[3] = &unk_1E94A2D50;
    v9[4] = self;
    v10 = v4;
    v6 = objc_msgSend(v5, "executeUpdateSQL:bindings:errorHandler:", CFSTR("UPDATE OR IGNORE threads SET  newest_read_message = :newest_read_message WHERE   rowid = :thread AND   :date > (SELECT date_received FROM temp_persisted_messages WHERE temp_persisted_messages.ROWID = threads.newest_read_message);"),
           v9,
           &__block_literal_global_180);

    v7 = v6 == 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)updateDisplayMessageWithUnreadWrappedMessages:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[6];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView](self, "_ensureTempMessagesView");
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__38;
  v34 = __Block_byref_object_dispose__38;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__38;
  v28 = __Block_byref_object_dispose__38;
  v29 = 0;
  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke;
  v23[3] = &unk_1E94A2C00;
  v23[4] = self;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_184;
  v22[3] = &unk_1E94A04E8;
  v22[4] = &v30;
  v22[5] = &v24;
  v7 = objc_msgSend(v5, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT   (SELECT date_received FROM temp_persisted_messages    WHERE temp_persisted_messages.ROWID = threads.newest_read_message),   (SELECT date_received FROM temp_persisted_messages    WHERE temp_persisted_messages.ROWID = threads.display_message) FROM threads WHERE threads.ROWID = :thread;"),
         v23,
         &__block_literal_global_183,
         v22);

  if ((v7 & 1) != 0)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = *MEMORY[0x1E0D1DC08];
    v8 = v21;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_185;
    v17[3] = &unk_1E94A2DB8;
    v17[4] = &v30;
    v17[5] = &v24;
    v17[6] = &v18;
    objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v17);
    v9 = v19[3];
    if (v9 == v8 || !v9)
    {
      if (!objc_msgSend((id)v31[5], "ef_isLaterThanDate:", v25[5]))
      {
        v12 = 0;
        goto LABEL_10;
      }
      -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_193;
      v15[3] = &unk_1E94A2C00;
      v15[4] = self;
      v11 = objc_msgSend(v10, "executeUpdateSQL:bindings:errorHandler:", CFSTR("UPDATE OR IGNORE threads SET   display_message = threads.newest_read_message WHERE threads.ROWID = :thread ;"),
              v15,
              &__block_literal_global_195);
    }
    else
    {
      -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_3;
      v16[3] = &unk_1E94A2DE0;
      v16[4] = self;
      v16[5] = &v18;
      v11 = objc_msgSend(v10, "executeUpdateSQL:bindings:errorHandler:", CFSTR("UPDATE OR IGNORE threads SET   display_message = :display_message WHERE ROWID = :thread ;"),
              v16,
              &__block_literal_global_189);
    }
    v13 = v11;

    v12 = v13 == 2;
LABEL_10:
    _Block_object_dispose(&v18, 8);
    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v12;
}

- (void)addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D1DE78];
  v6[0] = *MEMORY[0x1E0D1DE70];
  v6[1] = v4;
  v6[2] = *MEMORY[0x1E0D1DD70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v5);

}

- (BOOL)addMailboxes
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v14;
  NSObject *obj;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[32];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[_EDThreadPersistence_PersistedThread _mailboxDatabaseIDsForWrappedMessages](self, "_mailboxDatabaseIDsForWrappedMessages");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  v14 = v4 != 0;
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0D1DC08];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke;
        v16[3] = &unk_1E94A2D50;
        v16[4] = self;
        v16[5] = v9;
        v11 = objc_msgSend(v10, "executeUpsertSQL:bindings:errorHandler:", CFSTR("INSERT OR IGNORE INTO thread_mailboxes (thread, mailbox) VALUES (:thread, :mailbox);"),
                v16,
                &__block_literal_global_200);

        if (v11)
          v12 = v11 == v7;
        else
          v12 = 1;
        if (!v12)
          ++v5;
      }
      v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);

    if (v5 < 1)
    {
      v14 = 0;
      goto LABEL_18;
    }
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[_EDThreadPersistence_PersistedThread addMailboxes].cold.1((uint64_t)v21, v5, -[_EDThreadPersistence_PersistedThread threadDatabaseID](self, "threadDatabaseID"));
  }

LABEL_18:
  return v14;
}

- (id)_mailboxDatabaseIDsForWrappedMessages
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_EDThreadPersistence_PersistedThread wrappedMessages](self, "wrappedMessages", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "message");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mailboxObjectIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[_EDThreadPersistence_PersistedThread messagePersistence](self, "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mailboxPersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)addSenders
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  v3 = -[_EDThreadPersistence_PersistedThread currentSenderCounts](self, "currentSenderCounts");
  -[_EDThreadPersistence_PersistedThread senderDatabaseIDsAndDates](self, "senderDatabaseIDsAndDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDThreadPersistence_PersistedThread addSenders:](self, "addSenders:", v4);
  v5 = -[_EDThreadPersistence_PersistedThread setPriorityForDisplayMessageSender](self, "setPriorityForDisplayMessageSender")|| v3 != objc_msgSend(v4, "count");

  return v5;
}

- (unint64_t)currentSenderCounts
{
  _EDThreadPersistence_PersistedThread *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke;
  v7[3] = &unk_1E94A2C00;
  v7[4] = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_205;
  v6[3] = &unk_1E949B090;
  LOBYTE(v2) = objc_msgSend(v3, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT count(address) as count FROM thread_senders WHERE thread == :thread;"),
                 v7,
                 &__block_literal_global_204,
                 v6);

  if ((v2 & 1) != 0)
    v4 = v9[3];
  else
    v4 = 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)senderDatabaseIDsAndDates
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView](self, "_ensureTempMessagesView");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates__block_invoke_211;
  v7[3] = &unk_1E949AF78;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT temp_persisted_messages.sender, temp_persisted_messages.date_received FROM temp_persisted_messages;"),
    &__block_literal_global_209,
    &__block_literal_global_210,
    v7);

  return v5;
}

- (BOOL)addSenders:(id)a3
{
  int v4;
  NSObject *v5;
  _QWORD v7[5];
  __CFString *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke;
  v7[3] = &unk_1E94A2EA8;
  v7[4] = self;
  v8 = CFSTR("INSERT INTO thread_senders( thread,   address,   date) VALUES( :thread,   :address,   :date) ON CONFLICT (thread, address) DO UPDATE SET   date = max(date, excluded.date) ;");
  v9 = &v10;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = *((_DWORD *)v11 + 6);
  if (v4 >= 1)
  {
    +[EDThreadPersistence log](EDThreadPersistence, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_EDThreadPersistence_PersistedThread addSenders:].cold.1((uint64_t)v14, *((_DWORD *)v11 + 6), -[_EDThreadPersistence_PersistedThread threadDatabaseID](self, "threadDatabaseID"));

  }
  _Block_object_dispose(&v10, 8);
  return v4 > 0;
}

- (BOOL)setPriorityForDisplayMessageSender
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView](self, "_ensureTempMessagesView");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v3 = *MEMORY[0x1E0D1DC08];
  v27 = *MEMORY[0x1E0D1DC08];
  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v22[4] = &v24;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke;
  v23[3] = &unk_1E94A2C00;
  v23[4] = self;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_225;
  v22[3] = &unk_1E949B090;
  v6 = objc_msgSend(v4, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT address FROM thread_senders WHERE thread == :thread AND priority == 1;"),
         v23,
         &__block_literal_global_224,
         v22);

  if ((v6 & 1) != 0)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = v3;
    -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = &v18;
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_228;
    v17[3] = &unk_1E94A2C00;
    v17[4] = self;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_230;
    v16[3] = &unk_1E949B090;
    v8 = objc_msgSend(v7, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT sender FROM temp_persisted_messages WHERE ROWID IN (SELECT display_message FROM threads WHERE ROWID == :thread);"),
           v17,
           &__block_literal_global_229,
           v16);

    if ((v8 & 1) != 0 && v25[3] != v19[3])
    {
      -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_233;
      v15[3] = &unk_1E94A2C00;
      v15[4] = self;
      v11 = objc_msgSend(v10, "executeUpdateSQL:bindings:errorHandler:", CFSTR("UPDATE thread_senders SET priority = 0 WHERE thread == :thread AND priority == 1;"),
              v15,
              &__block_literal_global_235);

      if (v11)
      {
        -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_238;
        v14[3] = &unk_1E94A2DE0;
        v14[4] = self;
        v14[5] = &v18;
        objc_msgSend(v12, "executeUpdateSQL:bindings:errorHandler:", CFSTR("UPDATE thread_senders SET priority = 1 WHERE thread == :thread AND address == :address;"),
          v14,
          &__block_literal_global_240);

      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v24, 8);
  return v9;
}

- (BOOL)addRecipientsForType:(unint64_t)a3
{
  void *v5;

  -[_EDThreadPersistence_PersistedThread recipientDatabaseIDsAndDatesForRecipientType:](self, "recipientDatabaseIDsAndDatesForRecipientType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_EDThreadPersistence_PersistedThread addRecipients:ofType:](self, "addRecipients:ofType:", v5, a3);

  return a3;
}

- (id)recipientDatabaseIDsAndDatesForRecipientType:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView](self, "_ensureTempMessagesView");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke;
  v11[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
  v11[4] = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType___block_invoke_247;
  v9[3] = &unk_1E949AF78;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "executeSelectSQL:bindings:errorHandler:rowHandler:", CFSTR("SELECT recipients.address, temp_persisted_messages.date_received FROM recipients JOIN temp_persisted_messages ON recipients.message = temp_persisted_messages.ROWID WHERE recipients.type = :recipients_type;"),
    v11,
    &__block_literal_global_246,
    v9);

  return v7;
}

- (BOOL)addRecipients:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  int64_t v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke;
    v13[3] = &unk_1E94A2F98;
    v13[5] = &v14;
    v13[6] = a4;
    v13[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
    v7 = *((_DWORD *)v15 + 6);
    v8 = v7 > 0;
    if (v7 >= 1)
    {
      +[EDThreadPersistence log](EDThreadPersistence, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = *((_DWORD *)v15 + 6);
        v12 = -[_EDThreadPersistence_PersistedThread threadDatabaseID](self, "threadDatabaseID");
        *(_DWORD *)buf = 67109632;
        v19 = v11;
        v20 = 1024;
        v21 = a4;
        v22 = 2048;
        v23 = v12;
        _os_log_debug_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEBUG, "Added/updated %u type %u recipient(s) for thread DB ID %lld.", buf, 0x18u);
      }

    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_ensureTempMessagesView
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_9(&dword_1D2F2C000, a2, a3, "Found no rows for thread DB ID %lld.", (uint8_t *)a1);
}

- (void)dropTemporaryView
{
  id v2;

  -[_EDThreadPersistence_PersistedThread sqlHelper](self, "sqlHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeSQL:errorHandler:", CFSTR("DROP VIEW IF EXISTS temp_persisted_messages;"),
    &__block_literal_global_272);

}

- (_EDThreadPersistence_ThreadMessages)messages
{
  return self->_messages;
}

- (int64_t)threadDatabaseID
{
  return self->_threadDatabaseID;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (void)addMailboxes
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_11_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_8_3(&dword_1D2F2C000, "Added %u mailbox(es) for thread DB ID %lld.", v3, v4);
}

- (void)addSenders:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_11_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_8_3(&dword_1D2F2C000, "Added/changed %u sender(s) for thread DB ID %lld.", v3, v4);
}

@end
