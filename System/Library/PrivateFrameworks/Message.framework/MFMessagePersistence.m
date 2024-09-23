@implementation MFMessagePersistence

void __31__MFMessagePersistence_iOS_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;

}

uint64_t __49__MFMessagePersistence_iOS_defaultLibraryOptions__block_invoke()
{
  uint64_t result;

  defaultLibraryOptions_defaultLibraryOptions = 7342143;
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    defaultLibraryOptions_defaultLibraryOptions |= 0x200020u;
  }
  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    defaultLibraryOptions_defaultLibraryOptions |= 0x400000u;
  return result;
}

uint64_t __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke(uint64_t a1, void *a2)
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
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_2;
  v16[3] = &unk_1E4E8A828;
  v4 = *(_QWORD *)(a1 + 32);
  v16[4] = *(_QWORD *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v15 = 0;
  objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v4, v16, &v15);
  v5 = v15;
  if (v5)
  {
    EMLogCategoryMessageLoading();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    EMLogCategoryMessageLoading();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Found attachment basepaths for messages %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

void __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("global_message_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "urlForMailboxID:", objc_msgSend(v6, "longLongValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v11, "defaultPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v14, v4);
}

void __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "generateSummaryForMessage:downloadIfNecessary:", *(_QWORD *)(a1 + 32), 1);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "securityInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "smimeError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "hasMoreContent") & 1) != 0)
    {
      v9 = *(unsigned __int8 *)(a1 + 120);

      if (v9)
        goto LABEL_7;
    }
    else
    {

    }
LABEL_13:
    EMLogCategoryMessageLoading();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Skipping the retry for message content with network", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", 2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
    goto LABEL_16;
  }
  if (!*(_BYTE *)(a1 + 120))
    goto LABEL_13;
LABEL_7:
  EMLogCategoryMessageLoading();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestedRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Retrying the request %{public}@ content for message %{public}@ with network", buf, 0x16u);

  }
  v13 = *(_QWORD **)(a1 + 48);
  if (v13)
    v13 = (_QWORD *)v13[20];
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v17, "messageTransformer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageContentRequest onScheduler:requestID:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:](MFMessageContentRequest, "onScheduler:requestID:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:", v14, v15, v16, v17, v18, v19, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 96), "addChild:withPendingUnitCount:", v20, 1);
LABEL_16:

}

uint64_t __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNetworkUsage:", 0);
}

void __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "summaryLoaderProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageSummaryLoaderForMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "requestSummaryImmediatelyFromDownloadedMessage:downloadIfNecessary:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setSummary:", v4);
    EMLogCategoryMessageLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "messageID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2048;
      v14 = v3;
      _os_log_debug_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEBUG, "Generated summary (length=%{publid}@) for: %@ (summaryLoader=%p)", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    EMLogCategoryMessageLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "messageID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke_cold_1(v8, (uint64_t)v3, (uint64_t)&v9, v5);
    }
  }

}

uint64_t __88__MFMessagePersistence_iOS__libraryMessageForMessageObjectID_preferNonOutgoingMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOutgoingMailboxUid") ^ 1;

  return v3;
}

uint64_t __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  __int128 v17;
  char v18;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend((id)objc_opt_class(), "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", CFSTR("global_message_id"), v5);

  v7 = (_QWORD *)MEMORY[0x1E0D1EE00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v6, "join:sourceColumn:targetColumn:", CFSTR("mailboxes"), CFSTR("mailbox"), *MEMORY[0x1E0D1EE00]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addResultColumn:", CFSTR("url"));

  }
  v9 = (void *)MEMORY[0x1E0D1EFC0];
  objc_msgSend((id)objc_opt_class(), "messagesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "table:column:", v10, *v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke_2;
  v16[3] = &unk_1E4E8E1B0;
  v18 = *(_BYTE *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 40);
  v14 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v16, 0);

  return v14;
}

void __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

id __106__MFMessagePersistence_iOS_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "persistedMessageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithLongLong:", objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __45__MFMessagePersistence_iOS_collectStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t (**v6)(void *, const __CFString *);
  NSObject *v7;
  uint64_t v8;
  _QWORD aBlock[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "protectedDatabaseAttached");
  objc_msgSend(*(id *)(a1 + 32), "setProtectedDataAvailable:", v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MFMessagePersistence_iOS_collectStatistics__block_invoke_2;
  aBlock[3] = &unk_1E4E8E228;
  v5 = v3;
  v11 = v5;
  v6 = (uint64_t (**)(void *, const __CFString *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "setMessageData:", v6[2](v6, CFSTR("SELECT COUNT(*) FROM message_data")));
  objc_msgSend(*(id *)(a1 + 32), "setMessageDataDeleted:", v6[2](v6, CFSTR("SELECT COUNT(*) FROM message_data_deleted")));
  objc_msgSend(*(id *)(a1 + 32), "setMessagesMarkedAsJournaled:", v6[2](v6, CFSTR("SELECT COUNT(*) FROM messages WHERE journaled = '1'")));
  objc_msgSend(*(id *)(a1 + 32), "setMailboxesNeedingReconcilication:", v6[2](v6, CFSTR("SELECT COUNT(*) FROM mailboxes WHERE reconcile = '1'")));
  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 32), "setProtectedMessageData:", v6[2](v6, CFSTR("SELECT COUNT(*) FROM protected_message_data")));
  EMLogSearchableIndexStatus();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "Persistence statistics: %{public}@", buf, 0xCu);
  }

  return 1;
}

uint64_t __45__MFMessagePersistence_iOS_collectStatistics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;

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

  return v6;
}

void __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "Failed to fetch attachment basepaths for messages %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_0(&dword_1A4F90000, "Failed to generate summary for %@ (summaryLoader=%p)", (uint8_t *)a3, a4);

}

@end
