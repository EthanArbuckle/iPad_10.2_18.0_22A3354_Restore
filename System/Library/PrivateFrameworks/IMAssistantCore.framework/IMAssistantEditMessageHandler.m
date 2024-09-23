@implementation IMAssistantEditMessageHandler

- (void)resolveEditedContentForEditMessage:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v5, "editedContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trimmedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Trimmed message content length is nonzero, returning success", v15, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Trimmed message content length is zero, returning needsValue", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDDA218], "needsValue");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v12;
  v6[2](v6, v12);

}

- (void)confirmEditMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Confirming INEditMessageIntent: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasMessagingAccount");

  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
          (uint8_t *)&v15,
          2u);
      }

    }
    v12 = 10;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", v12, 0);
  v7[2](v7, v14);

}

- (void)handleEditMessage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Handling INEditMessageIntent: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "messageIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v16 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    v15 = v6;
    IMSPIQueryIMMessageItemsWithGUIDsAndQOS();

    v12 = v14;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Intent message identifier is nil", buf, 2u);
      }

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 4, 0);
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }

}

- (void)sendEditedMessageItem:(id)a3 originalMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v9 = (void *)MEMORY[0x24BE502D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "sharedInstance");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "__im_messagePartIndexes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "firstIndex");
  objc_msgSend(v11, "chatIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "chatStyle");
  objc_msgSend(v11, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:", v13, v12, v16, 1, v17, v18, v20, v10);

}

- (void)chatsForMessageIdentifiers:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = v6;
  v9 = v5;
  IMSPIQueryMessagesWithGUIDsAndQOS();

}

@end
