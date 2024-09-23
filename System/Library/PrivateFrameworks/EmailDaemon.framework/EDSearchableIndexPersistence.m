@implementation EDSearchableIndexPersistence

uint64_t __61__EDSearchableIndexPersistence_setLastProcessedAttachmentID___block_invoke(uint64_t a1, void *a2)
{
  return -[EDPersistenceDatabaseConnection setLastProcessedAttachmentID:](a2, *(void **)(a1 + 32));
}

uint64_t __86__EDSearchableIndexPersistence_searchableIndex_invalidateItemsGreaterThanTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "setLastProcessedAttachmentID:", 0);
    -[EDPersistenceDatabaseConnection deleteMessagesAfterTransaction:](v3, *(_QWORD *)(a1 + 40));
    -[EDPersistenceDatabaseConnection deleteAttachmentsAfterTransaction:](v3, *(_QWORD *)(a1 + 40));
    -[EDPersistenceDatabaseConnection clearTransactionsForTombstonesAfterTransaction:](v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "startReindexingWithConnection:", v3);
  }

  return 1;
}

- (void)searchableIndex:(id)a3 invalidateItemsGreaterThanTransaction:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a4;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating items greater than transaction %lld", buf, 0xCu);
  }

  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:invalidateItemsGreaterThanTransaction:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__EDSearchableIndexPersistence_searchableIndex_invalidateItemsGreaterThanTransaction___block_invoke;
  v9[3] = &unk_1E949B068;
  v9[4] = self;
  v9[5] = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);

}

- (void)setLastProcessedAttachmentID:(id)a3
{
  EDPersistedAttachmentID *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  EDPersistedAttachmentID *v10;
  uint8_t buf[4];
  EDPersistedAttachmentID *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (EDPersistedAttachmentID *)a3;
  os_unfair_lock_lock(&self->_lastProcessedAttachmentIDLock);
  if (self->_lastProcessedAttachmentID == v5)
  {
    os_unfair_lock_unlock(&self->_lastProcessedAttachmentIDLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lastProcessedAttachmentID, a3);
    os_unfair_lock_unlock(&self->_lastProcessedAttachmentIDLock);
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = CFSTR("com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey");
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Setting object:%@ for key: %@", buf, 0x16u);
    }

    -[EDSearchableIndexPersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence setLastProcessedAttachmentID:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__EDSearchableIndexPersistence_setLastProcessedAttachmentID___block_invoke;
    v9[3] = &unk_1E949B7F0;
    v10 = v5;
    objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);

  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EDSearchableIndexPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_79 != -1)
    dispatch_once(&log_onceToken_79, block);
  return (OS_os_log *)(id)log_log_79;
}

void __68__EDSearchableIndexPersistence__searchableIndexMessageIndexingTypes__block_invoke()
{
  void *v0;

  v0 = (void *)_searchableIndexMessageIndexingTypes_indexingTypes;
  _searchableIndexMessageIndexingTypes_indexingTypes = (uint64_t)&unk_1E94E55F0;

}

