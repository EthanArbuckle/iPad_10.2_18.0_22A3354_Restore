@implementation IMAssistantMessageSendHandler

- (IMAssistantMessageSendHandler)initWithDataSource:(id)a3 delegate:(id)a4 intentIdentifier:(id)a5
{
  id v9;
  IMAssistantMessageSendHandler *v10;
  IMAssistantMessageSendHandler *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantMessageSendHandler;
  v10 = -[IMAssistantMessageHandler initWithDataSource:intentIdentifier:](&v13, sel_initWithDataSource_intentIdentifier_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_messageSendHandlerDelegate, a4);

  return v11;
}

- (IMAssistantMessageSendHandlerDelegate)messageSendHandlerDelegate
{
  IMAssistantMessageSendHandlerDelegate *messageSendHandlerDelegate;
  IMAssistantMessageSendHandlerDefaultDelegate *v4;
  IMAssistantMessageSendHandlerDelegate *v5;

  messageSendHandlerDelegate = self->_messageSendHandlerDelegate;
  if (!messageSendHandlerDelegate)
  {
    v4 = objc_alloc_init(IMAssistantMessageSendHandlerDefaultDelegate);
    v5 = self->_messageSendHandlerDelegate;
    self->_messageSendHandlerDelegate = (IMAssistantMessageSendHandlerDelegate *)v4;

    messageSendHandlerDelegate = self->_messageSendHandlerDelegate;
  }
  return messageSendHandlerDelegate;
}

- (void)confirmSendMessage:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t spid;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[4];
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v6);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "confirmSendMessageIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21ED92700;
  v33 = sub_21ED92710;
  v34 = 0;
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", 1, 0);
  v9 = v5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = v9;
  objc_msgSend(v9, "attachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v15, "currentLocation"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v39 = 138412290;
              v40 = v15;
              _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Intent contains an current location attachment: %@", v39, 0xCu);
            }

          }
          v12 = 1;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
    }
    while (v11);

    if ((v12 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21ED92718;
      block[3] = &unk_24E395948;
      block[4] = self;
      v27 = &v29;
      v28 = spid;
      v26 = v24;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_28;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v30[5];
      *(_DWORD *)buf = 138412290;
      v42 = v18;
      _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Completing confirmSendMessage with %@", buf, 0xCu);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v20, OS_SIGNPOST_INTERVAL_END, spid, "confirmSendMessageIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  (*((void (**)(id, uint64_t))v24 + 2))(v24, v30[5]);
LABEL_28:
  _Block_object_dispose(&v29, 8);

}

- (void)handleSendMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMAssistantMessageSendHandler *v17;
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handleSendMessageIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Performing intent: %@", buf, 0xCu);
    }

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21ED92AA8;
  v15[3] = &unk_24E395998;
  v18 = v7;
  v19 = v9;
  v16 = v6;
  v17 = self;
  v13 = v7;
  v14 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

- (BOOL)updateSenderIdentityForNewlyCreatedChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coreTelephonySubscriptionsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceHasMultipleSubscriptions");

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Sending message to a new chat. Attempting to determine best sender identity.", buf, 2u);
      }

    }
    objc_msgSend(v4, "participantsWithState:", 17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_24E3959D8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coreTelephonySubscriptionsDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bestSenderIdentityForChatWithHandleIDs:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
    {
      -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "coreTelephonySubscriptionsDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleIDForSenderIdentity:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "coreTelephonySubscriptionsDataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "simIDForSenderIdentity:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setLastAddressedHandleID:", v17);
      objc_msgSend(v4, "setLastAddressedSIMID:", v20);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Could not determine preferred sender identity for handleIDs. This may mean that the user has conflicting sim preferences for these recipients.", v23, 2u);
      }

    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)resolveOutgoingMessageTypeForSendMessage:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_msgSend(v5, "outgoingMessageType");
  v8 = IMOSLoggingEnabled();
  if (v7 == 2)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v14 = objc_msgSend(v5, "outgoingMessageType");
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Resolving Outgoing Message Type with Audio (%ld)", (uint8_t *)&v13, 0xCu);
      }

    }
    v10 = 2;
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v14 = objc_msgSend(v5, "outgoingMessageType");
        _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Resolving Outgoing Message Type with Text (%ld)", (uint8_t *)&v13, 0xCu);
      }

    }
    v10 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD9EF0], "successWithResolvedOutgoingMessageType:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12);

}

- (void)resolveRecipientsForSendMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Will not use CRR to resolve recipients.", buf, 2u);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveRecipientsForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v6, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21ED951C8;
  v15[3] = &unk_24E395A00;
  v16 = v7;
  v17 = v9;
  v14 = v7;
  -[IMAssistantMessageSendHandler resolveRecipientsWithoutCRR:forIntent:completion:](self, "resolveRecipientsWithoutCRR:forIntent:completion:", v13, v6, v15);

}

- (void)resolveContentForSendMessage:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveContentForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v6, "attachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v6, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Intent contains an attachment and no content. Returning notRequired for content.", v23, 2u);
        }

      }
      objc_msgSend(MEMORY[0x24BDDA218], "notRequired");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Resolving content slot with a string value", v22, 2u);
    }

  }
  objc_msgSend(v6, "content");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageSendHandler resolveMessageContentWithString:](self, "resolveMessageContentWithString:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v20, OS_SIGNPOST_INTERVAL_END, v9, "resolveContentForSendMessage", (const char *)&unk_21EDC1733, v21, 2u);
  }

  v7[2](v7, v16);
}

- (void)resolveSpeakableGroupNameForSendMessage:(id)a3 withCompletion:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  unint64_t v33;
  void (**v35)(id, void *);
  os_signpost_id_t spid;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD block[4];
  id v42;
  IMAssistantMessageSendHandler *v43;
  id v44;
  void (**v45)(id, void *);
  os_signpost_id_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v35 = (void (**)(id, void *))a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v5);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v32 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v39, "speakableGroupName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v40, "spokenPhrase");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "vocabularyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = (uint64_t)v9;
      v54 = 2112;
      v55 = v10;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Resolving speakableGroupName: %@ vocabID: %@", buf, 0x16u);

    }
  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  objc_msgSend(v39, "conversationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") == 0;

  if (!v13)
  {
    objc_msgSend(v39, "conversationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v14;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Intent contains a conversationIdentifier, %@, using that to resolve group name", buf, 0xCu);
      }

    }
    objc_msgSend(v11, "addObject:", v14, v32);

  }
  objc_msgSend(v40, "vocabularyIdentifier", v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v37;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Intent contains a speakableGroupName.vocabularyIdentifier, %@, using that to resolve group name", buf, 0xCu);
      }

    }
    objc_msgSend(v11, "addObject:", v37);
  }
  objc_msgSend(v40, "alternativeSpeakableMatches");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v38, "count");
        *(_DWORD *)buf = 134218242;
        v53 = v18;
        v54 = 2112;
        v55 = v38;
        _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "speakableGroupName contains %ld alternativeSpeakableMatches: %@", buf, 0x16u);
      }

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = v38;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v48 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v23, "vocabularyIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "length"))
          {
            objc_msgSend(v11, "addObject:", v24);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v53 = (uint64_t)v23;
              _os_log_impl(&dword_21ED90000, v25, OS_LOG_TYPE_INFO, "alternativeSpeakableMatch does not contain a vocabularyIdentifier, ignoring. alternativeSpeakableMatch: %@", buf, 0xCu);
            }

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v20);
    }

  }
  if (!objc_msgSend(v11, "count")
    && (objc_msgSend(v40, "spokenPhrase"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "length") == 0,
        v26,
        v27))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "Intent contains neither a conversationID nor a spoken group name. Returning notRequired for resolveSpeakableGroupName.", buf, 2u);
      }

    }
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v33 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v31, OS_SIGNPOST_INTERVAL_END, spid, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDDA1A8], "notRequired");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2](v35, v28);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21ED95CAC;
    block[3] = &unk_24E395A28;
    v42 = v11;
    v43 = self;
    v46 = spid;
    v45 = v35;
    v44 = v40;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v28 = v42;
  }

}

- (BOOL)canSendLocationMessageWithLocationManager:(id)a3 withError:(int64_t *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int64_t *v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "locationAuthorizationDetermined") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Have not determined authorization to send current location message for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);

      }
    }
    if (a4)
    {
      v8 = (int64_t *)MEMORY[0x24BDDA480];
      goto LABEL_15;
    }
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if (!objc_msgSend(v5, "locationAuthorizationDenied"))
  {
    if ((objc_msgSend(v5, "preciseLocationAuthorized") & 1) != 0)
    {
      v12 = 1;
      goto LABEL_26;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Authorization to get precise location has been disabled for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);

      }
    }
    if (a4)
    {
      v11 = 1005;
      goto LABEL_16;
    }
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Authorization to send current location has been explicitly disabled for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);

    }
  }
  if (!a4)
    goto LABEL_25;
  v8 = (int64_t *)MEMORY[0x24BDDA488];
LABEL_15:
  v11 = *v8;
LABEL_16:
  v12 = 0;
  *a4 = v11;
LABEL_26:

  return v12;
}

