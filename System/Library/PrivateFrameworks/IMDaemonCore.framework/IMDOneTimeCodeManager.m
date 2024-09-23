@implementation IMDOneTimeCodeManager

+ (id)sharedInstance
{
  if (qword_1ED935C48 != -1)
    dispatch_once(&qword_1ED935C48, &unk_1E92288D8);
  return (id)qword_1ED935D70;
}

- (IMDOneTimeCodeManager)initWithBroadcaster:(id)a3 otcUtilities:(id)a4
{
  IMDOneTimeCodeManager *v6;
  IMDOneTimeCodeManager *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFTypeRef v9;
  __CFNotificationCenter *v10;
  CFTypeRef v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMDOneTimeCodeManager;
  v6 = -[IMDOneTimeCodeManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    -[IMDOneTimeCodeManager setValidCodes:](v6, "setValidCodes:", MEMORY[0x1E0C9AA60]);
    -[IMDOneTimeCodeManager setOtcUtilities:](v7, "setOtcUtilities:", a4);
    -[IMDOneTimeCodeManager setBroadcasterOverride:](v7, "setBroadcasterOverride:", a3);
    v7->_syncedSettingsManager = (IMSyncedSettingsManaging *)objc_alloc_init(IMDSyncedSettingsServiceManager);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v9 = CFRetain(v7);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_1D1440DD4, CFSTR("EDOneTimeCodeOnboardingAlertUserSelectedEnableNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    v11 = CFRetain(v7);
    CFNotificationCenterAddObserver(v10, v11, (CFNotificationCallback)sub_1D1440E0C, CFSTR("EDOneTimeCodeOnboardingAlertUserSelectedDisableNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v7;
}

- (IMDOneTimeCodeManager)init
{
  return (IMDOneTimeCodeManager *)MEMORY[0x1E0DE7D20](self, sel_initWithBroadcaster_otcUtilities_);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](-[IMDOneTimeCodeManager codeInvalidationTimer](self, "codeInvalidationTimer"), "invalidate");
  -[IMDOneTimeCodeManager setCodeInvalidationTimer:](self, "setCodeInvalidationTimer:", 0);
  -[IMDOneTimeCodeManager setValidCodes:](self, "setValidCodes:", 0);
  -[IMDOneTimeCodeManager setBroadcaster:](self, "setBroadcaster:", 0);
  -[IMDOneTimeCodeManager setBroadcasterOverride:](self, "setBroadcasterOverride:", 0);
  -[IMDOneTimeCodeManager setOtcUtilities:](self, "setOtcUtilities:", 0);
  -[IMDOneTimeCodeManager setSyncedSettingsManager:](self, "setSyncedSettingsManager:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMDOneTimeCodeManager;
  -[IMDOneTimeCodeManager dealloc](&v3, sel_dealloc);
}

- (void)startTrackingCode:(id)a3
{
  uint64_t v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[IMOneTimeCodeUtilities isValidOneTimeCode:](-[IMDOneTimeCodeManager otcUtilities](self, "otcUtilities"), "isValidOneTimeCode:", a3);
  v6 = v5;
  v7 = IMOSLoggingEnabled(v5);
  if (v6)
  {
    if (v7)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C30]);
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Asked to track a new OTC with guid %@", (uint8_t *)&v12, 0xCu);
      }
    }
    -[IMDOneTimeCodeManager _setNewCodeAndPrepareInvalidationTimer:](self, "_setNewCodeAndPrepareInvalidationTimer:", a3);
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C38]);
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C40]);
    IMGreenTeaReceived2FACode();
    -[IMDOneTimeCodeManager broadcastCodeStatusToClients](self, "broadcastCodeStatusToClients");
  }
  else if (v7)
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C30]);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Asked to track a OTC but code appears to be invalid %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)broadcastCodeStatusToClients
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Send out OTC to all interested clients.", v4, 2u);
    }
  }
  -[IMDaemonListenerProtocol oneTimeCodesDidChange:](-[IMDOneTimeCodeManager broadcaster](self, "broadcaster"), "oneTimeCodesDidChange:", -[IMDOneTimeCodeManager validCodes](self, "validCodes"));
}

- (void)consumeCodeWithGuid:(id)a3
{
  -[IMDOneTimeCodeManager consumeCodeWithGuid:codeExpired:](self, "consumeCodeWithGuid:codeExpired:", a3, 0);
}

