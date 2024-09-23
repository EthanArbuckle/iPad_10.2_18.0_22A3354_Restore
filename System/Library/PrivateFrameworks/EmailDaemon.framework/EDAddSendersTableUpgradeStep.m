@implementation EDAddSendersTableUpgradeStep

+ (EFSQLSchema)schema
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sendersTableSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "senderAddressesTableSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnForName:", CFSTR("sender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsForeignKeyForTable:onDelete:onUpdate:", v3, 2, 0);

  v6 = objc_alloc(MEMORY[0x1E0D1F038]);
  v10[0] = v3;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTables:", v7);

  return (EFSQLSchema *)v8;
}

+ (EFSQLTableSchema)sendersTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("contact_identifier"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("bucket"), 0, &unk_1E94E4628);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("user_initiated"), 0, MEMORY[0x1E0C9AAB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("senders"), 2, v6);

  v12 = CFSTR("contact_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v8, 1);

  v11 = CFSTR("bucket");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return (EFSQLTableSchema *)v7;
}

+ (EFSQLTableSchema)senderAddressesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("sender_addresses"), 1, CFSTR("address"), v4);

  v8 = CFSTR("sender");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIndexForColumns:", v6);

  return (EFSQLTableSchema *)v5;
}

+ (int)runWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  sqlite3 *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS senders;"),
    CFSTR("Dropping senders table"));
  objc_msgSend(v4, "executeStatementString:errorMessage:", CFSTR("DROP TABLE IF EXISTS sender_addresses;"),
    CFSTR("Dropping sender_addresses table"));
  objc_msgSend(a1, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "definitionWithDatabaseName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (sqlite3 *)objc_msgSend(v4, "sqlDB");
  v8 = objc_retainAutorelease(v6);
  LODWORD(v7) = sqlite3_exec(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, 0);

  return (int)v7;
}

@end