- (BOOL)sendMessageWithDraft:(id)a3 expressiveSendStyleID:(id)a4 idsIdentifier:(id)a5 executionContext:(int64_t)a6 sourceApplicationID:(id)a7 toChat:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v15, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = v15;
        _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Setting expressiveSendStyleID on message: %@ ", (uint8_t *)&v34, 0xCu);
      }

    }
    objc_msgSend(v14, "setExpressiveSendStyleID:", v15);
  }
  if (objc_msgSend(v17, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = v17;
        _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Setting source application ID on message: %@", (uint8_t *)&v34, 0xCu);
      }

    }
    objc_msgSend(v14, "setSourceApplicationID:", v17);
  }
  if (objc_msgSend(v16, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = v16;
        _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Setting IDS identifier on IMMessage: %@ ", (uint8_t *)&v34, 0xCu);
      }

    }
    objc_msgSend(v14, "setNotificationIDSTokenURI:", v16);
  }
  if (a6 == 1)
  {
    objc_msgSend(v14, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = v22;
        _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Suppressing send sound for message GUID: %@ ", (uint8_t *)&v34, 0xCu);
      }

    }
    v24 = v22;
    MEMORY[0x2207BE0B4](CFSTR("com.apple.MobileSMS"), CFSTR("SuppressingSendSoundMessageGUIDs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "arrayByAddingObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    IMSetDomainValueForKey();
  }
  objc_msgSend(v18, "refreshServiceForSending");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "refreshServiceForSending completed", (uint8_t *)&v34, 2u);
    }

  }
  v28 = objc_msgSend(v18, "canSendMessage:", v14);
  v29 = IMOSLoggingEnabled();
  if (v28)
  {
    if (v29)
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "canSendMessage check succeeded", (uint8_t *)&v34, 2u);
      }

    }
    -[IMAssistantMessageSendHandler messageSendHandlerDelegate](self, "messageSendHandlerDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendMessage:toChat:", v14, v18);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_21ED90000, v32, OS_LOG_TYPE_INFO, "message send completed", (uint8_t *)&v34, 2u);
      }
LABEL_43:

    }
  }
  else if (v29)
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v34 = 138412290;
      v35 = v18;
      _os_log_impl(&dword_21ED90000, v32, OS_LOG_TYPE_INFO, "canSendMessage check failed for chat: %@", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_43;
  }

  return v28;
}

- (id)makeIMMessageFromSharedLinkURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = *MEMORY[0x24BE50160];
  v3 = a3;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x24BE50188];
  v12[0] = v4;
  v12[1] = &unk_24E39AFF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v5);
  objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:flags:threadIdentifier:", v8, 65541, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBalloonBundleID:", *MEMORY[0x24BE50B70]);

  return v9;
}

- (void)isSensitiveFileAttachmentURLs:(id)a3 chat:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  NSObject *group;
  id obj;
  _QWORD block[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  _QWORD *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24 = a4;
  v21 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  group = dispatch_group_create();
  v23 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    v10 = *MEMORY[0x24BDBCBE8];
    v11 = *MEMORY[0x24BDF8410];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        v34 = 0;
        v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v34, v10, 0, v21);
        v15 = v34;
        v16 = v15;
        if (v14 && objc_msgSend(v15, "conformsToType:", v11))
        {
          dispatch_group_enter(group);
          -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "commSafetyDataSource");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "chatIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = sub_21ED98D9C;
          v30[3] = &unk_24E395A50;
          v31 = v23;
          v33 = v39;
          v32 = group;
          objc_msgSend(v18, "isSensitiveContent:withChatID:completionHandler:", v13, v19, v30);

        }
        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21ED98F3C;
  block[3] = &unk_24E395A78;
  v28 = v21;
  v29 = v39;
  v20 = v21;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v39, 8);
}

- (void)sendLocalFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10
{
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void (**v33)(id, uint64_t, _QWORD);
  id obj;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v42 = a4;
  v39 = a6;
  v38 = a7;
  v40 = a8;
  v37 = a9;
  v33 = (void (**)(id, uint64_t, _QWORD))a10;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v14;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v41)
  {
    v35 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "fileManagerDataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileTransferCenterDataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v17;
        v21 = v19;
        v22 = v16;
        v23 = IMOSLoggingEnabled();
        if (v22)
        {
          if (v23)
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v22;
              _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", buf, 0xCu);
            }

          }
          v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v21, "createNewOutgoingTransferWithLocalFileURL:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "registerTransferWithDaemon:", v26);
          objc_msgSend(v25, "addObject:", v26);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v25;
              _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x24BDD1458], "__im_attributedStringWithFileTransfers:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "__im_attributedStringByAssigningMessagePartNumbers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v29, 0, v25, 5, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (v23)
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v31, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", buf, 2u);
            }

          }
          v30 = 0;
        }

        if (!-[IMAssistantMessageSendHandler sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:](self, "sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:", v30, v39, v38, a5, v40, v42))
        {
          v33[2](v33, 4, 0);

          goto LABEL_26;
        }
        +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", v30, v42, 24, self);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v32);

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v41)
        continue;
      break;
    }
  }

  ((void (**)(id, uint64_t, id))v33)[2](v33, 3, v37);
LABEL_26:

}

- (void)sendFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10
{
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id obj;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  int64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v34 = a4;
  v35 = a6;
  v36 = a7;
  v37 = a8;
  v38 = a9;
  v39 = a10;
  v41 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fileManagerDataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v19;
        v23 = v21;
        if ((objc_msgSend(v22, "isFileURL") & 1) != 0)
        {
          objc_msgSend(v22, "lastPathComponent");
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "im_randomTemporaryFileURLWithFileName:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = 0;
          LOBYTE(v24) = objc_msgSend(v23, "im_copySecurityScopedResourceAtURL:toDestination:error:", v22, v25, &v55);
          v26 = v55;
          if ((v24 & 1) != 0)
          {
            v27 = v25;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v58 = v22;
                v59 = 2112;
                v60 = v26;
                _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "Failed to copy the file from %@ into the MessagesAssistantExtension Sandbox. Error: %@", buf, 0x16u);
              }

            }
            v27 = 0;
          }

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v22;
              _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Error, url is not a fileURL: %@", buf, 0xCu);
            }

          }
          v27 = 0;
        }

        objc_msgSend(v41, "addObject:", v27);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v16);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commSafetyDataSource");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "checksForSensitivityOnSend");

  if (v32)
  {
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = sub_21ED998C8;
    v42[3] = &unk_24E395AA0;
    v49 = v39;
    v42[4] = self;
    v43 = v41;
    v44 = v34;
    v50 = a5;
    v45 = v35;
    v46 = v36;
    v47 = v37;
    v48 = v38;
    -[IMAssistantMessageSendHandler isSensitiveFileAttachmentURLs:chat:completion:](self, "isSensitiveFileAttachmentURLs:chat:completion:", v43, v44, v42);

  }
  else
  {
    -[IMAssistantMessageSendHandler sendLocalFileAttachmentURLs:chat:executionContext:expressiveSendStyleID:idsIdentifier:sourceApplicationID:sentMessages:completion:](self, "sendLocalFileAttachmentURLs:chat:executionContext:expressiveSendStyleID:idsIdentifier:sourceApplicationID:sentMessages:completion:", v41, v34, a5, v35, v36, v37, v38, v39);
  }

}

- (id)makeIMMessageFromText:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  objc_msgSend(v5, "__im_attributedStringByAssigningMessagePartNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:flags:threadIdentifier:", v6, 5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)sendLocationMessageToChat:(id)a3 sourceApplicationID:(id)a4 sentMessages:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  IMAssistantMessageSendHandler *v23;
  id v24;
  id v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Determining location authorization status.", buf, 2u);
    }

  }
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationManagerDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  LODWORD(v15) = -[IMAssistantMessageSendHandler canSendLocationMessageWithLocationManager:withError:](self, "canSendLocationMessageWithLocationManager:withError:", v16, buf);
  v17 = IMOSLoggingEnabled();
  if ((_DWORD)v15)
  {
    if (v17)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Authorized to send current location message. Sending.", v26, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BE50310], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_21ED99C44;
    v21[3] = &unk_24E395AC8;
    v25 = v13;
    v22 = v10;
    v23 = self;
    v24 = v12;
    objc_msgSend(v19, "sendCurrentLocationMessageWithChat:withLocationManager:withSourceApplicationIdentifier:foregroundAssertionForBundleIdentifier:completion:", v22, v16, v11, CFSTR("com.apple.MobileSMS.MessagesAssistantExtension"), v21);

  }
  else
  {
    if (v17)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Not authorized to send current location message.", v26, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, *(_QWORD *)buf, 0);
  }

}

