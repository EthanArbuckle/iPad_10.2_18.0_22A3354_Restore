@implementation IMDCKUtilities

- (IMDCKSyncState)syncState
{
  IMDCKSyncState *syncState;
  id v4;
  void *v5;
  void *v6;
  IMDCKSyncState *v7;
  IMDCKSyncState *v8;
  NSObject *v9;

  syncState = self->_syncState;
  if (!syncState)
  {
    v4 = objc_alloc(MEMORY[0x1E0D398C0]);
    v5 = (void *)objc_msgSend(v4, "initWithDomain:", *MEMORY[0x1E0D37950]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39708]), "initWithKeyValueStorage:", v5);
    v7 = -[IMDCKSyncState initWithKeyValueCollection:]([IMDCKSyncState alloc], "initWithKeyValueCollection:", v6);
    v8 = self->_syncState;
    self->_syncState = v7;

    -[IMDCKSyncState setDelegate:](self->_syncState, "setDelegate:", self);
    -[IMDCKUtilities logHandle](self, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1D1665C14(v9);

    syncState = self->_syncState;
  }
  return syncState;
}

- (void)syncStateWillUpdate:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setSyncingEnabled:", -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled"));
  objc_msgSend(v4, "setSyncingPaused:", -[IMDCKUtilities isSyncingPaused](self, "isSyncingPaused"));
  -[IMDCKUtilities backupController](self, "backupController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemovedFromBackup:", objc_msgSend(v5, "iCloudBackupsDisabled"));

  v6 = -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled");
  v7 = -[IMDCKUtilities didKeyRollPendingCheck](self, "didKeyRollPendingCheck");
  if (v7 || !v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = -[IMDCKUtilities didKeyRollPendingCheck](self, "didKeyRollPendingCheck");
        v11 = CFSTR("NO");
        if (v10)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        if (v6)
          v11 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v17 = v12;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not performing key roll check didKeyRollPendingCheck %@ cloudKitSyncingEnabled %@", buf, 0x16u);
      }

    }
  }
  else
  {
    -[IMDCKUtilities setDidKeyRollPendingCheck:](self, "setDidKeyRollPendingCheck:", 1);
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D142B138;
    v14[3] = &unk_1E9227F58;
    v15 = v4;
    objc_msgSend(v8, "PCSKeyRollPendingAsync:timeout:", v14, 10.0);

  }
  -[IMDCKUtilities logHandle](self, "logHandle");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_1D1665C54(v4);

}

- (BOOL)shouldRepairAccountWithAccountStatus:(int64_t)a3 securityLevel:(unint64_t)a4
{
  _BOOL8 v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v15;
  const __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = -[IMDCKUtilities _accountNeedsRepairOverride](self, "_accountNeedsRepairOverride");
  if (v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "account repair overridden", (uint8_t *)&v20, 2u);
      }

    }
    LOBYTE(v9) = 1;
  }
  else
  {
    -[IMDCKUtilities syncState](self, "syncState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSyncingEnabled");

    if ((v11 & 1) != 0)
    {
      v9 = a3 == 3 && a4 == 4 || a3 == 2;
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = CFSTR("NO");
          if (v9)
            v16 = CFSTR("YES");
          if ((unint64_t)a3 > 4)
            v17 = 0;
          else
            v17 = off_1E9228548[a3];
          v20 = 138412546;
          v21 = v16;
          v22 = 2112;
          v23 = v17;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Account needs repair: %@ (account status: %@)", (uint8_t *)&v20, 0x16u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "MiC is disabled, does not need repair", (uint8_t *)&v20, 2u);
        }

      }
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (IDSServerBag)serverBag
{
  IDSServerBag *serverBag;
  IDSServerBag *v4;
  IDSServerBag *v5;

  serverBag = self->_serverBag;
  if (!serverBag)
  {
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
    v4 = (IDSServerBag *)objc_claimAutoreleasedReturnValue();
    v5 = self->_serverBag;
    self->_serverBag = v4;

    serverBag = self->_serverBag;
  }
  return serverBag;
}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (BOOL)isSyncingPaused
{
  _BOOL8 v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL8 v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDCKUtilities _isSyncingPausedOverride](self, "_isSyncingPausedOverride");
  if (!v3)
  {
    -[IMDCKUtilities syncState](self, "syncState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSyncingEnabled");
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v6, "lastSyncDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "syncing not paused because we have a valid sync date", (uint8_t *)&v20, 2u);
          }
LABEL_16:

        }
      }
      else
      {
        v12 = objc_msgSend(v6, "isSyncing");
        if ((_DWORD)v12)
        {
          if (!IMOSLoggingEnabled(v12))
            goto LABEL_17;
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "syncing not paused because we are syncing", (uint8_t *)&v20, 2u);
          }
          goto LABEL_16;
        }
        v13 = -[IMDCKUtilities isDeviceCharging](self, "isDeviceCharging");
        v14 = -[IMDCKUtilities isDeviceOnWifi](self, "isDeviceOnWifi");
        v15 = v14;
        v16 = IMOSLoggingEnabled(v14);
        if (!v13 || !v15)
        {
          if (v16)
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = CFSTR("NO");
              if (v15)
                v19 = CFSTR("YES");
              else
                v19 = CFSTR("NO");
              if (v13)
                v18 = CFSTR("YES");
              v20 = 138412546;
              v21 = v19;
              v22 = 2112;
              v23 = v18;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "syncing paused: connected to Wifi: %@, device is charging: %@", (uint8_t *)&v20, 0x16u);
            }

          }
          v5 = 1;
          goto LABEL_18;
        }
        if (v16)
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "syncing not paused because we are connected wifi and device is charging", (uint8_t *)&v20, 2u);
          }
          goto LABEL_16;
        }
      }
    }
    else if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "syncing not paused because syncing not enabled", (uint8_t *)&v20, 2u);
      }
      goto LABEL_16;
    }
LABEL_17:
    v5 = 0;
LABEL_18:

    return v5;
  }
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "syncing paused because syncing override is YES", (uint8_t *)&v20, 2u);
    }

  }
  return 1;
}

- (void)fetchCloudKitAccountStatusWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t AppBooleanValue;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  void (**v18)(id, uint64_t, _QWORD);
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("isEligibleForTruthZoneOverride"), (CFStringRef)*MEMORY[0x1E0D37950], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v6 = AppBooleanValue;
    if (IMOSLoggingEnabled(AppBooleanValue))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("YES");
        if (!v6)
          v8 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Overriding isEligibleForTruthZone: %@", buf, 0xCu);
      }

    }
    if (keyExistsAndHasValidFormat)
      v9 = 4;
    else
      v9 = 3;
    v4[2](v4, v9, 0);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D141B07C;
    aBlock[3] = &unk_1E92280C8;
    v18 = v4;
    v11 = _Block_copy(aBlock);
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Fetching cloud kit account info with cloudkit api", buf, 2u);
      }

    }
    -[IMDCKUtilities _truthContainer](self, "_truthContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = sub_1D142DDC8;
    v15[3] = &unk_1E92280F0;
    v15[4] = self;
    v16 = v11;
    v14 = v11;
    objc_msgSend(v13, "accountInfoWithCompletionHandler:", v15);

  }
}

- (void)fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  __CFString *v7;
  id v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDCKUtilities _primaryiCloudAccountSecurityLevel](self, "_primaryiCloudAccountSecurityLevel");
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AKAppleIDSecurityLevel(%ld)"), v5);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E9228570[v5];
      }
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Got local account security level %@", buf, 0xCu);

    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D141ACE8;
  aBlock[3] = &unk_1E9228138;
  v11 = v4;
  v12 = v5;
  aBlock[4] = self;
  v8 = v4;
  v9 = _Block_copy(aBlock);
  -[IMDCKUtilities fetchCloudKitAccountStatusWithCompletion:](self, "fetchCloudKitAccountStatusWithCompletion:", v9);

}

- (BOOL)didKeyRollPendingCheck
{
  return self->_didKeyRollPendingCheck;
}

- (BOOL)cloudKitSyncingEnabled
{
  uint64_t v3;
  void *v4;
  char v5;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = IMAllowMessagesIniCloud();
  if ((v3 & 1) != 0)
  {
    if (-[IMDCKUtilities _serverAllowsSync](self, "_serverAllowsSync"))
    {
      if ((IMGetCachedDomainBoolForKey() & 1) == 0)
      {
        -[IMDCKUtilities syncState](self, "syncState");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "isFeatureEnabled");

        return v5;
      }
    }
    else
    {
      v8 = IMGetDomainBoolForKey();
      if ((v8 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v8))
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Putting user back into backup as Madrid server has turned off the feature", v11, 2u);
          }

        }
        +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setICloudBackupsDisabled:", 0);

        IMSetDomainBoolForKey();
      }
    }
  }
  else if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "**** cloudKitSyncingEnabled is turned off in this build", buf, 2u);
    }

  }
  return 0;
}

