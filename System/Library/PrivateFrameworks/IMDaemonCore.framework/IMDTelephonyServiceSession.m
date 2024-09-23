@implementation IMDTelephonyServiceSession

+ (id)getPlainTextForMessage:(id)a3 processedMessageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "createCompatibleBodyForMessage:processedMessageItem:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "createFallbackTextForMessage:processedMessageItem:leadingFallbackText:trailingFallbackText:", v7, v6, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createCompatibleBodyForMessage:(id)a3 processedMessageItem:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD aBlock[4];
  id v14;

  objc_msgSend(a3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D1484B10;
  aBlock[3] = &unk_1E9228C20;
  v14 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);
  v12 = 0;
  objc_msgSend(v4, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:replacementTextProvider:removedTransferGUIDsOut:", v7, &unk_1E9229F20, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D362F8], &stru_1E92346B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)createFallbackTextForMessage:(id)a3 processedMessageItem:(id)a4 leadingFallbackText:(id)a5 trailingFallbackText:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "expressiveSendStyleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Appending expressive send style id for message %@", buf, 0xCu);

      }
    }
    objc_msgSend(v9, "_localizedBackwardsCompatibleExpressiveSendText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v12, "appendFormat:", CFSTR("\n%@"), v18);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isPriusCompatibilityEnabled");

  if (v20)
  {
    objc_msgSend(v10, "threadIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length") == 0;

    if (!v22)
    {
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Formatting plain text reply message for message %@", buf, 0xCu);

        }
      }
      IMSharedUtilitiesFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("REPLIED_BACKWARD_COMPATIBILITY"), &stru_1E92346B0, CFSTR("IMSharedUtilities"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("%@\n"), v27);

    }
  }

}

- (IMDTelephonyServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMDTelephonyServiceSession *v11;
  IMDTelephonyServiceSession *v12;
  NSObject *v13;
  IMDRelayAttachmentController *v14;
  uint8_t v16[16];
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMDTelephonyServiceSession;
  v11 = -[IMDServiceSession initWithAccount:service:replicatingForSession:](&v17, sel_initWithAccount_service_replicatingForSession_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Setting up base telephony service", v16, 2u);
      }

    }
    v14 = -[IMDRelayAttachmentController initWithSession:]([IMDRelayAttachmentController alloc], "initWithSession:", v12);
    -[IMDTelephonyServiceSession setAttachmentController:](v12, "setAttachmentController:", v14);

    -[IMDTelephonyServiceSession _updatePhoneNumberCallerID](v12, "_updatePhoneNumberCallerID");
    -[IMDTelephonyServiceSession _setupCoreTelephonyObservation](v12, "_setupCoreTelephonyObservation");
  }

  return v12;
}

- (IMDPlainTextTapbackInterpreter)tapbackInterpreter
{
  IMDPlainTextTapbackInterpreter *tapbackInterpreter;
  IMDPlainTextTapbackInterpreter *v4;
  IMDPlainTextTapbackInterpreter *v5;

  tapbackInterpreter = self->_tapbackInterpreter;
  if (!tapbackInterpreter)
  {
    v4 = objc_alloc_init(IMDPlainTextTapbackInterpreter);
    v5 = self->_tapbackInterpreter;
    self->_tapbackInterpreter = v4;

    tapbackInterpreter = self->_tapbackInterpreter;
  }
  return tapbackInterpreter;
}

- (IMDFilteringController)filteringController
{
  return +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
}

- (void)_updatePhoneNumberCallerID
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Updating", (uint8_t *)&v20, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Default phone number from telephony is: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  if (!v6)
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dominentPhoneNumberAlias");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v10, "copy");

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v6;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "No phone number from telephony, adopting relay phone number %@", (uint8_t *)&v20, 0xCu);
      }

    }
    if (!v6)
      v6 = (void *)objc_msgSend(&stru_1E92346B0, "copy");
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Updating SMS service with number: %@", (uint8_t *)&v20, 0xCu);
  }

  -[IMDServiceSession account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D80];
  IMGenerateLoginID();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0D36F00]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeAccountDefaults:", v17);

  -[IMDServiceSession account](self, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0D36ED0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "writeAccountDefaults:", v19);

}

- (id)_callerIDUsingFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("device:")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "_stripFZIDPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Stripping FZIDPrefix, after: %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }

  return v4;
}

- (void)loginServiceSessionWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  IMDTelephonyServiceSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMDServiceSession refreshServiceCapabilities](self, "refreshServiceCapabilities");
  if (IMOSLoggingEnabled(-[IMDServiceSession serviceSessionDidLoginWithAccount:](self, "serviceSessionDidLoginWithAccount:", v4)))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "%@: Log in.", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  IMDTelephonyServiceSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  if (objc_msgSend(v4, "loginStatus") != 2)
  {
    objc_msgSend(v4, "setLoginStatus:message:", 0, 0);
    if (IMOSLoggingEnabled(-[IMDServiceSession serviceSessionDidLogoutWithAccount:](self, "serviceSessionDidLogoutWithAccount:", v4)))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = self;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "%@: Logging out.", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

- (id)compatibleMessageToSendForMessageItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t isKindOfClass;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "balloonBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (!v6)
  {
    v24 = v3;
LABEL_24:
    v24 = v24;
    v3 = v24;
    goto LABEL_25;
  }
  IMExtensionPayloadUnarchivingClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v3, "payloadData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v10 = (void *)objc_msgSend(v8, "initForReadingFromData:error:", v9, &v33);
  v11 = v33;

  objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  isKindOfClass = objc_claimAutoreleasedReturnValue();
  v13 = (void *)isKindOfClass;
  if (v11)
  {
    isKindOfClass = IMOSLoggingEnabled(isKindOfClass);
    if ((_DWORD)isKindOfClass)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v11;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Failed to unarchive attributionInfo. Error: %@", buf, 0xCu);
      }

    }
  }
  if (v13 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D37E10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("messageText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (!v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v15, "objectForKey:", CFSTR("messageText"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

      if (v20)
      {
        v31 = objc_alloc(MEMORY[0x1E0D39918]);
        objc_msgSend(v3, "sender");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "time");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v3, "flags");
        objc_msgSend(v3, "guid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v31, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v32, v21, v20, 0, 0, v22, 0, v23, 0);

        if (IMOSLoggingEnabled(v25))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v24, "guid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v27;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Sending activity sharing fallback for message %@", buf, 0xCu);

          }
        }
        v28 = 0;
        goto LABEL_23;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  if (IMOSLoggingEnabled(isKindOfClass))
  {
    OSLogHandleForIMEventCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Activity sharing payload doesn't have message text to send. Bailing", buf, 2u);
    }

  }
  v24 = v3;
  v20 = 0;
  v28 = 1;
LABEL_23:

  if ((v28 & 1) == 0)
    goto LABEL_24;
LABEL_25:

  return v3;
}

- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "chatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[IMDTelephonyServiceSession _newFeatureRequiredByMessageItem:chatIdentifier:](self, "_newFeatureRequiredByMessageItem:chatIdentifier:", v6, v8);

  if ((_DWORD)self)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMEventCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, " ** New Feature, and backwards compat is not enabled for message %@", (uint8_t *)&v21, 0xCu);

      }
    }
    objc_msgSend(v6, "setErrorCode:", 5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isScheduledMessagesCoreEnabled");

    if (!v14 || (v15 = objc_msgSend(v6, "scheduleType"), (unint64_t)(v15 - 1) > 1))
    {
      v12 = 1;
      goto LABEL_16;
    }
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Received attempt to send a scheduled message through the telephony service session, message guid: %@", (uint8_t *)&v21, 0xCu);

      }
    }
    objc_msgSend(v6, "setErrorCode:", 5);
    objc_msgSend(v6, "setScheduleState:", 4);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.messages.TelephonyServiceSessionSendFailure"), 5, 0);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Invalid scheduled message send"), v18);

  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)_newFeatureRequiredByMessageItem:(id)a3 chatIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  BOOL v24;
  void *v25;
  void *v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "associatedMessageType");
  if (v7 != 2006 && v7 != 3006)
  {
    v8 = objc_msgSend(v5, "associatedMessageType");
    if (v8 != 3007 && v8 != 2007)
      goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("backwards-compat-enabled-etap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInternalInstall");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayForKey:", CFSTR("chat-id-allow-list"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "containsObject:", v6);
    if ((_DWORD)v15)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v6;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Ignoring backwards compat check and allowing sending message to %@", buf, 0xCu);
        }

      }
      goto LABEL_25;
    }

  }
  v17 = objc_msgSend(v10, "BOOLValue");

  if (v17)
  {
LABEL_14:
    objc_msgSend(v5, "fileTransferGUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v18;
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
LABEL_16:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v9);
        objc_msgSend(v10, "transferForGUID:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21), (_QWORD)v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isAdaptiveImageGlyph");

        if ((v23 & 1) != 0)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v19)
            goto LABEL_16;
          goto LABEL_22;
        }
      }

      objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("backwards-compat-enabled-adaptive-image-glyphs"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      if ((v27 & 1) != 0)
        goto LABEL_25;
      v24 = 1;
      goto LABEL_27;
    }
LABEL_22:

LABEL_25:
    v24 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v24 = 1;
LABEL_28:

  return v24;
}

- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  return 0;
}

- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDTelephonyServiceSession;
  -[IMDServiceSession chatForChatIdentifier:style:](&v6, sel_chatForChatIdentifier_style_, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_markMessageAsSent:(id)a3
{
  NSMutableSet *originatedMessages;
  id v5;

  originatedMessages = self->_originatedMessages;
  v5 = a3;
  if (-[NSMutableSet containsObject:](originatedMessages, "containsObject:"))
  {
    -[IMDTelephonyServiceSession _clearTimoutTimerForRelayMessageID:](self, "_clearTimoutTimerForRelayMessageID:", v5);
    -[IMDServiceSession notifyDidSendMessageID:shouldNotify:](self, "notifyDidSendMessageID:shouldNotify:", v5, 1);
    -[IMDTelephonyServiceSession _removeOriginatedMessage:](self, "_removeOriginatedMessage:", v5);
  }
  else
  {
    -[IMDServiceSession notifyDidSendMessageID:shouldNotify:](self, "notifyDidSendMessageID:shouldNotify:", v5, 0);
    -[IMDTelephonyServiceSession _clearTimoutTimerForRelayMessageID:](self, "_clearTimoutTimerForRelayMessageID:", v5);
  }

}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6
{
  -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:", a3, a4, a5, a6, 0);
}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 iMessageCapability:(int64_t)a7
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t HasMultipleSubscriptions;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  id v54;
  id obj;
  int64_t v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  _BYTE v66[28];
  _BYTE v67[128];
  uint64_t v68;

  v10 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "length") || objc_msgSend(v12, "length"))
  {
    v56 = a7;
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allExistingSupportedServiceChatsWithIdentifier:style:", v54, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v64 = v54;
        v65 = 1024;
        *(_DWORD *)v66 = v10;
        *(_WORD *)&v66[4] = 2112;
        *(_QWORD *)&v66[6] = v11;
        *(_WORD *)&v66[14] = 2112;
        *(_QWORD *)&v66[16] = v12;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have their last addressed handle updated to %@ or their last addressed sim id updated to %@", buf, 0x26u);
      }

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v14;
    v17 = 0;
    v18 = 0;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v19)
    {
      v57 = 0;
      v58 = *(_QWORD *)v60;
      while (1)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v60 != v58)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v21, "chatIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length") == 0;

          if (!v23)
          {
            if (objc_msgSend(v12, "length"))
            {
              objc_msgSend(v21, "lastAddressedSIMID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", v12);

              v26 = v25 ^ 1;
            }
            else
            {
              v26 = 0;
            }
            objc_msgSend(v21, "lastAddressedLocalHandle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = MEMORY[0x1D17EA560](v27, v11);

            if ((v28 & 1) == 0)
            {
              v29 = objc_msgSend(v11, "length");
              if (v29
                || (objc_msgSend(v21, "serviceName"),
                    v30 = (void *)objc_claimAutoreleasedReturnValue(),
                    v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D38F68]),
                    v30,
                    !v31))
              {
                v17 = 1;
              }
              else
              {
                v29 = IMOSLoggingEnabled(v29);
                if ((_DWORD)v29)
                {
                  OSLogHandleForIMFoundationCategory();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Last address handle is nil, not updating iMessage to nil last addressed handle", buf, 2u);
                  }

                }
              }
            }
            v18 |= v26;
            if ((v18 & v17 & 1) != 0)
            {
              if (IMOSLoggingEnabled(v29))
              {
                OSLogHandleForIMFoundationCategory();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v21, "guid");
                  v34 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "lastAddressedLocalHandle");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v64 = v34;
                  v65 = 2112;
                  *(_QWORD *)v66 = v11;
                  *(_WORD *)&v66[8] = 2112;
                  *(_QWORD *)&v66[10] = v35;
                  *(_WORD *)&v66[18] = 2112;
                  *(_QWORD *)&v66[20] = v12;
                  _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "  ** Updating both caller ID for chat with guid %@ to be: %@ from %@ and sim ID to be: %@", buf, 0x2Au);

                }
              }
              objc_msgSend(v21, "updateLastAddressedHandle:forceUpdateHandle:lastAddressedSIMID:", v11, 0, v12);
            }
            else if ((v18 & 1) != 0)
            {
              if (IMOSLoggingEnabled(v29))
              {
                OSLogHandleForIMFoundationCategory();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v21, "guid");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v64 = v37;
                  v65 = 2112;
                  *(_QWORD *)v66 = v12;
                  _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "  ** Updating sim ID for chat with guid %@ to be: %@", buf, 0x16u);

                }
              }
              objc_msgSend(v21, "updateLastAddressedSIMID:", v12);
            }
            else if ((v17 & 1) != 0)
            {
              if (IMOSLoggingEnabled(v29))
              {
                OSLogHandleForIMFoundationCategory();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v21, "guid");
                  v39 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "lastAddressedLocalHandle");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v64 = v39;
                  v65 = 2112;
                  *(_QWORD *)v66 = v11;
                  *(_WORD *)&v66[8] = 2112;
                  *(_QWORD *)&v66[10] = v40;
                  _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "  ** Updating caller ID for chat with guid %@ to be: %@ from %@", buf, 0x20u);

                }
              }
              objc_msgSend(v21, "updateLastAddressedHandle:", v11);
            }
            objc_msgSend(v21, "serviceName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D38F58]);

            if (v42)
            {
              v44 = v21;

              v57 = v44;
            }
            if (v56 == 2)
            {
              if (IMOSLoggingEnabled(v43))
              {
                OSLogHandleForIMFoundationCategory();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v21, "guid");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v64 = v49;
                  _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = YES", buf, 0xCu);

                }
              }
              v47 = 1;
            }
            else
            {
              if (v56 != 1)
                continue;
              if (IMOSLoggingEnabled(v43))
              {
                OSLogHandleForIMFoundationCategory();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v21, "guid");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v64 = v46;
                  _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = NO", buf, 0xCu);

                }
              }
              v47 = 0;
            }
            objc_msgSend(v21, "updateShouldForceToSMS:", v47);
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        if (!v19)
          goto LABEL_61;
      }
    }
    v57 = 0;
LABEL_61:

    HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
    if (!(v17 & 1 | ((HasMultipleSubscriptions & v18 & 1) == 0)) && v57)
    {
      if (IMOSLoggingEnabled(HasMultipleSubscriptions))
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v57, "guid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v64 = v52;
          v65 = 2112;
          *(_QWORD *)v66 = v12;
          _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "Updated simID on chat %@ to %@ but phoneNumber is nil so force updating IMChat to have nil lastAddressedHandle", buf, 0x16u);

        }
      }
      objc_msgSend(v57, "updateLastAddressedHandle:forceUpdate:", 0, 1);
    }

  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v54;
      v65 = 1024;
      *(_DWORD *)v66 = v10;
      _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Not updating chats with identifier %@ and style %hhu as both last addressed handle and last addressed sim id are nil", buf, 0x12u);
    }

  }
}

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v35;
  id v36;
  void *v37;
  id obj;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v35 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v40 = a6;
  v36 = a7;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  objc_msgSend(v12, "existingChatWithGUID:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v40, "service");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "internalName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D399B8], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sender");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "destinationCallerID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessageReceivedWithGUID:fromIdentifier:toIdentifier:conversationType:messageType:messageProtocol:", v21, v22, v23, objc_msgSend(v39, "powerLogConversationType"), objc_msgSend(v17, "powerLogMessageType"), v19);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v14);
  }

  v45.receiver = self;
  v45.super_class = (Class)IMDTelephonyServiceSession;
  v24 = -[IMDServiceSession didReceiveMessages:forChat:style:account:fromIDSID:](&v45, sel_didReceiveMessages_forChat_style_account_fromIDSID_, obj, v37, v35, v40, v36);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v25 = obj;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "guid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_handleMessageProcessedWithGUID:", v32);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v27);
  }

  return v24;
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  unsigned int v28;
  objc_super v29;

  v28 = a5;
  v27 = a7;
  v26 = a6;
  v11 = a4;
  v12 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingChatWithGUID:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D399B8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "guid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationCallerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "powerLogConversationType");
  v20 = objc_msgSend(v12, "powerLogMessageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "errorCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logMessageSentWithGUID:fromIdentifier:toIdentifier:conversationType:messageType:sendDuration:errorCode:messageProtocol:", v16, v17, v18, v19, v20, 0, v21, v14);

  v29.receiver = self;
  v29.super_class = (Class)IMDTelephonyServiceSession;
  -[IMDServiceSession didSendMessage:forChat:style:account:forceDate:itemIsComingFromStorage:](&v29, sel_didSendMessage_forChat_style_account_forceDate_itemIsComingFromStorage_, v12, v11, v28, v26, v27, 0);

  +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "guid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "_handleMessageProcessedWithGUID:", v23);
}

- (id)_callerIDForChatWithChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 foundChat:(id)a5
{
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  int HasMultipleActiveSubscriptions;
  uint64_t HasMultipleSubscriptionsWithAtLeastOneActive;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  void *v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  char v45;
  NSObject *v46;
  __CFString *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unsigned int v53;
  __CFString *v54;
  __CFString *v55;
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v53 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v55 = (__CFString *)a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
  v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_callerIDForRelay");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString _appearsToBePhoneNumber](v9, "_appearsToBePhoneNumber"))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAliasRelayCapable:", v9);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "lastAddressedLocalHandle");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAddressedSIMID");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v12;
      v58 = 2112;
      v59 = v13;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "The Last Addressed Handle For This Chat is %@ and lastAddressedSIMID is %@", buf, 0x16u);
    }

  }
  HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  HasMultipleSubscriptionsWithAtLeastOneActive = IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive();
  v17 = HasMultipleSubscriptionsWithAtLeastOneActive;
  if (IMOSLoggingEnabled(HasMultipleSubscriptionsWithAtLeastOneActive))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      if (HasMultipleActiveSubscriptions)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      if (v17)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v57 = v20;
      v58 = 2112;
      v59 = v19;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Has multiple active subscriptions %@, has at least one active %@", buf, 0x16u);
    }

  }
  if (v17 && !-[__CFString length](v12, "length") && -[__CFString length](v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "ctSubscriptionInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "__im_subscriptionContextForForSimID:", v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "phoneNumber");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v42))
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v21;
        _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Last addressed handle was nil but found it a phone number on the context so using that phone number %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v21 = v12;
  }
  if (-[__CFString length](v21, "length"))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isAliasActiveAndRelayCapable:", v21);

    v24 = -[__CFString length](v21, "length");
    if (!v24)
      goto LABEL_31;
    if ((v23 & 1) != 0)
    {
LABEL_26:
      if (IMOSLoggingEnabled(v24))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v21;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat, and its one of our active aliases, setting callerID to %@", buf, 0xCu);
        }

      }
LABEL_30:
      v21 = v21;

      -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:", v55, v53, v21, v13);
LABEL_51:
      v9 = v21;
      goto LABEL_52;
    }
  }
  else
  {
    v24 = -[__CFString length](v21, "length");
    if (!v24)
      goto LABEL_31;
  }
  v24 = MEMORY[0x1D17EA560](v54, v21);
  if ((_DWORD)v24)
    goto LABEL_26;
LABEL_31:
  if (HasMultipleActiveSubscriptions)
  {
    if (-[__CFString length](v21, "length"))
    {
      v26 = -[__CFString _appearsToBePhoneNumber](v21, "_appearsToBePhoneNumber");
      if ((_DWORD)v26)
      {
        if (IMOSLoggingEnabled(v26))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v21;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat with at least one subscription active, setting callerID to %@", buf, 0xCu);
          }

        }
        goto LABEL_30;
      }
    }
    v29 = -[__CFString length](v13, "length");
    v30 = v29 == 0;
    v31 = IMOSLoggingEnabled(v29);
    if (!v30)
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v21;
          v58 = 2112;
          v59 = v13;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "We do not have a valid lastAddressedHandle %@ so using lastAddressedSIMID to send %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ctSubscriptionInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "__im_subscriptionContextForForSimID:", v13);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "phoneNumber");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v36;
      -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:", v55, v53, v21, v13);

      goto LABEL_51;
    }
    if (v31)
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Both simID and phoneNumber are not valid to send with.", buf, 2u);
      }

    }
  }
  else if (v11)
  {
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v57 = v55;
        v58 = 2112;
        v59 = v9;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be %@", buf, 0x16u);
      }

    }
    -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:", v55, v53, v9, v13);
  }
  else if (v54)
  {
    v44 = MEMORY[0x1D17EA560](v54, v21);
    v45 = v44 ^ 1;
    if (!v21)
      v45 = 0;
    if ((v45 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v44))
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v55;
          v58 = 2112;
          v59 = v54;
          _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be my phone number %@", buf, 0x16u);
        }

      }
      -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:", v55, v53, v54, v13);
    }
    v47 = v54;

    v9 = v47;
  }
  else
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dominentPhoneNumberAlias");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[IMDTelephonyServiceSession relayController](self, "relayController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "dominentPhoneNumberAlias");
      v52 = objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)v52;
    }
  }
LABEL_52:
  v37 = v9;

  return v37;
}

- (id)createHandleInfoFor:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v25;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v3 = objc_msgSend(v27, "style");
  v25 = v3;
  if ((_DWORD)v3 == 43)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v27, "participants");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v5;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Participants: %@", buf, 0xCu);

      }
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v27, "participants");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = v6;
    if (v6)
    {
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          if (IMOSLoggingEnabled(v6))
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v13, "ID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v35 = v15;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);

            }
          }
          if (v9)
          {
            if (!v7)
              goto LABEL_20;
          }
          else
          {
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (!v7)
            {
LABEL_20:
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              if (v8)
                goto LABEL_22;
              goto LABEL_21;
            }
          }
          if (v8)
            goto LABEL_22;
