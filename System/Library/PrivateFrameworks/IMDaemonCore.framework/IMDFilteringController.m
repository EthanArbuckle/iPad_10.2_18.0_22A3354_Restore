@implementation IMDFilteringController

- (void)_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    if (objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering"))
    {
      objc_msgSend(MEMORY[0x1E0D39A10], "untrustedContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1D15DE898;
      v10[3] = &unk_1E922F218;
      v10[4] = self;
      v11 = v7;
      +[IMBlastdoor sendDictionary:senderContext:withCompletionBlock:](IMBlastdoor, "sendDictionary:senderContext:withCompletionBlock:", v6, v8, v10);

    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", buf, 0xCu);
    }

  }
}

- (void)_processReceivedSMSFilteringSettingsMessage:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering");
  if ((_DWORD)v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", (uint8_t *)&v13, 2u);
      }

    }
    objc_msgSend(v6, "filterExtensionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "smsFilterCapabilitiesOptions");
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412802;
        v14 = v10;
        v15 = 2048;
        v16 = v11;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", (uint8_t *)&v13, 0x20u);
      }

    }
    -[IMDFilteringController _checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:](self, "_checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:", v7, v11, v10);

  }
}

+ (IMDFilteringController)sharedInstance
{
  if (qword_1ED935EF0 != -1)
    dispatch_once(&qword_1ED935EF0, &unk_1E922F238);
  return (IMDFilteringController *)(id)qword_1ED936138;
}

- (IMDFilteringController)init
{
  IMDFilteringController *v2;
  uint64_t v3;
  OS_dispatch_queue *processingQueue;
  void *v5;
  void *v6;
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDFilteringController;
  v2 = -[IMDFilteringController init](&v11, sel_init);
  if (v2)
  {
    im_primary_queue();
    v3 = objc_claimAutoreleasedReturnValue();
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v3;

    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListener:", v2);

    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRegistered:", 1);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)sub_1D15DED94, CFSTR("com.apple.LaunchServices.pluginsunregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)sub_1D15DEEB4, CFSTR("com.apple.LaunchServices.pluginsregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1D15DEFD4, CFSTR("_SMSFilterExtensionParamsChangeDistributedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (id)_createNewChatIdentifierFromChatIdentifier:(id)a3 andCategoryLabel:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("(%@)"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)_categorizeRelayMessageWithCategory:(int64_t)a3 subCategory:(int64_t)a4 deviceID:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, int64_t, int64_t, void *);
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int64_t v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(id, int64_t, int64_t, void *))a6;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSMSFilterSyncEnabled");

  if (v13)
  {
    v14 = objc_msgSend(v10, "length");
    if (v14
      && (v14 = -[IMDFilteringController _isMessageCategorized:](self, "_isMessageCategorized:", a3), (_DWORD)v14))
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v21 = 134218240;
          v22 = a3;
          v23 = 2048;
          v24 = a4;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Relayed message was categorized on iPhone. Received category: %ld and subCategory: %ld.", (uint8_t *)&v21, 0x16u);
        }

      }
      if (a4)
      {
        v16 = objc_msgSend(MEMORY[0x1E0D399F0], "isValidSubActionForDeviceID:action:subAction:", v10, a3, a4);
        if ((v16 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v16))
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v21 = 134218240;
              v22 = a4;
              v23 = 2048;
              v24 = a3;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "%ld is not a valid subAction for category: %ld. Resetting subCategory to None", (uint8_t *)&v21, 0x16u);
            }

          }
          a4 = 0;
        }
      }
      objc_msgSend(MEMORY[0x1E0D399F0], "fetchFilterExtensionNameForDeviceID:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Relayed message was not categorized on iPhone or device ID is invalid.", (uint8_t *)&v21, 2u);
        }

      }
      v18 = 0;
      a4 = 0;
      a3 = 0;
    }
    if (!objc_msgSend(v18, "length"))
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Received Device ID has no extension Name. Resetting category and subCategory to None", (uint8_t *)&v21, 2u);
        }

      }
      a4 = 0;
      a3 = 0;
    }
    v11[2](v11, a3, a4, v18);

  }
}

