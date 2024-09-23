@implementation EDAttachmentPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  EDPersistenceForeignKeyPlaceholder *v8;
  void *v9;
  void *v10;
  EDPersistenceForeignKeyPlaceholder *v11;
  EDPersistenceForeignKeyPlaceholder *v12;
  void *v13;
  void *v14;
  EDPersistenceForeignKeyPlaceholder *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  +[EDAttachmentPersistence attachmentTableSchema](EDAttachmentPersistence, "attachmentTableSchema", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("hash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUniquenessConstraintForColumns:conflictResolution:", v6, 1);

  +[EDAttachmentPersistence messageAttachmentTableSchema](EDAttachmentPersistence, "messageAttachmentTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v7, "columnForName:", CFSTR("global_message_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messageGlobalDataTableName](EDMessagePersistence, "messageGlobalDataTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v8, "initWithColumn:tableName:onDelete:onUpdate:", v9, v10, 2, 0);
  v19[0] = v11;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v7, "columnForName:", CFSTR("attachment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistence attachmentsTableName](EDAttachmentPersistence, "attachmentsTableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v12, "initWithColumn:tableName:onDelete:onUpdate:", v13, v14, 0, 0);
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v18[0] = v5;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)attachmentTableSchema
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
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  +[EDAttachmentPersistence attachmentsTableName](EDAttachmentPersistence, "attachmentsTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("size"), 0, &unk_1E94E4658);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("hash"), 1, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("file_name_on_file_system"), 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("viewed_count"), 0, &unk_1E94E4658);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_viewed"), 0, &unk_1E94E4658);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("viewed_by_tapped_count"), 0, &unk_1E94E4658);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("date_last_downloaded"), 0, &unk_1E94E4658);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", v3, 2, v11);

  return v12;
}

+ (NSString)attachmentsTableName
{
  return (NSString *)CFSTR("attachments");
}

+ (id)messageAttachmentTableSchema
{
  id v2;
  void *v3;
  void *v4;
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("mime_part_number"), 1, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("remote_url"), 1, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("global_message_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("attachment"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("name"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v5;
  v35[3] = v29;
  v35[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("message_attachments"), 2, v6);

  v34[0] = CFSTR("global_message_id");
  v34[1] = CFSTR("mime_part_number");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v8, 1);

  v33[0] = CFSTR("global_message_id");
  v33[1] = CFSTR("remote_url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", v9, 1);

  v10 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v29, "columnExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isNotNull");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(v28, "columnExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "isNull");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithExpressions:", v15);

  v17 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v29, "columnExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "isNull");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  objc_msgSend(v28, "columnExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "isNotNull");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v17, "initWithExpressions:", v22);

  v24 = objc_alloc(MEMORY[0x1E0D1F020]);
  v30[0] = v16;
  v30[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithExpressions:", v25);

  objc_msgSend(v7, "addCheckConstraintForExpression:", v26);
  return v7;
}

+ (NSString)messageAttachmentsTableName
{
  return (NSString *)CFSTR("message_attachments");
}

