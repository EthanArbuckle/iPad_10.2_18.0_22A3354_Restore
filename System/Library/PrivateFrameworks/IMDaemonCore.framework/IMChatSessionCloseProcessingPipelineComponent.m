@implementation IMChatSessionCloseProcessingPipelineComponent

- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5;
  IMChatSessionCloseProcessingPipelineComponent *v6;
  IMChatSessionCloseProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMChatSessionCloseProcessingPipelineComponent;
  v6 = -[IMChatSessionCloseProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageStore, a3);

  return v7;
}

- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 idsTrustedData:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMChatSessionCloseProcessingPipelineComponent *v12;
  IMChatSessionCloseProcessingPipelineComponent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMChatSessionCloseProcessingPipelineComponent;
  v12 = -[IMChatSessionCloseProcessingPipelineComponent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageStore, a3);
    objc_storeStrong((id *)&v13->_chatRegistry, a4);
    objc_storeStrong((id *)&v13->_idsTrustedData, a5);
  }

  return v13;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  IMDChatRegistry *chatRegistry;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  _BYTE v66[14];
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "GUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v66 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMChatSessionCloseProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

    }
  }
  v7 = IMGetCachedDomainBoolForKey();
  if ((_DWORD)v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v66 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "    Ignoring chat session close for message: %@", buf, 0xCu);

      }
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }
  else
  {
    objc_msgSend(v4, "GUID");
    v62 = objc_claimAutoreleasedReturnValue();
    v11 = IMOSLoggingEnabled(v62);
    if ((_DWORD)v11)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v66 = v62;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "    Received Fresh ChatSessionClose For Message GUID: %@", buf, 0xCu);
      }

    }
    v13 = IMOSLoggingEnabled(v11);
    if ((_DWORD)v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[IMDiMessageIDSTrustedData fromIdentifier](self->_idsTrustedData, "fromIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v66 = v15;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "idsTrustedData: fromIdentifier: %@", buf, 0xCu);

      }
    }
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "version");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");
        objc_msgSend(v4, "senderHandle");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "senderName");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "conversationID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v66 = v18;
        *(_WORD *)&v66[4] = 2112;
        *(_QWORD *)&v66[6] = v19;
        v67 = 2112;
        v68 = v20;
        v69 = 2112;
        v70 = v21;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Eufo -> version: %d, senderHandle: %@, senderName: %@, conversationID: %@", buf, 0x26u);

      }
    }
    v22 = objc_msgSend(v4, "isEmergencySOS", v62);
    objc_msgSend(v4, "conversationID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22)
    {
      objc_msgSend(CFSTR("tsharing:"), "stringByAppendingString:", v23);
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v66 = v24;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "chatIdentifier: %@", buf, 0xCu);
      }

    }
    chatRegistry = self->_chatRegistry;
    objc_msgSend(v4, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry existingChatWithIdentifier:account:](chatRegistry, "existingChatWithIdentifier:account:", v24, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = IMOSLoggingEnabled(v30);
    if (v29)
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Chat FOUND, acting on the ChatSessionClose command!", buf, 2u);
        }

      }
      if (objc_msgSend(v4, "isEmergencySOS"))
      {
        v33 = objc_alloc(MEMORY[0x1E0D39B60]);
        objc_msgSend(v29, "emergencyUserInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "emergencyUserPersona");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "senderID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "timestamp");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "__im_iMessageDateFromTimeStamp:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v33, "initWithSender:time:guid:type:", v36, v39, v63, 7);

        objc_msgSend(v29, "service");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "internalName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setService:", v42);

        objc_msgSend(v29, "account");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "accountID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setAccountID:", v44);

        objc_msgSend(v29, "account");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "loginID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setAccount:", v46);

      }
      else
      {
        if ((objc_msgSend(v4, "deleteConversation") & 1) != 0)
        {
          v40 = 0;
        }
        else
        {
          v48 = objc_alloc(MEMORY[0x1E0D39860]);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v48, "initWithSender:time:guid:type:", v24, v49, v50, 3);

          objc_msgSend(v40, "setActionType:", 0);
          objc_msgSend(v29, "service");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "internalName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setService:", v52);

          objc_msgSend(v29, "account");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "accountID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAccountID:", v54);

          objc_msgSend(v29, "account");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "loginID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAccount:", v56);

        }
        objc_msgSend(v29, "deleteBIAContext");
      }
      if (v40)
      {
        -[IMDMessageStore storeItem:forceReplace:](self->_messageStore, "storeItem:forceReplace:", v40, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "guid");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addMessageWithGUID:toChat:", v59, v29);

        v64 = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMessageItems:", v60);
        objc_msgSend(v4, "setChat:", v29);

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);

    }
    else
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Chat not found, dropping ChatSessionClose command!", buf, 2u);
        }

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