- (EDSearchableIndexPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDSearchableIndexPersistence *v15;
  EDSearchableIndexPersistence *v16;
  EDPersistedAttachmentID *lastProcessedAttachmentID;
  EDDataDetectionPersistence *v18;
  EDDataDetectionPersistence *dataDetectionPersistence;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EDSearchableIndexPersistence;
  v15 = -[EDSearchableIndexPersistence init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeWeak((id *)&v16->_hookResponder, v14);
    objc_storeStrong((id *)&v16->_messagePersistence, a4);
    objc_storeStrong((id *)&v16->_richLinkPersistence, a5);
    v16->_lastProcessedAttachmentIDLock._os_unfair_lock_opaque = 0;
    lastProcessedAttachmentID = v16->_lastProcessedAttachmentID;
    v16->_lastProcessedAttachmentID = 0;

    v18 = -[EDDataDetectionPersistence initWithDatabase:messagePersistence:hookResponder:]([EDDataDetectionPersistence alloc], "initWithDatabase:messagePersistence:hookResponder:", v11, 0, 0);
    dataDetectionPersistence = v16->_dataDetectionPersistence;
    v16->_dataDetectionPersistence = v18;

  }
  return v16;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  EDPersistenceForeignKeyPlaceholder *v5;
  EDPersistenceForeignKeyPlaceholder *v6;
  void *v7;
  EDPersistenceForeignKeyPlaceholder *v8;
  EDPersistenceForeignKeyPlaceholder *v9;
  void *v10;
  void *v11;
  EDPersistenceForeignKeyPlaceholder *v12;
  EDPersistenceForeignKeyPlaceholder *v13;
  void *v14;
  void *v15;
  EDPersistenceForeignKeyPlaceholder *v16;
  void *v17;
  void *v18;
  void *v20;
  EDPersistenceForeignKeyPlaceholder *v21;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "searchableMessagesTableSchema");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchableAttachmentsTableSchema");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchableRichLinksTableSchema");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchableDataDetectionResultsTableSchema");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchableRebuildTableSchema");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v30, "columnForName:", CFSTR("message"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v5, "initWithColumn:tableName:onDelete:onUpdate:", v26);
  v32[0] = v21;
  v6 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v29, "columnForName:", CFSTR("attachment"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v6, "initWithColumn:tableName:onDelete:onUpdate:", v25, v7, 3, 0);
  v32[1] = v8;
  v9 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v28, "columnForName:", CFSTR("rich_link"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRichLinkPersistence richLinksTableName](EDRichLinkPersistence, "richLinksTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v9, "initWithColumn:tableName:onDelete:onUpdate:", v10, v11, 3, 0);
  v32[2] = v12;
  v13 = [EDPersistenceForeignKeyPlaceholder alloc];
  objc_msgSend(v27, "columnForName:", CFSTR("message_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v13, "initWithColumn:tableName:onDelete:onUpdate:", v14, v15, 3, 0);
  v32[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  *a4 = (id)MEMORY[0x1E0C9AA60];
  v31[0] = v30;
  objc_msgSend(a1, "searchableMessageTombstonesTableSchema");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v17;
  v31[2] = v29;
  v31[3] = v28;
  v31[4] = v27;
  v31[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)searchableRichLinksTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("rich_link"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("searchable_rich_links"), 1, CFSTR("rich_link_id"), v6);

  v12 = CFSTR("rich_link");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  v11 = CFSTR("message_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return v7;
}

+ (id)searchableRebuildTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("searchable_rebuild"), 2, v4);

  return v5;
}

+ (id)searchableMessagesTableSchema
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
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(a1, "searchableMessagesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_body_indexed"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("reindex_type"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:rowIDType:rowIDAlias:columns:", v4, 1, CFSTR("message_id"), v9);

  v22[0] = CFSTR("message");
  v22[1] = CFSTR("reindex_type");
  v22[2] = CFSTR("transaction_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("reindex_type"));
  objc_msgSend(v12, "notEqualTo:", &unk_1E94E4A18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D1EFF8]);
  objc_msgSend(v10, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("reindex_type");
  v21[1] = CFSTR("message_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithTableName:columnNames:where:unique:", v15, v16, v13, 0);
  objc_msgSend(v10, "addIndex:", v17);

  v20[0] = CFSTR("transaction_id");
  v20[1] = CFSTR("message_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addIndexForColumns:", v18);

  return v10;
}

+ (NSString)searchableMessagesTableName
{
  return (NSString *)CFSTR("searchable_messages");
}

+ (id)searchableMessageTombstonesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("type"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("identifier"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("searchable_message_tombstones"), 2, v6);

  objc_msgSend(v7, "addUniquenessConstraintForColumns:conflictResolution:", &unk_1E94E55D8, 1);
  v10[0] = CFSTR("transaction_id");
  v10[1] = CFSTR("type");
  v10[2] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  return v7;
}

+ (id)searchableDataDetectionResultsTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("data_detection_result"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:columns:", CFSTR("searchable_data_detection_results"), 1, v6);

  v12 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  v11 = CFSTR("data_detection_result");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return v7;
}

+ (id)searchableAttachmentsTableSchema
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
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("attachment"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("message_id"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("transaction_id"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("searchable_attachments"), 1, CFSTR("attachment_id"), v6);

  v12 = CFSTR("attachment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v8);

  v11 = CFSTR("message_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexForColumns:", v9);

  return v7;
}

- (void)_enumerateSearchableIndexMessageIndexingTypesUsingBlock:(id)a3
{
  unsigned int (**v4)(id, uint64_t);
  void *v5;
  unint64_t v6;
  unsigned __int8 v7;
  int v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  int v13;
  unsigned __int8 v14;
  NSObject *v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, uint64_t))a3;
  -[EDSearchableIndexPersistence _searchableIndexMessageIndexingTypes](self, "_searchableIndexMessageIndexingTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v16 = -86;
  v7 = atomic_load(&self->_currentIndexingTypeIndex);
  v16 = v7;
  v8 = atomic_load(&v16);
  while (1)
  {
    v9 = atomic_load(&v16);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4[2](v4, objc_msgSend(v10, "integerValue")))
      break;
    do
    {
      v11 = __ldaxr(&v16);
      v12 = v11 + 1;
    }
    while (__stlxr(v12, &v16));
    if (v6 <= v12)
      atomic_store(0, &v16);

    v13 = atomic_load(&v16);
    if (v13 == v8)
      goto LABEL_11;
  }
  v14 = atomic_load(&v16);
  atomic_store(v14, &self->_currentIndexingTypeIndex);
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Did not finish indexing all types. Starting with type %{public}@ next time.", buf, 0xCu);
  }

LABEL_11:
}

- (id)_messagesRequiringIndexingForType:(int64_t)a3 excludingIdentifiers:(id)a4 limit:(int64_t)a5
{
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  int64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((messages.searchable_message IS NULL OR messages.ROWID IN (SELECT message_id FROM searchable_messages WHERE searchable_messages.transaction_id = %ld)) AND likely(messages.ROWID NOT IN (%@)))"), 0, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[EDSearchableIndexPersistence rebuildIndexState](self, "rebuildIndexState") == 1;
      break;
    case 2:
    case 7:
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = CFSTR("((messages.ROWID IN (SELECT message_id FROM searchable_messages WHERE (searchable_messages.reindex_type = 1 OR searchable_messages.reindex_type = 2 OR searchable_messages.reindex_type = 7))) AND likely(messages.ROWID NOT IN (%@)))");
      goto LABEL_4;
    case 4:
    case 5:
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = CFSTR("messages.global_message_id IN (SELECT data_detection_results.global_message_id FROM data_detection_results LEFT OUTER JOIN searchable_data_detection_results ON data_detection_results.ROWID = searchable_data_detection_results.data_detection_result WHERE searchable_data_detection_results.data_detection_result IS NULL) AND likely(messages.ROWID NOT IN (%@))");
LABEL_4:
      v10 = (void *)objc_msgSend(v11, "initWithFormat:", v12, v8);
      v9 = 0;
      break;
    default:
      break;
  }
  -[EDSearchableIndexPersistence additionalFilterClause](self, "additionalFilterClause");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ AND %@"), v10, v13);

    v10 = (void *)v14;
  }
  if (v10)
  {
    +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[EDSearchableIndexPersistence signpostID](self, "signpostID");
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 134218240;
      v24 = a3;
      v25 = 2048;
      v26 = a5;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EDSearchableIndexPersistenceMessagesForIndexing", "type=%ld limit=%ld", buf, 0x16u);
    }

    -[EDSearchableIndexPersistence messagesWhere:useSearchableRebuildTable:limit:](self, "messagesWhere:useSearchableRebuildTable:limit:", v10, v9, a5);
    v17 = objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = -[EDSearchableIndexPersistence signpostID](self, "signpostID");
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EDSearchableIndexPersistenceMessagesForIndexing", ", buf, 2u);
    }

    v20 = (void *)v17;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (-[EDSearchableIndexPersistence rebuildIndexState](self, "rebuildIndexState") == 1
    && !(objc_msgSend(v20, "count") | a3))
  {
    -[EDSearchableIndexPersistence setRebuildIndexState:](self, "setRebuildIndexState:", 2);
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Reindex complete. Switching to EDSearchableIndexRebuildTableStateUseDefaultQuery state", buf, 2u);
    }

  }
  return v20;
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDSearchableIndexPersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_8 != -1)
    dispatch_once(&signpostLog_onceToken_8, block);
  return (OS_os_log *)(id)signpostLog_log_8;
}

- (unint64_t)rebuildIndexState
{
  return self->_rebuildIndexState;
}

- (id)_searchableIndexMessageIndexingTypes
{
  if (_searchableIndexMessageIndexingTypes_onceToken != -1)
    dispatch_once(&_searchableIndexMessageIndexingTypes_onceToken, &__block_literal_global_320_1);
  return (id)_searchableIndexMessageIndexingTypes_indexingTypes;
}

void __43__EDSearchableIndexPersistence_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_8;
  signpostLog_log_8 = (uint64_t)v1;

}

void __35__EDSearchableIndexPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_79;
  log_log_79 = (uint64_t)v1;

}

- (void)setRebuildIndexState:(unint64_t)a3
{
  self->_rebuildIndexState = a3;
}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDPersistedAttachmentID)lastProcessedAttachmentID
{
  os_unfair_lock_s *p_lastProcessedAttachmentIDLock;
  EDPersistedAttachmentID *lastProcessedAttachmentID;
  EDPersistedAttachmentID **p_lastProcessedAttachmentID;
  void *v6;
  void *v7;
  EDPersistedAttachmentID *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  p_lastProcessedAttachmentIDLock = &self->_lastProcessedAttachmentIDLock;
  os_unfair_lock_lock(&self->_lastProcessedAttachmentIDLock);
  p_lastProcessedAttachmentID = &self->_lastProcessedAttachmentID;
  lastProcessedAttachmentID = self->_lastProcessedAttachmentID;
  if (!lastProcessedAttachmentID)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__30;
    v15 = __Block_byref_object_dispose__30;
    v16 = 0;
    -[EDSearchableIndexPersistence database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence lastProcessedAttachmentID]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__EDSearchableIndexPersistence_lastProcessedAttachmentID__block_invoke;
    v10[3] = &unk_1E949BF68;
    v10[4] = &v11;
    objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v10);

    objc_storeStrong((id *)p_lastProcessedAttachmentID, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

    lastProcessedAttachmentID = *p_lastProcessedAttachmentID;
  }
  v8 = lastProcessedAttachmentID;
  os_unfair_lock_unlock(p_lastProcessedAttachmentIDLock);
  return v8;
}

uint64_t __57__EDSearchableIndexPersistence_lastProcessedAttachmentID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectLastProcessedAttachmentID](v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5
{
  id v7;

  v7 = a3;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence messagesWhere:useSearchableRebuildTable:limit:]", "EDSearchableIndexPersistence.m", 985, "0");
}

- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence searchableIndexItemsFromMessages:type:]", "EDSearchableIndexPersistence.m", 989, "0");
}

- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence attachmentItemMetadataForAttachmentID:attachmentPersistentID:messagePersistentID:name:mailboxID:result:]", "EDSearchableIndexPersistence.m", 993, "0");
}

