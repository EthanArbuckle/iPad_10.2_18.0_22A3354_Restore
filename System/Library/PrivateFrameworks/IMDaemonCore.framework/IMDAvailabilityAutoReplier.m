@implementation IMDAvailabilityAutoReplier

- (IMDAvailabilityAutoReplier)init
{
  IMDAvailabilityAutoReplier *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *privateWorkQueue;
  CARAutomaticDNDStatus *v5;
  CARAutomaticDNDStatus *automaticDNDStatus;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMDAvailabilityAutoReplier;
  v2 = -[IMDAvailabilityAutoReplier init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.IMDAvailabilityAutoReplier", 0);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v3;

    v5 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)MEMORY[0x1D17EA3EC](CFSTR("CARAutomaticDNDStatus"), CFSTR("CarKit")));
    automaticDNDStatus = v2->_automaticDNDStatus;
    v2->_automaticDNDStatus = v5;

  }
  return v2;
}

- (void)processMessages:(id)a3 inChat:(id)a4 fromIDSID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *privateWorkQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D14CE360;
  v15[3] = &unk_1E922B838;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(privateWorkQueue, v15);

}

- (void)_processMessagesForAvailabilityAutoReply:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  _BOOL8 v14;
  NSObject *v15;
  _BOOL8 v16;
  _BOOL4 v17;
  int v18;
  NSObject *v19;
  id WeakRetained;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[16];
  uint8_t v29[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMDAvailabilityAutoReplier _chatEligibleForAvailabilityInformation:](self, "_chatEligibleForAvailabilityInformation:", v10);
  if (v11)
  {
    objc_msgSend(v10, "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = -[IMDAvailabilityAutoReplier _messageSenderEligibleToReceiveAvailabilityInformation:](self, "_messageSenderEligibleToReceiveAvailabilityInformation:", v13);
    if (v14)
    {
      -[IMDAvailabilityAutoReplier _messageItemsSupportingBreakthroughNotifications:](self, "_messageItemsSupportingBreakthroughNotifications:", v8);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[IMDAvailabilityAutoReplier _shouldIgnoreDoNotDisturbForMessages:inChat:](self, "_shouldIgnoreDoNotDisturbForMessages:inChat:", v15, v10);
      v17 = v16;
      v18 = IMOSLoggingEnabled(v16);
      if (v17)
      {
        if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Message items should break through do not disturb, sending did notify recipient receipt, and triggering urgent notifications", buf, 2u);
          }

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
        objc_msgSend(WeakRetained, "autoReplier:sendNotifyRecipientCommandForMessages:inChat:", self, v15, v10);

        -[IMDAvailabilityAutoReplier _messageGuidsForMessages:](self, "_messageGuidsForMessages:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_loadWeakRetained((id *)&self->_replyDelegate);
        objc_msgSend(v22, "autoReplier:receivedUrgentRequestForMessages:", self, v21);

      }
      else
      {
        if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Message items did not break through do not disturb, attempting to send unavailability receipt or SMS message", v26, 2u);
          }

        }
        -[IMDAvailabilityAutoReplier _messageItemsSupportingAvailabilityReplyFromItems:](self, "_messageItemsSupportingAvailabilityReplyFromItems:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          -[IMDAvailabilityAutoReplier _sendDeliveredQuietelyForMessages:forIncomingMessageFromIDSID:inChat:](self, "_sendDeliveredQuietelyForMessages:forIncomingMessageFromIDSID:inChat:", v21, v9, v10);
        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "No message items support availability reply, ending processing", v25, 2u);
          }

        }
      }

    }
    else
    {
      if (!IMOSLoggingEnabled(v14))
      {
LABEL_27:

        goto LABEL_28;
      }
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Message sender not eligible for availability reply or dnd breakthrough", v28, 2u);
      }
    }

    goto LABEL_27;
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Chat is not eligible for availability auto replies or dnd breakthrough", v29, 2u);
    }
    goto LABEL_27;
  }
LABEL_28:

}

