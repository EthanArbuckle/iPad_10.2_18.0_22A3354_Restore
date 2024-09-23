@implementation IMDCKSyncController

- (void)performInitialSyncOnFirstConnectionOfImagentIfNeeded
{
  int v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) != 0)
    v3 = 1;
  else
    v3 = IMGetDomainBoolForKeyWithDefaultValue();
  v4 = IMGetDomainBoolForKey();
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  v8 = IMOSLoggingEnabled(v7);
  if ((_DWORD)v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v3)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (v4)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      if (v6)
        v10 = CFSTR("YES");
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "performInitialSyncOnFirstConnectionOfImagentIfNeeded {hasPerformedInitialSync: %@ hasTriedToEnableCKAndSyncForFirstTime: %@ cloudKitEnabled: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  if ((v3 & 1) == 0)
  {
    if (((v4 | v6) & 1) != 0)
    {
      if (v6)
        -[IMDCKSyncController beginInitialSyncWithActivity:](self, "beginInitialSyncWithActivity:", 0);
    }
    else
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "This is our first time connecting to imagent on this device (either first time ever or from a restore) and cloudkit is disabled --- will attempt to enable and perform initial sync -- we won't do this again", (uint8_t *)&v14, 2u);
        }

      }
      IMSetDomainBoolForKey();
    }
  }
}

+ (IMDCKSyncController)sharedInstance
{
  if (qword_1ED935D10 != -1)
    dispatch_once(&qword_1ED935D10, &unk_1E922DAA0);
  return (IMDCKSyncController *)(id)qword_1ED935E50;
}

- (void)syncCoordinatorStartedSyncWithName:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Kicked off sync with name: %@, identifier: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)syncCoordinatorFinishedSyncWithName:(id)a3 identifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Finished sync with name: %@, identifier: %@, and error: %@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (void)syncCoordinatorFinishedFetchingRecordsOfType:(int64_t)a3 name:(id)a4 identifier:(id)a5 count:(int64_t)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 134219010;
      v16 = a6;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2048;
      v22 = a3;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Finished fetching (%ld) records for sync with name: %@, identifier %@ of type %ld (%@)", (uint8_t *)&v15, 0x34u);
    }

  }
}

- (void)syncCoordinatorWaitingForImportToFinishWithName:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Sync waiting for importer to finish with name: %@, identifier: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (id)messageSyncController
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  IMDCKSyncController *v9;

  +[IMDCKMessageSyncController sharedInstance](IMDCKMessageSyncController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1579AB4;
  v7[3] = &unk_1E9228750;
  v4 = v3;
  v8 = v4;
  v9 = self;
  if (qword_1ED936110 != -1)
    dispatch_once(&qword_1ED936110, v7);
  v5 = v4;

  return v5;
}

- (id)initialMessageSyncController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1579B38;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  if (qword_1EFC63E50 != -1)
    dispatch_once(&qword_1EFC63E50, block);
  return (id)qword_1EFC63E48;
}

- (id)chatSyncController
{
  return +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
}

- (id)exitManager
{
  return +[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance");
}

- (id)attachmentSyncController
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  IMDCKSyncController *v9;

  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1579C3C;
  v7[3] = &unk_1E9228750;
  v4 = v3;
  v8 = v4;
  v9 = self;
  if (qword_1ED9360F8 != -1)
    dispatch_once(&qword_1ED9360F8, v7);
  v5 = v4;

  return v5;
}

- (id)updateSyncController
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  IMDCKSyncController *v9;

  +[IMDCKUpdateSyncController sharedInstance](IMDCKUpdateSyncController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1579CF4;
  v7[3] = &unk_1E9228750;
  v4 = v3;
  v8 = v4;
  v9 = self;
  if (qword_1EFC63E58 != -1)
    dispatch_once(&qword_1EFC63E58, v7);
  v5 = v4;

  return v5;
}

- (id)recoverableMessageSyncController
{
  return +[IMDCKRecoverableMessageSyncController sharedInstance](IMDCKRecoverableMessageSyncController, "sharedInstance");
}

- (id)initialAttachmentSyncController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1579D84;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  if (qword_1EFC63E68 != -1)
    dispatch_once(&qword_1EFC63E68, block);
  return (id)qword_1EFC63E60;
}

- (id)backupController
{
  return +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
}

- (int64_t)syncControllerRecordType
{
  return 0;
}

- (unint64_t)_maxTimeToDeferInSeconds
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-client-max-time-to-defer-nightly-sync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (v4)
  {
    v5 = v4;
    v6 = arc4random();
    v7 = v6 % v5;
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Max Time to defer from server bag %@", (uint8_t *)&v13, 0xCu);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Max Time to defer default value %@", (uint8_t *)&v13, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (void)_postMetricsToCloudKitOnAutomaticHistoryDeletionAgentLaunch
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "_postMetricsToCloudKitOnAutomaticHistoryDeletionAgentLaunch", v5, 2u);
    }

  }
  if (!-[IMDCKAbstractSyncController isSyncing](self, "isSyncing"))
  {
    -[IMDCKSyncController exitManager](self, "exitManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendCloudKitZoneFetchRequestToNoteFeatureIsOn");

  }
}

- (void)idsAccountsDidChange
{
  void *v3;
  char v4;

  if (-[IMDCKSyncController verifyAccountsMatchForMoc](self, "verifyAccountsMatchForMoc"))
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "cloudKitSyncingEnabled");

    if ((v4 & 1) == 0)
      -[IMDCKSyncController _attemptToEnableMiCByDefaultOnce](self, "_attemptToEnableMiCByDefaultOnce");
    -[IMDCKSyncController _attemptToMigrateACAccountEnablementOnce](self, "_attemptToMigrateACAccountEnablementOnce");
  }
}

- (void)_iCloudAccountDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v6)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Received iCloud Account change notification, syncing enabled: %@", buf, 0xCu);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D157A238;
  v11[3] = &unk_1E922DAC8;
  v12 = v6;
  v11[4] = self;
  objc_msgSend(v10, "fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:", v11);

}

- (BOOL)_didUpgradeOrRestoreFromBackup
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37948]);

  return v3;
}

- (BOOL)_hasTriedToEnableMiCByDefault
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37960]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (int)objc_msgSend(v3, "intValue") > 0;
  else
    v4 = 0;

  return v4;
}

- (void)_setHasTriedToEnableMiCByDefault
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forDomain:forKey:", &unk_1E9271680, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37960]);

}

- (void)_attemptToEnableMiCByDefaultOnce
{
  MEMORY[0x1E0DE7D20](self, sel__attemptToEnableMiCByDefaultOnceAttempt_);
}

- (void)_attemptToEnableMiCByDefaultOnceAttempt:(int)a3
{
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  _BOOL8 v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  _QWORD v39[5];
  int v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDCKSyncController _hasTriedToEnableMiCByDefault](self, "_hasTriedToEnableMiCByDefault");
  if (v5)
  {
    if (!IMOSLoggingEnabled(v5))
      return;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enable MiC by default: already tried, skipping", buf, 2u);
    }
LABEL_47:

    return;
  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "signedIntoiCloudAccount");

  if ((v8 & 1) == 0)
  {
    if (!IMOSLoggingEnabled(v9))
      return;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enable MiC by default: needs icloud login, skipping", buf, 2u);
    }
    goto LABEL_47;
  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "deviceIsPhoneOrWatch"))
  {

  }
  else
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "signedIntoiMessageAccount");

    if ((v12 & 1) == 0)
    {
      if (!IMOSLoggingEnabled(v13))
        return;
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enable MiC by default: needs iMessage login, skipping", buf, 2u);
      }
      goto LABEL_47;
    }
  }
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isUnderFirstDataProtectionLock");

  if (v15)
  {
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Enable MiC by default: isUnderFirstUnlock, deferring to unlock", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37940]);

    return;
  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldAttemptMiCOnByDefault");

  v22 = IMOSLoggingEnabled(v21);
  if ((_DWORD)v22)
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v20;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Enable MiC by default: shouldAttemptMiCOnByDefault %d", buf, 8u);
    }

  }
  if ((v20 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v22))
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Enable MiC by default: we are not onboarding new users, we won't check again", buf, 2u);
      }

    }
    goto LABEL_58;
  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "cloudKitSyncingEnabled");

  v26 = -[IMDCKSyncController _didUpgradeOrRestoreFromBackup](self, "_didUpgradeOrRestoreFromBackup");
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "iCloudAccountMatchesiMessageAccount");

  v30 = IMOSLoggingEnabled(v29);
  if ((_DWORD)v30)
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = CFSTR("YES");
      if (v25)
        v33 = CFSTR("YES");
      else
        v33 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v42 = v33;
      if (v26)
        v34 = CFSTR("YES");
      else
        v34 = CFSTR("NO");
      v43 = 2112;
      v44 = v34;
      v45 = 2112;
      if (!v28)
        v32 = CFSTR("NO");
      v46 = v32;
      v47 = 2112;
      v48 = CFSTR("NO");
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Enable MiC by default: isSyncingEnabled %@ didRestore %@ accountsMatch %@ hasEnabled %@", buf, 0x2Au);
    }

  }
  if (((v25 | v26) & 1) != 0 || ((v28 ^ 1) & 1) != 0)
  {
    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = a3;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Enable MiC by default: criteria do not allow enablement on attempt %d, will not enable, won't try again.", buf, 8u);
      }

    }
LABEL_58:
    -[IMDCKSyncController _setHasTriedToEnableMiCByDefault](self, "_setHasTriedToEnableMiCByDefault");
    return;
  }
  v35 = -[IMDCKSyncController isFetchingExitForEnablement](self, "isFetchingExitForEnablement");
  if (v35)
  {
    if (!IMOSLoggingEnabled(v35))
      return;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Enable MiC by default: Already fetching exit record, exiting early", buf, 2u);
    }
    goto LABEL_47;
  }
  -[IMDCKSyncController setIsFetchingExitForEnablement:](self, "setIsFetchingExitForEnablement:", 1);
  +[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1D157AC18;
  v39[3] = &unk_1E922DB18;
  v39[4] = self;
  v40 = a3;
  objc_msgSend(v37, "exitRecordDateWithCompletion:", v39);

}

- (double)_retryIntervalToEnableMicByDefaultForAttempt:(int)a3
{
  return (double)(a3 + 1) * 60.0;
}

- (int)_maxRetryAttemptsToEnableMiCByDefault
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37990]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (int)objc_msgSend(v3, "intValue") >= 1)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 5;

  return v4;
}

- (void)registerForAccountNotifications
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Registering for account notifications", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__iCloudAccountDidChange_, *MEMORY[0x1E0C94690], 0);

  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Registered for cloudkit account change notifications", v7, 2u);
    }

  }
}

