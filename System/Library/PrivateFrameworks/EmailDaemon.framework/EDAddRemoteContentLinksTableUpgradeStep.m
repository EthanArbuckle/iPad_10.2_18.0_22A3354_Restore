@implementation EDAddRemoteContentLinksTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  sqlite3 *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_remoteContentLinksTableSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "definitionWithDatabaseName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (sqlite3 *)objc_msgSend(v4, "sqlDB");
  v8 = objc_retainAutorelease(v6);
  LODWORD(v7) = sqlite3_exec(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, 0);

  return (int)v7;
}

+ (id)_remoteContentLinksTableSchema
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
  _QWORD v13[2];
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("requests"), 0, &unk_1E94E4610);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("last_seen_date"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_request_date"), 0, &unk_1E94E4610);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("remote_content_links"), 1, v7);

  v15 = CFSTR("url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", v9, 1);

  v14[0] = CFSTR("requests");
  v14[1] = CFSTR("last_request_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndexForColumns:", v10);

  v13[0] = CFSTR("requests");
  v13[1] = CFSTR("last_seen_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndexForColumns:", v11);

  return v8;
}

@end