- (id)searchableIndex:(id)a3 attachmentItemsForMessageWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__30;
  v22 = __Block_byref_object_dispose__30;
  v23 = 0;
  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:attachmentItemsForMessageWithIdentifier:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __88__EDSearchableIndexPersistence_searchableIndex_attachmentItemsForMessageWithIdentifier___block_invoke;
  v15 = &unk_1E949BBD8;
  v17 = &v18;
  v9 = v5;
  v16 = v9;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, &v12);

  if (objc_msgSend((id)v19[5], "count", v12, v13, v14, v15))
  {
    -[EDSearchableIndexPersistence _attachmentItemsFromAttachmentData:limit:cancelationToken:](self, "_attachmentItemsFromAttachmentData:limit:cancelationToken:", v19[5], 512, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

uint64_t __88__EDSearchableIndexPersistence_searchableIndex_attachmentItemsForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection attachmentDataForMessageWithIdentifier:](v3, *(void **)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (void)searchableIndex:(id)a3 indexGeneratedSummaries:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[EDSearchableIndexPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeneratedSummaries:", v6);

}

- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3
{
  id v5;

  v5 = a3;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence verificationDataSamplesFromMessageIDTransactionIDDictionary:]", "EDSearchableIndexPersistence.m", 1017, "0");
}

- (NSString)additionalFilterClause
{
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence additionalFilterClause]", "EDSearchableIndexPersistence.m", 1021, "0");
}

- (NSDictionary)statistics
{
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence statistics]", "EDSearchableIndexPersistence.m", 1027, "0");
}

- (id)domainsToRemoveForSearchableIndex:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__30;
  v12 = __Block_byref_object_dispose__30;
  v13 = (id)MEMORY[0x1E0C9AA60];
  -[EDSearchableIndexPersistence database](self, "database", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence domainsToRemoveForSearchableIndex:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__EDSearchableIndexPersistence_domainsToRemoveForSearchableIndex___block_invoke;
  v7[3] = &unk_1E949BF68;
  v7[4] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __66__EDSearchableIndexPersistence_domainsToRemoveForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectIdentifiersForTombstonesOfType:](v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (id)itemsToRemoveForSearchableIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSearchableIndexPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence itemsToRemoveForSearchableIndex:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__EDSearchableIndexPersistence_itemsToRemoveForSearchableIndex___block_invoke;
  v9[3] = &unk_1E949B7F0;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  return v7;
}

uint64_t __64__EDSearchableIndexPersistence_itemsToRemoveForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectIdentifiersForTombstonesOfType:](v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectIdentifiersForDeletedMessages](v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectIdentifiersForDeletedAttachments](v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  return 1;
}

- (id)itemsToIndexForSearchableIndex:(id)a3 excludingIdentifiers:(id)a4 count:(unint64_t)a5 cancelationToken:(id)a6
{
  unint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t (**v31)(_QWORD);
  id v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_signpost_id_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  int v43;
  void *v44;
  unint64_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  NSObject *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  id v57;
  int v58;
  void *v59;
  unint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  double v64;
  double v65;
  NSObject *v66;
  id v67;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  EDSearchableIndexPersistence *v77;
  id v78;
  id obj;
  id v80;
  _QWORD v81[5];
  _QWORD v82[4];
  id v83;
  __int128 *v84;
  _BYTE *v85;
  _QWORD v86[4];
  id v87;
  EDSearchableIndexPersistence *v88;
  id v89;
  __int128 *v90;
  _QWORD v91[4];
  id v92;
  EDSearchableIndexPersistence *v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD aBlock[4];
  id v102;
  unint64_t v103;
  _QWORD v104[5];
  uint8_t v105[4];
  double v106;
  __int16 v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint8_t v114[128];
  _BYTE buf[24];
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v75 = a4;
  v72 = a6;
  v77 = self;
  v9 = -[EDSearchableIndexPersistence rebuildIndexState](self, "rebuildIndexState");
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = +[EDSearchableIndexScheduler isTurboModeIndexingEnabled](EDSearchableIndexScheduler, "isTurboModeIndexingEnabled");
    v12 = CFSTR("off");
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a5;
    if (v11)
      v12 = CFSTR("on");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v116 = (uint64_t (*)(uint64_t, uint64_t))v12;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "SearchableIndex is requesting a batch of up to %lu items requiring indexing, rebuild state = %lu, turbo mode = %@", buf, 0x20u);
  }

  if (!v9)
  {
    -[EDSearchableIndexPersistence database](v77, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke;
    v104[3] = &unk_1E949B7F0;
    v104[4] = v77;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v104);

  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_284;
  aBlock[3] = &unk_1E94A1068;
  v73 = v15;
  v102 = v73;
  v103 = a5;
  v74 = _Block_copy(aBlock);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v80 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v116 = __Block_byref_object_copy__30;
  v117 = __Block_byref_object_dispose__30;
  v118 = (id)0xAAAAAAAAAAAAAAAALL;
  v118 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v75;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v98 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
        +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:](EDSearchableIndexAttachmentItem, "attachmentPersistentIDFromItemIdentifier:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDSearchableIndexRichLinkItem richLinkItemIdentifierFromSearchableItemIdentifier:](EDSearchableIndexRichLinkItem, "richLinkItemIdentifierFromSearchableItemIdentifier:", v19);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v20)
        {
          objc_msgSend(v80, "addObject:", v20);
        }
        else if (v21)
        {
          +[EDSearchableIndexRichLinkItem messageIDandRichLinkIDFromRichLinkIdentifier:](EDSearchableIndexRichLinkItem, "messageIDandRichLinkIDFromRichLinkIdentifier:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "first");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26 == 0;

            if (v27)
            {
              v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setObject:forKeyedSubscript:", v28, v25);

            }
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", v25);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "second");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v30);

          }
        }
        else
        {
          objc_msgSend(v78, "addObject:", v19);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    }
    while (v16);
  }

  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_2;
  v91[3] = &unk_1E94A1090;
  v31 = v74;
  v96 = v31;
  v32 = v72;
  v92 = v32;
  v93 = v77;
  v69 = v78;
  v94 = v69;
  v33 = v73;
  v95 = v33;
  -[EDSearchableIndexPersistence _enumerateSearchableIndexMessageIndexingTypesUsingBlock:](v77, "_enumerateSearchableIndexMessageIndexingTypesUsingBlock:", v91);
  v34 = v31[2](v31);
  if (v34 >= 0xC)
    v35 = 12;
  else
    v35 = v34;
  +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog", v69);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = -[EDSearchableIndexPersistence signpostID](v77, "signpostID");
  if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    LODWORD(v109) = 134217984;
    *(_QWORD *)((char *)&v109 + 4) = v35;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "EDSearchableIndexPersistenceWhileLoop", "limit=%ld", (uint8_t *)&v109, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    if (!v35 || (objc_msgSend(v32, "isCanceled") & 1) != 0)
      break;
    *(_QWORD *)&v109 = 0;
    *((_QWORD *)&v109 + 1) = &v109;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__30;
    v112 = __Block_byref_object_dispose__30;
    v113 = 0;
    -[EDSearchableIndexPersistence database](v77, "database");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_289;
    v86[3] = &unk_1E94A10B8;
    v90 = &v109;
    v87 = v80;
    v88 = v77;
    v40 = v32;
    v89 = v40;
    objc_msgSend(v38, "__performReadWithCaller:usingBlock:", v39, v86);

    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 40), "count");
      *(_DWORD *)v105 = 134217984;
      v106 = *(double *)&v42;
      _os_log_impl(&dword_1D2F2C000, v41, OS_LOG_TYPE_DEFAULT, "Found item count:%lu for attachment indexing", v105, 0xCu);
    }

    if (objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 40), "count") && (objc_msgSend(v40, "isCanceled") & 1) == 0)
    {
      -[EDSearchableIndexPersistence _attachmentItemsFromAttachmentData:limit:cancelationToken:](v77, "_attachmentItemsFromAttachmentData:limit:cancelationToken:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 40), v35, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");
      +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 40), "count");
        *(_DWORD *)v105 = 134218240;
        v106 = *(double *)&v45;
        v107 = 2048;
        v108 = v47;
        _os_log_impl(&dword_1D2F2C000, v46, OS_LOG_TYPE_DEFAULT, "Generated %lu attachment items from %lu attachment data", v105, 0x16u);
      }

      if (v45)
      {
        objc_msgSend(v33, "addObjectsFromArray:", v44);
        if (v35 >= v45)
          v35 -= v45;
        else
          v35 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "timeIntervalSinceDate:", v71);
      v50 = v49;

      if (v50 >= 5.0)
      {
        objc_msgSend(v40, "cancel");
        +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 134217984;
          v106 = v50;
          _os_log_error_impl(&dword_1D2F2C000, v51, OS_LOG_TYPE_ERROR, "Taking too long to find attachmentItems after:%f", v105, 0xCu);
        }

        v43 = 5;
      }
      else
      {
        v43 = 0;
      }

    }
    else
    {
      v43 = 5;
    }

    _Block_object_dispose(&v109, 8);
  }
  while (!v43);
  +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = -[EDSearchableIndexPersistence signpostID](v77, "signpostID");
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    LOWORD(v109) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v52, OS_SIGNPOST_INTERVAL_END, v53, "EDSearchableIndexPersistenceWhileLoop", ", (uint8_t *)&v109, 2u);
  }

  v54 = v31[2](v31);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54 >= 0xC)
    v54 = 12;
  do
  {
    if (!v54 || (objc_msgSend(v32, "isCanceled") & 1) != 0)
      break;
    *(_QWORD *)&v109 = 0;
    *((_QWORD *)&v109 + 1) = &v109;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__30;
    v112 = __Block_byref_object_dispose__30;
    v113 = 0;
    -[EDSearchableIndexPersistence database](v77, "database");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_290;
    v82[3] = &unk_1E94A10E0;
    v84 = &v109;
    v85 = buf;
    v57 = v32;
    v83 = v57;
    objc_msgSend(v55, "__performReadWithCaller:usingBlock:", v56, v82);

    if (!objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 40), "count"))
      goto LABEL_59;
    if ((objc_msgSend(v57, "isCanceled") & 1) == 0)
    {
      -[EDSearchableIndexPersistence _richLinkItemsFromRichLinkData:limit:cancelationToken:](v77, "_richLinkItemsFromRichLinkData:limit:cancelationToken:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 40), v54, v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");
      +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = objc_msgSend(v59, "count");
        *(_DWORD *)v105 = 134218240;
        v106 = *(double *)&v60;
        v107 = 2048;
        v108 = v62;
        _os_log_impl(&dword_1D2F2C000, v61, OS_LOG_TYPE_DEFAULT, "Generated %lu rich link items from %lu rich link data", v105, 0x16u);
      }

      if (v60)
      {
        objc_msgSend(v33, "addObjectsFromArray:", v59);
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_291;
        v81[3] = &unk_1E94A1108;
        v81[4] = buf;
        objc_msgSend(v59, "enumerateObjectsUsingBlock:", v81);
        if (v54 >= v60)
          v54 -= v60;
        else
          v54 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timeIntervalSinceDate:", v76);
      v65 = v64;

      if (v65 >= 5.0)
      {
        objc_msgSend(v57, "cancel");
        +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 134217984;
          v106 = v65;
          _os_log_error_impl(&dword_1D2F2C000, v66, OS_LOG_TYPE_ERROR, "Taking too long to find rich link items after:%f", v105, 0xCu);
        }

        v58 = 7;
      }
      else
      {
        v58 = 0;
      }

    }
    else
    {
LABEL_59:
      v58 = 7;
    }

    _Block_object_dispose(&v109, 8);
  }
  while (!v58);
  v67 = v33;

  _Block_object_dispose(buf, 8);
  return v67;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a2;
  v4 = -[EDPersistenceDatabaseConnection selectIsReindexing]((_BOOL8)v3);
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "setRebuildIndexState:", 1);
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Reindex in-progress.  Switching to EDSearchableIndexRebuildTableStateUseRebuildTableQuery state", v8, 2u);
    }

  }
  else
  {
    objc_msgSend(v5, "setRebuildIndexState:", 2);
  }

  return 1;
}