- (EDAttachmentPersistence)initWithDatabase:(id)a3
{
  id v5;
  EDAttachmentPersistence *v6;
  EDAttachmentPersistence *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDAttachmentPersistence;
  v6 = -[EDAttachmentPersistence init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EDAttachmentPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (OS_os_log *)(id)log_log_8;
}

void __30__EDAttachmentPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

+ (NSString)globalMessageIDColumnNameInMessageAttachmentTable
{
  return (NSString *)CFSTR("global_message_id");
}

+ (NSString)attachmentIDColumnNameInMessageAttachmentsTable
{
  return (NSString *)CFSTR("attachment");
}

+ (NSString)attachmentColumnNameHash
{
  return (NSString *)CFSTR("hash");
}

+ (id)hashForAttachmentData:(id)a3
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

+ (id)hashForAttachmentName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hashForAttachmentData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)insertAttachmentMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = *MEMORY[0x1E0D1DC08];
  objc_msgSend(v4, "downloadDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("attachments"), 3);
  objc_msgSend(v4, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("size"));

  objc_msgSend(v4, "attachmentHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("hash"));

  objc_msgSend(v4, "nameOnDisk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("file_name_on_file_system"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("date_last_downloaded"));
  -[EDAttachmentPersistence database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence insertAttachmentMetadata:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__EDAttachmentPersistence_insertAttachmentMetadata___block_invoke;
  v19[3] = &unk_1E949AF00;
  v15 = v9;
  v20 = v15;
  v16 = v4;
  v21 = v16;
  v22 = &v23;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v19);

  v17 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v17;
}

uint64_t __52__EDAttachmentPersistence_insertAttachmentMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v5 = objc_msgSend(v3, "executeInsertStatement:error:", v4, &v13);
  v6 = v13;
  if ((v5 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "lastInsertedDatabaseID");
    EDAttachmentsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "attachmentHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Inserted attachment: %{public}lld hash: %{public}@ into attachments table", buf, 0x16u);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "attachmentHash");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to insert attachment with hash: %@ into attachments table"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:message:", v6, v11);

  }
  return v5;
}

- (BOOL)insertMessageAttachmentMetadata:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
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
  id v25;
  char v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;

  v5 = a3;
  v6 = objc_msgSend(v5, "globalMessageID");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("message_attachments"), 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("global_message_id"));

  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  }
  objc_msgSend(v5, "attachmentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *MEMORY[0x1E0D1DC08]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    if ((v13 & 1) == 0)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("attachment"));
  }
  objc_msgSend(v5, "mimePartNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v5, "remoteURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDAttachmentPersistence.m"), 187, CFSTR("We should never have both a mime part number and a maildrop URL for a message."));

    }
  }
  objc_msgSend(v5, "mimePartNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "mimePartNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("mime_part_number"));

  }
  objc_msgSend(v5, "remoteURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("remote_url"));

  }
  -[EDAttachmentPersistence database](self, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence insertMessageAttachmentMetadata:]");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__EDAttachmentPersistence_insertMessageAttachmentMetadata___block_invoke;
  v28[3] = &unk_1E949AF28;
  v24 = v7;
  v29 = v24;
  v25 = v5;
  v30 = v25;
  v31 = v6;
  v26 = objc_msgSend(v22, "__performWriteWithCaller:usingBlock:", v23, v28);

  return v26;
}

uint64_t __59__EDAttachmentPersistence_insertMessageAttachmentMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v21 = 0;
  v5 = objc_msgSend(v3, "executeInsertStatement:error:", v4, &v21);
  v6 = v21;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullyOrPartiallyRedactedStringForString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    EDAttachmentsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "mimePartNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v12;
      v26 = 2048;
      v27 = v13;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Inserted attachment: '%{public}@' (MIME part %{public}@) for globalMessageID: %lld into message_attachments table", buf, 0x20u);

    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
  {

    goto LABEL_10;
  }
  v15 = objc_msgSend(v7, "code") == 19;

  if (!v15)
  {
LABEL_10:
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Unable to insert attachment: %@ for globalMessageID: %lld into message_attachments table"), v10, *(_QWORD *)(a1 + 48));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:message:", v7, v19);

    goto LABEL_11;
  }
  EDAttachmentsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "mimePartNumber");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2048;
    v25 = v17;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Constraint while trying to insert attachment (MIME part %{public}@) for globalMessageID: %lld into message_attachments table", buf, 0x16u);

  }
LABEL_11:

  return v5;
}