- (void)broadcastCloudKitState
{
  void *v3;
  NSObject *v4;

  -[IMDCKUtilities syncState](self, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKUtilities logHandle](self, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1D1665CD4(v3);

  objc_msgSend(v3, "broadcastSyncState");
}

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1D141AEE0;
  v2[3] = &unk_1E9227F80;
  v2[4] = self;
  -[IMDCKUtilities fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:](self, "fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:", v2);
}

- (id)backupController
{
  return +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
}

- (id)_truthContainer
{
  void *v2;
  void *v3;

  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "truthContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setEligibleToToggleMiCSwitch:(BOOL)a3
{
  IMCloudKitSetEligibleToToggleMiCSwitch();
}

- (BOOL)_serverAllowsSync
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[IMDCKUtilities _mininimumServerBagClientValue](self, "_mininimumServerBagClientValue");
  v3 = v2;
  if (v2 >= 1 && IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109376;
      v6[1] = 0;
      v7 = 2048;
      v8 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Madrid server bag does not allow us to sync. Our client version %d server client version %ld", (uint8_t *)v6, 0x12u);
    }

  }
  return v3 < 1;
}

- (id)_primaryiCloudAccount
{
  void *v2;
  void *v3;

  -[IMDCKUtilities _accountStore](self, "_accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_primaryiCloudAccountSecurityLevel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[IMDCKUtilities _primaryiCloudAccountAltDSID](self, "_primaryiCloudAccountAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[IMDCKUtilities _accountManager](self, "_accountManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authKitAccountWithAltDSID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[IMDCKUtilities _accountManager](self, "_accountManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "securityLevelForAccount:", v5);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_primaryiCloudAccountAltDSID
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDCKUtilities _primaryiCloudAccount](self, "_primaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMDCKUtilities _accountManager](self, "_accountManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSIDForAccount:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_mininimumServerBagClientValue
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDCKUtilities serverBag](self, "serverBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-client-min-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (BOOL)_isSyncingPausedOverride
{
  if (qword_1ED935F30 != -1)
    dispatch_once(&qword_1ED935F30, &unk_1E9228250);
  return byte_1EFC63BE8;
}

- (id)_accountStore
{
  if (qword_1ED935F28 != -1)
    dispatch_once(&qword_1ED935F28, &unk_1E92281A0);
  return (id)qword_1ED935F20;
}

- (BOOL)_accountNeedsRepairOverride
{
  if (qword_1ED935F18 != -1)
    dispatch_once(&qword_1ED935F18, &unk_1E9228110);
  return byte_1EFC63BD0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D142AFB8;
  block[3] = &unk_1E9227F30;
  block[4] = a1;
  if (qword_1ED935EB0 != -1)
    dispatch_once(&qword_1ED935EB0, block);
  return (id)qword_1ED935D68;
}

+ (id)logHandle
{
  if (qword_1ED935EA0 != -1)
    dispatch_once(&qword_1ED935EA0, &unk_1E9227F10);
  return (id)qword_1ED935E90;
}

- (IMLockdownManager)lockdownManager
{
  IMLockdownManager *lockdownManager;
  IMLockdownManager *v4;
  IMLockdownManager *v5;

  lockdownManager = self->_lockdownManager;
  if (!lockdownManager)
  {
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v4 = (IMLockdownManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lockdownManager;
    self->_lockdownManager = v4;

    lockdownManager = self->_lockdownManager;
  }
  return lockdownManager;
}

- (FTDeviceSupport)deviceSupport
{
  FTDeviceSupport *deviceSupport;
  FTDeviceSupport *v4;
  FTDeviceSupport *v5;

  deviceSupport = self->_deviceSupport;
  if (!deviceSupport)
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v4 = (FTDeviceSupport *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceSupport;
    self->_deviceSupport = v4;

    deviceSupport = self->_deviceSupport;
  }
  return deviceSupport;
}

- (id)exitManager
{
  return +[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance");
}

- (id)_truthDatabase
{
  void *v2;
  void *v3;

  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "truthDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IMDefaults)imDefaults
{
  IMDefaults *imDefaults;
  IMDefaults *v4;
  IMDefaults *v5;

  imDefaults = self->_imDefaults;
  if (!imDefaults)
  {
    v4 = (IMDefaults *)objc_alloc_init(MEMORY[0x1E0D397E8]);
    v5 = self->_imDefaults;
    self->_imDefaults = v4;

    imDefaults = self->_imDefaults;
  }
  return imDefaults;
}

- (IMDSyncTelemetryReporter)telemetryReporter
{
  IMDSyncTelemetryReporter *telemetryReporter;
  IMDSyncTelemetryReporter *v4;
  IMDSyncTelemetryReporter *v5;

  telemetryReporter = self->_telemetryReporter;
  if (!telemetryReporter)
  {
    v4 = (IMDSyncTelemetryReporter *)objc_alloc_init(MEMORY[0x1E0D4D8B8]);
    v5 = self->_telemetryReporter;
    self->_telemetryReporter = v4;

    telemetryReporter = self->_telemetryReporter;
  }
  return telemetryReporter;
}

- (IMDCKUtilities)initWithServerBag:(id)a3 lockDownmanager:(id)a4 deviceSupport:(id)a5 imDefaults:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IMDCKUtilities *v15;
  IMDCKUtilities *v16;
  id v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IMDCKUtilities;
  v15 = -[IMDCKUtilities init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serverBag, a3);
    objc_storeStrong((id *)&v16->_lockdownManager, a4);
    objc_storeStrong((id *)&v16->_deviceSupport, a5);
    objc_storeStrong((id *)&v16->_imDefaults, a6);
    v17 = -[IMDCKUtilities _authenticationController](v16, "_authenticationController");
  }

  return v16;
}

- (IMDCKUtilities)init
{
  return (IMDCKUtilities *)MEMORY[0x1E0DE7D20](self, sel_initWithServerBag_lockDownmanager_deviceSupport_imDefaults_);
}

+ (id)restoreFailuresDirectory
{
  void *v2;
  void *v3;
  void *v4;

  IMSafeTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("CKMessagesLogDump"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  id v3;

  -[IMDCKUtilities syncState](self, "syncState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearSyncErrors");
  -[IMDCKUtilities broadcastCloudKitStateAfterFetchingAccountStatus](self, "broadcastCloudKitStateAfterFetchingAccountStatus");

}

- (void)keyRollPendingStateDidChange
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
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "updating key roll pending state", v4, 2u);
    }

  }
  -[IMDCKUtilities setDidKeyRollPendingCheck:](self, "setDidKeyRollPendingCheck:", 0);
  -[IMDCKUtilities broadcastCloudKitStateAfterFetchingAccountStatus](self, "broadcastCloudKitStateAfterFetchingAccountStatus");
}

- (BOOL)shouldUseDevContainer
{
  int v3;
  void *v4;
  char v5;

  v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    -[IMDCKUtilities lockdownManager](self, "lockdownManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInternalInstall");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldUseDevNickNameContainer
{
  int v3;
  void *v4;
  char v5;

  v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    -[IMDCKUtilities lockdownManager](self, "lockdownManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInternalInstall");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldForceArchivedMessagesSync
{
  void *v3;
  char v4;

  if (!IMIsRunningInAutomation() || !IMGetCachedDomainBoolForKey())
    return 0;
  -[IMDCKUtilities lockdownManager](self, "lockdownManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  return v4;
}

- (int64_t)overrideNumberOfChatsToFetch
{
  void *v2;
  char v3;
  void *v4;
  int64_t v5;

  -[IMDCKUtilities lockdownManager](self, "lockdownManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = IMIsRunningInUnitTesting();

    if ((v3 & 1) != 0)
      return -1;
    IMGetCachedDomainValueForKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      return -1;
    v2 = v4;
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (int64_t)overrideNumberOfChatsToWrite
{
  void *v2;
  char v3;
  void *v4;
  int64_t v5;

  -[IMDCKUtilities lockdownManager](self, "lockdownManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = IMIsRunningInUnitTesting();

    if ((v3 & 1) != 0)
      return -1;
    IMGetCachedDomainValueForKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      return -1;
    v2 = v4;
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (void)isFirstSyncWithActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D142B654;
  v9[3] = &unk_1E9227FA8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "anyChatExistsOnServerWithActivity:completion:", v6, v9);

}

- (unint64_t)messageDatabaseSize
{
  void *v2;
  NSObject *v3;
  unint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  IMSharedHelperMessagesRootFolderPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Get file size on path: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v4 = IMLegacyCalculateFileSizeForPath();

  return v4;
}

- (double)_iCloudStorageSizeFudgeFactorBagValue
{
  double result;

  IMBagDoubleValueWithDefault();
  return result;
}

- (unint64_t)currentStorageOnDevice
{
  NSObject *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  NSObject *v21;
  IMDCKUtilities *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  _BYTE v41[128];
  _QWORD v42[5];

  v23 = self;
  v42[3] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[IMDCKUtilities currentStorageOnDevice]";
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "%s: retrieving current storage for CloudKit storage calculation", buf, 0xCu);
    }

  }
  IMSMSDirectoryURL();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sms.db"), "stringByAppendingString:", CFSTR("-wal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "URLByAppendingPathComponent:", CFSTR("sms.db"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "URLByAppendingPathComponent:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentsDirectoryURL();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v26;
  v42[1] = v25;
  v42[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v32;
    v6 = *MEMORY[0x1E0C999D0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30 = 0;
        v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v30, v6, 0, v23);
        v10 = v30;
        v11 = v10;
        if (v9)
          objc_msgSend(v10, "BOOLValue");
        objc_msgSend(v8, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = IMCalculateFileSizeForPath();

        if (IMOSLoggingEnabled(v14))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "path");
            v16 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v36 = v16;
            v37 = 2048;
            v38 = v13;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Calculated file size on path %@ as: %llu", buf, 0x16u);

          }
        }

        v3 += v13;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v4);
  }

  v17 = -[IMDCKUtilities _iCloudStorageSizeFudgeFactorBagValue](v23, "_iCloudStorageSizeFudgeFactorBagValue");
  v19 = v18;
  v20 = (unint64_t)(v18 * (double)v3);
  if (IMOSLoggingEnabled(v17))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v36 = *(const char **)&v19;
      v37 = 2048;
      v38 = v3;
      v39 = 2048;
      v40 = v20;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "fudge factor (%f) total size (%llu) final size (%llu)", buf, 0x20u);
    }

  }
  return v20;
}