- (BOOL)_userIsAvailableToHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17EA3EC](CFSTR("DNDModeConfigurationService"), CFSTR("DoNotDisturb"));
  if (objc_msgSend(v5, "instancesRespondToSelector:", sel_isLocalUserAvailableForContactInActiveMode_error_))
  {
    objc_msgSend(v5, "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDAvailabilityAutoReplier _dndHandleForIMDHandle:](self, "_dndHandleForIMDHandle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    LOBYTE(v8) = objc_msgSend(v6, "isLocalUserAvailableForContactInActiveMode:error:", v7, &v11);
    v9 = v11;
    if (v9)
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1D1668F0C();

      LOBYTE(v8) = 1;
    }

  }
  else
  {
    LODWORD(v8) = IMGetDomainBoolForKeyWithDefaultValue() ^ 1;
  }

  return (char)v8;
}

- (id)_dndHandleForIMDHandle:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMStringIsEmail())
    v4 = 1;
  else
    v4 = 2;
  v5 = objc_alloc_init((Class)MEMORY[0x1D17EA3EC](CFSTR("DNDMutableContactHandle"), CFSTR("DoNotDisturb")));
  objc_msgSend(v5, "setType:", v4);
  objc_msgSend(v5, "setValue:", v3);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (BOOL)_chatEligibleForAvailabilityInformation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  uint8_t buf[2];

  v3 = a3;
  v4 = objc_msgSend(v3, "style");
  if ((_DWORD)v4 == 45)
  {
    v5 = objc_msgSend(v3, "isBusinessChat");
    if ((_DWORD)v5)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v17 = 0;
          v7 = "Not processing possible availability reply for business chat";
          v8 = (uint8_t *)&v17;
LABEL_9:
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      v11 = objc_msgSend(v3, "isStewieChat");
      if ((_DWORD)v11)
      {
        if (!IMOSLoggingEnabled(v11))
          goto LABEL_11;
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        v16 = 0;
        v7 = "Not processing possible availability reply for stewie chat";
        v8 = (uint8_t *)&v16;
        goto LABEL_9;
      }
      objc_msgSend(v3, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 == 1)
      {
        v9 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        v15 = 0;
        v7 = "Not processing possible availability reply for chat with more than one participant";
        v8 = (uint8_t *)&v15;
        goto LABEL_9;
      }
    }
  }
  else if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Not processing possible availability reply for non 1-1 chat";
      v8 = buf;
      goto LABEL_9;
    }
LABEL_10:

  }
LABEL_11:
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_messageSenderEligibleToReceiveAvailabilityInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  _BOOL8 v11;
  BOOL v12;
  NSObject *v13;
  uint8_t v15[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not processing possible availability reply for sender with zero length handle", v15, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_18;
  }
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = IMDAreAllAliasesUnknown();

  if (v7)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not processing possible availability reply for sender who is not a contact", v15, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v11 = -[IMDAvailabilityAutoReplier _userIsAvailableToHandle:](self, "_userIsAvailableToHandle:", v4);
  v12 = v11;
  if (v11 && IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Not processing possible availability reply, DND framework says we should appear available to this user", v15, 2u);
    }

  }
  v10 = !v12;
LABEL_18:

  return v10;
}

- (id)_messageItemsSupportingAvailabilityReplyFromItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isAvailabilityReplySupported", (_QWORD)v19);
        if ((_DWORD)v10)
        {
          objc_msgSend(v4, "addObject:", v9);
        }
        else if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Message item does not support availability reply", buf, 2u);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v5, "count");
  v13 = objc_msgSend(v4, "count");
  if (v12 != v13 && IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v5, "count");
      v16 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134218240;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Reducing messages to process for availability reply from %ld messages to %ld messages.", buf, 0x16u);
    }

  }
  v17 = (void *)objc_msgSend(v4, "copy", (_QWORD)v19);

  return v17;
}

