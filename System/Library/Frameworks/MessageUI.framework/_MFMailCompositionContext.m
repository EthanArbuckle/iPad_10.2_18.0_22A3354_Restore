@implementation _MFMailCompositionContext

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___MFMailCompositionContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (id)log_log_5;
}

- (_MFMailCompositionContext)init
{
  return -[_MFMailCompositionContext initWithComposeType:](self, "initWithComposeType:", 0);
}

- (_MFMailCompositionContext)initWithURL:(id)a3
{
  return -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", a3, 0, 0, 0);
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:](self, "initWithComposeType:originalMessage:legacyMessage:", a3, 0, 0);
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5 isEML:(BOOL)a6
{
  return -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:isEML:](self, "initWithURL:composeType:originalMessage:legacyMessage:isEML:", 0, a3, a4, a5, a6);
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5
{
  return -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", 0, a3, a4, a5);
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 RFC822Data:(id)a4
{
  id v6;
  void *v7;
  _MFMailCompositionContext *v8;
  _MFMailCompositionContext *v9;
  void *v10;
  MFAttachmentComposeManager *attachmentManager;
  void *v12;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4D588], "messageWithRFC822Data:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", 0, a3, 0, v7);
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5F0]), "initWithMessageData:parentPart:", v6, 0);
    attachmentManager = v9->_attachmentManager;
    objc_msgSend(v7, "messageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentComposeManager addProvider:forBaseURL:](attachmentManager, "addProvider:forBaseURL:", v10, v12);

  }
  return v9;
}

- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6
{
  return -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:isEML:](self, "initWithURL:composeType:originalMessage:legacyMessage:isEML:", a3, a4, a5, a6, 0);
}

- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6 isEML:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  _MFMailCompositionContext *v15;
  _MFMailCompositionContext *v16;
  _MFMailCompositionContext *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  EMMessageList *messageList;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  MFAttachmentComposeManager *attachmentManager;
  MFAttachmentComposeManager *v45;
  MFAttachmentComposeManager *v46;
  void *v47;
  MFAttachmentComposeManager *v48;
  void *v49;
  MFAttachmentCompositionContext *v50;
  MFAttachmentCompositionContext *attachmentContext;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  uint64_t v60;
  EFScheduler *observationScheduler;
  objc_super v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v63.receiver = self;
  v63.super_class = (Class)_MFMailCompositionContext;
  v15 = -[_MFMailCompositionContext init](&v63, sel_init);
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_legacyMessage, a6);
    objc_storeStrong((id *)&v16->_originalMessage, a5);
    -[_MFMailCompositionContext setComposeType:](v17, "setComposeType:", a4);
    objc_msgSend(v13, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serializedRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext setSerializedMessageObjectID:](v17, "setSerializedMessageObjectID:", v19);

    MFMessageComposeLoadingSignpostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v17->_signpostID = os_signpost_id_generate(v20);

    if (v13 && !a7)
    {
      objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInConversation:", objc_msgSend(v13, "conversationID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0D1E2C0]);
      v23 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v22, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v23, v21, v25, 0, CFSTR("MFMailCompositionContext"));

      v27 = objc_alloc(MEMORY[0x1E0D1E238]);
      objc_msgSend(v13, "repository");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithQuery:repository:", v26, v28);
      messageList = v17->_messageList;
      v17->_messageList = (EMMessageList *)v29;

      -[EMMessageList beginObserving:](v17->_messageList, "beginObserving:", v17);
    }
    if (v14 && (unint64_t)a4 <= 9 && ((1 << a4) & 0x274) != 0)
    {
      if (objc_msgSend(v14, "sourceIsManaged"))
        v31 = 2;
      else
        v31 = 1;
      -[_MFMailCompositionContext setSourceAccountManagement:](v17, "setSourceAccountManagement:", v31);
    }
    if (v12)
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1C8]), "initWithURL:", v12);
      objc_msgSend(v32, "toRecipients");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ef_map:", &__block_literal_global_25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setToRecipients:](v17, "setToRecipients:", v34);

      objc_msgSend(v32, "ccRecipients");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "ef_map:", &__block_literal_global_45_0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setCcRecipients:](v17, "setCcRecipients:", v36);

      objc_msgSend(v32, "bccRecipients");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "ef_map:", &__block_literal_global_46);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setBccRecipients:](v17, "setBccRecipients:", v38);

      objc_msgSend(v32, "subject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setSubject:](v17, "setSubject:", v39);

      objc_msgSend(v32, "from");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        objc_msgSend(v32, "from");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MFMailCompositionContext setHideMyEmailFrom:](v17, "setHideMyEmailFrom:", v41);

      }
      objc_msgSend(v32, "body");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setMessageBody:isHTML:](v17, "setMessageBody:isHTML:", v42, 1);

    }
    objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
    v43 = objc_claimAutoreleasedReturnValue();
    attachmentManager = v17->_attachmentManager;
    v17->_attachmentManager = (MFAttachmentComposeManager *)v43;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = (MFAttachmentComposeManager *)objc_alloc_init(MEMORY[0x1E0D4D510]);
      v46 = v17->_attachmentManager;
      v17->_attachmentManager = v45;

    }
    if (v14)
    {
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5F0]), "initWithMessage:", v14);
      v48 = v17->_attachmentManager;
      objc_msgSend(v14, "messageURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachmentComposeManager addProvider:forBaseURL:](v48, "addProvider:forBaseURL:", v47, v49);

    }
    v50 = (MFAttachmentCompositionContext *)objc_alloc_init(MEMORY[0x1E0D4D518]);
    attachmentContext = v17->_attachmentContext;
    v17->_attachmentContext = v50;

    -[MFMailMessage messageURL](v17->_legacyMessage, "messageURL");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentCompositionContext setAttachmentsBaseURL:](v17->_attachmentContext, "setAttachmentsBaseURL:", v52);

    -[MFAttachmentCompositionContext setAttachmentsManager:](v17->_attachmentContext, "setAttachmentsManager:", v17->_attachmentManager);
    -[_MFMailCompositionContext setShowContentImmediately:](v17, "setShowContentImmediately:", 1);
    -[_MFMailCompositionContext setCaretPosition:](v17, "setCaretPosition:", 0x7FFFFFFFFFFFFFFFLL);
    -[_MFMailCompositionContext setDefaultContentVariationIndex:](v17, "setDefaultContentVariationIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_MFMailCompositionContext setDeferredAttachments:](v17, "setDeferredAttachments:", v53);

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKey:", CFSTR("IncludeAttachmentReplies"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
      v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("IncludeAttachmentRepliesWhenAdding"));
    else
      v57 = 1;
    v17->_includeAttachmentsWhenAdding = v57;
    v58 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mail.MFMailCompositionContext.observationScheduler"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "serialDispatchQueueSchedulerWithName:", v59);
    v60 = objc_claimAutoreleasedReturnValue();
    observationScheduler = v17->_observationScheduler;
    v17->_observationScheduler = (EFScheduler *)v60;

    v17->_isQuickReply = 0;
  }

  return v17;
}

- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 messageRepository:(id)a5 originalMessageObjectID:(id)a6
{
  return -[_MFMailCompositionContext initRecoveredAutosavedMessageWithIdentifier:draftSubject:composeType:messageRepository:originalMessageObjectID:](self, "initRecoveredAutosavedMessageWithIdentifier:draftSubject:composeType:messageRepository:originalMessageObjectID:", a3, a4, 7, a5, a6);
}

- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 composeType:(int64_t)a5 messageRepository:(id)a6 originalMessageObjectID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _MFMailCompositionContext *v16;
  _MFMailCompositionContext *v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", 0, a5, 0, 0);
  v17 = v16;
  if (v16)
  {
    v16->_isLoadingMessageData = 1;
    objc_storeStrong((id *)&v16->_draftSubject, a4);
    -[_MFMailCompositionContext setAutosaveIdentifier:](v17, "setAutosaveIdentifier:", v12);
    -[_MFMailCompositionContext _loadMessageWithAutosaveIdentifier:messageRepository:originalMessageObjectID:](v17, "_loadMessageWithAutosaveIdentifier:messageRepository:originalMessageObjectID:", v12, v14, v15);
  }

  return v17;
}

- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 4, a3, a4, 0);
}

- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 5, a3, a4, 0);
}

- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 6, a3, a4, 0);
}

- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 4, a3, a4, a5);
}

- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 5, a3, a4, a5);
}

- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:isEML:](self, "initWithComposeType:originalMessage:legacyMessage:isEML:", 6, a3, a4, a5);
}

- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:](self, "initWithComposeType:originalMessage:legacyMessage:", 2, a3, a4);
}

- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4 draftSubject:(id)a5
{
  id v9;
  _MFMailCompositionContext *v10;
  _MFMailCompositionContext *v11;

  v9 = a5;
  v10 = -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", 0, 2, a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_isLoadingMessageData = 0;
    objc_storeStrong((id *)&v10->_draftSubject, a5);
  }

  return v11;
}

