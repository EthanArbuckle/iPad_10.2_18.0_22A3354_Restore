@implementation EDOutgoingMessageRepository

- (EDOutgoingMessageRepository)initWithMessagePersistence:(id)a3 messageChangeManager:(id)a4
{
  id v7;
  id v8;
  EDOutgoingMessageRepository *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDOutgoingMessageRepository;
  v9 = -[EDOutgoingMessageRepository init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.email.EDOutgoingMessageRepository", v10);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    objc_storeStrong((id *)&v9->_messageChangeManager, a4);
  }

  return v9;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EDOutgoingMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_61 != -1)
    dispatch_once(&log_onceToken_61, block);
  return (id)log_log_61;
}

void __34__EDOutgoingMessageRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_61;
  log_log_61 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EDOutgoingMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_5 != -1)
    dispatch_once(&signpostLog_onceToken_5, block);
  return (id)signpostLog_log_5;
}

void __42__EDOutgoingMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_5;
  signpostLog_log_5 = (uint64_t)v1;

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

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.email.outgoingmessagerepository.deliveryworkblock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EDOutgoingMessageRepository_performBlock___block_invoke;
  v9[3] = &unk_1E949BD50;
  v10 = v5;
  v11 = v4;
  v6 = v5;
  v7 = v4;
  v8 = _Block_copy(v9);
  dispatch_async((dispatch_queue_t)self->_workQueue, v8);

}

uint64_t __44__EDOutgoingMessageRepository_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)saveDraftMessage:(id)a3 mailboxID:(id)a4 previousDraftObjectID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__EDOutgoingMessageRepository_saveDraftMessage_mailboxID_previousDraftObjectID_completion___block_invoke;
  v18[3] = &unk_1E949F248;
  v18[4] = self;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  v22 = v13;
  v14 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  -[EDOutgoingMessageRepository performBlock:](self, "performBlock:", v18);

}

void __91__EDOutgoingMessageRepository_saveDraftMessage_mailboxID_previousDraftObjectID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_EVENT, v3, "EMAIL DELIVERY", "Begin Saving Draft %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseMessageForOutgoingMessage:isDraft:", *(_QWORD *)(a1 + 48), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstHeaderForKey:", *MEMORY[0x1E0D1E638]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagesForDocumentID:mailboxID:", v35, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addNewMessages:mailboxURL:userInitiated:", v10, v11, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D1E1E0];
  v43 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxScopeForMailboxObjectIDs:forExclusion:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messagesForPersistedMessages:mailboxScope:", v36, v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deleteMessages:", v8);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deleteMessages:", v19);

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = v34;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v24);
        objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v26, "requestSummaryForMessageObjectID:", v27);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v22);
  }

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    v31 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v46 = v31;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v29, OS_SIGNPOST_EVENT, v30, "EMAIL DELIVERY", "End Saving Draft %@", buf, 0xCu);
  }

  v32 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v21, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);

}

- (void)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__EDOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate_completion___block_invoke;
  v14[3] = &unk_1E949CB00;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[EDOutgoingMessageRepository performBlock:](self, "performBlock:", v14);

}

void __77__EDOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v34 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin saving outgoing message for outgoing message for %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseMessageForOutgoingMessage:isDraft:", *(_QWORD *)(a1 + 48), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v34 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EMAIL DELIVERY", "Base message for %{public}@ was created", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "urlForSendLaterFolder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addNewMessages:mailboxURL:userInitiated:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D1E1D8]);
  objc_msgSend(*(id *)(a1 + 32), "urlForSendLaterFolder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithURL:", v15);

  v17 = (void *)MEMORY[0x1E0D1E1E0];
  v31 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mailboxScopeForMailboxObjectIDs:forExclusion:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "messagesForPersistedMessages:mailboxScope:", v13, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v24 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134217984;
    v34 = v24;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v22, OS_SIGNPOST_INTERVAL_END, v23, "EMAIL DELIVERY", "%lu of messages are to be returned in completion", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "persistSendLaterForMessages:date:", v13, *(_QWORD *)(a1 + 40));

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    v28 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v34 = v28;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v26, OS_SIGNPOST_INTERVAL_END, v27, "EMAIL DELIVERY", "End saving outgoing message for message at for %{public}@", buf, 0xCu);
  }

  v29 = *(_QWORD *)(a1 + 56);
  if (v29)
  {
    objc_msgSend(v21, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

  }
}

- (void)updateSendLaterDate:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__EDOutgoingMessageRepository_updateSendLaterDate_message_completion___block_invoke;
  v14[3] = &unk_1E949CB00;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[EDOutgoingMessageRepository performBlock:](self, "performBlock:", v14);

}

void __70__EDOutgoingMessageRepository_updateSendLaterDate_message_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "documentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin editing outgoing message for documentID %@ at for %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistedMessagesForObjectIDs:requireProtectedData:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistSendLaterForMessages:date:", v9, *(_QWORD *)(a1 + 48));

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(*(id *)(a1 + 40), "documentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v11, OS_SIGNPOST_INTERVAL_END, v12, "EMAIL DELIVERY", "End editing outgoing message for documentID %@ at for %{public}@", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__EDOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID_completion___block_invoke;
  v14[3] = &unk_1E949CB00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[EDOutgoingMessageRepository performBlock:](self, "performBlock:", v14);

}