- (void)_sendDeliveredQuietelyForMessages:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMDAvailabilityAutoReplier _isSMSChat:](self, "_isSMSChat:", v10);
  if (v11)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Not sending delivered quietely receipts in SMS chat", buf, 2u);
      }

    }
    -[IMDAvailabilityAutoReplier _sendTextAutoReplyIfNecessaryForMessages:withUrgentBreakthroughInstructions:inChat:](self, "_sendTextAutoReplyIfNecessaryForMessages:withUrgentBreakthroughInstructions:inChat:", v8, 1, v10);
  }
  else
  {
    -[IMDAvailabilityAutoReplier _messageGuidsForMessages:](self, "_messageGuidsForMessages:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Requesting delivered quietely receipt be sent to message guids: %@", buf, 0xCu);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D14CF168;
    v16[3] = &unk_1E922B860;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v8;
    v18 = v10;
    objc_msgSend(WeakRetained, "autoReplier:sendDeliveredQuietlyReceiptForMessages:forIncomingMessageFromIDSID:inChat:withWillSendToDestinationsHandler:", self, v17, v9, v18, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_sendTextAutoReplyIfNecessaryForMessages:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4 inChat:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[IMDAvailabilityAutoReplier _shouldSendTextAutoReplyForChat:](self, "_shouldSendTextAutoReplyForChat:", v9);
  v11 = v10;
  v12 = IMOSLoggingEnabled(v10);
  if (v11)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Sending text auto reply to chat: %@", (uint8_t *)&v17, 0xCu);

      }
    }
    -[IMDAvailabilityAutoReplier _sendTextAutoReplyToChat:withUrgentBreakthroughInstructions:](self, "_sendTextAutoReplyToChat:withUrgentBreakthroughInstructions:", v9, v6);
  }
  else if (v12)
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Not sending text auto reply to chat: %@", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (BOOL)_deviceIsPhone
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)_deviceSupportsiMessageAutoReply
{
  _BOOL8 v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = -[IMDAvailabilityAutoReplier _deviceIsPhone](self, "_deviceIsPhone");
  v3 = v2;
  if (!v2 && IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Device does not support iMessage auto reply becuase it is not an iPhone", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)_localDeviceHasSIMMatchingChat:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceSupportsMultipleSubscriptions");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ctServiceSubscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "lastAddressedSIMID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "labelID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length") && objc_msgSend(v8, "isEqualToString:", v13))
            {

              LOBYTE(v10) = 1;
              goto LABEL_24;
            }

          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v10)
            continue;
          break;
        }
      }
    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1D1668F6C(v9, v18, v19);
      LOBYTE(v10) = 0;
    }
LABEL_24:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsSMS");

    if ((v15 & 1) != 0)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Device does not support SMS auto reply becuase it does not support SMS", v21, 2u);
        }

      }
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)_deviceSupportsSMSAutoReplyForChat:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;

  v4 = a3;
  v5 = -[IMDAvailabilityAutoReplier _deviceIsPhone](self, "_deviceIsPhone");
  if (!v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 0;
        v9 = "SMS auto reply not supported becuase device is not an iPhone";
        v10 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      }
LABEL_11:

    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  v6 = -[IMDAvailabilityAutoReplier _localDeviceHasSIMMatchingChat:](self, "_localDeviceHasSIMMatchingChat:", v4);
  if (!v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v12 = 0;
        v9 = "SMS auto reply not supported becuase local device does not have a SIM matching the last addressed SIM ID";
        v10 = (uint8_t *)&v12;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_isInDrivingFocus
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)MEMORY[0x1D17EA3EC](CFSTR("DNDStateService"), CFSTR("DoNotDisturb")), "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v2, "queryCurrentStateWithError:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (!v4)
  {
    if (!v3)
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1D1668FA4(v5, v14, v15);
      goto LABEL_4;
    }
    objc_msgSend(v3, "activeModeConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v8)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "DND active mode configuraiton is nil", buf, 2u);
        }

      }
      goto LABEL_4;
    }
    -[NSObject mode](v8, "mode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "semanticType");
      v12 = IMOSLoggingEnabled(v11);
      if (v11 == 2)
      {
        if (v12)
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Driving focus is active", buf, 2u);
          }

        }
        v6 = 1;
        goto LABEL_30;
      }
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v21 = v11;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Driving focus is not active, current focus semantic type is %ld", buf, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "DND mode is nil", buf, 2u);
      }

    }
    v6 = 0;