LABEL_21:
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_22:
          objc_msgSend(v13, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          objc_msgSend(v13, "unformattedID");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (const __CFString *)v17;
          else
            v19 = &stru_1E92346B0;
          objc_msgSend(v7, "addObject:", v19);

          objc_msgSend(v13, "countryCode");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v20)
            v22 = (const __CFString *)v20;
          else
            v22 = CFSTR("us");
          objc_msgSend(v8, "addObject:", v22);

          ++v12;
        }
        while (v10 != v12);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v10 = v6;
      }
      while (v6);
    }

  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  -[IMDTelephonyServiceSession createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:](self, "createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:", v9, v7, v8, v25 == 43);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)createHandleInfoForParticipants:(id)a3 unformattedIDs:(id)a4 countryCodes:(id)a5 isGroupChat:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35 = v11;
  if (a6)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v9, "count"))
    {
      v13 = 0;
      v34 = *MEMORY[0x1E0D36C20];
      v33 = *MEMORY[0x1E0D36D90];
      v32 = *MEMORY[0x1E0D36E10];
      v14 = *MEMORY[0x1E0D36D68];
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
        v19 = v10;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v20, v34, v15, v33, v16, v32, v17, v14, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v19;
        objc_msgSend(v12, "addObject:", v21);

        v11 = v35;
        ++v13;
      }
      while (v13 < objc_msgSend(v9, "count"));
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D36C20];
    objc_msgSend(v9, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D36D90];
    objc_msgSend(v10, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D36E10];
    objc_msgSend(v11, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, v24, v25, v26, v27, v28, v29, *MEMORY[0x1E0D36D68], 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v35;
    IMSingleObjectArray();
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_extractSMSSenderAddress:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (IMStringIsEmail())
    v4 = CFSTR("<> ");
  else
    v4 = CFSTR("<>");
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingCharactersFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE *v38;
  unint64_t v39;
  unsigned __int8 v40;
  BOOL v41;
  char v42;
  objc_super v43;
  id v44;
  objc_super v45;
  unsigned __int8 v46;
  _BYTE buf[24];
  void *v48;
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v46 = v7;
  v12 = a6;
  if (!-[IMDTelephonyServiceSession _shouldFailSMSMessageForTesting:chatIdentifier:chatStyle:](self, "_shouldFailSMSMessageForTesting:chatIdentifier:chatStyle:", v10, v11, v7))
  {
    v44 = v11;
    -[IMDServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v44, &v46);
    v13 = v44;

    if (!v13)
    {
      v11 = 0;
      goto LABEL_23;
    }
    -[IMDTelephonyServiceSession _chatForSendingMessageItem:chatIdentifier:chatStyle:](self, "_chatForSendingMessageItem:chatIdentifier:chatStyle:", v10, v13, v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMDTelephonyServiceSession allowedToSendMessage:toChat:](self, "allowedToSendMessage:toChat:", v10, v14);
    if (!v15)
    {
      v43.receiver = self;
      v43.super_class = (Class)IMDTelephonyServiceSession;
      -[IMDServiceSession sendMessage:toChat:style:account:](&v43, sel_sendMessage_toChat_style_account_, v10, v13, v46, v12);
      -[IMDServiceSession didSendMessage:forChat:style:](self, "didSendMessage:forChat:style:", v10, v13, v46);
LABEL_22:

      v11 = v13;
      goto LABEL_23;
    }
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v48 = v14;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "send message guid: %@  to identifier: %@   chat: %@", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trackEvent:", *MEMORY[0x1E0D387F0]);

    -[IMDTelephonyServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v13, v46, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDestinationCallerID:", v19);
    -[IMDTelephonyServiceSession compatibleMessageToSendForMessageItem:](self, "compatibleMessageToSendForMessageItem:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[IMDTelephonyServiceSession _sendingDecisionForMessageItem:callerID:chat:](self, "_sendingDecisionForMessageItem:callerID:chat:", v31, v19, v14);
    if ((v20 & 3) != 0)
    {
      v21 = v46;
      objc_msgSend(v14, "lastReplicationSinceLoadDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[IMDTelephonyServiceSession replicateMessage:chatIdentifier:chatStyle:lastKnownReplicationDate:callerID:](self, "replicateMessage:chatIdentifier:chatStyle:lastKnownReplicationDate:callerID:", v10, v13, v21, v22, v19);

      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastReplicationSinceLoadDate:", v23);

      }
      v24 = IMGetCachedDomainBoolForKey();
      objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isInternalInstall");

      if ((v26 & v24) != 0)
      {
        if (IMOSLoggingEnabled(v27))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "** Skipping true SMS send, DisableNonReplicationSMSSend is set", buf, 2u);
          }

        }
        goto LABEL_21;
      }
    }
    else
    {
      LOBYTE(v30) = 0;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v48) = 0;
    LOBYTE(v48) = objc_msgSend(v31, "useStandalone");
    v29 = v46;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1D1488240;
    v32[3] = &unk_1E9229F48;
    v32[4] = self;
    v38 = buf;
    v33 = v31;
    v34 = v19;
    v39 = v20;
    v35 = v14;
    v36 = v13;
    v40 = v46;
    v41 = v30;
    v42 = 0;
    v37 = v12;
    -[IMDTelephonyServiceSession processMessageForSending:toChat:style:allowWatchdog:completionBlock:](self, "processMessageForSending:toChat:style:allowWatchdog:completionBlock:", v33, v36, v29, 1, v32);

    _Block_object_dispose(buf, 8);
LABEL_21:

    v10 = v31;
    goto LABEL_22;
  }
  v45.receiver = self;
  v45.super_class = (Class)IMDTelephonyServiceSession;
  -[IMDServiceSession sendMessage:toChat:style:account:](&v45, sel_sendMessage_toChat_style_account_, v10, v11, v7, v12);
LABEL_23:

}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  char v21;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v17[1] = 3221225472;
  v17[2] = sub_1D14886C4;
  v17[3] = &unk_1E9229F70;
  v17[4] = self;
  v18 = a4;
  v21 = v9;
  v19 = v12;
  v20 = a7;
  v16.receiver = self;
  v16.super_class = (Class)IMDTelephonyServiceSession;
  v17[0] = MEMORY[0x1E0C809B0];
  v13 = v20;
  v14 = v12;
  v15 = v18;
  -[IMDServiceSession processMessageForSending:toChat:style:allowWatchdog:completionBlock:](&v16, sel_processMessageForSending_toChat_style_allowWatchdog_completionBlock_, v14, v15, v9, v8, v17);

}

- (void)setServiceCompatibleContentOn:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 from:(id)a6 completionBlock:(id)a7
{
  uint64_t v9;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id obj;
  _QWORD block[4];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[6];
  id v53;
  NSObject *v54;
  int64_t v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint8_t buf[16];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v9 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v39 = a4;
  v43 = a6;
  v40 = a7;
  v44 = v11;
  objc_msgSend(v11, "balloonBundleID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payloadData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v42, "length");
  if (v12 && (v12 = objc_msgSend(v41, "length")) != 0)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "We have a 3rd party message and need to transcode the payload data", buf, 2u);
      }

    }
    objc_msgSend(v43, "fileTransferGUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__imArrayByApplyingBlock:", &unk_1E9229FB0);
    obj = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = sub_1D1488D88;
    v65[3] = &unk_1E9229FD8;
    v66 = v42;
    v67 = v11;
    v68 = v40;
    objc_msgSend(v15, "transcodeFallbackFileTransferPayloadData:balloonBundleID:attachments:completionBlock:", v41, v66, obj, v65);

  }
  else
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "We have transfers for this message and this is not a 3rd party message, so let's try and transcode them", buf, 2u);
      }

    }
    obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v43, "fileTransferGUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v62 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "transferForGUID:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "isAutoloopVideo"))
            objc_msgSend(obj, "addObject:", v23);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v18);
    }

    if (objc_msgSend(obj, "count"))
    {
      objc_msgSend(v43, "fileTransferGUIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v39, v9);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[IMDServiceSession maxSizePerAttachmentWithCount:forChat:](self, "maxSizePerAttachmentWithCount:forChat:", v25, v38);
      v27 = dispatch_group_create();
      v28 = objc_alloc_init(MEMORY[0x1E0CB3600]);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(obj, "count"));
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = obj;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v58 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
            dispatch_group_enter(v27);
            objc_msgSend(v33, "localURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0;
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = sub_1D1489008;
            v52[3] = &unk_1E922A028;
            v52[4] = v33;
            v52[5] = self;
            v55 = v26;
            v53 = v29;
            v35 = v27;
            v54 = v35;
            objc_msgSend(v28, "coordinateReadingItemAtURL:options:error:byAccessor:", v34, 0, &v56, v52);
            v36 = v56;

            if (v36)
              dispatch_group_leave(v35);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
        }
        while (v30);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14893B0;
      block[3] = &unk_1E92286D8;
      v48 = v43;
      v49 = v29;
      v50 = v44;
      v51 = v40;
      v37 = v29;
      dispatch_group_notify(v27, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, void *))v40 + 2))(v40, v44);
    }
  }

}

- (void)_processReceivedDictionary:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__processReceivedDictionaryInBlastDoor_storageContext_receivedViaRelay_withCompletionBlock_);
}

- (void)_updateCategoryForChat:(id)a3 andMessage:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 spamExtensionName:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v15;
      v18 = 2048;
      v19 = a5;
      v20 = 2048;
      v21 = a6;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Updating chat %@ category %ld subCategory @%ld", (uint8_t *)&v16, 0x20u);

    }
  }
  objc_msgSend(v11, "updateSMSCategory:subCategory:", a5, a6);
  objc_msgSend(v11, "updateSMSSpamExtensionNameChatProperty:", v13);

}

- (void)_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allExistingChatsWithIdentifier:style:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "receivedBlackholeError"))
        {
          objc_msgSend(v14, "updateReceivedBlackholeError:", 0);
          +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v12;
          v16[1] = 3221225472;
          v16[2] = sub_1D14898F8;
          v16[3] = &unk_1E922A050;
          v16[4] = self;
          objc_msgSend(v15, "remapMessageError:toError:forChat:completion:", 43, 0, v14, v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)_disableScreenTimeRestrictionsForMessageItem:(id)a3 chat:(id)a4 watchSendsOverCellular:(BOOL)a5 emergencyNumbersFoundInRecipients:(int64_t *)a6
{
  if (a6)
    *a6 = 0;
  return 0;
}

- (int64_t)_iMessageCapabilityForSIMID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredSIMIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10)) & 1) != 0)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 2;
  }

  return v9;
}

- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)_relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  id *v29;
  id *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int64_t v38;
  BOOL v39;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[2];
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[2];
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  BOOL v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a10;
  v17 = objc_msgSend(v15, "isChatBot");
  if ((v17 & 1) == 0)
  {
    v39 = a8;
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "We have peer devices, relaying message...", buf, 2u);
      }

    }
    objc_msgSend(v15, "lastAddressedSIMID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[IMDTelephonyServiceSession _iMessageCapabilityForSIMID:](self, "_iMessageCapabilityForSIMID:", v19);

    objc_msgSend(v14, "balloonBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D375F8]);

    objc_msgSend(v14, "fileTransferGUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "count"))
      v21 = 1;

    v24 = IMOSLoggingEnabled(v23);
    if ((v21 & 1) != 0)
    {
      v25 = a7;
      v26 = v39;
      if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "guid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v28;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "No attachments or rich links, relaying message with guid %@", buf, 0xCu);

        }
        v26 = v39;
      }
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = sub_1D148A3E4;
      v42[3] = &unk_1E922A078;
      v42[4] = self;
      v43 = v14;
      v44 = v15;
      v46 = a5;
      v47 = a6;
      v48 = v25;
      v49 = v26;
      v50 = a9;
      v45[0] = v16;
      v45[1] = v38;
      -[IMDTelephonyServiceSession waitForChatRelayReadiness:withBlock:](self, "waitForChatRelayReadiness:withBlock:", v44, v42);
      v29 = &v43;
      v30 = &v44;
      v31 = (id *)v45;
    }
    else
    {
      if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "guid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v33;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Message with Guid %@ contains attachments, uploading to MMCS", buf, 0xCu);

        }
      }
      -[IMDTelephonyServiceSession attachmentController](self, "attachmentController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastAddressedLocalHandle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastAddressedSIMID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = sub_1D148A02C;
      v53[3] = &unk_1E922A0A0;
      v53[4] = self;
      v54 = v15;
      v55 = v14;
      v57 = a5;
      v58 = a6;
      v59 = a7;
      v60 = v39;
      v61 = a9;
      v56[0] = v16;
      v56[1] = v38;
      v51[0] = v37;
      v51[1] = 3221225472;
      v51[2] = sub_1D148A2D0;
      v51[3] = &unk_1E922A0C8;
      v51[4] = self;
      v52 = v55;
      objc_msgSend(v34, "processAttachmentsForPeerRelayForMessage:lastAddressHandle:lastAddressedSIMID:completionBlock:uploadFailureBlock:", v52, v35, v36, v53, v51);

      v29 = &v54;
      v30 = &v55;
      v31 = (id *)v56;
    }

  }
}

- (void)_setTimeoutTimerForRelayMessageID:(id)a3 timeout:(double)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *outgoingRelayMessageTimerMap;
  void *v9;
  id v10;

  v6 = a3;
  if (a4 <= 1.0)
    a4 = 180.0;
  v10 = v6;
  if (objc_msgSend(v6, "length"))
  {
    -[IMDTelephonyServiceSession _clearTimoutTimerForRelayMessageID:](self, "_clearTimoutTimerForRelayMessageID:", v10);
    if (!self->_outgoingRelayMessageTimerMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      outgoingRelayMessageTimerMap = self->_outgoingRelayMessageTimerMap;
      self->_outgoingRelayMessageTimerMap = Mutable;

    }
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__messageTimedOut_, v10, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[NSMutableDictionary setObject:forKey:](self->_outgoingRelayMessageTimerMap, "setObject:forKey:", v9, v10);

  }
}

- (void)_clearTimoutTimerForRelayMessageID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_outgoingRelayMessageTimerMap, "objectForKey:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_outgoingRelayMessageTimerMap, "removeObjectForKey:", v5);
      objc_msgSend(v4, "invalidate");
    }

  }
}

- (void)_addOriginatedMessage:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSMutableSet *originatedMessages;
  NSMutableSet *v8;
  NSMutableSet *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, " Adding Message with GUID: %@ to originated Message Map", (uint8_t *)&v10, 0xCu);
      }

    }
    originatedMessages = self->_originatedMessages;
    if (!originatedMessages)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = self->_originatedMessages;
      self->_originatedMessages = v8;

      originatedMessages = self->_originatedMessages;
    }
    -[NSMutableSet addObject:](originatedMessages, "addObject:", v4);
    -[IMDTelephonyServiceSession _setClearMessageSendTimer](self, "_setClearMessageSendTimer");
  }

}

- (void)_removeOriginatedMessage:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, " Removing Message with GUID: %@ from originated Message Map", (uint8_t *)&v7, 0xCu);
      }

    }
    -[NSMutableSet removeObject:](self->_originatedMessages, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_originatedMessages, "count"))
      -[IMDTelephonyServiceSession _clearInactivityTimer](self, "_clearInactivityTimer");
  }

}

- (void)_clearInactivityTimer
{
  NSMutableSet *originatedMessages;

  self->_pendingOriginatedMessagesTimer = 0;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__clearInactivityTimer, 0);
  originatedMessages = self->_originatedMessages;
  self->_originatedMessages = 0;

}

- (void)_setClearMessageSendTimer
{
  if (!self->_pendingOriginatedMessagesTimer)
  {
    self->_pendingOriginatedMessagesTimer = 1;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__clearInactivityTimer, 0);
    -[IMDTelephonyServiceSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__clearInactivityTimer, 0, 30.0);
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  IMMultiQueue *incomingMessageMultiQueue;
  IMMultiQueue *v10;
  IMMultiQueue *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession accountID](self, "accountID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v13, 0x16u);

    }
  }
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    v10 = (IMMultiQueue *)objc_alloc_init(MEMORY[0x1E0D36A78]);
    v11 = self->_incomingMessageMultiQueue;
    self->_incomingMessageMultiQueue = v10;

    incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  }
  -[IMDServiceSession accountID](self, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMultiQueue addBlock:withTimeout:forKey:description:](incomingMessageMultiQueue, "addBlock:withTimeout:forKey:description:", v6, v12, 0, a4);

}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 0;
}

- (unint64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Subclass failed to override participant check", v9, 2u);
    }

  }
  return 0;
}

- (id)subscriptionContextForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastAddressedLocalHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAddressedSIMID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v7;
      v41 = 2112;
      v42 = v4;
      v43 = 2112;
      v44 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Not first chat (%@): lastAddressedLocalHandle %@ lastAddressedSIMID %@", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ctSubscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 1;

  if (v11)
  {
    objc_msgSend(v9, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_21;
  }
  else
  {
    objc_msgSend(v9, "__im_subscriptionContextForForSimID:phoneNumber:", v5, v4);
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v14;
    if (v14)
      goto LABEL_21;
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v4;
      v41 = 2112;
      v42 = v5;
      v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on lastAddressedHandle %@ lastAddressedSIMID %@ so finding context preferred subscription for chat %@", buf, 0x20u);

    }
  }
  v17 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v3, "participants");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "ID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v19);
  }

  objc_msgSend(v9, "__im_contactPreferredSubscriptionContextForChatHandleIDs:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on contact preferred subscription in context so failing message", buf, 2u);
      }

    }
    v13 = 0;
    goto LABEL_30;
  }
LABEL_21:
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v13;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Setting the context for context %@ and updating lastAddressed if needed", buf, 0xCu);
    }

  }
  objc_msgSend(v13, "phoneNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((MEMORY[0x1D17EA560](v4, v24) & 1) != 0)
  {
    objc_msgSend(v13, "labelID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v5, "isEqualToString:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_30;
  }
  else
  {

  }
  objc_msgSend(v3, "chatIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v3, "style");
  objc_msgSend(v13, "phoneNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "labelID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:", v27, v28, v29, v30);

LABEL_30:
  return v13;
}

- (void)_markFromStorageIfNeeded:(id)a3 messageGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Storage context present for message with GUID %@", (uint8_t *)&v11, 0xCu);
      }

    }
    v10 = objc_msgSend(v6, "unsignedIntValue");
    if ((objc_msgSend(v6, "unsignedIntValue") & 2) != 0)
    {
      -[IMDServiceSession noteLastItemFromStorage:](self, "noteLastItemFromStorage:", v8);
    }
    else if ((v10 & 1) != 0)
    {
      -[IMDServiceSession noteItemFromStorage:](self, "noteItemFromStorage:", v8);
    }
  }

}

- (void)_updateShouldForceToSMSForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 shouldForceToSMS:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allExistingSupportedServiceChatsWithIdentifier:style:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      if (v5)
        v12 = CFSTR("YES");
      v24 = 1024;
      v25 = v6;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have shouldForceToSMS updated to %@.", buf, 0x1Cu);
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "updateShouldForceToSMS:", v5, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_finishSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 foundChat:(id)a6 didSendSMS:(BOOL)a7 attemptingReplication:(BOOL)a8 shouldForceFail:(BOOL)a9 watchSendsOverCellular:(BOOL)a10 forceReflection:(BOOL)a11 callerID:(id)a12
{
  _BOOL8 v12;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  BOOL v25;
  int IsAltAccount;
  void *v27;
  int v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t HasMultipleSubscriptions;
  NSObject *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  _BOOL4 v50;
  id v51;
  unsigned int v52;
  id v53;
  objc_super v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v50 = a8;
  v12 = a7;
  v52 = a5;
  v63 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v53 = a4;
  v17 = a6;
  v51 = a12;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allExistingSupportedServiceChatsWithIdentifier:style:", v53, v52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v16, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateLastSeenMessageGuidIfNeeded:", v24);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v20);
  }

  if (objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled") & v12)
    -[IMDTelephonyServiceSession _resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:chatStyle:](self, "_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:chatStyle:", v53, v52);
  v55 = 0;
  v25 = -[IMDTelephonyServiceSession _disableScreenTimeRestrictionsForMessageItem:chat:watchSendsOverCellular:emergencyNumbersFoundInRecipients:](self, "_disableScreenTimeRestrictionsForMessageItem:chat:watchSendsOverCellular:emergencyNumbersFoundInRecipients:", v16, v17, a10, &v55);
  IsAltAccount = IMSharedHelperDeviceIsAltAccount();
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "watchConnectedOverBT");

  v29 = v55;
  v30 = -[IMDTelephonyServiceSession shouldExcludeChatFromRelay:](self, "shouldExcludeChatFromRelay:", v17);
  if (a9)
  {
    HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
    if ((HasMultipleSubscriptions & a9) == 1)
    {
      if (IMOSLoggingEnabled(HasMultipleSubscriptions))
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v16, "guid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = v33;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "SMS was not sent out and message was force failed so that user can pick correct subscription to send with %@", buf, 0xCu);

        }
      }
LABEL_28:
      objc_msgSend(v16, "guid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession didReceiveError:forMessageID:forceError:](self, "didReceiveError:forMessageID:forceError:", 4, v37, 1);

      goto LABEL_32;
    }
  }
  else
  {
    v34 = v30;
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "hasPeerDevices") ^ 1 | IsAltAccount) == 1)
    {

    }
    else
    {
      if (!v55)
        v28 = 1;

      if (((v28 ^ 1 | v34) & 1) == 0)
      {
        if (v12
          && (-[IMDTelephonyServiceSession relayEnrollmentController](self, "relayEnrollmentController"),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v38, "_allowedDevicesforSMSRelay"),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              v40 = objc_msgSend(v39, "count") == 0,
              v39,
              v38,
              v40))
        {
          if (IMOSLoggingEnabled(v41))
          {
            OSLogHandleForIMFoundationCategory();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "None of our peer devices are on the allowed list, Not relaying message", buf, 2u);
            }

          }
          +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accountID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "accountForAccountID:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v45)
          {
            v47 = v45;
          }
          else
          {
            -[IMDServiceSession account](self, "account");
            v47 = (id)objc_claimAutoreleasedReturnValue();
          }
          v48 = v47;

          v54.receiver = self;
          v54.super_class = (Class)IMDTelephonyServiceSession;
          -[IMDServiceSession sendMessage:toChat:style:account:](&v54, sel_sendMessage_toChat_style_account_, v16, v53, v52, v48);

        }
        else
        {
          LOBYTE(v49) = v25;
          -[IMDTelephonyServiceSession _relayMessage:chat:didSendSMS:attemptingReplication:forceReflection:relayToWatchOnly:shouldDisableScreenTimeRestrictions:callerID:](self, "_relayMessage:chat:didSendSMS:attemptingReplication:forceReflection:relayToWatchOnly:shouldDisableScreenTimeRestrictions:callerID:", v16, v17, v12, v50, a11, v29 > 0, v49, v51);
        }
        goto LABEL_32;
      }
    }
    HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  }
  if (IMOSLoggingEnabled(HasMultipleSubscriptions))
  {
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "We have no peer devices, or this message was intended for an emergency number, not relaying message", buf, 2u);
    }

  }
  if (!v12)
    goto LABEL_28;
