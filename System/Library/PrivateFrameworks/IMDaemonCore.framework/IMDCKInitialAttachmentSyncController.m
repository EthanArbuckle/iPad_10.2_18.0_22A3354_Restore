@implementation IMDCKInitialAttachmentSyncController

- (id)latestSyncToken
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_syncToken);
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[IMDCKInitialAttachmentSyncController ckUtilities](self, "ckUtilities", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  -[IMDCKInitialAttachmentSyncController ckUtilities](self, "ckUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "iCloudAccountMatchesiMessageAccount");

  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v6)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v8)
        v11 = CFSTR("YES");
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %@ has accounts %@", (uint8_t *)&v14, 0x16u);
    }

  }
  return v6 & v8;
}

- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[IMDCKInitialAttachmentSyncController ckUtilities](self, "ckUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

  -[IMDCKInitialAttachmentSyncController ckUtilities](self, "ckUtilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "iCloudAccountMatchesiMessageAccount");

  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      if (v9)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      if (v11)
        v14 = CFSTR("YES");
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %@, hasAccounts %@", (uint8_t *)&v17, 0x16u);
    }

  }
  return v9 & v11;
}

- (BOOL)_deviceConditionsAllowsMessageSync
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[IMDCKInitialAttachmentSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudKitSyncingEnabled");

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Initial sync device conditions check if CloudKit sync is enabled: %d", (uint8_t *)v7, 8u);
    }

  }
  return v3;
}

- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Initial sync device conditions ignoring feature enabled: always TRUE", v5, 2u);
    }

  }
  return 1;
}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  uint8_t v10[16];

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Initial sync. Not writing up attachments", v10, 2u);
    }

  }
  if (v7)
    v7[2](v7, 1, 0);

  return 0;
}

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (CKServerChangeToken)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
}

@end