- (void)_smsSpamCheck:(id)a3 withMessageBody:(id)a4 withGuid:(id)a5 sender:(id)a6 receiverISOCountryCode:(id)a7 receivedViaRelay:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  -[IMDFilteringController _storeSpamCompletionBlock:forMessageGUID:](self, "_storeSpamCompletionBlock:forMessageGUID:", a3, v16);
  -[IMDFilteringController _checkIfMessageIsSpam:fromSender:withGuid:receiverISOCountryCode:receivedViaRelay:](self, "_checkIfMessageIsSpam:fromSender:withGuid:receiverISOCountryCode:receivedViaRelay:", v17, v15, v16, v14, v8);

}

- (BOOL)_shouldCheckChatForSMSSpam:(id)a3 participants:(id)a4 sender:(id)a5 fallbackFilterCategory:(int64_t *)a6 fallbackFilterSubCategory:(int64_t *)a7
{
  __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  int v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = IMGetDomainIntForKey();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isInternalInstall"))
    v17 = v15 < 1;
  else
    v17 = 1;
  if (v17)
  {

    goto LABEL_13;
  }

  if ((unint64_t)v15 > 3)
  {
LABEL_13:
    v21 = objc_msgSend(MEMORY[0x1E0D39AF8], "isFilterUnknownSendersEnabled");
    if ((_DWORD)v21
      && (v21 = -[IMDFilteringController _isSpamFilteringEnabled](self, "_isSpamFilteringEnabled"), (v21 & 1) != 0))
    {
      v22 = -[IMDFilteringController _areAllParticipantsUnknown:fromSender:](self, "_areAllParticipantsUnknown:fromSender:", v13, v14);
      if (!v22)
      {
        if (!IMOSLoggingEnabled(v22))
          goto LABEL_25;
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has known participants", (uint8_t *)&v27, 0xCu);
        }
        goto LABEL_24;
      }
      v23 = -[IMDFilteringController _numberOfRepliesFor:fallbackFilterCategory:fallbackFilterSubCategory:](self, "_numberOfRepliesFor:fallbackFilterCategory:fallbackFilterSubCategory:", v12, a6, a7);
      v24 = IMOSLoggingEnabled(v23);
      if (v23 < 3)
      {
        if (!v24)
          goto LABEL_12;
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: checking SMS spam for chatid %@", (uint8_t *)&v27, 0xCu);
        }
        goto LABEL_11;
      }
      if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has 3 replies or more", (uint8_t *)&v27, 0xCu);
        }
LABEL_24:

      }
    }
    else if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking for sms spam, filter is off", (uint8_t *)&v27, 2u);
      }
      goto LABEL_24;
    }
LABEL_25:
    v20 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = 138412546;
      v28 = CFSTR("IncomingMessageAlertSpamForcedCategory");
      v29 = 2048;
      v30 = v15;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: default %@ set, forcing category %ld", (uint8_t *)&v27, 0x16u);
    }
LABEL_11:

  }
LABEL_12:
  v20 = 1;
LABEL_26:

  return v20;
}