LABEL_30:

    goto LABEL_5;
  }
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1D1668FDC();
LABEL_4:
  v6 = 0;
LABEL_5:

  return v6;
}

- (BOOL)_haveRecentlySentUnavailabilityAutoReplyMessageToChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D14CFBE8;
  v9[3] = &unk_1E922B888;
  v7 = v6;
  v10 = v7;
  v11 = &v13;
  v12 = 500;
  -[IMDAvailabilityAutoReplier iterateRecentMessagesInChat:withBlock:](self, "iterateRecentMessagesInChat:withBlock:", v4, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (id)_messageItemsSupportingBreakthroughNotifications:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = -[IMDAvailabilityAutoReplier _messageItemSupportsBreakthroughNotification:](self, "_messageItemSupportsBreakthroughNotification:", v10, (_QWORD)v20);
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v10);
        }
        else if (IMOSLoggingEnabled(v11))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Message item does not support breakthrough notification", buf, 2u);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v6, "count");
  v14 = objc_msgSend(v5, "count");
  if (v13 != v14 && IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v6, "count");
      v17 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218240;
      v25 = v16;
      v26 = 2048;
      v27 = v17;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Reducing messages to process for breakthrough notifications from %ld messages to %ld messages.", buf, 0x16u);
    }

  }
  v18 = (void *)objc_msgSend(v5, "copy", (_QWORD)v20);

  return v18;
}

- (BOOL)_messageItemSupportsBreakthroughNotification:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "isFromMe");
  if ((_DWORD)v4)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v22 = 0;
        v6 = "Not processing possible dnd breakthrough for message from me";
        v7 = (uint8_t *)&v22;
LABEL_29:
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else
  {
    v8 = objc_msgSend(v3, "isEmpty");
    if ((_DWORD)v8)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v21 = 0;
          v6 = "Not processing possible dnd breakthrough for empty message";
          v7 = (uint8_t *)&v21;
          goto LABEL_29;
        }
