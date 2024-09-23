@implementation MFMessagePersistence_iOS

- (id)expressionForFindingOnlyJournaledMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MFMessagePersistence_iOS;
  -[MFMessagePersistence_iOS expressionForFilteringUnavailableMessages](&v13, sel_expressionForFilteringUnavailableMessages);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D1EFF0];
  v4 = (void *)MEMORY[0x1E0D1EFC0];
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "table:column:", v5, CFSTR("journaled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", &unk_1E4F6A3F0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlikely:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D1EF90];
  v14[0] = v2;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combined:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)expressionForFilteringUnavailableMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MFMessagePersistence_iOS;
  -[MFMessagePersistence_iOS expressionForFilteringUnavailableMessages](&v13, sel_expressionForFilteringUnavailableMessages);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D1EFF0];
  v4 = (void *)MEMORY[0x1E0D1EFC0];
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "table:column:", v5, CFSTR("journaled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "equalTo:", &unk_1E4F6A408);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "likely:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D1EF90];
  v14[0] = v2;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combined:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MFMessagePersistence_iOS)initWithMailboxPersistence:(id)a3 database:(id)a4 userProfileProvider:(id)a5 blockedSenderManager:(id)a6 vipReader:(id)a7 hookRegistry:(id)a8 library:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MFMessagePersistence_iOS *v22;
  MFMessagePersistence_iOS *v23;
  MFMailMessageLibraryQueryTransformer *v24;
  MFMailMessageLibraryQueryTransformer *queryTransformer;
  uint64_t v26;
  EFScheduler *networkContentLoadScheduler;
  uint64_t v28;
  EFScheduler *offlineContentLoadScheduler;
  NSMutableDictionary *v30;
  NSMutableDictionary *summaryLoaders;
  uint64_t v32;
  EFLazyCache *obsoleteGlobalMessageIDToDatabaseIDMap;
  NSObject *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *requestSummaryQueue;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)MFMessagePersistence_iOS;
  v22 = -[MFMessagePersistence_iOS initWithMailboxPersistence:database:hookRegistry:userProfileProvider:blockedSenderManager:vipReader:gmailLabelPersistence:](&v39, sel_initWithMailboxPersistence_database_hookRegistry_userProfileProvider_blockedSenderManager_vipReader_gmailLabelPersistence_, v15, v16, v20, v17, v18, v19, 0);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_library, v21);
    v24 = -[MFMailMessageLibraryQueryTransformer initWithMessagePersistence:]([MFMailMessageLibraryQueryTransformer alloc], "initWithMessagePersistence:", v23);
    queryTransformer = v23->_queryTransformer;
    v23->_queryTransformer = v24;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.messagePersistence.contentLoad.network"), 17);
    v26 = objc_claimAutoreleasedReturnValue();
    networkContentLoadScheduler = v23->_networkContentLoadScheduler;
    v23->_networkContentLoadScheduler = (EFScheduler *)v26;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.messagePersistence.contentLoad.offline"), -1);
    v28 = objc_claimAutoreleasedReturnValue();
    offlineContentLoadScheduler = v23->_offlineContentLoadScheduler;
    v23->_offlineContentLoadScheduler = (EFScheduler *)v28;

    v23->_summaryLock._os_unfair_lock_opaque = 0;
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    summaryLoaders = v23->_summaryLoaders;
    v23->_summaryLoaders = v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 500);
    obsoleteGlobalMessageIDToDatabaseIDMap = v23->_obsoleteGlobalMessageIDToDatabaseIDMap;
    v23->_obsoleteGlobalMessageIDToDatabaseIDMap = (EFLazyCache *)v32;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_USER_INITIATED, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create("SummaryLoaderQueue", v35);
    requestSummaryQueue = v23->_requestSummaryQueue;
    v23->_requestSummaryQueue = (OS_dispatch_queue *)v36;

    objc_msgSend(v20, "registerMessageChangeHookResponder:", v23);
  }

  return v23;
}

- (void)setSummaryLoaderProvider:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLoaderProvider, a3);
}

- (id)createContextForIteration
{
  return (id)objc_opt_new();
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MFMessagePersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1)
    dispatch_once(&log_onceToken_22, block);
  return (OS_os_log *)(id)log_log_22;
}