unint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_284(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v3 >= v2;
  v5 = v3 - v2;
  if (v4)
    return v5;
  else
    return 0;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (result)
  {
    v5 = result;
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
    {
      return 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_messagesRequiringIndexingForType:excludingIdentifiers:limit:", a2, *(_QWORD *)(a1 + 48), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      if (v7 > v5)
      {
        objc_msgSend(v6, "subarrayWithRange:", 0, v5);
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        v14 = 134218496;
        v15 = a2;
        v16 = 2048;
        v17 = v5;
        v18 = 1024;
        v19 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", v7);
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EDSearchableIndexPersistenceMessagesToItems", "type=%ld limit=%lu messageCount=%u", (uint8_t *)&v14, 0x1Cu);
      }

      objc_msgSend(*(id *)(a1 + 40), "searchableIndexItemsFromMessages:type:", v6, a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v12, OS_SIGNPOST_INTERVAL_END, v13, "EDSearchableIndexPersistenceMessagesToItems", ", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v11);
      return 1;
    }
  }
  return result;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_289(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastProcessedAttachmentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection attachmentDataForItemsRequiringIndexingExcludingIDs:lastProcessedAttachmentID:limit:cancelationToken:](v3, v4, v5, 512, *(void **)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return 1;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_290(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection richLinkDataForItemsRequiringIndexingExcludingIdentifiers:limit:cancelationToken:](v3, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 512, *(void **)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

void __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_291(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "messagePersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v3);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadatum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "richLinkID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

}

- (id)selectMessageIDsFromBacklogWithBatchSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__30;
  v13 = __Block_byref_object_dispose__30;
  v14 = (id)MEMORY[0x1E0C9AA60];
  -[EDSearchableIndexPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence selectMessageIDsFromBacklogWithBatchSize:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__EDSearchableIndexPersistence_selectMessageIDsFromBacklogWithBatchSize___block_invoke;
  v8[3] = &unk_1E949B778;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __73__EDSearchableIndexPersistence_selectMessageIDsFromBacklogWithBatchSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectMessageIDsFromBacklogWithBatchSize:](v3, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (void)transitionBacklogBatchToCXWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[EDSearchableIndexPersistence selectMessageIDsFromBacklogWithBatchSize:](self, "selectMessageIDsFromBacklogWithBatchSize:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x1E0CB2AD0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "stringValue", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndexPersistence urlForMessageID:](self, "urlForMessageID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "enqueueMovingFile:toProtectionClass:", v13, v10);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)urlForMessageID:(id)a3
{
  id v5;

  v5 = a3;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence urlForMessageID:]", "EDSearchableIndexPersistence.m", 1256, "0");
}

- (int64_t)indexingTypeForSearchableIndex:(id)a3 item:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "indexingType");
  if (+[EDSearchableIndex isIncrementalIndexingType:](EDSearchableIndex, "isIncrementalIndexingType:", v6))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDSearchableIndexPersistence _canPerformIncrementalIndexForIdentifier:indexingType:](self, "_canPerformIncrementalIndexForIdentifier:indexingType:", v7, v6);

    v9 = 5;
    if (v6 != 4)
      v9 = 0;
    if (!v8)
      v6 = v9;
  }

  return v6;
}