- (void)estimateQuotaAvailability:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iCloudBackupsDisabled");

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("YES");
      if (v5)
        v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "performAdditionalStorageRequiredCheckWithMessageContext , backup exists: %@", buf, 0xCu);
    }

  }
  if ((v5 & 1) != 0)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D142BCF4;
    v10[3] = &unk_1E9227FA8;
    v11 = v3;
    objc_msgSend(v9, "isFirstSyncWithActivity:completion:", 0, v10);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v3 + 2))(v3, 0, 0, 0);
  }

}

- (void)checkiCloudQuota:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, unint64_t, void *);
  void *v13;
  IMDCKUtilities *v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Check if there is enough iCloud quota", buf, 2u);
    }

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C94E70]);
  v7 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v7, "setQualityOfService:", 17);
  objc_msgSend(v7, "setAllowsCellularAccess:", 1);
  objc_msgSend(v6, "setConfiguration:", v7);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = sub_1D142C0A4;
  v13 = &unk_1E9227FF8;
  v14 = self;
  v15 = v4;
  v8 = v4;
  objc_msgSend(v6, "setFetchUserQuotaCompletionBlock:", &v10);
  -[IMDCKUtilities _truthDatabase](self, "_truthDatabase", v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v6);

}

- (BOOL)_isInExitState
{
  return IMGetCachedDomainBoolForKey();
}

- (BOOL)_mocFeatureEnabled
{
  void *v2;
  char v3;

  -[IMDCKUtilities syncState](self, "syncState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureEnabled");

  return v3;
}

- (BOOL)_shouldiCloudSwitchBeEnabled
{
  BOOL v3;
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[IMDCKUtilities iCloudAccountMatchesiMessageAccount](self, "iCloudAccountMatchesiMessageAccount"))
  {
    IMSetDomainBoolForKey();
    -[IMDCKUtilities syncState](self, "syncState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFeatureEnabled:", 0);

    -[IMDCKUtilities backupController](self, "backupController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setICloudBackupsDisabled:", 0);

    LOBYTE(v5) = 0;
    if (!IMOSLoggingEnabled(v12))
      return (char)v5;
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE as iCloud and iMessage accounts do not match up", (uint8_t *)&v17, 2u);
    }
    goto LABEL_15;
  }
  v3 = -[IMDCKUtilities _serverAllowsSync](self, "_serverAllowsSync");
  v4 = -[IMDCKUtilities _mocFeatureEnabled](self, "_mocFeatureEnabled");
  if (!v3)
  {
    if (!IMOSLoggingEnabled(v4))
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE because server does not allow sync", (uint8_t *)&v17, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  v5 = (void *)v4;
  v6 = -[IMDCKUtilities _isInExitState](self, "_isInExitState");
  v7 = v6;
  v8 = IMOSLoggingEnabled(v6);
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE because we are in exit state. Is moc feature enabled %@", (uint8_t *)&v17, 0xCu);

      }
    }
    goto LABEL_16;
  }
  if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We are not in exit state, _shouldiCloudSwitchBeEnabled is based on whether feature is enabled or not: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  return (char)v5;
}

- (BOOL)cloudKitSyncDownloadAssetsOnly
{
  void *v2;
  char v3;

  -[IMDCKUtilities syncState](self, "syncState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureEnabled") ^ 1;

  return v3;
}

- (void)setCloudKitSyncingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Setting cloudkit enabled: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[IMDCKUtilities syncState](self, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFeatureEnabled:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.IMDaemonCore.IMDCKUtilities.MiCEnabledStateReturned"), 0);

  if (v3)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Starting initial sync", (uint8_t *)&v15, 2u);
      }

    }
    -[IMDCKUtilities _resetKeepMessagesSettingandBroadcastToAllDevices](self, "_resetKeepMessagesSettingandBroadcastToAllDevices");
    +[IMDCKSyncController sharedInstance](IMDCKSyncController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginInitialSyncWithActivity:", 0);

    v12 = IMSetDomainValueForKey();
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Attachment watermark reset to 0", (uint8_t *)&v15, 2u);
      }

    }
  }
  else
  {
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markAllAttachmentsAsNotPurgeable");

  }
  -[IMDCKUtilities evalToggleiCloudSettingsSwitch](self, "evalToggleiCloudSettingsSwitch");
}

- (BOOL)serverAllowsMetricSubmission
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-submit-metrics-min-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v3 = (void *)objc_msgSend(v3, "unsignedIntegerValue");
    v5 = (unint64_t)v3;
  }
  else
  {
    v5 = 3;
  }
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      if (v5 < 3)
        v9 = CFSTR("YES");
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = &unk_1E9270F48;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "server allows submitting metrics result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v11, 0x20u);

    }
  }

  return v5 < 3;
}

- (BOOL)serverAllowsAnalyticSubmission
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-submit-analytics-min-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("NO");
      if (v4 < 3)
        v8 = CFSTR("YES");
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = &unk_1E9270F48;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "server allows submitting analytics result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);

    }
  }

  return v4 < 3;
}

- (BOOL)serverAllowsAnalyticDetailsSubmission
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-submit-analytics-details-min-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("NO");
      if (v4 < 3)
        v8 = CFSTR("YES");
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = &unk_1E9270F48;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "server allows submitting analytics details result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);

    }
  }

  return v4 < 3;
}

- (id)_getKeepMessagesValue
{
  return (id)IMGetCachedDomainValueForKey();
}

- (BOOL)_shouldDisplayPopUpForResettingKeepMessages
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMDCKUtilities _getKeepMessagesValue](self, "_getKeepMessagesValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");
  v4 = v3;
  if (v3 && IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Keep Messages value should be altered from %@ to 0", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 != 0;
}

- (void)_resetKeepMessagesSettingandBroadcastToAllDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v3 = (void *)objc_msgSend(v3, "integerValue");
    v5 = (uint64_t)v3 + 1;
  }
  else
  {
    v5 = 1;
  }
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Resetting Keep Message setting to Keep forever.  VersionID: %ld", (uint8_t *)&v11, 0xCu);
    }

  }
  if (-[IMDCKUtilities _shouldDisplayPopUpForResettingKeepMessages](self, "_shouldDisplayPopUpForResettingKeepMessages"))
  {
    IMSetDomainValueForKey();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0D39050], 0, 0, 1u);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v10, (CFNotificationName)*MEMORY[0x1E0D39080], 0, 0, 1u);
  notify_post((const char *)*MEMORY[0x1E0D39070]);

}

- (BOOL)_serverAllowsCacheDelete
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDCKUtilities serverBag](self, "serverBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-cache-delete-version-V3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v4 >= 2)
        v6 = CFSTR("NO");
      else
        v6 = CFSTR("YES");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "server allows cached delete check result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);

    }
  }

  return v4 < 2;
}

- (BOOL)enableAttachmentMetricCollection
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4
    && (-[IMDCKUtilities serverBag](self, "serverBag"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", CFSTR("ck-enable-attachment-validation")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v5 = IMOSLoggingEnabled(v5);
    if ((_DWORD)v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "enableAttachmentMetricCollection overridden by iMessage server", (uint8_t *)&v13, 2u);
      }

    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Should enable attachment metric-ing %@", (uint8_t *)&v13, 0xCu);
    }

  }
  return v9;
}