- (int64_t)_numberOfRepliesFor:(id)a3 fallbackFilterCategory:(int64_t *)a4 fallbackFilterSubCategory:(int64_t *)a5
{
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int64_t *v27;
  int64_t *v28;
  uint64_t v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _QWORD v47[6];

  v27 = a4;
  v28 = a5;
  v47[4] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v47[0] = &stru_1E92346B0;
  v47[1] = CFSTR("smsft");
  v47[2] = CFSTR("smsfp");
  v47[3] = CFSTR("filtered");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v34)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        v11 = v9;
        v12 = v7;
        v13 = v6;
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[IMDFilteringController _createNewChatIdentifierFromChatIdentifier:andCategoryLabel:](self, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v36, v14, v27, v28);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDFilteringController account](self, "account");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "existingChatForID:account:", v7, v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v11;
        if (v6)
          v17 = v11 == 0;
        else
          v17 = 0;
        if (v17)
        {
          if ((objc_msgSend(v14, "isEqualToString:", &stru_1E92346B0) & 1) != 0)
          {
            v9 = 1;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("smsft")) & 1) != 0)
          {
            v9 = 4;
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("smsfp")))
          {
            v9 = 3;
          }
          else
          {
            v9 = 2;
          }
        }
        v8 += (int)objc_msgSend(v6, "getNumberOfTimesRespondedToThread");
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v34);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v35)
  {
    v29 = 0;
    v33 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v19, "subAction", v27, v28))
        {
          objc_msgSend(v19, "label");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFilteringController _createNewChatIdentifierFromChatIdentifier:andCategoryLabel:](self, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v36, v20);
          v21 = objc_claimAutoreleasedReturnValue();

          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDFilteringController account](self, "account");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "existingChatForID:account:", v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            v25 = v9 == 0;
          else
            v25 = 0;
          if (v25)
          {
            v9 = objc_msgSend(v19, "action");
            v29 = objc_msgSend(v19, "subAction");
          }
          v8 += (int)objc_msgSend(v24, "getNumberOfTimesRespondedToThread");
          v6 = v24;
          v7 = (void *)v21;
        }
      }
      v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v35);
  }
  else
  {
    v29 = 0;
  }

  if (v8 >= 3)
  {
    *v27 = v9;
    *v28 = v29;
  }

  return v8;
}

- (BOOL)_areAllParticipantsUnknown:(id)a3 fromSender:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3)
  {
    LOBYTE(v7) = IMDAreAllAliasesUnknown();
  }
  else
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IMDAreAllAliasesUnknown();

  }
  return v7;
}

- (BOOL)_isMessageCategorized:(int64_t)a3
{
  return a3 == 4 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceWithName:", *MEMORY[0x1E0D38F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isSpamFilteringEnabled
{
  return IMGetDomainBoolForKey();
}

- (id)_getSpamExtensionID
{
  return (id)IMGetCachedDomainValueForKey();
}

- (id)_getSpamExtensionName
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  __CFString *v5;

  v2 = IMGetDomainIntForKey();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInternalInstall"))
    v4 = v2 < 1;
  else
    v4 = 1;
  if (v4)
  {

LABEL_9:
    IMGetCachedDomainValueForKey();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v5;
  }

  if ((unint64_t)v2 >= 4)
    goto LABEL_9;
  v5 = CFSTR("DefaultsOverrideExtension");
  return v5;
}

- (void)_checkAndUpdateFilterParamsForFilterExtension
{
  void *v3;
  int v4;
  _BOOL8 v5;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4 && (IMSharedHelperDeviceIsiPad() & 1) == 0)
  {
    v5 = -[IMDFilteringController _isSpamFilteringEnabled](self, "_isSpamFilteringEnabled");
    v6 = v5;
    v7 = IMOSLoggingEnabled(v5);
    if (v6)
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "SMS Filtering was enabled. Updating Filter Params", buf, 2u);
        }

      }
      -[IMDFilteringController _updateFilterParamsForFilterExtension](self, "_updateFilterParamsForFilterExtension");
    }
    else
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Clearing Filter Params", v10, 2u);
        }

      }
      -[IMDFilteringController _disableSpamFilteringAndRelay](self, "_disableSpamFilteringAndRelay");
    }
  }
}

- (void)_updateFilterParamsForFilterExtension
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  IMDFilteringController *v12;
  uint8_t *v13;
  uint8_t buf[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  -[IMDFilteringController _getSpamExtensionID](self, "_getSpamExtensionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v4 = (void *)qword_1EFC63F20;
    v23 = qword_1EFC63F20;
    if (!qword_1EFC63F20)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = (uint64_t)sub_1D15E2FE0;
      v17 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E922B000;
      v18 = (void (*)(uint64_t))&v20;
      sub_1D15E2FE0((uint64_t)buf);
      v4 = (void *)v21[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v20, 8);
    v6 = [v5 alloc];
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "initWithExtensionIdentifier:", v3);
      *(_QWORD *)buf = 0;
      v15 = (uint64_t)buf;
      v16 = 0x3032000000;
      v17 = sub_1D15E01C4;
      v18 = sub_1D15E01D4;
      v19 = 0;
      v19 = objc_alloc_init((Class)sub_1D15E01DC());
      v8 = *(void **)(v15 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1D15E0294;
      v10[3] = &unk_1E922F260;
      v11 = v3;
      v12 = self;
      v13 = buf;
      objc_msgSend(v8, "performCapabilitiesQueryRequest:completion:", v7, v10);

      _Block_object_dispose(buf, 8);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
      }

    }
  }

}