LABEL_30:

      }
    }
    else
    {
      v9 = objc_msgSend(v3, "isTypingMessage");
      if ((_DWORD)v9)
      {
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            v20 = 0;
            v6 = "Not processing possible dnd breakthrough for typing message";
            v7 = (uint8_t *)&v20;
            goto LABEL_29;
          }
          goto LABEL_30;
        }
      }
      else
      {
        v10 = objc_msgSend(v3, "isLocatingMessage");
        if ((_DWORD)v10)
        {
          if (IMOSLoggingEnabled(v10))
          {
            OSLogHandleForIMFoundationCategory();
            v5 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
            {
              v19 = 0;
              v6 = "Not processing possible dnd breakthrough for locating message";
              v7 = (uint8_t *)&v19;
              goto LABEL_29;
            }
            goto LABEL_30;
          }
        }
        else
        {
          v11 = objc_msgSend(v3, "isAutoReply");
          if ((_DWORD)v11)
          {
            if (IMOSLoggingEnabled(v11))
            {
              OSLogHandleForIMFoundationCategory();
              v5 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
              {
                v18 = 0;
                v6 = "Not processing possible dnd breakthrough for auto reply message";
                v7 = (uint8_t *)&v18;
                goto LABEL_29;
              }
              goto LABEL_30;
            }
          }
          else
          {
            v12 = objc_msgSend(v3, "isUnfinished");
            if ((_DWORD)v12)
            {
              if (IMOSLoggingEnabled(v12))
              {
                OSLogHandleForIMFoundationCategory();
                v5 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
                {
                  v17 = 0;
                  v6 = "Not processing possible dnd breakthrough for unfinished message";
                  v7 = (uint8_t *)&v17;
                  goto LABEL_29;
                }
                goto LABEL_30;
              }
            }
            else
            {
              v13 = objc_msgSend(v3, "isSystemMessage");
              if (!(_DWORD)v13)
              {
                v14 = 1;
                goto LABEL_32;
              }
              if (IMOSLoggingEnabled(v13))
              {
                OSLogHandleForIMFoundationCategory();
                v5 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
                {
                  v16 = 0;
                  v6 = "Not processing possible dnd breakthrough for system message";
                  v7 = (uint8_t *)&v16;
                  goto LABEL_29;
                }
                goto LABEL_30;
              }
            }
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_32:

  return v14;
}

- (id)_messageGuidsForMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "guid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)_shouldIgnoreDoNotDisturbForMessages:(id)a3 inChat:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL4 v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  id v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_27:
    v22 = 0;
    goto LABEL_38;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v8)
    goto LABEL_14;
  v9 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isFromMe") & 1) == 0)
      {
        v12 = objc_msgSend(v11, "didNotifyRecipient");
        if ((_DWORD)v12)
        {
          if (!IMOSLoggingEnabled(v12))
            goto LABEL_36;
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message is flagged to notify recipient, should ignore do not disturb", buf, 2u);
          }
          goto LABEL_35;
        }
      }
      v13 = objc_msgSend(v11, "hasLegacyUrgentTriggerMatchInText");
      if ((_DWORD)v13)
      {
        if (!IMOSLoggingEnabled(v13))
          goto LABEL_36;
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message has a legacy urgent trigger text, should ignore do not disturb", buf, 2u);
        }
LABEL_35:

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSOSAlertingEnabled");

      if ((v15 & 1) == 0)
      {
        v16 = -[IMDAvailabilityAutoReplier _messageIsSOS:](self, "_messageIsSOS:", v11);
        if (v16)
        {
          if (!IMOSLoggingEnabled(v16))
            goto LABEL_36;
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message is SOS, should ignore do not disturb", buf, 2u);
          }
          goto LABEL_35;
        }
      }
    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
      continue;
    break;
  }
LABEL_14:

  v17 = -[IMDAvailabilityAutoReplier _haveRecentUrgentMessageInGracePeriodForChat:](self, "_haveRecentUrgentMessageInGracePeriodForChat:", v24);
  v18 = v17;
  v19 = IMOSLoggingEnabled(v17);
  if (!v18)
  {
    if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Messages are not urgent, will not break though do not disturb", buf, 2u);
      }

    }
    goto LABEL_27;
  }
  if (v19)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Message received in chat that is in an urgent message grace period, should ignore do not disturb", buf, 2u);
    }
LABEL_36:

  }
  v22 = 1;
LABEL_38:

  return v22;
}

