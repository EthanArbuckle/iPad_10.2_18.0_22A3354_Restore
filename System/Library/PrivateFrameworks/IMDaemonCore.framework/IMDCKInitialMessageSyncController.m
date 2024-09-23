@implementation IMDCKInitialMessageSyncController

- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  objc_super v12;

  v10 = a6;
  v11 = a5;
  -[IMDCKInitialMessageSyncController setSyncToken:](self, "setSyncToken:", 0);
  v12.receiver = self;
  v12.super_class = (Class)IMDCKInitialMessageSyncController;
  -[IMDCKMessageSyncController syncMessagesWithSyncType:deviceConditionsToCheck:activity:completionBlock:](&v12, sel_syncMessagesWithSyncType_deviceConditionsToCheck_activity_completionBlock_, a3, a4, v11, v10);

}

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
  -[IMDCKInitialMessageSyncController ckUtilities](self, "ckUtilities", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  -[IMDCKInitialMessageSyncController ckUtilities](self, "ckUtilities");
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
  -[IMDCKInitialMessageSyncController ckUtilities](self, "ckUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

  -[IMDCKInitialMessageSyncController ckUtilities](self, "ckUtilities");
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

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D15DC0A4;
  v9[3] = &unk_1E92290A8;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

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
