@implementation IMDiMessageIDSDelegate

- (IMDiMessageIDSDelegate)init
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  IMDiMessageIncomingMessageHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IMDiMessageIDSDelegate *v17;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "commandHandlerRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v20, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D34358]);
  v19 = (void *)objc_msgSend(v6, "initWithService:commands:manuallyAckMessages:", *MEMORY[0x1E0D34240], v5, 1);
  v7 = objc_alloc(MEMORY[0x1E0D34358]);
  v8 = (void *)objc_msgSend(v7, "initWithService:commands:manuallyAckMessages:", *MEMORY[0x1E0D34248], v5, 1);
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "supports commands: %@", buf, 0xCu);
    }

  }
  v10 = objc_alloc_init(IMDiMessageIncomingMessageHandler);
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDMessageFromStorageController iMessageStorageController](IMDMessageFromStorageController, "iMessageStorageController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDRecentsController sharedInstance](IMDRecentsController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IMDiMessageIDSDelegate initWithiMessageService:bizChatService:incomingMessageHandler:messageStore:chatRegistry:accountController:storageController:recentsController:attachmentStore:](self, "initWithiMessageService:bizChatService:incomingMessageHandler:messageStore:chatRegistry:accountController:storageController:recentsController:attachmentStore:", v19, v8, v10, v11, v12, v13, v14, v15, v16);

  return v17;
}

- (IMDiMessageIDSDelegate)initWithiMessageService:(id)a3 bizChatService:(id)a4 incomingMessageHandler:(id)a5 messageStore:(id)a6 chatRegistry:(id)a7 accountController:(id)a8 storageController:(id)a9 recentsController:(id)a10 attachmentStore:(id)a11
{
  IMDiMessageIDSDelegate *v18;
  IMDiMessageIDSDelegate *v19;
  void *v20;
  NSObject *v21;
  IDSService *idsService;
  void *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  IDSService *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = a9;
  v32 = a10;
  v33 = a11;
  v34.receiver = self;
  v34.super_class = (Class)IMDiMessageIDSDelegate;
  v18 = -[IMDiMessageIDSDelegate init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_idsService, a3);
    -[IDSService addDelegate:queue:](v19->_idsService, "addDelegate:queue:", v19, MEMORY[0x1E0C80D38]);
    objc_storeStrong((id *)&v19->_bizChatService, a4);
    -[IDSService addDelegate:queue:](v19->_bizChatService, "addDelegate:queue:", v19, MEMORY[0x1E0C80D38]);

    objc_storeStrong((id *)&v19->_handler, a5);
    objc_storeStrong((id *)&v19->_messageStore, a6);
    objc_storeStrong((id *)&v19->_accountController, a8);
    objc_storeStrong((id *)&v19->_messageFromStorageController, a9);
    objc_storeStrong((id *)&v19->_recentsController, a10);
    objc_storeStrong((id *)&v19->_chatRegistry, a7);
    objc_storeStrong((id *)&v19->_attachmentStore, a11);
    objc_msgSend((id)objc_opt_class(), "commandHandlerRegistry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        idsService = v19->_idsService;
        objc_msgSend(v20, "allKeys");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = idsService;
        v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "IDS Delegate Loaded service: %@ handling commands %@", buf, 0x16u);

      }
    }

  }
  return v19;
}

- (id)broadcaster
{
  void *v2;
  void *v3;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcasterForChatListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isDefaultPairedDevice:(id)a3 withAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "idsAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isDefaultPairedDevice", (_QWORD)v16))
        {
          objc_msgSend(v12, "pushToken");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToData:", v5);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return v9;
}