LABEL_32:

}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[IMDTelephonyServiceSession chatRegistry](self, "chatRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[IMDTelephonyServiceSession shouldExcludeChatFromRelay:](self, "shouldExcludeChatFromRelay:", v8))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendDeleteCommand:forChatGUID:", v10, v6);

  }
}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[IMDTelephonyServiceSession chatRegistry](self, "chatRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[IMDTelephonyServiceSession shouldExcludeChatFromRelay:](self, "shouldExcludeChatFromRelay:", v8))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendRecoverCommand:forChatGUID:", v10, v6);

  }
}

- (id)_resolveHandlesFor:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1D148BA54;
  v17 = sub_1D148BA64;
  v18 = 0;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D148BA6C;
  v12[3] = &unk_1E9228998;
  v12[4] = &v13;
  objc_msgSend(v8, "resolveUnformattedRepresentationsForHandles:onService:message:completionBlock:", v6, v9, v7, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)isGroupMessagingEnabledFor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D39730];
  v4 = a3;
  objc_msgSend(v4, "lastAddressedLocalHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastAddressedSIMID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v3, "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v5, v6);
  return (char)v3;
}

- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6
{
  return 0;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  int v16;
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaximumMessageByteCountForPhoneNumber:simID:", v7, v8);
  v10 = (uint64_t)((double)(int)v9 * 0.92);
  v11 = IMOSLoggingEnabled(v9);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      *(_QWORD *)v17 = v10;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "   Maximum byte length for attachments is: %lld", (uint8_t *)&v16, 0xCu);
    }

  }
  v13 = v10 / a3;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 67109376;
      v17[0] = a3;
      LOWORD(v17[1]) = 2048;
      *(_QWORD *)((char *)&v17[1] + 2) = v13;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "     Part byte length for %d attachments will be: %lld", (uint8_t *)&v16, 0x12u);
    }

  }
  return v13;
}

- (void)sendMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  IMDTelephonyServiceSession *v24;
  id v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = IMOSLoggingEnabled(v12);
  if ((_DWORD)v13)
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Message sending...", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "participants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Looking at participants for chat %@ participants %@", buf, 0x16u);

    }
  }
  objc_msgSend(v12, "participants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _resolveHandlesFor:withMessage:](self, "_resolveHandlesFor:withMessage:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDTelephonyServiceSession makeSenderFor:forChat:chatStyle:recipients:](self, "makeSenderFor:forChat:chatStyle:recipients:", v10, v12, v6, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1D148BF70;
    v22[3] = &unk_1E922A158;
    v23 = v19;
    v24 = self;
    v25 = v11;
    v26 = v6;
    objc_msgSend(v23, "prepareWithCompletion:", v22);

  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Unable to create Message Sender, can't send", buf, 2u);
    }

  }
}

- (BOOL)_isActiveServiceForRelay
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[IMDTelephonyServiceSession _isActiveServiceForRelay]";
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "%s not overridden by subclass!", (uint8_t *)&v4, 0xCu);
    }

  }
  return 0;
}

- (BOOL)_canSendWithCallerID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "__im_containsPhoneNumber:", v3);

    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        if (v6)
          v9 = CFSTR("YES");
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Should send if caller ID is part of the subscription context: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = MEMORY[0x1D17EA560](v10, v3);

  }
  return v6;
}

- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  unint64_t v27;
  uint64_t HasMultipleSubscriptions;
  NSObject *v29;
  void *v30;
  uint64_t HasMultipleActiveSubscriptions;
  uint64_t v32;
  char v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  uint8_t v39[16];
  uint8_t v40[16];
  __int16 v41;
  uint8_t v42[16];
  __int16 v43;
  uint8_t buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_localDeviceSupportsSMS");

  v13 = -[IMDTelephonyServiceSession _canSendWithCallerID:](self, "_canSendWithCallerID:", v9);
  v38 = v9;
  v14 = v8;
  if (objc_msgSend(v9, "length"))
    v15 = objc_msgSend(v9, "_appearsToBePhoneNumber");
  else
    v15 = 0;
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastAddressedSIMID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:", v17);

  objc_msgSend(v10, "lastAddressedLocalHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastAddressedLocalHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isAliasActiveAndRelayCapable:", v21);

  }
  else
  {
    v22 = 0;
  }

  if ((v13 & v12 & v15) == 1)
  {
    if (!IMOSLoggingEnabled(v23))
    {
LABEL_13:
      v27 = 1;
      goto LABEL_38;
    }
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v25 = "My Caller ID & Phone Number are the same, I am SMS Capable, My callerID is a phone number: Sending Message via CT";
    v26 = buf;
LABEL_11:
    _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, v25, v26, 2u);
    goto LABEL_12;
  }
  HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  if ((_DWORD)HasMultipleSubscriptions)
  {
    HasMultipleSubscriptions = objc_msgSend(v14, "useStandalone");
    if ((_DWORD)HasMultipleSubscriptions)
    {
      if (!IMOSLoggingEnabled(HasMultipleSubscriptions))
        goto LABEL_13;
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v43 = 0;
      v25 = "Subscription on chat cannot be found in active subscriptions but message must be sent because it is an SOS message.";
      v26 = (uint8_t *)&v43;
      goto LABEL_11;
    }
  }
  if (v18)
  {
    if (IMOSLoggingEnabled(HasMultipleSubscriptions))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "I do not have a phone number, however I am sms capable: Sending Message via CT", v42, 2u);
      }

    }
    objc_msgSend(v10, "lastAddressedSIMID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDestinationCallerID:", v30);

    v27 = 5;
  }
  else
  {
    if (((v15 | v12 ^ 1) & 1) == 0)
    {
      HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
      if ((HasMultipleActiveSubscriptions & 1) == 0)
      {
        if (!IMOSLoggingEnabled(HasMultipleActiveSubscriptions))
          goto LABEL_13;
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        v41 = 0;
        v25 = "My CallerID is not set to phone number However I am SMS Capable: Sending Message via CT";
        v26 = (uint8_t *)&v41;
        goto LABEL_11;
      }
    }
    v32 = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
    v33 = v32 & v12 ^ 1 | v13 | v22;
    v34 = IMOSLoggingEnabled(v32);
    if ((v33 & 1) != 0)
    {
      if (v34)
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, ": Calling Did Send Message, Another device will relay this message for me", v39, 2u);
        }

      }
      v27 = 2;
    }
    else
    {
      if (v34)
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "My device is capable of sending SMS but is not on correct subscription. Failing message", v40, 2u);
        }

      }
      v27 = 8;
    }
  }
LABEL_38:

  return v27;
}

- (BOOL)_sendMessageOverAlternatePath:(id)a3 toChat:(id)a4
{
  return 0;
}

- (void)_messageTimedOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithGUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isSent");
  if (!(_DWORD)v8)
    goto LABEL_4;
  objc_msgSend(v7, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
  {
    v12 = objc_msgSend(v7, "wasDowngraded");

    if (!v12)
    {
LABEL_4:
      v13 = IMOSLoggingEnabled(v8);
      if ((_DWORD)v13)
      {
        OSLogHandleForIMEventCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v5;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Failed to send relay message ID guid (timed out): %@", (uint8_t *)&v17, 0xCu);
        }

      }
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMEventCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v5;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Error sending message: %@ SMS Relay timed out", (uint8_t *)&v17, 0xCu);
        }

      }
      if (v5)
        -[IMDServiceSession didReceiveError:forMessageID:forceError:](self, "didReceiveError:forMessageID:forceError:", 4, v5, 1);
      goto LABEL_18;
    }
  }
  else
  {

  }
  IMLogHandleForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1D1667AE8(v16);

LABEL_18:
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_joinChat_handleInfo_style_groupID_joinProperties_);
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
  -[IMDTelephonyServiceSession joinChat:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:](self, "joinChat:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v12 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v23 = v15;
      v24 = 1024;
      v25 = v12;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Request to join chat: %@  style: %c handleInfo: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x30u);
    }

  }
  -[IMDServiceSession didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", v15, v12, 0, v17, v18, v19, v16);

}

- (IMDRelayServiceController)relayController
{
  return +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
}

- (IMDRelayEnrollmentController)relayEnrollmentController
{
  void *v2;
  void *v3;

  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDRelayEnrollmentController *)v3;
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDTelephonyServiceSession relayEnrollmentController](self, "relayEnrollmentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrollDeviceInSMSRelay:", v4);

}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDTelephonyServiceSession relayEnrollmentController](self, "relayEnrollmentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unEnrollDeviceInSMSRelay:", v4);

}

- (void)enrollSelfDeviceInSMSRelay
{
  id v2;

  -[IMDTelephonyServiceSession relayEnrollmentController](self, "relayEnrollmentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollSelfDeviceInSMSRelay");

}

- (void)processMessageSendFailure:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageFailedToSend:", v5);

  }
}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  -[IMDTelephonyServiceSession didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:shouldRelay:](self, "didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:shouldRelay:", a3, a4, a5, a6, a7, a8, a9, v9);
}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9 shouldRelay:(BOOL)a10
{
  uint64_t v10;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  IMDRelayGroupDisplayNameMutationMessage *v36;
  void *v37;
  objc_super v38;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = v16;
  v19 = v17;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v38.receiver = self;
  v38.super_class = (Class)IMDTelephonyServiceSession;
  -[IMDServiceSession didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:](&v38, sel_didReceiveDisplayNameChange_guid_fromID_toIdentifier_forChat_style_account_, v16, v19, v20, v21, v22, v10, a9);
  -[IMDServiceSession service](self, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v23, "supportsCapability:", *MEMORY[0x1E0D38DF0]);

  if ((_DWORD)v16)
    v24 = !a10;
  else
    v24 = 1;
  if (!v24)
  {
    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v22, v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = [IMDRelayGroupDisplayNameMutationMessage alloc];
    -[IMDServiceSession service](self, "service");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "internalName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "groupID");
    v26 = v19;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "originalGroupID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v26);
    LOWORD(v33) = 0;
    v30 = -[IMDRelayGroupDisplayNameMutationMessage initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:](v36, "initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:", v18, v20, v25, v27, v28, v29, v21, v33);
    v37 = v18;
    v31 = (void *)v30;

    v19 = v26;
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "reflectGroupMutation:callerID:didOccurLocally:", v31, v21, 1);

    v18 = v37;
  }

}

- (IMDRelayAttachmentController)attachmentController
{
  return self->_attachmentController;
}

- (void)setAttachmentController:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentController, a3);
}

- (void)setRelayController:(id)a3
{
  objc_storeStrong((id *)&self->_relayController, a3);
}

- (void)setRelayEnrollmentController:(id)a3
{
  objc_storeStrong((id *)&self->_relayEnrollmentController, a3);
}

- (NSMutableDictionary)outgoingRelayMessageTimerMap
{
  return self->_outgoingRelayMessageTimerMap;
}

- (void)setOutgoingRelayMessageTimerMap:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingRelayMessageTimerMap, a3);
}

- (NSMutableSet)originatedMessages
{
  return self->_originatedMessages;
}

- (void)setOriginatedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_originatedMessages, a3);
}

- (BOOL)pendingOriginatedMessagesTimer
{
  return self->_pendingOriginatedMessagesTimer;
}

- (void)setPendingOriginatedMessagesTimer:(BOOL)a3
{
  self->_pendingOriginatedMessagesTimer = a3;
}

- (IMMultiQueue)incomingMessageMultiQueue
{
  return self->_incomingMessageMultiQueue;
}

- (void)setIncomingMessageMultiQueue:(id)a3
{
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, a3);
}

- (BOOL)isRegisteredForCTPhoneNumberNotifications
{
  return self->_isRegisteredForCTPhoneNumberNotifications;
}

- (void)setIsRegisteredForCTPhoneNumberNotifications:(BOOL)a3
{
  self->_isRegisteredForCTPhoneNumberNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, 0);
  objc_storeStrong((id *)&self->_outgoingRelayMessageTimerMap, 0);
  objc_storeStrong((id *)&self->_relayEnrollmentController, 0);
  objc_storeStrong((id *)&self->_relayController, 0);
  objc_storeStrong((id *)&self->_attachmentController, 0);
  objc_storeStrong((id *)&self->_tapbackInterpreter, 0);
  objc_storeStrong((id *)&self->_originatedMessages, 0);
}

- (void)_setupCoreTelephonyObservation
{
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSetupComplete");

  v6 = IMOSLoggingEnabled(v5);
  if (v4)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Daemon is ready registering for incoming messages", buf, 2u);
      }

    }
    -[IMDTelephonyServiceSession _registerForIncomingMessages:](self, "_registerForIncomingMessages:", 0);
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Daemon is not yet ready, watching for notification to register for incoming messages", v10, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__registerForIncomingMessages_, *MEMORY[0x1E0D36C48], 0);

  }
}

- (void)_registerForIncomingMessages:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Registering for incoming messages", v6, 2u);
    }

  }
  -[IMDTelephonyServiceSession _registerForCTNotifications](self, "_registerForCTNotifications");

}

- (void)_registerForCTNotifications
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  if (!-[IMDTelephonyServiceSession isRegisteredForCTPhoneNumberNotifications](self, "isRegisteredForCTPhoneNumberNotifications"))
  {
    if (IMOSLoggingEnabled(-[IMDTelephonyServiceSession setIsRegisteredForCTPhoneNumberNotifications:](self, "setIsRegisteredForCTPhoneNumberNotifications:", 1)))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Registering for Message Receipts.", v5, 2u);
      }

    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1D148D524, (CFStringRef)*MEMORY[0x1E0D38CF0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_teardownCoreTelephonyObservation
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[IMDTelephonyServiceSession isRegisteredForCTPhoneNumberNotifications](self, "isRegisteredForCTPhoneNumberNotifications"))
  {
    if (IMOSLoggingEnabled(-[IMDTelephonyServiceSession setIsRegisteredForCTPhoneNumberNotifications:](self, "setIsRegisteredForCTPhoneNumberNotifications:", 0)))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Unregistering for Message Receipts.", v4, 2u);
      }

    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
  }
}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (void)handler:(id)a3 incomingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  IMDTelephonyServiceSession *v19;
  id v20;
  id v21;

  v11 = a4;
  v12 = a7;
  v13 = a9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D14C6CF8;
  v17[3] = &unk_1E922B5E8;
  v18 = v11;
  v19 = self;
  v20 = v12;
  v21 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v17, 45.0);

}

- (void)handler:(id)a3 incomingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v11 = a4;
  v12 = a7;
  v13 = a9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D14C7410;
  v17[3] = &unk_1E922B5E8;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v17, 240.0);

}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11
{
  -[IMDTelephonyServiceSession handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", a3, a4, a5, a6, a7, a8);
}

- (id)chatForOutgoingMessage:(id)a3 fromIdentifier:(id)a4 isInProxyMode:(BOOL)a5 createIfNotExists:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  void *v72;
  int v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  IMDTelephonyServiceSession *v81;
  id v82;
  __CFString *obj;
  __CFString *v84;
  const __CFString *v85;
  __CFString *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t v96[128];
  uint8_t buf[4];
  const __CFString *v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  const __CFString *v102;
  __int16 v103;
  const __CFString *v104;
  _BYTE v105[128];
  uint64_t v106;

  v76 = a6;
  v6 = a5;
  v106 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v79 = a4;
  v81 = self;
  -[IMDServiceSession service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsCapability:", *MEMORY[0x1E0D38DF0]);

  if (v10)
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", IMDRelayMessageItemDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", IMDRelayMessageDictionaryChatDisplayNameKey);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  -[IMDServiceSession service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsCapability:", *MEMORY[0x1E0D38DC8]);

  if (v13)
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", IMDRelayMessageItemDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", IMDRelayMessageDictionaryChatGroupIDKey);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "objectForKeyedSubscript:", IMDRelayMessageItemDictionary);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", IMDRelayMessageDictionaryChatOriginalGroupID);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
    v77 = 0;
  }
  objc_msgSend(v82, "objectForKey:", IMDCTMessageDictionaryReceipientsKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "__imArrayByApplyingBlock:", &unk_1E922B630);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v17;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "ChatForOutgoingMessage recipients %@", buf, 0xCu);
    }

  }
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_isDefaultPairedDeviceRelayingLocally:", v79);

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v17;
  v22 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v22)
  {
    v23 = v21 | v6;
    v24 = *(_QWORD *)v93;
    if (v21 | v6)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v85 = v25;
    if (v21)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    if (v6)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v93 != v24)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isPhoneNumberEmergencyNumber:", v29);

        v33 = IMOSLoggingEnabled(v32);
        if (((v31 ^ 1 | v23) & 1) == 0)
        {
          if (v33)
          {
            OSLogHandleForIMFoundationCategory();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "One of the recipients of this outgoing message is an emergency number, Not processing message", buf, 2u);
            }

          }
          v45 = 0;
          v46 = obj;
          goto LABEL_71;
        }
        if (v33)
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            v35 = CFSTR("NO");
            if (v31)
              v35 = CFSTR("YES");
            v98 = v35;
            v99 = 2112;
            v100 = v85;
            v101 = 2112;
            v102 = v26;
            v103 = 2112;
            v104 = v27;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Will send SMS, recipient is Emergency %@, shouldRelayEmergencyTextFromPairedDevice: %@, isDefaultPairedDeviceRelayingLocally: %@, isInProxyMode %@ ", buf, 0x2Au);
          }

        }
      }
      v22 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
      if (v22)
        continue;
      break;
    }
  }

  v86 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v82, "objectForKey:", IMDRelayMessageDictionaryChatStyleKey);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = _ChatStyleFromChatStyleString(v36);

  buf[0] = v74;
  if (v74 == 45)
  {
    -[__CFString __imFirstObject](obj, "__imFirstObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, *MEMORY[0x1E0D36C20], v75, *MEMORY[0x1E0D36D90], 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFString addObject:](v86, "addObject:", v39);
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString __imFirstObject](obj, "__imFirstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession account](v81, "account");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "existingChatForID:account:", v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
LABEL_56:
    v62 = (void *)v43;

    goto LABEL_57;
  }
  -[IMDTelephonyServiceSession chatRegistry](v81, "chatRegistry");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](v81, "account");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "generateUnusedChatIdentifierForGroupChatWithAccount:", v48);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v84 = obj;
  v49 = -[__CFString countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v89;
    v51 = *MEMORY[0x1E0D36C20];
    v52 = *MEMORY[0x1E0D36D90];
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v89 != v50)
          objc_enumerationMutation(v84);
        v54 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
        v55 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "dictionaryWithObjectsAndKeys:", v56, v51, v54, v52, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString addObject:](v86, "addObject:", v57);
      }
      v49 = -[__CFString countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
    }
    while (v49);
  }

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](v81, "account");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](v81, "service");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "groupsMergeDisplayNames"))
    v61 = v78;
  else
    v61 = 0;
  objc_msgSend(v58, "existingChatForIDs:account:displayName:groupID:style:", v84, v59, v61, v77, 43);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62 && v80)
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession account](v81, "account");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](v81, "service");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "groupsMergeDisplayNames"))
      v63 = v78;
    else
      v63 = 0;
    objc_msgSend(v40, "existingChatForIDs:account:displayName:originalGroupID:style:", v84, v41, v63, v80, 43);
    v43 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
LABEL_57:
  if (v62)
  {
    objc_msgSend(v62, "chatIdentifier");
    v64 = (id)objc_claimAutoreleasedReturnValue();

    buf[0] = objc_msgSend(v62, "style");
    v45 = v62;
  }
  else
  {
    v87 = v75;
    -[IMDServiceSession canonicalizeChatIdentifier:style:](v81, "canonicalizeChatIdentifier:style:", &v87, buf);
    v64 = v87;

    if (v76)
    {
      -[IMDServiceSession didJoinChat:style:displayName:groupID:originalGroupID:handleInfo:](v81, "didJoinChat:style:displayName:groupID:originalGroupID:handleInfo:", v64, buf[0], v78, v77, v80, v86);
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v74 == 45)
      {
        -[__CFString __imFirstObject](obj, "__imFirstObject");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession account](v81, "account");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "existingChatForID:account:", v66, v67);
        v45 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[IMDServiceSession account](v81, "account");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "existingChatForIDs:account:displayName:groupID:style:", obj, v66, v78, v77, 43);
        v45 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v45 = 0;
    }
  }
  if (!v80)
    goto LABEL_70;
  objc_msgSend(v45, "originalGroupID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v68, "isEqualToString:", v80) & 1) != 0)
    goto LABEL_69;
  v69 = -[IMDServiceSession allowedToOverwriteOriginalGroupIDForChat:](v81, "allowedToOverwriteOriginalGroupIDForChat:", v45);

  if (v69)
  {
    objc_msgSend(v45, "setOriginalGroupID:", v80);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "storeChat:", v45);

    -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](v81, "broadcasterForChatListenersWithBlackholeStatus:", objc_msgSend(v45, "isBlackholed"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "guid");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "chat:updated:", v71, v72);

LABEL_69:
  }
LABEL_70:

  v46 = v86;
LABEL_71:

  return v45;
}