void __95__EDOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
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
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "documentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EMAIL DELIVERY", "Begin removing send later date for message with documentID %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedMessagesForObjectIDs:requireProtectedData:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistSendLaterForMessages:date:", v8, 0);

  objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moveMessages:destinationMailboxURL:userInitiated:", v8, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D1E1E0];
  v23 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mailboxScopeForMailboxObjectIDs:forExclusion:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messagesForPersistedMessages:mailboxScope:", v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDOutgoingMessageRepository signpostLog](EDOutgoingMessageRepository, "signpostLog");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    objc_msgSend(*(id *)(a1 + 40), "documentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EMAIL DELIVERY", "End removing send later date for message for documentID %@", buf, 0xCu);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v17, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository scheduleAlarmForSendLaterDate:completion:]", "EDOutgoingMessageRepository.m", 129, "0");
}

- (void)deleteDraftsInMailboxID:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  EDOutgoingMessageRepository *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke;
  v14[3] = &unk_1E949B680;
  v15 = v10;
  v16 = self;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[EDOutgoingMessageRepository performBlock:](self, "performBlock:", v14);

}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t *v9;
  uint64_t *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    +[EDOutgoingMessageRepository log](EDOutgoingMessageRepository, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *v2;
      v20 = 138412290;
      v21 = v4;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Deleting Draft %@", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "messageChangeManager");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteMessages:](v8, "deleteMessages:", v7);
    }
    else
    {
      +[EDOutgoingMessageRepository log](EDOutgoingMessageRepository, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_2(v2, v8);
    }

  }
  v9 = (uint64_t *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    v10 = (uint64_t *)(a1 + 56);
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "messagesForDocumentID:mailboxID:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDOutgoingMessageRepository log](EDOutgoingMessageRepository, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *v10;
        v14 = *v9;
        v20 = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Deleting draft messages for documentID %@ in mailboxID %@", (uint8_t *)&v20, 0x16u);
      }

      if (objc_msgSend(v11, "count"))
      {
        +[EDOutgoingMessageRepository log](EDOutgoingMessageRepository, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend(v11, "count");
          v17 = *v10;
          v18 = *v9;
          v20 = 134218498;
          v21 = v16;
          v22 = 2112;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Deleting %lu messages for documentID %@ in mailboxID %@", (uint8_t *)&v20, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 40), "messageChangeManager");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject deleteMessages:](v19, "deleteMessages:", v11);
      }
      else
      {
        +[EDOutgoingMessageRepository log](EDOutgoingMessageRepository, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_1((uint64_t *)(a1 + 56), (uint64_t *)(a1 + 48), v19);
      }

    }
  }
}

- (void)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a6;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository deliverMessage:usingMailDrop:isCancelable:completion:]", "EDOutgoingMessageRepository.m", 158, "0");
}

- (id)outgoingMessageFromPersistedMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository outgoingMessageFromPersistedMessage:]", "EDOutgoingMessageRepository.m", 162, "0");
}

- (void)cancelLastDelayedMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository cancelLastDelayedMessage:]", "EDOutgoingMessageRepository.m", 166, "0");
}

- (void)isProcessingWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository isProcessingWithCompletion:]", "EDOutgoingMessageRepository.m", 170, "0");
}

- (void)numberOfPendingMessagesWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository numberOfPendingMessagesWithCompletion:]", "EDOutgoingMessageRepository.m", 174, "0");
}

- (void)outboxContainsMessageFromAccountObjectID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository outboxContainsMessageFromAccountObjectID:completion:]", "EDOutgoingMessageRepository.m", 178, "0");
}

- (void)processAllQueuedMessages
{
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository processAllQueuedMessages]", "EDOutgoingMessageRepository.m", 182, "0");
}

- (void)resumeDeliveryQueue
{
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository resumeDeliveryQueue]", "EDOutgoingMessageRepository.m", 186, "0");
}

- (void)suspendDeliveryQueue
{
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository suspendDeliveryQueue]", "EDOutgoingMessageRepository.m", 190, "0");
}

- (id)messagesForDocumentID:(id)a3 mailboxID:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository messagesForDocumentID:mailboxID:]", "EDOutgoingMessageRepository.m", 194, "0");
}

- (void)startObservingPendingMessageChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository startObservingPendingMessageChangesWithChangeObserver:observationIdentifier:]", "EDOutgoingMessageRepository.m", 198, "0");
}

- (void)cancelObservation:(id)a3
{
  id v5;

  v5 = a3;
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository cancelObservation:]", "EDOutgoingMessageRepository.m", 202, "0");
}

- (id)urlForSendLaterFolder
{
  -[EDOutgoingMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDOutgoingMessageRepository urlForSendLaterFolder]", "EDOutgoingMessageRepository.m", 206, "0");
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
  objc_storeStrong((id *)&self->_messagePersistence, a3);
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to find persisted message for draft documentID %@ in mailboxID %@", (uint8_t *)&v5, 0x16u);
}

void __88__EDOutgoingMessageRepository_deleteDraftsInMailboxID_documentID_previousDraftObjectID___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Unable to find persisted message for draft: %@", (uint8_t *)&v3, 0xCu);
}

@end
