@implementation EDRenameThreadsTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3 *v16;
  id v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("reference"), 0, &unk_1E94E49E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("is_originator"), 0, &unk_1E94E49E8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithName:rowIDType:columns:", CFSTR("message_references"), 1, v8);

  objc_msgSend(v9, "addIndexForColumns:", &unk_1E94E55A8);
  objc_msgSend(v9, "addIndexForColumns:", &unk_1E94E55C0);
  v10 = objc_alloc(MEMORY[0x1E0D1F050]);
  v11 = (void *)objc_msgSend(v10, "initWithName:rowIDType:columns:", CFSTR("messages"), 2, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v9, "columnForName:", CFSTR("message"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAsForeignKeyForTable:onDelete:onUpdate:", v11, 2, 0);

  objc_msgSend(v9, "definitionWithDatabaseName:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = CFSTR("INSERT INTO message_references (message, reference, is_originator) SELECT message_id, reference, IFNULL(is_originator, 0) FROM threads");
  v19[2] = CFSTR("DROP TABLE IF EXISTS threads");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (sqlite3 *)objc_msgSend(v3, "sqlDB");
  v17 = objc_retainAutorelease(v15);
  LODWORD(v16) = sqlite3_exec(v16, (const char *)objc_msgSend(v17, "UTF8String"), 0, 0, 0);

  return (int)v16;
}

@end