- (BOOL)_canPerformIncrementalIndexForIdentifier:(id)a3 indexingType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence _canPerformIncrementalIndexForIdentifier:indexingType:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__EDSearchableIndexPersistence__canPerformIncrementalIndexForIdentifier_indexingType___block_invoke;
  v13[3] = &unk_1E94A1130;
  v9 = v6;
  v14 = v9;
  v15 = &v21;
  v16 = &v17;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v13);

  if (!+[EDSearchableIndex isValidTransaction:](EDSearchableIndex, "isValidTransaction:", v22[3])
    || (v10 = v18[3], v11 = 1, v10 != a4) && v10)
  {
    v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

uint64_t __86__EDSearchableIndexPersistence__canPerformIncrementalIndexForIdentifier_indexingType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectTransactionAndIndexTypeForMessage:](v3, *(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "integerValue");

  return 1;
}

- (void)searchableIndex:(id)a3 assignIndexingType:(int64_t)a4 forIdentifiers:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  EDPersistenceDatabaseGenerationWindow *v15;
  void *v16;
  void *v17;
  EDPersistenceDatabaseGenerationWindow *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  EDPersistenceDatabaseGenerationWindow *v23;
  id v24;

  v21 = a3;
  v9 = a5;
  switch(a4)
  {
    case 0:
    case 5:
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "initWithFormat:", CFSTR("UPDATE OR IGNORE searchable_messages SET transaction_id = %lld WHERE message_id IN (%@)"), 0, v11);
      goto LABEL_4;
    case 1:
    case 2:
    case 4:
    case 7:
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithFormat:", CFSTR("UPDATE OR IGNORE searchable_messages SET reindex_type = %lld WHERE transaction_id != %lld AND message_id IN (%@)"), a4, 0, v11, v21);
LABEL_4:
      v14 = (void *)v12;
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexPersistence.m"), 1378, CFSTR("Does not support re-indexing of attachment types. Will need to be implemented if needed."));
      goto LABEL_7;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexPersistence.m"), 1382, CFSTR("Does not support re-indexing of rich link types. Will need to be implemented if needed."));
LABEL_7:
      v14 = 0;
LABEL_8:

      break;
    default:
      v14 = 0;
      break;
  }
  v15 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDSearchableIndexPersistence database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:assignIndexingType:forIdentifiers:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__EDSearchableIndexPersistence_searchableIndex_assignIndexingType_forIdentifiers___block_invoke;
  v22[3] = &unk_1E949AFA0;
  v18 = v15;
  v23 = v18;
  v19 = v14;
  v24 = v19;
  objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v22);

  -[EDSearchableIndexPersistence hookResponder](self, "hookResponder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "searchableIndexDidAssignIndexingType:forIdentifiers:generationWindow:", a4, v9, v18);

}

uint64_t __82__EDSearchableIndexPersistence_searchableIndex_assignIndexingType_forIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(v3, "executeStatementString:errorMessage:", *(_QWORD *)(a1 + 40), CFSTR("Assigning the re-indexing type for a set of identifiers"));

  return 1;
}

- (void)searchableIndex:(id)a3 willRemoveIdentifiers:(id)a4 type:(int64_t)a5
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    -[EDSearchableIndexPersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:willRemoveIdentifiers:type:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__EDSearchableIndexPersistence_searchableIndex_willRemoveIdentifiers_type___block_invoke;
    v10[3] = &unk_1E949B068;
    v11 = v9;
    v12 = a5;
    objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);

  }
}

uint64_t __75__EDSearchableIndexPersistence_searchableIndex_willRemoveIdentifiers_type___block_invoke(uint64_t a1, void *a2)
{
  -[EDPersistenceDatabaseConnection addTombstonesForIdentifiers:type:](a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  return 1;
}

- (id)childIdentifiersToRemoveFromSearchableIndex:(id)a3 whenRemovingParentIdentifiers:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30;
  v18 = __Block_byref_object_dispose__30;
  v19 = (id)0xAAAAAAAAAAAAAAAALL;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSearchableIndexPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence childIdentifiersToRemoveFromSearchableIndex:whenRemovingParentIdentifiers:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__EDSearchableIndexPersistence_childIdentifiersToRemoveFromSearchableIndex_whenRemovingParentIdentifiers___block_invoke;
  v11[3] = &unk_1E949BBD8;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __106__EDSearchableIndexPersistence_childIdentifiersToRemoveFromSearchableIndex_whenRemovingParentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectAttachmentIdentifiersForMessages:](v3, *(void **)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (id)searchableIndex:(id)a3 assignTransaction:(int64_t)a4 updates:(id)a5
{
  id v7;
  void *v8;
  char v9;
  EDPersistenceDatabaseGenerationWindow *v10;
  void *v11;
  void *v12;
  EDPersistenceDatabaseGenerationWindow *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  _QWORD v20[4];
  EDPersistenceDatabaseGenerationWindow *v21;
  id v22;
  EDSearchableIndexPersistence *v23;
  id v24;
  int64_t v25;

  v7 = a5;
  -[EDSearchableIndexPersistence hookResponder](self, "hookResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  if ((objc_msgSend(v7, "hasUpdates") & 1) != 0)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EDSearchableIndexPersistence database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:assignTransaction:updates:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__EDSearchableIndexPersistence_searchableIndex_assignTransaction_updates___block_invoke;
    v20[3] = &unk_1E94A1158;
    v13 = v10;
    v21 = v13;
    v14 = v7;
    v22 = v14;
    v23 = self;
    v25 = a4;
    v15 = v19;
    v24 = v15;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v20);

    if ((v9 & 1) != 0)
      objc_msgSend(v8, "searchableIndexDidAssignTransaction:toUpdates:withMissingIdentifiers:generationWindow:", a4, v14, v15, v13);
    v16 = v24;
    v17 = v15;

  }
  else
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
    if ((v9 & 1) != 0)
      objc_msgSend(v8, "searchableIndexDidAssignTransaction:toUpdates:withMissingIdentifiers:generationWindow:", a4, v7, MEMORY[0x1E0C9AA60], v10);
  }

  return v17;
}

uint64_t __74__EDSearchableIndexPersistence_searchableIndex_assignTransaction_updates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 40), "indexedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "indexedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_assignIndexedItems:transaction:connection:", v6, *(_QWORD *)(a1 + 64), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "removedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection assignTombstonesForIdentifiers:type:transaction:](v3, v8, 0, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "removedDomainIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistenceDatabaseConnection assignTombstonesForIdentifiers:type:transaction:](v3, v9, 1, *(_QWORD *)(a1 + 64));

  v10 = *(_QWORD *)(a1 + 64);
  if (v10 >= 11 && !(v10 % 0xAuLL))
  {
    -[EDPersistenceDatabaseConnection deleteTombstonesBeforeTransaction:](v3, v10 - 10);
    v10 = *(_QWORD *)(a1 + 64);
  }
  v11 = +[EDSearchableIndex isValidTransaction:](EDSearchableIndex, "isValidTransaction:", v10);
  if (objc_msgSend(v8, "count"))
    v12 = v11;
  else
    v12 = 0;
  if (v12)
    -[EDPersistenceDatabaseConnection removeIndexedIdentifiers:](v3, v8);

  return 1;
}

- (void)startReindexingWithConnection:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  -[EDSearchableIndexPersistence setLastProcessedAttachmentID:](self, "setLastProcessedAttachmentID:", 0);
  -[EDPersistenceDatabaseConnection emptyAllSearchableIndexTables](v4);
  -[EDPersistenceDatabaseConnection clearReferencesToSearchableMessages](v4);
  -[EDPersistenceDatabaseConnection addAllMessagesToRebuildTable](v4);
  -[EDSearchableIndexPersistence setRebuildIndexState:](self, "setRebuildIndexState:", 1);
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Reindex requested.  Switching to EDSearchableIndexRebuildTableStateUseRebuildTableQuery state", v6, 2u);
  }

}