- (id)initSendAgainDraftOfMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:](self, "initWithComposeType:originalMessage:legacyMessage:", 8, a3, a4);
}

- (id)initOutboxRestoreOfMessage:(id)a3 legacyMessage:(id)a4
{
  return -[_MFMailCompositionContext initWithComposeType:originalMessage:legacyMessage:](self, "initWithComposeType:originalMessage:legacyMessage:", 3, a3, a4);
}

- (_MFMailCompositionContext)initWithHandoffActivityPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MFMailCompositionContext *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_MFMailCompositionContext initWithComposeType:]([_MFMailCompositionContext alloc], "initWithComposeType:", 0);

  -[_MFMailCompositionContext setShowKeyboardImmediately:](v11, "setShowKeyboardImmediately:", 1);
  if (v5)
    -[_MFMailCompositionContext setPreferredSendingEmailAddress:](v11, "setPreferredSendingEmailAddress:", v5);
  -[_MFMailCompositionContext setToRecipients:](v11, "setToRecipients:", v6);
  -[_MFMailCompositionContext setCcRecipients:](v11, "setCcRecipients:", v7);
  -[_MFMailCompositionContext setBccRecipients:](v11, "setBccRecipients:", v8);
  -[_MFMailCompositionContext setSubject:](v11, "setSubject:", v9);
  -[_MFMailCompositionContext setMessageBody:isHTML:](v11, "setMessageBody:isHTML:", v10, 0);

  return v11;
}

- (_MFMailCompositionContext)initWithCompositionValueRepresentation:(id)a3 hostApplicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  MFMailCompositionValues *v8;
  void *v9;
  void *v10;
  void *v11;
  _MFMailCompositionContext *v12;
  _MFMailCompositionContext *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[MFMailCompositionValues initWithDictionaryRepresentation:]([MFMailCompositionValues alloc], "initWithDictionaryRepresentation:", v6);
  -[MFMailCompositionValues autosaveIdentifier](v8, "autosaveIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues mailtoURL](v8, "mailtoURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailCompositionValues subject](v8, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = -[_MFMailCompositionContext initRecoveredAutosavedMessageWithIdentifier:draftSubject:messageRepository:originalMessageObjectID:](self, "initRecoveredAutosavedMessageWithIdentifier:draftSubject:messageRepository:originalMessageObjectID:", v9, v11, 0, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = -[_MFMailCompositionContext initWithURL:](self, "initWithURL:", v10);
    else
      v12 = -[_MFMailCompositionContext initWithCompositionValues:hostApplicationBundleIdentifier:](self, "initWithCompositionValues:hostApplicationBundleIdentifier:", v8, v7);
  }
  v13 = v12;

  return v13;
}

- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4
{
  return -[_MFMailCompositionContext initWithCompositionValues:hostApplicationBundleIdentifier:messageRepository:mailboxProvider:](self, "initWithCompositionValues:hostApplicationBundleIdentifier:messageRepository:mailboxProvider:", a3, a4, 0, 0);
}

- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  _MFMailCompositionContext *v16;
  _MFMailCompositionContext *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[_MFMailCompositionContext initWithComposeType:](self, "initWithComposeType:", objc_msgSend(v12, "composeType"));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_compositionValues, a3);
    objc_storeStrong((id *)&v17->_originatingBundleID, a4);
    objc_msgSend(v12, "serializedMessageObjectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("MFMailCompositionContext.m"), 319, CFSTR("Expected repository to load message"));

      }
      objc_msgSend(MEMORY[0x1E0D1E258], "objectIDFromSerializedRepresentation:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serializedMailboxObjectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0D1E1D8], "objectIDFromSerializedRepresentation:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        MFComposeLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AB96A000, v22, OS_LOG_TYPE_DEFAULT, "Mailbox object ID is not available, fallback to default", buf, 2u);
        }

        v21 = 0;
      }
      objc_msgSend(v12, "deferredAttachments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext setDeferredAttachments:](v17, "setDeferredAttachments:", v23);

      -[_MFMailCompositionContext _loadMessageWithObjectID:mailboxObjectID:messageRepository:mailboxProvider:](v17, "_loadMessageWithObjectID:mailboxObjectID:messageRepository:mailboxProvider:", v19, v21, v14, v15);
    }

  }
  return v17;
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 objectID:(id)a4 mailboxID:(id)a5 subject:(id)a6 autosaveID:(id)a7 messageRepository:(id)a8 mailboxProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _MFMailCompositionContext *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v16)
  {
    if (v20)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailCompositionContext.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

    if (v20)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailCompositionContext.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageRepository"));

LABEL_3:
  v22 = -[_MFMailCompositionContext initWithURL:composeType:originalMessage:legacyMessage:](self, "initWithURL:composeType:originalMessage:legacyMessage:", 0, a3, 0, 0);
  if (v22)
  {
    +[MFComposeTypeFactory subjectFromSubject:withComposeType:](MFComposeTypeFactory, "subjectFromSubject:withComposeType:", v18, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext setSubject:](v22, "setSubject:", v23);

    -[_MFMailCompositionContext setAutosaveIdentifier:](v22, "setAutosaveIdentifier:", v19);
    objc_msgSend(v16, "serializedRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext setSerializedMessageObjectID:](v22, "setSerializedMessageObjectID:", v24);

    objc_msgSend(v17, "serializedRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext setSerializedMailboxObjectID:](v22, "setSerializedMailboxObjectID:", v25);

    -[_MFMailCompositionContext _loadMessageWithObjectID:mailboxObjectID:messageRepository:mailboxProvider:](v22, "_loadMessageWithObjectID:mailboxObjectID:messageRepository:mailboxProvider:", v16, v17, v20, v21);
  }

  return v22;
}

- (void)_loadMessageWithObjectID:(id)a3 mailboxObjectID:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;

  v10 = a4;
  v11 = a6;
  self->_isLoadingMessageData = 1;
  objc_msgSend(a5, "messageForObjectID:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke;
  v20[3] = &unk_1E5A68E48;
  objc_copyWeak(&v23, &location);
  v15 = v11;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v12, "onScheduler:addSuccessBlock:", v13, v20);

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_75;
  v18[3] = &unk_1E5A68E70;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v12, "onScheduler:addFailureBlock:", v17, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_loadMessageWithAutosaveIdentifier:(id)a3 messageRepository:(id)a4 originalMessageObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = v9;
  objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "autosavedMessageDataWithIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && (*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED88] + 16))())
  {
    objc_msgSend(v9, "messageForObjectID:", v10);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MFComposeLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[_MFMailCompositionContext _loadMessageWithAutosaveIdentifier:messageRepository:originalMessageObjectID:].cold.1((uint64_t)v8, (uint64_t)self, v16);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke;
  v26[3] = &unk_1E5A68F10;
  objc_copyWeak(&v29, &location);
  v18 = v8;
  v27 = v18;
  v19 = v13;
  v28 = v19;
  objc_msgSend(v12, "onScheduler:addSuccessBlock:", v15, v26);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_84;
  v23[3] = &unk_1E5A68EC0;
  objc_copyWeak(&v25, &location);
  v21 = v18;
  v24 = v21;
  objc_msgSend(v12, "onScheduler:addFailureBlock:", v20, v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_notifyDidFinishLoadingWithLegacyMessage:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_legacyMessage, a3);
  v5 = a3;
  self->_isLoadingMessageData = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mailCompositionContext:didFinishLoadingMessage:legacyMessage:error:", self, 0, v5, 0);

}

- (_MFMailCompositionContext)initWithOpenMailComposeContext:(id)a3
{
  void *v4;
  void *v5;
  _MFMailCompositionContext *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v29;
  id obj;
  uint8_t v31;
  _BYTE v32[7];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(v29, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hostApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MFMailCompositionContext initWithCompositionValueRepresentation:hostApplicationBundleIdentifier:](self, "initWithCompositionValueRepresentation:hostApplicationBundleIdentifier:", v4, v5);

  if (v6)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v29, "attachments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v35;
      obj = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v11, "data");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "data");
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mimeType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fileName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[_MFMailCompositionContext addAttachmentData:mimeType:fileName:](v6, "addAttachmentData:mimeType:fileName:", v13, v14, v15);

          }
          else
          {
            objc_msgSend(v11, "fileURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = (void *)MEMORY[0x1E0D4D538];
              objc_msgSend(v11, "fileURL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "securityScopedURL:", v19);
              v13 = objc_claimAutoreleasedReturnValue();

              -[NSObject startReadAccess](v13, "startReadAccess");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "lastPathComponent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v21, "length"))
              {
                objc_msgSend(v11, "fileName");
                v22 = objc_claimAutoreleasedReturnValue();

                v21 = (void *)v22;
              }
              v33 = 0;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v20, 0, &v33);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v33;
              if (v23)
              {
                objc_msgSend(v11, "mimeType");
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = -[_MFMailCompositionContext addAttachmentData:mimeType:fileName:](v6, "addAttachmentData:mimeType:fileName:", v23, v25, v21);
              }
              else
              {
                MFComposeLog();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v24, "ef_publicDescription");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_MFMailCompositionContext initWithOpenMailComposeContext:].cold.2(v27, v38, &v39, v25);
                }
              }

              -[NSObject stopAccess](v13, "stopAccess");
            }
            else
            {
              MFComposeLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                -[_MFMailCompositionContext initWithOpenMailComposeContext:].cold.1(&v31, v32, v13);
            }
          }

        }
        v7 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v8);
    }

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EMMessageList stopObserving:](self->_messageList, "stopObserving:", self);
  v4.receiver = self;
  v4.super_class = (Class)_MFMailCompositionContext;
  -[_MFMailCompositionContext dealloc](&v4, sel_dealloc);
}