- (BOOL)_allowedToProcessMessageFromToken:(id)a3 fromID:(id)a4 reflectOnly:(BOOL)a5 isInProxyMode:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  char *v30;
  BOOL v31;
  NSObject *v32;
  char *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  const __CFString *v38;
  int v40;
  const char *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v6 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (char *)a4;
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "idsDeviceFromPushToken:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = IMOSLoggingEnabled(v14);
  if ((_DWORD)v15)
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "name");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v40 = 138412290;
      v41 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, " Outgoing message request from %@", (uint8_t *)&v40, 0xCu);

    }
  }
  if (!v13 || a5)
  {
    if (!v13)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v40 = 138412290;
          v41 = v11;
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, " This message was likely from a local device, looking for fromID: %@", (uint8_t *)&v40, 0xCu);
        }

      }
      -[IMDTelephonyServiceSession relayController](self, "relayController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "idsDeviceForFromID:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[IMDTelephonyServiceSession relayController](self, "relayController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_localDeviceSupportsSMS");

    if (v19)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, " This message was destined for me to send out, I am the gatekeeper", (uint8_t *)&v40, 2u);
        }

      }
      -[IMDTelephonyServiceSession relayController](self, "relayController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isSMSRelayEnabled") & 1) != 0)
      {

      }
      else
      {
        v22 = objc_msgSend(v13, "isDefaultPairedDevice");

        if ((v22 & 1) == 0)
          goto LABEL_25;
      }
      -[IMDTelephonyServiceSession relayEnrollmentController](self, "relayEnrollmentController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_allowedDevicesforSMSRelay");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "containsObject:", v25);

      v28 = IMOSLoggingEnabled(v27);
      if (v26)
      {
        if (v28)
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "name");
            v30 = (char *)objc_claimAutoreleasedReturnValue();
            v40 = 138412290;
            v41 = v30;
            _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, " Device %@ is on the allowed list, Telling the block to continue", (uint8_t *)&v40, 0xCu);

          }
        }
        v31 = 1;
        goto LABEL_43;
      }
      if (v28)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "name");
          v33 = (char *)objc_claimAutoreleasedReturnValue();
          v40 = 138412290;
          v41 = v33;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, " Device %@ is on the blockList, sending back a failure", (uint8_t *)&v40, 0xCu);

        }
      }
LABEL_25:
      v31 = 0;
      goto LABEL_43;
    }
  }
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = "Not Nil";
      if (!v13)
        v37 = "Nil";
      v38 = CFSTR("YES");
      if (!v6)
        v38 = CFSTR("NO");
      v40 = 136315394;
      v41 = v37;
      v42 = 2112;
      v43 = v38;
      _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, " This message was not for us to gatekeep, we should reflect it only if it came from one of our devices (senderDevice %s) isInProxyMode %@", (uint8_t *)&v40, 0x16u);
    }

  }
  if (v13)
    v31 = 1;
  else
    v31 = v6;
LABEL_43:

  return v31;
}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a12;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1D14C8FE0;
  v31[3] = &unk_1E922B6D0;
  v31[4] = self;
  v32 = v19;
  v39 = a11;
  v33 = v18;
  v34 = v17;
  v40 = a10;
  v35 = v20;
  v36 = v21;
  v37 = v22;
  v38 = v23;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v17;
  v29 = v18;
  v30 = v19;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v31, 45.0);

}

- (void)sendUnapproveToToken:(id)a3 messageGUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "This device is not on the allowed list, it should not have been trying to send a relay message, sending a message back to it to tell it to not send relay messages in the future", buf, 2u);
    }

  }
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "idsDeviceFromPushToken:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, IMDRelayMessageDictionaryGUIDKey, MEMORY[0x1E0C9AAB0], IMDRelayAuthorizationUnauthorizedDeviceKey, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enrollmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendUnApproveToDevice:extraKeys:", v13, v14);

  v10[2](v10);
}

- (void)handler:(id)a3 outgoingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  IMDTelephonyServiceSession *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  BOOL v41;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a12;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1D14CA9E8;
  v32[3] = &unk_1E922B6D0;
  v24 = self;
  v32[4] = self;
  v33 = v17;
  v40 = a10;
  v34 = v20;
  v35 = v21;
  v36 = v22;
  v37 = v23;
  v38 = v19;
  v39 = v18;
  v41 = a11;
  v25 = v18;
  v26 = v19;
  v27 = v23;
  v28 = v22;
  v29 = v21;
  v30 = v20;
  v31 = v17;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](v24, "_enqueueBlock:withTimeout:", v32, 240.0);

}

- (BOOL)responsibleForMessageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  return v10;
}

- (void)handler:(id)a3 messageIDSent:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v10 = a4;
  v11 = a8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D14CC0B0;
  v14[3] = &unk_1E922B748;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v14, 45.0);

}

- (void)handler:(id)a3 messageIDRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 reflectOnly:(BOOL)a10 storageContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  BOOL v36;
  BOOL v37;
  _QWORD v38[5];
  id v39;

  v28 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1D14CC46C;
  v38[4] = sub_1D14CC47C;
  v39 = 0;
  v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AA0]), "initWithIdentifier:timeout:", CFSTR("IncomingReadReceiptAssertion"), 10.0);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1D14CC484;
  v29[3] = &unk_1E922B770;
  v29[4] = self;
  v23 = v17;
  v30 = v23;
  v24 = v18;
  v31 = v24;
  v25 = v22;
  v32 = v25;
  v36 = a5;
  v26 = v21;
  v33 = v26;
  v37 = a10;
  v27 = v19;
  v34 = v27;
  v35 = v38;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v29, 45.0);

  _Block_object_dispose(v38, 8);
}

- (void)handler:(id)a3 messageIDSendFailure:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D14CC878;
  v20[3] = &unk_1E922B798;
  v20[4] = self;
  v21 = v12;
  v22 = v14;
  v23 = v13;
  v24 = v15;
  v16 = v15;
  v17 = v13;
  v18 = v14;
  v19 = v12;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v20, 45.0);

}

- (void)handler:(id)a3 localFileResponse:(id)a4 storageContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ relay received remote file response %@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[IMDTelephonyServiceSession attachmentController](self, "attachmentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteFileResponse:", v9);

}

- (void)handler:(id)a3 localFileRequest:(id)a4 storageContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ relay received remote file request %@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[IMDTelephonyServiceSession attachmentController](self, "attachmentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remotefileRequest:attempts:", v9, 0);

}

- (void)handler:(id)a3 localIncommingMessage:(id)a4 storageContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ relay received Local incomming Message", (uint8_t *)&v15, 0xCu);

    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryIncomingDictKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _processReceivedDictionary:storageContext:receivedViaRelay:withCompletionBlock:](self, "_processReceivedDictionary:storageContext:receivedViaRelay:withCompletionBlock:", v14, v10, 1, 0);

}

- (void)handler:(id)a3 localIncomingDownloadMessage:(id)a4 storageContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ relay received Local incomming download Message", (uint8_t *)&v15, 0xCu);

    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryIncomingDictKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _processReceivedDictionary:storageContext:receivedViaRelay:withCompletionBlock:](self, "_processReceivedDictionary:storageContext:receivedViaRelay:withCompletionBlock:", v14, v10, 1, 0);

}

- (void)handler:(id)a3 localOutgoingDownloadMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "%@ relay received Local outgoing Download Message", buf, 0xCu);

    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryOutgoingDictKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v18) = 1;
  LOBYTE(v18) = a5;
  -[IMDTelephonyServiceSession handler:outgoingDownloadMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingDownloadMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", v10, v16, 0, 0, 0, v17, 0, v18, v12);

}

- (void)handler:(id)a3 localOutgoingMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "%@ relay received Local outgoing Message", buf, 0xCu);

    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryOutgoingDictKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v18) = 1;
  LOBYTE(v18) = a5;
  -[IMDTelephonyServiceSession handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", 0, v16, 0, 0, 0, v17, 0, v18, v12);

}

- (void)handler:(id)a3 localMessageSent:(id)a4 storageContext:(id)a5
{
  -[IMDTelephonyServiceSession handler:messageIDSent:toIdentifier:fromIdentifier:timeStamp:storageContext:](self, "handler:messageIDSent:toIdentifier:fromIdentifier:timeStamp:storageContext:", 0, a4, 0, 0, 0, a5);
}

- (void)handler:(id)a3 localMessageRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 storageContext:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[IMDTelephonyServiceSession handler:messageIDRead:readByMe:timeStamp:toIdentifier:fromIdentifier:fromToken:reflectOnly:storageContext:](self, "handler:messageIDRead:readByMe:timeStamp:toIdentifier:fromIdentifier:fromToken:reflectOnly:storageContext:", 0, a4, a5, a6, 0, 0, 0, v7, a7);
}

- (void)handler:(id)a3 localMessageError:(id)a4 storageContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D14CD3DC;
  v11[3] = &unk_1E922B748;
  v11[4] = self;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v11, 45.0);

}

- (BOOL)_canLocallySendWithPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "__im_containsPhoneNumber:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_chatForGroupID:(id)a3 originalGroupID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "newestExistingChatWithOriginalGroupID:onService:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "existingChatsWithGroupID:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v26 = v7;
      v27 = v6;
      v18 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v20, "serviceName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession service](self, "service");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "internalName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "isEqualToString:", v23);

          if ((v24 & 1) != 0)
          {
            v12 = v20;
            goto LABEL_13;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v17)
          continue;
        break;
      }
      v12 = 0;
LABEL_13:
      v7 = v26;
      v6 = v27;
      v11 = 0;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)handler:(id)a3 incomingGroupMutationMessage:(id)a4 timeStamp:(id)a5 storageContext:(id)a6 fromToken:(id)a7 fromID:(id)a8 isInProxyMode:(BOOL)a9
{
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
  BOOL v22;

  v12 = a4;
  v13 = a7;
  v14 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D14CD884;
  v18[3] = &unk_1E922B810;
  v18[4] = self;
  v19 = v13;
  v22 = a9;
  v20 = v14;
  v21 = v12;
  v15 = v12;
  v16 = v14;
  v17 = v13;
  -[IMDTelephonyServiceSession _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v18, 45.0);

}

- (BOOL)_sosReplicationDisabledByServerBag
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disable-sos-replication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "BOOLValue"))
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)_periodicReplicationTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("forced-replication-interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 14400.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    if (v5 != 0.0)
    {
      if (_IMWillLog())
      {
        objc_msgSend(v3, "doubleValue");
        v9 = v6;
        _IMAlwaysLog();
      }
      objc_msgSend(v3, "doubleValue", v9);
      v4 = v7;
    }
  }

  return v4;
}

- (BOOL)_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  -[IMDTelephonyServiceSession _periodicReplicationTimeInterval](self, "_periodicReplicationTimeInterval");
  v6 = v5;
  if (v5 <= 0.00000011920929)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v10 = 0;
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v4);
    v9 = v8;

    v10 = v9 > v6;
    if (_IMWillLog())
      _IMAlwaysLog();
  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v10 = 1;
  }

  return v10;
}

- (BOOL)_replicationDisabledByServerBag
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disable-hybrid-groups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "BOOLValue"))
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSOSAlertingEnabled");

  if (v11)
    v12 = !v5;
  else
    v12 = 1;
  if (v12
    || -[IMDTelephonyServiceSession _sosReplicationDisabledByServerBag](self, "_sosReplicationDisabledByServerBag"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isPriusEnabled");

    if (v14 && !-[IMDTelephonyServiceSession _replicationDisabledByServerBag](self, "_replicationDisabledByServerBag"))
    {
      if (v9 && (objc_msgSend(v9, "_appearsToBePhoneNumber") & 1) != 0)
      {
        v15 = -[IMDTelephonyServiceSession replicationRequirementsSatisfiedForPhoneNumber:simID:](self, "replicationRequirementsSatisfiedForPhoneNumber:simID:", v9, 0);
        goto LABEL_17;
      }
      if (_IMWillLog())
      {
        -[IMDServiceSession account](self, "account");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog();

      }
    }
    v15 = 0;
    goto LABEL_17;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  v15 = 1;
LABEL_17:

  return v15;
}

- (BOOL)isOutgoingReplicationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReplicationEnabled");

  return v3;
}

- (id)replicationPhoneNumbers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dominentPhoneNumberAlias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    IMChatCanonicalIDSIDsForAddress();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stripFZIDPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v7);
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)outgoingReplicationCallerIDForChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v5, objc_msgSend(v4, "style"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_IMWillLog())
  {
    v33 = v6;
    v34 = v7;
    _IMAlwaysLog();
  }
  -[IMDTelephonyServiceSession replicationPhoneNumbers](self, "replicationPhoneNumbers", v33, v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v14, "loginID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1D17EA374]();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        IMChatCanonicalIDSIDsForAddress();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_stripFZIDPrefix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "containsObject:", v18))
        {
          if (_IMWillLog())
            _IMAlwaysLog();
          v31 = v14;

          v30 = v9;
          goto LABEL_34;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v11)
        continue;
      break;
    }
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = v9;
  v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v36)
  {
    v20 = *(_QWORD *)v45;
    v38 = v19;
    v39 = v6;
    v35 = *(_QWORD *)v45;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v19);
        v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v21);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v37 = v22;
        objc_msgSend(v22, "aliases");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v41 != v26)
                objc_enumerationMutation(v23);
              IMChatCanonicalIDSIDsForAddress();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "_stripFZIDPrefix");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v8, "containsObject:", v29))
              {
                if (_IMWillLog())
                  _IMAlwaysLog();
                v31 = v37;

                v30 = v38;
                v6 = v39;
                goto LABEL_34;
              }

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            if (v25)
              continue;
            break;
          }
        }

        ++v21;
        v20 = v35;
        v19 = v38;
        v6 = v39;
      }
      while (v21 != v36);
      v36 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v36);
  }

  if (_IMWillLog())
  {
    objc_msgSend(v8, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();
    v31 = 0;
LABEL_34:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)_shouldReplicateMessageItem:(id)a3 chatStyle:(unsigned __int8)a4 lastKnownReplicationDate:(id)a5 callerID:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  int v17;
  BOOL v18;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSOSAlertingEnabled");

  if (v14 && objc_msgSend(v10, "isSOS"))
  {
    v15 = -[IMDTelephonyServiceSession _sosReplicationDisabledByServerBag](self, "_sosReplicationDisabledByServerBag");
LABEL_10:
    v18 = !v15;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPriusEnabled");

  v18 = 0;
  if (v8 == 43 && v17)
  {
    if (!-[IMDTelephonyServiceSession replicationRequiredForFeaturesUsedByMessageItem:](self, "replicationRequiredForFeaturesUsedByMessageItem:", v10)&& !-[IMDTelephonyServiceSession _shouldForceReplicationForStaleChatWithLastKnownReplicationDate:](self, "_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:", v11)|| !-[IMDTelephonyServiceSession replicationRequirementsSatisfiedForPhoneNumber:simID:](self, "replicationRequirementsSatisfiedForPhoneNumber:simID:", v12, 0))
    {
      v18 = 0;
      goto LABEL_12;
    }
    v15 = -[IMDTelephonyServiceSession _replicationDisabledByServerBag](self, "_replicationDisabledByServerBag");
    goto LABEL_10;
  }
LABEL_12:

  return v18;
}

- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  return 0;
}

- (id)_replicatedMessageGUIDToReleaseFromMessageDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayMessageDictionaryAttemptedOutgoingReplicationKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v4, "BOOLValue")
    && (objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayMessageItemDictionary),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", IMDRelayMessageItemDictionaryGUIDKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_deferredReplicatedMessageReleaseWithAllowedMessage:(id)a3 outgoingProxyBlock:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  IMDTelephonyServiceSession *v11;
  id v12;

  v6 = a4;
  -[IMDTelephonyServiceSession _replicatedMessageGUIDToReleaseFromMessageDictionary:](self, "_replicatedMessageGUIDToReleaseFromMessageDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1578060;
    block[3] = &unk_1E92290F8;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

- (BOOL)replicateMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 lastKnownReplicationDate:(id)a6 callerID:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  dispatch_time_t v27;
  BOOL v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  IMDTelephonyServiceSession *v36;
  id v37;
  char v38;
  _QWORD v39[3];

  v9 = a5;
  v39[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isReplicationEnabled");

  if (!v17)
  {
LABEL_12:
    v28 = 0;
    goto LABEL_17;
  }
  if (!-[IMDTelephonyServiceSession _shouldReplicateMessageItem:chatStyle:lastKnownReplicationDate:callerID:](self, "_shouldReplicateMessageItem:chatStyle:lastKnownReplicationDate:callerID:", v12, v9, v14, v15))
  {
    if (_IMWillLog())
    {
      objc_msgSend(v12, "guid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    goto LABEL_12;
  }
  -[IMDServiceSession service](self, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsCapability:", *MEMORY[0x1E0D38E38]);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReplicatedFallbackGUIDs:", v22);

  }
  v23 = IMGetCachedDomainIntForKey();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isInternalInstall");

  v26 = _IMWillLog();
  if (v25 && v23 >= 1)
  {
    if (v26)
    {
      objc_msgSend(v12, "guid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    v27 = dispatch_time(0, 1000000000 * v23);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15784F4;
    block[3] = &unk_1E922BA10;
    v35 = v12;
    v36 = self;
    v37 = v13;
    v38 = v9;
    dispatch_after(v27, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v26)
    {
      objc_msgSend(v12, "guid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    -[IMDServiceSession replicationProxy](self, "replicationProxy", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sendMessage:toChat:style:", v12, v13, v9);

  }
  v28 = 1;
LABEL_17:

  return v28;
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v17 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPriusEnabled");

  if (v13)
  {
    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v10, v6, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6 == 43
      && -[IMDTelephonyServiceSession replicationRequirementsSatisfiedForPhoneNumber:simID:](self, "replicationRequirementsSatisfiedForPhoneNumber:simID:", v15, 0))
    {
      -[IMDServiceSession replicationProxy](self, "replicationProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendRepositionStickerMessage:chatIdentifier:accountID:style:", v17, v10, v11, 43);

    }
  }

}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  v10 = a8;
  v32 = a3;
  v31 = a4;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isPriusEnabled");

  if (v20)
  {
    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v16, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v16, v10, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v10 == 43
      && -[IMDTelephonyServiceSession replicationRequirementsSatisfiedForPhoneNumber:simID:](self, "replicationRequirementsSatisfiedForPhoneNumber:simID:", v30, 0))
    {
      -[IMDServiceSession replicationProxy](self, "replicationProxy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:", v32, v31, a5, a6, v16, 43, v17, v18);

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isPriusCompatibilityEnabled");

    if (v24)
    {
      v25 = (void *)objc_msgSend(v32, "copyForBackwardsCompatibility");
      objc_msgSend(v25, "setBody:", v18);
      -[IMDTelephonyServiceSession relayController](self, "relayController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "_localDeviceSupportsSMS");

      if (v27)
      {
        if (_IMWillLog())
        {
          v29 = v25;
          _IMAlwaysLog();
        }
        -[IMDTelephonyServiceSession sendMessageFromIMMessageItem:forChat:chat:style:](self, "sendMessageFromIMMessageItem:forChat:chat:style:", v25, v16, v21, v10, v29);
      }
      else if (!-[IMDTelephonyServiceSession shouldExcludeChatFromRelay:](self, "shouldExcludeChatFromRelay:", v21))
      {
        -[IMDTelephonyServiceSession relayController](self, "relayController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sendEditedMessage:toChat:fromCallerID:backwardCompatabilityText:", v32, v21, v30, v18);

      }
    }

  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  int v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v8 = a6;
  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPriusEnabled");

  if (v8 == 43 && v16)
  {
    -[IMDServiceSession replicationProxy](self, "replicationProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendGroupPhotoUpdate:toChatID:identifier:style:account:", v18, v12, v13, 43, v14);

  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  _BOOL8 v8;
  int v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v8 = a8;
  v10 = a6;
  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isPriusEnabled");

  if (v10 == 43 && v18)
  {
    -[IMDServiceSession replicationProxy](self, "replicationProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "retryGroupPhotoUpload:toChatID:identifier:style:account:isPhotoRefresh:", v20, v14, v15, 43, v16, v8);

  }
}

- (void)relayDisplayNameChange:(id)a3 forChat:(id)a4 fromID:(id)a5 messageID:(id)a6 didOccurLocally:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  IMDRelayGroupDisplayNameMutationMessage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  IMDRelayGroupDisplayNameMutationMessage *v24;

  v23 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = [IMDRelayGroupDisplayNameMutationMessage alloc];
  -[IMDServiceSession service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internalName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "groupID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "originalGroupID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
  LOWORD(v22) = 256;
  v24 = -[IMDRelayGroupDisplayNameMutationMessage initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:](v15, "initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:", v14, 0, v17, v18, v19, v20, v12, v22);

  -[IMDTelephonyServiceSession relayController](self, "relayController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reflectGroupMutation:callerID:didOccurLocally:", v24, v12, v23);

}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)IMDTelephonyServiceSession;
  v27 = v16;
  -[IMDServiceSession updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:](&v28, sel_updateDisplayName_fromDisplayName_fromID_forChatID_identifier_style_messageID_, v15, v16, v17, v18, v19, v9, v20);
  -[IMDServiceSession service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "supportsCapability:", *MEMORY[0x1E0D38DF0]);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isPriusEnabled");

  if ((_DWORD)v9 == 43 && v24 && (v22 & 1) == 0)
  {
    -[IMDServiceSession replicationProxy](self, "replicationProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:", v15, v27, v17, v18, v19, v9, v20);

  }
  if (v22)
  {
    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v19, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      -[IMDTelephonyServiceSession relayDisplayNameChange:forChat:fromID:messageID:didOccurLocally:](self, "relayDisplayNameChange:forChat:fromID:messageID:didOccurLocally:", v15, v26, v17, v20, 1);

  }
}

- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isSOS") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v4, "associatedMessageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    if (_IMWillLog())
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(v4, "expressiveSendStyleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (_IMWillLog())
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(v4, "balloonBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    if (_IMWillLog())
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(v4, "body");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IMDTelephonyServiceSession _replicationRequiredForFeaturesUsedByMessageBody:](self, "_replicationRequiredForFeaturesUsedByMessageBody:", v11);

  if (v12)
  {
    if (_IMWillLog())
    {
LABEL_13:
      objc_msgSend(v4, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
LABEL_14:
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3
{
  return 1;
}

- (BOOL)_replicationRequiredForFeaturesUsedByMessageBody:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v5 = objc_msgSend(v4, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1579014;
  v7[3] = &unk_1E922DA80;
  v7[5] = v8;
  v7[6] = &v9;
  v7[4] = self;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return (char)self;
}

- (BOOL)replicationRequiredForMultipleMessageParts
{
  return 1;
}

- (void)_processReceivedDictionaryInBlastDoor:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  IMDTelephonyServiceSession *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", IMDCTMessageDictionaryGUIDKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D15D228C;
  v18[3] = &unk_1E922F0C0;
  v19 = v13;
  v20 = self;
  v21 = v10;
  v22 = v11;
  v24 = a5;
  v23 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  +[IMBlastdoor sendSMSDictionary:withCompletionBlock:](IMBlastdoor, "sendSMSDictionary:withCompletionBlock:", v16, v18);

}

- (void)_releasePendingMessagesAndProcessReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[IMPendingReplicatedMessageCache sharedCache](IMPendingReplicatedMessageCache, "sharedCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "internalName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D15D28E0;
  v20[3] = &unk_1E922F0E8;
  v20[4] = self;
  v21 = v10;
  v24 = a5;
  v22 = v11;
  v23 = v12;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v13, "releasePendingMessageWithGUID:serviceName:chat:completion:", v14, v16, 0, v20);

}

- (BOOL)_allowedToGeneratePreviewForTransfer:(id)a3 smsMessage:(id)a4
{
  return 1;
}

- (void)_generatePreviewForTransfer:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD aBlock[4];
  id v19;

  v5 = a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D15D2AB8;
  aBlock[3] = &unk_1E922AA78;
  v7 = v5;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Generating preview for attachment part", v17, 2u);
    }

  }
  v10 = objc_msgSend(v6, "isFromMe");
  v11 = (void *)MEMORY[0x1E0D39A10];
  objc_msgSend(v6, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v11, "fromMeContextWithServiceName:", v12);
  else
    objc_msgSend(v11, "untrustedContextWithServiceName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39CD8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generatePreviewForTransfer:attachmentPath:balloonBundleID:senderContext:completionBlock:", v7, v15, v16, v13, v8);

}

- (id)_countryCodeForIncomingTextMessage:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;

  v3 = a3;
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "originatedDeviceSIM");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v3, "originatedDeviceNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x1E0D39730];
    objc_msgSend(v3, "originatedDeviceNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originatedDeviceSIM");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "IMCountryCodeForPhoneNumber:simID:", v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_10:
      v5 = v11;

      goto LABEL_11;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("Missing Destination Information"), 0, CFSTR("DSDS Privacy Violation"), CFSTR("Selected a default country code instead of being aware of the number a message was received on."));

    IMCountryCodeForIncomingTextMessage();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("us");
    if (v13)
      v15 = (__CFString *)v13;
    v11 = v15;

    goto LABEL_10;
  }
  objc_msgSend(v3, "countryCode");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

- (BOOL)incomingMessageHasTooManyRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "originatedDeviceSIM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatedDeviceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMDTelephonyServiceSession maxRecipientsForPhoneNumber:simID:](self, "maxRecipientsForPhoneNumber:simID:", v6, v5);
  v8 = v7;
  if (v7 == 0x7FFFFFFF || !v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v19 = 134217984;
        v20 = v8;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Carrier bundle value for maxReceipients was 0 or INT_MAX (%llu), falling back to iMessage maximum", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("md-max-chat-participants-incoming"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v8 = objc_msgSend(v11, "unsignedIntegerValue");
    else
      v8 = 120;

  }
  objc_msgSend(v4, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 > v8 && IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "recipients");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      v19 = 134218240;
      v20 = v17;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Filtering message due to excessive recipient count: %llu maxRecipients: %llu", (uint8_t *)&v19, 0x16u);

    }
  }

  return v13 > v8;
}

