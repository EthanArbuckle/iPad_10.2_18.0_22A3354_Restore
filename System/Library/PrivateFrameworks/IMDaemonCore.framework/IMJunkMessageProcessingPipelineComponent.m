@implementation IMJunkMessageProcessingPipelineComponent

- (IMJunkMessageProcessingPipelineComponent)initWithIDSTrustedData:(id)a3
{
  id v5;
  IMJunkMessageProcessingPipelineComponent *v6;
  IMJunkMessageProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMJunkMessageProcessingPipelineComponent;
  v6 = -[IMJunkMessageProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_idsTrustedData, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v33;
  void *v34;
  char IsKnownContact;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMJunkMessageProcessingPipelineComponent> Started processing", (uint8_t *)&v55, 2u);
    }

  }
  v6 = objc_msgSend(MEMORY[0x1E0D39AF8], "isiMessageJunkFilterEnabled");
  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v55) = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Oscar is disabled", (uint8_t *)&v55, 2u);
      }

    }
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v8 && (v9 = IMGetDomainBoolForKey(), (_DWORD)v9))
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v55) = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Default value set: oscar enabled.", (uint8_t *)&v55, 2u);
      }

    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v4, "messageItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") != 1)
  {

LABEL_27:
    v19 = objc_msgSend(v4, "isFromMe");
    if ((_DWORD)v19)
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "fromIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 138412290;
          v56 = (uint64_t)v21;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message is a message from me, not processing for junk: %@", (uint8_t *)&v55, 0xCu);

        }
      }
      goto LABEL_46;
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trackiMessageJunkEvent:", 2);

    v23 = -[IMDiMessageIDSTrustedData isFromTrustedSender](self->_idsTrustedData, "isFromTrustedSender");
    LODWORD(v22) = v23;
    v24 = IMOSLoggingEnabled(v23);
    if (((v11 | v22 ^ 1) & 1) == 0)
    {
      if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          LOWORD(v55) = 0;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Message is from trusted sender", (uint8_t *)&v55, 2u);
        }

      }
      goto LABEL_46;
    }
    if (v24)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "fromIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 138412290;
        v56 = (uint64_t)v26;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Message is not from a trusted sender, received from: %@", (uint8_t *)&v55, 0xCu);

      }
    }
    objc_msgSend(v4, "chat");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          LOWORD(v55) = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Could not find chat, bailing", (uint8_t *)&v55, 2u);
        }

      }
      goto LABEL_62;
    }
    if (!objc_msgSend(v4, "hadChat"))
    {
      objc_msgSend(v4, "fromIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      IsKnownContact = _IMDCoreSpotlightIsKnownContact();

      if ((IsKnownContact & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "trackiMessageJunkEvent:", 12);
      }
      else
      {
        if (IMOSLoggingEnabled(v36))
        {
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            LOWORD(v55) = 0;
            _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Message is not from known sender", (uint8_t *)&v55, 2u);
          }

        }
        +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "toIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "account");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v43, "receiverIsCandidateForJunk:forAccount:", v44, v45);

        if ((v46 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v47))
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v4, "toIdentifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = 138412290;
              v56 = (uint64_t)v53;
              _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "Receiver: %@ is not candidate for Oscar", (uint8_t *)&v55, 0xCu);

            }
          }
          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "trackiMessageJunkEvent:", 13);

          v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
          goto LABEL_63;
        }
        objc_msgSend(MEMORY[0x1E0D39B48], "sharedInstance");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "sendReceivedJunkEventIfNeeded");

        if (IMOSLoggingEnabled(objc_msgSend(v27, "updateIsFiltered:", 2)))
        {
          OSLogHandleForIMFoundationCategory();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            LOWORD(v55) = 0;
            _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "Chat set as junk", (uint8_t *)&v55, 2u);
          }

        }
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v27, 1, 0, 1);

        objc_msgSend(v4, "fromIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "toIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMJunkMessageProcessingPipelineComponent _trackSendEventForSender:andReceiver:](self, "_trackSendEventForSender:andReceiver:", v37, v51);

      }
      v31 = objc_alloc_init(MEMORY[0x1E0D35A10]);
      objc_msgSend(v31, "fullfillWithValue:", v4);
      goto LABEL_75;
    }
    if (objc_msgSend(v27, "isFiltered") == 2)
    {
      objc_msgSend(v4, "fromIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMJunkMessageProcessingPipelineComponent _trackSendEventForSender:andReceiver:](self, "_trackSendEventForSender:andReceiver:", v28, v29);

    }
    else
    {
      v38 = objc_msgSend(v27, "isFiltered");
      if (v38)
        goto LABEL_58;
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trackiMessageJunkEvent:", 12);
    }

LABEL_58:
    if (IMOSLoggingEnabled(v38))
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = objc_msgSend(v27, "isFiltered");
        v55 = 134217984;
        v56 = v40;
        _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Chat already exists, filtered as: %lld", (uint8_t *)&v55, 0xCu);
      }

    }
LABEL_62:
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_63:
    v31 = (id)v41;
LABEL_75:

    goto LABEL_47;
  }
  objc_msgSend(v4, "messageItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isTypingMessage");

  if (!v16)
    goto LABEL_27;
  if (IMOSLoggingEnabled(v17))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Message is a typing indicator, not processing for junk", (uint8_t *)&v55, 2u);
    }

  }
LABEL_46:
  v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_47:

  return v31;
}

- (void)_trackSendEventForSender:(id)a3 andReceiver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1D17EA35C](v5);
  if ((_DWORD)v8 && MEMORY[0x1D17EA35C](v6))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    IMCountryCodeForNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IMCountryCodeForNumber();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isEqualToString:", v11));
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = &unk_1E9271530;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = &unk_1E9271548;
  v17[0] = v14;
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackiMessageJunkEvent:withDictionary:", 1, v15);

}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end