- (id)messageIDsWithBasePaths:(id)a3
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
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  MFMessagePersistence_iOS *v23;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26[0] = CFSTR("global_message_id");
  v26[1] = CFSTR("mailbox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithResult:table:", v9, CFSTR("messages"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v12);

  -[MFMessagePersistence_iOS database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessagePersistence_iOS messageIDsWithBasePaths:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__MFMessagePersistence_iOS_messageIDsWithBasePaths___block_invoke;
  v21[3] = &unk_1E4E8A670;
  v15 = v10;
  v22 = v15;
  v23 = self;
  v16 = v5;
  v24 = v16;
  v17 = v4;
  v25 = v17;
  objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v21);

  v18 = v25;
  v19 = v16;

  return v19;
}

- (id)baseMessageForOutgoingMessage:(id)a3 isDraft:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(a3, "messageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessage messageWithRFC822Data:](MFMailMessage, "messageWithRFC822Data:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "markAsViewed");
    objc_msgSend(v6, "setMessageFlags:", objc_msgSend(v6, "messageFlags") | 0x40);
    objc_msgSend(v6, "senders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "mailboxUidOfType:createIfNeeded:", 5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storeForMailboxUid:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openSynchronously");

  }
  return v6;
}

- (id)requestContentForMessageObjectID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  unint64_t v43;
  EFScheduler *offlineContentLoadScheduler;
  EFScheduler *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id WeakRetained;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  MFMessagePersistence_iOS *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  unint64_t v74;
  BOOL v75;
  _QWORD aBlock[4];
  id v77;
  id v78;
  MFMessagePersistence_iOS *v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v60 = a5;
  v56 = a6;
  v58 = a7;
  v59 = v12;
  -[MFMessagePersistence_iOS _libraryMessageForMessageObjectID:preferNonOutgoingMessages:](self, "_libraryMessageForMessageObjectID:preferNonOutgoingMessages:", v12, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    EMLogCategoryMessageLoading();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v60, "requestedRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v82 = v14;
      v83 = 2114;
      v84 = v15;
      v85 = 2114;
      v86 = v12;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "requesting %{public}@ content for message %{public}@ (%{public}@)", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v60, "networkUsage") != 0;
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EFBundleIdentifierForXPCConnection();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v51 = v18;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("client_%d"), objc_msgSend(v30, "processIdentifier"));
      v51 = (id)objc_claimAutoreleasedReturnValue();

    }
    v50 = objc_alloc_init(MEMORY[0x1E0D1EAF8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    objc_msgSend(WeakRetained, "persistence");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "listUnsubscribeHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke;
    aBlock[3] = &unk_1E4E8E0B8;
    v34 = v57;
    v77 = v34;
    v35 = v52;
    v78 = v35;
    v79 = self;
    v80 = v58;
    v36 = _Block_copy(aBlock);
    v63[0] = v33;
    v63[1] = 3221225472;
    v63[2] = __106__MFMessagePersistence_iOS_requestContentForMessageObjectID_requestID_options_delegate_completionHandler___block_invoke_2;
    v63[3] = &unk_1E4E8E0E0;
    v75 = v16;
    v37 = v60;
    v64 = v37;
    v38 = v59;
    v65 = v38;
    v66 = self;
    v74 = a4;
    v39 = v34;
    v67 = v39;
    v54 = v50;
    v68 = v54;
    v62 = v32;
    v69 = v62;
    v53 = v51;
    v70 = v53;
    v40 = v56;
    v71 = v40;
    v49 = v36;
    v73 = v49;
    v41 = v35;
    v72 = v41;
    v55 = _Block_copy(v63);
    v42 = (void *)objc_msgSend(v37, "copyWithBuilder:", &__block_literal_global_57);
    v43 = a4;
    if (self)
      offlineContentLoadScheduler = self->_offlineContentLoadScheduler;
    else
      offlineContentLoadScheduler = 0;
    v45 = offlineContentLoadScheduler;
    -[MFMessagePersistence_iOS messageTransformer](self, "messageTransformer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageContentRequest onScheduler:requestID:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:](MFMessageContentRequest, "onScheduler:requestID:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:", v45, v43, v38, self, v39, v46, v54, v62, v53, v42, v40, v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "addChild:withPendingUnitCount:", v47, 1);
    v28 = v41;

    v27 = v53;
  }
  else
  {
    EMLogCategoryMessageLoading();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFMessagePersistence_iOS requestContentForMessageObjectID:requestID:options:delegate:completionHandler:].cold.1((uint64_t)v12, v20, v21, v22, v23, v24, v25, v26);

    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    (*((void (**)(id, _QWORD, void *))v58 + 2))(v58, 0, v27);
  }

  return v28;
}

