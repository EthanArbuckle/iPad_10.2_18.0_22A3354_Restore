@implementation EDCombinedMessageInfo

void __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "combinedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:", v4);

  objc_msgSend(*(id *)(a1 + 40), "displayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayDate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "readLater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReadLater:", v6);

  objc_msgSend(*(id *)(a1 + 40), "sendLaterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSendLaterDate:", v7);

  objc_msgSend(*(id *)(a1 + 40), "followUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFollowUp:", v8);

  objc_msgSend(*(id *)(a1 + 40), "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategory:", v9);

  objc_msgSend(*(id *)(a1 + 40), "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubject:", v10);

  objc_msgSend(*(id *)(a1 + 40), "summary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSummary:", v11);

  objc_msgSend(*(id *)(a1 + 40), "senderList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSenderList:", v12);

  objc_msgSend(*(id *)(a1 + 40), "toList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToList:", v13);

  objc_msgSend(*(id *)(a1 + 40), "ccList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCcList:", v14);

  objc_msgSend(*(id *)(a1 + 40), "bccList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBccList:", v15);

  objc_msgSend(*(id *)(a1 + 32), "combinedMessageFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlags:", v16);

  objc_msgSend(v3, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 40), "isBlocked"));
  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 40), "unsubscribeType"));
  objc_msgSend(v3, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 40), "hasAttachments"));
  objc_msgSend(v3, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 40), "isAuthenticated"));
  objc_msgSend(v3, "setConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 40), "conversationNotificationLevel"));
  objc_msgSend(*(id *)(a1 + 40), "brandIndicatorLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBrandIndicatorLocation:", v17);

  objc_msgSend(v3, "setConversationID:", objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  objc_msgSend(*(id *)(a1 + 40), "documentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocumentID:", v18);

  objc_msgSend(*(id *)(a1 + 40), "searchableMessageID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchableMessageID:", v19);

  objc_msgSend(*(id *)(a1 + 32), "combinedMailboxes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "count"))
  {
    +[EDMessagePersistence log](EDMessagePersistence, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke_cold_1(v23, objc_msgSend(*(id *)(a1 + 32), "lowestDatabaseID"), v21);

  }
  objc_msgSend(v3, "setMailboxes:", v20);
  objc_msgSend(v3, "setIsToMe:", objc_msgSend(*(id *)(a1 + 40), "isToMe"));
  objc_msgSend(v3, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 40), "isCCMe"));
  objc_msgSend(v3, "setIsVIP:", objc_msgSend(*(id *)(a1 + 40), "isVIP"));
  objc_msgSend(*(id *)(a1 + 40), "loaderBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoaderBlock:", v22);

}

id __38___EDCombinedMessageInfo_combinedDate__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "laterDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "No mailboxes were found for legacy message database id: %lld", buf, 0xCu);
}

@end
