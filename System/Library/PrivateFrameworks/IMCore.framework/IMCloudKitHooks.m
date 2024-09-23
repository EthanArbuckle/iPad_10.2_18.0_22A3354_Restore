@implementation IMCloudKitHooks

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (BOOL)isEnabled
{
  int v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainBoolForKeyWithDefaultValue();
  v3 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v2)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "isEnabled returning = isCloudKitEnabled = %@ isInExitState(%@) ", (uint8_t *)&v8, 0x16u);
    }

  }
  return v2;
}

- (IMCloudKitHooks)init
{
  IMCloudKitHooks *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMCloudKitHooks;
  v2 = -[IMCloudKitHooks init](&v4, sel_init);
  if (v2)
    dispatch_async(MEMORY[0x1E0C80D38], &unk_1E471BA20);
  return v2;
}

- (void)broadcastCloudKitState
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastCloudKitState");

}

- (void)_updateCloudKitStateWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  -[IMCloudKitHooks logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1A2199414((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), self, v4);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200CE0C;
  block[3] = &unk_1E471F058;
  block[4] = a1;
  if (qword_1ECF12428 != -1)
    dispatch_once(&qword_1ECF12428, block);
  return (id)qword_1ECF12408;
}

+ (id)logHandle
{
  if (qword_1ECF123E8 != -1)
    dispatch_once(&qword_1ECF123E8, &unk_1E471DC98);
  return (id)qword_1ECF12400;
}

+ (void)__setSingleton__im:(id)a3
{
  objc_storeStrong((id *)&qword_1ECF12408, a3);
}

- (void)uploadDailyAnalyticstoCloudKit
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uploadDailyAnalyticstoCloudKit");

}

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAnalyticDefaultsAndLocalSyncState");

}

- (void)setupIMCloudKitHooks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-CloudKitHooks"), v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addListenerID:capabilities:", v3, *MEMORY[0x1E0D36CB8] | 0x40000000u);

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

}

- (void)createChatZone
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createChatZone");

}

- (void)writeDirtyChats
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeDirtyChats");

}

- (void)deleteChatZone
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteChatZone");

}

- (void)syncChats
{
  id v3;

  IMSetDomainBoolForKey();
  -[IMCloudKitHooks _updateCloudKitState](self, "_updateCloudKitState");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncChats");

}

- (void)markAllChatsAsDirty
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAllChatsAsDirty");

}

- (void)clearChatZoneSyncToken
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearChatZoneSyncToken");

}

- (void)createAttachmentZone
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAttachmentZone");

}

- (void)writeAttachments
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeAttachments");

}

- (void)syncAttachments
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncAttachments");

}

- (void)deleteAttachmentZone
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAttachmentZone");

}

- (void)writeDirtyMessages
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeDirtyMessages");

}

- (void)deleteMessagesZone
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteMessagesZone");

}

- (void)writeExitRecord
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeExitRecord");

}

- (void)fetchExitRecord
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchExitRecord");

}

- (void)deleteExitRecord
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteExitRecord");

}

- (void)syncMessages
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncMessages");

}

- (void)downloadAttachmentAssets
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadAttachmentAssets");

}

- (void)initiatePeriodicSync
{
  id v3;

  IMSetDomainBoolForKey();
  -[IMCloudKitHooks _updateCloudKitState](self, "_updateCloudKitState");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initiatePeriodicSync");

}

- (void)startUserInitiatedSync
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUserInitiatedSync");

}

- (void)loadDirtyMessagesWithLimit:(int64_t)a3
{
  id v4;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadDirtyMessagesWithLimit:", a3);

}

- (void)clearLocalSyncState
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLocalCloudKitSyncState");

}

- (void)clearDataFromCloudKit
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearDataFromCloudKit");

}

- (void)sendRestoreFailuresLogDumps
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRestoreFailuresLogDumps");

}

- (BOOL)shouldShowCloudKitUI
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[IMCloudKitHooks isEnabled](self, "isEnabled");
  v4 = -[IMCloudKitHooks eligibleForTruthZone](self, "eligibleForTruthZone");
  v5 = -[IMCloudKitHooks rampedIntoTruthZone](self, "rampedIntoTruthZone");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (v4)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      if (v5)
        v7 = CFSTR("YES");
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "shouldShowCloudKitUI - isEnabled(%@) eligibleForTruthZone(%@), rampedIntoTruthZone(%@)", (uint8_t *)&v11, 0x20u);
    }

  }
  return v4 & ~v3 & v5;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  -[IMCloudKitHooks _updateCloudKitState](self, "_updateCloudKitState");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      IMStringFromCloudKitChangingSettingState();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Setting cloudkit enabled to state: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCloudKitEnabled:", v3);

}

- (void)currentStorageOnDeviceWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Calculating current storage on device for iCloud", v6, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStorageOnDeviceWithReply:", v3);

}

- (void)performAdditionalStorageRequiredCheck
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Request to check if additinal storage is required to store all messages", v4, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performAdditionalStorageRequiredCheck");

}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAccountStatusAndUpdateMiCSwitchEligibility");

}

- (void)tryToDisableAllDevices
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to try and disable cloudkit on all devices", v5, 2u);
    }

  }
  IMSetDomainBoolForKey();
  -[IMCloudKitHooks _updateCloudKitState](self, "_updateCloudKitState");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tryToDisableAllDevices");

}

- (BOOL)removedFromiCloudBackup
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "removedFromiCloudBackup returning = %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

- (BOOL)rampedIntoTruthZone
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "rampedIntoTruthZone always returning YES, this shouldn't be called anymore.", v4, 2u);
    }

  }
  return 1;
}

- (BOOL)eligibleForTruthZone
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "eligibleForTruthZone returning = %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

