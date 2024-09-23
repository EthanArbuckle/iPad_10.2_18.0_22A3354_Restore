@implementation MFSearchableIndexPersistence

void __47__MFSearchableIndexPersistence_iOS_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;

}

void __39__MFSearchableIndexPersistence_iOS_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;

}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    +[MFSearchableIndexPersistence_iOS log](MFSearchableIndexPersistence_iOS, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_2();
    goto LABEL_12;
  }
  if (!v6)
  {
    +[MFSearchableIndexPersistence_iOS log](MFSearchableIndexPersistence_iOS, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_1();
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  +[EDSearchableIndexItem mailboxIdentifiersForMessage:](MFSearchableIndexItem_iOS, "mailboxIdentifiersForMessage:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EC18], "domainIdentifierForMessage:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EC18], "accountIdentifierForMessage:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "to");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v7, "to");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);

  }
  objc_msgSend(v7, "cc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v7, "cc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v16);

  }
  v17 = objc_alloc(MEMORY[0x1E0D1EBF8]);
  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v7, "messageIDHeader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateReceived");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateSent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithAttachmentFileURL:name:domainIdentifier:accountIdentifier:mailboxIdentifiers:messageIDHeader:senderAddress:recipientAddresses:dateReceived:dateSent:", v5, v18, v25, v24, v26, v19, v9, v10, v20, v21);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_13:

}

id __98__MFSearchableIndexPersistence_iOS__verificationDataFromMessage_messageIDTransactionIDDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0D1E450], "rawAddressFromFullAddress:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v37;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke_2;
  aBlock[3] = &unk_1E4E8E950;
  v4 = v3;
  v37 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeMailboxesClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SEARCH INDEX STATISTICS", "Starting database query for messages to index", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM messages WHERE messages.searchable_message IS NULL AND deleted = '0' %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1DF60]);

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v12, OS_SIGNPOST_INTERVAL_END, v13, "SEARCH INDEX STATISTICS", "Finished database query for messages to index", buf, 2u);
  }

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SEARCH INDEX STATISTICS", "Starting database query for messages to reindex", buf, 2u);
  }

  v5[2](v5, CFSTR("SELECT COUNT(*) FROM searchable_rebuild"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D1DF68]);

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v17, OS_SIGNPOST_INTERVAL_END, v18, "SEARCH INDEX STATISTICS", "Finished database query for messages to reindex", buf, 2u);
  }

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SEARCH INDEX STATISTICS", "Starting database query for indexable messages", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM messages WHERE deleted = '0' %@"), v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D1DEF0]);

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v23, OS_SIGNPOST_INTERVAL_END, v24, "SEARCH INDEX STATISTICS", "Finished database query for indexable messages", buf, 2u);
  }

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SEARCH INDEX STATISTICS", "Starting database query for messages indexed", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM messages WHERE messages.searchable_message IS NOT NULL AND deleted = '0' %@"), v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D1DF50]);

  +[MFSearchableIndexPersistence_iOS signpostLog](MFSearchableIndexPersistence_iOS, "signpostLog");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v29, OS_SIGNPOST_INTERVAL_END, v30, "SEARCH INDEX STATISTICS", "Finished database query for messages indexed", buf, 2u);
  }

  if (objc_msgSend(v4, "protectedDatabaseAttached"))
  {
    v5[2](v5, CFSTR("SELECT COUNT(*) FROM message_attachments WHERE message_attachments.attachment IS NOT NULL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D1DEE8]);

    v5[2](v5, CFSTR("SELECT COUNT(*) FROM searchable_attachments"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D1DEC0]);

    v5[2](v5, CFSTR("SELECT COUNT(*) FROM message_attachments LEFT OUTER JOIN searchable_attachments ON (message_attachments.ROWID = searchable_attachments.attachment_id) WHERE searchable_attachments.attachment_id IS NULL AND message_attachments.attachment IS NOT NULL;"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D1DEC8]);

  }
  return 1;
}

id __46__MFSearchableIndexPersistence_iOS_statistics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    if (sqlite3_step(v5) == 100)
      v6 = sqlite3_column_int(v5, 0);
    else
      v6 = 0;
    sqlite3_reset(v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __104__MFSearchableIndexPersistence_iOS_moveMessagesToCorrectProtectionClassWithBatchSize_protectionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  id *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("emlx"));

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v7 = (id *)MEMORY[0x1E0C99930];
    if (!v6)
      v7 = (id *)MEMORY[0x1E0C99920];
    v8 = *v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[56];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_6();
  _os_log_fault_impl(&dword_1A4F90000, v0, OS_LOG_TYPE_FAULT, "Encountered a reference to a non-existent message in the attachments table for attachmentID:%{public}@ attachmentPersistentID:%{public}@ messageID:%{public}@ name:%@", v1, 0x2Au);
}

void __139__MFSearchableIndexPersistence_iOS_attachmentItemMetadataForAttachmentID_attachmentPersistentID_messagePersistentID_name_mailboxID_result___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[56];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1A4F90000, v0, OS_LOG_TYPE_DEBUG, "Unable to retrieve a fileURL for a message in the attachments table for attachmentID:%{public}@ attachmentPersistentID:%{public}@ messageID:%{public}@ name:%@", v1, 0x2Au);
}

@end
