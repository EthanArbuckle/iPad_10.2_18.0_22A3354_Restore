@implementation EDRichLinkPersistence

+ (NSString)richLinksTableName
{
  return (NSString *)CFSTR("rich_links");
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  EDPersistenceForeignKeyPlaceholder *v8;
  void *v9;
  EDPersistenceForeignKeyPlaceholder *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[EDRichLinkPersistence richLinksTableSchema](EDRichLinkPersistence, "richLinksTableSchema", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRichLinkPersistence messagesRichLinksTableSchema](EDRichLinkPersistence, "messagesRichLinksTableSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnForName:", CFSTR("rich_link"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v5, 2, 0);

  v8 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v6, "columnForName:", CFSTR("global_message_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v8, "initWithColumn:tableName:onDelete:onUpdate:", v9, CFSTR("message_global_data"), 2, 0);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v13[0] = v5;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)richLinksTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("title"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("url"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("hash"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("rich_links"), 2, v6);

  v10 = CFSTR("hash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v8, 1);

  return v7;
}

+ (id)messagesRichLinksTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("global_message_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("rich_link"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("global_message_id");
  v9[1] = CFSTR("rich_link");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:columns:primaryKeyColumns:", CFSTR("message_rich_links"), v5, v6);

  return v7;
}

- (EDRichLinkPersistence)initWithDatabase:(id)a3
{
  id v5;
  EDRichLinkPersistence *v6;
  EDRichLinkPersistence *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDRichLinkPersistence;
  v6 = -[EDRichLinkPersistence init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

void ___ef_log_EDRichLinkPersistence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDRichLinkPersistence");
  v1 = (void *)_ef_log_EDRichLinkPersistence_log;
  _ef_log_EDRichLinkPersistence_log = (uint64_t)v0;

}

+ (id)messageRichLinksTableName
{
  return CFSTR("message_rich_links");
}

- (id)saveRichLinkData:(id)a3 globalMessageID:(int64_t)a4 basePath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDRichLinkPersistence saveRichLinkData:url:title:globalMessageID:basePath:](self, "saveRichLinkData:url:title:globalMessageID:basePath:", v10, v11, v12, a4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)saveRichLinkData:(id)a3 url:(id)a4 title:(id)a5 globalMessageID:(int64_t)a6 basePath:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  EDPersistenceDatabase *database;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  EDRichLinkPersistence *v30;
  id v31;
  id v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__28;
  v39 = __Block_byref_object_dispose__28;
  v40 = 0;
  v25 = a7;
  -[EDRichLinkPersistence _hashForRichLinkData:](self, "_hashForRichLinkData:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRichLinkPersistence saveRichLinkData:url:title:globalMessageID:basePath:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke;
  v26[3] = &unk_1E94A0670;
  v18 = v15;
  v27 = v18;
  v19 = v14;
  v28 = v19;
  v20 = v13;
  v33 = &v35;
  v34 = a6;
  v29 = v20;
  v30 = self;
  v21 = v25;
  v31 = v21;
  v22 = v12;
  v32 = v22;
  -[EDPersistenceDatabase __performWriteWithCaller:usingBlock:](database, "__performWriteWithCaller:usingBlock:", v17, v26);

  v23 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v23;
}

BOOL __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  EDPersistedRichLinkID *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v34;
  _QWORD v35[6];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v3 = a2;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("rich_links"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("hash"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("title"));
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("url"));

  v36 = 0;
  v7 = objc_msgSend(v3, "executeInsertStatement:error:", v4, &v36);
  v8 = v36;
  v9 = v8;
  *((_BYTE *)v38 + 24) = v7;
  if (v7)
  {
    v10 = -[EDPersistedRichLinkID initWithDatabaseID:]([EDPersistedRichLinkID alloc], "initWithDatabaseID:", objc_msgSend(v3, "lastInsertedDatabaseID"));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
    goto LABEL_10;
  }
  objc_msgSend(v8, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
  {
    v14 = objc_msgSend(v9, "code");

    if (v14 == 19)
    {
      v15 = objc_alloc(MEMORY[0x1E0D1F040]);
      v12 = (void *)objc_msgSend(v15, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("rich_links"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("hash"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "equalTo:", *(_QWORD *)(a1 + 32));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWhere:", v17);

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_2;
      v35[3] = &unk_1E94A04E8;
      v35[4] = *(_QWORD *)(a1 + 80);
      v35[5] = &v37;
      objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v12, v35, 0);
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to insert rich link into rich_links table: %@"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleError:message:", v9, v12);
LABEL_10:

  if (!*((_BYTE *)v38 + 24))
  {
    v26 = 0;
    v23 = v9;
    goto LABEL_26;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("message_rich_links"));
  v19 = (uint64_t *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 88));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("global_message_id"));

  v21 = a1 + 80;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "databaseID"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("rich_link"));

  v34 = v9;
  LOBYTE(v22) = objc_msgSend(v3, "executeInsertStatement:error:", v18, &v34);
  v23 = v34;

  *((_BYTE *)v38 + 24) = v22;
  if ((v22 & 1) == 0)
  {
    objc_msgSend(v23, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
    {
      v25 = objc_msgSend(v23, "code");

      if (v25 == 19)
      {
        *((_BYTE *)v38 + 24) = 1;
        goto LABEL_18;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to insert rich link with rowID %@ into message_rich_links table"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v21 + 8) + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:message:", v23, v27);

  }
LABEL_18:

  if (*((_BYTE *)v38 + 24))
  {
    objc_msgSend(*(id *)(a1 + 56), "_richLinkFileURLWithID:basePath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 64));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "fileExistsAtPath:", v30);

    if ((v31 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 72), "writeToURL:atomically:", v28, 1) & 1) == 0)
    {
      _ef_log_EDRichLinkPersistence();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_cold_1(v21, v19, v32);

    }
    v26 = *((_BYTE *)v38 + 24) != 0;
  }
  else
  {
    v26 = 0;
  }
LABEL_26:

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_2(uint64_t a1, void *a2)
{
  EDPersistedRichLinkID *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = [EDPersistedRichLinkID alloc];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDPersistedRichLinkID initWithDatabaseID:](v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)richLinkDataForPersistentID:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  EDPersistenceDatabase *database;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__28;
  v22 = __Block_byref_object_dispose__28;
  v23 = 0;
  -[EDRichLinkPersistence _richLinkFileURLWithID:basePath:](self, "_richLinkFileURLWithID:basePath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    database = self->_database;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRichLinkPersistence richLinkDataForPersistentID:basePath:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke;
    v14[3] = &unk_1E949B108;
    v15 = v6;
    v17 = &v18;
    v16 = v9;
    -[EDPersistenceDatabase __performReadWithCaller:usingBlock:](database, "__performReadWithCaller:usingBlock:", v11, v14);

  }
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("rich_links"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "databaseID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke_2;
  v11[3] = &unk_1E94A0698;
  v14 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v11, 0);

  return 1;
}

void __62__EDRichLinkPersistence_richLinkDataForPersistentID_basePath___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EDRichLinkData *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E98];
  v15 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [EDRichLinkData alloc];
  v9 = a1[4];
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDRichLinkData initWithPersistentID:title:url:data:](v8, "initWithPersistentID:title:url:data:", v9, v11, v7, a1[5]);
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)datasForPersistentIDs:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EDPersistenceDatabase *database;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  EDRichLinkPersistence *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRichLinkPersistence datasForPersistentIDs:basePath:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke;
  v14[3] = &unk_1E949B0B8;
  v11 = v6;
  v15 = v11;
  v16 = self;
  v12 = v7;
  v17 = v12;
  -[EDPersistenceDatabase __performReadWithCaller:usingBlock:](database, "__performReadWithCaller:usingBlock:", v10, v14);

  return v8;
}