- (BOOL)updateAttachmentIDForMessageAttachment:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "attachmentID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalMessageID");
  objc_msgSend(v3, "mimePartNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("message_attachments"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("attachment"));
  v6 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mime_part_number"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithExpressions:", v12);
  objc_msgSend(v5, "setWhereClause:", v13);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[EDAttachmentPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence updateAttachmentIDForMessageAttachment:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__EDAttachmentPersistence_updateAttachmentIDForMessageAttachment___block_invoke;
  v24[3] = &unk_1E949AF50;
  v16 = v5;
  v25 = v16;
  v28 = &v30;
  v29 = v4;
  v17 = v21;
  v26 = v17;
  v18 = v23;
  v27 = v18;
  if (objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v24))
    v19 = *((_BYTE *)v31 + 24) != 0;
  else
    v19 = 0;

  _Block_object_dispose(&v30, 8);
  return v19;
}

uint64_t __66__EDAttachmentPersistence_updateAttachmentIDForMessageAttachment___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0;
  v4 = objc_msgSend(v3, "executeUpdateStatement:rowsChanged:", a1[4], &v13);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v4;
  if ((v4 & 1) != 0)
  {
    if (v13)
    {
      EDAttachmentsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = a1[8];
        v8 = a1[5];
        v7 = a1[6];
        *(_DWORD *)buf = 138543874;
        v15 = v7;
        v16 = 2048;
        v17 = v6;
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Updated row with attachment reference: %{public}@, globalMessageID: %lld, mimePart: %{public}@", buf, 0x20u);
      }

    }
    else
    {
      EDAttachmentsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[8];
        v11 = a1[5];
        *(_DWORD *)buf = 134218242;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "No matching rows found for attachment globalMessageID: %lld, mimePart: %{public}@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    }
  }

  return v4;
}

- (id)attachmentsForGlobalMessageIDs:(id)a3
{
  id v4;
  id v5;
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
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDAttachmentPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence attachmentsForGlobalMessageIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke;
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

uint64_t __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWhere:", v9);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke_2;
  v17[3] = &unk_1E949AF78;
  v18 = *(id *)(a1 + 40);
  v16 = 0;
  v10 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v7, v17, &v16);
  v11 = v16;
  if (v11)
    objc_msgSend(v3, "handleError:message:", v11, CFSTR("Determine which attachments are referenced by globalMessageIDs"));
  EDAttachmentsLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Found attachments %{public}@ for globalMessageIDs %@", buf, 0x16u);
  }

  return v10;
}

void __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("attachment"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (id)globalMessageIDsForAttachment:(id)a3
{
  id v4;
  id v5;
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
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDAttachmentPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence globalMessageIDsForAttachment:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke;
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

uint64_t __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("attachment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWhere:", v9);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke_2;
  v17[3] = &unk_1E949AF78;
  v18 = *(id *)(a1 + 40);
  v16 = 0;
  v10 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v7, v17, &v16);
  v11 = v16;
  if (v11)
    objc_msgSend(v3, "handleError:message:", v11, CFSTR("Determine which attachments are referenced by globalMessageIDs"));
  EDAttachmentsLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Found globalMessageIDs %{public}@ for attachment %{public}@", buf, 0x16u);
  }

  return v10;
}

void __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (BOOL)removeAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[EDAttachmentPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence removeAttachments:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__EDAttachmentPersistence_removeAttachments___block_invoke;
  v9[3] = &unk_1E949AFC8;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

BOOL __45__EDAttachmentPersistence_removeAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  _BOOL8 v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EDAttachmentsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments %@ from the attachments table", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "in:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D1EFE0]);
  +[EDAttachmentPersistence attachmentsTableName](EDAttachmentPersistence, "attachmentsTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTable:where:", v9, v7);

  v15 = 0;
  v11 = objc_msgSend(v3, "executeDeleteStatement:error:", v10, &v15);
  v12 = v15;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  if (v12)
    objc_msgSend(v3, "handleError:message:", v12, CFSTR("Removing unexpected messages from attachments table"));
  v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;

  return v13;
}

- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 hasAttachmentEntry:(BOOL *)a5
{
  id v8;
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
  id v20;
  id v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  int64_t v30;
  BOOL *v31;
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("message_attachments"));

  v10 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mime_part_number"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "equalTo:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "combined:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWhere:", v17);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = *MEMORY[0x1E0D1DC08];
  -[EDAttachmentPersistence database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence messageAttachmentExistsForGlobalMessageID:mimePartNumber:hasAttachmentEntry:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke;
  v25[3] = &unk_1E949B018;
  v20 = v23;
  v26 = v20;
  v28 = &v33;
  v30 = a3;
  v31 = a5;
  v29 = v32;
  v21 = v24;
  v27 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v25);

  LOBYTE(v16) = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

  return (char)v16;
}

uint64_t __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke_2;
  v17[3] = &unk_1E949AFF0;
  v4 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 64);
  v20 = v4;
  v18 = *(_OWORD *)(a1 + 48);
  v5 = objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v17, &v16);
  v6 = v16;
  if (v6)
  {
    EDAttachmentsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(NSObject **)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to check if message attachment identifier and attachmennt identifier exist for messageID %lld mimePartNumber: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (**(_BYTE **)(a1 + 72))
      v10 = CFSTR("Found");
    else
      v10 = CFSTR("Did not find");
    v7 = v10;
    EDAttachmentsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 64);
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v22 = v7;
      v23 = 2048;
      v24 = v13;
      v25 = 2048;
      v26 = v12;
      v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ attachment identifier %lld for messageID %lld mimePartNumber: %{public}@", buf, 0x2Au);
    }

  }
  return v5;
}

void __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue") == *(_QWORD *)(a1 + 48);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  **(_BYTE **)(a1 + 56) = v5 != 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attachment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

}

- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 hasAttachmentEntry:(BOOL *)a5
{
  id v8;
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
  id v21;
  BOOL *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  int64_t v30;
  BOOL *v31;
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v25 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a5;
  v24 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("message_attachments"));

  v10 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("remote_url"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "equalTo:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "combined:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWhere:", v18);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = *MEMORY[0x1E0D1DC08];
  -[EDAttachmentPersistence database](self, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence messageAttachmentExistsForGlobalMessageID:remoteURL:hasAttachmentEntry:]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke;
  v26[3] = &unk_1E949B040;
  v21 = v24;
  v27 = v21;
  v28 = &v33;
  v30 = a3;
  v31 = v23;
  v29 = v32;
  objc_msgSend(v19, "__performReadWithCaller:usingBlock:", v20, v26);

  LOBYTE(v19) = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

  return (char)v19;
}

uint64_t __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke_2;
  v15[3] = &unk_1E949AFF0;
  v4 = *(_QWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = v4;
  v16 = *(_OWORD *)(a1 + 40);
  v5 = objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v15, &v14);
  v6 = v14;
  if (v6)
  {
    EDAttachmentsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(NSObject **)(a1 + 56);
      *(_DWORD *)buf = 134218242;
      v20 = v8;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to check if message attachment identifier and attachmennt identifier exist for messageID %lld remoteURL with error %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (**(_BYTE **)(a1 + 64))
      v9 = CFSTR("Found");
    else
      v9 = CFSTR("Did not find");
    v7 = v9;
    EDAttachmentsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      v20 = v7;
      v21 = 2048;
      v22 = v12;
      v23 = 2048;
      v24 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ attachment identifier %lld for messageID %lld and remoteURL@", buf, 0x20u);
    }

  }
  return v5;
}

void __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue") == *(_QWORD *)(a1 + 48);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  **(_BYTE **)(a1 + 56) = v5 != 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attachment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

}