- (void)sendPhotoAssetMessageToChat:(id)a3 executionContext:(int64_t)a4 expressiveSendStyleID:(id)a5 idsIdentifier:(id)a6 phAsset:(id)a7 sentMessages:(id)a8 sourceApplicationID:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  id obj;
  id v86;
  void *v87;
  _QWORD v88[5];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  int64_t v95;
  _QWORD v96[4];
  id v97;
  NSObject *v98;
  _QWORD *v99;
  _QWORD v100[4];
  id v101;
  NSObject *v102;
  _QWORD *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  id v109;
  __int128 block;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  NSObject *v116;
  _QWORD *v117;
  _QWORD *v118;
  uint8_t buf[4];
  uint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v86 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "fileManagerDataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "fileTransferCenterDataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = sub_21ED9A928;
  v88[3] = &unk_24E395AF0;
  v75 = v21;
  v94 = v75;
  v88[4] = self;
  v71 = v17;
  v89 = v71;
  v72 = v18;
  v90 = v72;
  v95 = a4;
  v74 = v20;
  v91 = v74;
  v70 = v16;
  v92 = v70;
  v73 = v19;
  v93 = v73;
  v81 = v22;
  v80 = v23;
  v82 = v86;
  v77 = v88;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v82, "localIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v120 = (uint64_t)v25;
      _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Building a PHAsset transfer message based on the PHAsset with id: %@", buf, 0xCu);

    }
  }
  v76 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend(v82, "hasAdjustments");
      v28 = CFSTR("The requested PHAsset does not have adjustments, we will use the original resources.");
      if (v27)
        v28 = CFSTR("The requested PHAsset has adjustments, we will use the edited resources.");
      *(_DWORD *)buf = 138412290;
      v120 = (uint64_t)v28;
      _os_log_impl(&dword_21ED90000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v82, "hasAdjustments"))
    v29 = 5;
  else
    v29 = 1;
  if (objc_msgSend(v82, "hasAdjustments"))
    v30 = 6;
  else
    v30 = 2;
  v31 = objc_msgSend(v82, "hasAdjustments");
  v32 = 9;
  if (v31)
    v32 = 10;
  v83 = v32;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = sub_21ED92700;
  v108[4] = sub_21ED92710;
  v109 = 0;
  objc_msgSend(MEMORY[0x24BDE34D8], "assetResourcesForAsset:", v82);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134217984;
      v120 = v35;
      _os_log_impl(&dword_21ED90000, v34, OS_LOG_TYPE_INFO, "The requested PHAsset has %ld resources", buf, 0xCu);
    }

  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v33;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
  if (v36)
  {
    v84 = 0;
    v37 = 0;
    v87 = 0;
    v38 = *(_QWORD *)v105;
    while (1)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v105 != v38)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = objc_msgSend(v40, "type");
            LODWORD(block) = 134217984;
            *(_QWORD *)((char *)&block + 4) = v42;
            _os_log_impl(&dword_21ED90000, v41, OS_LOG_TYPE_INFO, "PHAsset has an asset resource of type: %ld", (uint8_t *)&block, 0xCu);
          }

        }
        if (objc_msgSend(v40, "type") == v29)
        {
          v43 = v87;
          v44 = v37;
          v87 = v40;
        }
        else if (objc_msgSend(v40, "type") == v30)
        {
          v43 = v84;
          v84 = v40;
          v44 = v37;
        }
        else
        {
          v43 = v37;
          v44 = v40;
          if (objc_msgSend(v40, "type") != v83)
            continue;
        }
        v45 = v40;

        v37 = v44;
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
      if (!v36)
        goto LABEL_42;
    }
  }
  v84 = 0;
  v37 = 0;
  v87 = 0;
LABEL_42:

  v46 = objc_alloc_init(MEMORY[0x24BDE34F0]);
  objc_msgSend(v46, "setNetworkAccessAllowed:", 0);
  if (v87 && v37)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a live photo.", (uint8_t *)&block, 2u);
      }

    }
    objc_msgSend(v87, "originalFilename");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "im_randomTemporaryFileURLWithFileName:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "originalFilename");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "im_randomTemporaryFileURLWithFileName:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = dispatch_group_create();
    dispatch_group_enter(v52);
    objc_msgSend(MEMORY[0x24BDE34E8], "defaultManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = sub_21EDA3968;
    v100[3] = &unk_24E395D48;
    v54 = v87;
    v101 = v54;
    v103 = v108;
    v55 = v52;
    v102 = v55;
    objc_msgSend(v53, "writeDataForAssetResource:toFile:options:completionHandler:", v54, v49, v46, v100);

    dispatch_group_enter(v55);
    objc_msgSend(MEMORY[0x24BDE34E8], "defaultManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = MEMORY[0x24BDAC760];
    v96[1] = 3221225472;
    v96[2] = sub_21EDA3AF0;
    v96[3] = &unk_24E395D48;
    v57 = v37;
    v97 = v57;
    v99 = v108;
    v58 = v55;
    v98 = v58;
    objc_msgSend(v56, "writeDataForAssetResource:toFile:options:completionHandler:", v57, v51, v46, v96);

    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 3221225472;
    v111 = sub_21EDA3C78;
    v112 = &unk_24E395D70;
    v118 = v108;
    v117 = v77;
    v113 = v49;
    v114 = v51;
    v115 = v80;
    v116 = v76;
    v59 = v49;
    v60 = v51;
    dispatch_group_notify(v58, MEMORY[0x24BDAC9B8], &block);

    goto LABEL_63;
  }
  if (v87 && !v37)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_21ED90000, v61, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a photo.", (uint8_t *)&block, 2u);
      }

    }
    objc_msgSend(v87, "originalFilename");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "im_randomTemporaryFileURLWithFileName:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE34E8], "defaultManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 3221225472;
    v111 = sub_21EDA3F24;
    v112 = &unk_24E395D98;
    v65 = v87;
    v113 = v65;
    v118 = v108;
    v117 = v77;
    v114 = v81;
    v115 = v80;
    v58 = v63;
    v116 = v58;
    objc_msgSend(v64, "writeDataForAssetResource:toFile:options:completionHandler:", v65, v58, v46, &block);

LABEL_62:
    v59 = v113;
LABEL_63:

    goto LABEL_64;
  }
  if (v84)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_21ED90000, v66, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a video.", (uint8_t *)&block, 2u);
      }

    }
    objc_msgSend(v84, "originalFilename");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "im_randomTemporaryFileURLWithFileName:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE34E8], "defaultManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 3221225472;
    v111 = sub_21EDA42EC;
    v112 = &unk_24E395D98;
    v113 = v87;
    v118 = v108;
    v117 = v77;
    v114 = v81;
    v115 = v80;
    v58 = v68;
    v116 = v58;
    objc_msgSend(v69, "writeDataForAssetResource:toFile:options:completionHandler:", v84, v58, v46, &block);

    goto LABEL_62;
  }
LABEL_64:

  _Block_object_dispose(v108, 8);
}

