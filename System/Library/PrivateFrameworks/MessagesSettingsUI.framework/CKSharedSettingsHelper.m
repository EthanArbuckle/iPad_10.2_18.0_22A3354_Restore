@implementation CKSharedSettingsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __40__CKSharedSettingsHelper_sharedInstance__block_invoke()
{
  CKSharedSettingsHelper *v0;
  void *v1;

  v0 = objc_alloc_init(CKSharedSettingsHelper);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)setReadReceiptsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  MEMORY[0x24269E2AC](CFSTR("com.apple.madrid"), CFSTR("GlobalReadReceiptVersionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "integerValue") + 1;
  else
    v6 = 1;
  CFPreferencesSetAppValue(CFSTR("GlobalReadReceiptVersionID"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6), CFSTR("com.apple.madrid"));
  CFPreferencesSetAppValue(CFSTR("ReadReceiptsEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("com.apple.madrid"));
  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.ReadReceiptsEnabled.changed"), 0, 0, 1u);
  notify_post(CFSTR("com.apple.MobileSMS.ReadReceiptsEnabled.shouldUpdateDevices"));
  if (PSIsNanoMirroringDomain())
  {
    -[CKSharedSettingsHelper _syncManager](self, "_syncManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ReadReceiptsEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.madrid"), v9);

  }
}

- (BOOL)areReadReceiptsEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ReadReceiptsEnabled"), CFSTR("com.apple.madrid"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)setConversationListFilteringEnabled:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void (*v5)(void);
  void *v6;
  id v7;

  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltration"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltrationForcedOn"), (CFPropertyListRef)*MEMORY[0x24BDBD268], CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("MessageFilteringSettingsConfirmed"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0, 0, 1u);
  v5 = (void (*)(void))MEMORY[0x24269E300]("CKResetBlackholeEnabledCache", CFSTR("ChatKit"));
  if (v5)
    v5();
  -[CKSharedSettingsHelper _syncManager](self, "_syncManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("IncomingMessageAlertFiltration"), CFSTR("IncomingMessageAlertFiltrationForcedOn"), CFSTR("MessageFilteringSettingsConfirmed"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v6);

}

- (BOOL)getRaiseToListenEnabled
{
  BOOL result;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("RaiseToListenEnabled"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
    return -[CKSharedSettingsHelper isRaiseGestureSupported](self, "isRaiseGestureSupported");
  return result;
}

- (void)setRaiseToListenEnabled:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("RaiseToListenEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.RaiseToListenEnabled.changed"), 0, 0, 1u);
}

- (BOOL)isRaiseGestureSupported
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CKSharedSettingsHelper_isRaiseGestureSupported__block_invoke;
  block[3] = &unk_2511BD1D8;
  block[4] = self;
  if (isRaiseGestureSupported_once[0] != -1)
    dispatch_once(isRaiseGestureSupported_once, block);
  return isRaiseGestureSupported_isRaiseGestureSupported;
}

uint64_t __49__CKSharedSettingsHelper_isRaiseGestureSupported__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDC13D8], "isGestureServiceAvailable");
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "_isProximityMonitoringSupported");
  isRaiseGestureSupported_isRaiseGestureSupported = result;
  return result;
}

- (BOOL)_isProximityMonitoringSupported
{
  return MGGetBoolAnswer();
}

+ (id)currentKeepMessages
{
  return +[CKKeepMessagesPreferenceManager keepMessagesPreference](CKKeepMessagesPreferenceManager, "keepMessagesPreference");
}

+ (BOOL)currentMessageAutoKeepForType
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AutomaticallySaveAudioMessagesEnabled"), CFSTR("com.apple.imessage"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (int)currentMessageAutoKeepOptionForType
{
  void *v2;
  int v3;

  if (!objc_msgSend((id)objc_opt_class(), "currentMessageAutoKeepForType"))
    return 0;
  objc_msgSend((id)objc_opt_class(), "currentKeepMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "integerValue") == 30)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "integerValue") == 365)
  {
    v3 = 2;
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

- (id)getAudioMessageAutoKeep
{
  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "currentMessageAutoKeepOptionForType"));
}

- (void)setAudioMessageAutoKeep:(id)a3
{
  const void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "integerValue"))
    v4 = (const void *)MEMORY[0x24BDBD1C8];
  else
    v4 = (const void *)MEMORY[0x24BDBD1C0];
  CFPreferencesSetAppValue(CFSTR("AutomaticallySaveAudioMessagesEnabled"), v4, CFSTR("com.apple.imessage"));
  CFPreferencesSynchronize(CFSTR("com.apple.imessage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  -[CKSharedSettingsHelper _syncManager](self, "_syncManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("AutomaticallySaveAudioMessagesEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.imessage"), v5);

}

- (BOOL)shouldShowMMS
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_subscriptionsWithMMSSupport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "count") != 0;
  return (char)v2;
}

- (BOOL)shouldShowCheckInLocationHistorySettings
{
  const void *v3;
  const void *v4;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    if (!CFEqual(v3, CFSTR("iPhone")))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = 138412290;
          v9 = v4;
          _os_log_impl(&dword_24190B000, v7, OS_LOG_TYPE_INFO, "Check In not supported for device type: %@", (uint8_t *)&v8, 0xCu);
        }

      }
      CFRelease(v4);
      return 0;
    }
    CFRelease(v4);
  }
  if (-[CKSharedSettingsHelper isCheckInAllowedInRegion](self, "isCheckInAllowedInRegion"))
  {
    if ((objc_msgSend(MEMORY[0x24BE83470], "hasUserCompletedOnboarding") & 1) != 0)
      return _os_feature_enabled_impl();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_24190B000, v6, OS_LOG_TYPE_INFO, "Check In onboarding not completed", (uint8_t *)&v8, 2u);
      }
LABEL_19:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_24190B000, v6, OS_LOG_TYPE_INFO, "Check In not supported in region", (uint8_t *)&v8, 2u);
    }
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)isCheckInAllowedInRegion
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7D058], "currentEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BE7D058], "lastKnownEstimates");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24190B000, v16, OS_LOG_TYPE_INFO, "Unable to determine Check In availability", buf, 2u);
        }

      }
      v13 = 1;
      goto LABEL_23;
    }
    v2 = v3;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v2;
      _os_log_impl(&dword_24190B000, v4, OS_LOG_TYPE_INFO, "Current regulatory domain: %@", buf, 0xCu);
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v2;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x24269E48C](v5);
        objc_msgSend(v9, "countryCode", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("KR"));

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_impl(&dword_24190B000, v14, OS_LOG_TYPE_INFO, "Check In not available in regulatory domain: %@", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v10);
          v13 = 0;
          goto LABEL_22;
        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_22:

LABEL_23:
  return v13;
}

- (id)_syncManager
{
  objc_class *v2;

  v2 = (objc_class *)MEMORY[0x24269E2F4](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync"));
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

@end