- (void)generateSummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *requestSummaryQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  EMLogCategoryMessageLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Requesting summary immediately for: %@ (download? %{BOOL}d)", buf, 0x12u);

  }
  if (self)
    requestSummaryQueue = self->_requestSummaryQueue;
  else
    requestSummaryQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MFMessagePersistence_iOS_generateSummaryForMessage_downloadIfNecessary___block_invoke;
  block[3] = &unk_1E4E8E148;
  block[4] = self;
  v12 = v6;
  v13 = v4;
  v10 = v6;
  dispatch_async(requestSummaryQueue, block);

}

- (id)requestSummaryForMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMessagePersistence_iOS libraryMessageForMessageObjectID:](self, "libraryMessageForMessageObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MFMessagePersistence_iOS _requestSummaryForLibraryMessage:](self, "_requestSummaryForLibraryMessage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MFMessagePersistence_iOS log](MFMessagePersistence_iOS, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "Cannot create summary loader. No Library Message for object ID: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)_requestSummaryForLibraryMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MFMessagePersistence_iOS summaryLoaderProvider](self, "summaryLoaderProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageSummaryLoaderForMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "requestSummary");
  return v6;
}

- (id)libraryMessageForMessageObjectID:(id)a3
{
  -[MFMessagePersistence_iOS _libraryMessageForMessageObjectID:preferNonOutgoingMessages:](self, "_libraryMessageForMessageObjectID:preferNonOutgoingMessages:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_libraryMessageForMessageObjectID:(id)a3 preferNonOutgoingMessages:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessagePersistence_iOS persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:](self, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v8, "ef_firstObjectPassingTest:", &__block_literal_global_63),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMessageStore:", v11);

  return v9;
}

- (id)enabledAccountMailboxesExpression
{
  void *v2;
  void *v3;

  -[MFMessagePersistence_iOS library]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledAccountMailboxesExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)library
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
  return WeakRetained;
}

- (id)cachedDatabaseIDsDictionaryForGlobalMessageIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[EFLazyCache cachedObjectForKey:](self->_obsoleteGlobalMessageIDToDatabaseIDMap, "cachedObjectForKey:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)setContentProtectionForAttachmentFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "mf_protectFileAtPath:withClass:error:", v5, 2, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    +[MFMessagePersistence_iOS log](MFMessagePersistence_iOS, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessagePersistence_iOS setContentProtectionForAttachmentFile:].cold.1(v9, (uint64_t)v7, (uint64_t)v11, v8);
    }

  }
}