- (void)_processReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  id v8;
  IMDTelephonyIncomingMessageContext *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  int v35;
  IMDTelephonyIncomingMessageContext *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  const void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  const void *v78;
  const void *v79;
  int IsItemBlocked;
  uint64_t v81;
  _BOOL4 v82;
  const void *v83;
  NSObject *v84;
  const __CFString *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  _BOOL8 v89;
  NSObject *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  NSObject *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  __CFString *v136;
  NSObject *v137;
  void *v138;
  _BOOL4 v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  NSObject *v147;
  id v148;
  uint64_t v149;
  void *v150;
  void *v151;
  BOOL v152;
  NSObject *v153;
  id v154;
  void *v155;
  uint64_t v156;
  NSObject *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  IMDSMSPart *v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t i;
  void *v167;
  IMDSMSTextPart *v168;
  void *v169;
  IMDSMSTextPart *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t j;
  void *v176;
  IMDSMSAttachmentPart *v177;
  void *v178;
  IMDSMSAttachmentPart *v179;
  uint64_t v180;
  NSObject *v181;
  void *v182;
  id v183;
  NSObject *v184;
  id v185;
  void *v186;
  char v187;
  uint64_t v188;
  NSObject *v189;
  void *v190;
  void *v191;
  void *v192;
  NSObject *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  NSObject *v197;
  uint64_t v198;
  uint64_t v199;
  NSObject *v200;
  id v201;
  void *v202;
  void *v203;
  uint64_t v204;
  NSObject *v205;
  uint64_t v206;
  NSObject *v207;
  int v208;
  uint64_t v209;
  NSObject *v210;
  uint64_t v211;
  NSObject *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  NSObject *v216;
  uint64_t v217;
  NSObject *v218;
  int v219;
  id v220;
  void *v221;
  void *v222;
  id v223;
  NSObject *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  int v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  void *v240;
  id v241;
  id v242;
  NSObject *v243;
  uint64_t v244;
  uint64_t v245;
  NSObject *v246;
  uint64_t v247;
  NSObject *v248;
  id v249;
  uint64_t v250;
  NSObject *v251;
  id v252;
  uint64_t v253;
  NSObject *v254;
  id v255;
  NSObject *v256;
  id v257;
  id v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  NSObject *v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  NSObject *v270;
  void *v271;
  void *v272;
  void *v273;
  uint64_t v274;
  NSObject *v275;
  void *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  NSObject *v282;
  void *v283;
  void *v284;
  uint64_t v285;
  void *v286;
  NSObject *v287;
  id v288;
  void *v289;
  uint64_t v290;
  NSObject *v291;
  id v292;
  void *v293;
  NSObject *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  NSObject *v300;
  id v301;
  void *v302;
  void *v303;
  int v304;
  uint64_t v305;
  NSObject *v306;
  uint64_t v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  uint64_t v313;
  id v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  uint64_t v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  int v331;
  IMDTelephonyIncomingMessageContext *v332;
  NSObject *v333;
  void *v334;
  uint64_t v335;
  const void *v336;
  const void *v337;
  uint64_t v338;
  uint64_t v339;
  NSObject *v340;
  uint64_t v341;
  NSObject *v342;
  NSObject *v343;
  uint64_t v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  uint64_t v351;
  uint64_t v352;
  IMDTelephonyIncomingMessageContext *v353;
  NSObject *v354;
  _BOOL4 v355;
  const __CFString *v356;
  uint64_t v357;
  NSObject *v358;
  uint64_t v359;
  NSObject *v360;
  uint64_t v361;
  NSObject *v362;
  void *v363;
  NSObject *v364;
  uint64_t v365;
  NSObject *v366;
  void *v367;
  void *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  NSObject *v374;
  void *v375;
  void *v376;
  _BOOL4 v377;
  id v378;
  void *v379;
  _BOOL4 v380;
  id v381;
  void *v382;
  _BOOL4 v383;
  id v384;
  void *v385;
  const void *v386;
  void *v387;
  uint64_t v388;
  NSObject *v389;
  uint64_t v390;
  NSObject *v391;
  void *v392;
  NSObject *v393;
  uint64_t v394;
  NSObject *v395;
  void *v396;
  NSObject *v397;
  uint64_t v398;
  NSObject *v399;
  id v400;
  uint64_t v401;
  NSObject *v402;
  uint64_t v403;
  NSObject *v404;
  void *v405;
  uint64_t v406;
  NSObject *v407;
  void *v408;
  __CFString *v409;
  void *v410;
  uint64_t v411;
  void *v412;
  const __CFString *v413;
  void *v414;
  void *v415;
  const __CFString *v416;
  IMDTelephonyIncomingMessageContext *v417;
  void *v418;
  void *v419;
  void *v420;
  char v421;
  void *v422;
  void *v423;
  __CFString *v424;
  void *v425;
  uint64_t v426;
  void *v427;
  const __CFString *v428;
  void *v429;
  void *v430;
  const __CFString *v431;
  NSObject *v432;
  void *v433;
  void *v434;
  _BOOL4 v435;
  id v436;
  void *v437;
  void *v438;
  void *v439;
  char v440;
  void *v441;
  void *v442;
  void *v443;
  uint64_t v444;
  void *v445;
  const __CFString *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  IMDTelephonyIncomingMessageContext *v453;
  uint64_t v454;
  NSObject *v455;
  id v456;
  void *v457;
  uint64_t v458;
  NSObject *v459;
  void *v460;
  id v461;
  NSObject *v462;
  _BOOL4 v463;
  uint64_t v464;
  const __CFString *v465;
  uint64_t v466;
  void *v467;
  void *v468;
  void *v469;
  uint64_t v470;
  int v471;
  IMDTelephonyIncomingMessageContext *v472;
  NSObject *v473;
  id v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  uint64_t v479;
  NSObject *v480;
  void *v481;
  uint64_t v482;
  NSObject *v483;
  id v484;
  uint64_t v485;
  NSObject *v486;
  _BOOL4 v487;
  const __CFString *v488;
  NSObject *v489;
  void *v490;
  IMDTelephonyIncomingMessageContext *v491;
  id v492;
  id v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  uint64_t v499;
  int v500;
  id v501;
  id v502;
  void *v503;
  void *v504;
  id obj;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  id v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  id v515;
  _BOOL4 v516;
  uint64_t v517;
  id v518;
  id v519;
  id v520;
  uint64_t v521;
  id v522;
  id cf1;
  void *cf1a;
  CFTypeRef cf1b;
  CFTypeRef cf1c;
  id v527;
  id v528;
  id v529;
  id v530;
  void *v531;
  uint64_t v532;
  uint64_t v533;
  void *v535;
  IMDTelephonyIncomingMessageContext *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  id v541;
  id v542;
  void *v543;
  _QWORD v544[4];
  IMDTelephonyIncomingMessageContext *v545;
  IMDTelephonyServiceSession *v546;
  id v547;
  id v548;
  _BYTE *v549;
  int v550;
  BOOL v551;
  id v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  id v573;
  id v574;
  _QWORD v575[4];
  id v576;
  id v577;
  id v578;
  _QWORD aBlock[4];
  id v580;
  id v581;
  IMDTelephonyServiceSession *v582;
  IMDTelephonyIncomingMessageContext *v583;
  id v584;
  _BYTE *v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  uint8_t v602[4];
  _BYTE v603[18];
  _BYTE v604[128];
  id v605;
  _BYTE v606[128];
  _BYTE v607[128];
  _BYTE v608[128];
  _BYTE v609[128];
  void *v610;
  _BYTE v611[128];
  _BYTE v612[128];
  _BYTE v613[128];
  _BYTE v614[128];
  void *v615;
  _BYTE buf[24];
  uint64_t (*v617)(uint64_t, uint64_t);
  _BYTE v618[20];
  __int16 v619;
  void *v620;
  uint64_t v621;

  v516 = a5;
  v621 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v515 = a4;
  v518 = a6;
  v9 = objc_alloc_init(IMDTelephonyIncomingMessageContext);
  if (objc_msgSend(v8, "has_sendEnabled"))
    v10 = objc_msgSend(v8, "sendEnabled");
  else
    v10 = 1;
  v536 = v9;
  -[IMDTelephonyIncomingMessageContext setIsSendEnabled:](v9, "setIsSendEnabled:", v10);
  v535 = v8;
  objc_msgSend(v8, "originatedDeviceNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setMyNumberString:](v536, "setMyNumberString:", v11);

  objc_msgSend(v8, "originatedDeviceSIM");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setMySIMIDString:](v536, "setMySIMIDString:", v12);

  objc_msgSend(v8, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setSender:](v536, "setSender:", v13);

  objc_msgSend(v8, "sender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setSenderUnformatted:](v536, "setSenderUnformatted:", v14);

  -[IMDTelephonyServiceSession _countryCodeForIncomingTextMessage:](self, "_countryCodeForIncomingTextMessage:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setCountryCode:](v536, "setCountryCode:", v15);

  -[IMDTelephonyIncomingMessageContext setCapability:](v536, "setCapability:", objc_msgSend(v8, "iMessageCapability"));
  objc_msgSend(v8, "originatedDeviceNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setOriginalAlias:](v536, "setOriginalAlias:", v16);

  -[IMDTelephonyIncomingMessageContext setWasRelayed:](v536, "setWasRelayed:", v516);
  -[IMDServiceSession service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsCapability:", *MEMORY[0x1E0D38DF0]);

  if (v18)
  {
    objc_msgSend(v8, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyIncomingMessageContext setDisplayName:](v536, "setDisplayName:", v19);

  }
  -[IMDServiceSession service](self, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "supportsCapability:", *MEMORY[0x1E0D38DC8]);

  if (v21)
  {
    objc_msgSend(v8, "groupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyIncomingMessageContext setGroupID:](v536, "setGroupID:", v22);

    objc_msgSend(v8, "originalGroupID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyIncomingMessageContext setOriginalGroupID:](v536, "setOriginalGroupID:", v23);

  }
  objc_msgSend(v8, "version");
  v517 = objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24 | v517;

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0D39920], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "acquireAssertionToUnsuspendProcess");

    v29 = objc_msgSend(v8, "trackMessage");
    objc_msgSend(v8, "GUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (uint64_t)v30;
    v32 = objc_msgSend(v30, "length");
    if (!v32)
    {
      StringGUID();
      v31 = objc_claimAutoreleasedReturnValue();

    }
    v514 = (void *)v31;
    if (v31)
      v33 = v29;
    else
      v33 = 0;
    if (v33 == 1)
    {
      +[IMMessagesToTrack sharedInstance](IMMessagesToTrack, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addMessagesID:", v31);

    }
    v35 = IMOSLoggingEnabled(v32);
    v36 = v536;
    if (v35)
    {
      OSLogHandleForIMEventCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v535, "items");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");
        v41 = objc_msgSend(v535, "type");
        objc_msgSend(v535, "countryCode");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v535, "serviceCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2048;
        v617 = (uint64_t (*)(uint64_t, uint64_t))v41;
        *(_WORD *)v618 = 2112;
        *(_QWORD *)&v618[2] = v42;
        *(_WORD *)&v618[10] = 2112;
        *(_QWORD *)&v618[12] = v43;
        v619 = 2112;
        v620 = v44;
        _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "received message with sender: %@, %lu parts, type: %ld  msgCountryCode: %@ service center: %@  incoming code: %@", buf, 0x3Eu);

      }
      v36 = v536;
    }
    -[IMDTelephonyIncomingMessageContext sender](v36, "sender");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length") == 0;

    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E92346B0, CFSTR("SMSLocalizable"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDTelephonyIncomingMessageContext setSender:](v536, "setSender:", v48);

      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDTelephonyIncomingMessageContext setSenderUnformatted:](v536, "setSenderUnformatted:", v49);

    }
    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "_appearsToBePhoneNumber");

      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v52)
      {
        -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();

        IMNormalizedPhoneNumberForCFPhoneNumberRef();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = IMOSLoggingEnabled(v57);
        if ((_DWORD)v58)
        {
          OSLogHandleForIMFoundationCategory();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v56;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v60;
            _os_log_impl(&dword_1D1413000, v59, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", buf, 0x16u);

          }
        }
        v61 = IMOSLoggingEnabled(v58);
        if ((_DWORD)v61)
        {
          OSLogHandleForIMFoundationCategory();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v63;
            _os_log_impl(&dword_1D1413000, v62, OS_LOG_TYPE_INFO, "    => Country code: %@", buf, 0xCu);

          }
        }
        if (IMOSLoggingEnabled(v61))
        {
          OSLogHandleForIMFoundationCategory();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v57;
            _os_log_impl(&dword_1D1413000, v64, OS_LOG_TYPE_INFO, "      => Normalized: %@", buf, 0xCu);
          }

        }
        if (v56)
          CFRelease(v56);
        v65 = objc_msgSend(v57, "length");
      }
      else
      {
        v66 = objc_msgSend(v53, "_appearsToBeEmail");

        if (!v66)
          goto LABEL_50;
        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        IMNormalizeFormattedString();
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = objc_msgSend(v57, "length");
      }
      if (v65)
        -[IMDTelephonyIncomingMessageContext setSender:](v536, "setSender:", v57);

    }
LABEL_50:
    if (!IMShouldHandleInternalPhishingAttempts())
      goto LABEL_62;
    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMStringIsEmail())
    {
      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v615 = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v615, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if ((IMDAreAllAliasesUnknown() & 1) != 0)
      {
        v71 = IMGetDomainBoolForKey();

        if ((v71 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v72))
          {
            OSLogHandleForIMFoundationCategory();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v74;
              _os_log_impl(&dword_1D1413000, v73, OS_LOG_TYPE_INFO, "*** Blocking likely phishing SMS message from sender: %@", buf, 0xCu);

            }
          }
          v75 = v514;
          if (!v518)
            goto LABEL_624;
          goto LABEL_88;
        }