- (BOOL)_haveRecentUrgentMessageInGracePeriodForChat:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1D14D0BC4;
  v11[4] = sub_1D14D0BD4;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -480.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = 8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Determining if we should alert for this message by checking if we are in an urgent message grace period. Looking for received urgent messages in the last %ld minutes.", buf, 0xCu);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D14D0BDC;
  v10[3] = &unk_1E922B8B0;
  v10[4] = v11;
  v10[5] = &v13;
  v10[6] = 0x407E000000000000;
  -[IMDAvailabilityAutoReplier iterateRecentMessagesInChat:withBlock:](self, "iterateRecentMessagesInChat:withBlock:", v4, v10);
  v8 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)iterateRecentMessagesInChat:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void (**block)(void);
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[3];
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t v37;
  _BYTE v38[7];
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD aBlock[4];
  id v54;
  id v55;
  __int128 *p_buf;
  uint64_t v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  void *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "style");
  if ((_DWORD)v7 == 45)
  {
    objc_msgSend(v5, "chatIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceName");
    v8 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v8;
    if (v20 && v8)
    {
      v64[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v59 = 0x3032000000;
      v60 = sub_1D14D0BC4;
      v61 = sub_1D14D0BD4;
      v11 = MEMORY[0x1E0C809B0];
      v62 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D14D15EC;
      aBlock[3] = &unk_1E922B8D8;
      p_buf = &buf;
      v21 = v9;
      v54 = v21;
      v22 = v10;
      v55 = v22;
      v57 = 5;
      block = (void (**)(void))_Block_copy(aBlock);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        block[2]();
      else
        dispatch_sync(MEMORY[0x1E0C80D38], block);
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = sub_1D14D0BC4;
      v47 = sub_1D14D0BD4;
      v48 = 0;
      do
      {
        v14 = (void *)v44[5];
        v44[5] = 0;

        v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v39[0] = v11;
        v39[1] = 3221225472;
        v39[2] = sub_1D14D164C;
        v39[3] = &unk_1E922B900;
        v40 = v6;
        v41 = &v49;
        v42 = &v43;
        objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, v39);
        if (objc_msgSend((id)v44[5], "length"))
        {
          if (!*((_BYTE *)v50 + 24))
          {
            v33 = 0;
            v34 = &v33;
            v35 = 0x2020000000;
            v36 = 1;
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            v32 = 1;
            v23[0] = v11;
            v23[1] = 3221225472;
            v23[2] = sub_1D14D1704;
            v23[3] = &unk_1E922B928;
            v26 = &buf;
            v24 = v21;
            v25 = v22;
            v27 = &v43;
            v28 = &v33;
            v29 = v31;
            v30 = 10;
            v16 = (void (**)(_QWORD))_Block_copy(v23);
            if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
              v16[2](v16);
            else
              dispatch_sync(MEMORY[0x1E0C80D38], v16);
            if (!*((_BYTE *)v34 + 24) || !objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
              *((_BYTE *)v50 + 24) = 1;

            _Block_object_dispose(v31, 8);
            _Block_object_dispose(&v33, 8);
          }
        }
        else
        {
          IMLogHandleForCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_1D166903C(&v37, v38, v17);

          *((_BYTE *)v50 + 24) = 1;
        }

      }
      while (!*((_BYTE *)v50 + 24));
      _Block_object_dispose(&v43, 8);

      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&buf, 8);

    }
    else if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Chat is missing identifier or service: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Not checking grace period for non 1-1 chat", (uint8_t *)&buf, 2u);
    }

  }
}

- (BOOL)_isSMSChat:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  return v4;
}

- (id)_autoReplyMessageTextWithUrgentBreakthroughInstructions:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMDAvailabilityAutoReplier _customizedAutoReplyMessage](self, "_customizedAutoReplyMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, 0);
    objc_msgSend(v5, "addObject:", v9);

  }
  if (v3)
  {
    IMDaemonCoreBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("(I’m not receiving notifications. If this is urgent, reply “urgent” to send a notification through with your original message.)"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, 0);
    objc_msgSend(v5, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (void)_sendTextAutoReplyToChat:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDAvailabilityAutoReplier _autoReplyMessageTextWithUrgentBreakthroughInstructions:](self, "_autoReplyMessageTextWithUrgentBreakthroughInstructions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = IMOSLoggingEnabled(v8);
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v7, "count");
        objc_msgSend(v6, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Sending %ld auto-reply messages to chat: %@", buf, 0x16u);

      }
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
          WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
          objc_msgSend(WeakRetained, "autoReplier:generatedAutoReplyText:forChat:", self, v17, v6, (_QWORD)v20);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  else if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "No sending auto-reply because no message text was available to send", buf, 2u);
    }

  }
}

