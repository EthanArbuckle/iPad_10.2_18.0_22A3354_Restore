@implementation MFMailMessageLibraryModifyColumnDefinitionsMigrationStep

- (MFMailMessageLibraryModifyColumnDefinitionsMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5;
  MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *v6;
  MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryModifyColumnDefinitionsMigrationStep;
  v6 = -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (EFSQLSchema)schema
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
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[9];

  v28[8] = *MEMORY[0x1E0C80C00];
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep messagesTableStubSchema](self, "messagesTableStubSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep mailboxesTableStubSchema](self, "mailboxesTableStubSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep serverMessagesTableSchema](self, "serverMessagesTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep serverLabelsTableSchema](self, "serverLabelsTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep localMessageActionsTableSchema](self, "localMessageActionsTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep actionMessagesTableSchema](self, "actionMessagesTableSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep actionLabelsTableSchema](self, "actionLabelsTableSchema");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep actionFlagsTableSchema](self, "actionFlagsTableSchema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnForName:", CFSTR("message"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAsForeignKeyForTable:onDelete:onUpdate:", v3, 3, 0);

  objc_msgSend(v5, "columnForName:", CFSTR("mailbox"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v6, "columnForName:", CFSTR("server_message"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  objc_msgSend(v6, "columnForName:", CFSTR("label"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v7, "columnForName:", CFSTR("mailbox"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v7, "columnForName:", CFSTR("source_mailbox"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v7, "columnForName:", CFSTR("destination_mailbox"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v8, "columnForName:", CFSTR("action"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 0);

  objc_msgSend(v8, "columnForName:", CFSTR("message"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAsForeignKeyForTable:onDelete:onUpdate:", v3, 3, 0);

  objc_msgSend(v8, "columnForName:", CFSTR("destination_message"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAsForeignKeyForTable:onDelete:onUpdate:", v3, 2, 0);

  objc_msgSend(v9, "columnForName:", CFSTR("action"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 0);

  objc_msgSend(v9, "columnForName:", CFSTR("label"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAsForeignKeyForTable:onDelete:onUpdate:", v4, 2, 0);

  objc_msgSend(v10, "columnForName:", CFSTR("action"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 0);

  v24 = objc_alloc(MEMORY[0x1E0D1F038]);
  v28[0] = v3;
  v28[1] = v4;
  v28[2] = v5;
  v28[3] = v6;
  v28[4] = v7;
  v28[5] = v8;
  v28[6] = v9;
  v28[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithTables:", v25);

  return (EFSQLSchema *)v26;
}

- (id)messagesTableStubSchema
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  return (id)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("messages"), 1, MEMORY[0x1E0C9AA60]);
}

- (id)mailboxesTableStubSchema
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  return (id)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("mailboxes"), 1, MEMORY[0x1E0C9AA60]);
}

- (id)serverMessagesTableSchema
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

- (id)serverLabelsTableSchema
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

- (id)localMessageActionsTableSchema
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

- (id)actionMessagesTableSchema
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

- (id)actionLabelsTableSchema
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

- (id)actionFlagsTableSchema
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

- (BOOL)performMigrationStep
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE server_messages RENAME TO server_messages_old"), CFSTR("Renaming old server_messages"));
  objc_msgSend(v4, "tableForName:", CFSTR("server_messages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "definitionWithDatabaseName:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && objc_msgSend(v3, "executeStatementString:errorMessage:", v7, CFSTR("Creating new server_messages"))
    && objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("INSERT INTO server_messages SELECT * FROM server_messages_old"), CFSTR("Populating new server_messages from old server_messages"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS server_messages_old"), CFSTR("Dropping old server_messages"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", v7, CFSTR("Creating new indexes for server_messages")))
  {
    v8 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE local_message_actions RENAME TO local_message_actions_old"), CFSTR("Renaming old local_message_actions"));
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "tableForName:", CFSTR("local_message_actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "definitionWithDatabaseName:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v3, "executeStatementString:errorMessage:", v10, CFSTR("Creating new local_message_actions"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("INSERT INTO local_message_actions SELECT * FROM local_message_actions_old"), CFSTR("Populating new local_message_actions from old local_message_actions"))&& objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS local_message_actions_old"), CFSTR("Dropping old local_message_actions")))
    {
      LOBYTE(v8) = objc_msgSend(v3, "executeStatementString:errorMessage:", v10, CFSTR("Creating new indexes for local_message_actions"));
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
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

@end
