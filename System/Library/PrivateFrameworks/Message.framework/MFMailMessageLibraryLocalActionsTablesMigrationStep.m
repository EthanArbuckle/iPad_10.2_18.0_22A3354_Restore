@implementation MFMailMessageLibraryLocalActionsTablesMigrationStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MFMailMessageLibraryLocalActionsTablesMigrationStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1)
    dispatch_once(&log_onceToken_14, block);
  return (id)log_log_14;
}

void __58__MFMailMessageLibraryLocalActionsTablesMigrationStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;

}

- (MFMailMessageLibraryLocalActionsTablesMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5;
  MFMailMessageLibraryLocalActionsTablesMigrationStep *v6;
  MFMailMessageLibraryLocalActionsTablesMigrationStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryLocalActionsTablesMigrationStep;
  v6 = -[MFMailMessageLibraryLocalActionsTablesMigrationStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (BOOL)performMigrationStep
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
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[16];

  v31[14] = *MEMORY[0x1E0C80C00];
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _serverMessagesTableDefinition](self, "_serverMessagesTableDefinition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v24;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _serverMessagesMessageIndexDefinition](self, "_serverMessagesMessageIndexDefinition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _serverLabelsTableDefinition](self, "_serverLabelsTableDefinition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v22;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _localMessageActionsTableDefinition](self, "_localMessageActionsTableDefinition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _localMessageActionsMailboxRowIDIndexDefinition](self, "_localMessageActionsMailboxRowIDIndexDefinition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v20;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionMessagesTableDefinition](self, "_actionMessagesTableDefinition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v19;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionMessagesActionIndexDefinition](self, "_actionMessagesActionIndexDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v4;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionMessagesMessageIndexDefinition](self, "_actionMessagesMessageIndexDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v5;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionMessagesDestinationMessageIndexDefinition](self, "_actionMessagesDestinationMessageIndexDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v6;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionLabelsTableDefinition](self, "_actionLabelsTableDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v7;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionLabelsActionIndexDefinition](self, "_actionLabelsActionIndexDefinition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v8;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionLabelsLabelIndexDefinition](self, "_actionLabelsLabelIndexDefinition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v9;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionFlagsTableDefinition](self, "_actionFlagsTableDefinition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v10;
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _actionFlagsActionIndexDefinition](self, "_actionFlagsActionIndexDefinition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "executeStatementString:errorMessage:", v12, CFSTR("Creating server messages and local actions tables"))|| !-[MFMailMessageLibraryLocalActionsTablesMigrationStep _populateServerMessages](self, "_populateServerMessages"))
  {
    goto LABEL_14;
  }
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep _offlineCacheOperations](self, "_offlineCacheOperations");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "translateToLocalActionWithConnection:", v3) & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE offline_cache_operations"), CFSTR("Dropping offline_cache_operations")))v17 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE offline_cache_replay_data"), CFSTR("Dropping offline_cache_replay_data"));
  else
LABEL_14:
    v17 = 0;

  return v17;
}

