@implementation CKiCloudSettingsSyncController

- (CKiCloudSettingsSyncController)initWithSyncStatusHandler:(id)a3
{
  id v4;
  CKiCloudSettingsSyncController *v5;
  uint64_t v6;
  id syncStatusHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKiCloudSettingsSyncController;
  v5 = -[CKiCloudSettingsSyncController init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x24269E618](v4);
    syncStatusHandler = v5->_syncStatusHandler;
    v5->_syncStatusHandler = (id)v6;

    -[CKiCloudSettingsSyncController _wrapperInit](v5, "_wrapperInit");
  }

  return v5;
}

- (void)_wrapperInit
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupIMCloudKitHooks");

  objc_msgSend(MEMORY[0x24BE502B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventHandler:", self);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_24190B000, v5, OS_LOG_TYPE_INFO, "Sync controller did finish configuring IMCloudKit hooks.", v6, 2u);
    }

  }
  -[CKiCloudSettingsSyncController _prepareForInitialSyncState](self, "_prepareForInitialSyncState");
}

- (void)_prepareForInitialSyncState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSyncing");

  -[CKiCloudSettingsSyncController setSyncing:](self, "setSyncing:", v4);
  -[CKiCloudSettingsSyncController setMessagesToUploadCount:](self, "setMessagesToUploadCount:", 0);
  objc_msgSend(MEMORY[0x24BE502B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accountHasiMessageEnabled");

  IMCloudKitGetSyncStateDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE502C8]), "initWithAccountEnabled:stateDictionary:", v6, v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "syncJobState");
      IMStringFromIMCloudKitSyncJobState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_24190B000, v9, OS_LOG_TYPE_INFO, "Preparing UI for initial sync state - syncJobState={%@}.", (uint8_t *)&v12, 0xCu);

    }
  }
  -[CKiCloudSettingsSyncController syncStatusHandler](self, "syncStatusHandler");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v8);

}

- (void)startSync
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Messages"));
  objc_msgSend(v2, "objectForKey:", CFSTR("hasFinishedNewDeviceBringUpSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = CFSTR("Initial");
  if (v4)
    v5 = CFSTR("UserInitiated");
  v6 = v5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_24190B000, v7, OS_LOG_TYPE_INFO, "Attempting to start {%@} sync now.", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initiateSync:forceRunNow:reply:", v6, 1, &__block_literal_global_0);

}

void __43__CKiCloudSettingsSyncController_startSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (a2)
        v6 = CFSTR("YES");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_24190B000, v5, OS_LOG_TYPE_INFO, "Initiate sync replied with success={%@}", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)cancelCurrentSync
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (!-[CKiCloudSettingsSyncController isSyncing](self, "isSyncing") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24190B000, v2, OS_LOG_TYPE_INFO, "Tried to cancel a sync via UI, but we are not syncing. Programming error.", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_24190B000, v3, OS_LOG_TYPE_INFO, "Attempting to cancelling ongoing sync.", v5, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSync:", &__block_literal_global_37_0);

}

void __51__CKiCloudSettingsSyncController_cancelCurrentSync__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      IMStringFromIMCloudKitSyncType();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("NO");
      if (a2)
        v6 = CFSTR("YES");
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_24190B000, v3, OS_LOG_TYPE_INFO, "Canceling {%@} sync. success={%@}", (uint8_t *)&v7, 0x16u);

    }
  }
}

- (BOOL)isMiCEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)micAccountsMatch
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mocAccountsMatch");

  return v3;
}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  NSObject *v17;
  _BYTE v18[12];
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CKiCloudSettingsSyncController syncStatusHandler](self, "syncStatusHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "statistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "remainingMessagesCount");
    v11 = objc_msgSend(v7, "syncJobState");
    IMStringFromIMCloudKitSyncJobState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("NO");
        *(_DWORD *)v18 = 138413058;
        if (v11)
          v14 = CFSTR("YES");
        *(_QWORD *)&v18[4] = v14;
        v19 = 2112;
        v20 = v12;
        v21 = 2112;
        v22 = v9;
        v23 = 2048;
        v24 = v10;
        _os_log_impl(&dword_24190B000, v13, OS_LOG_TYPE_INFO, "syncStateDidChange – syncing={%@}, jobState={%@}, syncStatistics={%@}, messagesToUpload={%ld}", v18, 0x2Au);
      }

    }
    -[CKiCloudSettingsSyncController setSyncing:](self, "setSyncing:", v11 != 0, *(_QWORD *)v18);
    -[CKiCloudSettingsSyncController setMessagesToUploadCount:](self, "setMessagesToUploadCount:", v10);
    -[CKiCloudSettingsSyncController _syncSummaryForSyncState:](self, "_syncSummaryForSyncState:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKiCloudSettingsSyncController setSyncSummary:](self, "setSyncSummary:", v15);

    -[CKiCloudSettingsSyncController syncStatusHandler](self, "syncStatusHandler");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v16)[2](v16, v7);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_24190B000, v17, OS_LOG_TYPE_INFO, "No callback block provided for syncStateDidChange. Programmer error.", v18, 2u);
    }

  }
}

- (id)_syncSummaryForSyncState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "syncJobState");
  IMStringFromIMCloudKitSyncJobState();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Internal]\nSync Job State:\n%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSyncing
{
  return self->_syncing;
}

- (void)setSyncing:(BOOL)a3
{
  self->_syncing = a3;
}

- (unint64_t)messagesToUploadCount
{
  return self->_messagesToUploadCount;
}

- (void)setMessagesToUploadCount:(unint64_t)a3
{
  self->_messagesToUploadCount = a3;
}

- (NSString)syncSummary
{
  return self->_syncSummary;
}

- (void)setSyncSummary:(id)a3
{
  objc_storeStrong((id *)&self->_syncSummary, a3);
}

- (id)syncStatusHandler
{
  return self->_syncStatusHandler;
}

- (void)setSyncStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncStatusHandler, 0);
  objc_storeStrong((id *)&self->_syncSummary, 0);
}

@end