- (void)switchToReplyAllWithDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_MFMailCompositionContext composeType](self, "composeType") == 4)
  {
    -[_MFMailCompositionContext setComposeType:](self, "setComposeType:", 5);
    +[MFComposeTypeFactory setupSwitchToReplyAllWithModel:delegate:](MFComposeTypeFactory, "setupSwitchToReplyAllWithModel:delegate:", self, v4);
  }

}

- (void)switchToReplyWithDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_MFMailCompositionContext composeType](self, "composeType") == 5)
  {
    -[_MFMailCompositionContext setComposeType:](self, "setComposeType:", 4);
    +[MFComposeTypeFactory setupSwitchToReplyWithModel:delegate:](MFComposeTypeFactory, "setupSwitchToReplyWithModel:delegate:", self, v4);
  }

}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

+ (id)processMessageBody:(id)a3 asHTML:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  v6 = v5;
  if (v5 && !a4)
  {
    objc_msgSend(v5, "ef_stringByEscapingForMessageBody");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "processMessageBody:asHTML:", v7, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFMailCompositionContext setMessageBody:](self, "setMessageBody:", v6);

  -[_MFMailCompositionContext setIsHTML:](self, "setIsHTML:", v4);
}

- (NSString)contextID
{
  return (NSString *)-[MFAttachmentCompositionContext contextID](self->_attachmentContext, "contextID");
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  -[_MFMailCompositionContext addAttachmentData:mimeType:fileName:contentID:](self, "addAttachmentData:mimeType:fileName:contentID:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MFAttachmentComposeManager *attachmentManager;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  attachmentManager = self->_attachmentManager;
  -[_MFMailCompositionContext contextID](self, "contextID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:](attachmentManager, "attachmentForData:mimeType:fileName:contentID:context:", v10, v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MFAttachmentComposeManager *attachmentManager;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  attachmentManager = self->_attachmentManager;
  -[_MFMailCompositionContext contextID](self, "contextID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentComposeManager attachmentForItemProvider:mimeType:fileName:contentID:context:](attachmentManager, "attachmentForItemProvider:mimeType:fileName:contentID:context:", v10, v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)recordPasteboardAttachmentsForURLs:(id)a3
{
  MFAttachmentComposeManager *attachmentManager;
  void *v5;
  id v6;

  v6 = a3;
  attachmentManager = self->_attachmentManager;
  -[_MFMailCompositionContext contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentComposeManager recordPasteboardAttachmentsForURLs:forContextID:](attachmentManager, "recordPasteboardAttachmentsForURLs:forContextID:", v6, v5);

}

- (void)recordUndoAttachmentsForURLs:(id)a3
{
  MFAttachmentComposeManager *attachmentManager;
  void *v5;
  id v6;

  v6 = a3;
  attachmentManager = self->_attachmentManager;
  -[_MFMailCompositionContext contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentComposeManager recordUndoAttachmentsForURLs:forContextID:](attachmentManager, "recordUndoAttachmentsForURLs:forContextID:", v6, v5);

}

- (void)removeAttachment:(id)a3
{
  MFAttachmentComposeManager *attachmentManager;
  id v4;

  attachmentManager = self->_attachmentManager;
  objc_msgSend(a3, "url");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentComposeManager removeAttachmentForURL:](attachmentManager, "removeAttachmentForURL:");

}

- (id)attachments
{
  return (id)-[MFAttachmentCompositionContext attachments](self->_attachmentContext, "attachments");
}

- (void)insertAttachmentWithURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_MFMailCompositionContext composeWebView](self, "composeWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MFMailCompositionContext composeWebView](self, "composeWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertDocumentWithURL:isDrawingFile:", v6, 0);
  }
  else
  {
    -[_MFMailCompositionContext deferredAttachments](self, "deferredAttachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
  }

}

- (void)insertAttachmentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[_MFMailCompositionContext composeWebView](self, "composeWebView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_MFMailCompositionContext composeWebView](self, "composeWebView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertDocumentWithData:fileName:mimeType:contentID:", v16, v10, v11, v12);
  }
  else
  {
    -[_MFMailCompositionContext deferredAttachments](self, "deferredAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D530], "attachmentData:fileName:mimeType:contentID:", v16, v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
}

- (void)insertDeferredAttachmentsIntoComposeWebView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_MFMailCompositionContext setComposeWebView:](self, "setComposeWebView:", v4);
  -[_MFMailCompositionContext deferredAttachments](self, "deferredAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v4, "setCaretPosition:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v15;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            objc_msgSend(v4, "insertDocumentWithURL:isDrawingFile:", v9, 0);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v9 = v8;
              -[NSObject data](v9, "data");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject fileName](v9, "fileName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject mimeType](v9, "mimeType");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject contentID](v9, "contentID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "insertDocumentWithData:fileName:mimeType:contentID:", v10, v11, v12, v13);

            }
            else
            {
              MFLogGeneral();
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "className");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MFMailCompositionContext insertDeferredAttachmentsIntoComposeWebView:].cold.1(v14, buf, &v22, v9);
              }
            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)hasDuetDonationContext
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_MFMailCompositionContext UTITypes](self, "UTITypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[_MFMailCompositionContext photoIDs](self, "photoIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[_MFMailCompositionContext cloudPhotoIDs](self, "cloudPhotoIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[_MFMailCompositionContext contentURLs](self, "contentURLs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[_MFMailCompositionContext contentText](self, "contentText");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v8 != 0;

        }
      }

    }
  }

  return v4;
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[_MFMailCompositionContext originalMessage](self, "originalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v7);

  if (v11)
  {
    MFComposeLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1AB96A000, v12, OS_LOG_TYPE_DEFAULT, "Updating message itemID for Composition Context. Old itemID: %{public}@. New itemID:%{public}@", buf, 0x16u);
    }

    -[EMMessageList messageListItemForItemID:](self->_messageList, "messageListItemForItemID:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext observationScheduler](self, "observationScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v15[3] = &unk_1E5A68F38;
    v15[4] = self;
    objc_msgSend(v13, "onScheduler:addSuccessBlock:", v14, v15);

  }
}