- (void)sendMessagesWithText:(id)a3 currentLocation:(BOOL)a4 sharedLinkURL:(id)a5 audioMessageAttachment:(id)a6 photoLibraryAttachment:(id)a7 fileAttachments:(id)a8 expressiveSendStyleID:(id)a9 idsIdentifier:(id)a10 executionContext:(int64_t)a11 toChat:(id)a12 completion:(id)a13
{
  _BOOL4 v17;
  id v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  os_signpost_id_t v79;
  id v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  int64_t v84;
  uint64_t v85;

  v17 = a4;
  v85 = *MEMORY[0x24BDAC8D0];
  v74 = a3;
  v71 = a5;
  v75 = a6;
  v70 = a7;
  v69 = a8;
  v72 = a9;
  v73 = a10;
  v19 = a12;
  v20 = a13;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_generate(v21);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "sendMessageWithText", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = sub_21ED9B67C;
  v77[3] = &unk_24E395B18;
  v79 = v22;
  v25 = v20;
  v78 = v25;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207BE4D4](v77);
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v28 = objc_msgSend(v27, "screentimeAllowedToShowChat:error:", v19, &v76);
  v29 = v76;

  if ((v28 & 1) != 0)
  {
    if ((objc_msgSend(v19, "isMemberOfChat") & 1) != 0)
    {
      if (!v74 && !v71 && !v75 && !v70 && !v17 && !objc_msgSend(v69, "count"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v41, OS_LOG_TYPE_INFO, "Send Messages Intent: Invoked with an empty message request.", buf, 2u);
          }

        }
        v26[2](v26, 4, 0);
        goto LABEL_92;
      }
      if (a11 == 1)
        v68 = (id)*MEMORY[0x24BE51348];
      else
        v68 = 0;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v68;
          v83 = 2048;
          v84 = a11;
          _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Using sourceApplicationID %@ for executionContext %ld.", buf, 0x16u);
        }

      }
      v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v75)
      {
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "fileManagerDataSource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v75;
        v37 = v35;
        if ((objc_msgSend(v36, "isFileURL") & 1) != 0)
        {
          objc_msgSend(v36, "lastPathComponent");
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "im_randomTemporaryFileURLWithFileName:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v80 = 0;
          LOBYTE(v38) = objc_msgSend(v37, "im_copySecurityScopedResourceAtURL:toDestination:error:", v36, v39, &v80);
          v65 = v80;
          if ((v38 & 1) != 0)
          {
            v40 = v39;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v36;
                v83 = 2112;
                v84 = (int64_t)v65;
                _os_log_impl(&dword_21ED90000, v48, OS_LOG_TYPE_INFO, "Failed to copy the file from %@ into the MessagesAssistantExtension Sandbox. Error: %@", buf, 0x16u);
              }

            }
            v40 = 0;
          }

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v82 = v36;
              _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "Error, url is not a fileURL: %@", buf, 0xCu);
            }

          }
          v40 = 0;
        }

        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "fileManagerDataSource");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "fileTransferCenterDataSource");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v49;
        v66 = v50;
        v64 = v40;
        v51 = IMOSLoggingEnabled();
        if (v64)
        {
          if (v51)
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v82 = v64;
              _os_log_impl(&dword_21ED90000, v52, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", buf, 0xCu);
            }

          }
          v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v66, "createNewOutgoingTransferWithLocalFileURL:", v64);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "registerTransferWithDaemon:", v54);
          objc_msgSend(v53, "addObject:", v54);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v82 = v53;
              _os_log_impl(&dword_21ED90000, v55, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x24BDD1458], "__im_attributedStringWithFileTransfers:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "__im_attributedStringByAssigningMessagePartNumbers");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v57, 0, v53, 2097157, 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (v51)
          {
            OSLogHandleForIMFoundationCategory();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v59, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", buf, 2u);
            }

          }
          v58 = 0;
        }

        if (-[IMAssistantMessageSendHandler sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:](self, "sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:", v58, v72, v73, a11, v68, v19))
        {
          +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", v58, v19, 2, self);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v60);

          ((void (**)(_QWORD, uint64_t, id))v26)[2](v26, 3, v67);
        }
        else
        {
          v26[2](v26, 4, 0);
        }

        goto LABEL_84;
      }
      if (v74)
      {
        -[IMAssistantMessageSendHandler makeIMMessageFromText:](self, "makeIMMessageFromText:", v74);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[IMAssistantMessageSendHandler sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:](self, "sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:", v42, v72, v73, a11, v68, v19))
        {
          v26[2](v26, 4, 0);

LABEL_84:
          goto LABEL_92;
        }
        +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", v42, v19, 1, self);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v43);

      }
      if (v71)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v44, OS_LOG_TYPE_INFO, "Attempting to send a link", buf, 2u);
          }

        }
        -[IMAssistantMessageSendHandler makeIMMessageFromSharedLinkURL:](self, "makeIMMessageFromSharedLinkURL:", v71);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[IMAssistantMessageSendHandler sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:](self, "sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:", v45, v72, v73, a11, v68, v19))
        {
          +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", v45, v19, 25, self);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v46);

          ((void (**)(_QWORD, uint64_t, id))v26)[2](v26, 3, v67);
        }
        else
        {
          v26[2](v26, 4, 0);
        }

      }
      else if (v17)
      {
        -[IMAssistantMessageSendHandler sendLocationMessageToChat:sourceApplicationID:sentMessages:completion:](self, "sendLocationMessageToChat:sourceApplicationID:sentMessages:completion:", v19, v68, v67, v26);
      }
      else if (objc_msgSend(v69, "count"))
      {
        -[IMAssistantMessageSendHandler sendFileAttachmentURLs:chat:executionContext:expressiveSendStyleID:idsIdentifier:sourceApplicationID:sentMessages:completion:](self, "sendFileAttachmentURLs:chat:executionContext:expressiveSendStyleID:idsIdentifier:sourceApplicationID:sentMessages:completion:", v69, v19, a11, v72, v73, v68, v67, v26);
      }
      else if (v70)
      {
        -[IMAssistantMessageSendHandler sendPhotoAssetMessageToChat:executionContext:expressiveSendStyleID:idsIdentifier:phAsset:sentMessages:sourceApplicationID:completion:](self, "sendPhotoAssetMessageToChat:executionContext:expressiveSendStyleID:idsIdentifier:phAsset:sentMessages:sourceApplicationID:completion:", v19, a11, v72, v73, v70, v67, v68, v26);
      }
      else
      {
        ((void (**)(_QWORD, uint64_t, id))v26)[2](v26, 3, v67);
      }
      goto LABEL_84;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v19;
        _os_log_impl(&dword_21ED90000, v32, OS_LOG_TYPE_INFO, "Send Messages Intent: Failed. Will not send to chat in Un-Joined state: %@", buf, 0xCu);
      }

    }
    v26[2](v26, *MEMORY[0x24BDDA490], 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v19;
        _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Send Messages Intent: Failed. Downtime enabled, chat contained non-allowlisted handles: %@", buf, 0xCu);
      }

    }
    if (v29)
      v31 = objc_msgSend(v29, "code");
    else
      v31 = *MEMORY[0x24BDDA4A8];
    v26[2](v26, v31, 0);
  }
LABEL_92:

}

- (id)resolveMessageContentWithString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "trimmedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", v3);
  else
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recipientDisambiguationResultsFromMultipleRelevantChats:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  id j;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  uint64_t v20;
  uint64_t m;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id obj;
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "resolvedPersons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v6 == objc_msgSend(v10, "count");

        if (!v11)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v34, OS_LOG_TYPE_INFO, "Resolved persons from relevant chats contained an inconsistent number of recipients, ignoring relevant chats.", buf, 2u);
            }

          }
          v39 = 0;
          v33 = obj;
          goto LABEL_43;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v7)
        continue;
      break;
    }
  }

  for (j = objc_alloc_init(MEMORY[0x24BDBCEB8]); v6; --v6)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(j, "addObject:", v13);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = obj;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v51;
    v17 = MEMORY[0x24BDAC760];
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "resolvedPersons");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v17;
        v48[1] = 3221225472;
        v48[2] = sub_21ED9BD60;
        v48[3] = &unk_24E395B40;
        v49 = j;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v48);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v15);
  }

  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = j;
  v20 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v20)
  {
    v38 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(v37);
        v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
        v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v25 = v22;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v41;
          do
          {
            for (n = 0; n != v26; ++n)
            {
              if (*(_QWORD *)v41 != v27)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * n);
              objc_msgSend(v29, "customIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v24, "containsObject:", v30) & 1) == 0)
              {
                objc_msgSend(v23, "addObject:", v29);
                objc_msgSend(v24, "addObject:", v30);
              }

            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
          }
          while (v26);
        }

        if (objc_msgSend(v23, "count") == 1)
        {
          objc_msgSend(v23, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v32);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDDA0B8], "disambiguationWithPeopleToDisambiguate:", v23);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v31);
        }

      }
      v20 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v20);
  }

  v33 = v37;
LABEL_43:

  return v39;
}

- (id)resolveRecipientsWithGroupNameOrConversationIdentifier:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  _BOOL4 v31;
  int v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  unint64_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  char v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  char v59;
  id v60;
  _BOOL4 v61;
  int v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  BOOL v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  os_signpost_id_t spid;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[2];

  v101[1] = *MEMORY[0x24BDAC8D0];
  v88 = a3;
  v6 = a4;
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasMessagingAccount");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "speakableGroupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vocabularyIdentifier");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v87, "length"))
      goto LABEL_53;
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    _IMAssistantCoreSendMessageSignpostLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "resolveRecipientsFromGroup", (const char *)&unk_21EDC1733, buf, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v87;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Attempting to resolve by speakableGroupName.vocabularyIdentifier: %@", buf, 0xCu);
      }

    }
    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "chatDataSource");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v87;
    if (objc_msgSend(v19, "length"))
    {
      IMAssistantChatIdentifierFromConversationIdentifier(v19);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "existingChatWithChatIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

        goto LABEL_28;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v19;
          _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
        }

      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_27:
        v21 = 0;