- (void)_checkIfMessageIsSpam:(id)a3 fromSender:(id)a4 withGuid:(id)a5 receiverISOCountryCode:(id)a6 receivedViaRelay:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  IMDFilteringController *v29;
  id v30;
  _BYTE *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  IMDFilteringController *v37;
  id v38;
  BOOL v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v7 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = IMGetDomainIntForKey();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isInternalInstall"))
    v18 = v16 < 1;
  else
    v18 = 1;
  if (v18)
  {

  }
  else
  {

    if ((unint64_t)v16 <= 3)
    {
      v19 = IMGetDomainIntForKey();
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = CFSTR("IncomingMessageAlertSpamForcedCategory");
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          v41 = (uint64_t (*)(uint64_t, uint64_t))v19;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: default %@ set, forcing category %ld sub category %ld", buf, 0x20u);
        }

      }
      -[IMDFilteringController _executeSpamCompletionBlockForMessageGuid:category:subCategory:receivedViaRelay:](self, "_executeSpamCompletionBlockForMessageGuid:category:subCategory:receivedViaRelay:", v14, v16, v19, v7);
      goto LABEL_23;
    }
  }
  if (v12 && v13)
  {
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = sub_1D15E0B40;
    v36 = &unk_1E922F1F0;
    v37 = self;
    v21 = v14;
    v38 = v21;
    v39 = v7;
    im_dispatch_after();
    -[IMDFilteringController _getSpamExtensionID](self, "_getSpamExtensionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (sub_1D15E0B58())
    {
      v23 = (void *)objc_msgSend(objc_alloc((Class)sub_1D15E0B58()), "initWithExtensionIdentifier:", v22);
      objc_msgSend(v12, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMessageBody:", v24);

      objc_msgSend(v23, "setSender:", v13);
      objc_msgSend(v23, "setReceiverISOCountryCode:", v15);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v41 = sub_1D15E01C4;
      v42 = sub_1D15E01D4;
      v43 = 0;
      v43 = objc_alloc_init((Class)sub_1D15E01DC());
      v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1D15E0C10;
      v27[3] = &unk_1E922F2B0;
      v28 = v22;
      v29 = self;
      v32 = v7;
      v30 = v21;
      v31 = buf;
      objc_msgSend(v25, "performQueryRequest:completion:", v23, v27);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
        }

      }
      -[IMDFilteringController _executeSpamCompletionBlockForMessageGuid:category:subCategory:receivedViaRelay:](self, "_executeSpamCompletionBlockForMessageGuid:category:subCategory:receivedViaRelay:", v21, 0, 0, v7);
    }

  }
LABEL_23:

}

- (void)_checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:(id)a3 arePluginsRegistered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v21 = v4;
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Plugins have been deleted. Checking if current spam filter extension was deleted", buf, 2u);
      }

    }
    -[IMDFilteringController _getSpamExtensionID](self, "_getSpamExtensionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", CFSTR("NSExtensionIdentifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = objc_msgSend(v9, "isEqualToString:", v15);
              if ((_DWORD)v16)
              {
                v18 = IMOSLoggingEnabled(v16);
                if (v21)
                {
                  if (v18)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v29 = v9;
                      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Spam extension installed matches current spam extension %@. Checking for new spam filter capabilities", buf, 0xCu);
                    }

                  }
                  self->_hasSpamExtensionUpdated = 1;
                  -[IMDFilteringController _updateFilterParamsForFilterExtension](self, "_updateFilterParamsForFilterExtension");
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
                      v29 = v9;
                      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Spam extension deleted matches current spam extension %@.", buf, 0xCu);
                    }

                  }
                  v22 = v9;
                  v23 = v15;
                  im_dispatch_after();

                }
                goto LABEL_33;
              }
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_33:

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "No spam extension currently selected. Not doing anything", buf, 2u);
      }

    }
  }

}