- (BOOL)cacheDeleteEnabled
{
  _BOOL4 v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMDCKUtilities _allowDestructiveMOCFeaturesBasedOnDSID](self, "_allowDestructiveMOCFeaturesBasedOnDSID"))
    v3 = -[IMDCKUtilities _serverAllowsCacheDelete](self, "_serverAllowsCacheDelete");
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if ((v5 | v3) == 1)
  {
    v6 = -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled");
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v7)
        v9 = CFSTR("YES");
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "CacheDeleteEnabled %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v7;
}

- (BOOL)_serverAllowsRemovalFromBackUp
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMDCKUtilities serverBag](self, "serverBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-remove-from-backup-version-V3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "server allows removal from backup result %@ serverVersion %@", (uint8_t *)&v10, 0x16u);

    }
  }

  return v4 != 0;
}

- (BOOL)removeFromBackUpAllowed
{
  _BOOL4 v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDCKUtilities _allowDestructiveMOCFeaturesBasedOnDSID](self, "_allowDestructiveMOCFeaturesBasedOnDSID")
    && -[IMDCKUtilities _serverAllowsRemovalFromBackUp](self, "_serverAllowsRemovalFromBackUp")
    && -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled");
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5)
  {
    v6 = IMOSLoggingEnabled(v6);
    if ((_DWORD)v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This is an internal install so overriding server bag check and defaulting to yes", (uint8_t *)&v11, 2u);
      }

    }
    v3 = 1;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Removal from back up allowed %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v3;
}

- (id)internalQueue
{
  if (qword_1ED936108 != -1)
    dispatch_once(&qword_1ED936108, &unk_1E9228030);
  return (id)qword_1ED936100;
}

- (BOOL)accountIsVerifiedForMOCAndSafeForCacheDelete
{
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  const __CFString *v12;
  BOOL v13;
  _QWORD block[5];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  if (IMOSLoggingEnabled(objc_msgSend(v4, "startTimingForKey:", CFSTR("accountIsVerifiedForMOCAndSafeForCacheDelete"))))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Checking if account is verified", buf, 2u);
    }

  }
  -[IMDCKUtilities internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D142DAA4;
  block[3] = &unk_1E9228080;
  block[4] = self;
  v17 = &v18;
  v7 = v3;
  v16 = v7;
  dispatch_async(v6, block);

  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "About to wait for accountIsVerifiedForMOCAndSafeForCacheDelete call", buf, 2u);
    }

  }
  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v10);
  if (IMOSLoggingEnabled(objc_msgSend(v4, "stopTimingForKey:", CFSTR("accountIsVerifiedForMOCAndSafeForCacheDelete"))))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (*((_BYTE *)v19 + 24))
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v23 = v4;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Finished blocking accountIsVerifiedForMOCAndSafeForCacheDelete with time: %@ and accountValidForCD %@", buf, 0x16u);
    }

  }
  if (*((_BYTE *)v19 + 24))
    v13 = -[IMDCKUtilities cacheDeleteEnabled](self, "cacheDeleteEnabled");
  else
    v13 = 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)_authenticationController
{
  if (qword_1ED935F10 != -1)
    dispatch_once(&qword_1ED935F10, &unk_1E92280A0);
  return (id)qword_1ED935F08;
}

- (BOOL)_checkEligibilityWithAccountInfo:(id)a3
{
  return MEMORY[0x1E0DE7D20](a3, sel_supportsDeviceToDeviceEncryption);
}

- (id)_createAccountError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDCKUtilitiesErrorDomain"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
  -[IMDCKUtilities fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:](self, "fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:", 0);
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibilityIfNeededOnImagentLaunch
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Fetching security level and updating mic switch eligible on imagent launch", v5, 2u);
      }

    }
    -[IMDCKUtilities fetchAccountStatusAndUpdateMiCSwitchEligibility](self, "fetchAccountStatusAndUpdateMiCSwitchEligibility");
  }
}

- (BOOL)_checkIfEnabledByServerBagOrDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  BOOL v16;
  int v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKUtilities serverBag](self, "serverBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v8)
        v10 = CFSTR("YES");
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Server allowing %@: %@", (uint8_t *)&v18, 0x16u);
    }

  }
  v11 = IMGetCachedDomainBoolForKey();
  v12 = v11;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      if (v12)
        v14 = CFSTR("YES");
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Defaults over allowing %@: %@", (uint8_t *)&v18, 0x16u);
    }

  }
  -[IMDCKUtilities lockdownManager](self, "lockdownManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isInternalInstall"))
  {

    goto LABEL_20;
  }

  if (((v8 | v12) & 1) == 0)
  {
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)shouldPresentTTROnCloudKitError
{
  return (IMIsRunningInAutomation() & 1) == 0
      && -[IMDCKUtilities _checkIfEnabledByServerBagOrDefault:](self, "_checkIfEnabledByServerBagOrDefault:", CFSTR("should-ttr-on-icloud-kit-error"));
}

- (BOOL)shouldLogDumpOnCloudKitError
{
  return -[IMDCKUtilities _isLogDumpAllowed](self, "_isLogDumpAllowed")
      && (IMIsRunningInAutomation() & 1) == 0
      && -[IMDCKUtilities _checkIfEnabledByServerBagOrDefault:](self, "_checkIfEnabledByServerBagOrDefault:", CFSTR("should-dump-logs-on-icloud-kit-error"));
}

- (BOOL)shouldCollectDailyLogDump
{
  return (IMIsRunningInAutomation() & 1) == 0
      && -[IMDCKUtilities _checkIfEnabledByServerBagOrDefault:](self, "_checkIfEnabledByServerBagOrDefault:", CFSTR("should-dump-logs-daily-if-havent-synced"));
}

- (BOOL)shouldCollectDailyLogDumpForRestoreFailures
{
  if ((IMIsRunningInAutomation() & 1) != 0)
    return 0;
  else
    return !-[IMDCKUtilities _checkIfEnabledByServerBagOrDefault:](self, "_checkIfEnabledByServerBagOrDefault:", CFSTR("disable-dumping-logs-daily-for_restore_failures"));
}

- (id)logCollectorAddress
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[IMDCKUtilities serverBag](self, "serverBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("log-collector-handle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("msgs_on_icloud_logs@icloud.com");

  return v4;
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[IMDCKUtilities logCollectorAddress](self, "logCollectorAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKUtilities reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:](self, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:", v6, v4, 0, v7);

}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[IMDCKUtilities logCollectorAddress](self, "logCollectorAddress");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKUtilities reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:](self, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:", v8, v6, v5, v9);

}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6
{
  -[IMDCKUtilities reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:](self, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:", a3, a4, a5, a6, 0);
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6 reasonString:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  __CFString *v12;
  id v13;
  __CFString *v14;
  _BOOL8 v15;
  NSObject *v16;
  _BOOL8 v17;
  _BOOL4 v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;

  v9 = a5;
  v10 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a3;
  v13 = a6;
  v14 = (__CFString *)a7;
  v15 = -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled");
  if (v15)
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v12;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "A cloudkit error(%@) occured checking if we should try to report the error", (uint8_t *)&v22, 0xCu);
      }

    }
    v17 = -[IMDCKUtilities shouldLogDumpOnCloudKitError](self, "shouldLogDumpOnCloudKitError");
    v18 = v17;
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = CFSTR("NO");
        if (v18)
          v20 = CFSTR("YES");
        v22 = 138412290;
        v23 = v20;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Should log dump on cloudkit error? %@", (uint8_t *)&v22, 0xCu);
      }

    }
    if (-[__CFString length](v14, "length"))
    {
      if (v18)
        goto LABEL_14;
    }
    else
    {

      v14 = CFSTR("TriggeredByCKError");
      if (v18)
      {
LABEL_14:
        -[IMDCKUtilities logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:](self, "logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:", v13, 6, v14, v9, 0, 0);
        if (!-[IMDCKUtilities shouldPresentTTROnCloudKitError](self, "shouldPresentTTROnCloudKitError"))
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    if (-[IMDCKUtilities shouldPresentTTROnCloudKitError](self, "shouldPresentTTROnCloudKitError"))
    {
LABEL_18:
      -[IMDCKUtilities _askToTapToRadarWithString:internalOnly:](self, "_askToTapToRadarWithString:internalOnly:", v12, v10);
LABEL_19:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainValueForKey();

    }
  }

}

- (void)_askToTapToRadarWithString:(id)a3 internalOnly:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (qword_1EFC63BE0 != -1)
    dispatch_once(&qword_1EFC63BE0, &unk_1E9228158);
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0D36B00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", v7, CFSTR("Messages on iCloud Debug UI"), v5, CFSTR("File a radar"), CFSTR("Dismiss"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "We present a CK UI", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trackEvent:", *MEMORY[0x1E0D38798]);

    objc_msgSend(v8, "setUsesNotificationCenter:", 0);
    objc_msgSend(v8, "setRepresentedApplicationBundle:", *MEMORY[0x1E0D36C08]);
    objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D142ED58;
    v13[3] = &unk_1E9228180;
    v14 = v5;
    objc_msgSend(v12, "addUserNotification:listener:completionHandler:", v8, 0, v13);

  }
}