- (id)searchableIndex:(id)a3 invalidateItemsInTransactions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:invalidateItemsInTransactions:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __78__EDSearchableIndexPersistence_searchableIndex_invalidateItemsInTransactions___block_invoke;
  v16 = &unk_1E949AFA0;
  v9 = v6;
  v17 = v9;
  v10 = v5;
  v18 = v10;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, &v13);

  objc_msgSend(v9, "allObjects", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __78__EDSearchableIndexPersistence_searchableIndex_invalidateItemsInTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectMessageIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectTombstoneIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = *(void **)(a1 + 32);
  -[EDPersistenceDatabaseConnection selectAttachmentIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  -[EDPersistenceDatabaseConnection deleteMessagesInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteAttachmentsInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteRichLinksInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteTombstonesInTransactions:](v3, *(void **)(a1 + 40));

  return 1;
}

- (void)searchableIndex:(id)a3 prepareToIndexAttachmentsForMessageWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Clearing existing searchable_attachment entries for message_id %@", buf, 0xCu);
  }

  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence searchableIndex:prepareToIndexAttachmentsForMessageWithIdentifier:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__EDSearchableIndexPersistence_searchableIndex_prepareToIndexAttachmentsForMessageWithIdentifier___block_invoke;
  v11[3] = &unk_1E949B7F0;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  -[EDSearchableIndexPersistence setLastProcessedAttachmentID:](self, "setLastProcessedAttachmentID:", 0);
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "SearchableIndex is preparing to index attachments for message with identifier: %{public}@", buf, 0xCu);
  }

}

uint64_t __98__EDSearchableIndexPersistence_searchableIndex_prepareToIndexAttachmentsForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  -[EDPersistenceDatabaseConnection deleteAttachmentsForMessage:](a2, *(void **)(a1 + 32));
  return 1;
}

- (id)verificationDataSamplesForSearchableIndex:(id)a3 count:(unint64_t)a4 lastVerifiedMessageID:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__30;
  v17 = __Block_byref_object_dispose__30;
  v18 = 0;
  -[EDSearchableIndexPersistence database](self, "database", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence verificationDataSamplesForSearchableIndex:count:lastVerifiedMessageID:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__EDSearchableIndexPersistence_verificationDataSamplesForSearchableIndex_count_lastVerifiedMessageID___block_invoke;
  v12[3] = &unk_1E949BEC8;
  v12[4] = &v13;
  v12[5] = a4;
  v12[6] = a5;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

  -[EDSearchableIndexPersistence verificationDataSamplesFromMessageIDTransactionIDDictionary:](self, "verificationDataSamplesFromMessageIDTransactionIDDictionary:", v14[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __102__EDSearchableIndexPersistence_verificationDataSamplesForSearchableIndex_count_lastVerifiedMessageID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection messageIDTransactionIDDictionaryToVerifyWithCount:lastVerifiedMessageID:](v3, a1[5], a1[6]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (id)distinctTransactionIDsForSearchableIndex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__30;
  v13 = __Block_byref_object_dispose__30;
  v14 = (id)0xAAAAAAAAAAAAAAAALL;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[EDSearchableIndexPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence distinctTransactionIDsForSearchableIndex:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__EDSearchableIndexPersistence_distinctTransactionIDsForSearchableIndex___block_invoke;
  v8[3] = &unk_1E949BF68;
  v8[4] = &v9;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = (void *)objc_msgSend((id)v10[5], "copy");
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __73__EDSearchableIndexPersistence_distinctTransactionIDsForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  -[EDPersistenceDatabaseConnection selectDistinctTransactionIDs](v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (void)clearOrphanedSearchableMessagesFromDatabase
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EDSearchableIndexPersistenceOrphanedValues", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 0;
  -[EDSearchableIndexPersistence database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence clearOrphanedSearchableMessagesFromDatabase]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__EDSearchableIndexPersistence_clearOrphanedSearchableMessagesFromDatabase__block_invoke;
  v12[3] = &unk_1E949BF68;
  v12[4] = buf;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v12);

  +[EDSearchableIndexPersistence signpostLog](EDSearchableIndexPersistence, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = *((_QWORD *)v14 + 3);
    *(_DWORD *)v17 = 134349056;
    v18 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v10, OS_SIGNPOST_INTERVAL_END, v4, "EDSearchableIndexPersistenceOrphanedValues", "SpotlightVerificationOrphanedValues=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", v17, 0xCu);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __75__EDSearchableIndexPersistence_clearOrphanedSearchableMessagesFromDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[EDPersistenceDatabaseConnection clearReferencesToMissingSearchableMessages](v3);
  +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Setting %lu orphaned searchable_message values to NULL", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (id)_assignIndexedItems:(id)a3 connection:(id)a4 query:(id)a5 indexedBindingsGenerator:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  void (**v34)(id, void *, void *);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30 = a4;
  v28 = a5;
  v34 = (void (**)(id, void *, void *))a6;
  v27 = v9;
  if (!objc_msgSend(v9, "count"))
  {
    v29 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v30, "preparedStatementForQueryString:", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v11)
    goto LABEL_15;
  v33 = *(_QWORD *)v37;
  v31 = *MEMORY[0x1E0D1EE10];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v37 != v33)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "messageID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "databaseID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "hasBodyData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2](v34, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v19 = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v18, 0, &v35);
      v20 = v35;
      v21 = v20;
      if ((v19 & 1) == 0)
      {
        objc_msgSend(v20, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isEqualToString:", v31))
        {
          v23 = objc_msgSend(v21, "code") == 19;

          if (v23)
          {
            objc_msgSend(v13, "messageID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringValue");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v25);

            goto LABEL_13;
          }
        }
        else
        {

        }
        objc_msgSend(v30, "handleError:message:", v21, CFSTR("Adding to searchable_messages index"));
      }
LABEL_13:
      objc_msgSend(v10, "clearBindingsWithError:", 0);
      objc_msgSend(v10, "resetWithError:", 0);

    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v11);
LABEL_15:

LABEL_17:
  return v29;
}

- (id)_assignIndexedItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  void *v56;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD aBlock[4];
  id v70;
  uint8_t buf[4];
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = a5;
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "messages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO searchable_messages (message_id, message, transaction_id, reindex_type, message_body_indexed) VALUES (?, ?, %lld, %ld, ?)"), a4, 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke;
    aBlock[3] = &unk_1E94A1180;
    v70 = v60;
    v56 = _Block_copy(aBlock);
    objc_msgSend(v6, "messages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexPersistence _assignIndexedItems:connection:query:indexedBindingsGenerator:](self, "_assignIndexedItems:connection:query:indexedBindingsGenerator:", v9, v61, v55, v56);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "addObjectsFromArray:", v10);
    if (-[EDSearchableIndexPersistence rebuildIndexState](self, "rebuildIndexState") == 1)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(v6, "messages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v66;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v66 != v14)
              objc_enumerationMutation(v12);
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v15), "messageID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "databaseID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObject:", v18);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        }
        while (v13);
      }

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("message_id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "in:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("searchable_rebuild"), v20);
      v64 = 0;
      v22 = objc_msgSend(v61, "executeDeleteStatement:error:", v21, &v64);
      v23 = v64;
      if ((v22 & 1) == 0)
        objc_msgSend(v61, "handleError:message:", v23, CFSTR("Deleting from searchable_rebuild table"));

    }
  }
  objc_msgSend(v6, "updatedMessages");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO searchable_messages (message_id, message, transaction_id, reindex_type, message_body_indexed) VALUES (?, ?, %lld, %ld, COALESCE((SELECT message_body_indexed FROM searchable_messages WHERE message_id = ?), ?))"), a4, 0);
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke_2;
    v62[3] = &unk_1E94A1180;
    v63 = v60;
    v27 = _Block_copy(v62);
    objc_msgSend(v6, "updatedMessages");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexPersistence _assignIndexedItems:connection:query:indexedBindingsGenerator:](self, "_assignIndexedItems:connection:query:indexedBindingsGenerator:", v28, v61, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "addObjectsFromArray:", v29);
  }
  if (objc_msgSend(v60, "count"))
  {
    v30 = objc_alloc(MEMORY[0x1E0D1F058]);
    +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithTable:conflictResolution:", v31, 4);

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("ROWID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("searchable_message"));
    objc_msgSend(v33, "in:", v60);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWhereClause:", v34);

    objc_msgSend(v61, "executeUpdateStatement:error:", v32, 0);
  }
  objc_msgSend(v6, "attachments");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "attachments");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v72 = v40;
      _os_log_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_DEFAULT, "Inserting %@ attachment items into the searchable_attachments table", buf, 0xCu);

    }
    objc_msgSend(v6, "attachments");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection assignIndexedAttachmentItems:transaction:](v61, v41, a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "addObjectsFromArray:", v42);
  }
  objc_msgSend(v6, "richLinks");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "richLinks");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v72 = v48;
      _os_log_impl(&dword_1D2F2C000, v45, OS_LOG_TYPE_DEFAULT, "Inserting %@ rich link items into the searchable_rich_links table", buf, 0xCu);

    }
    objc_msgSend(v6, "richLinks");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistenceDatabaseConnection assignIndexedRichLinkItems:transaction:](v61, v49, a4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "addObjectsFromArray:", v50);
  }
  objc_msgSend(v6, "dataDetectionItems");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "count");

  if (v52)
  {
    objc_msgSend(v6, "dataDetectionItems");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexPersistence _assignIndexedDataDetectionItems:transaction:connection:](self, "_assignIndexedDataDetectionItems:transaction:connection:", v53, a4, v61);

  }
  return v59;
}