- (void)_relaySMSFilteringSettingsForFilterState:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  uint8_t buf[4];
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (v6)
  {
    v7 = IMSharedHelperDeviceIsiPad();
    if ((v7 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v25 = a3;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Received request to relay SMS filtering settings for filterState: %ld", buf, 0xCu);
        }

      }
      v9 = -[IMDFilteringController _newSMSFilteringSettingsDictForFilterState:](self, "_newSMSFilteringSettingsDictForFilterState:", a3);
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      if (IMOSLoggingEnabled(objc_msgSend(v10, "setObject:forKey:", CFSTR("1"), CFSTR("sV"))))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = (int64_t)v10;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Created SMSFilteringSettings dictionary: %@", buf, 0xCu);
        }

      }
      JWEncodeDictionary();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "_FTCopyGzippedData");
      v14 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 139);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], v15, *MEMORY[0x1E0D34138], v13, *MEMORY[0x1E0D34148], v16, *MEMORY[0x1E0D341C8], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDFilteringController relayController](self, "relayController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:", v17, v19, 1, 0, 0);

      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = CFSTR("NO");
          if (v20)
            v23 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v25 = (int64_t)v23;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Relayed SMSFilteringSettings dictionary: %@", buf, 0xCu);
        }

      }
    }
  }
}

- (id)_newSMSFilteringSettingsDictForFilterState:(int64_t)a3
{
  __CFDictionary *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Creating SMSFilteringSettings dictionary", buf, 2u);
      }

    }
    if (a3 == 1)
    {
      IMGetCachedDomainValueForKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(MEMORY[0x1E0D399F0], "fetchSMSFilterCapabilitiesOptions");
      v11 = v9;
      if (v11)
      {
        v12 = v11;
        CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterExtensionNameKey, v11);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isInternalInstall");

      if (v14)
      {
        v15 = IMGetDomainIntForKey();
        if ((unint64_t)(v15 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
        {
          if (IMOSLoggingEnabled(v15))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v19 = 0;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Forcing SMSFilteringSettings dict", v19, 2u);
            }

          }
          CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterExtensionNameKey, CFSTR("DefaultsOverrideExtension"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              sub_1D166C968();
            goto LABEL_16;
          }
          goto LABEL_13;
        }
      }
      v10 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1D166C968();
      goto LABEL_16;
    }
LABEL_13:
    CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterCapabilitiesOptionsKey, v16);
LABEL_16:

  }
  return v4;
}

- (void)_processReceivedSMSFilteringSettingsDictionary:(id)a3 deviceID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSMSFilterSyncEnabled");

  if (v8)
    -[IMDFilteringController _processReceivedSMSFilteringSettingsDictionaryInBlastDoor:deviceID:](self, "_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:deviceID:", v9, v6);

}

- (void)_checkAndUpdateSMSFilteringSettingsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSMSFilterSyncEnabled");

  if (!v11
    || !objc_msgSend(v8, "length")
    || !objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering"))
  {
    goto LABEL_24;
  }
  v12 = -[IMDFilteringController _isSpamFilteringEnabled](self, "_isSpamFilteringEnabled");
  v13 = v12;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v23 = 138413058;
      v24 = v8;
      v25 = 2048;
      v26 = (a4 >> 1) & 1;
      v27 = 2048;
      v28 = a4;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Received SMSFilteringSettings from iPhone:%@ with filterState: %ld, smsFilterCapabilitiesOptions:%lu, filterExtensionName:%@. Checking if we need to update filter params.", (uint8_t *)&v23, 0x2Au);
    }

  }
  v15 = objc_msgSend(MEMORY[0x1E0D399F0], "isValidSMSFilterCapabilitiesOptions:", a4);
  if ((_DWORD)v15)
  {
    if ((a4 & 2) != 0)
    {
      if (v13)
      {
        v19 = objc_msgSend(MEMORY[0x1E0D399F0], "shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:", v8, a4, v9);
        v20 = v19;
      }
      else
      {
        v19 = IMOSLoggingEnabled(-[IMDFilteringController _enableSpamFiltering](self, "_enableSpamFiltering"));
        if ((_DWORD)v19)
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "SMS Filtering state changed from disabled to enabled. Need to update filter params.", (uint8_t *)&v23, 2u);
          }

        }
        v20 = 1;
      }
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Received values not present in SMSFilterSyncDeviceParams array. Need to update filter params.", (uint8_t *)&v23, 2u);
        }

        if ((v20 & 1) == 0)
          goto LABEL_17;
      }
      else if (!v20)
      {
        goto LABEL_17;
      }
    }
    else
    {
      if (!v13)
        goto LABEL_24;
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v23, 2u);
        }

      }
    }
  }
  else
  {
    a4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D399F0], "updateSMSFilterCapabilitiesOptionsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:", v8, a4, v9);