- (id)recordNameForMessageWithGUID:(id)a3 usingSalt:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  if (v7 && (v7 = objc_msgSend(v5, "length")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "IMDCKUtilities recordNameForMessageWithGUID invalid parameters [key length] %@ guid %@", buf, 0x16u);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (id)syncFailureMetricString:(id)a3 isRecoverable:(BOOL)a4 error:(id)a5
{
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3940];
  if (a4)
    v7 = CFSTR("RecoverableError");
  else
    v7 = CFSTR("NonRecoverableError");
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v8, "code");

  objc_msgSend(v11, "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v9, v7, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)extractServerRecordFromCKServerErrorRecordChanged:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (v4 == 14)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0C949B8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "******** IMDCKUtilities not a partial error %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (void)resetLastSyncDate
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
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting last sync date to nil", v5, 2u);
    }

  }
  -[IMDCKUtilities syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectFromAnalyticSyncDatesDictionaryForKey:", *MEMORY[0x1E0D37930]);

  -[IMDCKUtilities reportMOCDebuggingErrorWithString:internalOnly:initialSync:](self, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:", CFSTR("Last sync date was reset to nil"), 0, 0);
}

- (void)repairACAccountEnablementStatusIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    IMGetDomainBoolForKey();
    v7 = IMGetCachedDomainIntForKeyWithDefaultValue();
    if (v7 < 1)
    {
      v9 = -[IMDCKUtilities _shouldiCloudSwitchBeEnabled](self, "_shouldiCloudSwitchBeEnabled");
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = CFSTR("NO");
          if (v9)
            v11 = CFSTR("YES");
          v12 = 138412290;
          v13 = v11;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Needs to repair ACAccount enablement; force switching ACAccount switch to %@.",
            (uint8_t *)&v12,
            0xCu);
        }

      }
      -[IMDCKUtilities _setiCloudSettingsSwitchEnabled:](self, "_setiCloudSettingsSwitchEnabled:", v9);
      IMSetDomainIntForKey();
    }
    else if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "No need to try to repair ACAccount dataclass enablement status.", (uint8_t *)&v12, 2u);
      }

    }
  }

}

- (void)evalToggleiCloudSettingsSwitch
{
  -[IMDCKUtilities _setiCloudSettingsSwitchEnabled:](self, "_setiCloudSettingsSwitchEnabled:", -[IMDCKUtilities _shouldiCloudSwitchBeEnabled](self, "_shouldiCloudSwitchBeEnabled"));
}

- (void)_setiCloudSettingsSwitchEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = IMIsRunningInUnitTesting();
  if ((v5 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = CFSTR("NO");
        if (v3)
          v7 = CFSTR("YES");
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Trying to set iCloud Settings Switch to enabled={%@}", (uint8_t *)&v11, 0xCu);
      }

    }
    -[IMDCKUtilities _accountStore](self, "_accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aa_primaryAppleAccountWithPreloadedDataclasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setEnabled:forDataclass:", v3, *MEMORY[0x1E0C8F3E0]);
      objc_msgSend(v8, "saveVerifiedAccount:withCompletionHandler:", v10, &unk_1E92281E0);
    }

  }
}

- (void)_fetchPrimaryAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMDCKUtilities _accountStore](self, "_accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D142F888;
  v7[3] = &unk_1E9228208;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "aa_primaryAppleAccountWithCompletion:", v7);

}

- (void)fetchiCloudAccountPersonID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D142FA30;
  v6[3] = &unk_1E9228230;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMDCKUtilities _fetchPrimaryAccountWithCompletion:](self, "_fetchPrimaryAccountWithCompletion:", v6);

}

- (id)_personIdFromAccount:(id)a3
{
  return (id)objc_msgSend(a3, "aa_personID");
}

- (void)primaryAccountHasiCloudBackupEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D142FC80;
  v6[3] = &unk_1E9228208;
  v7 = v4;
  v5 = v4;
  -[IMDCKUtilities _fetchPrimaryAccountWithCompletion:](self, "_fetchPrimaryAccountWithCompletion:", v6);

}

- (BOOL)isDeviceCharging
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D397F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceCharging");

  return v3;
}

- (BOOL)isDeviceOnWifi
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D397F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceOnWifi");

  return v3;
}

- (id)deviceConditions
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = -[IMDCKUtilities isDeviceCharging](self, "isDeviceCharging");
  v4 = -[IMDCKUtilities isDeviceOnWifi](self, "isDeviceOnWifi");
  -[IMDCKUtilities syncState](self, "syncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastSyncDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKUtilities syncState](self, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAnalyticSyncDatesObjectForKey:", *MEMORY[0x1E0D37930]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("NO");
  if (v4)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (v3)
    v11 = v10;
  else
    v11 = CFSTR("NO");
  if (v3)
    v9 = CFSTR("YES");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isOnWifiAndPower %@, Is charging %@ , isOnWifi %@ , lastSyncDate %@ lastCompleteSyncedDBDate %@"), v11, v9, v10, v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)deviceConditionsAllowPeriodicSync
{
  _BOOL4 v3;
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDCKUtilities isDeviceCharging](self, "isDeviceCharging");
  v4 = -[IMDCKUtilities isDeviceOnWifi](self, "isDeviceOnWifi");
  v5 = v4;
  v6 = v3 && v4;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v6)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      if (v5)
        v8 = CFSTR("YES");
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "isOnWifiAndPower %@, Is charging %@ , isOnWifi %@ ", (uint8_t *)&v12, 0x20u);
    }

  }
  return v6;
}

- (id)newfilteredArrayRemovingCKRecordDupes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412290;
    v17 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "recordID", v17, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && (v14 = objc_msgSend(v4, "containsObject:", v13), (v14 & 1) == 0))
        {
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(v4, "addObject:", v13);
        }
        else if (IMOSLoggingEnabled(v14))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found duplicate record while syncing or record does not have a record name. Dropping record: %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)newfilteredArrayRemovingCKRecordIDDupes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138412290;
    v16 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "recordName", v16, (_QWORD)v17);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12 && (v12 = objc_msgSend(v4, "containsObject:", v12), (v12 & 1) == 0))
        {
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(v4, "addObject:", v13);
        }
        else if (IMOSLoggingEnabled(v12))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Found duplicate recordID while syncing or recordID does not have a record name. Dropping record: %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)lastDeviceBackUpDate
{
  void *v2;
  void *v3;

  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfLastBackUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceActiveString
{
  if (-[IMDCKUtilities _deviceActive](self, "_deviceActive"))
    return CFSTR("active");
  else
    return CFSTR("inActive");
}

- (BOOL)_deviceActive
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 > 86400.0;

  }
  else
  {
    v6 = 1;
  }
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("YES");
      if (v6)
        v8 = CFSTR("NO");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Active state %@ last activity date %@", (uint8_t *)&v10, 0x16u);
    }

  }
  return !v6;
}

- (void)_showCKLogNotificationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D36B00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", v5, CFSTR("Messages on iCloud Debug UI"), CFSTR("Messages will automatically send Apple a sysdiagnose when Messages detects an issue with Messages on iCloud.  You will be notified if a radar is created, otherwise the data will be automatically deleted after seven days.  You may turn this off in Internal Settings > Messages"), CFSTR("Just send"), CFSTR("Notify me each time"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D1430890;
    v8[3] = &unk_1E9228278;
    v9 = v3;
    objc_msgSend(v7, "addUserNotification:listener:completionHandler:", v6, 0, v8);

  }
}

- (BOOL)shouldKickOffWriteForSyncType:(int64_t)a3
{
  return a3 != 0;
}

- (BOOL)isLocalCachedSaltPresent
{
  void *v2;
  void *v3;
  BOOL v4;

  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (BOOL)shouldReportToRTC
{
  return MEMORY[0x1E0DE7D20](self, sel_readServerBagBoolForKey_defaultValue_);
}

- (BOOL)shouldReportToAnalytics
{
  return MEMORY[0x1E0DE7D20](self, sel_readServerBagBoolForKey_defaultValue_);
}

- (BOOL)readServerBagBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t isKindOfClass;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  LODWORD(v4) = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDCKUtilities serverBag](self, "serverBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0))
  {
    v4 = objc_msgSend(v8, "BOOLValue");
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if ((_DWORD)v4)
          v11 = CFSTR("YES");
        v14 = 138412546;
        v15 = v11;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Read server bag BOOL: [%@] for key: [%@]", (uint8_t *)&v14, 0x16u);
      }
LABEL_14:

    }
  }
  else if (IMOSLoggingEnabled(isKindOfClass))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      if ((_DWORD)v4)
        v12 = CFSTR("YES");
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Server bag BOOL default: [%@] for key: [%@]", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_14;
  }

  return v4;
}

