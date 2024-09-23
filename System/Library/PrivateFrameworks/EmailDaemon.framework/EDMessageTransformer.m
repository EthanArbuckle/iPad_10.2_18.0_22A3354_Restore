@implementation EDMessageTransformer

- (EDMessageTransformer)initWithMailboxProvider:(id)a3 userProfileProvider:(id)a4 blockedSenderManager:(id)a5 vipReader:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDMessageTransformer *v15;
  EDMessageTransformer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDMessageTransformer;
  v15 = -[EDMessageTransformer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mailboxProvider, a3);
    objc_storeStrong((id *)&v16->_userProfileProvider, a4);
    objc_storeStrong((id *)&v16->_blockedSenderManager, a5);
    objc_storeStrong((id *)&v16->_vipReader, a6);
  }

  return v16;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMessageTransformer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_57 != -1)
    dispatch_once(&log_onceToken_57, block);
  return (OS_os_log *)(id)log_log_57;
}

void __27__EDMessageTransformer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_57;
  log_log_57 = (uint64_t)v1;

}

- (id)transformBaseMessage:(id)a3 mailboxScope:(id)a4 loaderBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__EDMessageTransformer_transformBaseMessage_mailboxScope_loaderBlock___block_invoke;
  aBlock[3] = &unk_1E949F0F0;
  v11 = v10;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  objc_msgSend(v8, "persistentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[EDMessageTransformer _transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:](self, "_transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:", v8, v9, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D1E258]);
    -[EDMessageTransformer _transformBaseMessage:messageObjectID:duplicateInfo:additionalBuilder:](self, "_transformBaseMessage:messageObjectID:duplicateInfo:additionalBuilder:", v8, v15, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

uint64_t __70__EDMessageTransformer_transformBaseMessage_mailboxScope_loaderBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLoaderBlock:", *(_QWORD *)(a1 + 32));
}

- (id)transformPersistedMessages:(id)a3 mailboxScope:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _EDMessageDuplicateInfo *v14;
  _EDMessageDuplicateInfo *v15;
  _EDMessageDuplicateInfo *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v21 = a4;
  v25 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v22;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "globalMessageID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageTransformer mailboxProvider](self, "mailboxProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:](EDMessageTransformer, "mailboxesForPersistedMessage:mailboxProvider:", v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          objc_msgSend(v25, "objectForKeyedSubscript:", v10);
          v14 = (_EDMessageDuplicateInfo *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            -[_EDMessageDuplicateInfo addMessage:](v14, "addMessage:", v9);
          }
          else
          {
            v16 = [_EDMessageDuplicateInfo alloc];
            -[EDMessageTransformer mailboxProvider](self, "mailboxProvider");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[_EDMessageDuplicateInfo initWithMailboxProvider:](v16, "initWithMailboxProvider:", v17);

            -[_EDMessageDuplicateInfo addMessage:](v15, "addMessage:", v9);
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v15, v10);
            objc_msgSend(v23, "addObject:", v15);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke;
  v26[3] = &unk_1E949F118;
  v26[4] = self;
  v18 = v21;
  v27 = v18;
  objc_msgSend(v23, "ef_compactMap:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "combinedMailboxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryPersistedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    +[EDMessageTransformer log](EDMessageTransformer, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "persistentID");
      objc_claimAutoreleasedReturnValue();
      __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke_cold_1();
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:", v5, *(_QWORD *)(a1 + 40), v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_transformPersistedMessage:(id)a3 mailboxScope:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  int64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = v12;
  objc_msgSend(v12, "combinedMailboxes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[EDMessageTransformer mailboxProvider](self, "mailboxProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:](EDMessageTransformer, "mailboxesForPersistedMessage:mailboxProvider:", v10, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v14, "count"))
  {
    +[EDMessageTransformer log](EDMessageTransformer, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "persistentID");
      objc_claimAutoreleasedReturnValue();
      -[EDMessageTransformer _transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:].cold.1();
    }

  }
  objc_msgSend(MEMORY[0x1E0D1E1E0], "noMailboxesScope");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17 == v11;

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0D1E1E0];
    objc_msgSend(v14, "ef_mapSelector:", sel_objectID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mailboxScopeForMailboxObjectIDs:forExclusion:", v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v21;
  }
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke;
  v39[3] = &unk_1E949CB28;
  v23 = v11;
  v40 = v23;
  objc_msgSend(v14, "ef_filter:", v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13;
  v26 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", objc_msgSend(v10, "conversationFlags"));
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", objc_msgSend(v10, "globalMessageID"), v23);
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2;
  v34[3] = &unk_1E949F140;
  v28 = v10;
  v35 = v28;
  v29 = v24;
  v36 = v29;
  v38 = v26;
  v30 = v25;
  v37 = v30;
  -[EDMessageTransformer _transformBaseMessage:messageObjectID:duplicateInfo:additionalBuilder:](self, "_transformBaseMessage:messageObjectID:duplicateInfo:additionalBuilder:", v28, v27, v33, v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

uint64_t __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "scopeContainsMailbox:", a2);
}