LABEL_17:
  if (v13)
  {
    v17 = objc_msgSend(MEMORY[0x1E0D399F0], "isSMSFilteringEnabledInSMSFilterCapabilitiesOptions");
    if ((v17 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v23, 2u);
        }

      }
      -[IMDFilteringController _disableSpamFiltering](self, "_disableSpamFiltering");
    }
  }
LABEL_24:

}

- (void)_enableSpamFiltering
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enabling Spam Filtering", v7, 2u);
      }

    }
    -[IMDFilteringController _updateSpamFilteringState:](self, "_updateSpamFilteringState:", 1);
  }
}

- (void)_disableSpamFilteringAndRelay
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled(-[IMDFilteringController _disableSpamFiltering](self, "_disableSpamFiltering")))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Relaying to peers.", buf, 2u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15E1F30;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_disableSpamFiltering
{
  CFPreferencesSetAppValue(CFSTR("spamFilterExtensionParams"), 0, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionID"), 0, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionName"), 0, CFSTR("com.apple.MobileSMS"));
  -[IMDFilteringController _updateSpamFilteringState:](self, "_updateSpamFilteringState:", 0);
}

- (void)_updateSpamFilteringState:(int64_t)a3
{
  void *v3;
  int v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertSpamFiltration"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (!v4 || objc_msgSend(MEMORY[0x1E0D39AF8], "isFilterUnknownSendersEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed"), 0, 0, 1u);
  }
}

- (void)handler:(id)a3 incomingSMSFilteringSettingsMessage:(id)a4 fromToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSMSFilterSyncEnabled");

  if (v12 && objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering"))
  {
    -[IMDFilteringController relayController](self, "relayController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enrollmentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_approveSelfForSMSRelay");

    -[IMDFilteringController relayController](self, "relayController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "idsDeviceFromPushToken:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v16, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Incoming SMSFilteringSettings message from %@", (uint8_t *)&v21, 0xCu);

      }
    }
    objc_msgSend(v16, "uniqueIDOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDFilteringController _processReceivedSMSFilteringSettingsDictionary:deviceID:](self, "_processReceivedSMSFilteringSettingsDictionary:deviceID:", v9, v20);

  }
}

- (BOOL)_storeSpamCompletionBlock:(id)a3 forMessageGUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSMutableDictionary *spamBlockMap;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary **p_spamBlockMap;
  NSMutableDictionary *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    -[NSMutableDictionary objectForKey:](self->_spamBlockMap, "objectForKey:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v23 = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Using existing mapping mapping from %@ to %@", (uint8_t *)&v23, 0x16u);
      }

    }
    spamBlockMap = self->_spamBlockMap;
    if (!spamBlockMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v17 = self->_spamBlockMap;
      p_spamBlockMap = &self->_spamBlockMap;
      *p_spamBlockMap = (NSMutableDictionary *)Mutable;

      spamBlockMap = *p_spamBlockMap;
    }
    v18 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](spamBlockMap, "setObject:forKey:", v18, v7);

    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = _Block_copy(v6);
        v23 = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v21;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Generated mapping from %@ to %@", (uint8_t *)&v23, 0x16u);

      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Cannot store completion block for guid as either guid or completion block is invalid", (uint8_t *)&v23, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (void)_executeSpamCompletionBlockForMessageGuid:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5 receivedViaRelay:(BOOL)a6
{
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[NSMutableDictionary objectForKey:](self->_spamBlockMap, "objectForKey:", v10);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[IMDFilteringController _isMessageCategorized:](self, "_isMessageCategorized:", a4))
    {
      -[IMDFilteringController _getSpamExtensionName](self, "_getSpamExtensionName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    ((void (**)(_QWORD, int64_t, int64_t, void *))v11)[2](v11, a4, a5, v12);
    -[IMDFilteringController _clearSpamMapForMessageGUID:](self, "_clearSpamMapForMessageGUID:", v10);

  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "executeSpamCompletionBlockForMessageGuid: %@ Aready ran completion block, not doing anything", (uint8_t *)&v18, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSMSFilterSyncEnabled");

  if ((v15 & 1) == 0)
  {
    -[IMDFilteringController relayController](self, "relayController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a6)
      objc_msgSend(v16, "_clearSMSRelayMapForMessageWithGUID:", v10);
    else
      objc_msgSend(v16, "_executeSMSRelayBlockForMessageWithGUID:category:subCategory:", v10, a4, a5);

  }
}

- (void)_clearSpamMapForMessageGUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *spamBlockMap;
  int v7;
  id v8;
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
      v8 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing spam block mapping for %@", (uint8_t *)&v7, 0xCu);
    }

  }
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_spamBlockMap, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_spamBlockMap, "count"))
    {
      spamBlockMap = self->_spamBlockMap;
      self->_spamBlockMap = 0;

    }
  }

}