- (BOOL)shouldOptimizeAttachmentStorage
{
  return 1;
}

- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Initiating sync phase %@", (uint8_t *)&v12, 0xCu);
    }

  }
  IMSetDomainBoolForKey();
  -[IMCloudKitHooks _updateCloudKitState](self, "_updateCloudKitState");
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "initiateSync:forceRunNow:reply:", v8, v6, v9);

}

- (void)cancelSync:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Sync cancellation requested", v6, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSync:", v3);

}

- (BOOL)isStartingSync
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) != 0)
    v2 = 1;
  else
    v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "isStartingSync returning = %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

- (BOOL)isSyncing
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMessagesIniCloudVersion2");

  if (v3)
  {
    IMGetCachedDomainValueForKey();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject unsignedIntegerValue](v4, "unsignedIntegerValue");
    LOBYTE(v6) = v5 != 0;
    v7 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "isSyncing returning = YES", (uint8_t *)&v11, 2u);
        }
LABEL_16:

      }
    }
    else if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "isSyncing returning = NO", (uint8_t *)&v11, 2u);
      }
      goto LABEL_16;
    }
LABEL_17:

    return v6;
  }
  v6 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v6)
        v9 = CFSTR("YES");
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "isSyncing returning = %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_17;
  }
  return v6;
}

- (id)lastSyncDate
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Requesting last sync date: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2;
}

- (void)_didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD block[4];
  BOOL v10;
  BOOL v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (v4)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "didAttemptToSetEnabledTo returned: targetEnabled:%@ result%@ clients should update values", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A216CD7C;
  block[3] = &unk_1E4723DA0;
  v10 = v4;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (int64_t)isChangingEnabledState
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      IMStringFromCloudKitChangingSettingState();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "isChangingEnabledState returning = %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return v4;
}

- (void)_didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v8 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (v8)
        v12 = CFSTR("YES");
      v21 = v12;
      v22 = 2048;
      v23 = a4;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "didPerformAdditionalStorageRequiredCheck returned with success: %@, additionalStorageRequired %llu for iCloud account id %@, error: %@", buf, 0x2Au);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A216D140;
  v15[3] = &unk_1E4723DE8;
  v19 = v8;
  v17 = v10;
  v18 = a4;
  v16 = v9;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

- (BOOL)isDisablingDevices
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "isDisabling devices returning = %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

- (void)_didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  _QWORD block[4];
  BOOL v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "_didAttemptToDisableAllDevicesResult returned: result:%@ clients should update values", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A216D468;
  block[3] = &unk_1E4722840;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)isInExitState
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (id)exitDate
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)_updateCloudKitProgressWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  -[IMCloudKitHooks logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1A219947C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ProgressChanged"), self, v4);

}

- (void)_updateCloudKitState
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[IMCloudKitHooks logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1A21994E4(v3);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMessagesIniCloudVersion2");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCloudKitHooks syncStateDictionary](self, "syncStateDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), self, v7);

  }
}

- (void)loadDeletedMessagesWithLimit:(int64_t)a3
{
  id v4;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadDeletedMessagesWithLimit:", a3);

}

- (void)fetchLatestSalt
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchLatestSalt");

}

- (void)printCachedSalt
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printCachedSalt");

}

- (void)deleteSalt
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteSalt");

}

- (void)metricAttachments:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Metric attachments in cloudkit hooks bytes: %lld", (uint8_t *)&v6, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metricAttachments:", a3);

}

- (void)purgeAttachments:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Purge attachments in cloudkit hooks bytes: %lld", (uint8_t *)&v6, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAttachments:", a3);

}

- (void)updateAttachmentFileSizes
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Update attachment file sizes", v4, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAttachmentFileSizes");

}

- (void)fetchSyncStateStatistics
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchSyncStateStatistics");

}

- (void)writeCloudKitSyncCounts:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeCloudKitSyncCounts:", v3);

}

- (void)toggleiCloudBackupsIfNeeded
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleiCloudBackupsIfNeeded");

}

- (void)setiCloudBackupsDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setiCloudBackupsDisabled:", v3);

}

- (void)removePathFromiCloudBackups:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePathFromiCloudBackups:", v3);

}

- (void)fetchLatestRampState
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchLatestRampState");

}

- (void)printCachedRampState
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printCachedRampState");

}

- (void)syncDeletesToCloudKit
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDeletesToCloudKit");

}

- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Fetching sync state debugging info…", v6, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCloudKitSyncStateDebuggingInfo:", v3);

}

- (void)simulateCloudKitSyncWithSyncState:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Simulating sync with sync state", v6, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simulateCloudKitSyncWithSyncState:", v3);

}

- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Auto collecting logs because:(%@), sending to %@", (uint8_t *)&v9, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tryToAutoCollectLogsWithErrorString:sendLogsTo:", v5, v6);

}

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastCloudKitStateAfterFetchingAccountStatus");

}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastCloudKitStateAfterClearingErrors");

}

- (void)reportMetricToCK:(id)a3
{
  -[IMCloudKitHooks reportMetricToCK:withDict:](self, "reportMetricToCK:withDict:", a3, 0);
}

- (void)reportMetricToCK:(id)a3 withSuccess:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("syncSuccess");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMCloudKitHooks reportMetricToCK:withDict:](self, "reportMetricToCK:withDict:", v7, v9);
}

- (void)reportMetricToCK:(id)a3 withDict:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportMetricToCK:withDict:", v6, v5);

}

- (BOOL)mocAccountsMatch
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts match ? %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

- (BOOL)serverBagAllowsOnboarding
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = IMBagIntValueWithDefault();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = &unk_1E475EDA8;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Onboarding local version: %@, server version: %@", (uint8_t *)&v6, 0x16u);

    }
  }
  return v2 < 2;
}

@end