id __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v9[0] = v5;
  v9[1] = v5;
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v9[0] = v5;
  v9[1] = v5;
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attachmentItemsFromAttachmentData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v30;
  id obj;
  unint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a5;
  v30 = v7;
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v8)
  {
    v9 = 0;
    v32 = a4;
    v33 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "attachmentPersistentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "attachmentID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attachmentPersistentID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "messagePersistentID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v11, "mailboxID");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke;
        v41[3] = &unk_1E94A11A8;
        v9 = v12;
        v42 = v9;
        v43 = v11;
        v18 = v35;
        v44 = v18;
        v45 = v37;
        -[EDSearchableIndexPersistence attachmentItemMetadataForAttachmentID:attachmentPersistentID:messagePersistentID:name:mailboxID:result:](self, "attachmentItemMetadataForAttachmentID:attachmentPersistentID:messagePersistentID:name:mailboxID:result:", v13, v14, v15, v16, v17, v41);

        if (objc_msgSend(v18, "count") >= v32)
        {

          goto LABEL_13;
        }
        v19 = objc_msgSend(v34, "isCanceled");

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  if (objc_msgSend(v37, "count"))
  {
    objc_msgSend(v37, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("SELECT attachment FROM %@ WHERE message IN (%@)"), v23, v21, v30);

    -[EDSearchableIndexPersistence database](self, "database");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence _attachmentItemsFromAttachmentData:limit:cancelationToken:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_2;
    v38[3] = &unk_1E949AFA0;
    v27 = v24;
    v39 = v27;
    v28 = v21;
    v40 = v28;
    objc_msgSend(v25, "__performWriteWithCaller:usingBlock:", v26, v38);

  }
  if (v9)
    -[EDSearchableIndexPersistence setLastProcessedAttachmentID:](self, "setLastProcessedAttachmentID:", v9);

  return v35;
}

void __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, int a3)
{
  EDSearchableIndexAttachmentItem *v5;
  uint64_t v6;
  void *v7;
  EDSearchableIndexAttachmentItem *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    v5 = [EDSearchableIndexAttachmentItem alloc];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "messagePersistentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDSearchableIndexAttachmentItem initWithAttachmentPersistentID:messagePersistentID:metadatum:](v5, "initWithAttachmentPersistentID:messagePersistentID:metadatum:", v6, v7, v10);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
LABEL_5:

    goto LABEL_6;
  }
  if (a3)
  {
    v9 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "messagePersistentID");
    v8 = (EDSearchableIndexAttachmentItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__30;
  v28 = __Block_byref_object_dispose__30;
  v29 = (id)0xAAAAAAAAAAAAAAAALL;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_3;
  v23[3] = &unk_1E949B090;
  v23[4] = &v24;
  v6 = objc_msgSend(v4, "executeUsingBlock:error:", v23, &v22);
  v7 = v22;
  if ((v6 & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE message IN (%@)"), v9, *(_QWORD *)(a1 + 40));

    objc_msgSend(v3, "executeStatementString:errorMessage:", v10, CFSTR("Removing unexpected messages from attachments table"));
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[EDAttachmentPersistence messageAttachmentsTableName](EDAttachmentPersistence, "messageAttachmentsTableName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("SELECT attachment FROM %@ WHERE attachment IN (%@)"), v12, v25[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "preparedStatementForQueryString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_4;
    v21[3] = &unk_1E949B090;
    v21[4] = &v24;
    objc_msgSend(v14, "executeUsingBlock:error:", v21, &v20);
    v15 = v20;

    v16 = (void *)MEMORY[0x1E0CB3940];
    +[EDAttachmentPersistence attachmentsTableName](EDAttachmentPersistence, "attachmentsTableName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE ROWID IN (%@)"), v17, v25[5]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "executeStatementString:errorMessage:", v18, CFSTR("Removing unexpected messages from attachments table"));
    v7 = v15;
  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("get attachment for messageid"));
  }

  _Block_object_dispose(&v24, 8);
  return v6;
}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObject:", a2);
}