- (void)consumeCodeWithGuid:(id)a3 codeExpired:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[6];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = a3;
      v17 = 1024;
      LODWORD(v18) = v4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Consuming code for message guid: %@, expried: %{BOOL}d", buf, 0x12u);
    }
  }
  v8 = -[NSArray firstObject](-[IMDOneTimeCodeManager validCodes](self, "validCodes"), "firstObject");
  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C30]);
  v10 = objc_msgSend(v9, "length");
  if (v10 && (v10 = objc_msgSend(v9, "isEqualToString:", a3), (_DWORD)v10))
  {
    if (IMOSLoggingEnabled(v10))
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = a3;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Clearing code for GUID: %@", buf, 0xCu);
      }
    }
    -[IMDOneTimeCodeManager _setNewCodeAndPrepareInvalidationTimer:](self, "_setNewCodeAndPrepareInvalidationTimer:", 0);
    if (!v4)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1D14413F0;
      v14[3] = &unk_1E9228900;
      v14[4] = self;
      v14[5] = a3;
      -[IMDOneTimeCodeManager onboardDeleteVerificationCodesIfNeededWithCompletionHandler:](self, "onboardDeleteVerificationCodesIfNeededWithCompletionHandler:", v14);
    }
  }
  else if (IMOSLoggingEnabled(v10))
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](-[IMDOneTimeCodeManager validCodes](self, "validCodes"), "count"));
      *(_DWORD *)buf = 138412546;
      v16 = a3;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Asked to consume code for guid %@, but unable, current code count: %@", buf, 0x16u);
    }
  }
  -[IMDOneTimeCodeManager broadcastCodeStatusToClients](self, "broadcastCodeStatusToClients");
}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  IMSyncedSettingsManaging *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Delete Verification Codes | Setting deletion preference to: %{BOOL}d", (uint8_t *)v7, 8u);
    }
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isSyncedSettingsEnabled"))
  {
    v6 = -[IMDOneTimeCodeManager syncedSettingsManager](self, "syncedSettingsManager");
    -[IMSyncedSettingsManaging setSettingValue:forKey:](v6, "setSettingValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), 2);
  }
  else
  {
    IMSetDomainBoolForKey();
  }
}

- (BOOL)autoDeletionPreference
{
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isSyncedSettingsEnabled"))v3 = objc_msgSend((id)-[IMSyncedSettingsManaging settingValueForKey:](-[IMDOneTimeCodeManager syncedSettingsManager](self, "syncedSettingsManager"), "settingValueForKey:", 2), "BOOLValue");
  else
    v3 = IMGetDomainBoolForKey();
  v4 = v3;
  if (IMOSLoggingEnabled(v3))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Delete Verification Codes | Reading deletion preference as: %{BOOL}d", (uint8_t *)v7, 8u);
    }
  }
  return v4;
}

- (id)_localizedStringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = IMDaemonCoreBundle();
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), "localeIdentifier");
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = objc_msgSend(v4, "localizations");
  v20[0] = v5;
  v8 = objc_msgSend((id)objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1)), "firstObject");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = v5;
  v11 = (void *)objc_msgSend(v4, "localizedStringForKey:value:table:localization:", a3, 0, CFSTR("DaemonCoreLocalizable"), v10);
  if (IMOSLoggingEnabled(v11))
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Attempting to localize string for localeID: %@, preferredLocalization: %@, message: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  return v11;
}

- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3
{
  -[IMDOneTimeCodeManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("OTP_CLEANUP_ALERT_MESSAGE"));
  MEMORY[0x1E0DE7D20](self, sel_onboardDeleteVerificationCodesIfNeededWithMessage_completionHandler_);
}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[6];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v21 = (id)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0D38C28]);
  if (objc_msgSend(v21, "integerForKey:", *MEMORY[0x1E0D38C20]))
  {
    if (a4)
      (*((void (**)(id, uint64_t))a4 + 2))(a4, 2);

  }
  else
  {
    v8 = -[IMDOneTimeCodeManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("OTP_CLEANUP_ALERT_TITLE"));
    v9 = -[IMDOneTimeCodeManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("OTP_CLEANUP_ALERT_CONFIRM"));
    v10 = -[IMDOneTimeCodeManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("OTP_CLEANUP_ALERT_CANCEL"));
    v11 = *MEMORY[0x1E0D36938];
    v27[0] = *MEMORY[0x1E0D36958];
    v27[1] = v11;
    v28[0] = v8;
    v28[1] = a3;
    v12 = *MEMORY[0x1E0D36940];
    v27[2] = *MEMORY[0x1E0D36928];
    v27[3] = v12;
    v28[2] = v9;
    v28[3] = v10;
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4), "mutableCopy");
    v14 = -[IMDOneTimeCodeManager _urlForPasswordsIcon](self, "_urlForPasswordsIcon");
    if (v14)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D36930]);
    v15 = (void *)objc_msgSend(MEMORY[0x1E0D36B00], "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID", v14), 3, 32, v13, 0.0);

    v17 = IMOSLoggingEnabled(v16);
    if (v15)
    {
      if (v17)
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v8;
          v25 = 2112;
          v26 = a3;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Delete Verification Codes | Presenting Delete Verification Codes notification with title: \"%@\" message: \"%@\", buf, 0x16u);
        }
      }
      objc_msgSend(v15, "setUsesNotificationCenter:", 0);
      objc_msgSend(v15, "setRepresentedApplicationBundle:", *MEMORY[0x1E0D36C08]);
      v19 = (void *)objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_1D1441E0C;
      v22[3] = &unk_1E9228928;
      v22[4] = v21;
      v22[5] = a4;
      objc_msgSend(v19, "addUserNotification:listener:completionHandler:", v15, 0, v22);
    }
    else
    {
      if (v17)
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Delete Verification Codes | Not able to make notification to onboard delete-verfication-codes", buf, 2u);
        }
      }

    }
  }
}