uint64_t __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke_2;
  v4[3] = &unk_1E94A06C0;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v2 = (id)objc_msgSend(v1, "ef_compactMap:", v4);

  return 1;
}

id __56__EDRichLinkPersistence_datasForPersistentIDs_basePath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "richLinkDataForPersistentID:basePath:", a2, *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)richLinkPersistentIDsForGlobalMessageID:(int64_t)a3
{
  void *v5;
  EDPersistenceDatabase *database;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = (void *)objc_opt_new();
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRichLinkPersistence richLinkPersistentIDsForGlobalMessageID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke;
  v10[3] = &unk_1E949B068;
  v12 = a3;
  v8 = v5;
  v11 = v8;
  -[EDPersistenceDatabase __performReadWithCaller:usingBlock:](database, "__performReadWithCaller:usingBlock:", v7, v10);

  return v8;
}

uint64_t __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("rich_link"), CFSTR("message_rich_links"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke_2;
  v9[3] = &unk_1E949AF78;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v9, 0);

  return 1;
}

void __65__EDRichLinkPersistence_richLinkPersistentIDsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  EDPersistedRichLinkID *v4;
  void *v5;
  EDPersistedRichLinkID *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [EDPersistedRichLinkID alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rich_link"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDPersistedRichLinkID initWithDatabaseID:](v4, "initWithDatabaseID:", objc_msgSend(v5, "databaseIDValue"));
  objc_msgSend(v3, "addObject:", v6);

}