- (BOOL)_shouldSendTextAutoReplyForChat:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  NSObject *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  unint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDAvailabilityAutoReplier _isInDrivingFocus](self, "_isInDrivingFocus");
  if (!v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Device is not in driving focus, not sending text auto reply", (uint8_t *)&v15, 2u);
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (-[IMDAvailabilityAutoReplier _isSMSChat:](self, "_isSMSChat:", v4))
  {
    v6 = -[IMDAvailabilityAutoReplier _deviceSupportsSMSAutoReplyForChat:](self, "_deviceSupportsSMSAutoReplyForChat:", v4);
    if (!v6)
      goto LABEL_4;
  }
  else
  {
    v6 = -[IMDAvailabilityAutoReplier _deviceSupportsiMessageAutoReply](self, "_deviceSupportsiMessageAutoReply");
    if (!v6)
    {
LABEL_4:
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This device does not support text auto reply", (uint8_t *)&v15, 2u);
        }
LABEL_17:

        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  v8 = -[IMDAvailabilityAutoReplier _haveRecentlySentUnavailabilityAutoReplyMessageToChat:](self, "_haveRecentlySentUnavailabilityAutoReplyMessageToChat:", v4);
  if (!v8)
  {
    v11 = -[IMDAvailabilityAutoReplier _autoReplyAudience](self, "_autoReplyAudience");
    -[IMDAvailabilityAutoReplier _stringForAutoReplyAudience:](self, "_stringForAutoReplyAudience:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IMDAvailabilityAutoReplier _audience:allowsRepliesToChat:](self, "_audience:allowsRepliesToChat:", v11, v4);
    v13 = IMOSLoggingEnabled(v9);
    if (v9)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = 134218242;
          v16 = v11;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Auto reply audience preference matches this chat. Audience %ld=%@", (uint8_t *)&v15, 0x16u);
        }
LABEL_28:

      }
    }
    else if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218242;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not sending auto reply becuase the user auto reply audience preference does not match this chat. Audience %ld=%@", (uint8_t *)&v15, 0x16u);
      }
      goto LABEL_28;
    }

    goto LABEL_19;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "We have already sent a recent text auto reply, not auto-replying again.", (uint8_t *)&v15, 2u);
    }
    goto LABEL_17;
  }
LABEL_18:
  LOBYTE(v9) = 0;
LABEL_19:

  return v9;
}

- (id)_stringForAutoReplyAudience:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E922B998[a3];
}

- (unint64_t)_autoReplyAudience
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[IMDAvailabilityAutoReplier automaticDNDStatus](self, "automaticDNDStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1D14D204C;
  v14 = &unk_1E922B950;
  v16 = &v17;
  v5 = v3;
  v15 = v5;
  objc_msgSend(v4, "allowedAutoReplyAudience:", &v11);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[IMDAvailabilityAutoReplier _stringForAutoReplyAudience:](self, "_stringForAutoReplyAudience:", v18[3], v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v18[3];
      *(_DWORD *)buf = 134218242;
      v22 = v8;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Auto-reply audience is %ld=%@", buf, 0x16u);
    }

  }
  v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)_customizedAutoReplyMessage
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  _BOOL8 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1D14D0BC4;
  v21 = sub_1D14D0BD4;
  v22 = 0;
  -[IMDAvailabilityAutoReplier automaticDNDStatus](self, "automaticDNDStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1D14D22CC;
  v14 = &unk_1E922B978;
  v16 = &v17;
  v5 = v3;
  v15 = v5;
  objc_msgSend(v4, "autoReplyMessageWithReply:", &v11);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v18[5], "stringByRemovingWhitespace", v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");

  v7 = objc_msgSend((id)v18[5], "length");
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v7 != 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Is using customized auto reply message: %ld", buf, 0xCu);
    }

  }
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)_audience:(unint64_t)a3 allowsRepliesToChat:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL8 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "participants", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

  switch(a3)
  {
    case 2uLL:
      v13 = -[IMDAvailabilityAutoReplier _contactsContainsParticipants:](self, "_contactsContainsParticipants:", v7);
      goto LABEL_14;
    case 3uLL:
      v13 = -[IMDAvailabilityAutoReplier _hasRecentOutgoingMessagesInChat:](self, "_hasRecentOutgoingMessagesInChat:", v6);
      goto LABEL_14;
    case 4uLL:
      v13 = -[IMDAvailabilityAutoReplier _favoritesContainsParticipants:](self, "_favoritesContainsParticipants:", v7);
LABEL_14:
      v14 = v13;
      goto LABEL_16;
  }
  v14 = 0;