- (void)_attemptToMigrateACAccountEnablementOnce
{
  id v2;

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repairACAccountEnablementStatusIfNeeded");

}

- (id)_dateForNext24LogDumpAtHour:(int64_t)a3 timeNow:(id)a4 dumpNow:(BOOL *)a5
{
  void *v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;

  v5 = 0;
  if ((unint64_t)a3 <= 0x18 && a4)
  {
    v8 = (void *)MEMORY[0x1E0C99D48];
    v9 = a4;
    objc_msgSend(v8, "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateBySettingHour:minute:second:ofDate:options:", a3, 0, 0, v11, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "timeIntervalSinceDate:", v9);
    v13 = v12;

    if (v13 <= 0.0)
    {
      objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0);
      v14 = objc_claimAutoreleasedReturnValue();

      *a5 = v13 > -3600.0;
      v5 = (void *)v14;
    }

  }
  return v5;
}

- (void)_dispatchNotification:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  objc_msgSend(v5, "cStringUsingEncoding:", 4);
  IMDispatchForNotify();

}

- (double)_IMAHDAgentFallbackIntervalInSeconds
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-imahd-sync-interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "doubleValue");
    v6 = v5 * 60.0 * 60.0;
  }
  else
  {
    v6 = 43200.0;
  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_IMAHDAgentFallbackInterval %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6;
}

- (BOOL)_syncNotCompletedRecently
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v8 = v7;
  v10 = 1;
  if (v4)
  {
    v6 = -[IMDCKSyncController _IMAHDAgentFallbackIntervalInSeconds](self, "_IMAHDAgentFallbackIntervalInSeconds");
    if (v8 <= v9)
      v10 = 0;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("NO");
      v16 = 138412802;
      v17 = v4;
      v18 = 2112;
      if (v10)
        v14 = CFSTR("YES");
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Last synced date %@ timeInterval %@, syncNotCompletedRecently %@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v10;
}

- (void)_kickOffNightlyPeriodicSyncIfApplicable
{
  unint64_t v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IMSetDomainBoolForKey();
  v3 = -[IMDCKSyncController _maxTimeToDeferInSeconds](self, "_maxTimeToDeferInSeconds");
  v4 = (double)v3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Scheduling nightlySyncTimer. Firing time: in %f sec.", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", 0, 1, self, sel__nightlySyncTimerFired, 0, v4);
  -[IMDCKSyncController setNightlySyncTimer:](self, "setNightlySyncTimer:", v6);

  objc_msgSend(MEMORY[0x1E0D398D8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dumpMOCLoggingMetaData");

}

- (void)_nightlySyncTimerFired
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "nightlySyncTimer fired", v9, 2u);
    }

  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repairACAccountEnablementStatusIfNeeded");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  IMSetDomainBoolForKey();
  +[IMDCKUtilities calculateAndSaveAliasesToDefaults](IMDCKUtilities, "calculateAndSaveAliasesToDefaults");
  -[IMDCKSyncController nightlySyncTimer](self, "nightlySyncTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[IMDCKSyncController setNightlySyncTimer:](self, "setNightlySyncTimer:", 0);
}

- (void)kickOffEagerSyncIfApplicable
{
  void *v2;
  char v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudKitSyncingEnabled");

  v5 = IMOSLoggingEnabled(v4);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "attempting to kick off an eager sync in %@ seconds", (uint8_t *)&v9, 0xCu);

      }
    }
    im_dispatch_after();
  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Ignoring request to kick off of eager sync, since syncing is disabled", (uint8_t *)&v9, 2u);
    }

  }
}

- (IMDCKSyncController)init
{
  IMDCKSyncController *v2;
  IMDCKSyncController *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  IMDCKSyncController *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v13;
  __CFNotificationCenter *v14;
  __CFNotificationCenter *v15;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  NSObject *v26;
  _QWORD v28[4];
  IMDCKSyncController *v29;
  uint8_t buf[16];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)IMDCKSyncController;
  v2 = -[IMDCKSyncController init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Init IMDCKSyncController", buf, 2u);
      }

    }
    -[IMDCKAbstractSyncController syncState](v3, "syncState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearLocalCloudKitSyncState");

    -[IMDCKSyncController registerForAccountNotifications](v3, "registerForAccountNotifications");
    v6 = objc_alloc(MEMORY[0x1E0D39B08]);
    v7 = (void *)objc_msgSend(v6, "initWithObject:title:queue:", v3, CFSTR("MiC State"), MEMORY[0x1E0C80D38]);
    -[IMDCKSyncController setStateCaptureAssistant:](v3, "setStateCaptureAssistant:", v7);

    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      +[IMDDistributedNotificationXPCEventStreamHandler sharedInstance](IMDDistributedNotificationXPCEventStreamHandler, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C80D38];
      objc_msgSend(v8, "addDelegate:queue:", v3, MEMORY[0x1E0C80D38]);

    }
    v10 = *MEMORY[0x1E0D37A90];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1D157C098;
    v28[3] = &unk_1E922C5B8;
    v11 = v3;
    v29 = v11;
    -[IMDCKSyncController _dispatchNotification:withBlock:](v11, "_dispatchNotification:withBlock:", v10, v28);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)sub_1D157C130, CFSTR("com.apple.protectedcloudstorage.roll.Messages3"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v11, (CFNotificationCallback)sub_1D157C1D8, CFSTR("com.apple.ProtectedCloudStorage.mobileBackupStateChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v11, (CFNotificationCallback)sub_1D157C414, CFSTR("com.apple.ProtectedCloudStorage.test.mobileBackupStateChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, v11, (CFNotificationCallback)sub_1D157C564, CFSTR("com.apple.ProtectedCloudStorage.test.mobileBackupStateChange.success"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v16, v11, (CFNotificationCallback)sub_1D157C690, CFSTR("com.apple.ProtectedCloudStorage.PendingKeyRoll"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v11, (CFNotificationCallback)sub_1D157C7BC, (CFStringRef)*MEMORY[0x1E0C95388], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addListener:", v11);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D8C0]), "initWithDelegate:", v11);
    -[IMDCKSyncController setSyncResumer:](v11, "setSyncResumer:", v19);

    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKSyncController syncResumer](v11, "syncResumer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemMonitorListener");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addListener:", v22);

    v23 = IMIsRunningInUnitTesting();
    if ((v23 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "isSystemLocked"),
          v24,
          (v25 & 1) != 0))
    {
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Not doing account check on launch as device is locked", buf, 2u);
        }

      }
    }
    else
    {
      -[IMDCKSyncController performOneTimeAccountUpgradeCheckIfNeeded](v11, "performOneTimeAccountUpgradeCheckIfNeeded");
    }

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMDCKSyncController longRunningSyncTimer](self, "longRunningSyncTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMDCKSyncController longRunningSyncTimer](self, "longRunningSyncTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[IMDCKSyncController setLongRunningSyncTimer:](self, "setLongRunningSyncTimer:", 0);
  }
  -[IMDCKSyncController nightlySyncTimer](self, "nightlySyncTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IMDCKSyncController nightlySyncTimer](self, "nightlySyncTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[IMDCKSyncController setNightlySyncTimer:](self, "setNightlySyncTimer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeListener:", self);

  -[IMDCKSyncController reloadTimer](self, "reloadTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IMDCKSyncController reloadTimer](self, "reloadTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[IMDCKSyncController setReloadTimer:](self, "setReloadTimer:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)IMDCKSyncController;
  -[IMDCKSyncController dealloc](&v11, sel_dealloc);
}

- (void)kickOffCloudKitSyncIfNeededOnImagentLaunch
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "kickOffCloudKitSyncIfNeededOnImagentLaunch", buf, 2u);
    }

  }
  v4 = IMGetDomainBoolForKeyWithDefaultValue();
  IMSetDomainBoolForKey();
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isUnderFirstDataProtectionLock") & 1) != 0)
  {

  }
  else
  {
    v7 = IMGetCachedDomainBoolForKey();

    if ((v7 & 1) == 0)
    {
      v9 = IMGetDomainBoolForKeyWithDefaultValue();
      v10 = -[IMDCKSyncController _periodicSyncAttemptCount](self, "_periodicSyncAttemptCount");
      if (v10 < 1)
      {
        v13 = -[IMDCKSyncController _manualSyncAttemptCount](self, "_manualSyncAttemptCount");
        if (v13 < 1)
        {
          if (IMOSLoggingEnabled(v13))
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Not kicking off a sync as there was no sync in progress or we hit max limit attempts of sync", buf, 2u);
            }

          }
          goto LABEL_34;
        }
        v11 = -[IMDCKSyncController _manualSyncAttemptCount](self, "_manualSyncAttemptCount");
        if (IMOSLoggingEnabled(v11))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v29) = v11;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "imagent started and we were in the middle of manual sync attempt %ud", buf, 8u);
          }

        }
        if (IMOSLoggingEnabled(-[IMDCKSyncController _autoBugCaptureWithSubType:debugDescription:](self, "_autoBugCaptureWithSubType:debugDescription:", CFSTR("CrashedDuringSync"), CFSTR("duringManualSync"))))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "NOT Kicking off a periodic sync after we got back as we are not on battery and wifi", buf, 2u);
          }

        }
        -[IMDCKSyncController _resetSyncStateAndAttemptCounts](self, "_resetSyncStateAndAttemptCounts");
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = sub_1D157D094;
        v25[3] = &unk_1E9229870;
        v25[4] = self;
        -[IMDCKSyncController _ifCloudKitAbleToSyncWithActivity:callBlock:](self, "_ifCloudKitAbleToSyncWithActivity:callBlock:", 0, v25);
      }
      else
      {
        v11 = -[IMDCKSyncController _periodicSyncAttemptCount](self, "_periodicSyncAttemptCount");
        if (IMOSLoggingEnabled(v11))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v29 = v11;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Not kicking off a sync as this is a periodic sync attempt %ld and coreduet should decide whether to kick off a sync again", buf, 0xCu);
          }

        }
        -[IMDCKSyncController _autoBugCaptureWithSubType:debugDescription:](self, "_autoBugCaptureWithSubType:debugDescription:", CFSTR("CrashedDuringSync"), CFSTR("duringPeriodicSync"));
        -[IMDCKSyncController _resetSyncStateAndAttemptCounts](self, "_resetSyncStateAndAttemptCounts");
      }
      v16 = v10 > 0;
      v26[0] = CFSTR("wasXPCtriggered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v17;
      v26[1] = CFSTR("restoreSync");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      v26[2] = CFSTR("nightlyTriggerCrash");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37B90], 8, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reportErrorForSyncType:syncStep:response:error:", 1, CFSTR("Unknown/Crash"), 1, v21);

      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", 1, v16, v11, 0, 0.0);

      return;
    }
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Not attempting to kick off periodic sync as we are under first unlock AND/OR we have a defaults set com.apple.madrid disableSyncRetryOnCrash", buf, 2u);
    }

  }