- (id)_urlForPasswordsIcon
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFURL *v8;
  CGImageDestination *v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", CFSTR("com.apple.Passwords-Settings.extension"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 200.0, 200.0, 1.0);
  v4 = (void *)objc_msgSend(v2, "prepareImageForDescriptor:", v3);

  if (objc_msgSend(v4, "placeholder"))
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D166632C(v5);
    return 0;
  }
  else
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", CFSTR("otpOnboardingIcon.tiff"));
    v6 = v7;
    if (v7)
      v8 = (const __CFURL *)CFRetain(v7);
    else
      v8 = 0;
    v9 = CGImageDestinationCreateWithURL(v8, (CFStringRef)*MEMORY[0x1E0CA5C80], 1uLL, 0);
    CGImageDestinationAddImage(v9, (CGImageRef)objc_msgSend(v4, "CGImage"), 0);
    CGImageDestinationFinalize(v9);
    CFRelease(v8);
    CFRelease(v9);
  }
  return v6;
}

- (void)moveOneTimeCodeToRecentlyDeleted:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  int v17;
  _QWORD *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = IMOSLoggingEnabled(self);
  if ((_DWORD)v5)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    v5 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if ((_DWORD)v5)
    {
      *(_DWORD *)buf = 138412290;
      v28 = a3;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Delete Verification Codes | Attempting to move message with OTP code (guid: %@) to recently deleted.", buf, 0xCu);
    }
  }
  if (a3)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32[0] = a3;
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v9 = -[IMDMessageStore chatForMessageGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "chatForMessageGUID:", a3);
    v10 = v9;
    if (v9)
    {
      v31 = objc_msgSend(v9, "guid");
      v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v11 = v9;
    }
    else
    {
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    v12 = IMOSLoggingEnabled(v9);
    if ((_DWORD)v12)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      v12 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if ((_DWORD)v12)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v10;
        v29 = 2112;
        v30 = a3;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found chat: %@ for codeMessageGUID: %@", buf, 0x16u);
      }
    }
    if (v10)
    {
      v25[0] = CFSTR("message");
      v25[1] = CFSTR("isPermanentDelete");
      v26[0] = v8;
      v26[1] = MEMORY[0x1E0C9AAA0];
      v25[2] = CFSTR("recoverableDeleteDate");
      v26[2] = v7;
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
      v15 = (void *)objc_msgSend(v10, "serviceName");
      v16 = (_QWORD *)MEMORY[0x1E0D38F58];
      v17 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D38F58]);
      v18 = (_QWORD *)MEMORY[0x1E0D38F68];
      if (v17)
        v18 = v16;
      objc_msgSend(-[IMDAccountController anySessionForServiceName:](+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"), "anySessionForServiceName:", *v18), "sendDeleteCommand:forChatGUID:", v14, objc_msgSend(v10, "guid"));
    }
    else if (IMOSLoggingEnabled(v12))
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = a3;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Delete Verification Codes | Could not derive chat from codeMessageGUID: %@", buf, 0xCu);
      }
    }
    -[IMDMessageStore retractPostedNotificationsForMessageGUIDs:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "retractPostedNotificationsForMessageGUIDs:", v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39890], "sharedInstance"), "deleteInteractionsWithMessageGUIDs:", v8);
    -[IMDChatRegistry moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:](+[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance"), "moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:", v8, v7);
    -[IMDMessageStore updateStamp](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "updateStamp");
    -[IMDOneTimeCodeManager _updateLastMessageTimeStampForChat:](self, "_updateLastMessageTimeStampForChat:", v10);
    if (IMOSLoggingEnabled(objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListeners](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListeners"), "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v8, v11, 0)))
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = a3;
        v21 = "Delete Verification Codes | Finished moving message with OTP code (guid: %@) to recently deleted.";
        v22 = v20;
        v23 = 12;
LABEL_24:
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, v21, buf, v23);
      }
    }
  }
  else if (IMOSLoggingEnabled(v5))
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v21 = "Delete Verification Codes | codeMessageGUID is nil. Early returning.";
      v22 = v24;
      v23 = 2;
      goto LABEL_24;
    }
  }
}