LABEL_62:
        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
        v76 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "_stripFZIDPrefix");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
        if (v78)
        {
          v79 = (const void *)CMFItemCreateWithPhoneNumber();
          IsItemBlocked = CMFBlockListIsItemBlocked();
          CFRelease(v78);
          if (v79)
          {
            CFRelease(v79);
            if (IsItemBlocked)
            {
LABEL_65:
              v82 = 1;
LABEL_69:
              if (IMOSLoggingEnabled(v81))
              {
                OSLogHandleForIMFoundationCategory();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                {
                  v85 = CFSTR("NO");
                  if (v82)
                    v85 = CFSTR("YES");
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v76;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v85;
                  _os_log_impl(&dword_1D1413000, v84, OS_LOG_TYPE_INFO, "filtering message for handle: %@ = %@", buf, 0x16u);
                }

              }
              if (v82)
              {
                if (IMOSLoggingEnabled(v86))
                {
                  OSLogHandleForIMFoundationCategory();
                  v87 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                  {
                    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v88;
                    _os_log_impl(&dword_1D1413000, v87, OS_LOG_TYPE_INFO, "*** Blocking message from sender: %@", buf, 0xCu);

                  }
                }
                v75 = v514;
                if (!v518)
                  goto LABEL_624;
                goto LABEL_88;
              }
              v89 = -[IMDTelephonyServiceSession incomingMessageHasTooManyRecipients:](self, "incomingMessageHasTooManyRecipients:", v535);
              if (v89)
              {
                if (IMOSLoggingEnabled(v89))
                {
                  OSLogHandleForIMFoundationCategory();
                  v90 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                  {
                    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v91;
                    _os_log_impl(&dword_1D1413000, v90, OS_LOG_TYPE_INFO, "*** Blocking message with too many participants from sender: %@", buf, 0xCu);

                  }
                }
                v75 = v514;
                if (!v518)
                  goto LABEL_624;
LABEL_88:
                (*((void (**)(id, _QWORD, void *, _QWORD))v518 + 2))(v518, 0, v75, 0);
LABEL_623:
                v75 = v514;
LABEL_624:

                goto LABEL_625;
              }
              if (objc_msgSend(v535, "type"))
                v500 = 0;
              else
                v500 = objc_msgSend(v535, "replaceMessage");
              v92 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v535, "items");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v537 = (void *)objc_msgSend(v92, "initWithCapacity:", objc_msgSend(v93, "count"));

              v94 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v535, "items");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v543 = (void *)objc_msgSend(v94, "initWithCapacity:", objc_msgSend(v95, "count"));

              v96 = objc_alloc(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v535, "items");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v541 = (id)objc_msgSend(v96, "initWithCapacity:", objc_msgSend(v97, "count"));

              v502 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
              v501 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v600 = 0u;
              v601 = 0u;
              v598 = 0u;
              v599 = 0u;
              objc_msgSend(v535, "items");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v598, v614, 16);
              v507 = v98;
              if (!v98)
              {
                v503 = 0;
                goto LABEL_292;
              }
              v503 = 0;
              v506 = *(_QWORD *)v599;
              v499 = *MEMORY[0x1E0D375F8];
              while (1)
              {
                v99 = 0;
                do
                {
                  if (*(_QWORD *)v599 != v506)
                  {
                    v100 = v99;
                    objc_enumerationMutation(obj);
                    v99 = v100;
                  }
                  v508 = v99;
                  v101 = *(void **)(*((_QWORD *)&v598 + 1) + 8 * v99);
                  v102 = IMOSLoggingEnabled(v98);
                  if ((_DWORD)v102)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v103 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D1413000, v103, OS_LOG_TYPE_INFO, "  Part:", buf, 2u);
                    }

                  }
                  v104 = IMOSLoggingEnabled(v102);
                  if ((_DWORD)v104)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v105 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v101, "contentType");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v106;
                      _os_log_impl(&dword_1D1413000, v105, OS_LOG_TYPE_INFO, "      content type: %@", buf, 0xCu);

                    }
                  }
                  v107 = IMOSLoggingEnabled(v104);
                  if ((_DWORD)v107)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v108 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v101, "contentId");
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v109;
                      _os_log_impl(&dword_1D1413000, v108, OS_LOG_TYPE_INFO, "        content ID: %@", buf, 0xCu);

                    }
                  }
                  if (IMOSLoggingEnabled(v107))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v110 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v101, "contentLocation");
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v111;
                      _os_log_impl(&dword_1D1413000, v110, OS_LOG_TYPE_INFO, "  content location: %@", buf, 0xCu);

                    }
                  }
                  objc_msgSend(v101, "contentId");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  v512 = SMSCopySanitizedContentID(v112);

                  objc_msgSend(v101, "contentLocation");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  v510 = SMSCopySanitizedContentLocation(v113);

                  if (IMOSLoggingEnabled(v114))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v115 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v512;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v510;
                      _os_log_impl(&dword_1D1413000, v115, OS_LOG_TYPE_INFO, "Sanitized ID %@  sanitized loc %@", buf, 0x16u);
                    }

                  }
                  objc_msgSend(v101, "content");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v117 = objc_msgSend(v116, "type");

                  if (v117 == 2)
                  {
                    if (IMOSLoggingEnabled(v118))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v131 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1D1413000, v131, OS_LOG_TYPE_INFO, "  * This is an attachment part", buf, 2u);
                      }

                    }
                    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
                    v531 = (void *)objc_claimAutoreleasedReturnValue();
                    v132 = v510;
                    v133 = v132;
                    if (!objc_msgSend(v132, "length"))
                    {
                      v133 = v512;

                    }
                    objc_msgSend(v101, "contentType");
                    v527 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v101, "content");
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v134, "attachment");
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v135, "contentData");
                    v538 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v133, "stringByRemovingURLEscapes");
                    v136 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    if (!-[__CFString length](v136, "length"))
                    {
                      if (IMOSLoggingEnabled(0))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v137 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1D1413000, v137, OS_LOG_TYPE_INFO, "  *** Empty filename!", buf, 2u);
                        }

                      }
                      v136 = CFSTR("Attachment");
                    }
                    -[__CFString pathExtension](v136, "pathExtension");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    v139 = objc_msgSend(v138, "length") == 0;

                    if (v139)
                    {
                      if (IMOSLoggingEnabled(v140))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v193 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v136;
                          _os_log_impl(&dword_1D1413000, v193, OS_LOG_TYPE_INFO, "  *** Filename has no extension: %@", buf, 0xCu);
                        }

                      }
                      objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
                      v194 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v194, "pathExtensionForMIMEType:", v527);
                      v195 = (void *)objc_claimAutoreleasedReturnValue();

                      if (IMOSLoggingEnabled(v196))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v197 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v195;
                          _os_log_impl(&dword_1D1413000, v197, OS_LOG_TYPE_INFO, "  Proposed extension: %@", buf, 0xCu);
                        }

                      }
                      if (objc_msgSend(v195, "length"))
                      {
                        -[__CFString stringByAppendingPathExtension:](v136, "stringByAppendingPathExtension:", v195);
                        v198 = objc_claimAutoreleasedReturnValue();

                        if (IMOSLoggingEnabled(v199))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v200 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(_QWORD *)&buf[4] = v198;
                            _os_log_impl(&dword_1D1413000, v200, OS_LOG_TYPE_INFO, "  * Replacement filename: %@", buf, 0xCu);
                          }

                        }
                      }
                      else
                      {
                        v198 = (uint64_t)v136;
                      }

                      v141 = (void *)v198;
                    }
                    else
                    {
                      v141 = v136;
                    }
                    cf1a = v141;
                    objc_msgSend(v141, "lastPathComponent");
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v531, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v202, 0, objc_msgSend(v538, "length"), 0, 0, 0);
                    v203 = (void *)objc_claimAutoreleasedReturnValue();
                    v204 = IMOSLoggingEnabled(v203);
                    if ((_DWORD)v204)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v205 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = cf1a;
                        _os_log_impl(&dword_1D1413000, v205, OS_LOG_TYPE_INFO, "         filename: %@", buf, 0xCu);
                      }

                    }
                    v206 = IMOSLoggingEnabled(v204);
                    if ((_DWORD)v206)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v207 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v207, OS_LOG_TYPE_INFO))
                      {
                        v208 = objc_msgSend(v538, "length");
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&buf[4] = v208;
                        _os_log_impl(&dword_1D1413000, v207, OS_LOG_TYPE_INFO, "      data length: %d", buf, 8u);
                      }

                    }
                    v209 = IMOSLoggingEnabled(v206);
                    if ((_DWORD)v209)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v210 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v202;
                        _os_log_impl(&dword_1D1413000, v210, OS_LOG_TYPE_INFO, "    transfer name: %@", buf, 0xCu);
                      }

                    }
                    v211 = IMOSLoggingEnabled(v209);
                    if ((_DWORD)v211)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v212 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v212, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v203;
                        _os_log_impl(&dword_1D1413000, v212, OS_LOG_TYPE_INFO, "             guid: %@", buf, 0xCu);
                      }

                    }
                    *(_QWORD *)buf = 0;
                    *(_QWORD *)&buf[8] = buf;
                    *(_QWORD *)&buf[16] = 0x3032000000;
                    v617 = sub_1D15D8174;
                    *(_QWORD *)v618 = sub_1D15D8184;
                    *(_QWORD *)&v618[8] = 0;
                    if (v203)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                      v213 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v213, "im_randomTemporaryFileURLWithFileName:", v202);
                      v214 = (void *)objc_claimAutoreleasedReturnValue();

                      if (IMOSLoggingEnabled(v215))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v216 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v602 = 138412290;
                          *(_QWORD *)v603 = v214;
                          _os_log_impl(&dword_1D1413000, v216, OS_LOG_TYPE_INFO, "  => Writing data to path: %@", v602, 0xCu);
                        }

                      }
                      v217 = objc_msgSend(v538, "writeToURL:atomically:", v214, 1);
                      if ((v217 & 1) == 0 && IMOSLoggingEnabled(v217))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v218 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                        {
                          v219 = objc_msgSend(v538, "length");
                          *(_DWORD *)v602 = 67109378;
                          *(_DWORD *)v603 = v219;
                          *(_WORD *)&v603[4] = 2112;
                          *(_QWORD *)&v603[6] = v214;
                          _os_log_impl(&dword_1D1413000, v218, OS_LOG_TYPE_INFO, "Failed to write data of length: %d   to path: %@", v602, 0x12u);
                        }

                      }
                      aBlock[0] = MEMORY[0x1E0C809B0];
                      aBlock[1] = 3221225472;
                      aBlock[2] = sub_1D15D818C;
                      aBlock[3] = &unk_1E922F110;
                      v580 = v531;
                      v220 = v203;
                      v581 = v220;
                      v582 = self;
                      v583 = v536;
                      v585 = buf;
                      v584 = v501;
                      v221 = _Block_copy(aBlock);
                      if (objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
                      {
                        objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
                        v222 = (void *)objc_claimAutoreleasedReturnValue();
                        v575[0] = MEMORY[0x1E0C809B0];
                        v575[1] = 3221225472;
                        v575[2] = sub_1D15D8674;
                        v575[3] = &unk_1E922F138;
                        v576 = v220;
                        v223 = v214;
                        v577 = v223;
                        v578 = v221;
                        objc_msgSend(v222, "generateSafeRender:completionBlock:", v223, v575);

                      }
                      else
                      {
                        (*((void (**)(void *, uint64_t, void *, _QWORD))v221 + 2))(v221, 1, v214, 0);
                      }

                    }
                    else if (IMOSLoggingEnabled(v211))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v224 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v101;
                        _os_log_impl(&dword_1D1413000, v224, OS_LOG_TYPE_INFO, "Failed building file transfer guid for part: %@", v602, 0xCu);
                      }

                    }
                    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                    {
                      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                      v225 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v225, "messageWithGUID:", v514);
                      v226 = (void *)objc_claimAutoreleasedReturnValue();

                      if (-[IMDTelephonyServiceSession _allowedToGeneratePreviewForTransfer:smsMessage:](self, "_allowedToGeneratePreviewForTransfer:smsMessage:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v535))
                      {
                        -[IMDTelephonyServiceSession _generatePreviewForTransfer:message:](self, "_generatePreviewForTransfer:message:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v226);
                      }
                      v227 = (void *)MEMORY[0x1E0CB3498];
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "guid");
                      v228 = (void *)objc_claimAutoreleasedReturnValue();
                      v610 = v228;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v610, 1);
                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v227, "__im_attributedStringWithFileTransfers:", v229);
                      v230 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v230, "__im_attributedStringByAssigningMessagePartNumbers");
                      v231 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v512, "length"))
                        objc_msgSend(v537, "setObject:forKey:", v231, v512);
                      if (objc_msgSend(v132, "length"))
                        objc_msgSend(v543, "setObject:forKey:", v231, v132);
                      objc_msgSend(v541, "addObject:", v231);
                      objc_msgSend(v226, "balloonBundleID");
                      v232 = (void *)objc_claimAutoreleasedReturnValue();
                      v233 = objc_msgSend(v232, "containsString:", v499);

                      if (v233)
                      {
                        objc_msgSend(v226, "richLinkURLs");
                        v234 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v234, "lastObject");
                        v235 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v235)
                          goto LABEL_273;
                        v236 = (void *)MEMORY[0x1E0C99E98];
                        objc_msgSend(v226, "body");
                        v237 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v237, "string");
                        v238 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v236, "URLWithString:", v238);
                        v235 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v235)
                        {
LABEL_273:
                          objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
                          v240 = (void *)objc_claimAutoreleasedReturnValue();
                          v574 = 0;
                          v573 = 0;
                          objc_msgSend(v240, "appNameAndBundleIDFoURL:outAppName:outBundleID:", v235, &v574, &v573);
                          v241 = v574;
                          v242 = v573;

                          if (objc_msgSend(v241, "length"))
                            objc_msgSend(v226, "setSwyAppName:", v241);
                          if (objc_msgSend(v242, "length"))
                            objc_msgSend(v226, "setSwyBundleID:", v242);

                        }
                        else if (IMOSLoggingEnabled(v239))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v243 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v602 = 138412290;
                            *(_QWORD *)v603 = v514;
                            _os_log_impl(&dword_1D1413000, v243, OS_LOG_TYPE_INFO, "unable to extract URL for message identified as RichLink: %@", v602, 0xCu);
                          }

                        }
                      }

                    }
                    _Block_object_dispose(buf, 8);

                  }
                  else if (v117 == 1)
                  {
                    objc_msgSend(v101, "content");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v142, "smil");
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "contentBody");
                    v504 = (void *)objc_claimAutoreleasedReturnValue();

                    v145 = IMOSLoggingEnabled(v144);
                    if ((_DWORD)v145)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v146 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1D1413000, v146, OS_LOG_TYPE_INFO, "  * This is a SMIL part", buf, 2u);
                      }

                    }
                    if (IMOSLoggingEnabled(v145))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v147 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
                      {
                        MarcoLoggingStringForMessageData();
                        v148 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v148;
                        _os_log_impl(&dword_1D1413000, v147, OS_LOG_TYPE_INFO, "  * Out body: %@", buf, 0xCu);

                      }
                    }
                    v149 = objc_msgSend(v504, "length");
                    if (!v149
                      || (objc_msgSend(v504, "string"),
                          v150 = (void *)objc_claimAutoreleasedReturnValue(),
                          objc_msgSend(v150, "trimmedString"),
                          v151 = (void *)objc_claimAutoreleasedReturnValue(),
                          v152 = objc_msgSend(v151, "length") == 0,
                          v151,
                          v150,
                          v152))
                    {
                      if (IMOSLoggingEnabled(v149))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v157 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1D1413000, v157, OS_LOG_TYPE_INFO, "  => Empty", buf, 2u);
                        }

                      }
                    }
                    else
                    {
                      if (IMOSLoggingEnabled(v149))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v153 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          v154 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v154;
                          _os_log_impl(&dword_1D1413000, v153, OS_LOG_TYPE_INFO, "  => Appending body %@", buf, 0xCu);

                        }
                      }
                      if (objc_msgSend(v512, "length"))
                        objc_msgSend(v537, "setObject:forKey:", v504, v512);
                      if (objc_msgSend(v510, "length"))
                        objc_msgSend(v543, "setObject:forKey:", v504, v510);
                      objc_msgSend(v541, "addObject:", v504);
                    }
                    cf1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v596 = 0u;
                    v597 = 0u;
                    v594 = 0u;
                    v595 = 0u;
                    objc_msgSend(v101, "content");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v158, "smil");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v159, "orderedParts");
                    v519 = (id)objc_claimAutoreleasedReturnValue();

                    v528 = (id)objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v594, v613, 16);
                    if (v528)
                    {
                      v521 = *(_QWORD *)v595;
                      do
                      {
                        v160 = 0;
                        do
                        {
                          if (*(_QWORD *)v595 != v521)
                          {
                            v161 = v160;
                            objc_enumerationMutation(v519);
                            v160 = v161;
                          }
                          v532 = v160;
                          v539 = *(void **)(*((_QWORD *)&v594 + 1) + 8 * v160);
                          v162 = objc_alloc_init(IMDSMSPart);
                          v592 = 0u;
                          v593 = 0u;
                          v590 = 0u;
                          v591 = 0u;
                          objc_msgSend(v539, "textParts");
                          v163 = (void *)objc_claimAutoreleasedReturnValue();
                          v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v590, v612, 16);
                          if (v164)
                          {
                            v165 = *(_QWORD *)v591;
                            do
                            {
                              for (i = 0; i != v164; ++i)
                              {
                                if (*(_QWORD *)v591 != v165)
                                  objc_enumerationMutation(v163);
                                v167 = *(void **)(*((_QWORD *)&v590 + 1) + 8 * i);
                                v168 = [IMDSMSTextPart alloc];
                                objc_msgSend(v167, "contentLocation");
                                v169 = (void *)objc_claimAutoreleasedReturnValue();
                                v170 = -[IMDSMSTextPart initWithContentLocation:](v168, "initWithContentLocation:", v169);

                                objc_msgSend(v167, "text");
                                v171 = (void *)objc_claimAutoreleasedReturnValue();
                                -[IMDSMSTextPart appendText:](v170, "appendText:", v171);

                                -[IMDSMSPart addTextPart:](v162, "addTextPart:", v170);
                              }
                              v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v590, v612, 16);
                            }
                            while (v164);
                          }

                          v588 = 0u;
                          v589 = 0u;
                          v586 = 0u;
                          v587 = 0u;
                          objc_msgSend(v539, "attachmentParts");
                          v172 = (void *)objc_claimAutoreleasedReturnValue();
                          v173 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v586, v611, 16);
                          if (v173)
                          {
                            v174 = *(_QWORD *)v587;
                            do
                            {
                              for (j = 0; j != v173; ++j)
                              {
                                if (*(_QWORD *)v587 != v174)
                                  objc_enumerationMutation(v172);
                                v176 = *(void **)(*((_QWORD *)&v586 + 1) + 8 * j);
                                v177 = [IMDSMSAttachmentPart alloc];
                                objc_msgSend(v176, "contentLocation");
                                v178 = (void *)objc_claimAutoreleasedReturnValue();
                                v179 = -[IMDSMSAttachmentPart initWithContentLocation:](v177, "initWithContentLocation:", v178);

                                -[IMDSMSPart addAttachmentPart:](v162, "addAttachmentPart:", v179);
                              }
                              v173 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v586, v611, 16);
                            }
                            while (v173);
                          }

                          objc_msgSend(cf1, "addObject:", v162);
                          v160 = v532 + 1;
                        }
                        while ((id)(v532 + 1) != v528);
                        v528 = (id)objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v594, v613, 16);
                      }
                      while (v528);
                    }

                    v180 = objc_msgSend(cf1, "count");
                    if (v180)
                    {
                      if (v503)
                      {
                        if (IMOSLoggingEnabled(v180))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v181 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1D1413000, v181, OS_LOG_TYPE_INFO, "Two SMILs found in MMS - this should not happen!", buf, 2u);
                          }

                        }
                        v182 = (void *)objc_msgSend(v503, "mutableCopy");
                        objc_msgSend(v182, "addObjectsFromArray:", cf1);
                        v183 = v182;

                      }
                      else
                      {
                        v183 = cf1;
                      }
                      v201 = v183;

                      v503 = v201;
                    }
                    else
                    {
                      v201 = cf1;
                    }

                  }
                  else
                  {
                    if (v117)
                    {
                      if (!IMOSLoggingEnabled(v118))
                        goto LABEL_283;
                      OSLogHandleForIMFoundationCategory();
                      v123 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v101, "content");
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        v156 = objc_msgSend(v155, "type");
                        *(_DWORD *)buf = 134217984;
                        *(_QWORD *)&buf[4] = v156;
                        _os_log_impl(&dword_1D1413000, v123, OS_LOG_TYPE_INFO, "Unhandled BlastDoorSMSCTPartContent: %ld", buf, 0xCu);

                      }
                    }
                    else
                    {
                      objc_msgSend(v101, "content");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v119, "plain");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v120, "plainTextContentBody");
                      v121 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v121)
                      {
                        v123 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                        objc_msgSend(v101, "content");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v124, "plain");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v125, "plainTextContentBody");
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject appendString:](v123, "appendString:", v126);

                        objc_msgSend(v101, "content");
                        v127 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v127, "plain");
                        v128 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "plainTextContentBody");
                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v129, "stringByRemovingWhitespace");
                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v502, "appendString:", v130);

                      }
                      else
                      {
                        v123 = 0;
                      }
                      if (IMOSLoggingEnabled(v122))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v184 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          v185 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v185;
                          _os_log_impl(&dword_1D1413000, v184, OS_LOG_TYPE_INFO, "  * This is a text part (%@)", buf, 0xCu);

                        }
                      }
                      if (-[NSObject length](v123, "length"))
                      {
                        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
                        v186 = (void *)objc_claimAutoreleasedReturnValue();
                        v187 = objc_msgSend(v186, "characterIsMember:", -[NSObject characterAtIndex:](v123, "characterAtIndex:", -[NSObject length](v123, "length") - 1));

                        if ((v187 & 1) == 0)
                        {
                          if (IMOSLoggingEnabled(v188))
                          {
                            OSLogHandleForIMFoundationCategory();
                            v189 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_1D1413000, v189, OS_LOG_TYPE_INFO, "  * There's no trailing newline here, we'll make sure to append one next", buf, 2u);
                            }

                          }
                          -[NSObject appendString:](v123, "appendString:", CFSTR("\n"));
                        }
                        v190 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v123);
                        v191 = v190;
                        if (v190)
                        {
                          objc_msgSend(v190, "__im_attributedStringByAssigningMessagePartNumbers");
                          v192 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v192)
                          {
                            if (objc_msgSend(v512, "length"))
                              objc_msgSend(v537, "setObject:forKey:", v192, v512);
                            if (objc_msgSend(v510, "length"))
                              objc_msgSend(v543, "setObject:forKey:", v192, v510);
                            objc_msgSend(v541, "addObject:", v192);
                          }

                        }
                      }
                    }

                  }