- (NSURL)mailtoURL
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailtoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setMailtoURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMailtoURL:", v5);

}

- (NSString)messageBody
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMessageBody:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageBody:", v5);

}

- (NSString)from
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "from");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFrom:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrom:", v5);

}

- (NSString)hideMyEmailFrom
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideMyEmailFrom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHideMyEmailFrom:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHideMyEmailFrom:", v5);

}

- (BOOL)isHTML
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHTML");

  return v3;
}

- (void)setIsHTML:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsHTML:", v3);

}

- (NSArray)toRecipients
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setToRecipients:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToRecipients:", v5);

}

- (NSArray)ccRecipients
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ccRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCcRecipients:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCcRecipients:", v5);

}

- (NSArray)bccRecipients
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bccRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setBccRecipients:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBccRecipients:", v5);

}

- (NSString)preferredSendingEmailAddress
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredSendingEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredSendingEmailAddress:", v5);

}

- (BOOL)showKeyboardImmediately
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showKeyboardImmediately");

  return v3;
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowKeyboardImmediately:", v3);

}

- (BOOL)showContentImmediately
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showContentImmediately");

  return v3;
}

- (void)setShowContentImmediately:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowContentImmediately:", v3);

}

- (int)sourceAccountManagement
{
  void *v2;
  int v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceAccountManagement");

  return v3;
}

- (void)setSourceAccountManagement:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceAccountManagement:", v3);

}

- (unint64_t)caretPosition
{
  void *v2;
  unint64_t v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caretPosition");

  return v3;
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretPosition:", a3);

}

- (NSArray)UTITypes
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UTITypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setUTITypes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUTITypes:", v5);

}

- (NSArray)photoIDs
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPhotoIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotoIDs:", v5);

}

- (NSArray)cloudPhotoIDs
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPhotoIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCloudPhotoIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudPhotoIDs:", v5);

}

- (NSArray)contentText
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setContentText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentText:", v5);

}

- (NSArray)contentURLs
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setContentURLs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentURLs:", v5);

}

- (NSArray)originalContent
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setOriginalContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalContent:", v5);

}

- (NSMutableArray)contentVariations
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentVariations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (void)setContentVariations:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentVariations:", v5);

}

- (int64_t)defaultContentVariationIndex
{
  void *v2;
  int64_t v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultContentVariationIndex");

  return v3;
}

