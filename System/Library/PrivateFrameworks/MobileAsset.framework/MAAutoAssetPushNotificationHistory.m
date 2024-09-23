@implementation MAAutoAssetPushNotificationHistory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance_singleton;
}

void __52__MAAutoAssetPushNotificationHistory_sharedInstance__block_invoke()
{
  MAAutoAssetPushNotificationHistory *v0;
  void *v1;

  v0 = objc_alloc_init(MAAutoAssetPushNotificationHistory);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (MAAutoAssetPushNotificationHistory)init
{
  MAAutoAssetPushNotificationHistory *v2;
  MAAutoAssetPushNotificationHistory *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetPushNotificationHistory;
  v2 = -[MAAutoAssetPushNotificationHistory init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v11 = 0;
    -[MAAutoAssetPushNotificationHistory _loadHistoryWithError:](v2, "_loadHistoryWithError:", &v11);
    v4 = v11;
    v9 = v4;
    if (v4)
      _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory init]", CFSTR("Error loading history: %@"), v5, v6, v7, v8, (uint64_t)v4);

  }
  return v3;
}

- (NSArray)notificationHistory
{
  -[MAAutoAssetPushNotificationHistory _loadHistoryWithError:](self, "_loadHistoryWithError:", 0);
  return self->_notificationHistory;
}

- (id)_historyURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  getRepositoryPath(CFSTR("/private/var/MobileAsset/AssetsV2/persisted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PushNotificationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("pushnotificationhistory.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_loadHistoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v33;
  uint64_t v34;
  char v35;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

  if (v8)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", CFSTR("Reading pushnotificationhistory.plist file"), v9, v10, v11, v12, v34);
    v13 = (void *)MEMORY[0x1E0C99D20];
    -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithContentsOfURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetPushNotificationHistory setNotificationHistory:](self, "setNotificationHistory:", v15);

LABEL_3:
    LOBYTE(v16) = 0;
    goto LABEL_9;
  }
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", CFSTR("pushnotificationhistory.plist file does not exist, create it"), v9, v10, v11, v12, v34);
  getRepositoryPath(CFSTR("/private/var/MobileAsset/AssetsV2/persisted"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("PushNotificationManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  if ((objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v14, &v35) & 1) == 0)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", CFSTR("%@ doesn't exist, create it"), v18, v19, v20, v21, (uint64_t)v14);
    if ((objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, a3) & 1) == 0)
    {
      if (a3)
        v33 = (const __CFString *)*a3;
      else
        v33 = CFSTR("no error");
      _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", CFSTR("Error creating directory: %@"), v22, v23, v24, v25, (uint64_t)v33);
      goto LABEL_3;
    }
  }
  -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(MEMORY[0x1E0C9AA60], "writeToURL:error:", v26, a3);

  v31 = CFSTR("failure");
  if (v16)
    v31 = CFSTR("success");
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", CFSTR("Created pushnotificationhistory.plist with result %@"), v27, v28, v29, v30, (uint64_t)v31);

LABEL_9:
  return v16;
}

- (BOOL)addNotificationsToHistory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MAAutoAssetPushNotificationHistory _loadHistoryWithError:](self, "_loadHistoryWithError:", a4);
  -[MAAutoAssetPushNotificationHistory notificationHistory](self, "notificationHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "historyRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "writeToURL:error:", v15, a4);

  if ((v16 & 1) == 0)
    _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory addNotificationsToHistory:withError:]", CFSTR("Error writing notifications to history: %@"), v17, v18, v19, v20, (uint64_t)*a4);

  return v16;
}

- (BOOL)clearHistoryWithError:(id *)a3
{
  void *v4;

  -[MAAutoAssetPushNotificationHistory _historyURL](self, "_historyURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(MEMORY[0x1E0C9AA60], "writeToURL:error:", v4, a3);

  return (char)a3;
}

- (void)setNotificationHistory:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHistory, 0);
}

@end