+ (id)commandHandlerRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14D7C98;
  block[3] = &unk_1E9227F30;
  block[4] = a1;
  if (qword_1ED936278 != -1)
    dispatch_once(&qword_1ED936278, block);
  objc_msgSend((id)qword_1ED936280, "handlers");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)addStandardCommandHandlersToRegistry:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDDeliveryReceipt";
    v22 = 2112;
    v23 = &unk_1E9271260;
    _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BA50, &unk_1E9271260);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscriptSharingEnabled");

  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v20 = 136315394;
      v21 = "FTCommandIDChatSessionClose";
      v22 = 2112;
      v23 = &unk_1E9271278;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
    }

    objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BA98, &unk_1E9271278);
  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDReadReceipt";
    v22 = 2112;
    v23 = &unk_1E9271290;
    _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BAB8, &unk_1E9271290);
  IMLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDMarkAsUnreadMessage";
    v22 = 2112;
    v23 = &unk_1E92712A8;
    _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BB00, &unk_1E92712A8);
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDPlayedReceipt";
    v22 = 2112;
    v23 = &unk_1E92712C0;
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BB68, &unk_1E92712C0);
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDDeliveredQuietly";
    v22 = 2112;
    v23 = &unk_1E92712D8;
    _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BB88, &unk_1E92712D8);
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDNotifyRecipient";
    v22 = 2112;
    v23 = &unk_1E92712F0;
    _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BBA8, &unk_1E92712F0);
  IMLogHandleForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDTextMessage";
    v22 = 2112;
    v23 = &unk_1E9271308;
    _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BBC8, &unk_1E9271308);
  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDSyndicationAction";
    v22 = 2112;
    v23 = &unk_1E9271320;
    _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BC60, &unk_1E9271320);
  IMLogHandleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDEditMessage";
    v22 = 2112;
    v23 = &unk_1E9271338;
    _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BC80, &unk_1E9271338);
  IMLogHandleForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "FTCommandIDRecoverJunkMessage";
    v22 = 2112;
    v23 = &unk_1E9271350;
    _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BCA0, &unk_1E9271350);
  IMLogHandleForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "IDSCommandIDStickerRepositionMessage";
    v22 = 2112;
    v23 = &unk_1E9271368;
    _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BCC0, &unk_1E9271368);
  IMLogHandleForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "134";
    v22 = 2112;
    v23 = &unk_1E9271380;
    _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BCE0, &unk_1E9271380);
  IMLogHandleForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "135";
    v22 = 2112;
    v23 = &unk_1E9271398;
    _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(v3, "setStandardHandler:forCommand:", &unk_1E922BD00, &unk_1E9271398);
}

+ (void)addLockdownCommandHandlersToRegistry:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setLockdownHandler:forCommand:", &unk_1E922BD20, &unk_1E9271308);
  objc_msgSend(v3, "setPassThroughLockdownHandlerForCommand:", &unk_1E9271260);
  objc_msgSend(v3, "setPassThroughLockdownHandlerForCommand:", &unk_1E9271290);

}

- (BOOL)_containsHandlesForTrustedData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "fromIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stripFZIDPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ || %K == %@"), *MEMORY[0x1E0D38070], v4, *MEMORY[0x1E0D38088], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleRecordsFilteredByPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "count") != 0;
  return (char)v6;
}

- (BOOL)blockCommandForTrustedData:(id)a3
{
  id v4;
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isFromMe") & 1) != 0)
    goto LABEL_2;
  LOBYTE(v5) = 0;
  v6 = objc_msgSend(v4, "command") - 102;
  if (v6 > 0x14)
    goto LABEL_6;
  if (((1 << v6) & 0x110C09) != 0)
  {
    v5 = !-[IMDiMessageIDSDelegate _containsHandlesForTrustedData:](self, "_containsHandlesForTrustedData:", v4);
    goto LABEL_6;
  }
  if (((1 << v6) & 0x24200) == 0)
    goto LABEL_6;
  v8 = objc_msgSend(v4, "isFromMe");
  if ((v8 & 1) != 0)
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Received message that should only be from me (trustedData: %@)", (uint8_t *)&v10, 0xCu);
      }

    }
    LOBYTE(v5) = 1;
  }