- (id)messageAttachmentMetadataForMessageID:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  int64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDAttachmentPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence messageAttachmentMetadataForMessageID:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke;
  v16 = &unk_1E949B068;
  v18 = a3;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v13);

  EDAttachmentsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Found attachments metadata %{public}@ for message %lld", buf, 0x16u);
  }

  if (objc_msgSend(v8, "count", v13, v14, v15, v16))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("message_attachments"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke_2;
  v14[3] = &unk_1E949AF78;
  v15 = *(id *)(a1 + 32);
  v13 = 0;
  v10 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v14, &v13);
  v11 = v13;

  return v10;
}

void __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EDMessageAttachmentMetadata *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EDMessageAttachmentMetadata *v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E98];
  v19 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("remote_url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a1;
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [EDMessageAttachmentMetadata alloc];
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseIDValue");
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("mime_part_number"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("attachment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EDMessageAttachmentMetadata initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:](v8, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v10, v12, v14, v16, v7);

  objc_msgSend(*(id *)(v18 + 32), "addObject:", v17);
}

- (id)uniqueAttachmentDataForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[EDAttachmentPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence uniqueAttachmentDataForHash:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke;
  v12[3] = &unk_1E949AFC8;
  v7 = v4;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v12);

  EDAttachmentsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v16[5];
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Found attachment metadata %{public}@ for hash %{public}@", buf, 0x16u);
  }

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[5];

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResult:table:", v5, CFSTR("attachments"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v8);

  objc_msgSend(v6, "setLimit:", 1);
  v11 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke_2;
  v12[3] = &unk_1E949B090;
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v12, &v11);
  v9 = v11;
  if (v9)
    objc_msgSend(v3, "handleError:message:", v9, CFSTR("Failed to fetch attachment reference in message_attachments table"));

  return 1;
}

void __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke_2(uint64_t a1, void *a2)
{
  EDAttachmentMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = [EDAttachmentMetadata alloc];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("file_name_on_file_system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDAttachmentMetadata initWithAttachmentID:nameOnDisk:](v3, "initWithAttachmentID:nameOnDisk:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)attachmentMetadataForMessageIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26[0] = CFSTR("global_message_id");
  v26[1] = CFSTR("attachment");
  v26[2] = CFSTR("file_name_on_file_system");
  v26[3] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("message_attachments"));

  v11 = (id)objc_msgSend(v10, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("attachments"), CFSTR("attachment"), *MEMORY[0x1E0D1EE00]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "in:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v13);

  -[EDAttachmentPersistence database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence attachmentMetadataForMessageIDs:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke;
  v22[3] = &unk_1E949B0B8;
  v16 = v10;
  v23 = v16;
  v17 = v5;
  v24 = v17;
  v18 = v4;
  v25 = v18;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v22);

  v19 = v25;
  v20 = v17;

  return v20;
}

uint64_t __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_2;
  v16[3] = &unk_1E949AF78;
  v4 = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v15 = 0;
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v4, v16, &v15);
  v5 = v15;
  if (v5)
  {
    EDAttachmentsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    EDAttachmentsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for messages %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

void __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  EDAttachmentMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EDAttachmentMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [EDAttachmentMetadata alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attachment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("file_name_on_file_system"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDAttachmentMetadata initWithAttachmentID:nameOnDisk:](v4, "initWithAttachmentID:nameOnDisk:", v6, v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

    objc_msgSend(v18, "addObject:", v14);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v18, v13);

  }
  else
  {
    v19 = *(void **)(a1 + 32);
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v13);

  }
}

- (id)attachmentMetadataForMessage:(int64_t)a3 mimePartNumber:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  id v20;
  id v21;
  id v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v6 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithResult:table:", v7, CFSTR("message_attachments"));

  v9 = (id)objc_msgSend(v8, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("attachments"), CFSTR("attachment"), *MEMORY[0x1E0D1EE00]);
  v10 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mime_part_number"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "equalTo:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "combined:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v17);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  -[EDAttachmentPersistence database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence attachmentMetadataForMessage:mimePartNumber:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke;
  v25[3] = &unk_1E949B0E0;
  v20 = v8;
  v26 = v20;
  v28 = &v30;
  v29 = a3;
  v21 = v24;
  v27 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v25);

  v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v22;
}