- (BOOL)_populateServerMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MFMailMessageLibraryLocalActionsTablesMigrationStep connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", CFSTR("message"));
  objc_msgSend(v4, "addObject:", CFSTR("messages.ROWID"));
  objc_msgSend(v3, "addObject:", CFSTR("mailbox"));
  objc_msgSend(v4, "addObject:", CFSTR("messages.mailbox"));
  objc_msgSend(v3, "addObject:", CFSTR("remote_id"));
  objc_msgSend(v4, "addObject:", CFSTR("messages.remote_id"));
  objc_msgSend(v3, "addObject:", CFSTR("read"));
  objc_msgSend(v4, "addObject:", CFSTR("messages.flags & 1"));
  objc_msgSend(v3, "addObject:", CFSTR("deleted"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 1)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("replied"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 2)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("flagged"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 4)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("draft"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 6)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("forwarded"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 8)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("redirected"));
  objc_msgSend(v4, "addObject:", CFSTR("(messages.flags & (1 << 9)) != 0"));
  objc_msgSend(v3, "addObject:", CFSTR("junk_level_set_by_user"));
  objc_msgSend(v4, "addObject:", CFSTR("0"));
  objc_msgSend(v3, "addObject:", CFSTR("junk_level"));
  objc_msgSend(v4, "addObject:", CFSTR("(((messages.flags & (1 << 21)) != 0) AND ((messages.flags & (1 << 31)) == 0)) | ((((messages.flags & (1 << 21)) == 0) AND ((messages.flags & (1 << 31)) != 0)) << 1)"));
  objc_msgSend(v3, "addObject:", CFSTR("flag_color"));
  objc_msgSend(v4, "addObject:", CFSTR("0"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO server_messages (%@) SELECT %@ FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.ROWID WHERE %@"), v6, v7, CFSTR("((messages.flags & (1 << 32)) == 0) AND (mailboxes.url LIKE 'imap://%%')"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v2, "executeStatementString:errorMessage:", v8, CFSTR("Creating server_messages from messages"));
  return (char)v6;
}

- (id)_offlineCacheOperations
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MFMailMessageLibraryLocalActionsTablesMigrationStep connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preparedStatementForQueryString:", CFSTR("SELECT operation_data FROM offline_cache_operations WHERE completed = '0' ORDER BY rowid ASC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke;
  v13[3] = &unk_1E4E8A048;
  v6 = v3;
  v14 = v6;
  v12 = 0;
  v7 = objc_msgSend(v5, "executeUsingBlock:error:", v13, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
    objc_msgSend(v4, "handleError:message:", v8, CFSTR("getting offline cache operations"));
  v9 = v14;
  v10 = v6;

  return v10;
}

void __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
}

- (id)_serverMessagesTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS server_messages (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL, mailbox INTEGER NOT NULL REFERENCES mailboxes(ROWID) ON DELETE CASCADE, sequence_identifier INTEGER, read INTEGER NOT NULL, deleted INTEGER NOT NULL, replied INTEGER NOT NULL, flagged INTEGER NOT NULL, draft INTEGER NOT NULL, forwarded INTEGER NOT NULL, redirected INTEGER NOT NULL, junk_level_set_by_user INTEGER NOT NULL, junk_level INTEGER NOT NULL, flag_color INTEGER NOT NULL, remote_id INTEGER NOT NULL, UNIQUE(mailbox, remote_id) ON CONFLICT ABORT);");
}

- (id)_serverMessagesMessageIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS server_messages_message_index ON server_messages(message);");
}

- (id)_serverLabelsTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS server_labels (server_message INTEGER REFERENCES server_messages(ROWID) ON DELETE CASCADE, label INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, PRIMARY KEY(server_message, label)) WITHOUT ROWID;");
}

- (id)_localMessageActionsTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS local_message_actions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, source_mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, destination_mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, action_type INTEGER, user_initiated INTEGER);");
}

- (id)_localMessageActionsMailboxRowIDIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS local_message_actions_mailbox_rowid_index ON local_message_actions(mailbox, ROWID);");
}

- (id)_actionMessagesTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS action_messages (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, action_phase INTEGER, message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL, remote_id INTEGER, destination_message INTEGER REFERENCES messages(ROWID) ON DELETE CASCADE);");
}

- (id)_actionMessagesActionIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_messages_action_index ON action_messages(action);");
}

- (id)_actionMessagesMessageIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_messages_message_index ON action_messages(message);");
}

- (id)_actionMessagesDestinationMessageIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_messages_destination_message_index ON action_messages(destination_message);");
}

- (id)_actionLabelsTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS action_labels (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, do_add INTEGER, label INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE);");
}

- (id)_actionLabelsActionIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_labels_action_index ON action_labels(action);");
}

- (id)_actionLabelsLabelIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_labels_label_index ON action_labels(label);");
}

- (id)_actionFlagsTableDefinition
{
  return CFSTR("CREATE TABLE IF NOT EXISTS action_flags (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, flag_type INTEGER, flag_value INTEGER);");
}

- (id)_actionFlagsActionIndexDefinition
{
  return CFSTR("CREATE INDEX IF NOT EXISTS action_flags_action_index ON action_flags(action);");
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Exception thrown while unarchiving offline cache operation: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end