LABEL_28:

        v25 = IMOSLoggingEnabled();
        if (v21)
        {
          if (v25)
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v26, OS_LOG_TYPE_INFO, "A speakableGroupName.vocabularyIdentifier matching a valid chat was provided, extracting recipients from chat and attaching to intent for use in Siri dialog.", buf, 2u);
            }

          }
          -[IMAssistantMessageSendHandler resolvedRecipientsFromChat:](self, "resolvedRecipientsFromChat:", v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = 0;
            v29 = objc_msgSend(v28, "screentimeAllowedToShowChat:error:", v21, &v90);
            v30 = v90;

            if ((v29 & 1) != 0)
            {
              v31 = objc_msgSend(v21, "joinState") == 4;
              v32 = IMOSLoggingEnabled();
              if (v31)
              {
                if (v32)
                {
                  OSLogHandleForIMFoundationCategory();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Returning unsupported for recipient because the resolved chat is read-only. Using INSendMessageRecipientUnsupportedReasonMessagingServiceNotEnabledForRecipient", buf, 2u);
                  }

                }
                objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", 3);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v34;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
                v23 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                if (v32)
                {
                  OSLogHandleForIMFoundationCategory();
                  v77 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v96 = v10;
                    v97 = 2112;
                    v98 = v27;
                    _os_log_impl(&dword_21ED90000, v77, OS_LOG_TYPE_INFO, "Returning success with recipients resolved from speakableGroupName: %@ recipients: %@", buf, 0x16u);
                  }

                }
                _IMAssistantCoreSendMessageSignpostLogHandle();
                v78 = objc_claimAutoreleasedReturnValue();
                v79 = v78;
                if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v78))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_21ED90000, v79, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
                }

                v23 = v27;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v96 = v10;
                  _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group with speakableGroupName (%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
                }

              }
              _IMAssistantCoreSendMessageSignpostLogHandle();
              v48 = objc_claimAutoreleasedReturnValue();
              v49 = v48;
              if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v48))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_21ED90000, v49, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
              }

              objc_msgSend(v30, "domain");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "isEqual:", CFSTR("__kIMAssistantMessageHandlerErrorDomain"));

              if ((v51 & 1) == 0 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v96 = v30;
                  _os_log_impl(&dword_21ED90000, v52, OS_LOG_TYPE_INFO, "Will return unsupported with an unknown reason, error: %@", buf, 0xCu);
                }

              }
              if (v30)
                v53 = objc_msgSend(v30, "code");
              else
                v53 = *MEMORY[0x24BDDA4A8];
              objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", v53);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v84;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
              v23 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_158;
          }
          if (!IMOSLoggingEnabled())
            goto LABEL_49;
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v19;
            _os_log_impl(&dword_21ED90000, v35, OS_LOG_TYPE_INFO, "Recipients could not be resolved from speakableGroupName.vocabularyIdentifier: %@. Ignoring identifier and continuing with person resolution.", buf, 0xCu);
          }
        }
        else
        {
          if (!v25)
            goto LABEL_49;
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v19;
            _os_log_impl(&dword_21ED90000, v35, OS_LOG_TYPE_INFO, "No chat could be found matching speakableGroupName.vocabularyIdentifier: %@. Ignoring identifier and continuing with person resolution.", buf, 0xCu);
          }
        }

LABEL_49:
        _IMAssistantCoreSendMessageSignpostLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v37, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromGroup", (const char *)&unk_21EDC1733, buf, 2u);
        }

LABEL_53:
        objc_msgSend(v6, "conversationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "length"))
        {
LABEL_113:
          objc_msgSend(v10, "spokenPhrase");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "length") == 0;

          if (v69)
          {
            if (objc_msgSend(v88, "count"))
            {
              v23 = 0;
LABEL_159:

              goto LABEL_160;
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v76, OS_LOG_TYPE_INFO, "No recipients provided to resolve, returning needsValue.", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA0B8], "needsValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = v27;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
            v71 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v70, OS_LOG_TYPE_INFO, "No recipients are required if a group name is present", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA0B8], "notRequired");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v27;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
            v71 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (id)v71;
LABEL_158:

          goto LABEL_159;
        }
        _IMAssistantCoreSendMessageSignpostLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        spid = os_signpost_id_generate(v38);

        _IMAssistantCoreSendMessageSignpostLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v39;
        v41 = spid - 1;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v40, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
        }

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v21;
            _os_log_impl(&dword_21ED90000, v42, OS_LOG_TYPE_INFO, "Attempting to resolve by conversationIdentifier: %@", buf, 0xCu);
          }

        }
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "chatDataSource");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v21;
        if (objc_msgSend(v45, "length"))
        {
          IMAssistantChatIdentifierFromConversationIdentifier(v45);
          v46 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "existingChatWithChatIdentifier:", v46);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {

            goto LABEL_88;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v45;
              _os_log_impl(&dword_21ED90000, v54, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
            }

          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
          {
LABEL_87:
            v27 = 0;
LABEL_88:

            v55 = IMOSLoggingEnabled();
            if (v27)
            {
              if (v55)
              {
                OSLogHandleForIMFoundationCategory();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v56, OS_LOG_TYPE_INFO, "A conversationIdentifier matching a valid chat was provided, extracting recipients from chat and attaching to intent for use in Siri dialog.", buf, 2u);
                }

              }
              -[IMAssistantMessageSendHandler resolvedRecipientsFromChat:](self, "resolvedRecipientsFromChat:", v27);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (v57)
              {
                -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = 0;
                v59 = objc_msgSend(v58, "screentimeAllowedToShowChat:error:", v27, &v89);
                v60 = v89;

                if ((v59 & 1) != 0)
                {
                  v61 = objc_msgSend(v27, "joinState") == 4;
                  v62 = IMOSLoggingEnabled();
                  if (v61)
                  {
                    if (v62)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v63 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_21ED90000, v63, OS_LOG_TYPE_INFO, "Returning unsupported for recipient because the resolved chat is read-only. Using INSendMessageRecipientUnsupportedReasonMessagingServiceNotEnabledForRecipient", buf, 2u);
                      }

                    }
                    objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", 3);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v93 = v64;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
                    v23 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    if (v62)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v96 = v57;
                        _os_log_impl(&dword_21ED90000, v80, OS_LOG_TYPE_INFO, "Returning success with recipients resolved from chat: %@", buf, 0xCu);
                      }

                    }
                    _IMAssistantCoreSendMessageSignpostLogHandle();
                    v81 = objc_claimAutoreleasedReturnValue();
                    v82 = v81;
                    if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v81))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_21ED90000, v82, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
                    }

                    v23 = v57;
                  }
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v72 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v96 = v45;
                      _os_log_impl(&dword_21ED90000, v72, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group w/ conversation identifier(%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
                    }

                  }
                  _IMAssistantCoreSendMessageSignpostLogHandle();
                  v73 = objc_claimAutoreleasedReturnValue();
                  v74 = v73;
                  if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v73))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_21ED90000, v74, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
                  }

                  if (v60)
                    v75 = objc_msgSend(v60, "code");
                  else
                    v75 = *MEMORY[0x24BDDA4A8];
                  objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", v75);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = v83;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
                  v23 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_158;
              }
              if (!IMOSLoggingEnabled())
                goto LABEL_109;
              OSLogHandleForIMFoundationCategory();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v96 = v45;
                _os_log_impl(&dword_21ED90000, v65, OS_LOG_TYPE_INFO, "Recipients could not be resolved from conversationIdentifier: %@. Ignoring conversation identifier and continuing with person resolution.", buf, 0xCu);
              }
            }
            else
            {
              if (!v55)
                goto LABEL_109;
              OSLogHandleForIMFoundationCategory();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v96 = v45;
                _os_log_impl(&dword_21ED90000, v65, OS_LOG_TYPE_INFO, "No chat could be found matching conversationIdentifier: %@. Ignoring conversation identifier and continuing with person resolution.", buf, 0xCu);
              }
            }

LABEL_109:
            _IMAssistantCoreSendMessageSignpostLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21ED90000, v67, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_21EDC1733, buf, 2u);
            }

            goto LABEL_113;
          }
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v46, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
          }
        }

        goto LABEL_87;
      }
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
      }
    }

    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Could not resolve recipients; no messaging account enabled",
        buf,
        2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 1);
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_160:

  return v23;
}

- (void)resolveRecipientsWithCRR:(id)a3 forIntent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Resolving recipients with CRR: %@", buf, 0xCu);
    }

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21ED9D12C;
  v15[3] = &unk_24E395B68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

- (void)resolveRecipientsWithoutCRR:(id)a3 forIntent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Resolving recipients without CRR: %@", buf, 0xCu);
    }

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21ED9D978;
  v15[3] = &unk_24E395B68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

- (BOOL)recipientHandleResolutionResultsAllowedByScreentime:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD9F40], "__imcore__containsNonSuccess:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Validating resolved handles for screentime", buf, 2u);
      }

    }
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "resolvedValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "customIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
            objc_msgSend(v9, "addObject:", v15);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v11);
    }

    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v7 = objc_msgSend(v16, "screentimeAllowedToShowConversationWithHandleIDs:error:", v9, &v22);
    v17 = v22;

    v18 = IMOSLoggingEnabled();
    if ((v7 & 1) != 0)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Handles are allowed by screentime", buf, 2u);
        }

      }
    }
    else
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v9;
          _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Handles are not allowed by screentime: %@.", buf, 0xCu);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }

  }
  return v7;
}

- (id)resolvedRecipientsFromChat:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t spid;
  id v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolvedRecipientsFromChat", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v30, "participantsWithState:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    v31 = *MEMORY[0x24BDBA2E0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[IMAssistantMessageHandler contactIdentifiersMatchingHandle:](self, "contactIdentifiersMatchingHandle:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        {
          v45 = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cnContactWithKeys:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v16, "length"))
            goto LABEL_38;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Attempting to resolve ambiguous handle to contact using the Contacts Framework.", buf, 2u);
            }

          }
          -[IMAssistantMessageHandler contactWithIdentifier:](self, "contactWithIdentifier:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
LABEL_38:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Could not resolve ambiguous handle to contact using the Contacts Framework.", buf, 2u);
              }

            }
            v18 = 0;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = objc_msgSend(v13, "count");
              *(_DWORD *)buf = 134218754;
              v38 = v21;
              v39 = 2112;
              v40 = v12;
              v41 = 2112;
              v42 = v13;
              v43 = 2112;
              v44 = v18;
              _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "%ld contacts matched chat participant %@. Matching identifiers: %@. Using contact: %@", buf, 0x2Au);
            }

          }
          if (v18)
            goto LABEL_28;
        }
        if (objc_msgSend(v13, "count")
          && (objc_msgSend(v13, "lastObject"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[IMAssistantMessageHandler contactWithIdentifier:](self, "contactWithIdentifier:", v22),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v18))
        {
LABEL_28:
          v23 = objc_alloc(MEMORY[0x24BDD9F30]);
          objc_msgSend(v23, "__im_assistant_initWithContact:imHandle:", v18, v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = objc_alloc(MEMORY[0x24BDD9F30]);
          objc_msgSend(v23, "__im_assistant_initAnonymousRecipientWithIMHandle:", v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
        }

        objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v25);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v9);
  }

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v27, OS_SIGNPOST_INTERVAL_END, spid, "resolvedRecipientsFromChat", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v8;
}