uint64_t __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_2;
  v11[3] = &unk_1E949B090;
  v11[4] = a1[6];
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v11, &v10);
  v4 = v10;
  if (v4)
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_cold_1();
  }
  else
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[7];
      v7 = a1[5];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "attachmentID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for message %lld mime part %{public}@ attachmentID %{public}@", buf, 0x20u);

    }
  }

  return 1;
}

void __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_2(uint64_t a1, void *a2)
{
  EDAttachmentMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = [EDAttachmentMetadata alloc];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("file_name_on_file_system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDAttachmentMetadata initWithAttachmentID:nameOnDisk:](v3, "initWithAttachmentID:nameOnDisk:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)attachmentMetadataForMessage:(int64_t)a3 remoteURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  id v20;
  id v21;
  id v22;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v25 = a4;
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithResult:table:", v6, CFSTR("message_attachments"));

  v8 = (id)objc_msgSend(v7, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("attachments"), CFSTR("attachment"), *MEMORY[0x1E0D1EE00]);
  v9 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v12;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("remote_url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "equalTo:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combined:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v17);

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  -[EDAttachmentPersistence database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence attachmentMetadataForMessage:remoteURL:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke;
  v26[3] = &unk_1E949B0E0;
  v20 = v7;
  v27 = v20;
  v29 = &v31;
  v30 = a3;
  v21 = v25;
  v28 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v26);

  v22 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v22;
}

uint64_t __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_2;
  v11[3] = &unk_1E949B090;
  v11[4] = a1[6];
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v11, &v10);
  v4 = v10;
  if (v4)
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_cold_1((uint64_t)a1, (uint64_t)v4, v5);
  }
  else
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[7];
      v7 = a1[5];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "attachmentID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for message %lld remoteURL %@ attachmentID %{public}@", buf, 0x20u);

    }
  }

  return 1;
}

void __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_2(uint64_t a1, void *a2)
{
  EDAttachmentMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = [EDAttachmentMetadata alloc];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("file_name_on_file_system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDAttachmentMetadata initWithAttachmentID:nameOnDisk:](v3, "initWithAttachmentID:nameOnDisk:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)attachmentMetadataForMessageAttachmentID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithResult:table:", v6, CFSTR("message_attachments"));

  v8 = (id)objc_msgSend(v7, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("attachments"), CFSTR("attachment"), *MEMORY[0x1E0D1EE00]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("message_attachments.rowid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "databaseID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "equalTo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v11);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  -[EDAttachmentPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence attachmentMetadataForMessageAttachmentID:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke;
  v18[3] = &unk_1E949B108;
  v14 = v7;
  v19 = v14;
  v21 = &v22;
  v15 = v4;
  v20 = v15;
  objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, v18);

  v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

uint64_t __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_2;
  v10[3] = &unk_1E949B090;
  v10[4] = a1[6];
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v3, v10, &v9);
  v4 = v9;
  if (v4)
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_cold_1();
  }
  else
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[5];
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "attachmentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for messageAttachmentID %@ attachmentID %{public}@", buf, 0x16u);

    }
  }

  return 1;
}