LABEL_34:
  -[IMDCKSyncController _resetSyncStateAndAttemptCounts](self, "_resetSyncStateAndAttemptCounts");
}

- (void)resumeSyncOnLaunchIfNeeded
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagesIniCloudVersion2");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Checking to see if we should resume an MiC Sync", buf, 2u);
      }

    }
    -[IMDCKSyncController syncResumer](self, "syncResumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attemptToResumeSyncIfAppropriate");

  }
  else
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

    if (v9)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Checking to see if we should resume an MiC Sync", v12, 2u);
        }

      }
      if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0 && (IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0)
        -[IMDCKSyncController beginInitialSyncWithActivity:](self, "beginInitialSyncWithActivity:", 0);
    }
  }
}

- (void)_needsSyncOnIdentityUpdate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D379C8]);

}

- (void)_needsSyncOnAccountUpdate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D379B8]);

}

- (void)_didPassAccountAndIdentityUpdateNeeds
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D37950];
  objc_msgSend(v2, "setValue:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D379C8]);

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forDomain:forKey:", 0, v3, *MEMORY[0x1E0D379B8]);

}

+ (BOOL)initialSyncAllowed
{
  return objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown") ^ 1;
}

- (void)registerCloudSyncDependencies
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D157D518;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  if (qword_1ED9362A0 != -1)
    dispatch_once(&qword_1ED9362A0, block);
}

- (void)scheduleAttachmentAssetDownload
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D8B0], "scheduleAttachmentAssetDownloadWithDelegate:", self);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Failed to schedule attachment asset download with error %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)beginInitialSyncWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMessagesIniCloudVersion2");

  if (v6)
  {
    -[IMDCKSyncController registerCloudSyncDependencies](self, "registerCloudSyncDependencies");
    objc_msgSend(MEMORY[0x1E0D4D8B0], "startInitialSyncWithDelegate:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8 && IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Failed to schedule initial sync with error %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Request to beginInitialSync", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_beginInitialSyncWithActivity_, 0);
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "cloudKitSyncingEnabled");

    v14 = IMGetDomainBoolForKeyWithDefaultValue();
    v15 = v14;
    if ((v13 ^ 1 | v14) == 1)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v17;
          v33 = 2112;
          v34 = v18;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "**** Has performed initial sync, or we aren't enabled. Not kicking off initial sync *** | isEnabled %@, hasPerformedInitalSync %@", buf, 0x16u);

        }
      }
      -[IMDCKSyncController setInitialSyncAttempts:](self, "setInitialSyncAttempts:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKAbstractSyncController syncState](self, "syncState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSyncSessionID:", v22);

      -[IMDCKAbstractSyncController syncState](self, "syncState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v24, *MEMORY[0x1E0D37A50], 0);

      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postSyncStateToCloudKit:", CFSTR("ManateeIdentityFetchAttemptRestoreSync"));

      -[IMDCKAbstractSyncController setBroadcastedSyncStateToStartingInitialSync](self, "setBroadcastedSyncStateToStartingInitialSync");
      -[IMDCKSyncController _recordManager](self, "_recordManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_1D157DDE4;
      v28[3] = &unk_1E9229258;
      v28[4] = self;
      v29 = v4;
      v30 = v19;
      v27 = v19;
      objc_msgSend(v26, "fetchChatZoneToCheckManateeStatus:", v28);

    }
  }

}

- (void)beginChatSyncPeriodic:(BOOL)a3 activity:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  NSObject *v13;
  _BOOL8 v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL8 v18;
  _BOOL4 v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Request to begin chat sync isPeriodic:%@", buf, 0xCu);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cloudKitSyncingEnabled");

  if ((v10 & 1) != 0)
  {
    v12 = -[IMDCKSyncController _chatSyncedRecently](self, "_chatSyncedRecently");
    if (!v12)
    {
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToStartingPeriodicSync](self, "setBroadcastedSyncStateToStartingPeriodicSync");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_1D157E710;
      v20[3] = &unk_1E922DB40;
      v20[4] = self;
      v22 = v4;
      v21 = v6;
      -[IMDCKSyncController _ifCloudKitAbleToSyncWithActivity:callBlock:](self, "_ifCloudKitAbleToSyncWithActivity:callBlock:", v21, v20);

      goto LABEL_28;
    }
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "We synced recently chats not syncing again after coming back online", buf, 2u);
      }

    }
    if (v6)
    {
      v14 = xpc_activity_set_state((xpc_activity_t)v6, 5);
      v15 = v14;
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = v15;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Set state for chat syncing with result %d", buf, 8u);
        }
LABEL_17:

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = CFSTR("NO");
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not syncing chats from xpc activity -- mocEnabled: %@", buf, 0xCu);
      }

    }
    -[IMDCKSyncController _clearTombstonesWithActivity:](self, "_clearTombstonesWithActivity:", v6);
    if (v6)
    {
      v18 = xpc_activity_set_state((xpc_activity_t)v6, 5);
      v19 = v18;
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = v19;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Set state for chat syncing with result %d", buf, 8u);
        }
        goto LABEL_17;
      }
    }
  }
LABEL_28:

}

- (BOOL)shouldMarkAllIncompatibleMessagesForDeletion
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainIntForKey();
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134218240;
      v6 = v2;
      v7 = 1024;
      v8 = 1;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Request to determine if we should mark all incompatibleMessagesForDeletion, set version (%ld) current version (%d)", (uint8_t *)&v5, 0x12u);
    }

  }
  return v2 != 1;
}

- (void)beginPeriodicSyncWithChecks:(unint64_t)a3 priority:(const char *)a4 reason:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  _QWORD handler[5];
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Request to begin full sync checks %lu (reason %@)", buf, 0x16u);
    }

  }
  objc_msgSend(CFSTR("com.apple.Messages.PeriodicSync."), "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, (const char *)*MEMORY[0x1E0C80878], a4);
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C808D0], 1);
  +[IMDCKUtilities addConditionChecks:toCriteria:](IMDCKUtilities, "addConditionChecks:toCriteria:", a3, v10);
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1D157EC20;
  handler[3] = &unk_1E922DB60;
  handler[4] = a4;
  xpc_activity_register(v12, v10, handler);

}

- (void)beginPeriodicSyncWithActivity:(id)a3
{
  char *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  char *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMessagesIniCloudVersion2");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4D8B0], "scheduleBackfillSyncWithDelegate:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8 && IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[IMDCKSyncController beginPeriodicSyncWithActivity:]";
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "%s: Tried to kick off backfill sync but encountered error %@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Request to begin full sync activity:%@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D398D8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementCoreDuetSyncAttempts");

    -[IMDCKAbstractSyncController syncState](self, "syncState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSyncSessionID:", v15);

    -[IMDCKAbstractSyncController setBroadcastedSyncStateToStartingPeriodicSync](self, "setBroadcastedSyncStateToStartingPeriodicSync");
    if (-[IMDCKSyncController shouldMarkAllIncompatibleMessagesForDeletion](self, "shouldMarkAllIncompatibleMessagesForDeletion"))
    {
      IMSetDomainIntForKey();
      -[IMDCKSyncController messageSyncController](self, "messageSyncController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_markAllIncompatibleMessagesForDeletion");

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1D157F150;
    v17[3] = &unk_1E9229230;
    v17[4] = self;
    v18 = v4;
    -[IMDCKSyncController _ifCloudKitAbleToSyncWithActivity:callBlock:](self, "_ifCloudKitAbleToSyncWithActivity:callBlock:", v18, v17);

  }
}

- (void)beginUserInitiatedSync
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagesIniCloudVersion2");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D4D8B0], "startUserInitiatedSyncWithDelegate:", self);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5 && IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 136315394;
        v9 = "-[IMDCKSyncController beginUserInitiatedSync]";
        v10 = 2112;
        v11 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "%s: Tried to kick off user initiated sync but encountered error %@", (uint8_t *)&v8, 0x16u);
      }

    }
  }
  else
  {
    -[IMDCKSyncController beginPeriodicSyncWithChecks:priority:reason:](self, "beginPeriodicSyncWithChecks:priority:reason:", 2, *MEMORY[0x1E0C80888], CFSTR("User Initiated"));
  }
}

- (BOOL)_serverDoesNotAllowComingBackOnlineChatSync
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-stop-online-sync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)_minimumChatComingOnlineSyncInterval
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-chat-sync-interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 1800.0;
  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_minimumChatComingOnlineSyncInterval %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6;
}

- (BOOL)_chatSyncedRecently
{
  void *v3;
  NSObject *v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Last coming online chat sync date %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v5 = -[IMDCKSyncController _serverDoesNotAllowComingBackOnlineChatSync](self, "_serverDoesNotAllowComingBackOnlineChatSync");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Server override prevents us from syncing chats when coming back online", (uint8_t *)&v13, 2u);
      }

    }
  }
  else if (!v3
         || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v7, "timeIntervalSinceDate:", v3),
             v9 = v8,
             v7,
             v9 <= 0.0)
         || (-[IMDCKSyncController _minimumChatComingOnlineSyncInterval](self, "_minimumChatComingOnlineSyncInterval"),
             v9 >= v10))
  {
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)_serverDoesNotSingleDeviceLimitation
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-block-single-device-limitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4 && IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = CFSTR("YES");
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "The server is not allowing us to block chat syncing for iMessage accounts with only one device: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return v4;
}

- (BOOL)_accountHasMultipleDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.madrid"));
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[IMDCKSyncController _serverDoesNotSingleDeviceLimitation](self, "_serverDoesNotSingleDeviceLimitation");
  v7 = v6;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "devices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Number of devices for iMessage account: %@", (uint8_t *)&v14, 0xCu);

    }
  }
  if (v5)
    v12 = !v7;
  else
    v12 = 0;

  return v12;
}

- (void)_clearTombstonesWithActivity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Cleaning up tombstone table as CloudKit syncing is off", v9, 2u);
      }

    }
    IMDMessageRecordClearDeleteTombStones();
    IMDAttachmentRecordClearDeleteTombStones();
  }

}

- (void)beginComingBackOnlineSyncWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to beginChatSync from coming back online", buf, 2u);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cloudKitSyncingEnabled");

  if ((v7 & 1) != 0)
  {
    v9 = -[IMDCKSyncController _chatSyncedRecently](self, "_chatSyncedRecently");
    v10 = v9;
    v11 = IMOSLoggingEnabled(v9);
    if (v10)
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "We synced recently chats not syncing again after coming back online", buf, 2u);
        }

      }
    }
    else
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Proceeding with coming back online sync", buf, 2u);
        }

      }
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToStartingPeriodicSync](self, "setBroadcastedSyncStateToStartingPeriodicSync");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1D157FCF8;
      v15[3] = &unk_1E9229870;
      v15[4] = self;
      -[IMDCKSyncController _ifCloudKitAbleToSyncWithActivity:callBlock:](self, "_ifCloudKitAbleToSyncWithActivity:callBlock:", 0, v15);
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Not syncing chats from coming back online -- clearing tombstones for deletes only ", buf, 2u);
      }

    }
    -[IMDCKSyncController _clearTombstonesWithActivity:](self, "_clearTombstonesWithActivity:", v4);
  }

}

- (void)clearCKRelatedDefaults
{
  void *v3;
  void *v4;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastSyncDate:", 0);

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalyticSyncDatesDictionary:", 0);

  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
}

- (void)clearLocalCloudKitSyncState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "clearLocalCloudKitSyncState", v21, 2u);
    }

  }
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_startBatchChange");
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D37950];
  objc_msgSend(v5, "setBool:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]);

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forDomain:forKey:", 0, v6, *MEMORY[0x1E0D37988]);

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forDomain:forKey:", 0, v6, *MEMORY[0x1E0D37970]);

  -[IMDCKSyncController clearCKRelatedDefaults](self, "clearCKRelatedDefaults");
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logCollectorAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:", CFSTR("ResetSyncDate"), 1, 0, v10, CFSTR("ResetSyncDate"));

  +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteChatSyncToken");

  +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteChat1SyncToken");

  +[IMDCKMessageSyncController sharedInstance](IMDCKMessageSyncController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteMessageSyncToken");

  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deleteAttachmentSyncToken");

  +[IMDCKUpdateSyncController sharedInstance](IMDCKUpdateSyncController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteSyncToken");

  +[IMDCKRecoverableMessageSyncController sharedInstance](IMDCKRecoverableMessageSyncController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteSyncToken");

  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clearLocalSyncState");

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clearLocalCloudKitSyncState");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v20, "isMessagesIniCloudVersion2");

  if ((_DWORD)v18)
    objc_msgSend(MEMORY[0x1E0D4D8B0], "clearLocalCountsWhenSafe");

  objc_msgSend(v4, "_finishBatchChange");
}

- (void)syncController:(id)a3 syncBatchCompleted:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self, sel_refreshUIIfApplicableWithBatchCount_);
}

- (BOOL)_serverAllowsUIRefreshWhileSyncing
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = 1;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("disable-mic-ui-refresh-during-sync"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
    if ((_DWORD)v6)
    {
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Server disallows refreshing UI while syncing", v9, 2u);
        }

      }
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
  }

  return v2;
}

- (BOOL)_serverAllowsUIRefreshTimerWhileSyncing
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = 1;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("disable-mic-ui-refresh-timer-during-sync"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
    if ((_DWORD)v6)
    {
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Server disallows refreshing UI while syncing using timer", v9, 2u);
        }

      }
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
  }

  return v2;
}

- (double)reloadTimeInterval
{
  return 180.0;
}

- (void)refreshUIIfApplicableWithBatchCount:(unint64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3 && -[IMDCKSyncController _serverAllowsUIRefreshWhileSyncing](self, "_serverAllowsUIRefreshWhileSyncing"))
  {
    -[IMDCKSyncController setShouldReloadConversations:](self, "setShouldReloadConversations:", 1);
    if (-[IMDCKSyncController _serverAllowsUIRefreshTimerWhileSyncing](self, "_serverAllowsUIRefreshTimerWhileSyncing"))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = sub_1D1580380;
      v5[3] = &unk_1E92287A0;
      v5[4] = self;
      objc_msgSend(v4, "__im_performBlock:", v5);

    }
  }
}

- (void)_refreshUIWhileSyncing
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D158066C;
  v4[3] = &unk_1E92287A0;
  v4[4] = self;
  objc_msgSend(v3, "__im_performBlock:", v4);

}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint8_t v9[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "systemDidLeaveFirstDataProtection", v9, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D37950];
  v6 = *MEMORY[0x1E0D37940];
  v7 = objc_msgSend(v4, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37940]);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forDomain:forKey:", 0, v5, v6);

    -[IMDCKSyncController _attemptToEnableMiCByDefaultOnce](self, "_attemptToEnableMiCByDefaultOnce");
  }
}

- (void)systemDidUnlock
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "systemDidUnlock", buf, 2u);
    }

  }
  if (-[IMDCKSyncController shouldReloadConversations](self, "shouldReloadConversations"))
  {
    if (IMOSLoggingEnabled(-[IMDCKSyncController setShouldReloadConversations:](self, "setShouldReloadConversations:", 0)))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Refreshing UI after unlock", v5, 2u);
      }

    }
    -[IMDCKSyncController _refreshUIWhileSyncing](self, "_refreshUIWhileSyncing");
  }
}

- (void)recordMetricIsCloudKitEnabled
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D384F0];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "cloudKitSyncingEnabled"))
    v5 = &unk_1E9271680;
  else
    v5 = &unk_1E9271698;
  objc_msgSend(v6, "trackEvent:withCount:", v3, v5);

}

- (BOOL)_hasDumpedLogsInPastHour
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController lastLogDumpDate](self, "lastLogDumpDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    if (v6 <= 3600.0)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Dumped logs in past hour", v10, 2u);
      }

    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)_hasDumpedRestoreFailureLogsInPastHour
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController lastRestoreFailureLogDumpDate](self, "lastRestoreFailureLogDumpDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    if (v6 <= 3600.0)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Dumped restore failure logs in past hour", v10, 2u);
      }

    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)_currentHour
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "components:fromDate:", 32, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");

  return v6;
}

- (BOOL)_withinAnHourOfLogDumpHour
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = -[IMDCKSyncController _currentHour](self, "_currentHour");
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Current hour %@", (uint8_t *)&v6, 0xCu);

    }
  }
  return v2 - 7 < 2;
}

- (void)_deleteRestoreFailuresDirectory
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKUtilities restoreFailuresDirectory](IMDCKUtilities, "restoreFailuresDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v11);
  v5 = v11;

  v7 = IMOSLoggingEnabled(v6);
  if (v4)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        +[IMDCKUtilities restoreFailuresDirectory](IMDCKUtilities, "restoreFailuresDirectory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Deleted restore failures directory at path %@", buf, 0xCu);

      }
LABEL_9:

    }
  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      +[IMDCKUtilities restoreFailuresDirectory](IMDCKUtilities, "restoreFailuresDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Failed to delete restore failures directory at path %@ with error %@", buf, 0x16u);

    }
    goto LABEL_9;
  }

}

- (void)sendRestoreFailuresLogDumps
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Dumping restore failure logs", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController setLastRestoreFailureLogDumpDate:](self, "setLastRestoreFailureLogDumpDate:", v3);

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[IMDCKUtilities restoreFailuresDirectory](IMDCKUtilities, "restoreFailuresDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v26, 0, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Feature is on, time to send restore failure logdumps, found %@ to send", buf, 0xCu);

    }
  }
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anySessionForServiceName:", *MEMORY[0x1E0D38F68]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logCollectorAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logToPowerLogForLogDumpGUID:logDumpCompleted:logDumpSucceeded:logDumpSendingCompleted:logDumpSendingSucceeded:reason:", v19, 1, 1, 0, 0, CFSTR("RestoreFailuresDump"));

        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v18, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v37 = v19;
            v38 = 2112;
            v39 = v23;
            v40 = 2112;
            v41 = v14;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Sending restore failure log (guid %@) at path %@ to recipient %@", buf, 0x20u);

          }
        }
        objc_msgSend(v18, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = sub_1D15813FC;
        v30[3] = &unk_1E9227F58;
        v31 = v19;
        v25 = v19;
        objc_msgSend(v12, "sendLogDumpMessageAtFilePath:toRecipient:shouldDeleteFile:withCompletion:", v24, v14, 1, v30);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v15);
  }

  -[IMDCKSyncController _deleteRestoreFailuresDirectory](self, "_deleteRestoreFailuresDirectory");
}

- (void)sendRestoreFailuresLogDumpsIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  _BYTE v19[24];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "cloudKitSyncingEnabled"))
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldCollectDailyLogDumpForRestoreFailures") ^ 1;

  }
  else
  {
    v5 = 1;
  }

  v6 = -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour");
  v7 = -[IMDCKSyncController _hasDumpedRestoreFailureLogsInPastHour](self, "_hasDumpedRestoreFailureLogsInPastHour");
  v8 = v7;
  v9 = IMOSLoggingEnabled(v7);
  if ((_DWORD)v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v5)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v6)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      *(_DWORD *)v19 = 138412802;
      *(_QWORD *)&v19[4] = v12;
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v13;
      if (v8)
        v11 = CFSTR("YES");
      *(_WORD *)&v19[22] = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Checking we whould send logs. allowedToSendLogs %@ withinAnHourOfLogDumpHour %@ hasDumpedRestoreFailureLogsInPastHour %@", v19, 0x20u);
    }

  }
  if (((v5 | v8 | !v6) & 1) != 0)
  {
    if (!v6 || v8)
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKSyncController _hasDumpedRestoreFailureLogsInPastHour](self, "_hasDumpedRestoreFailureLogsInPastHour"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKSyncController lastRestoreFailureLogDumpDate](self, "lastRestoreFailureLogDumpDate");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v19 = 138412802;
          *(_QWORD *)&v19[4] = v15;
          *(_WORD *)&v19[12] = 2112;
          *(_QWORD *)&v19[14] = v16;
          *(_WORD *)&v19[22] = 2112;
          v20 = v17;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not auto dumping Restore Failure MOC logs withingLogDumpHour %@ hasDumpedLogsInPastHour %@ lastLogDumpTime %@", v19, 0x20u);

        }
      }
    }
    else
    {
      -[IMDCKSyncController sendRestoreFailuresLogDumps](self, "sendRestoreFailuresLogDumps");
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "It is dump log time but feature is off, deleting restore failures directory", v19, 2u);
      }

    }
    -[IMDCKSyncController _deleteRestoreFailuresDirectory](self, "_deleteRestoreFailuresDirectory", *(_OWORD *)v19, *(_QWORD *)&v19[16]);
  }
}