- (void)postSyncStateToCloudKit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[IMDCKUtilities shouldReportToRTC](self, "shouldReportToRTC"))
  {
    -[IMDCKUtilities syncState](self, "syncState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncReportDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKUtilities postSyncStateToRTC:category:reportDictionary:](self, "postSyncStateToRTC:category:reportDictionary:", v9, 2, v5);

  }
  if (-[IMDCKUtilities shouldReportToAnalytics](self, "shouldReportToAnalytics")
    && -[IMDCKUtilities serverAllowsAnalyticDetailsSubmission](self, "serverAllowsAnalyticDetailsSubmission"))
  {
    -[IMDCKUtilities exitManager](self, "exitManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKUtilities syncState](self, "syncState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncReportDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", v9, v8);

  }
}

- (void)postSyncStateToRTC:(id)a3 category:(int64_t)a4 reportDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("groupName");
  v14[1] = CFSTR("deviceState");
  v15[0] = a3;
  v8 = a5;
  v9 = a3;
  -[IMDCKUtilities deviceActiveString](self, "deviceActiveString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v12, "addEntriesFromDictionary:", v8);

  -[IMDCKUtilities telemetryReporter](self, "telemetryReporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postMessage:category:", v12, a4);

}

- (void)reportZoneCreation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoneCreateDate-%@"), a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKUtilities syncState](self, "syncState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v5, v6, 0);

}

- (void)reportErrorForSyncType:(int64_t)a3 syncStep:(id)a4 response:(int64_t)a5 error:(id)a6
{
  id v7;
  id v8;

  if (a6)
  {
    v7 = a6;
    -[IMDCKUtilities syncState](self, "syncState");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSyncError:", v7);

  }
}

- (id)finalSyncStateFor:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return *off_1E92285A0[a3];
}

- (void)reportCompletionForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 onAttempt:(unint64_t)a5 wasSuccessful:(BOOL)a6 duration:(double)a7
{
  _BOOL8 v8;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a6;
  -[IMDCKUtilities syncState](self, "syncState", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "syncReportDictionaryForAttempt:withSuccess:duration:", a5, v8, a7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[IMDCKUtilities finalSyncStateFor:](self, "finalSyncStateFor:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDCKUtilities shouldReportToRTC](self, "shouldReportToRTC"))
    -[IMDCKUtilities postSyncStateToRTC:category:reportDictionary:](self, "postSyncStateToRTC:category:reportDictionary:", v13, 3, v16);
  if (-[IMDCKUtilities shouldReportToAnalytics](self, "shouldReportToAnalytics")
    && -[IMDCKUtilities serverAllowsAnalyticSubmission](self, "serverAllowsAnalyticSubmission"))
  {
    -[IMDCKUtilities exitManager](self, "exitManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", v13, v16);

  }
  -[IMDCKUtilities syncState](self, "syncState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clearSyncErrors");

}

- (BOOL)isCKPartialError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    v5 = objc_msgSend(v3, "code") == 2;
  else
    v5 = 0;

  return v5;
}

- (id)findRootCauses:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!-[IMDCKUtilities isCKPartialError:](self, "isCKPartialError:", v4))
    goto LABEL_18;
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v18 = v7;
  v19 = v4;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v21;
  v12 = *MEMORY[0x1E0C947D8];
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13), v18, v19, (_QWORD)v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqualToString:", v12))
        {

LABEL_13:
          objc_msgSend(v5, "addObject:", v14);
          goto LABEL_14;
        }
        v16 = objc_msgSend(v14, "code");

        if (v16 != 22)
          goto LABEL_13;
      }
LABEL_14:

      ++v13;
    }
    while (v10 != v13);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v10);
LABEL_16:

  v7 = v18;
  v4 = v19;
LABEL_17:

LABEL_18:
  if (!objc_msgSend(v5, "count", v18, v19))
    objc_msgSend(v5, "addObject:", v4);

  return v5;
}

- (id)simplifiedError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "localizedDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *MEMORY[0x1E0CB2D50];
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = 0;
      goto LABEL_5;
    }
  }
  v13 = v6;
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v3, "code"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5
{
  -[IMDCKUtilities logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:](self, "logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:", a3, *(_QWORD *)&a4, a5, 0, 0, 0);
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 requirePreviousPrompt:(BOOL)a6 willSendBlock:(id)a7
{
  -[IMDCKUtilities logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:](self, "logDumpAndSendMessageTo:forHours:reason:isInitialSync:requirePreviousPrompt:willSendBlock:", a3, *(_QWORD *)&a4, a5, 0, a6, a7);
}

- (void)logToPowerLogForLogDumpGUID:(id)a3 logDumpCompleted:(BOOL)a4 logDumpSucceeded:(BOOL)a5 logDumpSendingCompleted:(BOOL)a6 logDumpSendingSucceeded:(BOOL)a7 reason:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a8;
  if (qword_1EFC63BF8 != -1)
    dispatch_once(&qword_1EFC63BF8, &unk_1E9228298);
  v15 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v14, CFSTR("LogDumpReason"), v16, CFSTR("LogDumpingCompleted"), v17, CFSTR("LogDumpingSucceeded"), v18, CFSTR("LogDumpSendingCompleted"), v19, CFSTR("LogDumpSendingSucceeded"), v13, CFSTR("LogDumpGUID"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Logging logDump (guid: %@) info to power log: %@", buf, 0x16u);
    }

  }
  if (off_1EFC63BF0)
    off_1EFC63BF0(7, CFSTR("IMLogDump"), v20, 0);

}

- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didStartSync:(BOOL)a5 didFinishSync:(BOOL)a6 didSucceedSyncing:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EFC63C08 != -1)
    dispatch_once(&qword_1EFC63C08, &unk_1E92282B8);
  v12 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, CFSTR("SyncType"), v14, CFSTR("IsCoreDuetSync"), v15, CFSTR("DidStartSync"), v16, CFSTR("DidFinishSync"), v17, CFSTR("DidSucceedSyncing"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Logging sync info to power log: %@", buf, 0xCu);
    }

  }
  if (off_1EFC63C00)
    off_1EFC63C00(7, CFSTR("IMCloudKitSync"), v18, 0);

}

- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didCompleteChatSync:(BOOL)a5 didSucceedSyncingChats:(BOOL)a6 didCompleteMessageSync:(BOOL)a7 didSucceedSyncingMessages:(BOOL)a8 didCompleteAttachmentSync:(BOOL)a9 didSucceedSyncingAttachments:(BOOL)a10 didCompleteRecoverableMessageSync:(BOOL)a11 didSucceedSyncingRecoverableMessageSync:(BOOL)a12 syncAttemptCount:(unint64_t)a13
{
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
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
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  if (qword_1EFC63C18 != -1)
    dispatch_once(&qword_1EFC63C18, &unk_1E92282D8);
  v31 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v33, CFSTR("SyncType"), v32, CFSTR("IsCoreDuetSync"), v19, CFSTR("DidCompleteChatSync"), v20, CFSTR("DidSucceedSyncingChats"), v21, CFSTR("DidCompleteMessageSync"), v22, CFSTR("DidSucceedSyncingMessages"), v23, CFSTR("DidCompleteAttachmentSync"), v24, CFSTR("DidSucceedSyncingAttachments"), v25,
    CFSTR("DidCompleteRecoverableMessageSync"),
    v26,
    CFSTR("DidSucceedSyncingRecoverableMessageSync"),
    v27,
    CFSTR("SyncAttemptCount"),
    0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v29))
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v28;
      _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Logging sync attempt info to power log: %@", buf, 0xCu);
    }

  }
  if (off_1EFC63C10)
    off_1EFC63C10(7, CFSTR("IMCloudKitSync"), v28, 0);

}

- (BOOL)_isLogDumpAllowed
{
  return 0;
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 isInitialSync:(BOOL)a6 requirePreviousPrompt:(BOOL)a7 willSendBlock:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v12;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  NSObject *v31;
  IMDCKUtilities *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  int v36;
  BOOL v37;
  uint8_t buf[4];
  NSObject *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v9 = a7;
  v10 = a6;
  v12 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a8;
  v17 = -[IMDCKUtilities _isLogDumpAllowed](self, "_isLogDumpAllowed");
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v18 = objc_claimAutoreleasedReturnValue();
    -[IMDCKUtilities lockdownManager](self, "lockdownManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isInternalInstall");

    if (v20)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = CFSTR("NO");
          *(_DWORD *)buf = 138413314;
          v39 = v14;
          if (v10)
            v25 = CFSTR("YES");
          v40 = 2112;
          v41 = v23;
          v42 = 2112;
          v43 = v15;
          v44 = 2112;
          v45 = v25;
          v46 = 2112;
          v47 = v18;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "logDumpAndSendMessageTo called for recipient %@, hrs %@, reason %@, initialSync %@ logDumpGuid %@", buf, 0x34u);

        }
      }
      v26 = IMGetDomainIntForKey();
      if (v26 == 3)
      {
        if (IMOSLoggingEnabled(3))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v18;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "User has opted out of auto log collection. Not dumping logs for logDumpGuid %@", buf, 0xCu);
          }