- (id)contactsWithDuplicateNamesAmongContacts:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t spid;
  unint64_t v28;
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v28 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "duplicateNameCheck", (const char *)&unk_21EDC1733, buf, 2u);
  }
  spid = v5;

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD1730], "componentsForContact:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v14, 0, 0);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        if (v15)
          v16 = v15;
        else
          v16 = &stru_24E396530;
        v17 = v16;
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "addObject:", v13);
        }
        else
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v13, 0);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v17);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }

  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_21EDA03A4;
  v30[3] = &unk_24E395C40;
  v22 = v21;
  v31 = v22;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v30);
  v23 = (void *)objc_msgSend(v22, "copy");
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v25, OS_SIGNPOST_INTERVAL_END, spid, "duplicateNameCheck", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v23;
}

- (id)resolveRecipientsByFindingExistingRelevantChatsForRecipients:(id)a3 withMatchingHandlesByRecipient:(id)a4 fromChats:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  void *v41;
  IMAssistantRelevantChatMatchingRecipients *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  __int128 v50;
  uint64_t v51;
  os_signpost_id_t v52;
  uint64_t v53;
  os_signpost_id_t spid;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  id obj;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  NSObject *v73;
  IMAssistantMessageSendHandler *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  void *v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v59 = a4;
  v7 = a5;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v8);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveRecipientsFromRelevantChat", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v94 = v12;
      _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Attempting to find a matching chat by examining %ld recent chats.", buf, 0xCu);
    }

  }
  v63 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v7;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  if (v62)
  {
    v56 = *(_QWORD *)v90;
    *(_QWORD *)&v13 = 138412290;
    v50 = v13;
LABEL_10:
    v66 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v56)
        objc_enumerationMutation(obj);
      v64 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v66);
      if (!-[IMAssistantMessageSendHandler shouldContinueToExamineRelevantChatsWithMatches:nextChat:](self, "shouldContinueToExamineRelevantChatsWithMatches:nextChat:", v63, v50))goto LABEL_78;
      objc_msgSend(v64, "participantsWithState:", 16);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v69, "count");
      if (v14 == objc_msgSend(v65, "count"))
        break;
LABEL_76:

      if (++v66 == v62)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
        if (v62)
          goto LABEL_10;
        goto LABEL_78;
      }
    }
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v52 = os_signpost_id_generate(v15);

    _IMAssistantCoreSendMessageSignpostLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v52, "examineRelevantChat", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v65, "count"));
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = sub_21EDA0FB8;
    v87[3] = &unk_24E395C68;
    v57 = v18;
    v88 = v57;
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207BE4D4](v87);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v50;
        v94 = (uint64_t)v64;
        _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Beginning evaluation of participants in chat %@.", buf, 0xCu);
      }

    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v55 = v65;
    v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v58)
    {
      v51 = *(_QWORD *)v84;
      while (2)
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v84 != v51)
          {
            v22 = v21;
            objc_enumerationMutation(v55);
            v21 = v22;
          }
          v53 = v21;
          v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v21);
          objc_msgSend(v59, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v67 = v24;
          v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
          if (v70)
          {
            v68 = *(_QWORD *)v80;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v80 != v68)
                {
                  v26 = v25;
                  objc_enumerationMutation(v67);
                  v25 = v26;
                }
                v71 = v25;
                v27 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v25);
                v75 = 0u;
                v76 = 0u;
                v77 = 0u;
                v78 = 0u;
                v28 = v69;
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
                if (v29)
                {
                  v30 = *(_QWORD *)v76;
                  do
                  {
                    for (i = 0; i != v29; ++i)
                    {
                      if (*(_QWORD *)v76 != v30)
                        objc_enumerationMutation(v28);
                      v32 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
                      if (objc_msgSend(v27, "matchesIMHandle:", v32))
                      {
                        if (IMOSLoggingEnabled())
                        {
                          OSLogHandleForIMFoundationCategory();
                          v33 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            v94 = (uint64_t)v32;
                            v95 = 2112;
                            v96 = v27;
                            _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Found a chat participant handle: %@ matching requested handle: %@", buf, 0x16u);
                          }

                        }
                        ((void (**)(_QWORD, void *, void *, void *))v19)[2](v19, v23, v32, v27);
                      }
                    }
                    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
                  }
                  while (v29);
                }

                v25 = v71 + 1;
              }
              while (v71 + 1 != v70);
              v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
            }
            while (v70);
          }

          objc_msgSend(v57, "objectForKey:", v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count") == 0;

          if (v35)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v50;
                v94 = (uint64_t)v23;
                _os_log_impl(&dword_21ED90000, v36, OS_LOG_TYPE_INFO, "Did not find any matching chat participant for requested person %@", buf, 0xCu);
              }

            }
            goto LABEL_56;
          }

          v21 = v53 + 1;
        }
        while (v53 + 1 != v58);
        v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
        if (v58)
          continue;
        break;
      }
    }
LABEL_56:

    v37 = objc_msgSend(v57, "count");
    if (v37 == objc_msgSend(v55, "count"))
    {
      -[IMAssistantMessageSendHandler findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:](self, "findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:", v57);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = IMOSLoggingEnabled();
      if (v38)
      {
        if (v39)
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v50;
            v94 = (uint64_t)v64;
            _os_log_impl(&dword_21ED90000, v40, OS_LOG_TYPE_INFO, "Found a matching existing chat: %@", buf, 0xCu);
          }

        }
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = sub_21EDA1090;
        v72[3] = &unk_24E395C90;
        v73 = v38;
        v74 = self;
        objc_msgSend(v55, "__imArrayByApplyingBlock:", v72);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[IMAssistantRelevantChatMatchingRecipients initWithChat:resolvedPersons:]([IMAssistantRelevantChatMatchingRecipients alloc], "initWithChat:resolvedPersons:", v64, v41);
        objc_msgSend(v63, "addObject:", v42);

      }
      else if (v39)
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v50;
          v94 = (uint64_t)v64;
          _os_log_impl(&dword_21ED90000, v43, OS_LOG_TYPE_INFO, "Could not find a valid 1-1 relationship between chat participants and requested recipients. Ending evaluation of chat %@.", buf, 0xCu);
        }

      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_72;
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v50;
        v94 = (uint64_t)v64;
        _os_log_impl(&dword_21ED90000, v38, OS_LOG_TYPE_INFO, "Matching chat participant not found for all recipients. Ending evaluation of chat %@.", buf, 0xCu);
      }
    }

LABEL_72:
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v52 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v45, OS_SIGNPOST_INTERVAL_END, v52, "examineRelevantChat", (const char *)&unk_21EDC1733, buf, 2u);
    }

    goto LABEL_76;
  }
LABEL_78:

  if (!objc_msgSend(v63, "count") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v46, OS_LOG_TYPE_INFO, "Did not find a matching existing chat.", buf, 2u);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v48, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromRelevantChat", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v63;
}

