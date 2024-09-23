@implementation CKiCloudCriteriaImpl

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_65);
  return (id)sharedInstance_sharedInstance;
}

void __38__CKiCloudCriteriaImpl_sharedInstance__block_invoke()
{
  CKiCloudCriteriaImpl *v0;
  void *v1;

  v0 = objc_alloc_init(CKiCloudCriteriaImpl);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)fetchCloudStorageUsageInformationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAD00]), "initDetailedRequestWithAccount:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CKiCloudCriteriaImpl_fetchCloudStorageUsageInformationWithCompletion___block_invoke;
  v8[3] = &unk_1E274F908;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "performRequestWithHandler:", v8);

}

void __72__CKiCloudCriteriaImpl_fetchCloudStorageUsageInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "debugDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = *(double *)&v13;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "performRequestWithHandler for quota request failed with error %@", buf, 0xCu);

      }
    }
  }
  else
  {
    objc_msgSend(v10, "availableStorageInBytes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "usedStorageInBytes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "totalStorageInBytes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v14, "unsignedLongValue");
    v17 = objc_msgSend(v15, "unsignedLongValue");
    v18 = objc_msgSend(v16, "unsignedLongValue");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        v23 = (double)(v21 >> 20);
        v24 = 2048;
        v25 = (double)(v17 >> 20);
        v26 = 2048;
        v27 = (double)(v18 >> 20);
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Quota Returned: availableStorageInBytes={%g MB} usedStorageInBytes={%g MB} totalStorageInBytes={%g MB}", buf, 0x20u);
      }

    }
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
      (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(v20 + 16))(v20, v21, v17, v18);

  }
}

+ (BOOL)iCloudBackupEnabledSystemWide
{
  void *v2;
  void *v3;
  char v4;

  +[CKiCloudCriteriaImpl createBackupManager](CKiCloudCriteriaImpl, "createBackupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isBackupEnabled");
  else
    v4 = 0;

  return v4;
}

+ (id)createBackupManager
{
  id v2;

  if (createBackupManager_onceToken != -1)
    dispatch_once(&createBackupManager_onceToken, &__block_literal_global_6);
  v2 = (id)createBackupManager_MBManagerClass;
  if (createBackupManager_MBManagerClass)
    v2 = objc_alloc_init((Class)createBackupManager_MBManagerClass);
  return v2;
}

void __43__CKiCloudCriteriaImpl_createBackupManager__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  createBackupManager_MBManagerClass = MEMORY[0x193FF3C18](CFSTR("MBManager"), CFSTR("MobileBackup"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      if (createBackupManager_MBManagerClass)
        v1 = CFSTR("YES");
      else
        v1 = CFSTR("NO");
      v2 = 138412290;
      v3 = v1;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Loaded MBManagerClass: %@", (uint8_t *)&v2, 0xCu);
    }

  }
}

+ (int64_t)otherDevicesCount
{
  id v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = objc_alloc(MEMORY[0x1E0D34358]);
  v3 = (void *)objc_msgSend(v2, "initWithService:", *MEMORY[0x1E0D34240]);
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

@end