LABEL_27:

          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v9 && !v26)
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v18;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "User has never seen a prompt and this collection requires a previous prompt. Not dumping logs for logDumpGuid %@", buf, 0xCu);
          }
          goto LABEL_27;
        }
LABEL_17:

        goto LABEL_31;
      }
      -[IMDCKUtilities _truthContainer](self, "_truthContainer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_1D1432110;
      v30[3] = &unk_1E92283A0;
      v31 = v18;
      v32 = self;
      v33 = v15;
      v37 = v10;
      v36 = v12;
      v35 = v16;
      v34 = v14;
      objc_msgSend(v29, "fetchCurrentDeviceIDWithCompletionHandler:", v30);

    }
    else if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Not log dumping since not on internal device", buf, 2u);
      }

    }
    goto LABEL_31;
  }
  if (IMOSLoggingEnabled(v17))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v15;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "logDumpAndSendMessage not allowed with error: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_31:

}

- (BOOL)logDumpIsExpected
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDCKUtilities _isLogDumpAllowed](self, "_isLogDumpAllowed");
  v4 = -[IMDCKUtilities deviceConditionsAllowPeriodicSync](self, "deviceConditionsAllowPeriodicSync");
  v5 = -[IMDCKUtilities _isRunningInAutomation](self, "_isRunningInAutomation");
  v6 = v5;
  v7 = v3 && v4 && !v5;
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v7)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (v3)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v14 = 138413058;
      v15 = v10;
      if (v4)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      if (v6)
        v9 = CFSTR("YES");
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Returning %@ for logDumpIsExpcted - _isLogDumpAllowed: %@, _isOnPowerAndWifi: %@, _isRunningInAutomation: %@", (uint8_t *)&v14, 0x2Au);
    }

  }
  return v7;
}

- (BOOL)logDumpIsNecessaryAfterSync
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  NSObject *v33;
  BOOL v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _BOOL4 v50;
  unint64_t v51;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  BOOL v60;
  NSObject *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint8_t buf[4];
  const __CFString *v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  const __CFString *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v3, "isInternalInstall");

  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMDCKUtilities logDumpIsExpected](self, "logDumpIsExpected");
  if (!v5)
  {
LABEL_9:
    v34 = 0;
    goto LABEL_62;
  }
  if (!v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "For some reason we do not have the sync counts prior to syncing", buf, 2u);
      }

    }
    goto LABEL_9;
  }
  -[IMDCKUtilities ckStatisticCalculations](self, "ckStatisticCalculations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D37D30];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v9, "unsignedIntegerValue");

  v10 = *MEMORY[0x1E0D37D28];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D28]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v11, "unsignedIntegerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v12, "unsignedIntegerValue");

  v13 = *MEMORY[0x1E0D37D20];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D20]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v14, "unsignedIntegerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v16, "unsignedIntegerValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D48]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v18, "unsignedIntegerValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37D40]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v21, "unsignedIntegerValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  -[IMDCKUtilities syncState](self, "syncState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "getAnalyticSyncDatesObjectForKey:", *MEMORY[0x1E0D37A30]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v25 == 0;

  -[IMDCKUtilities syncState](self, "syncState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v22)
  {
    objc_msgSend(v26, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v27, *MEMORY[0x1E0D37AC8], 1);

    -[IMDCKUtilities syncState](self, "syncState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v36, *MEMORY[0x1E0D37918], 1);

    -[IMDCKUtilities syncState](self, "syncState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (_QWORD *)MEMORY[0x1E0D37908];
  }
  else
  {
    objc_msgSend(v26, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v27, *MEMORY[0x1E0D37AD0], 1);

    -[IMDCKUtilities syncState](self, "syncState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v29, *MEMORY[0x1E0D37920], 1);

    -[IMDCKUtilities syncState](self, "syncState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (_QWORD *)MEMORY[0x1E0D37910];
  }
  objc_msgSend(v30, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v31, *v32, 1);

  if (v73 == v71 && v68 == v20 && v66 == v23)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v38))
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v38;
        _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "All items have been synced, noting down last complete synced DB date %@", buf, 0xCu);
      }

    }
    -[IMDCKUtilities syncState](self, "syncState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v38, *MEMORY[0x1E0D37930], 1);

  }
  else
  {
    v41 = IMOSLoggingEnabled(v37);
    if ((_DWORD)v41)
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v68 - v20);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73 - v71);
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66 - v23);
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v78 = v43;
        v79 = 2112;
        v80 = v44;
        v81 = 2112;
        v82 = v45;
        _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Could not log db sync date because not all items synced: chatsLeftToSync %@ | messagesLeftToSync %@ | attachmentsLeftToSync %@", buf, 0x20u);

      }
    }
  }
  v46 = v75 - v74;
  v47 = v69 - v67;
  if (v75 == v74)
    v48 = v75 - v74;
  else
    v48 = v74 - v75;
  v50 = v46 > 0 || v48 < 0x15;
  if (v69 == v67)
    v51 = v69 - v67;
  else
    v51 = v67 - v69;
  v53 = v47 > 0 || v51 < 0x15;
  v54 = IMOSLoggingEnabled(v41);
  v55 = v72 - v70;
  if ((_DWORD)v54)
  {
    OSLogHandleForIMFoundationCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v55);
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v78 = v57;
      v79 = 2112;
      v80 = v58;
      v81 = 2112;
      v82 = v59;
      _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "<StartSyncStats> syncedChatDifference %@ | syncedMessageDifference %@ | syncedAttachmentDifference %@ <EndSyncStats>", buf, 0x20u);

    }
  }
  v60 = v55 > 0 && v50 && v53;
  if (!v60 && IMOSLoggingEnabled(v54))
  {
    OSLogHandleForIMFoundationCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = CFSTR("NO");
      if (v50)
        v63 = CFSTR("YES");
      else
        v63 = CFSTR("NO");
      if (v55 <= 0)
        v64 = CFSTR("NO");
      else
        v64 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v78 = v63;
      v79 = 2112;
      v80 = v64;
      if (v53)
        v62 = CFSTR("YES");
      v81 = 2112;
      v82 = v62;
      _os_log_impl(&dword_1D1413000, v61, OS_LOG_TYPE_INFO, "Log dump needed -- didn't sync enough items | syncedMessages %@ | syncedChats %@ | syncedAttachments %@", buf, 0x20u);
    }

  }
  v34 = v76 & !v60;
LABEL_62:

  return v34;
}

- (BOOL)PCSKeyRollPending
{
  if (qword_1ED936478 != -1)
    dispatch_once(&qword_1ED936478, &unk_1E92283C0);
  if (off_1ED936470)
    return off_1ED936470(CFSTR("Messages3"));
  else
    return 0;
}

- (void)PCSKeyRollPendingAsync:(id)a3 timeout:(double)a4
{
  id v6;
  dispatch_time_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD block[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v6 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1433970;
  block[3] = &unk_1E92283E8;
  v17 = v18;
  v9 = v6;
  v16 = v9;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  -[IMDCKUtilities internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = sub_1D14339A4;
  v12[3] = &unk_1E9228438;
  v13 = v9;
  v14 = v18;
  v12[4] = self;
  v11 = v9;
  dispatch_async(v10, v12);

  _Block_object_dispose(v18, 8);
}

- (unsigned)PCSReportManateeStatus
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_1EFC63C28 != -1)
    dispatch_once(&qword_1EFC63C28, &unk_1E9228458);
  if (off_1EFC63C20)
    return off_1EFC63C20(CFSTR("Engram"));
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Failed to weak link ProtectedCloudStorage, this should not happen", v4, 2u);
    }

  }
  return 0;
}