- (void)collectLogsIfNeeded
{
  void *v3;
  int v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "cloudKitSyncingEnabled") & 1) != 0)
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldCollectDailyLogDump");

    if (v4)
    {
      v5 = -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour");
      if (v5 && !(v5 = -[IMDCKSyncController _hasDumpedLogsInPastHour](self, "_hasDumpedLogsInPastHour")))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCKAbstractSyncController syncState](self, "syncState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastSyncDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "timeIntervalSinceDate:", v10);
          v14 = v13 > -84000.0;
        }
        else
        {
          v14 = 0;
        }
        IMGetCachedDomainValueForKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v15 = (void *)objc_msgSend(v15, "timeIntervalSinceDate:", v10);
          v18 = v17 > -84000.0;
        }
        else
        {
          v18 = 0;
        }
        if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v28 = 138412546;
            v29 = v16;
            v30 = 2112;
            v31 = v12;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Checking if we need to dump logs using LastErrorDate:%@ and LastSyncDate%@", (uint8_t *)&v28, 0x16u);
          }

        }
        if (!v14 && !v18)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKSyncController setLastLogDumpDate:](self, "setLastLogDumpDate:", v20);

          if (IMOSLoggingEnabled(v21))
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              LOWORD(v28) = 0;
              _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "We haven't reported any errors in the last 24 hours and haven't syned.  Dumping logs ", (uint8_t *)&v28, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3600.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          IMSetDomainValueForKey();

          -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logCollectorAddress");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logDumpAndSendMessageTo:forHours:reason:", v26, 24, CFSTR("NoSyncFor24Hours"));

        }
      }
      else if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKSyncController _hasDumpedLogsInPastHour](self, "_hasDumpedLogsInPastHour"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKSyncController lastLogDumpDate](self, "lastLogDumpDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          v29 = v7;
          v30 = 2112;
          v31 = v8;
          v32 = 2112;
          v33 = v9;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Not auto dumping MOC logs withingLogDumpHour %@ hasDumpedLogsInPastHour %@ lastLogDumpTime %@", (uint8_t *)&v28, 0x20u);

        }
      }
    }
  }
  else
  {

  }
}

- (BOOL)_handleSyncFailureType:(int64_t)a3 step:(int64_t)a4 activity:(id)a5 attemptCount:(unint64_t)a6 startTime:(id)a7 error:(id)a8 retry:(id)a9
{
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  xpc_activity_state_t v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  _BOOL4 v36;
  NSObject *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  _xpc_activity_s *activity;
  id v57;
  id v58;
  const __CFString *v59;
  void *v60;
  uint8_t buf[4];
  xpc_activity_state_t v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  activity = (_xpc_activity_s *)a5;
  v54 = a7;
  v15 = (__CFString *)a8;
  v53 = a9;
  IMStringFromCloudKitSyncStep();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringByAppendingString:", CFSTR("Sync"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v62 = (xpc_activity_state_t)v55;
      v63 = 2112;
      v64 = v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Failed syncing %@ with error %@", buf, 0x16u);
    }

  }
  -[IMDCKSyncController _reloadChatRegistryOnMainThread](self, "_reloadChatRegistryOnMainThread");
  if (!v15)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v59 = CFSTR("syncStep");
    v60 = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("IMDCKSyncDomain"), 0, v19);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "autoBugCaptureWithSubType:errorPayload:", v16, v15);

  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v22 = objc_msgSend(v21, "responseForError:attempt:retryInterval:", v15, a6, &v58);
  v52 = v58;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", CFSTR("Failed"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reportErrorForSyncType:syncStep:response:error:", a3, v24, v22, v15);

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = activity != 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v54);
  objc_msgSend(v25, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", a3, v26, a6, 0);

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v51) = a4 > 6;
  BYTE2(v51) = a4 > 5;
  BYTE1(v51) = a4 > 5;
  LOBYTE(v51) = a4 > 4;
  objc_msgSend(v28, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", a3, v26, a4 > 1, a4 > 2, a4 > 2, a4 > 3, v51, a6);

  if (!-[IMDCKSyncController _errorIndicatesDeviceNotGoodForSync:](self, "_errorIndicatesDeviceNotGoodForSync:", v15))
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "autoBugCaptureWithSubType:errorPayload:", v16, v15);

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed syncing Messages %@, please file a radar"), v55);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "reportMOCDebuggingErrorWithString:internalOnly:", v31, 0);

  }
  switch(v22)
  {
    case 2:
      v32 = 4;
      goto LABEL_16;
    case 3:
      v32 = 3;
      goto LABEL_16;
    case 4:
      -[IMDCKSyncController _needsSyncOnAccountUpdate](self, "_needsSyncOnAccountUpdate");
      goto LABEL_15;
    case 5:
      -[IMDCKSyncController _needsSyncOnIdentityUpdate](self, "_needsSyncOnIdentityUpdate");
      goto LABEL_15;
    case 6:
      -[IMDCKAbstractSyncController syncState](self, "syncState");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v34, *MEMORY[0x1E0D37C08], 1);

      -[IMDCKSyncController _nukeCKData](self, "_nukeCKData");
      goto LABEL_15;
    default:
LABEL_15:
      v32 = 5;
LABEL_16:
      if (activity)
      {
        v35 = xpc_activity_set_state(activity, v32);
        v36 = v35;
        if (IMOSLoggingEnabled(v35))
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = CFSTR("NO");
            if (v36)
              v38 = CFSTR("YES");
            *(_DWORD *)buf = 134218242;
            v62 = v32;
            v63 = 2112;
            v64 = v38;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Set activity to state %ld success %@", buf, 0x16u);
          }

        }
      }
      if (v22 == 2)
      {
        if (v53 && v52)
        {
          objc_msgSend(v52, "integerValue");
          v57 = v53;
          im_dispatch_after();
          v39 = v57;
LABEL_31:

        }
      }
      else
      {
        -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
        -[IMDCKSyncController _noteMeticsForSyncEndedWithSuccces:](self, "_noteMeticsForSyncEndedWithSuccces:", 0);
        -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "errorIndicatesDeviceConditionsDontAllowSync:", v15);

        if ((v41 & 1) == 0)
        {
          -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed syncing Messages %@, please file a radar"), v55);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:", v43, 0, a3 == 0);

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Restore Fail"), v15);

        }
        if (a3 == 1)
        {
          objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "postCoreAutomationNotificationFinishedPeriodicSyncNotificationWithStartTime:chatsDidsync:messagesDidSync:attachmentsDidSync:recoverableMessagesDidSync:", v54, a4 > 2, a4 > 3, a4 > 5, a4 > 6);

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKSyncController syncStartDate](self, "syncStartDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "timeIntervalSinceDate:", v48);
          objc_msgSend(v46, "numberWithDouble:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "trackEvent:withStatistic:", *MEMORY[0x1E0D384D8], v49);

          goto LABEL_31;
        }
      }

      return v22 == 2;
  }
}

- (id)_retryError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDCKRestoreDomain"), 1, 0);
}

- (id)_keychainErrorWithCause:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Caused by: %@"), a3, *MEMORY[0x1E0CB2D50]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDCKRestoreDomain"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_keychainError
{
  return -[IMDCKSyncController _keychainErrorWithCause:](self, "_keychainErrorWithCause:", 0);
}

- (void)beginInitialSyncAttemptCount:(unint64_t)a3 withActivity:(id)a4
{
  _xpc_activity_s *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 should_defer;
  NSObject *v20;
  xpc_activity_state_t state;
  _BOOL8 v22;
  NSObject *v23;
  xpc_activity_state_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  _xpc_activity_s *v30;
  id v31;
  unint64_t v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  xpc_activity_state_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_activity_s *)a4;
  if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 1)))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = (unint64_t)v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Beginning initial new device sync with CloudKit. , attemptCount %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3 < 0x65)
  {
    if (v6 && (should_defer = xpc_activity_should_defer(v6)))
    {
      if (IMOSLoggingEnabled(should_defer))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          state = xpc_activity_get_state(v6);
          *(_DWORD *)buf = 134218240;
          v34 = a3;
          v35 = 2048;
          v36 = state;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Deferring initial sync on attempt %lu, in state %ld", buf, 0x16u);
        }

      }
      v22 = xpc_activity_set_state(v6, 3);
      if (!v22 && IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = xpc_activity_get_state(v6);
          *(_DWORD *)buf = 134218240;
          v34 = a3;
          v35 = 2048;
          v36 = v24;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Failed to set activity to STATE_DEFER(3) on attempt %lu, in state %ld", buf, 0x16u);
        }

      }
      -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
    }
    else
    {
      IMSetDomainBoolForKey();
      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postSyncStateToCloudKit:", CFSTR("InitialSyncInitiated"));

      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = 0;
      objc_msgSend(v26, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", 0, 0, 0, 0, 0, 0, v28, a3);

      +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = sub_1D1582908;
      v29[3] = &unk_1E922DBB0;
      v29[4] = self;
      v30 = v6;
      v32 = a3;
      v31 = v10;
      objc_msgSend(v27, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:", v29);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Max attempts to sync due to recoverAble error exceeded", buf, 2u);
      }

    }
    -[IMDCKSyncController _retryError](self, "_retryError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:", CFSTR("Messages: Failed syncing to CloudKit please file a radar"), 0, 1);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Restore Fail"), v12);

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didStartSync:didFinishSync:didSucceedSyncing:", 0, 0, 1, 1, 0);

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reportErrorForSyncType:syncStep:response:error:", 0, CFSTR("Retry"), 1, v12);

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v10);
    objc_msgSend(v17, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", 0, 0, a3, 0);

    -[IMDCKSyncController _noteMeticsForSyncEndedWithSuccces:](self, "_noteMeticsForSyncEndedWithSuccces:", 0);
    -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);

  }
}

- (BOOL)_errorIndicatesDeviceNotGoodForSync:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "errorIndicatesDeviceConditionsDontAllowSync:", v4);

  return v6;
}

- (void)_nukeCKData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "******** Nuking CloudKit data ******", v7, 2u);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportMOCDebuggingErrorWithString:internalOnly:", CFSTR("Deleting CloudKit Data"), 1);

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeletedZones:", 1);

  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteAllZones");

  -[IMDCKSyncController clearLocalCloudKitSyncState](self, "clearLocalCloudKitSyncState");
}

- (void)_reloadChatRegistryOnMainThread
{
  id v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_forceReloadChats:", 1);

  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &unk_1E922DBF8);
  }
}

- (id)_recordManager
{
  return +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
}

- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Attempting periodicSync for attemptCount %@ so setting fullSyncAttempted date.", buf, 0xCu);

    }
  }
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v7, *MEMORY[0x1E0D37A20], 1);

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postSyncStateToCloudKit:", CFSTR("ManateeIdentityFetchAttemptFullSync"));

  -[IMDCKSyncController _recordManager](self, "_recordManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D15834A4;
  v15[3] = &unk_1E922DBB0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = a4;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "fetchChatZoneToCheckManateeStatus:", v15);

}

- (void)syncAttachmentMetadataFirstSyncWithActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  _BOOL8 v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t, _QWORD);
  uint8_t buf[16];

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v10 = -[IMDCKAbstractSyncController _fetchedAllChangesFromCloudKit](self, "_fetchedAllChangesFromCloudKit");
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
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "First full sync has completed - lets just do a normal sync flows", buf, 2u);
      }

    }
    v9[2](v9, 1, 0);
  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Doing an attachment metadata only sync before we continue with the full sync", buf, 2u);
      }

    }
    -[IMDCKSyncController attachmentSyncController](self, "attachmentSyncController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D1583C3C;
    v16[3] = &unk_1E9227FA8;
    v17 = v9;
    objc_msgSend(v15, "syncAttachmentsWithSyncType:deviceConditionsToCheck:activity:completionBlock:", 5, a4, v8, v16);

  }
}

- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4 syncChatsCompletionBlock:(id)a5
{
  _xpc_activity_s *v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL8 v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  _BOOL8 v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 should_defer;
  NSObject *v36;
  xpc_activity_state_t state;
  _BOOL8 v38;
  NSObject *v39;
  xpc_activity_state_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[5];
  _xpc_activity_s *v44;
  id v45;
  void (**v46)(id, _QWORD);
  unint64_t v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = (_xpc_activity_s *)a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 1)))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("YES");
      if (!v8)
        v13 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v49 = (unint64_t)v13;
      v50 = 2112;
      v51 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Initiating full sync with CloudKit. Core Duet Sync %@, attemptCount %@", buf, 0x16u);

    }
  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = 0;
  objc_msgSend(v14, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", 1, v8 != 0, 0, 0, 0, 0, v42, a4);

  if (IMGetDomainBoolForKey()
    && (objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isInternalInstall"),
        v15,
        v16))
  {
    if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0)))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Asked to sync but we are not allowed to do so", buf, 2u);
      }

    }
    if (v9)
      v9[2](v9, 0);
    if (v8)
    {
      v18 = xpc_activity_set_state(v8, 5);
      v19 = v18;
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = v19;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Set state full sync activity result %d", buf, 8u);
        }

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D398D8], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dumpMOCLoggingMetaData");

    v23 = CFSTR("FullSyncInitiated");
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postSyncStateToCloudKit:", v23);

    if (a4 < 0x65)
    {
      if (v8 && (should_defer = xpc_activity_should_defer(v8)))
      {
        if (IMOSLoggingEnabled(should_defer))
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            state = xpc_activity_get_state(v8);
            *(_DWORD *)buf = 134218240;
            v49 = a4;
            v50 = 2048;
            v51 = state;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Deferring periodic sync on attempt %lu, in state %ld", buf, 0x16u);
          }

        }
        v38 = xpc_activity_set_state(v8, 3);
        if (!v38 && IMOSLoggingEnabled(v38))
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = xpc_activity_get_state(v8);
            *(_DWORD *)buf = 134218240;
            v49 = a4;
            v50 = 2048;
            v51 = v40;
            _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Failed to set activity to STATE_DEFER(3) on attempt %lu, in state %ld", buf, 0x16u);
          }

        }
        -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
        if (v9)
          v9[2](v9, 0);
      }
      else
      {
        +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = sub_1D15844C8;
        v43[3] = &unk_1E922DCC0;
        v43[4] = self;
        v44 = v8;
        v47 = a4;
        v45 = v21;
        v46 = v9;
        objc_msgSend(v41, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:", v43);

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v25))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Max attempts to sync due to recoverable error exceeded", buf, 2u);
        }

      }
      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "reportMOCDebuggingErrorWithString:internalOnly:", CFSTR("Messages: Failed syncing to CloudKit please file a radar"), 0);

      -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
      -[IMDCKSyncController _resetSyncStateAndAttemptCounts](self, "_resetSyncStateAndAttemptCounts");
      -[IMDCKSyncController _autoBugCaptureWithSubType:debugDescription:](self, "_autoBugCaptureWithSubType:debugDescription:", CFSTR("FullMessageSync"), CFSTR("RetryAttemptExceeded"));
      -[IMDCKSyncController _reloadChatRegistryOnMainThread](self, "_reloadChatRegistryOnMainThread");
      if (v9)
        v9[2](v9, 0);
      if (v8)
      {
        v28 = xpc_activity_set_state(v8, 5);
        v29 = v28;
        if (IMOSLoggingEnabled(v28))
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v29;
            _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Set state full sync activity result %d", buf, 8u);
          }

        }
      }
      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKSyncController _retryError](self, "_retryError");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "reportErrorForSyncType:syncStep:response:error:", 1, CFSTR("Retry"), 1, v32);

      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v21);
      objc_msgSend(v33, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", 1, 0, a4, 0);

    }
  }

}

- (void)syncDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Kicking off delete sync to CloudKit", buf, 2u);
    }

  }
  -[IMDCKSyncController chatSyncController](self, "chatSyncController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D1585670;
  v12[3] = &unk_1E922DCE8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "syncPendingDeletionWithCompletion:", v12);

}

- (void)_syncRecoverableMessagesToCloudKitWithActivity:(id)a3 syncAttemptCount:(unint64_t)a4 startTime:(id)a5 syncCompletionBlock:(id)a6 retryCompletionBock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[IMDCKSyncController recoverableMessageSyncController](self, "recoverableMessageSyncController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1D1585CBC;
  v21[3] = &unk_1E922DD10;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v15;
  v25 = v14;
  v26 = a4;
  v17 = v14;
  v18 = v15;
  v19 = v13;
  v20 = v12;
  objc_msgSend(v16, "syncWithType:withActivity:withCompletion:", 1, v20, v21);

}

- (id)_sharedDatabaseManager
{
  return +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
}

- (void)_syncChatsWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to sync all chats", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSyncSessionID:", v9);

  -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 1);
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v10 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D1586218;
  v16[3] = &unk_1E9229258;
  v16[4] = self;
  v11 = v4;
  v17 = v11;
  v12 = v6;
  v18 = v12;
  objc_msgSend((id)v10, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:", v16);

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v13, "cloudKitSyncingEnabled");

  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Cleaning up tombstone table as CloudKit syncing is off", buf, 2u);
      }

    }
    IMDMessageRecordClearDeleteTombStones();
    IMDAttachmentRecordClearDeleteTombStones();
  }

}

- (void)_callSyncWithCompletion:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  char v17;

  v6 = a3;
  v7 = a4;
  -[IMDCKSyncController backupController](self, "backupController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendDeviceIDToCloudKitWithCompletion:", 0);

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cloudKitSyncDownloadAssetsOnly");

  -[IMDCKSyncController exitManager](self, "exitManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D158668C;
  v14[3] = &unk_1E922DD38;
  v17 = v10;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "exitRecordDateWithCompletion:", v14);

}

- (void)_ifCloudKitAbleToSyncWithActivity:(id)a3 callBlock:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
  {
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8 = -[IMDCKAbstractSyncController isSyncing](self, "isSyncing");
    if (v8)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v27.receiver = self;
          v27.super_class = (Class)IMDCKSyncController;
          if (-[IMDCKAbstractSyncController isSyncing](&v27, sel_isSyncing))
            v10 = CFSTR("YES");
          else
            v10 = CFSTR("NO");
          v25 = v10;
          -[IMDCKSyncController chatSyncController](self, "chatSyncController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isSyncing"))
            v11 = CFSTR("YES");
          else
            v11 = CFSTR("NO");
          v24 = v11;
          -[IMDCKSyncController messageSyncController](self, "messageSyncController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isSyncing"))
            v13 = CFSTR("YES");
          else
            v13 = CFSTR("NO");
          -[IMDCKSyncController attachmentSyncController](self, "attachmentSyncController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isSyncing"))
            v15 = CFSTR("YES");
          else
            v15 = CFSTR("NO");
          -[IMDCKSyncController exitManager](self, "exitManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isSyncing"))
            v17 = CFSTR("YES");
          else
            v17 = CFSTR("NO");
          *(_DWORD *)buf = 138413314;
          v29 = v25;
          v30 = 2112;
          v31 = v24;
          v32 = 2112;
          v33 = v13;
          v34 = 2112;
          v35 = v15;
          v36 = 2112;
          v37 = v17;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "** We are already performing a sync.  Ignoring current request to sync.\n Syncing Self:%@ Chat:%@ Message:%@ Attachment:%@ Exit:%@", buf, 0x34u);

        }
      }
      if (v7)
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    else
    {
      -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "iCloudAccountMatchesiMessageAccount");

      objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBool:forDomain:forKey:", v19, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37680]);

      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = CFSTR("NO");
          if ((_DWORD)v19)
            v23 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v29 = v23;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts match up ? %@", buf, 0xCu);
        }

      }
      if ((v19 & 1) != 0)
      {
        -[IMDCKSyncController _callSyncWithCompletion:activity:](self, "_callSyncWithCompletion:activity:", v7, v6);
      }
      else if (v7)
      {
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      }
    }
  }

}

- (void)_beginExitStateCleanupIfNeededWithActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1586D64;
  v7[3] = &unk_1E9229230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:forceFetch:", v7, 1);

}

- (void)_autoBugCaptureWithSubType:(id)a3 debugDescription:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", a4, CFSTR("NSDebugDescription"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("IMDCKSyncController"), 100, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "autoBugCaptureWithSubType:errorPayload:", v7, v10);

}

- (void)_noteSyncStarted:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (void *)*MEMORY[0x1E0D37B00];
  else
    v3 = (void *)*MEMORY[0x1E0D37AC0];
  if (a3)
    v4 = (void *)*MEMORY[0x1E0D37AC0];
  else
    v4 = (void *)*MEMORY[0x1E0D37B00];
  v5 = v3;
  v6 = v4;
  v7 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Noting down sync started. Initial value Key %@ value %@", (uint8_t *)&v13, 0x16u);

    }
  }
  v10 = IMSetDomainIntForKey();
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IMGetCachedDomainIntForKeyWithDefaultValue());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Noting down sync started. After setting value Key %@ value %@", (uint8_t *)&v13, 0x16u);

    }
  }
  IMSetDomainIntForKey();

}