LABEL_16:
  -[IMDAvailabilityAutoReplier _stringForAutoReplyAudience:](self, "_stringForAutoReplyAudience:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v23 = a3;
      v24 = 2112;
      v25 = v15;
      v26 = 2048;
      v27 = v14;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Audience %ld=%@ allows replies: %ld", buf, 0x20u);
    }

  }
  return v14;
}

- (BOOL)_contactsContainsParticipants:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v20 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1, (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = IMDAreAllAliasesUnknown();

        if (v9)
        {
          if (IMOSLoggingEnabled(v10))
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v7;
              _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Participant %@ is not in contacts", buf, 0xCu);
            }

          }
          v11 = 0;
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)_favoritesContainsParticipants:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v22;
    v7 = *MEMORY[0x1E0D35C18];
    *(_QWORD *)&v5 = 138412546;
    v20 = v5;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v29 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1, v20, (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IMDCNRecordIDForAliases();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKey:", v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (!v12 || (v12 = objc_msgSend((id)v12, "isEqualToString:", v7), (v12 & 1) != 0))
        {
          if (IMOSLoggingEnabled(v12))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v9;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Participant %@ is not a contact, and cannot be a favorite", buf, 0xCu);
            }

          }
LABEL_21:

          v17 = 0;
          goto LABEL_23;
        }
        v14 = IMDIsFavoritedContact();
        v15 = v14;
        if (IMOSLoggingEnabled(v14))
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v26 = v9;
            v27 = 2048;
            v28 = v15;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Participant %@ is a favorite?: %ld", buf, 0x16u);
          }

          if ((v15 & 1) == 0)
            goto LABEL_21;
        }
        else if (!v15)
        {
          goto LABEL_21;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      v17 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_23:

  return v17;
}

- (BOOL)_hasRecentOutgoingMessagesInChat:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastSentMessageDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject isDateInToday:](v5, "isDateInToday:", v4);
    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v6 = -[NSObject isDateInYesterday:](v5, "isDateInYesterday:", v4);
      v7 = v6;
    }
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "chatIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v9;
        v13 = 1024;
        v14 = v7;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "chatID %@ is recent?: %i", (uint8_t *)&v11, 0x12u);

      }
    }
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1669130(v3, v5);
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_messageIsSOS:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (-[IMDAvailabilityAutoReplier _sosTransportValidForMessage:](self, "_sosTransportValidForMessage:", v4))
  {
    objc_msgSend(v4, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(self) = -[IMDAvailabilityAutoReplier _sosURLMatchInText:](self, "_sosURLMatchInText:", v6);
    if ((_DWORD)self)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Message is SOS", v10, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      self = (IMDAvailabilityAutoReplier *)objc_claimAutoreleasedReturnValue();
      -[IMDAvailabilityAutoReplier trackEvent:](self, "trackEvent:", *MEMORY[0x1E0D38820]);

      LOBYTE(self) = 1;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_sosTransportValidForMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  if ((v4 & 1) != 0)
    return 1;
  else
    return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)_sosURLMatchInText:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "im_matchesSOSMapURL");
  v5 = v4;
  if ((_DWORD)v4 && IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Message has an SOS URL match", v8, 2u);
    }

  }
  return v5;
}

- (IMDAutoReplyDelegate)replyDelegate
{
  return (IMDAutoReplyDelegate *)objc_loadWeakRetained((id *)&self->_replyDelegate);
}

- (void)setReplyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_replyDelegate, a3);
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (CARAutomaticDNDStatus)automaticDNDStatus
{
  return self->_automaticDNDStatus;
}

- (void)setAutomaticDNDStatus:(id)a3
{
  objc_storeStrong((id *)&self->_automaticDNDStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_destroyWeak((id *)&self->_replyDelegate);
}

@end