- (void)setDefaultContentVariationIndex:(int64_t)a3
{
  id v4;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultContentVariationIndex:", a3);

}

- (NSString)shareSheetSessionID
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareSheetSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setShareSheetSessionID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareSheetSessionID:", v5);

}

- (BOOL)isUsingDefaultAccount
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingDefaultAccount");

  return v3;
}

- (void)setIsUsingDefaultAccount:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsUsingDefaultAccount:", v3);

}

- (int64_t)composeType
{
  void *v2;
  int64_t v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "composeType");

  return v3;
}

- (void)setComposeType:(int64_t)a3
{
  id v4;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComposeType:", a3);

}

- (BOOL)prefersFirstLineSelection
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersFirstLineSelection");

  return v3;
}

- (void)setPrefersFirstLineSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersFirstLineSelection:", v3);

}

- (NSData)serializedMessageObjectID
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedMessageObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSerializedMessageObjectID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSerializedMessageObjectID:", v5);

}

- (BOOL)includeAttachments
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeAttachments");

  return v3;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeAttachments:", v3);

}

- (NSData)serializedMailboxObjectID
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedMailboxObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSerializedMailboxObjectID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSerializedMailboxObjectID:", v5);

}

- (NSMutableArray)deferredAttachments
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deferredAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (void)setDeferredAttachments:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeferredAttachments:", v5);

}

- (NSDate)sendLaterDate
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendLaterDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSendLaterDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendLaterDate:", v5);

}

- (unint64_t)sendLaterContext
{
  void *v2;
  unint64_t v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sendLaterContext");

  return v3;
}

- (void)setSendLaterContext:(unint64_t)a3
{
  id v4;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendLaterContext:", a3);

}

- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingSandboxingURLWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FPSandboxingURLWrapper *)v3;
}

- (void)setSharingSandboxingURLWrapper:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharingSandboxingURLWrapper:", v5);

}

- (CKShare)ckShare
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ckShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKShare *)v3;
}

- (void)setCkShare:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkShare:", v5);

}

- (CKContainerSetupInfo)ckContainerSetupInfo
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ckContainerSetupInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerSetupInfo *)v3;
}

- (void)setCkContainerSetupInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkContainerSetupInfo:", v5);

}

- (int64_t)ckSharePermissionType
{
  void *v2;
  int64_t v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ckSharePermissionType");

  return v3;
}

- (void)setCkSharePermissionType:(int64_t)a3
{
  id v4;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkSharePermissionType:", a3);

}

- (BOOL)ckShareAllowOthersToInvite
{
  void *v2;
  char v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ckShareAllowOthersToInvite");

  return v3;
}

- (void)setCkShareAllowOthersToInvite:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkShareAllowOthersToInvite:", v3);

}

- (MFMailCompositionValues)compositionValues
{
  MFMailCompositionValues *compositionValues;
  MFMailCompositionValues *v4;
  MFMailCompositionValues *v5;

  compositionValues = self->_compositionValues;
  if (!compositionValues)
  {
    v4 = objc_alloc_init(MFMailCompositionValues);
    v5 = self->_compositionValues;
    self->_compositionValues = v4;

    compositionValues = self->_compositionValues;
  }
  return compositionValues;
}

- (NSString)subject
{
  void *v2;
  void *v3;

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSubject:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext compositionValues](self, "compositionValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubject:", v9);

  }
}

- (NSString)autosaveIdentifier
{
  void *v3;
  void *v4;
  void *v5;
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

  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autosaveIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_MFMailCompositionContext legacyMessage](self, "legacyMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

LABEL_5:
      v8 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v8, "setScheme:", *MEMORY[0x1E0D1DB98]);
      objc_msgSend(v8, "setHost:", CFSTR("document"));
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("/%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPath:", v11);

      objc_msgSend(v8, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMailCompositionContext compositionValues](self, "compositionValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAutosaveIdentifier:", v13);

      goto LABEL_6;
    }
    -[_MFMailCompositionContext originalMessage](self, "originalMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
  }
LABEL_6:
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "autosaveIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (void)setAutosaveIdentifier:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_MFMailCompositionContext compositionValues](self, "compositionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autosaveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    -[_MFMailCompositionContext compositionValues](self, "compositionValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutosaveIdentifier:", v8);

  }
}

