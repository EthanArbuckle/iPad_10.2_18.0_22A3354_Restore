@implementation EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_87 != -1)
    dispatch_once(&log_onceToken_87, block);
  return (OS_os_log *)(id)log_log_87;
}

void __70__EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_87;
  log_log_87 = (uint64_t)v1;

}

+ (int)runWithConnection:(id)a3 dataProvider:(id)a4
{
  id v5;
  int v6;

  v5 = a3;
  objc_msgSend(a1, "deleteAttachmentsTableWithConnection:", v5);
  if (objc_msgSend(a1, "deleteMessageAttachmentsTableWithConnection:", v5)
    && objc_msgSend(a1, "createMessageAttachmentsTableWithConnection:", v5)
    && objc_msgSend(a1, "createNewAttachmentTableWithConnection:", v5)
    && objc_msgSend(v5, "executeStatementString:errorMessage:", CFSTR("DROP TABLE searchable_attachments"), CFSTR("Removing searchable_attachments table")))
  {
    v6 = objc_msgSend(a1, "createNewSearchableAttachmentsTable:", v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, "executeStatementString:errorMessage:", CFSTR("INSERT INTO properties  (key, value) VALUES (\"NeedToMigrateAttachments\",1)"), CFSTR("Setting need to upgrade property"));

  return v6 ^ 1;
}

+ (int)runWithConnection:(id)a3
{
  return +[EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep runWithConnection:dataProvider:](EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep, "runWithConnection:dataProvider:", a3, 0);
}

+ (BOOL)createNewAttachmentTableWithConnection:(id)a3
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("size"), 0, &unk_1E94E4B08);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("hash"), 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("file_name_on_file_system"), 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("viewed_count"), 0, &unk_1E94E4B08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("last_viewed"), 0, &unk_1E94E4B08);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v8;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("viewed_by_tapped_count"), 0, &unk_1E94E4B08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("date_last_downloaded"), 0, &unk_1E94E4B08);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithName:rowIDType:columns:", CFSTR("attachments"), 2, v11);

  v22 = CFSTR("hash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addUniquenessConstraintForColumns:conflictResolution:", v13, 1);

  v14 = objc_alloc(MEMORY[0x1E0D1F038]);
  v21 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTables:", v15);

  objc_msgSend(v16, "definitionWithDatabaseName:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create %@"), CFSTR("attachments"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v20, "executeStatementString:errorMessage:", v17, v18);

  return (char)v5;
}

+ (BOOL)deleteAttachmentsTableWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), CFSTR("attachments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to delete table %@"), CFSTR("attachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeStatementString:errorMessage:", v4, v5);

  return v6;
}

+ (BOOL)deleteMessageAttachmentsTableWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), CFSTR("message_attachments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to delete table %@"), CFSTR("message_attachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "executeStatementString:errorMessage:", v4, v5);

  return v6;
}

+ (BOOL)createMessageAttachmentsTableWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("mime_part_number"), 1, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("remote_url"), 1, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("global_message_id"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("attachment"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("name"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v6;
  v50[3] = v43;
  v50[4] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithName:rowIDType:columns:", CFSTR("message_attachments"), 2, v7);

  v49[0] = CFSTR("global_message_id");
  v49[1] = CFSTR("mime_part_number");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", v9, 1);

  v48[0] = CFSTR("global_message_id");
  v48[1] = CFSTR("remote_url");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", v10, 1);

  v11 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v43, "columnExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "isNotNull");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v13;
  objc_msgSend(v42, "columnExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isNull");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v11, "initWithExpressions:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D1EF90]);
  objc_msgSend(v43, "columnExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "isNull");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v19;
  objc_msgSend(v42, "columnExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "isNotNull");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v17, "initWithExpressions:", v22);

  v24 = objc_alloc(MEMORY[0x1E0D1F020]);
  v45[0] = v41;
  v45[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithExpressions:", v25);

  objc_msgSend(v8, "addCheckConstraintForExpression:", v26);
  v27 = objc_alloc(MEMORY[0x1E0D1F050]);
  +[EDMessagePersistence messageGlobalDataTableName](EDMessagePersistence, "messageGlobalDataTableName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithName:rowIDType:columns:", v28, 2, MEMORY[0x1E0C9AA60]);

  objc_msgSend(v8, "columnForName:", CFSTR("global_message_id"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAsForeignKeyForTable:onDelete:onUpdate:", v29, 2, 0);

  v31 = objc_alloc(MEMORY[0x1E0D1F050]);
  v32 = (void *)objc_msgSend(v31, "initWithName:rowIDType:columns:", CFSTR("attachments"), 2, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v8, "columnForName:", CFSTR("attachment"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAsForeignKeyForTable:onDelete:onUpdate:", v32, 0, 0);

  v34 = objc_alloc(MEMORY[0x1E0D1F038]);
  v44 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithTables:", v35);

  objc_msgSend(v36, "definitionWithDatabaseName:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create %@"), CFSTR("attachments"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v40, "executeStatementString:errorMessage:", v37, v38);

  return (char)v30;
}

+ (BOOL)createNewSearchableAttachmentsTable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  const __CFString *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("attachment"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("searchable_attachments"), 1, CFSTR("attachment_id"), v8);

  v22 = CFSTR("attachment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexForColumns:", v10);

  objc_msgSend(v9, "addIndexForColumns:", &unk_1E94E5620);
  v11 = objc_alloc(MEMORY[0x1E0D1F050]);
  v12 = (void *)objc_msgSend(v11, "initWithName:rowIDType:columns:", CFSTR("message_attachments"), 2, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v9, "columnForName:", CFSTR("attachment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAsForeignKeyForTable:onDelete:onUpdate:", v12, 3, 0);

  v14 = objc_alloc(MEMORY[0x1E0D1F038]);
  v21 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTables:", v15);

  objc_msgSend(v16, "definitionWithDatabaseName:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create %@"), CFSTR("searchable_attachments"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "executeStatementString:errorMessage:", v17, v18);

  return v19;
}

+ (BOOL)insertIntoMessageAttachmentTableGlobalMessageID:(id)a3 attachmentMetadata:(id)a4 attachmentID:(int64_t)a5 connection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  char v21;
  void *v22;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("message_attachments"), 4);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("global_message_id"));
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("name"));

  objc_msgSend(v10, "mimePartNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("mime_part_number"));

  if (*MEMORY[0x1E0D1DC08] != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("attachment"));

  }
  objc_msgSend(v10, "remoteURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("remote_url"));

  }
  v24 = 0;
  v19 = objc_msgSend(v11, "executeInsertStatement:error:", v12, &v24);
  v20 = v24;
  if (v20)
    v21 = v19;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to insert messageID %@ into message_attachments table"), v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleError:message:", v20, v22);

  }
  return v19;
}

+ (BOOL)insertAttachmentIntoAttachmentTableWithAttachmentMetadata:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("attachments"), 3);
  objc_msgSend(v5, "size");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("size"));

  objc_msgSend(v5, "attachmentHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("hash"));

  objc_msgSend(v5, "nameOnDisk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("file_name_on_file_system"));

  objc_msgSend(v5, "downloadDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("date_last_downloaded"));
  if (!v11)

  v19 = 0;
  v13 = objc_msgSend(v6, "executeInsertStatement:error:", v7, &v19);
  v14 = v19;
  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "attachmentHash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to insert attachment hash %@ into attachments table"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:message:", v14, v17);

  }
  return v13;
}

@end