- (BOOL)shouldContinueToExamineRelevantChatsWithMatches:(id)a3 nextChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastFinishedMessageDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = fabs(v10);

    if (v11 * 4.0 >= 3600.0)
      v12 = v11 * 4.0;
    else
      v12 = 3600.0;
    objc_msgSend(v6, "lastFinishedMessageDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = fabs(v14);

    v16 = v12 > v15;
    if (v12 <= v15 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 134218496;
        v20 = (uint64_t)v11;
        v21 = 2048;
        v22 = (uint64_t)v15;
        v23 = 2048;
        v24 = (uint64_t)v12;
        _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Next chat is beyond maximum relevant time interval. Ending evaluation of relevant chats. TimeSinceLastMessageInMatchingChat: %ld s, TimeSinceLastMessageInNextChat: %ld s, MaximumRelevantTimeInterval: %ld s", (uint8_t *)&v19, 0x20u);
      }

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  id v50;
  void *m;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ii;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t jj;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  os_signpost_id_t spid;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  char *v98;
  id v99;
  NSObject *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t buf[16];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v83 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mapRecipientsToParticipants", (const char *)&unk_21EDC1733, buf, 2u);
  }
  spid = v5;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v3, "count"));
  v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v3, "count"));
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v136 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", v15, 0);
        objc_msgSend(v91, "setObject:forKey:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
    }
    while (v11);
  }

  v17 = MEMORY[0x24BDAC760];
  v89 = v3;
  v90 = v8;
  while (1)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    objc_msgSend(v3, "keyEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
    if (!v96)
      break;
    v19 = 0;
    v20 = *(_QWORD *)v132;
    v92 = v18;
    v87 = *(_QWORD *)v132;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v132 != v20)
          objc_enumerationMutation(v18);
        v98 = v21;
        v22 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)v21);
        objc_msgSend(v8, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          objc_msgSend(v91, "objectForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v24, "count"))
          {
            _IMAssistantCoreSendMessageSignpostLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21ED90000, v35, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_21EDC1733, buf, 2u);
            }

            v36 = 0;
            goto LABEL_37;
          }
          if (objc_msgSend(v24, "count") == 1)
          {
            v94 = v24;
            objc_msgSend(v24, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v25, v22);
            objc_msgSend(v91, "removeObjectForKey:", v22);
            v129 = 0u;
            v130 = 0u;
            v127 = 0u;
            v128 = 0u;
            objc_msgSend(v91, "objectEnumerator");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v127, v146, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v128;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v128 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                  v32 = (void *)MEMORY[0x24BDD1758];
                  v125[0] = v17;
                  v125[1] = 3221225472;
                  v125[2] = sub_21EDA1F84;
                  v125[3] = &unk_24E395CB8;
                  v126 = v25;
                  objc_msgSend(v32, "predicateWithBlock:", v125);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "filterUsingPredicate:", v33);

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v127, v146, 16);
              }
              while (v28);
            }

            v19 = 1;
            v3 = v89;
            v8 = v90;
            v18 = v92;
            v24 = v94;
            v20 = v87;
          }

        }
        v21 = v98 + 1;
      }
      while (v98 + 1 != (char *)v96);
      v96 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
      if (v96)
        continue;
      break;
    }

    if ((v19 & 1) == 0)
      goto LABEL_39;
  }

LABEL_39:
  if (objc_msgSend(v91, "count"))
  {
    v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v81 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    objc_msgSend(v38, "addObject:");
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    objc_msgSend(v3, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v122;
      v84 = *(_QWORD *)v122;
      do
      {
        v42 = 0;
        v85 = v40;
        do
        {
          if (*(_QWORD *)v122 != v41)
            objc_enumerationMutation(obj);
          v43 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v42);
          objc_msgSend(v8, "objectForKey:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v119 = 0u;
            v120 = 0u;
            v117 = 0u;
            v118 = 0u;
            v38 = v38;
            v45 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v118;
              do
              {
                for (k = 0; k != v46; ++k)
                {
                  if (*(_QWORD *)v118 != v47)
                    objc_enumerationMutation(v38);
                  objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * k), "setObject:forKey:", v44, v43);
                }
                v46 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
              }
              while (v46);
            }
            v49 = v38;
          }
          else
          {
            v88 = v42;
            objc_msgSend(v91, "objectForKey:", v43);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v116 = 0u;
            v93 = v38;
            v99 = (id)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
            if (v99)
            {
              v95 = *(_QWORD *)v114;
              v97 = v49;
              do
              {
                for (m = 0; m != v99; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v114 != v95)
                    objc_enumerationMutation(v93);
                  v52 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)m);
                  v109 = 0u;
                  v110 = 0u;
                  v111 = 0u;
                  v112 = 0u;
                  v53 = v49;
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
                  if (v54)
                  {
                    v55 = v54;
                    v56 = *(_QWORD *)v110;
                    do
                    {
                      for (n = 0; n != v55; ++n)
                      {
                        if (*(_QWORD *)v110 != v56)
                          objc_enumerationMutation(v53);
                        v58 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * n);
                        v59 = (void *)objc_msgSend(v52, "copy");
                        objc_msgSend(v59, "setObject:forKey:", v58, v43);
                        objc_msgSend(v50, "addObject:", v59);

                      }
                      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
                    }
                    while (v55);
                  }

                  v49 = v97;
                }
                v99 = (id)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
              }
              while (v99);
            }

            v38 = v50;
            v8 = v90;
            v41 = v84;
            v40 = v85;
            v44 = 0;
            v42 = v88;
          }

          ++v42;
        }
        while (v42 != v40);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
      }
      while (v40);
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v100 = v38;
    v60 = -[NSObject countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v105, v141, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v106;
      while (2)
      {
        for (ii = 0; ii != v61; ++ii)
        {
          if (*(_QWORD *)v106 != v62)
            objc_enumerationMutation(v100);
          v64 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * ii);
          v65 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          objc_msgSend(v64, "objectEnumerator");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v101, v140, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v102;
            do
            {
              for (jj = 0; jj != v68; ++jj)
              {
                if (*(_QWORD *)v102 != v69)
                  objc_enumerationMutation(v66);
                objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * jj), "imHandle");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "addObject:", v71);

              }
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v101, v140, 16);
            }
            while (v68);
          }

          v72 = objc_msgSend(v65, "count");
          if (v72 == objc_msgSend(v89, "count"))
          {
            _IMAssistantCoreSendMessageSignpostLogHandle();
            v77 = objc_claimAutoreleasedReturnValue();
            v78 = v77;
            if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21ED90000, v78, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_21EDC1733, buf, 2u);
            }

            v36 = v64;
            v73 = v100;
            v75 = v100;
            v3 = v89;
            v8 = v90;
            goto LABEL_99;
          }

        }
        v61 = -[NSObject countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v105, v141, 16);
        v8 = v90;
        if (v61)
          continue;
        break;
      }
    }
    v73 = v100;

    _IMAssistantCoreSendMessageSignpostLogHandle();
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v83 > 0xFFFFFFFFFFFFFFFDLL)
    {
      v36 = 0;
      v3 = v89;
LABEL_99:
      v76 = (void *)v81;
    }
    else
    {
      v3 = v89;
      v76 = (void *)v81;
      if (os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ED90000, v75, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_21EDC1733, buf, 2u);
      }
      v36 = 0;
    }

  }
  else
  {
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v80, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v36 = v8;
  }
LABEL_37:

  return v36;
}

