@implementation EDAddBrandIndicatorsTableUpgradeStep

+ (int)runWithConnection:(id)a3 databaseName:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  sqlite3 *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = sqlite3_exec((sqlite3 *)objc_msgSend(v6, "sqlDB"), "DROP TABLE IF EXISTS brand_indicators", 0, 0, 0);
  if (!v8)
  {
    objc_msgSend(a1, "_brandIndicatorsTableSchema");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "definitionWithDatabaseName:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (sqlite3 *)objc_msgSend(v6, "sqlDB");
    v12 = objc_retainAutorelease(v10);
    v8 = sqlite3_exec(v11, (const char *)objc_msgSend(v12, "UTF8String"), 0, 0, 0);

  }
  return v8;
}

+ (id)_brandIndicatorsTableSchema
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
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("evidence_url"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "blobColumnWithName:nullable:", CFSTR("indicator"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("indicator_hash"), 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("hash_algorithm"), 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("verified"), 0, &unk_1E94E45F8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("brand_indicators"), 2, v9);

  v15 = CFSTR("url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addUniquenessConstraintForColumns:conflictResolution:", v11, 1);

  v14[0] = CFSTR("url");
  v14[1] = CFSTR("verified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v12);

  return v10;
}

@end