- (id)relayController
{
  return +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
}

- (void)categorizeIncomingMessage:(id)a3 messageGUID:(id)a4 sender:(id)a5 wasRelayed:(BOOL)a6 chatIdentifier:(id)a7 participants:(id)a8 checkingForSpam:(BOOL *)a9 myReceiverISOCountryCode:(id)a10 messageBody:(id)a11 completion:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v33;

  v33 = a3;
  v30 = a12;
  v29 = a11;
  v28 = a10;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  if (objc_msgSend(v33, "has_spamCategory"))
    v20 = objc_msgSend(v33, "spamCategory");
  else
    v20 = 0;
  objc_msgSend(v33, "smsFilteringSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "originatedDeviceUniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v33, "filterSubCategory");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isSMSFilterSyncEnabled");

  if ((v25 & ((unint64_t)(v23 - 1) < 0xC)) != 0)
    v26 = v23;
  else
    v26 = 0;
  LOBYTE(v27) = a6;
  -[IMDFilteringController categorizeIncomingMessage:deviceID:category:subCategory:messageGUID:sender:wasRelayed:chatIdentifier:participants:checkingForSpam:myReceiverISOCountryCode:messageBody:completion:](self, "categorizeIncomingMessage:deviceID:category:subCategory:messageGUID:sender:wasRelayed:chatIdentifier:participants:checkingForSpam:myReceiverISOCountryCode:messageBody:completion:", v21, v22, v20, v26, v19, v18, v27, v17, v16, a9, v28, v29, v30);

}

- (void)categorizeIncomingMessageGUID:(id)a3 sender:(id)a4 wasRelayed:(BOOL)a5 chatIdentifier:(id)a6 participants:(id)a7 checkingForSpam:(BOOL *)a8 myReceiverISOCountryCode:(id)a9 messageBody:(id)a10 completion:(id)a11
{
  uint64_t v11;

  LOBYTE(v11) = a5;
  -[IMDFilteringController categorizeIncomingMessage:deviceID:category:subCategory:messageGUID:sender:wasRelayed:chatIdentifier:participants:checkingForSpam:myReceiverISOCountryCode:messageBody:completion:](self, "categorizeIncomingMessage:deviceID:category:subCategory:messageGUID:sender:wasRelayed:chatIdentifier:participants:checkingForSpam:myReceiverISOCountryCode:messageBody:completion:", 0, 0, 0, 0, a3, a4, v11, a6, a7, a8, a9, a10, a11);
}

