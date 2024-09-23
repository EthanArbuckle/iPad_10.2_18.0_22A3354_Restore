@implementation LSDAppProtectionClient

void __67___LSDAppProtectionClient_sendPluginNotificationsFor_notification___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LSApplicationRecord *v7;
  LSApplicationRecord *v8;
  LSApplicationRecord *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v5);
        v7 = [LSApplicationRecord alloc];
        v8 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:](v7, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0, (_QWORD)v14);
        v9 = v8;
        if (v8)
        {
          v10 = *(void **)(a1 + 40);
          -[LSApplicationRecord applicationExtensionRecords](v8, "applicationExtensionRecords");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v12);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendNotification:forApplicationExtensionRecords:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

@end