LABEL_283:

                  v99 = v508 + 1;
                }
                while (v508 + 1 != v507);
                v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v598, v614, 16);
                v507 = v98;
                if (!v98)
                {
LABEL_292:

                  v245 = IMOSLoggingEnabled(v244);
                  if ((_DWORD)v245)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v246 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v246, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D1413000, v246, OS_LOG_TYPE_INFO, "After parsing the SMS, we have:", buf, 2u);
                    }

                  }
                  v247 = IMOSLoggingEnabled(v245);
                  if ((_DWORD)v247)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v248 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_INFO))
                    {
                      MarcoLoggingStringForMessageData();
                      v249 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v249;
                      _os_log_impl(&dword_1D1413000, v248, OS_LOG_TYPE_INFO, "  orderedParts = %@", buf, 0xCu);

                    }
                  }
                  v250 = IMOSLoggingEnabled(v247);
                  if ((_DWORD)v250)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v251 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v251, OS_LOG_TYPE_INFO))
                    {
                      MarcoLoggingStringForMessageData();
                      v252 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v252;
                      _os_log_impl(&dword_1D1413000, v251, OS_LOG_TYPE_INFO, "  contentIDToParts = %@", buf, 0xCu);

                    }
                  }
                  v253 = IMOSLoggingEnabled(v250);
                  if ((_DWORD)v253)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v254 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
                    {
                      MarcoLoggingStringForMessageData();
                      v255 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v255;
                      _os_log_impl(&dword_1D1413000, v254, OS_LOG_TYPE_INFO, "  contentLocToParts = %@", buf, 0xCu);

                    }
                  }
                  if (IMOSLoggingEnabled(v253))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v256 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v256, OS_LOG_TYPE_INFO))
                    {
                      MarcoLoggingStringForMessageData();
                      v257 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v257;
                      _os_log_impl(&dword_1D1413000, v256, OS_LOG_TYPE_INFO, "  allParts = %@", buf, 0xCu);

                    }
                  }
                  v258 = objc_alloc_init(MEMORY[0x1E0CB3778]);
                  if (objc_msgSend(v503, "count"))
                  {
                    v571 = 0u;
                    v572 = 0u;
                    v569 = 0u;
                    v570 = 0u;
                    v522 = v503;
                    v259 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v569, v609, 16);
                    v529 = (id)v259;
                    if (v259)
                    {
                      cf1b = *(CFTypeRef *)v570;
                      do
                      {
                        v260 = 0;
                        do
                        {
                          if (*(CFTypeRef *)v570 != cf1b)
                          {
                            v261 = v260;
                            objc_enumerationMutation(v522);
                            v260 = v261;
                          }
                          v533 = v260;
                          v262 = *(void **)(*((_QWORD *)&v569 + 1) + 8 * v260);
                          if (IMOSLoggingEnabled(v259))
                          {
                            OSLogHandleForIMFoundationCategory();
                            v263 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(_QWORD *)&buf[4] = v262;
                              _os_log_impl(&dword_1D1413000, v263, OS_LOG_TYPE_INFO, "Examining part %@", buf, 0xCu);
                            }

                          }
                          v567 = 0u;
                          v568 = 0u;
                          v565 = 0u;
                          v566 = 0u;
                          objc_msgSend(v262, "attachmentParts");
                          v264 = (void *)objc_claimAutoreleasedReturnValue();
                          v265 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v565, v608, 16);
                          v266 = v265;
                          if (v265)
                          {
                            v267 = *(_QWORD *)v566;
                            do
                            {
                              v268 = 0;
                              do
                              {
                                if (*(_QWORD *)v566 != v267)
                                  objc_enumerationMutation(v264);
                                v269 = *(void **)(*((_QWORD *)&v565 + 1) + 8 * v268);
                                if (IMOSLoggingEnabled(v265))
                                {
                                  OSLogHandleForIMFoundationCategory();
                                  v270 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v270, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    *(_QWORD *)&buf[4] = v269;
                                    _os_log_impl(&dword_1D1413000, v270, OS_LOG_TYPE_INFO, " Found attachmentPart %@", buf, 0xCu);
                                  }

                                }
                                objc_msgSend(v269, "contentLocation");
                                v271 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v543, "objectForKey:", v271);
                                v272 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v272
                                  || (objc_msgSend(v269, "contentLocation"),
                                      v273 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend(v537, "objectForKey:", v273),
                                      v272 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v273,
                                      v272))
                                {
                                  objc_msgSend(v258, "appendAttributedString:", v272);
                                  objc_msgSend(v541, "removeObjectIdenticalTo:", v272);

                                }
                                else
                                {
                                  v265 = IMOSLoggingEnabled(v274);
                                  if ((_DWORD)v265)
                                  {
                                    OSLogHandleForIMFoundationCategory();
                                    v275 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v275, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl(&dword_1D1413000, v275, OS_LOG_TYPE_INFO, " Did not find attachment's attributed string!", buf, 2u);
                                    }

                                  }
                                }
                                ++v268;
                              }
                              while (v266 != v268);
                              v265 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v565, v608, 16);
                              v266 = v265;
                            }
                            while (v265);
                          }

                          v563 = 0u;
                          v564 = 0u;
                          v561 = 0u;
                          v562 = 0u;
                          objc_msgSend(v262, "textParts");
                          v276 = (void *)objc_claimAutoreleasedReturnValue();
                          v277 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v561, v607, 16);
                          v278 = v277;
                          if (v277)
                          {
                            v279 = *(_QWORD *)v562;
                            do
                            {
                              v280 = 0;
                              do
                              {
                                if (*(_QWORD *)v562 != v279)
                                  objc_enumerationMutation(v276);
                                v281 = *(void **)(*((_QWORD *)&v561 + 1) + 8 * v280);
                                if (IMOSLoggingEnabled(v277))
                                {
                                  OSLogHandleForIMFoundationCategory();
                                  v282 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    *(_QWORD *)&buf[4] = v281;
                                    _os_log_impl(&dword_1D1413000, v282, OS_LOG_TYPE_INFO, " Found textPart %@", buf, 0xCu);
                                  }

                                }
                                objc_msgSend(v281, "contentLocation");
                                v283 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v543, "objectForKey:", v283);
                                v284 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v284
                                  || (objc_msgSend(v281, "contentLocation"),
                                      v286 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend(v537, "objectForKey:", v286),
                                      v284 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v286,
                                      v284))
                                {
                                  if (IMOSLoggingEnabled(v285))
                                  {
                                    OSLogHandleForIMFoundationCategory();
                                    v287 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v287, OS_LOG_TYPE_INFO))
                                    {
                                      MarcoLoggingStringForMessageData();
                                      v288 = (id)objc_claimAutoreleasedReturnValue();
                                      *(_DWORD *)buf = 138412290;
                                      *(_QWORD *)&buf[4] = v288;
                                      _os_log_impl(&dword_1D1413000, v287, OS_LOG_TYPE_INFO, " Appending text %@", buf, 0xCu);

                                    }
                                  }
                                  objc_msgSend(v258, "appendAttributedString:", v284);
                                  objc_msgSend(v541, "removeObjectIdenticalTo:", v284);
                                }
                                else
                                {
                                  if (IMOSLoggingEnabled(v285))
                                  {
                                    OSLogHandleForIMFoundationCategory();
                                    v294 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v294, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl(&dword_1D1413000, v294, OS_LOG_TYPE_INFO, " Did not find textPart's attributed string!", buf, 2u);
                                    }

                                  }
                                  v284 = 0;
                                }
                                objc_msgSend(v281, "text");
                                v289 = (void *)objc_claimAutoreleasedReturnValue();
                                v290 = objc_msgSend(v289, "length");
                                if (v290)
                                {
                                  if (IMOSLoggingEnabled(v290))
                                  {
                                    OSLogHandleForIMFoundationCategory();
                                    v291 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v291, OS_LOG_TYPE_INFO))
                                    {
                                      MarcoLoggingStringForMessageData();
                                      v292 = (id)objc_claimAutoreleasedReturnValue();
                                      *(_DWORD *)buf = 138412290;
                                      *(_QWORD *)&buf[4] = v292;
                                      _os_log_impl(&dword_1D1413000, v291, OS_LOG_TYPE_INFO, " Found embedded text %@", buf, 0xCu);

                                    }
                                  }
                                  v293 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v289);
                                  objc_msgSend(v258, "appendAttributedString:", v293);

                                }
                                ++v280;
                              }
                              while (v278 != v280);
                              v277 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v561, v607, 16);
                              v278 = v277;
                            }
                            while (v277);
                          }

                          v260 = v533 + 1;
                        }
                        while ((id)(v533 + 1) != v529);
                        v259 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v569, v609, 16);
                        v529 = (id)v259;
                      }
                      while (v259);
                    }

                  }
                  v559 = 0u;
                  v560 = 0u;
                  v557 = 0u;
                  v558 = 0u;
                  v542 = v541;
                  v295 = objc_msgSend(v542, "countByEnumeratingWithState:objects:count:", &v557, v606, 16);
                  v296 = v295;
                  if (v295)
                  {
                    v297 = *(_QWORD *)v558;
                    do
                    {
                      v298 = 0;
                      do
                      {
                        if (*(_QWORD *)v558 != v297)
                          objc_enumerationMutation(v542);
                        v299 = *(_QWORD *)(*((_QWORD *)&v557 + 1) + 8 * v298);
                        if (IMOSLoggingEnabled(v295))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v300 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v300, OS_LOG_TYPE_INFO))
                          {
                            MarcoLoggingStringForMessageData();
                            v301 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412290;
                            *(_QWORD *)&buf[4] = v301;
                            _os_log_impl(&dword_1D1413000, v300, OS_LOG_TYPE_INFO, "Found unordered part: %@", buf, 0xCu);

                          }
                        }
                        v295 = objc_msgSend(v258, "appendAttributedString:", v299);
                        ++v298;
                      }
                      while (v296 != v298);
                      v295 = objc_msgSend(v542, "countByEnumeratingWithState:objects:count:", &v557, v606, 16);
                      v296 = v295;
                    }
                    while (v295);
                  }

                  if (objc_msgSend(v258, "length"))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
                    v302 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v258, "string");
                    v303 = (void *)objc_claimAutoreleasedReturnValue();
                    v304 = objc_msgSend(v302, "characterIsMember:", objc_msgSend(v303, "characterAtIndex:", objc_msgSend(v258, "length") - 1));

                    if (v304)
                    {
                      if (IMOSLoggingEnabled(v305))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v306 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v306, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1D1413000, v306, OS_LOG_TYPE_INFO, "  * Trimming trailing newline", buf, 2u);
                        }

                      }
                      objc_msgSend(v258, "deleteCharactersInRange:", objc_msgSend(v258, "length") - 1, 1);
                    }
                  }
                  v307 = objc_msgSend(v258, "length");
                  objc_msgSend(v258, "removeAttribute:range:", *MEMORY[0x1E0D366B8], 0, v307);
                  objc_msgSend(v258, "__im_attributedStringByAssigningMessagePartNumbers");
                  v511 = (void *)objc_claimAutoreleasedReturnValue();
                  v520 = (id)objc_msgSend(v511, "mutableCopy");

                  if (IMSharedHelperDeviceIsAltAccount())
                  {
                    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
                    v308 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v308, "ctPhoneNumber");
                    v309 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                    v310 = (void *)objc_claimAutoreleasedReturnValue();
                    cf1c = (CFTypeRef)IMPhoneNumberRefCopyForPhoneNumber();
                    goto LABEL_396;
                  }
                  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v311, "telephoneNumber");
                  v312 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v312)
                  {
                    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
                    v308 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v308, "telephoneNumber");
                    v309 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                    v310 = (void *)objc_claimAutoreleasedReturnValue();
                    cf1c = (CFTypeRef)IMPhoneNumberRefCopyForPhoneNumber();
LABEL_396:

                  }
                  else
                  {
                    cf1c = 0;
                  }
                  if (!objc_msgSend(v520, "length") && !objc_msgSend(v501, "count"))
                  {
                    v313 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", CFSTR(" "), 0);

                    v520 = (id)v313;
                  }
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x3032000000;
                  v617 = sub_1D15D8174;
                  *(_QWORD *)v618 = sub_1D15D8184;
                  *(_QWORD *)&v618[8] = 0;
                  v314 = objc_alloc(MEMORY[0x1E0D39918]);
                  -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                  v315 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v535, "date");
                  v316 = (void *)objc_claimAutoreleasedReturnValue();
                  _ClampDate(v316);
                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v501, "arrayByApplyingSelector:", sel_guid);
                  v318 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)&v618[8] = objc_msgSend(v314, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v315, v317, v520, 0, v318, 1, 0, v514, 0);

                  v319 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  -[IMDTelephonyIncomingMessageContext destinationCallerID](v536, "destinationCallerID");
                  v320 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v319, "setDestinationCallerID:", v320);

                  -[IMDTelephonyServiceSession _markFromStorageIfNeeded:messageGUID:](self, "_markFromStorageIfNeeded:messageGUID:", v515, v514);
                  v321 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  -[IMDServiceSession accountID](self, "accountID");
                  v322 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v321, "setAccountID:", v322);

                  v323 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  objc_msgSend(v535, "subject");
                  v324 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v323, "setSubject:", v324);

                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setReplaceID:", v500);
                  objc_msgSend(v535, "fallbackHash");
                  v325 = objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v502, "length"))
                  {
                    v326 = (void *)v325;
                    v605 = v502;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v605, 1);
                    v327 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v327, "SHA256HexString");
                    v328 = (void *)objc_claimAutoreleasedReturnValue();

                    v329 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v535, "fallbackHash");
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v329, "stringWithFormat:", CFSTR("%@<%@>"), v330, v328);
                    v325 = objc_claimAutoreleasedReturnValue();

                  }
                  v331 = IMOSLoggingEnabled(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFallbackHash:", v325));
                  v509 = (void *)v325;
                  v332 = v536;
                  if (v331)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v333 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v333, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "fallbackHash");
                      v334 = (void *)objc_claimAutoreleasedReturnValue();
                      v335 = objc_msgSend(v334, "length");
                      *(_DWORD *)v602 = 134217984;
                      *(_QWORD *)v603 = v335;
                      _os_log_impl(&dword_1D1413000, v333, OS_LOG_TYPE_INFO, " => Fallback hash length: %llu", v602, 0xCu);

                    }
                    v332 = v536;
                  }
                  -[IMDTelephonyIncomingMessageContext sender](v332, "sender");
                  v336 = (const void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v520, "string");
                  v337 = (const void *)objc_claimAutoreleasedReturnValue();
                  v338 = HSAAuthenticationProcessIncomingMessage();
                  if (v336)
                    CFRelease(v336);
                  if (v337)
                    CFRelease(v337);
                  v339 = IMOSLoggingEnabled(v338);
                  if ((_DWORD)v339)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v340 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v340, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v501;
                      _os_log_impl(&dword_1D1413000, v340, OS_LOG_TYPE_INFO, " => Transfers: %@", v602, 0xCu);
                    }

                    v332 = v536;
                  }
                  v341 = IMOSLoggingEnabled(v339);
                  if ((_DWORD)v341)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v342 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v342, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v503;
                      _os_log_impl(&dword_1D1413000, v342, OS_LOG_TYPE_INFO, " => Ordered parts: %@", v602, 0xCu);
                    }

                    v332 = v536;
                  }
                  if (IMOSLoggingEnabled(v341))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v343 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
                    {
                      v344 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v344;
                      _os_log_impl(&dword_1D1413000, v343, OS_LOG_TYPE_INFO, " => Result message: %@", v602, 0xCu);
                    }

                    v332 = v536;
                  }
                  -[IMDTelephonyIncomingMessageContext setStyle:](v332, "setStyle:", 45);
                  v345 = (void *)MEMORY[0x1E0D39730];
                  -[IMDTelephonyIncomingMessageContext myNumberString](v332, "myNumberString");
                  v346 = (void *)objc_claimAutoreleasedReturnValue();
                  -[IMDTelephonyIncomingMessageContext mySIMIDString](v332, "mySIMIDString");
                  v347 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v345, "IMMMSEmailAddressToMatchForPhoneNumber:simID:", v346, v347);
                  v540 = (void *)objc_claimAutoreleasedReturnValue();

                  v348 = (void *)MEMORY[0x1E0D39730];
                  -[IMDTelephonyIncomingMessageContext myNumberString](v536, "myNumberString");
                  v349 = (void *)objc_claimAutoreleasedReturnValue();
                  -[IMDTelephonyIncomingMessageContext mySIMIDString](v536, "mySIMIDString");
                  v350 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v348, "IMCountryCodeForPhoneNumber:simID:", v349, v350);
                  v513 = (void *)objc_claimAutoreleasedReturnValue();

                  v352 = IMOSLoggingEnabled(v351);
                  v353 = v536;
                  if ((_DWORD)v352)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v354 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v354, OS_LOG_TYPE_INFO))
                    {
                      v355 = -[IMDTelephonyIncomingMessageContext isGroupMessagingEnabled](v536, "isGroupMessagingEnabled");
                      v356 = CFSTR("NO");
                      if (v355)
                        v356 = CFSTR("YES");
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v356;
                      _os_log_impl(&dword_1D1413000, v354, OS_LOG_TYPE_INFO, "Group Messaging Enabled: %@", v602, 0xCu);
                    }

                    v353 = v536;
                  }
                  v357 = IMOSLoggingEnabled(v352);
                  if ((_DWORD)v357)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v358 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v358, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = cf1c;
                      _os_log_impl(&dword_1D1413000, v358, OS_LOG_TYPE_INFO, "My number: %@", v602, 0xCu);
                    }

                    v353 = v536;
                  }
                  v359 = IMOSLoggingEnabled(v357);
                  if ((_DWORD)v359)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v360 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v360, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v540;
                      _os_log_impl(&dword_1D1413000, v360, OS_LOG_TYPE_INFO, "My email: %@", v602, 0xCu);
                    }

                    v353 = v536;
                  }
                  v361 = IMOSLoggingEnabled(v359);
                  if ((_DWORD)v361)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v362 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v362, OS_LOG_TYPE_INFO))
                    {
                      -[IMDTelephonyIncomingMessageContext mySIMIDString](v536, "mySIMIDString");
                      v363 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v363;
                      _os_log_impl(&dword_1D1413000, v362, OS_LOG_TYPE_INFO, "My sim ID: %@", v602, 0xCu);

                    }
                    v353 = v536;
                  }
                  if (IMOSLoggingEnabled(v361))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v364 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v364, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v602 = 138412290;
                      *(_QWORD *)v603 = v513;
                      _os_log_impl(&dword_1D1413000, v364, OS_LOG_TYPE_INFO, "My receiver ISO country region: %@", v602, 0xCu);
                    }

                    v353 = v536;
                  }
                  v365 = -[IMDTelephonyIncomingMessageContext isGroupMessagingEnabled](v353, "isGroupMessagingEnabled");
                  if ((_DWORD)v365)
                  {
                    if (IMOSLoggingEnabled(v365))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v366 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v366, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v535, "recipients");
                        v367 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v367;
                        _os_log_impl(&dword_1D1413000, v366, OS_LOG_TYPE_INFO, "Recipients: %@", v602, 0xCu);

                      }
                    }
                    v556 = 0u;
                    v554 = 0u;
                    v555 = 0u;
                    v553 = 0u;
                    objc_msgSend(v535, "recipients");
                    v368 = (void *)objc_claimAutoreleasedReturnValue();
                    v369 = objc_msgSend(v368, "countByEnumeratingWithState:objects:count:", &v553, v604, 16);
                    v370 = v369;
                    if (v369)
                    {
                      v371 = *(_QWORD *)v554;
                      v530 = v368;
                      do
                      {
                        v372 = 0;
                        do
                        {
                          if (*(_QWORD *)v554 != v371)
                            objc_enumerationMutation(v530);
                          v373 = *(_QWORD *)(*((_QWORD *)&v553 + 1) + 8 * v372);
                          if (IMOSLoggingEnabled(v369))
                          {
                            OSLogHandleForIMFoundationCategory();
                            v374 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v374, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)v602 = 138412290;
                              *(_QWORD *)v603 = v373;
                              _os_log_impl(&dword_1D1413000, v374, OS_LOG_TYPE_INFO, "  Recipient: %@", v602, 0xCu);
                            }

                          }
                          -[IMDTelephonyServiceSession _extractSMSSenderAddress:](self, "_extractSMSSenderAddress:", v373);
                          v375 = (void *)objc_claimAutoreleasedReturnValue();
                          -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                          v376 = (void *)objc_claimAutoreleasedReturnValue();
                          v377 = v376 == 0;

                          if (v377)
                          {
                            v378 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                            -[IMDTelephonyIncomingMessageContext setParticipants:](v536, "setParticipants:", v378);

                          }
                          -[IMDTelephonyIncomingMessageContext unformattedIDs](v536, "unformattedIDs");
                          v379 = (void *)objc_claimAutoreleasedReturnValue();
                          v380 = v379 == 0;

                          if (v380)
                          {
                            v381 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                            -[IMDTelephonyIncomingMessageContext setUnformattedIDs:](v536, "setUnformattedIDs:", v381);

                          }
                          -[IMDTelephonyIncomingMessageContext countryCodes](v536, "countryCodes");
                          v382 = (void *)objc_claimAutoreleasedReturnValue();
                          v383 = v382 == 0;

                          if (v383)
                          {
                            v384 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                            -[IMDTelephonyIncomingMessageContext setCountryCodes:](v536, "setCountryCodes:", v384);

                          }
                          if (objc_msgSend(v375, "_appearsToBePhoneNumber"))
                          {
                            -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                            v385 = (void *)objc_claimAutoreleasedReturnValue();
                            v386 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();

                            IMNormalizedPhoneNumberForCFPhoneNumberRef();
                            v387 = (void *)objc_claimAutoreleasedReturnValue();
                            v388 = IMOSLoggingEnabled(v387);
                            if ((_DWORD)v388)
                            {
                              OSLogHandleForIMFoundationCategory();
                              v389 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v389, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v602 = 138412546;
                                *(_QWORD *)v603 = v386;
                                *(_WORD *)&v603[8] = 2112;
                                *(_QWORD *)&v603[10] = v375;
                                _os_log_impl(&dword_1D1413000, v389, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", v602, 0x16u);
                              }

                            }
                            v390 = IMOSLoggingEnabled(v388);
                            if ((_DWORD)v390)
                            {
                              OSLogHandleForIMFoundationCategory();
                              v391 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v391, OS_LOG_TYPE_INFO))
                              {
                                -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                                v392 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)v602 = 138412290;
                                *(_QWORD *)v603 = v392;
                                _os_log_impl(&dword_1D1413000, v391, OS_LOG_TYPE_INFO, "    => Country code: %@", v602, 0xCu);

                              }
                            }
                            if (IMOSLoggingEnabled(v390))
                            {
                              OSLogHandleForIMFoundationCategory();
                              v393 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v393, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v602 = 138412290;
                                *(_QWORD *)v603 = v387;
                                _os_log_impl(&dword_1D1413000, v393, OS_LOG_TYPE_INFO, "      => Normalized: %@", v602, 0xCu);
                              }

                            }
                            if (v386)
                            {
                              if (cf1c)
                              {
                                v394 = CFEqual(cf1c, v386);
                                if ((_DWORD)v394)
                                {
                                  if (IMOSLoggingEnabled(v394))
                                  {
                                    OSLogHandleForIMFoundationCategory();
                                    v395 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v395, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)v602 = 0;
                                      _os_log_impl(&dword_1D1413000, v395, OS_LOG_TYPE_INFO, "      ** This is my number, ignoring", v602, 2u);
                                    }

                                  }
                                  v375 = 0;
                                  v387 = 0;
                                }
                              }
                            }
                            objc_msgSend(v535, "originatedDeviceNumber");
                            v396 = (void *)objc_claimAutoreleasedReturnValue();
                            if (IMOSLoggingEnabled(v396))
                            {
                              OSLogHandleForIMFoundationCategory();
                              v397 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v397, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v602 = 138412290;
                                *(_QWORD *)v603 = v396;
                                _os_log_impl(&dword_1D1413000, v397, OS_LOG_TYPE_INFO, "My Original Alias is %@", v602, 0xCu);
                              }

                            }
                            if (v396)
                            {
                              v398 = MEMORY[0x1D17EA560](v396, v387);
                              if ((_DWORD)v398)
                              {
                                if (IMOSLoggingEnabled(v398))
                                {
                                  OSLogHandleForIMFoundationCategory();
                                  v399 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v399, OS_LOG_TYPE_INFO))
                                  {
                                    *(_WORD *)v602 = 0;
                                    _os_log_impl(&dword_1D1413000, v399, OS_LOG_TYPE_INFO, "      ** My number is the service center, ignoring", v602, 2u);
                                  }

                                }
                                v375 = 0;
                                v387 = 0;
                              }
                            }
                            if (v386)
                              CFRelease(v386);
                            if (objc_msgSend(v387, "length"))
                            {
                              v400 = v387;
                            }
                            else
                            {
                              IMNormalizeFormattedString();
                              v400 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            v405 = v400;

                          }
                          else
                          {
                            if (objc_msgSend(v540, "length")
                              && (v401 = objc_msgSend(v540, "isEqualToIgnoringCase:", v375), (_DWORD)v401))
                            {
                              if (IMOSLoggingEnabled(v401))
                              {
                                OSLogHandleForIMFoundationCategory();
                                v402 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v402, OS_LOG_TYPE_INFO))
                                {
                                  *(_WORD *)v602 = 0;
                                  _os_log_impl(&dword_1D1413000, v402, OS_LOG_TYPE_INFO, "      ** This is my email, ignoring", v602, 2u);
                                }

                              }
                              v396 = 0;
                            }
                            else
                            {
                              v396 = v375;
                            }
                            objc_msgSend(v535, "originatedDeviceEmail");
                            v387 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!objc_msgSend(v387, "length")
                              || (v403 = objc_msgSend(v387, "isEqualToIgnoringCase:", v396), !(_DWORD)v403))
                            {
                              v405 = v396;
                              goto LABEL_519;
                            }
                            if (IMOSLoggingEnabled(v403))
                            {
                              OSLogHandleForIMFoundationCategory();
                              v404 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v404, OS_LOG_TYPE_INFO))
                              {
                                *(_WORD *)v602 = 0;
                                _os_log_impl(&dword_1D1413000, v404, OS_LOG_TYPE_INFO, "      ** This is my email (via proxy), ignoring", v602, 2u);
                              }

                            }
                            v405 = 0;
                          }