- (void)setOriginalMessage:(id)a3
{
  EMMessage *v5;
  char v6;
  EMMessage *v7;
  void *v8;
  void *v9;
  EMMessage *v10;

  v5 = (EMMessage *)a3;
  v10 = v5;
  if (self->_originalMessage != v5 || (v6 = -[EMMessage isEqual:](v5, "isEqual:", v5), v7 = v10, (v6 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_originalMessage, a3);
    -[EMMessage objectID](v10, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailCompositionContext setSerializedMessageObjectID:](self, "setSerializedMessageObjectID:", v9);

    v7 = v10;
  }

}

- (NSString)draftSubject
{
  return self->_draftSubject;
}

- (NSString)attachmentToMarkupContentID
{
  return self->_attachmentToMarkupContentID;
}

- (void)setAttachmentToMarkupContentID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentToMarkupContentID, a3);
}

- (BOOL)loadRest
{
  return self->_loadRest;
}

- (void)setLoadRest:(BOOL)a3
{
  self->_loadRest = a3;
}

- (BOOL)includeAttachmentsWhenAdding
{
  return self->_includeAttachmentsWhenAdding;
}

- (void)setIncludeAttachmentsWhenAdding:(BOOL)a3
{
  self->_includeAttachmentsWhenAdding = a3;
}

- (BOOL)isLoadingMessageData
{
  return self->_isLoadingMessageData;
}

- (MFMessageLoadingContext)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loadingContext, a3);
}

- (BOOL)originatingFromAttachmentMarkup
{
  return self->_originatingFromAttachmentMarkup;
}

- (void)setOriginatingFromAttachmentMarkup:(BOOL)a3
{
  self->_originatingFromAttachmentMarkup = a3;
}

- (NSString)contentVariationAttachmentCID
{
  return self->_contentVariationAttachmentCID;
}

- (void)setContentVariationAttachmentCID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (MFMailMessage)legacyMessage
{
  return self->_legacyMessage;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (EMMessage)originalMessage
{
  return self->_originalMessage;
}

- (EFFuture)rawContentRepresentation
{
  return self->_rawContentRepresentation;
}

- (void)setRawContentRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_rawContentRepresentation, a3);
}

- (MFAttachmentCompositionContext)attachmentContext
{
  return self->_attachmentContext;
}

- (_MFMailCompositionContextDelegate)delegate
{
  return (_MFMailCompositionContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)remoteDelegateIdentifier
{
  return self->_remoteDelegateIdentifier;
}

- (void)setRemoteDelegateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDelegateIdentifier, a3);
}

- (BOOL)isQuickReply
{
  return self->_quickReply;
}

- (void)setQuickReply:(BOOL)a3
{
  self->_quickReply = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)deferredAction
{
  return self->_deferredAction;
}

- (void)setDeferredAction:(int64_t)a3
{
  self->_deferredAction = a3;
}

- (NSDictionary)deferredActionUserInfo
{
  return self->_deferredActionUserInfo;
}

- (void)setDeferredActionUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deferredActionUserInfo, a3);
}

- (void)setCompositionValues:(id)a3
{
  objc_storeStrong((id *)&self->_compositionValues, a3);
}

- (MFComposeWebView)composeWebView
{
  return self->_composeWebView;
}

- (void)setComposeWebView:(id)a3
{
  self->_composeWebView = (MFComposeWebView *)a3;
}

- (EFScheduler)observationScheduler
{
  return self->_observationScheduler;
}

- (void)setObservationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_observationScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);
  objc_storeStrong((id *)&self->_deferredActionUserInfo, 0);
  objc_storeStrong((id *)&self->_remoteDelegateIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rawContentRepresentation, 0);
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_contentVariationAttachmentCID, 0);
  objc_storeStrong((id *)&self->_draftSubject, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_attachmentContext, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);
  objc_storeStrong(&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_attachmentToMarkupContentID, 0);
  objc_storeStrong((id *)&self->_legacyMessage, 0);
}

- (void)_loadMessageWithAutosaveIdentifier:(uint64_t)a1 messageRepository:(uint64_t)a2 originalMessageObjectID:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_1AB96A000, log, OS_LOG_TYPE_DEBUG, "Starting autosave fetch for %{public}@, self = %p", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithOpenMailComposeContext:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_3(&dword_1AB96A000, a3, (uint64_t)a3, "Attachment wrapper has neither data nor fileURL. Skipping attachment.", a1);
}

- (void)initWithOpenMailComposeContext:(_QWORD *)a3 .cold.2(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a4, (uint64_t)a3, "Could not create attachment data: %{public}@", a2);

  OUTLINED_FUNCTION_2_0();
}

- (void)insertDeferredAttachmentsIntoComposeWebView:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_1AB96A000, log, OS_LOG_TYPE_DEBUG, "[Attachment] Unknown deferred attachment class [%@]", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

@end
