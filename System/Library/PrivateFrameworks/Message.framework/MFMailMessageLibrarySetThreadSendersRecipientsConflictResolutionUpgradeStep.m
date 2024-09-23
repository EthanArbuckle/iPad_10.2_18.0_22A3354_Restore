@implementation MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep

+ (EFSQLTableSchema)threadSendersTableSchema
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
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("thread"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E4F6A018);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("thread");
  v15[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:conflictResolution:", CFSTR("thread_senders"), v7, v8, 5);

  v14[0] = CFSTR("address");
  v14[1] = CFSTR("thread");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v10);

  v13[0] = CFSTR("thread");
  v13[1] = CFSTR("priority");
  v13[2] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v11);

  return (EFSQLTableSchema *)v9;
}

+ (EFSQLTableSchema)threadRecipientsTableSchema
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
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("thread"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("address"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("date"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("priority"), 0, &unk_1E4F6A018);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("thread");
  v16[1] = CFSTR("type");
  v16[2] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:conflictResolution:", CFSTR("thread_recipients"), v8, v9, 5);

  v15[0] = CFSTR("address");
  v15[1] = CFSTR("thread");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v11);

  v14[0] = CFSTR("thread");
  v14[1] = CFSTR("priority");
  v14[2] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v12);

  return (EFSQLTableSchema *)v10;
}

+ (id)_schemaWithThreadsTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "threadSendersTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadRecipientsTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke((uint64_t)v6, v5, (uint64_t)CFSTR("thread"), v4);
  __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke(v7, v6, (uint64_t)CFSTR("thread"), v4);
  v8 = objc_alloc(MEMORY[0x1E0D1F038]);
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTables:", v9);

  return v10;
}

void __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a2, "columnForName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 0);

}

+ (int)runWithConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  if ((objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE thread_senders RENAME TO thread_senders_old"), CFSTR("Renaming thread_senders")) & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE thread_recipients RENAME TO thread_recipients_old"), CFSTR("Renaming thread_recipients")))
  {
    v5 = objc_alloc(MEMORY[0x1E0D1F050]);
    v6 = (void *)objc_msgSend(v5, "initWithName:rowIDType:columns:", CFSTR("threads"), 2, MEMORY[0x1E0C9AA60]);
    objc_msgSend(a1, "_schemaWithThreadsTable:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "definitionWithDatabaseName:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "executeStatementString:errorMessage:", v8, CFSTR("Creating new thread_senders and thread_recipients")) & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT INTO thread_senders SELECT * FROM thread_senders_old"), CFSTR("Repopulating thread_senders"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("INSERT INTO thread_recipients SELECT * FROM thread_recipients_old"), CFSTR("Repopulating thread_recipients"))&& objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE thread_senders_old"), CFSTR("Dropping old thread_senders")))
    {
      v9 = objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE thread_recipients_old"), CFSTR("Dropping old thread_recipients")) ^ 1;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