- (void)categorizeIncomingMessage:(id)a3 deviceID:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 messageGUID:(id)a7 sender:(id)a8 wasRelayed:(BOOL)a9 chatIdentifier:(id)a10 participants:(id)a11 checkingForSpam:(BOOL *)a12 myReceiverISOCountryCode:(id)a13 messageBody:(id)a14 completion:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(id, uint64_t, uint64_t, _QWORD);
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v19 = a4;
  v39 = a7;
  v20 = a8;
  v21 = a10;
  v22 = a11;
  v37 = a13;
  v23 = a14;
  v24 = (void (**)(id, uint64_t, uint64_t, _QWORD))a15;
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v39;
      v44 = 2112;
      v45 = (uint64_t)v21;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Looking at message with guid %@ for chatid %@, will check if it needs to be sent to spam extension app", buf, 0x16u);
    }

  }
  v40 = 0;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isSMSFilterSyncEnabled");

  if (!v27)
  {
    if (-[IMDFilteringController _shouldCheckChatForSMSSpam:participants:sender:fallbackFilterCategory:fallbackFilterSubCategory:](self, "_shouldCheckChatForSMSSpam:participants:sender:fallbackFilterCategory:fallbackFilterSubCategory:", v21, v22, v20, &v41, &v40))
    {
LABEL_19:
      *a12 = 1;
      -[IMDFilteringController _smsSpamCheck:withMessageBody:withGuid:sender:receiverISOCountryCode:receivedViaRelay:](self, "_smsSpamCheck:withMessageBody:withGuid:sender:receiverISOCountryCode:receivedViaRelay:", v24, v23, v39, v20, v37, a9);
      goto LABEL_29;
    }
LABEL_22:
    v24[2](v24, v41, v40, 0);
    goto LABEL_29;
  }
  v28 = objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering");
  if (!(_DWORD)v28)
  {
    if (-[IMDFilteringController _shouldCheckChatForSMSSpam:participants:sender:fallbackFilterCategory:fallbackFilterSubCategory:](self, "_shouldCheckChatForSMSSpam:participants:sender:fallbackFilterCategory:fallbackFilterSubCategory:", v21, v22, v20, &v41, &v40))
    {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled(v28))
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", buf, 2u);
    }

  }
  v30 = objc_msgSend(v19, "length");
  if (v38 && v30)
  {
    objc_msgSend(v38, "filterExtensionName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v38, "smsFilterCapabilitiesOptions");
    if (IMOSLoggingEnabled(v32))
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v43 = v31;
        v44 = 2048;
        v45 = v32;
        v46 = 2112;
        v47 = v19;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", buf, 0x20u);
      }

    }
    -[IMDFilteringController _checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:](self, "_checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:", v19, v32, v31);

  }
  else if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v19;
      _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", buf, 0xCu);
    }

  }
  -[IMDFilteringController _categorizeRelayMessageWithCategory:subCategory:deviceID:completion:](self, "_categorizeRelayMessageWithCategory:subCategory:deviceID:completion:", a5, a6, v19, v24);
LABEL_29:

}

- (void)disableFilteringIfNeeded
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    if (-[IMDFilteringController _isSpamFilteringEnabled](self, "_isSpamFilteringEnabled"))
    {
      v5 = objc_msgSend(MEMORY[0x1E0D399F0], "isSMSFilteringEnabledInSMSFilterCapabilitiesOptions");
      if ((v5 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v5))
        {
          OSLogHandleForIMFoundationCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v7 = 0;
            _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "No more relay devices available. SMS Filtering state changed from enabled to disabled. Need to update filter params.", v7, 2u);
          }

        }
        -[IMDFilteringController _disableSpamFiltering](self, "_disableSpamFiltering");
      }
    }
  }
}

- (void)_relayCurrentSMSFilteringSettings
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Received request to relay current SMS filtering settings", v7, 2u);
      }

    }
    -[IMDFilteringController _relaySMSFilteringSettingsForFilterState:](self, "_relaySMSFilteringSettingsForFilterState:", -[IMDFilteringController _isSpamFilteringEnabled](self, "_isSpamFilteringEnabled"));
  }
}

- (BOOL)hasSpamExtensionUpdated
{
  return self->_hasSpamExtensionUpdated;
}

- (void)setHasSpamExtensionUpdated:(BOOL)a3
{
  self->_hasSpamExtensionUpdated = a3;
}

- (NSMutableDictionary)spamBlockMap
{
  return self->_spamBlockMap;
}

- (void)setSpamBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_spamBlockMap, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_spamBlockMap, 0);
}

@end