void __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_2(uint64_t a1, void *a2)
{
  EDAttachmentMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = [EDAttachmentMetadata alloc];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("file_name_on_file_system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDAttachmentMetadata initWithAttachmentID:nameOnDisk:](v3, "initWithAttachmentID:nameOnDisk:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v8 = a3;
  if (objc_msgSend(v8, "count") && *MEMORY[0x1E0D1DC08] != a4)
  {
    -[EDAttachmentPersistence database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence insertMimePartAttachments:forGlobalMessageID:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__EDAttachmentPersistence_insertMimePartAttachments_forGlobalMessageID___block_invoke;
    v9[3] = &unk_1E949B068;
    v10 = v8;
    v11 = a4;
    objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v9);

  }
}

uint64_t __72__EDAttachmentPersistence_insertMimePartAttachments_forGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  int v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  id obj;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO message_attachments (global_message_id, name, mime_part_number) VALUES (:global_id, :name, :mime)"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v31;
    *(_QWORD *)&v4 = 138543874;
    v25 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "first", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("1");
        if ((objc_msgSend(v8, "isEqualToString:", &stru_1E94A4508) & 1) == 0)
        {
          objc_msgSend(v7, "first");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v7, "first");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", &stru_1E94A4508);

        if (v11)
        {
          EDAttachmentsLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(__CFString **)(a1 + 40);
            *(_DWORD *)buf = 134217984;
            v35 = v13;
            _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Updated MIME part to 1 for message with global id %lld", buf, 0xCu);
          }

        }
        if (v9)
        {
          objc_msgSend(v7, "second");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = CFSTR("attachment");
          if (v14)
            v16 = (__CFString *)v14;
          v17 = v16;

          v29 = 0;
          v40[0] = CFSTR(":global_id");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
          v18 = objc_claimAutoreleasedReturnValue();
          v41[0] = v18;
          v41[1] = v17;
          v40[1] = CFSTR(":name");
          v40[2] = CFSTR(":mime");
          v41[2] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0;
          LOBYTE(v18) = objc_msgSend(v27, "executeWithNamedBindings:rowsChanged:error:", v19, &v29, &v28);
          v20 = v28;
          if ((v18 & 1) != 0)
          {
            if (!v29)
            {
              EDAttachmentsLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                v35 = v9;
                v36 = 2048;
                v37 = v22;
                _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Message attachment for part '%{public}@', global message ID %lld already exists. Not inserting.", buf, 0x16u);
              }
              goto LABEL_21;
            }
          }
          else
          {
            EDAttachmentsLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v23 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v25;
              v35 = v9;
              v36 = 2048;
              v37 = v23;
              v38 = 2114;
              v39 = v20;
              _os_log_error_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_ERROR, "Failed to insert message attachment for part '%{public}@', global message ID %lld: error %{public}@", buf, 0x20u);
            }
LABEL_21:

          }
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v3);
  }

  return 1;
}

- (void)enumerateAttachmentsInfoForGlobalMessageIDs:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "count"))
  {
    -[EDAttachmentPersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDAttachmentPersistence enumerateAttachmentsInfoForGlobalMessageIDs:withBlock:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke;
    v10[3] = &unk_1E949B178;
    v11 = v9;
    v12 = v6;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v10);

  }
}

uint64_t __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT message_attachments.global_message_id, message_attachments.mime_part_number, attachments.rowid, attachments.file_name_on_file_system FROM message_attachments LEFT JOIN attachments ON attachments.rowid == message_attachments.attachment WHERE message_attachments.global_message_id in (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_3;
  v18[3] = &unk_1E949B150;
  v19 = *(id *)(a1 + 40);
  v17 = 0;
  LOBYTE(a1) = objc_msgSend(v7, "executeUsingBlock:error:", v18, &v17);
  v8 = v17;
  if ((a1 & 1) == 0)
  {
    EDAttachmentsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  return 1;
}

id __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "stringValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "int64Value");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "int64Value");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

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

void __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Failed to fetch attachment metadata for messages %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1D2F2C000, v0, v1, "Failed to fetch attachment metadata for message %lld mime part %{public}@ error %{public}@");
}

void __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218498;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 56);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_0_3(&dword_1D2F2C000, a2, a3, "Failed to fetch attachment metadata for message %lld remoteURL %@ error %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

void __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = v0;
  _os_log_error_impl(&dword_1D2F2C000, v1, OS_LOG_TYPE_ERROR, "Failed to fetch attachment metadata for messageAttachmentID %@ error %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Failed to get message attachment for global message IDs: error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