- (id)_hashForRichLinkData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const void *v6;
  CC_LONG v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  CC_SHA256(v6, v7, (unsigned __int8 *)objc_msgSend(v8, "mutableBytes"));
  objc_msgSend(v8, "ef_hexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_richLinkDirectoryURLWithBasePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  id v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _ef_log_EDRichLinkPersistence();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    v5 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("RichLinkData"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = 0;
LABEL_10:
    _ef_log_EDRichLinkPersistence();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v29);
  v8 = v29;

  if ((v7 & 1) != 0)
    goto LABEL_10;
  -[NSObject domain](v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 != (void *)*MEMORY[0x1E0CB28A8])
  {

LABEL_13:
    _ef_log_EDRichLinkPersistence();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[NSObject ef_publicDescription](v8, "ef_publicDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:].cold.3(v27, (uint64_t)v30, v18);
    }

LABEL_16:
    goto LABEL_17;
  }
  v26 = -[NSObject code](v8, "code") == 516;

  if (!v26)
    goto LABEL_13;
LABEL_17:

  return v5;
}

- (id)_richLinkFileURLWithID:(id)a3 basePath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[EDRichLinkPersistence _richLinkDirectoryURLWithBasePath:](self, "_richLinkDirectoryURLWithBasePath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)richLinkFileURLWithID:(id)a3 basePath:(id)a4
{
  -[EDRichLinkPersistence _richLinkFileURLWithID:basePath:](self, "_richLinkFileURLWithID:basePath:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)richLinkMetadataDataForPersistentID:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDRichLinkPersistence _richLinkFileURLWithID:basePath:](self, "_richLinkFileURLWithID:basePath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ef_log_EDRichLinkPersistence();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Fetched data: %@ for rich link with richLinkID:%@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    _ef_log_EDRichLinkPersistence();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find url for rich link with ID %@", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)verifyFileExistsForRichLinkID:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDRichLinkPersistence richLinkFileURLWithID:basePath:](self, "richLinkFileURLWithID:basePath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "path"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isReadableFileAtPath:", v10),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = 1;
  }
  else
  {
    _ef_log_EDRichLinkPersistence();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Unable to read rich link at URL %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (id)richLinkURLsForMessageIDs:(id)a3
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
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[EDRichLinkPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDRichLinkPersistence richLinkURLsForMessageIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke;
  v13[3] = &unk_1E949AFA0;
  v8 = v4;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  v10 = v15;
  v11 = v9;

  return v11;
}

uint64_t __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("message_rich_links"));

  v7 = (id)objc_msgSend(v6, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("rich_links"), CFSTR("rich_link"), *MEMORY[0x1E0D1EE00]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t *)(a1 + 32);
  objc_msgSend(v8, "in:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v10);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_2;
  v17[3] = &unk_1E949AF78;
  v18 = *(id *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v17, &v16);
  v11 = v16;
  _ef_log_EDRichLinkPersistence();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
      __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_2(v9, v12, v14);
  }
  else if (v13)
  {
    __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_1(v9, v12, v14);
  }

  return 1;
}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

void __77__EDRichLinkPersistence_saveRichLinkData_url_title_globalMessageID_basePath___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to persist rich link with richLinkID: %@ and messageID: %lld to database", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_richLinkDirectoryURLWithBasePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Could not find rich link directory, base path is null.", a5, a6, a7, a8, 0);
}

- (void)_richLinkDirectoryURLWithBasePath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Could not create rich links directory, path is null", a5, a6, a7, a8, 0);
}

- (void)_richLinkDirectoryURLWithBasePath:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Failed to create Rich Link data directory:\n%{public}@", (uint8_t *)a2);

}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Found rich link metadata for messages %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __51__EDRichLinkPersistence_richLinkURLsForMessageIDs___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Failed to fetch rich link metadata for messages %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

@end