- (id)contactResolutionResultForContacts:(id)a3 matchingRecipient:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  _BOOL4 v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  unint64_t v72;
  unint64_t v73;
  os_signpost_id_t spid;
  id v75;
  id v76;
  id obj;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t v98[128];
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v76 = a4;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v5);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v72 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v76, "personHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v8, "type");

  objc_msgSend(v76, "personHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "label");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v76, "personHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "__im_assistant_handleType");

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v100 = (uint64_t)v76;
        _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Manually specified handle. Ready to proceed to handle resolution with person: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v76);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (v72 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v15 = v14;
    }
    else
    {
      v15 = v14;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ED90000, v15, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
      }
    }
    goto LABEL_105;
  }
  if ((unint64_t)objc_msgSend(v75, "count") >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v100 = (uint64_t)v75;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Multiple contacts match recipient. Contacts: %@", buf, 0xCu);
      }

    }
    -[IMAssistantMessageSendHandler contactsWithDuplicateNamesAmongContacts:](self, "contactsWithDuplicateNamesAmongContacts:", v75, v72);
    v79 = objc_claimAutoreleasedReturnValue();
    v84 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v75;
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    if (v82)
    {
      v78 = *(_QWORD *)v95;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v95 != v78)
          {
            v18 = v17;
            objc_enumerationMutation(obj);
            v17 = v18;
          }
          v83 = v17;
          v19 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v17);
          if (-[NSObject containsObject:](v79, "containsObject:", v19))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v100 = (uint64_t)v19;
                _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Contact has the same name as another possible disambiguation option, including handles in disambiguation for contact: %@", buf, 0xCu);
              }

            }
            -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "accountDataSource");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "countryCode");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "__im_assistant_matchingNormalizedHandlesForType:andLabel:forCountryCode:", v80, v81, v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v24, "count"))
            {
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              v24 = v24;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
              if (v25)
              {
                v26 = *(_QWORD *)v91;
                do
                {
                  for (i = 0; i != v25; ++i)
                  {
                    if (*(_QWORD *)v91 != v26)
                      objc_enumerationMutation(v24);
                    v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                    v29 = objc_alloc(MEMORY[0x24BDD9F30]);
                    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "accountDataSource");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "__im_assistant_initWithContact:unformattedPersonHandle:accountDataSource:", v19, v28, v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v32)
                    {
                      objc_msgSend(v84, "addObject:", v32);
                    }
                    else if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v33 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v100 = (uint64_t)v19;
                        v101 = 2112;
                        v102 = v28;
                        _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Could not create INPerson from contant %@ and handle %@", buf, 0x16u);
                      }

                    }
                  }
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
                }
                while (v25);
              }

            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v100 = (uint64_t)v19;
                _os_log_impl(&dword_21ED90000, v35, OS_LOG_TYPE_INFO, "Contacts matching the requested recipient have identical names, but one of the contacts has no valid phone numbers or email addreses for this request. Ignoring that contact, as including it in the list of disambiguation options would make it indistinguishable from the other valid options with the exact same name. Contact: %@", buf, 0xCu);
              }

            }
          }
          else
          {
            v34 = objc_alloc(MEMORY[0x24BDD9F30]);
            objc_msgSend(v34, "__im_assistant_initForContactResolutionResultWithContact:type:label:", v19, v80, v81);
            v24 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v84, "addObject:", v24);
          }

          v17 = v83 + 1;
        }
        while (v83 + 1 != v82);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
        v82 = v36;
      }
      while (v36);
    }

    if (objc_msgSend(v84, "count"))
    {
      v37 = objc_msgSend(v84, "count") == 1;
      v38 = IMOSLoggingEnabled();
      if (v37)
      {
        if (v38)
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v39, OS_LOG_TYPE_INFO, "There was more than one contact matching the requested recipient AND those contacts had the exact same name, but only one of those contacts had a valid handle matching the request. Using that handle.", buf, 2u);
          }

        }
        objc_msgSend(v84, "firstObject");
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAssistantCoreSendMessageSignpostLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v73 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v42, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
        }

      }
      else
      {
        if (v38)
        {
          OSLogHandleForIMFoundationCategory();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            v65 = objc_msgSend(v84, "count");
            *(_DWORD *)buf = 134218242;
            v100 = v65;
            v101 = 2112;
            v102 = v84;
            _os_log_impl(&dword_21ED90000, v64, OS_LOG_TYPE_INFO, "Requesting disambiguation of %ld options: %@", buf, 0x16u);
          }

        }
        v66 = (void *)MEMORY[0x24BDDA0B8];
        v67 = (void *)objc_msgSend(v84, "copy");
        objc_msgSend(v66, "disambiguationWithPeopleToDisambiguate:", v67);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _IMAssistantCoreSendMessageSignpostLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        v40 = v68;
        if (v73 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v68))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v40, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
        }
      }
      goto LABEL_104;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v48, OS_LOG_TYPE_INFO, "There was more than one contact matching the requested recipient but those contacts had the exact same name, and none of those contacts had a valid handle matching the requested type. We won't offer disambiguation of the contacts, because none of the choices would lead to a successful resolution and the options would be indistinguishable and confusing.", buf, 2u);
      }

    }
    v40 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v49 = obj;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v87 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "accountDataSource");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "__im_assistant_allValidPersonOptionsWithAccountDataSource:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObjectsFromArray:](v40, "addObjectsFromArray:", v56);
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
      }
      while (v50);
    }

    v57 = -[NSObject count](v40, "count") == 0;
    v58 = IMOSLoggingEnabled();
    if (v57)
    {
      if (v58)
      {
        OSLogHandleForIMFoundationCategory();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v69, OS_LOG_TYPE_INFO, "None of the ambiguous contacts had any valid handles. Returning unsupportedReason = NoValidHandle.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedWithReason:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAssistantCoreSendMessageSignpostLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      v63 = v70;
      if (v73 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v70))
        goto LABEL_103;
      *(_WORD *)buf = 0;
    }
    else
    {
      if (v58)
      {
        OSLogHandleForIMFoundationCategory();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v59, OS_LOG_TYPE_INFO, "If the user had specified a different label/handle-type, valid options would have been available, returning unsupportedReason = NoHandleForLabel.", buf, 2u);
        }

      }
      v60 = (void *)MEMORY[0x24BDDA0B8];
      -[NSObject array](v40, "array");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "resolutionResultUnsupportedWithReason:alternativeItems:", 6, v61);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _IMAssistantCoreSendMessageSignpostLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v73 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v62))
        goto LABEL_103;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v63, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
LABEL_103:

LABEL_104:
    v15 = v79;
    goto LABEL_105;
  }
  objc_msgSend(v75, "firstObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v100 = (uint64_t)v15;
      _os_log_impl(&dword_21ED90000, v43, OS_LOG_TYPE_INFO, "Only one contact matches recipient. Ready to proceed to handle resolution for contact: %@", buf, 0xCu);
    }

  }
  v44 = objc_alloc(MEMORY[0x24BDD9F30]);
  objc_msgSend(v44, "__im_assistant_initForContactResolutionResultWithContact:type:label:", v15, v80, v81);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v45);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v72 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v47, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_21EDC1733, buf, 2u);
  }

LABEL_105:
  return v13;
}

- (id)handleResolutionResultForHandles:(id)a3 resolvedContactForAlternatives:(id)a4 recipient:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  id v35;
  _BOOL4 v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  BOOL v46;
  int v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v62 = a5;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  _IMAssistantCoreSendMessageSignpostLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "handleResolutionResultForContact", (const char *)&unk_21EDC1733, buf, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "__im_assistant_allValidPersonOptionsWithAccountDataSource:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count") == 0;
    v26 = IMOSLoggingEnabled();
    if (v25)
    {
      if (v26)
      {
        OSLogHandleForIMFoundationCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v39, OS_LOG_TYPE_INFO, "Could not find any matching handles, and contact has no phone numbers or email addresses, returning unsupported.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedWithReason:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAssistantCoreSendMessageSignpostLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      v29 = v40;
      if (v14 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v40))
        goto LABEL_40;
      *(_WORD *)buf = 0;
    }
    else
    {
      if (v26)
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Could not find any handles matching the requested label/handle-type, returning unsupported with suggested alternatives.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x24BDDA0B8], "resolutionResultUnsupportedWithReason:alternativeItems:", 6, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAssistantCoreSendMessageSignpostLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v14 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v28))
        goto LABEL_40;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v29, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_21EDC1733, buf, 2u);
LABEL_40:

    goto LABEL_41;
  }
  v17 = (unint64_t)objc_msgSend(v8, "count") > 1;
  v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Asking user to disambiguate among the matching handles.", buf, 2u);
      }

    }
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = sub_21EDA3758;
    v63[3] = &unk_24E395CE0;
    v64 = v16;
    objc_msgSend(v8, "__imArrayByApplyingBlock:", v63);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDA0B8], "disambiguationWithPeopleToDisambiguate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v23, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v24 = v64;
    goto LABEL_41;
  }
  if (v18)
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Only found one handle matching request, returning success for person.", buf, 2u);
    }

  }
  objc_msgSend(v8, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contact");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (!v32)
    goto LABEL_27;
  objc_msgSend(v62, "personHandle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "__im_assistant_handleType");

  if (!v43)
    goto LABEL_27;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v44, OS_LOG_TYPE_INFO, "The user explicitly requested a handle, e.g. 'Send a message to 555-555-5555', look up the contact to include in dialog.", buf, 2u);
    }

  }
  objc_msgSend(v24, "handleID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imHandleWithID:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v60)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v61;
        _os_log_impl(&dword_21ED90000, v57, OS_LOG_TYPE_INFO, "Could not create an IMHandle for handleID: %@", buf, 0xCu);
      }

    }
    goto LABEL_27;
  }
  objc_msgSend(v62, "personHandle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v61, objc_msgSend(v45, "type"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend(v59, "count") == 0;
  v47 = IMOSLoggingEnabled();
  if (v46)
  {
    if (v47)
    {
      OSLogHandleForIMFoundationCategory();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v61;
        _os_log_impl(&dword_21ED90000, v58, OS_LOG_TYPE_INFO, "Did not find any contacts matching manually requested handle: %@", buf, 0xCu);
      }

    }
    v55 = 0;
  }
  else
  {
    if (v47)
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = objc_msgSend(v59, "count");
        *(_DWORD *)buf = 134218242;
        v66 = v49;
        v67 = 2112;
        v68 = v61;
        _os_log_impl(&dword_21ED90000, v48, OS_LOG_TYPE_INFO, "Found %ld contacts matching manually requested person handle: %@.", buf, 0x16u);
      }

    }
    objc_msgSend(v59, "lastObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v50;
        _os_log_impl(&dword_21ED90000, v51, OS_LOG_TYPE_INFO, "Using contact identifier %@", buf, 0xCu);
      }

    }
    -[IMAssistantMessageHandler contactWithIdentifier:](self, "contactWithIdentifier:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v52;
        _os_log_impl(&dword_21ED90000, v53, OS_LOG_TYPE_INFO, "Found contact %@", buf, 0xCu);
      }

    }
    v54 = objc_alloc(MEMORY[0x24BDD9F30]);
    objc_msgSend(v54, "__im_assistant_initWithContact:imHandle:", v52, v60);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v55;
        _os_log_impl(&dword_21ED90000, v56, OS_LOG_TYPE_INFO, "Resolved manually dictated recipient: %@", buf, 0xCu);
      }

    }
  }

  if (!v55)
  {
LABEL_27:
    v33 = objc_alloc(MEMORY[0x24BDD9F30]);
    objc_msgSend(v33, "__im_assistant_initWithHandleFromContact:accountDataSource:", v24, v16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    goto LABEL_28;
  }
  v35 = v55;
  v34 = v35;
LABEL_28:
  v36 = v14 < 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v36 && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v38, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_21EDC1733, buf, 2u);
  }

LABEL_41:
  return v21;
}

- (id)recipientsResolutionFailureResultWithResult:(id)a3 forRecipient:(id)a4 amongRecipients:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21EDA3868;
  v13[3] = &unk_24E395C90;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a5, "__imArrayByApplyingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setMessageSendHandlerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendHandlerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_conversationIdentifierResolvedDuringRecipientResolution, 0);
}

@end