- (id)_richLinkItemsFromRichLinkData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id obj;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a5;
  v28 = v7;
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "richLinkID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "messageID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "mailboxID");
        objc_msgSend(v11, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "url");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke;
        v36[3] = &unk_1E94A11D0;
        v36[4] = v11;
        v17 = v32;
        v37 = v17;
        v38 = v33;
        -[EDSearchableIndexPersistence searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:](self, "searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:", v12, v13, v14, v15, v16, v36);

        if (objc_msgSend(v17, "count") >= a4)
        {

          goto LABEL_12;
        }
        v18 = objc_msgSend(v31, "isCanceled");

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[EDRichLinkPersistence messageRichLinksTableName](EDRichLinkPersistence, "messageRichLinksTableName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("SELECT m.global_message_id, mr.rich_link FROM %@ AS mr  LEFT OUTER JOIN messages AS m ON (m.global_message_id = mr.global_message_id) WHERE m.ROWID IN (%@)"), v22, v20, v28);

    -[EDSearchableIndexPersistence database](self, "database");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence _richLinkItemsFromRichLinkData:limit:cancelationToken:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_2;
    v34[3] = &unk_1E949B7F0;
    v26 = v23;
    v35 = v26;
    objc_msgSend(v24, "__performWriteWithCaller:usingBlock:", v25, v34);

  }
  return v32;
}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, int a3)
{
  EDSearchableIndexRichLinkItem *v5;
  void *v6;
  EDSearchableIndexRichLinkItem *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v5 = [EDSearchableIndexRichLinkItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "messageID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EDSearchableIndexRichLinkItem initWithMessageID:metadatum:](v5, "initWithMessageID:metadatum:", v6, v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
LABEL_5:

    goto LABEL_6;
  }
  if (a3)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "messageID");
    v7 = (EDSearchableIndexRichLinkItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v3 = a2;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__30;
  v46 = __Block_byref_object_dispose__30;
  v47 = (id)0xAAAAAAAAAAAAAAAALL;
  v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__30;
  v40 = __Block_byref_object_dispose__30;
  v41 = (id)0xAAAAAAAAAAAAAAAALL;
  v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_3;
  v35[3] = &unk_1E94A04E8;
  v35[4] = &v36;
  v35[5] = &v42;
  v6 = objc_msgSend(v4, "executeUsingBlock:error:", v35, &v34);
  v7 = v34;
  if ((v6 & 1) != 0)
  {
    objc_msgSend((id)v37[5], "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v9 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v9;
    objc_msgSend((id)v43[5], "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v11;
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[EDRichLinkPersistence messageRichLinksTableName](EDRichLinkPersistence, "messageRichLinksTableName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE global_message_id IN (%@)"), v13, v9);

    v15 = objc_msgSend(v3, "executeStatementString:errorMessage:", v14, CFSTR("Removing unexpected rich links from message_rich_links table"));
    v16 = (void *)MEMORY[0x1E0CB3940];
    +[EDRichLinkPersistence messageRichLinksTableName](EDRichLinkPersistence, "messageRichLinksTableName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT rich_link FROM %@ WHERE rich_link IN (%@)"), v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "preparedStatementForQueryString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15)
    {
      v32 = v7;
      v33[0] = v5;
      v33[1] = 3221225472;
      v33[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_4;
      v33[3] = &unk_1E949B090;
      v33[4] = &v42;
      v21 = objc_msgSend(v19, "executeUsingBlock:error:", v33, &v32);
      v22 = v32;

      v7 = v22;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend((id)v43[5], "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    +[EDRichLinkPersistence richLinksTableName](EDRichLinkPersistence, "richLinksTableName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE ROWID IN (%@)"), v27, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v23 = objc_msgSend(v3, "executeStatementString:errorMessage:", v28, CFSTR("Removing unexpected rich links from rich_links table"));
    else
      v23 = 0;

  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v7, CFSTR("Could not find rich links to remove for messageIDs"));
    v23 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23;
}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = v3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

- (void)searchableRichLinkItemMetadataForRichLinkID:(id)a3 messagePersistentID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7 result:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  EDSearchableIndexRichLinkItemMetadatum *v34;
  void *v35;
  void *v36;
  EDSearchableIndexRichLinkItemMetadatum *v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v39 = a6;
  v40 = a7;
  v15 = (void (**)(id, void *, _QWORD))a8;
  -[EDSearchableIndexPersistence messagePersistence](self, "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "databaseID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[EDSearchableIndexPersistence richLinkPersistence](self, "richLinkPersistence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "basePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "verifyFileExistsForRichLinkID:basePath:", v13, v22);

    if ((v23 & 1) == 0)
    {
      +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[EDSearchableIndexPersistence searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:].cold.2();

    }
    -[EDSearchableIndexPersistence allMailboxIdentifiersForMessage:](self, "allMailboxIdentifiersForMessage:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v20, "to");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      objc_msgSend(v20, "to");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v29);

    }
    objc_msgSend(v20, "cc");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      objc_msgSend(v20, "cc");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v32);

    }
    +[EDSearchableIndexItem domainIdentifierForMessage:](EDSearchableIndexItem, "domainIdentifierForMessage:", v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = [EDSearchableIndexRichLinkItemMetadatum alloc];
    objc_msgSend(v20, "dateReceived");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateSent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[EDSearchableIndexRichLinkItemMetadatum initWithDomainIdentifier:accountIdentifier:mailboxIdentifiers:senderAddress:recipientAddresses:dateReceived:dateSent:url:richLinkID:title:](v34, "initWithDomainIdentifier:accountIdentifier:mailboxIdentifiers:senderAddress:recipientAddresses:dateReceived:dateSent:url:richLinkID:title:", v33, 0, v25, 0, v26, v35, v36, v40, v13, v39);

    v15[2](v15, v37, 0);
  }
  else
  {
    +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      -[EDSearchableIndexPersistence searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:].cold.1();

    v15[2](v15, 0, 1);
  }

}

- (id)allMailboxIdentifiersForMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[EDSearchableIndexPersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexPersistence allMailboxIdentifiersForMessage:]", "EDSearchableIndexPersistence.m", 1913, "0");
}

- (void)_assignIndexedDataDetectionItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x1E0D1DC08];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[EDSearchableIndexPersistence messagePersistence](self, "messagePersistence");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "messageID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "globalIDForMessageWithDatabaseID:mailboxScope:", objc_msgSend(v13, "databaseID"), 0);

        if (v14 != v9)
        {
          -[EDDataDetectionPersistence getDataDetectionResultRowIDsForGlobalMessageID:](self->_dataDetectionPersistence, "getDataDetectionResultRowIDsForGlobalMessageID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "messageID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDSearchableIndexPersistence _addSearchableDataDetectionResults:withMessage:transaction:](self, "_addSearchableDataDetectionResults:withMessage:transaction:", v15, v16, a4);

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)_addSearchableDataDetectionResults:(id)a3 withMessage:(id)a4 transaction:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  int64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[3];
  char v21;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 1;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__30;
    v18[4] = __Block_byref_object_dispose__30;
    v19 = 0;
    -[EDSearchableIndexPersistence database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSearchableIndexPersistence _addSearchableDataDetectionResults:withMessage:transaction:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke;
    v12[3] = &unk_1E94A11F8;
    v13 = v8;
    v14 = v9;
    v15 = v20;
    v16 = v18;
    v17 = a5;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v12);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
  }

}

BOOL __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL8 v17;
  id obj;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint8_t v30[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("searchable_data_detection_results"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    v6 = a1 + 56;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "databaseID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("message"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("data_detection_result"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transaction_id"));

        v12 = *(_QWORD *)(*(_QWORD *)v6 + 8);
        v21 = *(id *)(v12 + 40);
        v13 = objc_msgSend(v20, "executeInsertStatement:error:", v3, &v21);
        objc_storeStrong((id *)(v12 + 40), v21);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v27 = v8;
            v28 = 2112;
            v29 = v15;
            _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Data detection result %@ with message %@ was successfully added to the searchable_data_detection_results table", buf, 0x16u);
          }

        }
        else
        {
          +[EDSearchableIndexPersistence log](EDSearchableIndexPersistence, "log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke_cold_1(v30, a1 + 56, &v31, v16);

          objc_msgSend(v20, "handleError:message:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), CFSTR("Storing searchable data detection results"));
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v4);
  }

  v17 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  return v17;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDSearchableIndexHookResponder)hookResponder
{
  return (EDSearchableIndexHookResponder *)objc_loadWeakRetained((id *)&self->_hookResponder);
}

- (EDRichLinkPersistence)richLinkPersistence
{
  return self->_richLinkPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_lastProcessedAttachmentID, 0);
  objc_storeStrong((id *)&self->_dataDetectionPersistence, 0);
}

- (void)searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_10(&dword_1D2F2C000, v0, v1, "Encountered a reference to a non-existent message in the rich_links table for richLinkPersistentID:%{public}@, messagePersistentID:%{public}@");
}

- (void)searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_10(&dword_1D2F2C000, v0, v1, "Encountered a reference to an invalid file in the rich_links table for richLinkPersistentID:%{public}@, messagePersistentID:%{public}@");
}

void __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke_cold_1(uint8_t *buf, uint64_t a2, _QWORD *a3, os_log_t log)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Error storing searchable data detection results: %@", buf, 0xCu);
}

@end