- (int64_t)globalIDForMessageWithDatabaseID:(int64_t)a3 mailboxScope:(id *)a4
{
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  _QWORD v24[8];
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a4 != 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__18;
  v30 = __Block_byref_object_dispose__18;
  v31 = 0;
  -[MFMessagePersistence_iOS database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessagePersistence_iOS globalIDForMessageWithDatabaseID:mailboxScope:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__MFMessagePersistence_iOS_globalIDForMessageWithDatabaseID_mailboxScope___block_invoke;
  v24[3] = &unk_1E4E8E1D8;
  v25 = v7;
  v24[4] = self;
  v24[5] = &v32;
  v24[6] = &v26;
  v24[7] = a3;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v24);

  if (a4)
  {
    if (v33[3])
    {
      if (v27[5])
      {
        v10 = objc_alloc(MEMORY[0x1E0C99E98]);
        v11 = (void *)objc_msgSend(v10, "initWithString:", v27[5]);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v11);
        v13 = (void *)MEMORY[0x1E0D1E1E0];
        v36[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mailboxScopeForMailboxObjectIDs:forExclusion:", v14, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D1E1E0], "noMailboxesScope");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        +[MFMessagePersistence_iOS log](MFMessagePersistence_iOS, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MFMessagePersistence_iOS globalIDForMessageWithDatabaseID:mailboxScope:].cold.1(a3, v15, v16, v17, v18, v19, v20, v21);

      }
    }
    else
    {
      *a4 = 0;
    }
  }
  v22 = v33[3];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

- (id)persistedMessageForSQLRow:(id)a3 connection:(id)a4 iterationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFMessagePersistence_iOS library]((id *)&self->super.super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (defaultLibraryOptions_onceToken != -1)
      dispatch_once(&defaultLibraryOptions_onceToken, &__block_literal_global_51);
    self = (MFMessagePersistence_iOS *)defaultLibraryOptions_defaultLibraryOptions;
  }
  objc_msgSend(v11, "_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:", v8, self, mach_absolute_time(), v9, objc_msgSend(v9, "protectedDatabaseAttached"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)flagsForLegacyFlags:(int64_t)a3 numberOfAttachments:(int64_t *)a4
{
  int64_t v4;

  if ((unsigned __int16)a3 >> 10 == 63)
    v4 = 0;
  else
    v4 = (unsigned __int16)a3 >> 10;
  *a4 = v4;
  return MFFlagsObjectForFlags(a3);
}

- (id)fullDataIfAvailableForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  char v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessagePersistence_iOS.m"), 370, CFSTR("Unexpected message class"));

  }
  v10 = 0;
  objc_msgSend(v5, "messageDataIsComplete:downloadIfNecessary:", &v10, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v10)
  {

    v7 = 0;
  }

  return v7;
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v8;
  EFLazyCache *obsoleteGlobalMessageIDToDatabaseIDMap;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  obsoleteGlobalMessageIDToDatabaseIDMap = self->_obsoleteGlobalMessageIDToDatabaseIDMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__MFMessagePersistence_iOS_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
  v13[3] = &unk_1E4E8E200;
  v12 = v8;
  v14 = v12;
  v11 = (id)-[EFLazyCache objectForKey:generator:](obsoleteGlobalMessageIDToDatabaseIDMap, "objectForKey:generator:", v10, v13);

}

- (id)collectStatistics
{
  MFMessagePersistenceStatistics_iOS *v3;
  void *v4;
  void *v5;
  MFMessagePersistenceStatistics_iOS *v6;
  _QWORD v8[4];
  MFMessagePersistenceStatistics_iOS *v9;
  objc_super v10;

  v3 = objc_alloc_init(MFMessagePersistenceStatistics_iOS);
  v10.receiver = self;
  v10.super_class = (Class)MFMessagePersistence_iOS;
  -[MFMessagePersistence_iOS collectStatisticsWithStatistics:](&v10, sel_collectStatisticsWithStatistics_, v3);
  -[MFMessagePersistence_iOS database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessagePersistence_iOS collectStatistics]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MFMessagePersistence_iOS_collectStatistics__block_invoke;
  v8[3] = &unk_1E4E8AB20;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

- (MFMessageSummaryLoaderProvider)summaryLoaderProvider
{
  return self->_summaryLoaderProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSummaryQueue, 0);
  objc_storeStrong((id *)&self->_offlineContentLoadScheduler, 0);
  objc_storeStrong((id *)&self->_networkContentLoadScheduler, 0);
  objc_storeStrong((id *)&self->_queryTransformer, 0);
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_summaryLoaderProvider, 0);
  objc_storeStrong((id *)&self->_obsoleteGlobalMessageIDToDatabaseIDMap, 0);
  objc_storeStrong((id *)&self->_summaryLoaders, 0);
}

- (void)requestContentForMessageObjectID:(uint64_t)a3 requestID:(uint64_t)a4 options:(uint64_t)a5 delegate:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "requestContent: no library message for objectID %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)setContentProtectionForAttachmentFile:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_0(&dword_1A4F90000, "Error setting the protection class on \"%@\": %@", (uint8_t *)a3, a4);

}

- (void)globalIDForMessageWithDatabaseID:(uint64_t)a3 mailboxScope:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "Could not find mailbox for message with database ID %lld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