- (void)PCSReportManateeStatusAsync:(id)a3 timeout:(double)a4
{
  id v6;
  dispatch_time_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD block[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v6 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1433DB4;
  block[3] = &unk_1E92283E8;
  v17 = v18;
  v9 = v6;
  v16 = v9;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  -[IMDCKUtilities internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = sub_1D1433DE8;
  v12[3] = &unk_1E9228438;
  v13 = v9;
  v14 = v18;
  v12[4] = self;
  v11 = v9;
  dispatch_async(v10, v12);

  _Block_object_dispose(v18, 8);
}

- (id)_accountManager
{
  if (qword_1ED935F40 != -1)
    dispatch_once(&qword_1ED935F40, &unk_1E92284A0);
  return (id)qword_1ED935F38;
}

- (id)dsid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1D17EA968](self, a2);
  -[IMDCKUtilities _accountStore](self, "_accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)_primaryAccountCountryCode
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[IMDCKUtilities _accountManager](self, "_accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAuthKitAccount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    -[IMDCKUtilities _accountManager](self, "_accountManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appleIDCountryCodeForAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)_allowDestructiveMOCFeaturesBasedOnDSID
{
  return 1;
}

- (BOOL)deviceIsPhoneOrWatch
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") != 4;

  return v3;
}

- (BOOL)shouldAttemptMiCOnByDefault
{
  void *v2;
  void *v3;

  -[IMDCKUtilities serverBag](self, "serverBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37958]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)iCloudAccountMatchesiMessageAccount
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  char v22;
  int v23;
  NSObject *v24;
  id v25;
  int v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  char v31;
  void *v33;
  void *v34;
  char v35;
  _BOOL4 v36;
  __CFString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  const __CFString *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDCKUtilities deviceIsPhoneOrWatch](self, "deviceIsPhoneOrWatch");
  v36 = v3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v36)
        v5 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v43 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "is phone or watch: [%@]", buf, 0xCu);
    }

  }
  -[IMDCKUtilities _primaryiCloudAccount](self, "_primaryiCloudAccount");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKUtilities dsid](self, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("D:%@"), v6);
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v37;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "iCloud DSID %@", buf, 0xCu);
    }

  }
  if (v34 && -[__CFString length](v37, "length"))
  {
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceWithName:", *MEMORY[0x1E0D38F68]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountsForService:", v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v39;
      v35 = v36;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "idsAccount");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "profileID");
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = objc_msgSend(v17, "accountType");
              if ((_DWORD)v19 == 1)
              {
                if (IMOSLoggingEnabled(v19))
                {
                  OSLogHandleForIMFoundationCategory();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v18;
                    _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "iMessage account DSID %@", buf, 0xCu);
                  }

                }
                v21 = -[__CFString isEqualToString:](v18, "isEqualToString:", v37);
                v22 = v21;
                v23 = IMOSLoggingEnabled(v21);
                if ((v22 & 1) != 0)
                {
                  if (v23)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v24 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v17, "profileID");
                      v25 = (id)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v16, "isActive");
                      *(_DWORD *)buf = 138412802;
                      v27 = CFSTR("NO");
                      if (v26)
                        v27 = CFSTR("YES");
                      v43 = v37;
                      v44 = 2112;
                      v45 = v25;
                      v46 = 2112;
                      v47 = v27;
                      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "We found one that matches up (icloud: %@, iMessage: %@), the ids account is active: [%@]", buf, 0x20u);

                    }
                  }
                  if (v36 || objc_msgSend(v16, "isActive"))
                  {

                    v31 = 1;
                    goto LABEL_47;
                  }
                }
                else
                {
                  if (v23)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v17, "profileID");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v43 = v37;
                      v44 = 2112;
                      v45 = v29;
                      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "iCloud account %@ and iMessage account %@ DO NOT match up", buf, 0x16u);

                    }
                  }
                  v35 = 0;
                }
              }
            }

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v31 = v36;
LABEL_47:
      v35 = v31;
    }

    v30 = v35 & 1;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)signedIntoiCloudAccount
{
  void *v2;
  BOOL v3;

  -[IMDCKUtilities _primaryiCloudAccount](self, "_primaryiCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)signedIntoiMessageAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "idsAccount", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "accountType") == 1 && (objc_msgSend(v11, "isActive") & 1) != 0)
          {

            LOBYTE(v7) = 1;
            goto LABEL_14;
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

- (BOOL)signedIntoiCloudAndiMessageAndiCloudAccountMatchesiMessageAccount
{
  void *v3;
  void *v4;
  BOOL v5;
  _BOOL4 v6;

  -[IMDCKUtilities _primaryiCloudAccount](self, "_primaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMDCKUtilities dsid](self, "dsid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") == 0;

  }
  else
  {
    v5 = 1;
  }

  v6 = -[IMDCKUtilities signedIntoiMessageAccount](self, "signedIntoiMessageAccount");
  return !v5 && v6 && -[IMDCKUtilities iCloudAccountMatchesiMessageAccount](self, "iCloudAccountMatchesiMessageAccount");
}

- (void)downgradingFromHSA2AndDisablingMOC
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
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "/**---DISABLING MESSAGES ON ICLOUD---**/", v4, 2u);
    }

  }
  IMSetDomainBoolForKey();
  -[IMDCKUtilities setCloudKitSyncingEnabled:](self, "setCloudKitSyncingEnabled:", 0);
}

- (void)eligibleForTruthZoneWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Fetching eligibility for truth zone before attempting to sync", buf, 2u);
    }

  }
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D1434C20;
  v13[3] = &unk_1E9228058;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  -[IMDCKUtilities fetchCloudKitAccountStatusWithCompletion:](self, "fetchCloudKitAccountStatusWithCompletion:", v13);
  v8 = dispatch_time(0, 60000000000);
  v9 = dispatch_semaphore_wait(v7, v8);
  if (v9)
  {
    *((_BYTE *)v17 + 24) = 0;
    v9 = IMOSLoggingEnabled(v9);
    if ((_DWORD)v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "***** Timed out checking truth zone eligibility *******", buf, 2u);
      }

    }
  }
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (*((_BYTE *)v17 + 24))
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "eligibleForTruthZone %@", buf, 0xCu);
    }

  }
  if (v4)
    v4[2](v4, *((unsigned __int8 *)v17 + 24));

  _Block_object_dispose(&v16, 8);
}

- (BOOL)isInCloudKitDemoMode
{
  if (qword_1EFC63C38 != -1)
    dispatch_once(&qword_1EFC63C38, &unk_1E92284C0);
  return byte_1EFC63C30;
}

- (void)disableAllDevicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Attempt to disable MOC across all devices", buf, 2u);
    }

  }
  IMSetDomainBoolForKey();
  -[IMDCKUtilities exitManager](self, "exitManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D1434EA0;
  v9[3] = &unk_1E92284E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "writeExitRecordWithDate:completion:", v7, v9);

}

+ (id)im_AKSecurityLevelKey
{
  if (qword_1EFC63C48 != -1)
    dispatch_once(&qword_1EFC63C48, &unk_1E9228508);
  return (id)qword_1EFC63C40;
}

+ (id)_idsAccountController
{
  if (qword_1ED9360F0 != -1)
    dispatch_once(&qword_1ED9360F0, &unk_1E9228528);
  return (id)qword_1ED9360E8;
}

+ (id)readAliasesFromDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:inDomain:", CFSTR("IMD-IDS-Aliases"), *MEMORY[0x1E0D37950]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", CFSTR("allAliases")))
    {
      objc_msgSend(v3, "allKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsObject:", CFSTR("selectedAliases")))
      {
        v14[0] = CFSTR("allAliases");
        v6 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v3, "objectForKey:", CFSTR("allAliases"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setWithArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = CFSTR("selectedAliases");
        v15[0] = v8;
        v9 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v3, "objectForKey:", CFSTR("selectedAliases"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)calculateAliasesForDefaults
{
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(a1))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Calculating selected/all aliases", buf, 2u);
    }

  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D39730], "IMPhoneNumbersEnabledForMultipleSubscriptionDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "addObjectsFromArray:", v6);
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  }
  objc_msgSend(a1, "_idsAccountController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "im_registeredURIs", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
          objc_msgSend(v4, "addObjectsFromArray:", v14);
        objc_msgSend(v13, "vettedAliases");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
          objc_msgSend(v5, "addObjectsFromArray:", v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v10);
  }

  v25[0] = CFSTR("allAliases");
  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = CFSTR("selectedAliases");
  v26[0] = v16;
  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (void)calculateAndSaveAliasesToDefaults
{
  void *v2;
  int v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "calculateAliasesForDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMOSLoggingEnabled(v2);
  v4 = (_QWORD *)MEMORY[0x1E0D37950];
  if (v3)
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *v4;
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Saving (domain %@) selected aliases %@", (uint8_t *)&v8, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:inDomain:", v2, CFSTR("IMD-IDS-Aliases"), *v4);

}

+ (void)addConditionChecks:(unint64_t)a3 toCriteria:(id)a4
{
  id v5;
  xpc_object_t xdict;

  v5 = a4;
  xdict = v5;
  if (a3 == 1)
    goto LABEL_4;
  if (a3 == 2)
  {
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808C8], 1);
LABEL_4:
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 0);
    v5 = xdict;
  }

}

- (void)setDidKeyRollPendingCheck:(BOOL)a3
{
  self->_didKeyRollPendingCheck = a3;
}

- (void)setLockdownManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownManager, a3);
}

- (void)setServerBag:(id)a3
{
  objc_storeStrong((id *)&self->_serverBag, a3);
}

- (void)setDeviceSupport:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSupport, a3);
}

- (void)setImDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_imDefaults, a3);
}

- (void)setTelemetryReporter:(id)a3
{
  objc_storeStrong((id *)&self->_telemetryReporter, a3);
}

- (BOOL)useDeprecatedApi
{
  return self->_useDeprecatedApi;
}

- (void)setUseDeprecatedApi:(BOOL)a3
{
  self->_useDeprecatedApi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryReporter, 0);
  objc_storeStrong((id *)&self->_imDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_lockdownManager, 0);
  objc_storeStrong((id *)&self->_syncState, 0);
}

@end