LABEL_519:
                          if (v405)
                          {
                            if (IMOSLoggingEnabled(v406))
                            {
                              OSLogHandleForIMFoundationCategory();
                              v407 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v407, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v602 = 138412290;
                                *(_QWORD *)v603 = v405;
                                _os_log_impl(&dword_1D1413000, v407, OS_LOG_TYPE_INFO, "  => Canonical: %@", v602, 0xCu);
                              }

                            }
                            -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                            v408 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v408, "addObject:", v405);

                            -[IMDTelephonyServiceSession _extractSMSSenderAddress:](self, "_extractSMSSenderAddress:", v373);
                            v409 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            -[IMDTelephonyIncomingMessageContext countryCodes](v536, "countryCodes");
                            v410 = (void *)objc_claimAutoreleasedReturnValue();
                            -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                            v411 = objc_claimAutoreleasedReturnValue();
                            v412 = (void *)v411;
                            if (v411)
                              v413 = (const __CFString *)v411;
                            else
                              v413 = CFSTR("us");
                            objc_msgSend(v410, "addObject:", v413);

                            -[IMDTelephonyIncomingMessageContext unformattedIDs](v536, "unformattedIDs");
                            v414 = (void *)objc_claimAutoreleasedReturnValue();
                            v415 = v414;
                            if (v409)
                              v416 = v409;
                            else
                              v416 = &stru_1E92346B0;
                            objc_msgSend(v414, "addObject:", v416);

                          }
                          ++v372;
                        }
                        while (v370 != v372);
                        v368 = v530;
                        v369 = objc_msgSend(v530, "countByEnumeratingWithState:objects:count:", &v553, v604, 16);
                        v370 = v369;
                      }
                      while (v369);
                    }

                    v417 = v536;
                    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                    v418 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v418)
                    {
                      -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                      v419 = (void *)objc_claimAutoreleasedReturnValue();
                      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                      v420 = (void *)objc_claimAutoreleasedReturnValue();
                      v421 = objc_msgSend(v419, "containsObject:", v420);

                      v417 = v536;
                      if ((v421 & 1) == 0)
                      {
                        -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                        v422 = (void *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                        v423 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v422, "addObject:", v423);

                        -[IMDTelephonyIncomingMessageContext senderUnformatted](v536, "senderUnformatted");
                        v424 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext countryCodes](v536, "countryCodes");
                        v425 = (void *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                        v426 = objc_claimAutoreleasedReturnValue();
                        v427 = (void *)v426;
                        if (v426)
                          v428 = (const __CFString *)v426;
                        else
                          v428 = CFSTR("us");
                        objc_msgSend(v425, "addObject:", v428);

                        -[IMDTelephonyIncomingMessageContext unformattedIDs](v536, "unformattedIDs");
                        v429 = (void *)objc_claimAutoreleasedReturnValue();
                        v430 = v429;
                        if (v424)
                          v431 = v424;
                        else
                          v431 = &stru_1E92346B0;
                        goto LABEL_555;
                      }
                    }
                  }
                  else
                  {
                    if (IMOSLoggingEnabled(v365))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v432 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v432, OS_LOG_TYPE_INFO))
                      {
                        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                        v433 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v433;
                        _os_log_impl(&dword_1D1413000, v432, OS_LOG_TYPE_INFO, "Group messaging is disabled, ensuring the sender is in the participant set: %@", v602, 0xCu);

                      }
                      v353 = v536;
                    }
                    -[IMDTelephonyIncomingMessageContext participants](v353, "participants");
                    v434 = (void *)objc_claimAutoreleasedReturnValue();
                    v435 = v434 == 0;

                    if (v435)
                    {
                      v436 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      -[IMDTelephonyIncomingMessageContext setParticipants:](v536, "setParticipants:", v436);

                    }
                    v417 = v536;
                    -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                    v437 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v437)
                    {
                      -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                      v438 = (void *)objc_claimAutoreleasedReturnValue();
                      -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                      v439 = (void *)objc_claimAutoreleasedReturnValue();
                      v440 = objc_msgSend(v438, "containsObject:", v439);

                      v417 = v536;
                      if ((v440 & 1) == 0)
                      {
                        -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                        v441 = (void *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext sender](v536, "sender");
                        v442 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v441, "addObject:", v442);

                        -[IMDTelephonyIncomingMessageContext senderUnformatted](v536, "senderUnformatted");
                        v424 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext countryCodes](v536, "countryCodes");
                        v443 = (void *)objc_claimAutoreleasedReturnValue();
                        -[IMDTelephonyIncomingMessageContext countryCode](v536, "countryCode");
                        v444 = objc_claimAutoreleasedReturnValue();
                        v445 = (void *)v444;
                        if (v444)
                          v446 = (const __CFString *)v444;
                        else
                          v446 = CFSTR("us");
                        objc_msgSend(v443, "addObject:", v446);

                        -[IMDTelephonyIncomingMessageContext unformattedIDs](v536, "unformattedIDs");
                        v429 = (void *)objc_claimAutoreleasedReturnValue();
                        v430 = v429;
                        if (v424)
                          v431 = v424;
                        else
                          v431 = &stru_1E92346B0;
LABEL_555:
                        objc_msgSend(v429, "addObject:", v431);

                        v417 = v536;
                      }
                    }
                  }
                  if (-[IMDTelephonyIncomingMessageContext isGroupChat](v417, "isGroupChat"))
                  {
                    -[IMDTelephonyIncomingMessageContext setStyle:](v417, "setStyle:", 43);
                    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
                    v447 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDServiceSession account](self, "account");
                    v448 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v447, "generateUnusedChatIdentifierForGroupChatWithAccount:", v448);
                    v449 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext setChatIdentifier:](v417, "setChatIdentifier:", v449);

                  }
                  else
                  {
                    -[IMDTelephonyIncomingMessageContext sender](v417, "sender");
                    v447 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext setChatIdentifier:](v417, "setChatIdentifier:", v447);
                  }

                  -[IMDTelephonyServiceSession chatForIncomingMessageContext:createIfNotExists:](self, "chatForIncomingMessageContext:createIfNotExists:", v536, 0);
                  v450 = (void *)objc_claimAutoreleasedReturnValue();
                  v451 = v450;
                  if (v450)
                  {
                    objc_msgSend(v450, "chatIdentifier");
                    v452 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext setChatIdentifier:](v536, "setChatIdentifier:", v452);

                    v453 = v536;
                    -[IMDTelephonyIncomingMessageContext setStyle:](v536, "setStyle:", objc_msgSend(v451, "style"));
                    v454 = objc_msgSend(v451, "isBlackholed");
                    if ((_DWORD)v454)
                    {
                      if (IMOSLoggingEnabled(v454))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v455 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v455, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(v451, "guid");
                          v456 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v602 = 138412290;
                          *(_QWORD *)v603 = v456;
                          _os_log_impl(&dword_1D1413000, v455, OS_LOG_TYPE_INFO, "SMS: Unblackholing an SMS chat %@", v602, 0xCu);

                        }
                        v453 = v536;
                      }
                      objc_msgSend(v451, "updateIsBlackholed:", 0);
                    }
                    if (objc_msgSend(v451, "smsHandshakeState") == 1)
                    {
                      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                      v457 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v457, "trackSpamEvent:", 7);

                      objc_msgSend(v451, "updateSMSHandshakeState:", 0xFFFFFFFFLL);
                      v453 = v536;
                    }
                    if (-[IMDTelephonyIncomingMessageContext isSendEnabled](v453, "isSendEnabled"))
                      goto LABEL_584;
                    v458 = -[IMDTelephonyIncomingMessageContext isGroupChat](v453, "isGroupChat");
                    if ((v458 & 1) == 0)
                    {
                      v458 = objc_msgSend(v451, "isFiltered");
                      if (v458)
                      {
                        if (IMOSLoggingEnabled(v458))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v459 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v459, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v602 = 0;
                            _os_log_impl(&dword_1D1413000, v459, OS_LOG_TYPE_INFO, "Replying is disabled, setting join state to Read Only", v602, 2u);
                          }

                          v453 = v536;
                        }
                        objc_msgSend(v451, "setState:", 4);
                        goto LABEL_584;
                      }
                    }
                    if (IMOSLoggingEnabled(v458))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v462 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v462, OS_LOG_TYPE_INFO))
                      {
                        v463 = -[IMDTelephonyIncomingMessageContext isGroupChat](v453, "isGroupChat");
                        v464 = objc_msgSend(v451, "isFiltered");
                        v465 = CFSTR("NO");
                        if (v463)
                          v465 = CFSTR("YES");
                        *(_DWORD *)v602 = 138412546;
                        *(_QWORD *)v603 = v465;
                        *(_WORD *)&v603[8] = 2048;
                        *(_QWORD *)&v603[10] = v464;
                        _os_log_impl(&dword_1D1413000, v462, OS_LOG_TYPE_INFO, "Received a read only request for a group chat: %@ or known chat: %lld", v602, 0x16u);
                      }

LABEL_583:
                      v453 = v536;
                    }
LABEL_584:
                    v466 = objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled");
                    if ((_DWORD)v466)
                    {
                      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
                      v467 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v451)
                      {
                        objc_msgSend(v451, "chatIdentifier");
                        v468 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v467, "existingiMessageChatForID:withChatStyle:", v468, objc_msgSend(v451, "style"));
                      }
                      else
                      {
                        -[IMDTelephonyIncomingMessageContext chatIdentifier](v453, "chatIdentifier");
                        v468 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v467, "existingiMessageChatForID:withChatStyle:", v468, -[IMDTelephonyIncomingMessageContext style](v453, "style"));
                      }
                      v469 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v469)
                      {
                        v470 = objc_msgSend(v469, "isBlackholed");
                        if ((_DWORD)v470)
                        {
                          v471 = IMOSLoggingEnabled(v470);
                          v472 = v536;
                          if (v471)
                          {
                            OSLogHandleForIMFoundationCategory();
                            v473 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v473, OS_LOG_TYPE_INFO))
                            {
                              objc_msgSend(v469, "guid");
                              v474 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v602 = 138412290;
                              *(_QWORD *)v603 = v474;
                              _os_log_impl(&dword_1D1413000, v473, OS_LOG_TYPE_INFO, "Unblackholing sibling iMessage chat (%@) on reception of SMS message.", v602, 0xCu);

                            }
                            v472 = v536;
                          }
                          if (-[IMDTelephonyIncomingMessageContext isGroupChat](v472, "isGroupChat"))
                          {
                            objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                            v475 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v475, "trackSpamEvent:", 21);
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                            v475 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v475, "trackSpamEvent:", 20);
                          }

                          objc_msgSend(v469, "updateIsBlackholed:", 0);
                          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                          v476 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v469, "lastMessage");
                          v477 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v477, "guid");
                          v478 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v476, "markMessageGUIDUnread:", v478);

                        }
                      }

                      v453 = v536;
                    }
                    v479 = IMOSLoggingEnabled(v466);
                    if ((_DWORD)v479)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v480 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v480, OS_LOG_TYPE_INFO))
                      {
                        -[IMDTelephonyIncomingMessageContext participants](v536, "participants");
                        v481 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v481;
                        _os_log_impl(&dword_1D1413000, v480, OS_LOG_TYPE_INFO, "   participants: %@", v602, 0xCu);

                      }
                      v453 = v536;
                    }
                    v482 = IMOSLoggingEnabled(v479);
                    if ((_DWORD)v482)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v483 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v483, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v451, "guid");
                        v484 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v602 = 138412546;
                        *(_QWORD *)v603 = v451;
                        *(_WORD *)&v603[8] = 2112;
                        *(_QWORD *)&v603[10] = v484;
                        _os_log_impl(&dword_1D1413000, v483, OS_LOG_TYPE_INFO, "   found chat: %@ (%@)", v602, 0x16u);

                      }
                      v453 = v536;
                    }
                    v485 = IMOSLoggingEnabled(v482);
                    if ((_DWORD)v485)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v486 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v486, OS_LOG_TYPE_INFO))
                      {
                        v487 = -[IMDTelephonyIncomingMessageContext isGroupChat](v453, "isGroupChat");
                        v488 = CFSTR("NO");
                        if (v487)
                          v488 = CFSTR("YES");
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v488;
                        _os_log_impl(&dword_1D1413000, v486, OS_LOG_TYPE_INFO, "   isGroupChat: %@", v602, 0xCu);
                      }

                      v453 = v536;
                    }
                    if (IMOSLoggingEnabled(v485))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v489 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v489, OS_LOG_TYPE_INFO))
                      {
                        -[IMDTelephonyIncomingMessageContext chatIdentifier](v536, "chatIdentifier");
                        v490 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v602 = 138412290;
                        *(_QWORD *)v603 = v490;
                        _os_log_impl(&dword_1D1413000, v489, OS_LOG_TYPE_INFO, "   chatIdentifier: %@", v602, 0xCu);

                      }
                      v453 = v536;
                    }
                    v544[0] = MEMORY[0x1E0C809B0];
                    v544[1] = 3221225472;
                    v544[2] = sub_1D15D8994;
                    v544[3] = &unk_1E922F160;
                    v491 = v453;
                    v545 = v491;
                    v546 = self;
                    v549 = buf;
                    v492 = v451;
                    v547 = v492;
                    v550 = v500;
                    v551 = v516;
                    v493 = v514;
                    v548 = v493;
                    v494 = _Block_copy(v544);
                    v602[0] = 0;
                    -[IMDTelephonyServiceSession filteringController](self, "filteringController");
                    v495 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext sender](v491, "sender");
                    v496 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext chatIdentifier](v491, "chatIdentifier");
                    v497 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDTelephonyIncomingMessageContext participants](v491, "participants");
                    v498 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v495, "categorizeIncomingMessage:messageGUID:sender:wasRelayed:chatIdentifier:participants:checkingForSpam:myReceiverISOCountryCode:messageBody:completion:", v535, v493, v496, v516, v497, v498, v602, v513, v520, v494);

                    if (cf1c)
                      CFRelease(cf1c);
                    if (v518)
                      (*((void (**)(id, uint64_t, id, _QWORD))v518 + 2))(v518, 1, v493, v602[0]);

                    _Block_object_dispose(buf, 8);
                    goto LABEL_623;
                  }
                  -[IMDTelephonyIncomingMessageContext chatIdentifier](v536, "chatIdentifier");
                  v460 = (void *)objc_claimAutoreleasedReturnValue();
                  v602[0] = 0;
                  v602[0] = -[IMDTelephonyIncomingMessageContext style](v536, "style");
                  v552 = v460;
                  -[IMDServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v552, v602);
                  v461 = v552;

                  -[IMDTelephonyIncomingMessageContext setChatIdentifier:](v536, "setChatIdentifier:", v461);
                  -[IMDTelephonyIncomingMessageContext setStyle:](v536, "setStyle:", v602[0]);

                  goto LABEL_583;
                }
              }
            }
          }
          else if (IsItemBlocked)
          {
            goto LABEL_65;
          }
        }
        v83 = (const void *)CMFItemCreateWithEmailAddress();
        v81 = CMFBlockListIsItemBlocked();
        v82 = v81 != 0;
        if (v83)
          CFRelease(v83);
        goto LABEL_69;
      }

    }
    goto LABEL_62;
  }
  if (IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "**** Invalid payload, ignoring.", buf, 2u);
    }

  }
  if (v518)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v518 + 2))(v518, 0, 0, 0);
LABEL_625:

}

- (id)getLabelFor:(int64_t)a3 subCategory:(int64_t)a4
{
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    v6 = CFSTR("smsfp");
  }
  else
  {
    if (a3 != 4)
    {
      v6 = CFSTR("filtered");
      return v6;
    }
    v6 = CFSTR("smsft");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "action") == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          objc_msgSend(v12, "label");
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_16:

  return v6;
}

- (void)_registerChatForIncomingMessageWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[16];
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isGroupChat"))
  {
    objc_msgSend(v4, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unformattedIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyServiceSession createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:](self, "createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:", v5, v6, v7, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderUnformatted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDTelephonyServiceSession createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:](self, "createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:", v9, v11, v13, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v4, "isSendEnabled") & 1) != 0 || (v14 = objc_msgSend(v4, "isGroupChat"), (_DWORD)v14))
  {
    objc_msgSend(v4, "chatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "style");
    objc_msgSend(v4, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalGroupID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession account](self, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v4, "category");
    objc_msgSend(v4, "spamExtensionName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = 0;
    -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:", 2, v15, v16, v17, v18, v19, 0, 0, v27, v20, v21, v22, v26);

  }
  else
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Replying is disabled, joining chat with Read Only state", buf, 2u);
      }

    }
    objc_msgSend(v4, "chatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "style");
    v25 = objc_msgSend(v4, "category");
    objc_msgSend(v4, "spamExtensionName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession didJoinReadOnlyChat:style:displayName:groupID:handleInfo:category:spamExtensionName:](self, "didJoinReadOnlyChat:style:displayName:groupID:handleInfo:category:spamExtensionName:", v15, v24, 0, 0, v27, v25, v17);
  }

}

- (id)_updatedMessageContextForJunkProcessing:(id)a3
{
  id v4;
  void *v5;
  int v6;
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
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDTelephonyServiceSession filteringController](self, "filteringController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isMessageCategorized:", objc_msgSend(v4, "category"));

  if (!v6)
    return v4;
  v7 = (void *)objc_msgSend(v4, "copy");

  v48 = v7;
  -[IMDTelephonyServiceSession getLabelFor:subCategory:](self, "getLabelFor:subCategory:", objc_msgSend(v7, "category"), objc_msgSend(v7, "subCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession filteringController](self, "filteringController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChatIdentifier:", v11);

  if (objc_msgSend(v7, "isGroupChat"))
  {
    -[IMDTelephonyServiceSession filteringController](self, "filteringController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSender:", v14);

    -[IMDTelephonyServiceSession filteringController](self, "filteringController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "senderUnformatted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v16, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSenderUnformatted:", v17);

    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "chatIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sender");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "senderUnformatted");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v60 = v20;
        v61 = 2112;
        v62 = v21;
        v63 = 2112;
        v64 = v22;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Generated new chatIdentifier for group: %@ filteredSender: %@ filteredSenderUnformatted: %@", buf, 0x20u);

      }
    }
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "participants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v7, "participants");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v54 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          -[IMDTelephonyServiceSession filteringController](self, "filteringController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v30, v8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32);

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v27);
    }

    objc_msgSend(v7, "setParticipants:", v25);
    v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "participants");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v7, "unformattedIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v50 != v38)
            objc_enumerationMutation(v36);
          v40 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          -[IMDTelephonyServiceSession filteringController](self, "filteringController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v40, v8);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v42);

        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v37);
    }

    objc_msgSend(v48, "setUnformattedIDs:", v35);
  }
  else
  {
    objc_msgSend(v7, "chatIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSender:", v44);

    if (IMOSLoggingEnabled(v45))
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "chatIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v47;
        _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Generated new filtered chat identifier: %@", buf, 0xCu);

      }
    }
  }

  return v48;
}

- (id)chatForIncomingMessageContext:(id)a3 createIfNotExists:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  _BOOL4 v36;
  IMDTelephonyServiceSession *v37;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isGroupChat"))
  {
    objc_msgSend(v6, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destinationCallerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = self;
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "groupsMergeDisplayNames");
    v36 = v4;
    if (v10)
    {
      objc_msgSend(v6, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalGroupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:originalGroupID:](v37, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:originalGroupID:", v7, v8, v11, v13, v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    self = v37;
    v4 = v36;
  }
  else
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingChatForID:account:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v12)
  {
    -[IMDServiceSession service](self, "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "supportsCapability:", *MEMORY[0x1E0D38DC8]);

    if (v17)
    {
      objc_msgSend(v6, "groupID");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_13;
      v19 = (void *)v18;
      objc_msgSend(v12, "groupID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "groupID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(v6, "groupID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setGroupID:", v27);

        v23 = 1;
      }
      else
      {
LABEL_13:
        v23 = 0;
      }
      objc_msgSend(v6, "originalGroupID");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_20;
      v29 = (void *)v28;
      objc_msgSend(v12, "originalGroupID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "originalGroupID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if ((v32 & 1) == 0)
      {
        objc_msgSend(v6, "originalGroupID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setOriginalGroupID:", v33);

      }
      else
      {
LABEL_20:
        if (!v23)
          goto LABEL_25;
      }
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "storeChat:", v12);

      -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", objc_msgSend(v12, "isBlackholed"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "guid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "chat:updated:", v25, v26);
      goto LABEL_24;
    }
  }
  else
  {
    if (v4)
    {
      -[IMDTelephonyServiceSession _registerChatForIncomingMessageWithContext:](self, "_registerChatForIncomingMessageWithContext:", v6);
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chatIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession account](self, "account");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "existingChatWithIdentifier:account:", v25, v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    v12 = 0;
  }
LABEL_25:

  return v12;
}

- (id)findChatAndLinkMessage:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t IsEmail;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  _QWORD v42[5];
  _QWORD v43[5];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "chatIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "category");
      v10 = objc_msgSend(v6, "subCategory");
      objc_msgSend(v6, "spamExtensionName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v45 = v8;
      v46 = 2048;
      v47 = v9;
      v48 = 2048;
      v49 = v10;
      v50 = 2112;
      v51 = v11;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "findChatAndLinkMessage called for chatid %@ category %ld, subCategory %ld, extensionName %@", buf, 0x2Au);

    }
  }
  -[IMDTelephonyServiceSession _updatedMessageContextForJunkProcessing:](self, "_updatedMessageContextForJunkProcessing:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSender:", v13);

  -[IMDTelephonyServiceSession chatForIncomingMessageContext:createIfNotExists:](self, "chatForIncomingMessageContext:createIfNotExists:", v12, 1);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "category");
  v15 = objc_msgSend(v12, "subCategory");
  objc_msgSend(v12, "spamExtensionName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _updateCategoryForChat:andMessage:category:subCategory:spamExtensionName:](self, "_updateCategoryForChat:andMessage:category:subCategory:spamExtensionName:", v40, v5, v14, v15, v16);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v17, "stewieEnabled");

  if ((_DWORD)v14)
  {
    if ((objc_msgSend(v40, "isEmergencyChat") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sender");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isPhoneNumberEmergencyNumber:", v19);

      if (v20)
      {
        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Receiving: Chat has been marked as an emergency chat", buf, 2u);
          }

        }
        objc_msgSend(v40, "updateIsEmergencyChat:", 1);
      }
    }
  }
  objc_msgSend(v12, "chatIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v12, "style");
  objc_msgSend(v12, "originalAlias");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mySIMIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:", v23, v24, v25, v26, objc_msgSend(v12, "capability"));

  objc_msgSend(v5, "sender");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmail = IMStringIsEmail();

  objc_msgSend(v5, "fileTransferGUIDs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count") != 0;

  v42[0] = *MEMORY[0x1E0D389F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v31;
  v42[1] = *MEMORY[0x1E0D38A38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isGroupChat"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v32;
  v42[2] = *MEMORY[0x1E0D38A30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsEmail ^ 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v33;
  v42[3] = *MEMORY[0x1E0D38A28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", IsEmail);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v34;
  v42[4] = *MEMORY[0x1E0D38A10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trackEvent:withDictionary:", *MEMORY[0x1E0D387E8], v36);

  objc_msgSend(v5, "subject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyServiceSession _carrierReportJunkMetricsForSMSWithSubject:isGroupchat:hasAttachments:](self, "_carrierReportJunkMetricsForSMSWithSubject:isGroupchat:hasAttachments:", v38, objc_msgSend(v12, "isGroupChat"), v30);

  return v40;
}

- (id)_messageDictionaryToRelayWithIncomingMessageDictionary:(id)a3 smsMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "GUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v5, "GUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, IMDCTMessageDictionaryGUIDKey);

  }
  return v6;
}

- (void)_carrierReportJunkMetricsForSMSWithSubject:(id)a3 isGroupchat:(BOOL)a4 hasAttachments:(BOOL)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v6 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v6 || a5 || objc_msgSend(v7, "length"))
  {
    if (v6)
      v9 = 3;
    else
      v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D38520];
  v14 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackEvent:withDictionary:", v11, v13);

}

@end