- (void)_noteMetricsForSyncStartFrom:(id)a3 fullSync:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[8];

  v5 = a3;
  -[IMDCKSyncController recordMetricIsCloudKitEnabled](self, "recordMetricIsCloudKitEnabled");
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cloudKitSyncingEnabled");

  if (v7)
  {
    -[IMDCKSyncController syncStartDate](self, "syncStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      -[IMDCKSyncController longRunningSyncTimer](self, "longRunningSyncTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_9:
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v12 = (void *)MEMORY[0x1E0C99E88];
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = sub_1D1587348;
        v18 = &unk_1E922DD60;
        v19 = v5;
        objc_copyWeak(&v20, (id *)buf);
        objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v15, 28800.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCKSyncController setLongRunningSyncTimer:](self, "setLongRunningSyncTimer:", v13, v15, v16, v17, v18);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCKSyncController setSyncStartDate:](self, "setSyncStartDate:", v14);

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
        goto LABEL_10;
      }
    }
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "IMDCKSyncController: We started a second sync before a previous one was finished.  Likely there is an exit path that isn't calling _noteMeticsForSyncEndedWithSuccces", buf, 2u);
      }

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_resetSyncStateAndAttemptCounts
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting sync state, and attempt counts", v4, 2u);
    }

  }
  -[IMDCKAbstractSyncController setBroadcastedSyncStateStateToFinished](self, "setBroadcastedSyncStateStateToFinished");
  IMSetDomainIntForKey();
  IMSetDomainIntForKey();
}

- (int64_t)_periodicSyncAttemptCount
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IMGetCachedDomainIntForKeyWithDefaultValue());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "_periodicSyncAttemptCount %@", (uint8_t *)&v5, 0xCu);

    }
  }
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (int64_t)_manualSyncAttemptCount
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IMGetCachedDomainIntForKeyWithDefaultValue());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "_manualSyncAttemptCount %@", (uint8_t *)&v5, 0xCu);

    }
  }
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (void)_writeDownSyncDate
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = IMOSLoggingEnabled(v3);
  if ((_DWORD)v4)
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Chats, messages, and attachments have synced successfully, sync time: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Updating sync date for Manatee sync %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastSyncDate:", v3);

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v3, *MEMORY[0x1E0D37B88], 1);

  -[IMDCKSyncController exitManager](self, "exitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeSyncCompletedRecordWithDate:completion:", v3, &unk_1E922DD80);

}

- (void)syncChatsWithMessageContext:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to syncChats from XPC", buf, 2u);
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D1587AB0;
  v6[3] = &unk_1E9229870;
  v6[4] = self;
  -[IMDCKSyncController _ifCloudKitAbleToSyncWithActivity:callBlock:](self, "_ifCloudKitAbleToSyncWithActivity:callBlock:", 0, v6);

}

- (void)_noteMeticsForSyncEndedWithSuccces:(BOOL)a3
{
  void *v4;

  -[IMDCKSyncController longRunningSyncTimer](self, "longRunningSyncTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[IMDCKSyncController setLongRunningSyncTimer:](self, "setLongRunningSyncTimer:", 0);
  -[IMDCKSyncController setSyncStartDate:](self, "setSyncStartDate:", 0);
  -[IMDCKAbstractSyncController setBroadcastedSyncStateStateToFinished](self, "setBroadcastedSyncStateStateToFinished");
}

- (id)syncStateDebuggingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("sync-state-user-defaults"));

  v39.receiver = self;
  v39.super_class = (Class)IMDCKSyncController;
  -[IMDCKAbstractSyncController syncStateDebuggingInfo:](&v39, sel_syncStateDebuggingInfo_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v10);

  -[IMDCKSyncController attachmentSyncController](self, "attachmentSyncController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncStateDebuggingInfo:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController attachmentSyncController](self, "attachmentSyncController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, v15);

  -[IMDCKSyncController exitManager](self, "exitManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "syncStateDebuggingInfo:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController exitManager](self, "exitManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v17, v20);

  -[IMDCKSyncController chatSyncController](self, "chatSyncController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "syncStateDebuggingInfo:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController chatSyncController](self, "chatSyncController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, v25);

  -[IMDCKSyncController messageSyncController](self, "messageSyncController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "syncStateDebuggingInfo:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController messageSyncController](self, "messageSyncController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, v30);

  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "syncStateDebuggingInfo:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v32, v35);

  if (IMOSLoggingEnabled(v36))
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v5;
      _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "assembled sync state debugging info: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D39638], "IMAKUserInfoChangedNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v9);

  if (v12)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v19 = 138412546;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Handling event with name %@ userInfo %@", (uint8_t *)&v19, 0x16u);
      }

    }
    -[IMDCKSyncController handleAKUserInfoChangedNotification:](self, "handleAKUserInfoChangedNotification:", v10);
  }
  v15 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37C10]);
  if ((_DWORD)v15)
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Got user signed into HSA2 account notification", (uint8_t *)&v19, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isUnderFirstDataProtectionLock");

    if ((v18 & 1) == 0)
      -[IMDCKSyncController verifyAccountsMatchForMoc](self, "verifyAccountsMatchForMoc");
  }

}

- (void)updateSecurityLevelDowngradedIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IMDCKSyncController exitManager](self, "exitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1588138;
  v7[3] = &unk_1E922DDD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "exitRecordDateWithCompletion:", v7);

}

- (void)handleAKUserInfoChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Handling AKUserInfoChangedNotification with user info: %@", (uint8_t *)&v22, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D39638], "IMAKUserInfoChangedAltDSIDKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39638], "IMAKUserInfoChangedSecurityLevelKey");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_8:
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_primaryiCloudAccountAltDSID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "isEqualToString:", v12);

        if (v13)
        {
          if (IMOSLoggingEnabled(v14))
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = 138412290;
              v23 = v16;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Account level changed to %@", (uint8_t *)&v22, 0xCu);

            }
          }
          if (objc_msgSend(v10, "unsignedIntegerValue"))
          {
            v17 = objc_msgSend(v10, "unsignedIntegerValue");
            if (v17 != 4)
            {
              if (IMOSLoggingEnabled(v17))
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  LOWORD(v22) = 0;
                  _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "We are downgrading from HSA2 -- turning off messages on iCloud", (uint8_t *)&v22, 2u);
                }

              }
              -[IMDCKSyncController backupController](self, "backupController");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setICloudBackupsDisabled:", 0);

              -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "downgradingFromHSA2AndDisablingMOC");

            }
            -[IMDCKSyncController updateSecurityLevelDowngradedIfNeeded:](self, "updateSecurityLevelDowngradedIfNeeded:", &unk_1E922DDF0);
          }
          else if (IMOSLoggingEnabled(0))
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              LOWORD(v22) = 0;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Account level changed to unknown, not turning off messages in iCloud or refreshing values associated with IMCloudKitAppleIDSecurityLevelHSA2.", (uint8_t *)&v22, 2u);
            }

          }
        }

        goto LABEL_29;
      }
    }
    else
    {
      v9 = 0;
      if (v7)
        goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_29:

}

- (BOOL)verifyAccountsMatchForMoc
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iCloudAccountMatchesiMessageAccount");

  v5 = IMSetDomainBoolForKey();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v4)
        v7 = CFSTR("YES");
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "iCloud and iMessage account match up ? %@", (uint8_t *)&v14, 0xCu);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

  if (((v9 ^ 1 | v4) & 1) == 0)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts do not match up.", (uint8_t *)&v14, 2u);
      }

    }
    -[IMDCKSyncController backupController](self, "backupController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setICloudBackupsDisabled:", 0);

  }
  return v4;
}

- (void)performOneTimeAccountUpgradeCheckIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "performOneTimeAccountUpgradeCheckIfNeeded", buf, 2u);
    }

  }
  v4 = IMGetDomainBoolForKey();
  if ((v4 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v9 = 0x403E000000000000;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Will performing MOIC account check on upgrade after %f seconds", buf, 0xCu);
      }

    }
    v6 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1588C6C;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
}

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Clear analytic defaults and local sync state", v5, 2u);
    }

  }
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalyticSyncDatesDictionary:", MEMORY[0x1E0C9AA70]);

  -[IMDCKSyncController clearLocalCloudKitSyncState](self, "clearLocalCloudKitSyncState");
}

- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3 keys:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v5, "setObject:forKey:", &unk_1E92716B0, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D37A20];
  v11[0] = *MEMORY[0x1E0D37B88];
  v11[1] = v4;
  v5 = *MEMORY[0x1E0D37A50];
  v11[2] = *MEMORY[0x1E0D37A28];
  v11[3] = v5;
  v6 = *MEMORY[0x1E0D37930];
  v11[4] = *MEMORY[0x1E0D37A60];
  v11[5] = v6;
  v7 = *MEMORY[0x1E0D37A30];
  v11[6] = *MEMORY[0x1E0D37A68];
  v11[7] = v7;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v11, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _addDatesDefaultsIfNeededToDictionary:keys:](self, "_addDatesDefaultsIfNeededToDictionary:keys:", v9, v10);

}

- (id)_dailySyncStateDictionary
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticSyncDatesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDictionary:", v5);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("version"));
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncUserType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D37C00]);

  -[IMDCKSyncController _addDatesDefaultsIfNeededToDictionary:](self, "_addDatesDefaultsIfNeededToDictionary:", v6);
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "micDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IMDCKAbstractSyncController syncState](self, "syncState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "micDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("deviceID"));

  }
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D37950];
  objc_msgSend(v13, "getValueFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37CC8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D48]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "bucket");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D37BE0]);

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D58]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "bucket");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D37BF0]);

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D40]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "bucket");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D37BD8]);

    }
    v47 = v24;
    v48 = v21;
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D50]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "bucket");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D37BE8]);

    }
    objc_msgSend(v13, "getValueFromDomain:forKey:", v14, CFSTR("Server.TotalRecords.chatManateeZone"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v49 = v18;
    if (v29)
      v31 = v29;
    else
      v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 0);
    v32 = v31;

    objc_msgSend(v13, "getValueFromDomain:forKey:", v14, CFSTR("Server.TotalRecords.chatManateeZone"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      v35 = v33;
    else
      v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 0);
    v36 = v35;

    objc_msgSend(v13, "getValueFromDomain:forKey:", v14, CFSTR("Server.TotalRecords.chatManateeZone"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
      v39 = v37;
    else
      v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 0);
    v40 = v39;

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v36, "longLongValue")+ objc_msgSend(v32, "longLongValue")+ objc_msgSend(v40, "longLongValue"));
    objc_msgSend(v41, "bucket");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D37BF8]);

  }
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "describeErrors");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v44, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("syncErrors"));
  v45 = (void *)objc_msgSend(v6, "copy");

  return v45;
}

