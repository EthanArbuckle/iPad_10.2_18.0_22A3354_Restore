@implementation IMAssistantUnsendMessagesHandler

- (void)handleUnsendMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Handling INUnsendMessagesIntent: %@", buf, 0xCu);
    }

  }
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasMessagingAccount");

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v6, "messageIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v17 = v7;
    IMSPIQueryIMMessageItemsWithGUIDsAndQOS();

    v14 = v16;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
          buf,
          2u);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 10, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }

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

+ (id)makeRetractedMessageItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "plainBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_24E396530;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
  }
  objc_msgSend(v4, "__im_messageTextByRemovingMessagePartIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE51230];
  objc_msgSend(v3, "fileTransferGUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "newMessageItemFrom:withText:deleteSubject:withFileTransferGUIDs:", v3, v9, 1, v11);

  objc_msgSend(MEMORY[0x24BDBCE60], "__im_dateWithCurrentServerTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDateEdited:", v13);

  objc_msgSend(v12, "addRetractedPartIndex:", 0);
  return v12;
}

- (void)retractPartIndex:(int64_t)a3 fromMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v10, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v14 = 0;
  +[IMAssistantUnsendMessagesHandler makeRetractedMessageItem:](IMAssistantUnsendMessagesHandler, "makeRetractedMessageItem:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "chatStyle");
  objc_msgSend(v10, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "uniqueID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:", v15, v11, a3, 2, v14, v17, v19, v9);

}

@end