LABEL_6:

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  IMDiMessageIDSDelegate *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  uint64_t v35;
  IMDAccountController *accountController;
  void *v37;
  void *v38;
  uint64_t v39;
  IMDiMessageIDSDelegate *v40;
  void *v41;
  IMDAccountController *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  IMDAccountController *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  IMDAccountController *v53;
  NSObject *v54;
  IMDiMessageIDSDelegate *v55;
  IMDiMessagePipelineResources *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  IMDiMessagePipelineResources *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  IMDiMessageIDSTrustedData *v70;
  NSObject *v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  NSObject *v95;
  IMDiMessageIDSDelegate *v96;
  id v97;
  id v98;
  IMDAccountController *v99;
  void *v100;
  IMDiMessageIDSDelegate *v101;
  IMDiMessageIDSDelegate *v102;
  IMDiMessageIDSTrustedData *v103;
  _QWORD v104[4];
  IMDiMessageIDSTrustedData *v105;
  IMDiMessageIDSDelegate *v106;
  IMDiMessageIDSDelegate *v107;
  IMDiMessageIDSDelegate *v108;
  IMDiMessagePipelineResources *v109;
  id v110;
  IMDAccountController *v111;
  uint64_t *v112;
  char v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  IMDiMessageIDSDelegate *v122;
  __int16 v123;
  IMDAccountController *v124;
  __int16 v125;
  IMDiMessageIDSDelegate *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  id v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  IMDiMessageIDSDelegate *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v101 = (IMDiMessageIDSDelegate *)a3;
  v96 = (IMDiMessageIDSDelegate *)a4;
  v99 = (IMDAccountController *)a5;
  v97 = a6;
  v98 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v95 = _os_activity_create(&dword_1D1413000, "com.apple.messages.iMessageReceivedPush", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v95, &state);
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = sub_1D14D8B70;
  v118 = sub_1D14D8B80;
  v119 = 0;
  v119 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AA0]), "initWithIdentifier:timeout:", CFSTR("IncomingPipelineMessagePowerAssertion"), 10.0);
  v103 = -[IMDiMessageIDSTrustedData initWithTopLevelMessage:fromPushID:messageContext:]([IMDiMessageIDSTrustedData alloc], "initWithTopLevelMessage:fromPushID:messageContext:", v99, v97, v98);
  -[IMDAccountController objectForKey:](v99, "objectForKey:", *MEMORY[0x1E0D34890]);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectForKey:", CFSTR("U"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v100, "objectForKey:", CFSTR("U"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_IDSDataFromBase64String:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v17 = (void *)v16;
    v18 = isKindOfClass ^ 1;
    goto LABEL_7;
  }
  objc_msgSend(v100, "objectForKey:", CFSTR("U"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v100, "objectForKey:", CFSTR("U"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v18 = 0;
  v17 = 0;
LABEL_7:
  JWUUIDPushObjectToString();
  v102 = (IMDiMessageIDSDelegate *)objc_claimAutoreleasedReturnValue();
  if ((v18 & 1) != 0)

  if ((isKindOfClass & 1) != 0)
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[IMDiMessageIDSDelegate uniqueID](v96, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[IMDiMessageIDSTrustedData command](v103, "command");
      *(_DWORD *)buf = 134219522;
      v122 = self;
      v123 = 2048;
      v124 = v99;
      v125 = 2112;
      v126 = v101;
      v127 = 2112;
      v128 = v21;
      v129 = 2112;
      v130 = v97;
      v131 = 2048;
      v132 = v22;
      v133 = 2112;
      v134 = v102;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "<IMDiMessageIDSDelegate %p> Received incoming iMessage %p for service %@ account %@ fromID: %@ command: %ld, guid: %@", buf, 0x48u);

    }
  }
  v23 = objc_opt_class();
  sub_1D14E19C0(v23, v100, CFSTR("mc"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
  {
    +[IMMessagesToTrack sharedInstance](IMMessagesToTrack, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addMessagesID:", v102);

  }
  if (-[IMDiMessageIDSDelegate length](v102, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%@.data"), -[IMDiMessageIDSTrustedData command](v103, "command"), v102);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D398A8], "writeMessagePayloadToDisk:fileName:", v99, v27);

  }
  v28 = -[IMDiMessageIDSTrustedData command](v103, "command");
  if (!v28
    || (v28 = +[IMBlastdoor _commandReadyForBlastdoor:](IMBlastdoor, "_commandReadyForBlastdoor:", -[IMDiMessageIDSTrustedData command](v103, "command")), !(_DWORD)v28))
  {
    if (IMOSLoggingEnabled(v28))
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v122 = (IMDiMessageIDSDelegate *)v103;
        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Rejecting BlastDoor processing for trustedData %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
LABEL_27:
    -[IMDiMessageIDSDelegate sendAckForMessageWithContext:](v101, "sendAckForMessageWithContext:", v98);
    v32 = (void *)v115[5];
    v115[5] = 0;
    goto LABEL_65;
  }
  -[IMDiMessageIDSDelegate bizChatService](self, "bizChatService");
  v29 = (IMDiMessageIDSDelegate *)objc_claimAutoreleasedReturnValue();
  if (v29 == v101)
  {
    v33 = -[IMDiMessageIDSTrustedData command](v103, "command") == 100;

    if (!v33)
      goto LABEL_43;
    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v102;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Passing biz chat through legacy path (guid: %@)", buf, 0xCu);
      }

    }
    v35 = objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat");
    if ((v35 & 1) != 0)
    {
      accountController = self->_accountController;
      -[IMDiMessageIDSDelegate uniqueID](v96, "uniqueID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDAccountController accountForIDSAccountUniqueID:](accountController, "accountForIDSAccountUniqueID:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v39 = objc_opt_isKindOfClass();
      if ((v39 & 1) != 0)
      {
        objc_msgSend(v38, "session");
        v40 = (IMDiMessageIDSDelegate *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "idsAccount");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDiMessageIDSDelegate _pushHandlerForIDSAccount:](v40, "_pushHandlerForIDSAccount:", v41);
        v42 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v39 = objc_opt_respondsToSelector();
          if ((v39 & 1) != 0)
          {
            if (IMOSLoggingEnabled(v39))
            {
              OSLogHandleForIMFoundationCategory();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v122 = v40;
                v123 = 2112;
                v124 = v42;
                _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Found service session for biz chat, passing along (%@), push handler (%@)", buf, 0x16u);
              }

            }
            -[IMDAccountController objectForKey:](v99, "objectForKey:", *MEMORY[0x1E0D34870]);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDAccountController objectForKey:](v99, "objectForKey:", *MEMORY[0x1E0D34888]);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_opt_class();
            sub_1D14E19C0(v44, v100, CFSTR("tP"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_opt_class();
            sub_1D14E19C0(v45, v100, CFSTR("sP"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectForKey:", CFSTR("t"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v94 = objc_opt_isKindOfClass();
            if ((v94 & 1) != 0)
            {
              v46 = (void *)MEMORY[0x1E0C99D50];
              objc_msgSend(v100, "objectForKey:", CFSTR("t"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "_IDSDataFromBase64String:", v92);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v100, "objectForKey:", CFSTR("t"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v72 = 0;
                v87 = 0;
                goto LABEL_79;
              }
              objc_msgSend(v100, "objectForKey:", CFSTR("t"));
              v87 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v72 = v94 ^ 1;
LABEL_79:
            v73 = objc_opt_class();
            sub_1D14E19C0(v73, v100, CFSTR("e"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_opt_class();
            sub_1D14E19C0(v74, v100, CFSTR("Dc"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_opt_class();
            sub_1D14E19C0(v75, v100, CFSTR("Dc"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_opt_class();
            sub_1D14E19C0(v77, v100, CFSTR("H"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDAccountController objectForKey:](v99, "objectForKey:", CFSTR("mid"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_opt_class();
            sub_1D14E19C0(v80, v100, CFSTR("mc"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "BOOLValue");
            BYTE1(v84) = -[IMDAccountController BOOLValueForKey:withDefault:](v99, "BOOLValueForKey:withDefault:", CFSTR("stu"), 1);
            LOBYTE(v84) = v82;
            LOBYTE(v83) = 0;
            -[IMDiMessageIDSDelegate handler:incomingMessage:originalEncryptionType:messageID:toIdentifier:fromIdentifier:fromToken:timeStamp:fromIDSID:incomingEngroup:needsDeliveryReceipt:deliveryContext:storageContext:messageContext:isBeingReplayed:mergeID:wantsCheckpointing:isSnapTrustedUser:](v40, "handler:incomingMessage:originalEncryptionType:messageID:toIdentifier:fromIdentifier:fromToken:timeStamp:fromIDSID:incomingEngroup:needsDeliveryReceipt:deliveryContext:storageContext:messageContext:isBeingReplayed:mergeID:wantsCheckpointing:isSnapTrustedUser:", v42, v91, v90, v102, v89, v88, v87, v86, v97, 0, v85, v76, v78, v98, v83,
              v79,
              v84);

            if ((v72 & 1) != 0)
            if ((v94 & 1) != 0)

LABEL_84:
            goto LABEL_27;
          }
        }
      }
      else
      {
        v42 = 0;
        v40 = 0;
      }
      if (IMOSLoggingEnabled(v39))
      {
        OSLogHandleForIMFoundationCategory();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v122 = v40;
          v123 = 2112;
          v124 = v42;
          v125 = 2112;
          v126 = v102;
          _os_log_impl(&dword_1D1413000, v71, OS_LOG_TYPE_INFO, "Failed to process incoming biz chat message because we couldn't find a session (%@) or push handler (%@) (guid: %@)", buf, 0x20u);
        }

      }
      goto LABEL_84;
    }
    if (IMOSLoggingEnabled(v35))
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v102;
        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Drop incoming business chat message because it is not supported. (guid: %@)", buf, 0xCu);
      }
LABEL_26:

      goto LABEL_27;
    }
    goto LABEL_27;
  }

LABEL_43:
  if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v122 = v102;
      _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "BlastDoor processing GUID (%@)", buf, 0xCu);
    }

  }
  if (-[IMDiMessageIDSTrustedData command](v103, "command") == 100)
    im_sendMessageCheckpointIfNecessary();
  v48 = self->_accountController;
  -[IMDiMessageIDSDelegate uniqueID](v96, "uniqueID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccountController accountForIDSAccountUniqueID:](v48, "accountForIDSAccountUniqueID:", v49);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v51 = IMOSLoggingEnabled(v50);
    if ((_DWORD)v51)
    {
      OSLogHandleForIMFoundationCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v53 = self->_accountController;
        *(_DWORD *)buf = 138412546;
        v122 = v96;
        v123 = 2112;
        v124 = v53;
        _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "<Warning> Couldn't find IMDAccount for IDSAccount (%@) using accountController: %@", buf, 0x16u);
      }

    }
    if (IMOSLoggingEnabled(v51))
    {
      OSLogHandleForIMFoundationCategory();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        -[IMDAccountController accounts](self->_accountController, "accounts");
        v55 = (IMDiMessageIDSDelegate *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v122 = v55;
        _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_INFO, "  AllAccounts: %@", buf, 0xCu);

      }
    }
  }
  v56 = [IMDiMessagePipelineResources alloc];
  -[IMDiMessageIDSDelegate messageStore](self, "messageStore");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSDelegate messageFromStorageController](self, "messageFromStorageController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSDelegate broadcaster](self, "broadcaster");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSDelegate recentsController](self, "recentsController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSDelegate chatRegistry](self, "chatRegistry");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSDelegate attachmentStore](self, "attachmentStore");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[IMDiMessagePipelineResources initWithIMDAccount:service:messageStore:storageController:broadcaster:recentsController:chatRegistry:attachmentStore:](v56, "initWithIMDAccount:service:messageStore:storageController:broadcaster:recentsController:chatRegistry:attachmentStore:", v32, v101, v57, v58, v59, v60, v61, v62);

  if (-[IMDiMessageIDSTrustedData isFromMe](v103, "isFromMe"))
  {
    v64 = 1;
  }
  else
  {
    -[IMDiMessagePipelineResources chatRegistry](v63, "chatRegistry");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDiMessageIDSTrustedData fromIdentifier](v103, "fromIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v65, "hasKnownSenderChatWithChatIdentifier:", v66);

  }
  v67 = (void *)MEMORY[0x1E0D39A10];
  -[IMDiMessageIDSDelegate serviceIdentifier](v101, "serviceIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "contextWithKnownSender:serviceName:", v64, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IMDiMessageIDSDelegate blockCommandForTrustedData:](self, "blockCommandForTrustedData:", v103))
  {
    -[IMDiMessageIDSDelegate sendAckForMessageWithContext:](v101, "sendAckForMessageWithContext:", v98);
    v70 = (IMDiMessageIDSTrustedData *)v115[5];
    v115[5] = 0;
  }
  else
  {
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = sub_1D14E1A68;
    v104[3] = &unk_1E922BD70;
    v105 = v103;
    v106 = v101;
    v113 = v25;
    v107 = v102;
    v108 = self;
    v109 = v63;
    v110 = v98;
    v112 = &v114;
    v111 = v99;
    +[IMBlastdoor sendDictionary:senderContext:withCompletionBlock:](IMBlastdoor, "sendDictionary:senderContext:withCompletionBlock:", v111, v69, v104);

    v70 = v105;
  }

LABEL_65:
  _Block_object_dispose(&v114, 8);

  os_activity_scope_leave(&state);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (IDSService)bizChatService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (IMDiMessageIncomingMessageHandler)handler
{
  return (IMDiMessageIncomingMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (IMDMessageStore)messageStore
{
  return (IMDMessageStore *)objc_getProperty(self, a2, 40, 1);
}

- (IMDAccountController)accountController
{
  return (IMDAccountController *)objc_getProperty(self, a2, 48, 1);
}

- (IMDMessageFromStorageController)messageFromStorageController
{
  return (IMDMessageFromStorageController *)objc_getProperty(self, a2, 56, 1);
}

- (IMDChatRegistry)chatRegistry
{
  return (IMDChatRegistry *)objc_getProperty(self, a2, 64, 1);
}

- (IMDRecentsController)recentsController
{
  return (IMDRecentsController *)objc_getProperty(self, a2, 72, 1);
}

- (IMDAttachmentStore)attachmentStore
{
  return (IMDAttachmentStore *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)runningInAutomation
{
  return self->_runningInAutomation;
}

- (void)setRunningInAutomation:(BOOL)a3
{
  self->_runningInAutomation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentStore, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageFromStorageController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_bizChatService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