- (BOOL)_completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:(id)a3 firstFullSyncCompletedDate:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a3, "isEqualToDate:", a4) ^ 1;
  }
  return result;
}

- (id)_periodicSyncStateDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint8_t v21[16];

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAnalyticSyncDatesObjectForKey:", *MEMORY[0x1E0D37A30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "intValue"))
  {
    v6 = 0;
    goto LABEL_11;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
  v6 = (void *)v5;
  if (!v5)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "User has completed a first full sync so device has started doing periodic syncs. Logging full periodic sync metric.", v21, 2u);
    }

  }
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticSyncDatesDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithDictionary:", v10);

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getAnalyticSyncDatesObjectForKey:", *MEMORY[0x1E0D37B88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKSyncController _addDatesDefaultsIfNeededToDictionary:](self, "_addDatesDefaultsIfNeededToDictionary:", v11);
  objc_msgSend(v11, "setObject:forKey:", CFSTR("1"), CFSTR("version"));
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncUserType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v15, *MEMORY[0x1E0D37C00]);

  if (!v13 || objc_msgSend(v13, "intValue") == -1)
    v16 = 0;
  else
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v13, "longLongValue"));
  v17 = -[IMDCKSyncController _completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:firstFullSyncCompletedDate:](self, "_completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:firstFullSyncCompletedDate:", v16, v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("completedPeriodicSyncSinceFirstFullSync"));

LABEL_14:
  v19 = (void *)objc_msgSend(v11, "copy");

  return v19;
}

- (BOOL)_serverDeniesPeriodicSyncAnalytics
{
  return IMBagIntValueWithDefault() != 0;
}

- (BOOL)_serverDeniesDailySyncStateAnalytics
{
  return IMBagIntValueWithDefault() != 0;
}

- (void)_submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldReportToRTC");

  if (v8)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postSyncStateToRTC:category:reportDictionary:", v13, 1, v6);

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldReportToAnalytics");

  if (v11)
  {
    +[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", v13, v6);

  }
}

- (BOOL)logCloudKitAnalytics
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  uint64_t v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  _BYTE v29[24];
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isSyncingEnabled") & 1) != 0)
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "serverAllowsAnalyticSubmission");

    if ((v5 & 1) != 0)
    {
      -[IMDCKSyncController _dailySyncStateDictionary](self, "_dailySyncStateDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;
      if (v7)
      {
        -[IMDCKAbstractSyncController syncState](self, "syncState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "createdChatZone");

        -[IMDCKAbstractSyncController syncState](self, "syncState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "deletedZones");

        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isMessagesIniCloudVersion2");

        if ((v14 & 1) != 0)
        {
          v16 = CFSTR("daily_status");
        }
        else
        {
          -[IMDCKAbstractSyncController syncState](self, "syncState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "syncUserType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("dailySyncState-"), "stringByAppendingString:", v20);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = CFSTR("NO");
            *(_DWORD *)v29 = 138413058;
            *(_QWORD *)&v29[4] = v16;
            if (v10)
              v23 = CFSTR("YES");
            else
              v23 = CFSTR("NO");
            *(_WORD *)&v29[12] = 2112;
            *(_QWORD *)&v29[14] = v7;
            if (v12)
              v22 = CFSTR("YES");
            *(_WORD *)&v29[22] = 2112;
            v30 = v23;
            v31 = 2112;
            v32 = v22;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Device will be uploading %@ analytic dict %@ to CK. CreatedZones: %@ DeletedZones:%@", v29, 0x2Au);
          }

        }
        -[IMDCKSyncController _submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:](self, "_submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", v16, v7, *(_OWORD *)v29, *(_QWORD *)&v29[16]);

      }
      else if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Not uploading daily sync state.", v29, 2u);
        }

      }
      -[IMDCKSyncController _periodicSyncStateDictionary](self, "_periodicSyncStateDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = IMOSLoggingEnabled(v24);
      if (v24)
      {
        if (v25)
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v29 = 138412290;
            *(_QWORD *)&v29[4] = v24;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Will be uploading dailySyncState-PeriodicSync analytic dict %@ to CK.", v29, 0xCu);
          }

        }
        -[IMDCKSyncController _submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:](self, "_submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", CFSTR("dailySyncState-PeriodicSync"), v24);
        v8 = 1;
      }
      else if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Not uploading periodic sync activity.", v29, 2u);
        }

      }
      return v8;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not logging analytics", v29, 2u);
    }

  }
  return 0;
}

- (id)_stringForDate:(id)a3 withFormatter:(id)a4
{
  id v5;
  __CFString *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v5 = a3;
  v6 = CFSTR("nil");
  if (v5 && a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99D68];
    v8 = a4;
    v9 = [v7 alloc];
    objc_msgSend(v5, "doubleValue");
    v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSince1970:");
    objc_msgSend(v8, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error formatting %@"), v5);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v12;

  }
  return v6;
}

- (id)_stringForObject:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("nil");

  return v5;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v48;
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
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint8_t buf[16];
  _QWORD v64[6];
  _QWORD v65[6];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[8];
  _QWORD v71[8];
  _QWORD v72[7];
  _QWORD v73[9];

  v73[7] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Gathering stats for sysdiagnose", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = CFSTR("micDeviceID");
  v59 = *MEMORY[0x1E0D37950];
  objc_msgSend(v62, "getValueFromDomain:forKey:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v4;
  v72[1] = CFSTR("enabled");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "cloudKitSyncingEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v7;
  v72[2] = CFSTR("syncing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D4D8B0], "isSyncing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v8;
  v72[3] = CFSTR("outOfBackup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E0D37A80]));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v9;
  v72[4] = CFSTR("accountStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E0D378D8]));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v10;
  v72[5] = CFSTR("accountsMatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E0D37680]));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v11;
  v72[6] = CFSTR("errors");
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "describeErrors");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("no errors");
  if (v13)
    v15 = (const __CFString *)v13;
  v73[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 7);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v61, "setDateFormat:", CFSTR("MM/dd/YYYY hh:mm:ss a"));
  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "analyticSyncDatesDictionary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v70[0] = CFSTR("initStart");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A50]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v56, v61);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v55;
  v70[1] = CFSTR("initEnd");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A60]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v54, v61);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v53;
  v70[2] = CFSTR("restoreStart");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A00]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v52, v61);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v51;
  v70[3] = CFSTR("restoreEnd");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A08]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v50, v61);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v17;
  v70[4] = CFSTR("fullFirstEnd");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A30]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v18, v61);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v19;
  v70[5] = CFSTR("fullStart");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A20]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v20, v61);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v21;
  v70[6] = CFSTR("fullEnd");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37A28]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v22, v61);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v23;
  v70[7] = CFSTR("last");
  objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D37B88]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForDate:withFormatter:](self, "_stringForDate:withFormatter:", v24, v61);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v68[0] = CFSTR("chat");
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("Server.TotalRecords.chatManateeZone"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v27;
  v68[1] = CFSTR("msg");
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("Server.TotalRecords.messageManateeZone"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v29;
  v68[2] = CFSTR("att");
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("Server.TotalRecords.attachmentManateeZone"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v31;
  v68[3] = CFSTR("upd");
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("Server.TotalRecords.messageUpdateZone"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v33;
  v68[4] = CFSTR("rdel");
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("Server.TotalRecords.recoverableMessageDeleteZone"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncController _stringForObject:](self, "_stringForObject:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, *MEMORY[0x1E0D37CC8]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "getValueFromDomain:forKey:", v59, CFSTR("IMD-IDS-Aliases"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = CFSTR("total");
  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v37, "objectForKey:", CFSTR("allAliases"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = CFSTR("active");
  v67[0] = v40;
  v41 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v37, "objectForKey:", CFSTR("selectedAliases"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v64[0] = CFSTR("summary");
  v64[1] = CFSTR("syncDates");
  v64[2] = CFSTR("serverCounts");
  v64[3] = CFSTR("dbSummary");
  if (v36)
    v45 = v36;
  else
    v45 = (void *)MEMORY[0x1E0C9AA70];
  v65[2] = v57;
  v65[3] = v45;
  v64[5] = CFSTR("aliasesSummary");
  v65[0] = v49;
  v65[1] = v48;
  v64[4] = CFSTR("syncDbSummary");
  v65[4] = MEMORY[0x1E0C9AA70];
  v65[5] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (NSDate)syncStartDate
{
  return self->_syncStartDate;
}

- (void)setSyncStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_syncStartDate, a3);
}

- (NSTimer)longRunningSyncTimer
{
  return self->_longRunningSyncTimer;
}

- (void)setLongRunningSyncTimer:(id)a3
{
  objc_storeStrong((id *)&self->_longRunningSyncTimer, a3);
}

- (IMTimer)nightlySyncTimer
{
  return self->_nightlySyncTimer;
}

- (void)setNightlySyncTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nightlySyncTimer, a3);
}

- (int64_t)initialSyncAttempts
{
  return self->_initialSyncAttempts;
}

- (void)setInitialSyncAttempts:(int64_t)a3
{
  self->_initialSyncAttempts = a3;
}

- (NSDate)lastLogDumpDate
{
  return self->_lastLogDumpDate;
}

- (void)setLastLogDumpDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLogDumpDate, a3);
}

- (NSDate)lastRestoreFailureLogDumpDate
{
  return self->_lastRestoreFailureLogDumpDate;
}

- (void)setLastRestoreFailureLogDumpDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRestoreFailureLogDumpDate, a3);
}

- (BOOL)shouldReloadConversations
{
  return self->_shouldReloadConversations;
}

- (void)setShouldReloadConversations:(BOOL)a3
{
  self->_shouldReloadConversations = a3;
}

- (NSTimer)reloadTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReloadTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (IMSyncResumer)syncResumer
{
  return self->_syncResumer;
}

- (void)setSyncResumer:(id)a3
{
  objc_storeStrong((id *)&self->_syncResumer, a3);
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, a3);
}

- (BOOL)isFetchingExitForEnablement
{
  return self->_isFetchingExitForEnablement;
}

- (void)setIsFetchingExitForEnablement:(BOOL)a3
{
  self->_isFetchingExitForEnablement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_syncResumer, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_lastRestoreFailureLogDumpDate, 0);
  objc_storeStrong((id *)&self->_lastLogDumpDate, 0);
  objc_storeStrong((id *)&self->_nightlySyncTimer, 0);
  objc_storeStrong((id *)&self->_longRunningSyncTimer, 0);
  objc_storeStrong((id *)&self->_syncStartDate, 0);
}

@end