void __96__EDMessageTransformer__transformPersistedMessage_mailboxScope_duplicateInfo_additionalBuilder___block_invoke_2(uint64_t a1, void *a2)
{
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
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayDate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "readLater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setReadLater:", v4);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSendLaterDate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFollowUp:", v6);

  objc_msgSend(*(id *)(a1 + 32), "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCategory:", v7);

  objc_msgSend(v14, "setBusinessID:", objc_msgSend(*(id *)(a1 + 32), "businessID"));
  objc_msgSend(*(id *)(a1 + 32), "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSummary:", v8);

  objc_msgSend(*(id *)(a1 + 32), "generatedSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGeneratedSummary:", v9);

  objc_msgSend(v14, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v14, "setMailboxes:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v14, "setConversationNotificationLevel:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "brandIndicatorLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBrandIndicatorLocation:", v10);

  objc_msgSend(*(id *)(a1 + 32), "persistedMessageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndexItem searchableMessageIDForPersistedMessageID:](EDSearchableIndexItem, "searchableMessageIDForPersistedMessageID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSearchableMessageID:", v12);

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

}

- (id)_transformBaseMessage:(id)a3 messageObjectID:(id)a4 duplicateInfo:(id)a5 additionalBuilder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  EDMessageTransformer *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D1E1E8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__EDMessageTransformer__transformBaseMessage_messageObjectID_duplicateInfo_additionalBuilder___block_invoke;
  v20[3] = &unk_1E949F168;
  v15 = v12;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  v23 = self;
  v17 = v13;
  v24 = v17;
  v18 = (void *)objc_msgSend(v14, "initWithObjectID:builder:", v11, v20);

  return v18;
}

void __94__EDMessageTransformer__transformBaseMessage_messageObjectID_duplicateInfo_additionalBuilder___block_invoke(uint64_t a1, void *a2)
{
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  id v29;

  v29 = a2;
  objc_msgSend(*(id *)(a1 + 32), "combinedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "dateReceived");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "setDate:", v4);
  if (!v3)

  objc_msgSend(*(id *)(a1 + 40), "subjectIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSubject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "senders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSenderList:", v6);

  objc_msgSend(*(id *)(a1 + 40), "to");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setToList:", v7);

  objc_msgSend(*(id *)(a1 + 40), "cc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCcList:", v8);

  objc_msgSend(*(id *)(a1 + 32), "combinedMessageFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "flags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "setFlags:", v10);
  if (!v9)

  objc_msgSend(*(id *)(a1 + 48), "blockedSenderManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "senders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEmailAddressBlocked:", v13);

  objc_msgSend(v29, "setIsBlocked:", v14);
  objc_msgSend(v29, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 40), "numberOfAttachments") != 0);
  objc_msgSend(v29, "setConversationID:", objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  objc_msgSend(*(id *)(a1 + 40), "documentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDocumentID:", v15);

  objc_msgSend(*(id *)(a1 + 48), "userProfileProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "to");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIsToMe:", objc_msgSend(v16, "isMyEmailAddressContainedInAddressList:", v17));

  objc_msgSend(*(id *)(a1 + 40), "cc");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIsCCMe:", objc_msgSend(v16, "isMyEmailAddressContainedInAddressList:", v18));

  objc_msgSend(*(id *)(a1 + 48), "vipReader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "senders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIsVIP:", objc_msgSend(v19, "isVIPAddress:", v21));

  v22 = *(_QWORD *)(a1 + 56);
  if (v22)
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v29);
  v23 = objc_opt_respondsToSelector();
  v24 = *(void **)(a1 + 40);
  if ((v23 & 1) != 0)
    objc_msgSend(v24, "bccIfAvailable");
  else
    objc_msgSend(v24, "bcc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBccList:", v25);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = objc_msgSend(*(id *)(a1 + 40), "authenticationState");
    if ((v26 & 0x10000) == 0)
    {
      v27 = (v26 >> 9) & 7;
      if ((v26 & 8) != 0 && v27 == 2)
      {
        if ((v26 & 0x34) == 0x14)
        {
LABEL_19:
          v28 = v27 == 0;
LABEL_22:
          objc_msgSend(v29, "setIsAuthenticated:", v28);
          goto LABEL_23;
        }
      }
      else if ((v26 & 4) != 0)
      {
        goto LABEL_19;
      }
    }
    v28 = 1;
    goto LABEL_22;
  }
LABEL_23:

}

+ (id)mailboxesForPersistedMessage:(id)a3 mailboxProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "labels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v5, "labels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_69_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "mailbox");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[EDMessageTransformer log](EDMessageTransformer, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "persistentID");
        objc_claimAutoreleasedReturnValue();
        +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:].cold.2();
      }

    }
    objc_msgSend(v12, "URL");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[EDMessageTransformer log](EDMessageTransformer, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "persistentID");
        objc_claimAutoreleasedReturnValue();
        +[EDMessageTransformer mailboxesForPersistedMessage:mailboxProvider:].cold.1();
      }

      v11 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke_71;
  v20[3] = &unk_1E949F1D0;
  v17 = v6;
  v21 = v17;
  objc_msgSend(v11, "ef_compactMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "URL");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __69__EDMessageTransformer_mailboxesForPersistedMessage_mailboxProvider___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v3);
  objc_msgSend(*(id *)(a1 + 32), "mailboxForObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
}

void __64__EDMessageTransformer_transformPersistedMessages_mailboxScope___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "No mailboxes were found for legacy message database id: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_transformPersistedMessage:mailboxScope:duplicateInfo:additionalBuilder:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to find mailboxes for legacy message database id: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)mailboxesForPersistedMessage:mailboxProvider:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "No mailbox URL was found for legacy message database id: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)mailboxesForPersistedMessage:mailboxProvider:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "No mailbox was found for legacy message database id: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
