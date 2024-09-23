@implementation MFSearchableIndexPersistence_iOS

- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  +[MFSearchableIndexItem_iOS searchableIndexItemsFromMessages:type:](MFSearchableIndexItem_iOS, "searchableIndexItemsFromMessages:type:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)additionalFilterClause
{
  return CFSTR("likely(deleted = '0')");
}

- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5
{
  _BOOL4 v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = _os_feature_enabled_impl();
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = 1087559;
  else
    v11 = 1087495;
  if (v6)
    v12 = CFSTR("searchable_rebuild.ROWID");
  else
    v12 = 0;
  if (v6)
    v13 = v11 | 0x800000;
  else
    v13 = v11;
  objc_msgSend(v9, "indexableMessagesWhere:sortedBy:limit:options:", v7, v12, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MFSearchableIndexPersistence_iOS_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1)
    dispatch_once(&signpostLog_onceToken_2, block);
  return (OS_os_log *)(id)signpostLog_log_2;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MFSearchableIndexPersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1)
    dispatch_once(&log_onceToken_30, block);
  return (OS_os_log *)(id)log_log_30;
}

- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  if (v15)
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke;
    v20[3] = &unk_1E4E8E928;
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v24 = v15;
    v25 = v16;
    objc_msgSend(v17, "fileURLForAttachmentPersistentID:messageID:result:", v22, v18, v20);

  }
  else
  {
    +[MFSearchableIndexPersistence_iOS log](MFSearchableIndexPersistence_iOS, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v12;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v14;
      _os_log_fault_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_FAULT, "Encountered an attachment without a name for attachmentID:%@ attachmentPersistentID:%{public}@ messagePersistentID:%{public}@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD, uint64_t))v16 + 2))(v16, 0, 1);
  }

}

- (id)_verificationDataFromMessage:(id)a3 messageIDTransactionIDDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D1EC08]);
  objc_msgSend(v5, "persistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransactionID:", v9);

  objc_msgSend(v5, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subjectWithoutPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubject:", v11);

  objc_msgSend(v5, "dateReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateReceived:", v12);

  objc_msgSend(v5, "to");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ef_compactMap:", &__block_literal_global_59);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToEmailAddresses:", v14);

  return v7;
}

- (id)allMailboxIdentifiersForMessage:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D1EC18], "mailboxIdentifiersForMessage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deleted = '0' AND messages.ROWID IN (%@)"), v17);
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexableMessagesWhere:sortedBy:limit:options:", v18, 0, 0, 38917);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[MFSearchableIndexPersistence_iOS _verificationDataFromMessage:messageIDTransactionIDDictionary:](self, "_verificationDataFromMessage:messageIDTransactionIDDictionary:", v12, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "libraryID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v14);

        v4 = v5;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v19;
}

- (id)statistics
{
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[6];
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[MFSearchableIndexPersistence_iOS signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SEARCH INDEX STATISTICS", "Starting database queries for search index statistics", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__19;
  v35 = __Block_byref_object_dispose__19;
  v36 = (id)0xAAAAAAAAAAAAAAAALL;
  v36 = (id)objc_opt_new();
  -[EDSearchableIndexPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFSearchableIndexPersistence_iOS statistics]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke;
  v30[3] = &unk_1E4E8A698;
  v30[4] = self;
  v30[5] = buf;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v30);

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[MFSearchableIndexPersistence_iOS signpostID](self, "signpostID");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SEARCH INDEX STATISTICS", "Finished database queries for search index statistics", v37, 2u);
  }

  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchableIndexManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isIndexingEnabledForTaskType:", *MEMORY[0x1E0D1E9C0]);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = *MEMORY[0x1E0D1E9B8];
  v16 = objc_msgSend(v12, "isIndexingEnabledForActivityType:", *MEMORY[0x1E0D1E9B8]);
  v17 = (_QWORD *)MEMORY[0x1E0D1E9B0];
  v18 = (v16 & 1) == 0
     && ((objc_msgSend(v12, "isIndexingEnabledForActivityType:", *MEMORY[0x1E0D1E9B0]) | v13) & 1) == 0
     && objc_msgSend(v12, "budgetedItemCountRemaining") < 1;
  objc_msgSend(v14, "numberWithInt:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D1DEE0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isIndexingEnabledForActivityType:", *v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D1DF08]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isIndexingEnabledForActivityType:", v15));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D1DF18]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D1DF10]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "budgetedItemCountRemaining"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D1DED0]);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "budgetedTimeRemaining");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v32 + 5), "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D1DED8]);

  +[MFSearchableIndexPersistence_iOS log](MFSearchableIndexPersistence_iOS, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = *((_QWORD *)v32 + 5);
    *(_DWORD *)v37 = 138412290;
    v38 = v27;
    _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "Generated search indexing statistics: %@", v37, 0xCu);
  }

  v28 = (void *)objc_msgSend(*((id *)v32 + 5), "copy");
  _Block_object_dispose(buf, 8);

  return v28;
}

- (id)urlForMessageID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithMessageID:options:inMailbox:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataPathForMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);

  return v7;
}

- (void)moveMessagesToCorrectProtectionClassWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id obj;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = a4;
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[EDSearchableIndexPersistence selectMessageIDsFromBacklogWithBatchSize:](self, "selectMessageIDsFromBacklogWithBatchSize:", a3);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v9, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "messageWithMessageID:options:inMailbox:", v10, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1EC18], "accountIdentifierForMessage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v12);
        objc_msgSend(v9, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSearchableIndexPersistence_iOS urlForMessageID:](self, "urlForMessageID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "addObject:", v14);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v6);
  }

  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = v35;
  v15 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v31);
        +[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v37, "messageBasePathForAccount:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fileURLWithPath:isDirectory:", v20, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "addObject:", v21);
      }
      v15 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v15);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v34;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v41;
    v25 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v25;
        v38[1] = 3221225472;
        v38[2] = __104__MFSearchableIndexPersistence_iOS_moveMessagesToCorrectProtectionClassWithBatchSize_protectionHandler___block_invoke;
        v38[3] = &unk_1E4E8E978;
        v39 = v36;
        objc_msgSend(v28, "mf_verifyProtectionClassesForFilesInDirectory:usingBlock:", v27, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addEntriesFromDictionary:", v29);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v23);
  }

  objc_msgSend(v30, "enqueueMovingFileProtections:", v33);
}

@end