- (void)_updateLastMessageTimeStampForChat:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setLastMessage:", -[IMDMessageStore lastMessageForChatWithRowID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "lastMessageForChatWithRowID:", objc_msgSend(a3, "rowID")));
  if (objc_msgSend(a3, "lastMessage"))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastMessage"), "time"), "timeIntervalSinceReferenceDate");
    v5 = (uint64_t)v4;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(a3, "setLastMessageTimeStampOnLoad:", v5);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isAVLessSharePlayEnabled");
  if ((_DWORD)v6)
  {
    v7 = -[IMDMessageStore lastTUConversationItemForChat:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "lastTUConversationItemForChat:", a3);
    if (!v7)
    {
      v10 = a3;
      v9 = 0;
      goto LABEL_9;
    }
    v8 = v7;
    if (objc_msgSend(v7, "time"))
    {
      v9 = objc_msgSend(v8, "time");
      v10 = a3;
LABEL_9:
      v6 = objc_msgSend(v10, "setLastTUConversationCreatedDate:", v9);
      goto LABEL_10;
    }
    v14 = IMLogHandleForCategory();
    v6 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v6)
      sub_1D1666194((uint64_t)v8, v14);
  }
LABEL_10:
  if (IMOSLoggingEnabled(v6))
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(a3, "guid");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastMessage"), "time"), "timeIntervalSinceReferenceDate");
      v15 = 138413058;
      v16 = v12;
      v17 = 2112;
      v18 = objc_msgSend(v13, "numberWithDouble:");
      v19 = 2112;
      v20 = objc_msgSend(a3, "lastTUConversationCreatedDate");
      v21 = 2112;
      v22 = objc_msgSend(a3, "lastScheduledMessageCreatedDate");
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Verification Code | IMChat: %@, updating last message timestamp on load: %@ lastTUConversationCreatedDate: %@ lastScheduledMessageCreatedDate: %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListeners](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListeners"), "chat:lastMessageTimeStampOnLoadUpdated:", objc_msgSend(a3, "guid"), (double)objc_msgSend(a3, "lastMessageTimeStampOnLoad"));
}

- (IMDaemonListenerProtocol)broadcaster
{
  if (-[IMDOneTimeCodeManager broadcasterOverride](self, "broadcasterOverride"))
    return -[IMDOneTimeCodeManager broadcasterOverride](self, "broadcasterOverride");
  else
    return (IMDaemonListenerProtocol *)-[IMDBroadcasterProviding broadcasterForAllListeners](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForAllListeners");
}

- (IMOneTimeCodeUtilities)otcUtilities
{
  IMOneTimeCodeUtilities *result;

  result = self->_otcUtilities;
  if (!result)
  {
    result = (IMOneTimeCodeUtilities *)objc_alloc_init(MEMORY[0x1E0D399A0]);
    self->_otcUtilities = result;
  }
  return result;
}

- (void)_setNewCodeAndPrepareInvalidationTimer:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NSTimer invalidate](-[IMDOneTimeCodeManager codeInvalidationTimer](self, "codeInvalidationTimer"), "invalidate");
  if (a3)
  {
    v7[0] = a3;
    -[IMDOneTimeCodeManager setValidCodes:](self, "setValidCodes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
    v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38C30]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1D14427CC;
    v6[3] = &unk_1E9228950;
    v6[4] = v5;
    v6[5] = self;
    -[IMDOneTimeCodeManager setCodeInvalidationTimer:](self, "setCodeInvalidationTimer:", objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, (double)qword_1EFC5FBB0));
  }
  else
  {
    -[IMDOneTimeCodeManager setValidCodes:](self, "setValidCodes:", MEMORY[0x1E0C9AA60]);
  }
}

- (NSArray)validCodes
{
  return self->_validCodes;
}

- (void)setValidCodes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSTimer)codeInvalidationTimer
{
  return self->_codeInvalidationTimer;
}

- (void)setCodeInvalidationTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setBroadcaster:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (IMDaemonListenerProtocol)broadcasterOverride
{
  return self->_broadcasterOverride;
}

- (void)setBroadcasterOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setOtcUtilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (IMSyncedSettingsManaging)syncedSettingsManager
{
  return self->_syncedSettingsManager;
}

- (void)setSyncedSettingsManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
