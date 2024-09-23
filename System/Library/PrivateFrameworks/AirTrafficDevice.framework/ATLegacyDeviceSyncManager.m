@implementation ATLegacyDeviceSyncManager

- (ATLegacyDeviceSyncManager)init
{
  ATLegacyDeviceSyncManager *v2;
  uint64_t v3;
  ATUserDefaults *defaults;
  uint64_t v5;
  ATClientController *clientController;
  uint64_t v7;
  ATDeviceDiskUsageProvider *diskUsageProvider;
  uint64_t v9;
  NSMutableArray *messageLinks;
  uint64_t v11;
  NSMutableArray *dataclasses;
  ATAsset *currentAsset;
  uint64_t v14;
  NSMutableSet *dataClassesWithUpdatedDiskUsage;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  void *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v20;
  _QWORD v22[4];
  ATLegacyDeviceSyncManager *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ATLegacyDeviceSyncManager;
  v2 = -[ATDeviceSyncManager init](&v24, sel_init);
  if (v2)
  {
    +[ATUserDefaults sharedInstance](ATUserDefaults, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    defaults = v2->_defaults;
    v2->_defaults = (ATUserDefaults *)v3;

    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    clientController = v2->_clientController;
    v2->_clientController = (ATClientController *)v5;

    +[ATDeviceDiskUsageProvider sharedInstance](ATDeviceDiskUsageProvider, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    diskUsageProvider = v2->_diskUsageProvider;
    v2->_diskUsageProvider = (ATDeviceDiskUsageProvider *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    messageLinks = v2->_messageLinks;
    v2->_messageLinks = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    dataclasses = v2->_dataclasses;
    v2->_dataclasses = (NSMutableArray *)v11;

    currentAsset = v2->_currentAsset;
    v2->_currentAsset = 0;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    dataClassesWithUpdatedDiskUsage = v2->_dataClassesWithUpdatedDiskUsage;
    v2->_dataClassesWithUpdatedDiskUsage = (NSMutableSet *)v14;

    v16 = dispatch_queue_create("com.apple.atc.workq", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerObserver:", v2);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_ATBuddyCallback, CFSTR("com.apple.purplebuddy.setupdone"), 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __33__ATLegacyDeviceSyncManager_init__block_invoke;
    v22[3] = &unk_1E927E120;
    v23 = v2;
    objc_msgSend(v20, "performBlockAfterFirstUnlock:", v22);

  }
  return v2;
}

- (void)initiateSyncForLibrary:(id)a3 onMessageLink:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[4];
  id v10;
  ATLegacyDeviceSyncManager *v11;
  SEL v12;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ATLegacyDeviceSyncManager_initiateSyncForLibrary_onMessageLink___block_invoke;
  block[3] = &unk_1E927DAC8;
  v11 = self;
  v12 = a2;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)cancelSyncOnMessageLink:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ATLegacyDeviceSyncManager_cancelSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (id)currentSyncState
{
  ATSession *syncSession;
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  syncSession = self->_syncSession;
  v3 = -[ATLegacyDeviceSyncManager _currentLinkIsWifiConnection](self, "_currentLinkIsWifiConnection");
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCharging"))
  {
    objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDeviceClassCUnlocked");

  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", syncSession != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("Syncing"), v9, CFSTR("Wireless"), v10, CFSTR("Automatic"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryiTunesSync();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v11;
    _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "iTunes Sync State=%{public}@.", buf, 0xCu);
  }

  return v11;
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ATLegacyDeviceSyncManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke;
  block[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyDeviceSyncManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)messageLinkWasClosed:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasClosed___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)environmentMonitorDidChangePower:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ATLegacyDeviceSyncManager_environmentMonitorDidChangePower___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATLegacyDeviceSyncManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATLegacyDeviceSyncManager_session_didUpdateSessionTask___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)session:(id)a3 didBeginSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATLegacyDeviceSyncManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ATLegacyDeviceSyncManager_session_didBeginSessionTask___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATLegacyDeviceSyncManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATLegacyDeviceSyncManager_session_willBeginSessionTask___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)sessionWillBegin:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyDeviceSyncManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ATLegacyDeviceSyncManager_sessionWillBegin___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)sessionDidFinish:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyDeviceSyncManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ATLegacyDeviceSyncManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)assetLink:(id)a3 didUpdateOverallProgress:(double)a4
{
  NSObject *workQueue;
  _QWORD v5[6];

  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__ATLegacyDeviceSyncManager_assetLink_didUpdateOverallProgress___block_invoke;
  v5[3] = &unk_1E927DB80;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(workQueue, v5);
}

- (void)_handleCapabilitiesMessage:(id)a3 fromLink:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "parameterForKey:", CFSTR("LibraryID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  -[ATLegacyDeviceSyncManager _reportLocalProgress](self, "_reportLocalProgress");
}

- (void)_handleHostInfoMessage:(id)a3 fromLink:(id)a4
{
  ATUserDefaults *defaults;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  defaults = self->_defaults;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "parameterForKey:", CFSTR("HostInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ATGetDisabledAssetTypes(self->_clientController);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATUserDefaults updateHostInfo:disabledAssetTypes:](defaults, "updateHostInfo:disabledAssetTypes:", v9, v10);

  objc_msgSend(v8, "parameterForKey:", CFSTR("LocalCloudSupport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHostSupportsLocalCloudDownloads:", objc_msgSend(v11, "BOOLValue"));
  -[ATLegacyDeviceSyncManager _reportLocalProgress](self, "_reportLocalProgress");
}

- (void)_handleRequestingSyncMessage:(id)a3 fromLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATUserDefaults *defaults;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *p_currentMessageLink;
  void *v26;
  id currentMessageLink;
  void *v28;
  void *v29;
  uint64_t v30;
  ATUserDefaults *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableArray *dataclasses;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  ATSession *syncSession;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  ATLegacySyncSessionTask *v51;
  ATSession *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  ATLegacyDeviceSyncManager *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  ATLegacyDeviceSyncManager *v76;
  void *v77;
  void *v78;
  NSString *currentDataclass;
  uint64_t v80;
  __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id obj;
  uint64_t v90;
  ATLegacyDeviceSyncManager *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[2];
  _QWORD v105[2];
  _BYTE v106[128];
  _BYTE v107[128];
  ATLegacySyncSessionTask *v108;
  uint8_t v109[128];
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  const __CFString *v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parameterForKey:", CFSTR("HostInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    defaults = self->_defaults;
    ATGetDisabledAssetTypes(self->_clientController);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATUserDefaults updateHostInfo:disabledAssetTypes:](defaults, "updateHostInfo:disabledAssetTypes:", v8, v10);

  }
  v91 = self;
  -[ATLegacyDeviceSyncManager setCurrentSyncHostInfo:](self, "setCurrentSyncHostInfo:", v8);
  objc_msgSend(v8, "objectForKey:", CFSTR("Version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("IGNORE")))
    {
      _ATLogCategoryiTunesSync();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_INFO, "Explicitly ignoring version check", buf, 2u);
      }

LABEL_12:
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEphemeralMultiUser");
      -[ATLegacyDeviceSyncManager _currentHostType](v91, "_currentHostType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Configurator"));

      if (v16 && (v18 & 1) == 0)
      {
        _ATLogCategoryiTunesSync();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_ERROR, "Sending sync disallowed because we are in multi-user mode", buf, 2u);
        }

        v20 = (__CFString *)objc_opt_new();
        -[__CFString setObject:forKey:](v20, "setObject:forKey:", &unk_1E928B7D0, CFSTR("ErrorCode"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKey:](v20, "setObject:forKey:", v21, CFSTR("EducationModeEnabled"));

        objc_msgSend(v15, "cloudConfigurationDetails");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D47270]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          -[__CFString setObject:forKey:](v20, "setObject:forKey:", v23, CFSTR("ManagedOrganizationName"));
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), v20, objc_msgSend(v6, "sessionNumber"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendMessage:withCompletion:", v24, &__block_literal_global_94);
LABEL_67:

        goto LABEL_68;
      }
      v88 = v15;
      p_currentMessageLink = (id *)&v91->_currentMessageLink;
      -[ATConcreteMessageLink identifier](v91->_currentMessageLink, "identifier");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parameterForKey:", CFSTR("HostInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("LibraryID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      currentMessageLink = v91->_currentMessageLink;
      if (currentMessageLink != v7 && currentMessageLink && v20)
      {
        if (!objc_msgSend(v23, "isEqualToString:", v20))
        {
          _ATLogCategoryiTunesSync();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v111 = v23;
            v112 = 2114;
            v113 = v20;
            _os_log_impl(&dword_1D1868000, v39, OS_LOG_TYPE_ERROR, "Sending sync disallowed message to %{public}@, already syncing with %{public}@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928B9E8, objc_msgSend(v6, "sessionNumber"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "sendMessage:withCompletion:", v24, &__block_literal_global_99);
          v15 = v88;
          goto LABEL_67;
        }
        currentMessageLink = *p_currentMessageLink;
      }
      v87 = v12;
      if (currentMessageLink == v7 && v91->_localSyncRequestCanceled)
      {
        _ATLogCategoryiTunesSync();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v111 = v23;
          _os_log_impl(&dword_1D1868000, v38, OS_LOG_TYPE_ERROR, "Sending sync canceled message to %{public}@, canceled before we started", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928BA10, objc_msgSend(v6, "sessionNumber"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendMessage:withCompletion:", v24, &__block_literal_global_105);
        v91->_localSyncRequestCanceled = 0;
        v15 = v88;
      }
      else
      {
        v84 = v23;
        v85 = v8;
        objc_msgSend(v6, "parameterForKey:", CFSTR("HostInfo"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("Grappa"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ATGrappaEstablishSession(v29, &v91->_grappaId);
        v30 = objc_claimAutoreleasedReturnValue();

        v86 = (void *)v30;
        if (v30)
        {
          v81 = v20;
          -[ATLegacyDeviceSyncManager _cancelExistingSyncSession](v91, "_cancelExistingSyncSession");
          objc_msgSend(MEMORY[0x1E0CF7690], "setSessionNumber:", objc_msgSend(v6, "sessionNumber"));
          objc_storeStrong(p_currentMessageLink, a4);
          v31 = v91->_defaults;
          objc_msgSend(v6, "parameterForKey:", CFSTR("HostInfo"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          ATGetDisabledAssetTypes(v91->_clientController);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATUserDefaults updateHostInfo:disabledAssetTypes:](v31, "updateHostInfo:disabledAssetTypes:", v32, v33);

          objc_msgSend(v6, "parameterForKey:", CFSTR("Dataclasses"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "mutableCopy");
          dataclasses = v91->_dataclasses;
          v91->_dataclasses = (NSMutableArray *)v35;

          v91->_localSyncRequest = 0;
          v82 = v7;
          v83 = v6;
          if (-[ATLegacyDeviceSyncManager _currentLinkIsWifiConnection](v91, "_currentLinkIsWifiConnection"))
          {
            objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v91->_automaticSync = objc_msgSend(v37, "isCharging");

          }
          else
          {
            v91->_automaticSync = 1;
          }
          v91->_currentStage = 1;
          -[ATLegacyDeviceSyncManager _sendSyncAllowed](v91, "_sendSyncAllowed");
          -[ATLegacyDeviceSyncManager _reportLocalProgress](v91, "_reportLocalProgress");
          v42 = objc_alloc(MEMORY[0x1E0CF76B0]);
          v43 = objc_msgSend(v42, "initWithSessionTypeIdentifier:", *MEMORY[0x1E0CF7660]);
          syncSession = v91->_syncSession;
          v91->_syncSession = (ATSession *)v43;

          objc_msgSend(MEMORY[0x1E0CF2220], "sharedSessionServer");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addSession:", v91->_syncSession);

          -[ATSession addObserver:](v91->_syncSession, "addObserver:", v91);
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v80 = 88;
          v46 = v91->_dataclasses;
          v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v101 != v49)
                  objc_enumerationMutation(v46);
                v51 = -[ATLegacySyncSessionTask initWithDataClass:]([ATLegacySyncSessionTask alloc], "initWithDataClass:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i), v80);
                -[ATLegacySyncSessionTask setGrappaSessionID:](v51, "setGrappaSessionID:", v91->_grappaId);
                v52 = v91->_syncSession;
                v108 = v51;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATSession addSessionTasks:](v52, "addSessionTasks:", v53);

              }
              v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
            }
            while (v48);
          }

          -[ATSession start](v91->_syncSession, "start");
          -[ATLegacyDeviceSyncManager _sendInstalledAssets](v91, "_sendInstalledAssets");
          objc_msgSend(v6, "parameterForKey:", CFSTR("HostInfo"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", CFSTR("Version"));
          v90 = objc_claimAutoreleasedReturnValue();

          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          -[ATSession sessionTasksWithGroupingKey:](v91->_syncSession, "sessionTasksWithGroupingKey:", CFSTR("ATLegacySyncSessionTaskGroupingKey"));
          obj = (id)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v97;
            while (2)
            {
              for (j = 0; j != v56; ++j)
              {
                if (*(_QWORD *)v97 != v57)
                  objc_enumerationMutation(obj);
                v59 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
                objc_msgSend(v83, "parameterForKey:", CFSTR("DataclassAnchors"), v80);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "dataClass");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "objectForKey:", v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v59, "prepareWithHostAnchor:version:", v62, v90);
                objc_msgSend(v59, "error");
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                if (v63)
                {
                  objc_msgSend(v59, "error");
                  v64 = (id)objc_claimAutoreleasedReturnValue();

                  -[ATSession setError:](v91->_syncSession, "setError:", v64);
                  -[ATSession cancel](v91->_syncSession, "cancel");
                  v23 = v84;
                  v6 = v83;
                  goto LABEL_65;
                }

              }
              v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
              if (v56)
                continue;
              break;
            }
          }

          v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v65 = v91;
          v66 = *(id *)((char *)&v91->super.super.isa + v80);
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v93;
            do
            {
              for (k = 0; k != v68; ++k)
              {
                if (*(_QWORD *)v93 != v69)
                  objc_enumerationMutation(v66);
                v71 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * k);
                -[ATClientController clientForDataclass:](v65->_clientController, "clientForDataclass:", v71, v80);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v72, "currentSyncAnchor");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setObject:forKey:", v73, v71);

                  v65 = v91;
                }

              }
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
            }
            while (v68);
          }

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v86, CFSTR("Grappa"));
          v75 = (void *)MEMORY[0x1E0CF7690];
          v104[0] = CFSTR("DataclassAnchors");
          v104[1] = CFSTR("DeviceInfo");
          v105[0] = v64;
          v105[1] = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
          v76 = v65;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "messageWithName:parameters:", CFSTR("ReadyForSync"), v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "sendMessage:withCompletion:", v78, &__block_literal_global_128);

          v76->_currentStage = 2;
          currentDataclass = v76->_currentDataclass;
          v76->_currentDataclass = (NSString *)&stru_1E927E4E0;

          -[ATLegacyDeviceSyncManager _reportLocalProgress](v76, "_reportLocalProgress");
          v6 = v83;
          v23 = v84;
LABEL_65:
          v15 = v88;

          v20 = v81;
          v7 = v82;
          v8 = v85;
          v24 = v86;
          v12 = v87;
          v41 = (void *)v90;
        }
        else
        {
          _ATLogCategoryiTunesSync();
          v40 = objc_claimAutoreleasedReturnValue();
          v12 = v87;
          v15 = v88;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1868000, v40, OS_LOG_TYPE_ERROR, "Grappa session could not be established. Aborting", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928BA38, objc_msgSend(v6, "sessionNumber"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "sendMessage:withCompletion:", v41, &__block_literal_global_113);
          v23 = v84;
          v24 = 0;
        }

      }
      goto LABEL_67;
    }
    if (objc_msgSend(CFSTR("10.5.0.115"), "compare:options:", v12, 64) != 1)
      goto LABEL_12;
  }
  _ATLogCategoryiTunesSync();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v111 = v12;
    v112 = 2114;
    v113 = CFSTR("10.5.0.115");
    _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_ERROR, "Sending sync disallowed, incompatible version: %{public}@ vs. %{public}@ required", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928B9C0, objc_msgSend(v6, "sessionNumber"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:withCompletion:", v15, &__block_literal_global_83);
LABEL_68:

}

- (void)_handleFinishedSyncingMetadataMessage:(id)a3 fromLink:(id)a4
{
  id v6;
  id v7;
  ATSession *syncSession;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  ATLegacyDeviceSyncManager *v20;
  __int16 v21;
  _BYTE v22[10];
  __int16 v23;
  const __CFString *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  syncSession = self->_syncSession;
  if (!syncSession
    || (-[ATSession isCancelled](syncSession, "isCancelled") & 1) != 0
    || -[ATSession isFinished](self->_syncSession, "isFinished"))
  {
    _ATLogCategoryiTunesSync();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_ERROR, "%{public}@ no active sync session - failing sync", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928BA60, objc_msgSend(v6, "sessionNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMessage:withCompletion:", v10, &__block_literal_global_133);
  }
  else
  {
    v11 = objc_msgSend(v6, "sessionNumber");
    if (v11 == objc_msgSend(MEMORY[0x1E0CF7690], "currentSessionNumber"))
    {
      objc_msgSend(v6, "parameterForKey:", CFSTR("PurgeDataBytes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "unsignedLongLongValue");
      if (v12)
      {
        v13 = v12;
        -[ATSession setSuspended:](self->_syncSession, "setSuspended:", 1);
        _ATLogCategoryiTunesSync();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = self;
          v21 = 2048;
          *(_QWORD *)v22 = v13;
          _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting purge for %lld bytes", buf, 0x16u);
        }

        v26[0] = CFSTR("/private/var");
        v25[0] = CFSTR("CACHE_DELETE_VOLUME");
        v25[1] = CFSTR("CACHE_DELETE_AMOUNT");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = CFSTR("CACHE_DELETE_PURGE_TIMEOUT");
        v26[1] = v15;
        v26[2] = &unk_1E928B830;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D51270], "setAutoFilledTracksArePurgeable:", 0);
        v17 = v16;
        self->_cacheDeleteToken = (CacheDeleteToken *)CacheDeletePurgeSpaceWithInfo();

      }
      -[ATLegacyDeviceSyncManager _reconcileSyncWithMessage:](self, "_reconcileSyncWithMessage:", v6);
    }
    else
    {
      _ATLogCategoryiTunesSync();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v20 = self;
        v21 = 1024;
        *(_DWORD *)v22 = objc_msgSend(v6, "sessionNumber");
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = objc_msgSend(MEMORY[0x1E0CF7690], "currentSessionNumber");
        v23 = 2114;
        v24 = CFSTR("FinishedSyncingMetadata");
        _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Session numbers are different - ATLegacyMessage:(%d), ATLegacySession:(%d), ignoring message %{public}@ and cancelling current sync session", buf, 0x22u);
      }

      objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:session:", CFSTR("SyncFailed"), &unk_1E928BA88, objc_msgSend(v6, "sessionNumber"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendMessage:withCompletion:", v10, &__block_literal_global_153);
      -[ATLegacyDeviceSyncManager _cancelExistingSyncSession](self, "_cancelExistingSyncSession");
    }
  }

}

- (void)_handleSyncFailedMessage:(id)a3 fromLink:(id)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->_syncSession)
  {
    v7 = objc_msgSend(v11, "sessionNumber");
    if (v7 == objc_msgSend(MEMORY[0x1E0CF7690], "currentSessionNumber"))
    {
      objc_msgSend(v11, "parameterForKey:", CFSTR("ErrorCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "intValue") == 2)
        v9 = 8;
      else
        v9 = 1;

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATSession setError:](self->_syncSession, "setError:", v10);

      -[ATSession cancel](self->_syncSession, "cancel");
      if (self->_cacheDeleteToken)
      {
        CacheDeleteCancelPurge();
        self->_cacheDeleteToken = 0;
      }
    }
  }

}

- (void)_handleAssetMetricsMessage:(id)a3 fromLink:(id)a4
{
  id v5;

  objc_msgSend(a3, "parameterForKey:", CFSTR("Dataclasses"), a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATLegacyDeviceSyncManager _sendDiskUsageWithUpdatedDataClasses:](self, "_sendDiskUsageWithUpdatedDataClasses:", v5);

}

- (void)_handleSyncStatusMessage:(id)a3 fromLink:(id)a4
{
  id v5;

  objc_msgSend(a3, "parameterForKey:", CFSTR("StatusMessage"), a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentStatus, v5);
  -[ATSession setLocalizedDescription:](self->_syncSession, "setLocalizedDescription:", v5);
  -[ATLegacyDeviceSyncManager _reportLocalProgress](self, "_reportLocalProgress");

}

- (void)_sendInstalledAssets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Application"), CFSTR("Ringtone"), CFSTR("Media"), CFSTR("VoiceMemo"), CFSTR("Book"), CFSTR("Data"), CFSTR("Keybag"), CFSTR("Photo"), CFSTR("Proofing"), CFSTR("MessagePart"), CFSTR("Logs"), CFSTR("UserData"), CFSTR("Podcasts"), CFSTR("File"), 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[ATClientController clientForDataclass:](self->_clientController, "clientForDataclass:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "installedAssets");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v3, "setObject:forKey:", v10, v8);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_messageLinks;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("InstalledAssets"), v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sendMessage:withCompletion:", v17, &__block_literal_global_186);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

}

- (void)_sendDiskUsage
{
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  ATDeviceDiskUsageProvider *diskUsageProvider;
  _BOOL4 v17;
  ATLegacyDeviceSyncManager *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = v3 - self->_lastDiskUsageUpdateTime;
  _ATLogCategoryiTunesSync();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v5;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "Sending disk usage. lastUpdate=%.2fs ago", buf, 0xCu);
  }

  -[ATDeviceDiskUsageProvider getCurrentUsage](self->_diskUsageProvider, "getCurrentUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = !objc_msgSend(v7, "count") || self->_lastDiskUsageUpdateTime == 0.0 || v5 > 600.0;
  if (objc_msgSend(v7, "count"))
  {
    v17 = v8;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = self;
    v9 = self->_messageLinks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("AssetMetrics"), v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sendMessage:withCompletion:", v15, &__block_literal_global_188);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    self = v18;
    v8 = v17;
  }
  if (v8)
  {
    self->_lastDiskUsageUpdateTime = v4;
    diskUsageProvider = self->_diskUsageProvider;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_2;
    v19[3] = &unk_1E927DD18;
    v19[4] = self;
    -[ATDeviceDiskUsageProvider getUpdatedUsageWithCompletion:](diskUsageProvider, "getUpdatedUsageWithCompletion:", v19);
  }

}

- (void)_sendDiskUsageWithUpdatedDataClasses:(id)a3
{
  id v4;
  NSObject *v5;
  ATDeviceDiskUsageProvider *diskUsageProvider;
  double v7;
  ATDeviceDiskUsageProvider *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryiTunesSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Sending updated disk usage with updated dataclasses %{public}@", buf, 0xCu);
  }

  if (v4)
  {
    diskUsageProvider = self->_diskUsageProvider;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke;
    v10[3] = &unk_1E927DD18;
    v10[4] = self;
    -[ATDeviceDiskUsageProvider getCurrentUsageWithUpdatedDataClasses:withCompletion:](diskUsageProvider, "getCurrentUsageWithUpdatedDataClasses:withCompletion:", v4, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_lastDiskUsageUpdateTime = v7;
    v8 = self->_diskUsageProvider;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_4;
    v9[3] = &unk_1E927DD18;
    v9[4] = self;
    -[ATDeviceDiskUsageProvider getUpdatedUsageWithCompletion:](v8, "getUpdatedUsageWithCompletion:", v9);
  }

}

- (void)_sendSyncAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ATLegacyMessageLink *v10;
  ATLegacyMessageLink *currentMessageLink;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  NSMutableArray *obj;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  int v31;
  ATLegacyDeviceSyncManager *v32;
  unsigned int v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ATGetDisabledAssetTypes(self->_clientController);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "isDeviceClassCUnlocked");

  v31 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F08]);
  v30 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F10]);
  v29 = objc_msgSend(v3, "isEphemeralMultiUser");
  v28 = _os_feature_enabled_impl();
  v25 = v3;
  objc_msgSend(v3, "cloudConfigurationDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D47270]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = self;
  obj = self->_messageLinks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v10 = *(ATLegacyMessageLink **)(*((_QWORD *)&v35 + 1) + 8 * i);
        currentMessageLink = v32->_currentMessageLink;
        if (currentMessageLink)
          v12 = v10 == currentMessageLink;
        else
          v12 = 1;
        if (v12)
          v13 = v33;
        else
          v13 = 0;
        if ((_DWORD)v13 == 1)
        {
          objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isCharging");

        }
        else
        {
          v15 = 0;
        }
        v16 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("AutoSync"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("ManualSync"));

        objc_msgSend(v16, "setObject:forKey:", v34, CFSTR("DisabledAssetTypes"));
        objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PurgeAllowed"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33 ^ 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("DataProtected"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31 != 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("AppInstallationAllowed"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30 != 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("AppRemovalAllowed"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, CFSTR("EducationModeEnabled"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v23, CFSTR("SupportsFavorites"));

        if (v6)
          objc_msgSend(v16, "setObject:forKey:", v6, CFSTR("ManagedOrganizationName"));
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("SyncAllowed"), v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATLegacyMessageLink sendMessage:withCompletion:](v10, "sendMessage:withCompletion:", v24, &__block_literal_global_213);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

}

- (void)_reconcileSyncWithMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *dataClassesWithUpdatedDiskUsage;
  void *v20;
  ATLegacyDeviceSyncManager *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_currentStage = 3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Media"), CFSTR("Book"), CFSTR("Application"), CFSTR("Photo"), CFSTR("Podcasts"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = self;
  -[ATSession sessionTasksWithGroupingKey:](self->_syncSession, "sessionTasksWithGroupingKey:", CFSTR("ATLegacySyncSessionTaskGroupingKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v4, "parameterForKey:", CFSTR("SyncTypes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataClass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntValue");

        objc_msgSend(v4, "parameterForKey:", CFSTR("DataclassAnchors"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataClass");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "dataClass");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v5, "containsObject:", v18);

        if ((_DWORD)v16 && (_DWORD)v14)
        {
          dataClassesWithUpdatedDiskUsage = v21->_dataClassesWithUpdatedDiskUsage;
          objc_msgSend(v10, "dataClass");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](dataClassesWithUpdatedDiskUsage, "addObject:", v20);

        }
        objc_msgSend(v10, "reconcileWithAnchor:syncType:", v17, v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[ATLegacyDeviceSyncManager _reportLocalProgress](v21, "_reportLocalProgress");
}

- (BOOL)_currentLinkIsWifiConnection
{
  return -[ATLockdownMessageLink isWifiConnection](self->_currentMessageLink, "isWifiConnection");
}

- (void)_reportLocalProgress
{
  void *v3;
  ATLegacyMessageLink *currentMessageLink;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ATLegacyMessageLink *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *currentDataclass;
  NSString *currentStatus;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  ATAsset *currentAsset;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableArray *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  +[ATAssetManager sharedInstance](ATAssetManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentMessageLink = self->_currentMessageLink;
  if (currentMessageLink)
  {
    -[ATConcreteMessageLink identifier](currentMessageLink, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = self->_dataclasses;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v47 != v8)
              objc_enumerationMutation(obj);
            v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            v11 = objc_alloc_init(MEMORY[0x1E0CF76B8]);
            -[ATConcreteMessageLink identifier](self->_currentMessageLink, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLibraryID:", v12);

            objc_msgSend(v11, "setDataClass:", v10);
            objc_msgSend(v11, "setSyncStage:", self->_currentStage);
            objc_msgSend(v11, "setLocalizedDescription:", self->_currentStatus);
            v51 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setTotalAssetCount:", objc_msgSend(v3, "totalAssetCountForDataClasses:", v13));

            v50 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setCompletedAssetCount:", objc_msgSend(v3, "completedAssetCountForDataClasses:", v14));

            objc_msgSend(v11, "setAutomaticSync:", self->_automaticSync);
            objc_msgSend(v11, "setWirelessSync:", -[ATLockdownMessageLink isWifiConnection](self->_currentMessageLink, "isWifiConnection"));
            if (objc_msgSend(v11, "totalAssetCount"))
            {
              v15 = (float)(unint64_t)objc_msgSend(v11, "completedAssetCount");
              *(float *)&v16 = v15 / (float)(unint64_t)objc_msgSend(v11, "totalAssetCount");
              objc_msgSend(v11, "setProgress:", v16);
            }
            objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "updateStatus:", v11);

          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v7);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_syncSession != 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("Enabled"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v21 = self->_currentMessageLink;
  if (v21)
    v22 = -[ATLockdownMessageLink isWifiConnection](v21, "isWifiConnection");
  else
    v22 = 0;
  objc_msgSend(v20, "numberWithInt:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v23, CFSTR("Wireless"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_automaticSync);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v24, CFSTR("AutoSync"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentStage);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v25, CFSTR("SyncStage"));

  -[NSMutableArray valueForKey:](self->_messageLinks, "valueForKey:", CFSTR("identifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v26, CFSTR("ConnectedLibraries"));

  -[ATConcreteMessageLink identifier](self->_currentMessageLink, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[ATConcreteMessageLink identifier](self->_currentMessageLink, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v28, CFSTR("ActiveLibrary"));

  }
  currentDataclass = self->_currentDataclass;
  if (currentDataclass)
    objc_msgSend(v18, "setObject:forKey:", currentDataclass, CFSTR("Dataclass"));
  currentStatus = self->_currentStatus;
  if (currentStatus)
    objc_msgSend(v18, "setObject:forKey:", currentStatus, CFSTR("StatusMessage"));
  if (self->_currentStage == 4)
  {
    v31 = objc_msgSend(v3, "totalAssetCountForDataClasses:", self->_dataclasses);
    v32 = objc_msgSend(v3, "completedAssetCountForDataClasses:", self->_dataclasses);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v33, CFSTR("AssetCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v34, CFSTR("CurrentAssetNum"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentOverallProgress);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v35, CFSTR("OverallProgress"));

    currentAsset = self->_currentAsset;
    if (currentAsset)
    {
      v37 = (void *)MEMORY[0x1E0CB37E8];
      -[ATAsset downloadProgress](currentAsset, "downloadProgress");
      objc_msgSend(v37, "numberWithFloat:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v38, CFSTR("AssetProgress"));

      -[ATAsset identifier](self->_currentAsset, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        -[ATAsset identifier](self->_currentAsset, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v40, CFSTR("CurrentAssetID"));

      }
      -[ATAsset prettyName](self->_currentAsset, "prettyName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[ATAsset prettyName](self->_currentAsset, "prettyName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v42, CFSTR("CurrentAsset"));

      }
    }
    objc_msgSend(v3, "assetProgressForAllDataclasses");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v43, CFSTR("DataclassProgress"));

  }
  objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "updateStatusValuesWithDictionary:", v18);

}

- (void)_reset
{
  NSObject *v3;
  NSString *currentDataclass;
  NSString *currentStatus;
  ATLegacyMessageLink *currentMessageLink;
  NSMutableArray *dataclasses;
  int v8;
  ATLegacyDeviceSyncManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryiTunesSync();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting.", (uint8_t *)&v8, 0xCu);
  }

  if (self->_grappaId)
  {
    PIc2v4FsmbHb6FcVO9Fu();
    self->_grappaId = 0;
  }
  self->_localSyncRequest = 0;
  self->_localSyncRequestCanceled = 0;
  self->_automaticSync = 0;
  self->_currentStage = 0;
  currentDataclass = self->_currentDataclass;
  self->_currentDataclass = 0;

  currentStatus = self->_currentStatus;
  self->_currentStatus = 0;

  self->_currentOverallProgress = 0.0;
  currentMessageLink = self->_currentMessageLink;
  self->_currentMessageLink = 0;

  -[ATLegacyDeviceSyncManager _reportLocalProgress](self, "_reportLocalProgress");
  dataclasses = self->_dataclasses;
  self->_dataclasses = 0;

  -[ATLegacyDeviceSyncManager _sendSyncAllowed](self, "_sendSyncAllowed");
}

- (id)_currentHostType
{
  __CFString *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_currentSyncHostInfo, "objectForKey:", CFSTR("Type"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_currentSyncHostInfo, "objectForKey:", CFSTR("Version"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("IGNORE")) & 1) != 0)
      v3 = CFSTR("Configurator");
    else
      v3 = CFSTR("iTunes");

  }
  return v3;
}

- (void)_cancelExistingSyncSession
{
  NSObject *v3;
  ATSession *syncSession;
  ATLegacyAssetLink *assetLink;
  ATLegacyAssetLink *v6;
  uint8_t v7[16];

  if (self->_syncSession)
  {
    _ATLogCategoryiTunesSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "Canceling existing sync session.", v7, 2u);
    }

    -[ATSession cancel](self->_syncSession, "cancel");
    -[ATSession removeObserver:](self->_syncSession, "removeObserver:", self);
    syncSession = self->_syncSession;
    self->_syncSession = 0;

    assetLink = self->_assetLink;
    if (assetLink)
    {
      -[ATLegacyAssetLink close](assetLink, "close");
      v6 = self->_assetLink;
      self->_assetLink = 0;

    }
  }
}

- (ATSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
  objc_storeStrong((id *)&self->_syncSession, a3);
}

- (NSDictionary)currentSyncHostInfo
{
  return self->_currentSyncHostInfo;
}

- (void)setCurrentSyncHostInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncHostInfo, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_dataClassesWithUpdatedDiskUsage, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_currentDataclass, 0);
  objc_storeStrong((id *)&self->_dataclassTimers, 0);
  objc_storeStrong(&self->_clientProgressCallback, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_assetLink, 0);
  objc_storeStrong((id *)&self->_currentMessageLink, 0);
  objc_storeStrong((id *)&self->_messageLinks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_diskUsageProvider, 0);
  objc_storeStrong((id *)&self->_clientController, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_2;
  v7[3] = &unk_1E927E148;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_5;
  v7[3] = &unk_1E927E148;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("AssetMetrics"), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendMessage:withCompletion:", v8, &__block_literal_global_192);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("AssetMetrics"), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendMessage:withCompletion:", v8, &__block_literal_global_191);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_3;
  v7[3] = &unk_1E927E148;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("AssetMetrics"), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendMessage:withCompletion:", v8, &__block_literal_global_189);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_146(_QWORD *a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51270], "setAutoFilledTracksArePurgeable:", 1);
  _ATLogCategoryiTunesSync();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Captured %{public}@", buf, 0x16u);
  }

  objc_msgSend(a2, "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  _ATLogCategoryiTunesSync();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2048;
    v18 = v8;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Purged %lld bytes", buf, 0x16u);
  }

  v11 = a1[4];
  v12 = *(NSObject **)(v11 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_147;
  block[3] = &unk_1E927DC48;
  v13 = a1[6];
  block[5] = v8;
  block[6] = v13;
  block[4] = v11;
  dispatch_async(v12, block);
}

uint64_t __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_147(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[5] >= a1[6])
    return objc_msgSend(*(id *)(a1[4] + 208), "setSuspended:", 0);
  _ATLogCategoryiTunesSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    v4 = a1[6];
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "CacheDelete purged %lli of %lli requested", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 208), "setSuspended:", 0);
}

void __67__ATLegacyDeviceSyncManager__handleRequestingSyncMessage_fromLink___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _ATLogCategoryiTunesSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_ERROR, "failed to send ReadyForSync back to host. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __64__ATLegacyDeviceSyncManager_assetLink_didUpdateOverallProgress___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_reportLocalProgress");
}

void *__46__ATLegacyDeviceSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  id *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  result = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (result != *(void **)(v5 + 208))
    return result;
  if (*(_QWORD *)(v5 + 80))
  {
    objc_msgSend(*(id *)(v5 + 80), "close");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = 0;

    result = *(void **)(*(_QWORD *)(a1 + 40) + 208);
  }
  objc_msgSend(result, "removeObserver:");
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 208);
  *(_QWORD *)(v8 + 208) = 0;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  else
    objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  ATReportEventIncrementingScalarKey();
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "waitToDrain");

  objc_msgSend(*(id *)(a1 + 32), "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  v14 = (void *)MEMORY[0x1E0CF7690];
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v45 = CFSTR("ErrorCode");
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "error");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v1, "code"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v14, "messageWithName:parameters:", CFSTR("SyncFailed"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendMessage:withCompletion:", v18, &__block_literal_global_67);

    if (v15)
    {

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("SyncFinished"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendMessage:withCompletion:", v15, &__block_literal_global_70);
  }

  _ATLogCategoryiTunesSync();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "duration");
    *(_DWORD *)buf = 134217984;
    v44 = v20;
    _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "---Total Sync Time: %.1fs---", buf, 0xCu);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionTasks");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 += objc_msgSend(v27, "failedAssetsCount");
          if (objc_msgSend(v27, "totalItemCount"))
          {
            v28 = *(void **)(*(_QWORD *)(a1 + 40) + 192);
            objc_msgSend(v27, "dataClass");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v29);

          }
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v23);

    if (v24)
      ATDisplayErrorForAssets(v24);
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    goto LABEL_32;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v31 = *(_QWORD *)(a1 + 40);
    v32 = *(void **)(v31 + 32);
    objc_msgSend(*(id *)(v31 + 72), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "updateLastSyncWithHostLibrary:", v30);
LABEL_32:

  }
  v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "count");
  _ATLogCategoryiTunesSync();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    if (v35)
    {
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192);
      *(_DWORD *)buf = 138543362;
      v44 = v36;
      _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "Updating storage metrics after sync changes were applied to dataclasses %{public}@", buf, 0xCu);
    }

    v37 = *(id **)(a1 + 40);
    objc_msgSend(v37[24], "allObjects");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_sendDiskUsageWithUpdatedDataClasses:", v34);
  }
  else if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "skipping storage metrics update since no changes were made", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_reset");
  getpid();
  proc_set_cpumon_defaults();
  return (void *)SBSSetStatusBarShowsSyncActivity();
}

uint64_t __46__ATLegacyDeviceSyncManager_sessionWillBegin___block_invoke(uint64_t result)
{
  uint64_t v1;
  ATLegacyAssetLink *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 208))
  {
    v1 = result;
    ATReportEventIncrementingScalarKey();
    getpid();
    proc_disable_cpumon();
    SBSSetStatusBarShowsSyncActivity();
    v2 = [ATLegacyAssetLink alloc];
    v3 = *(_QWORD *)(v1 + 40);
    v4 = *(_QWORD *)(v3 + 72);
    objc_msgSend(*(id *)(v3 + 216), "valueForKey:", CFSTR("Version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ATLegacyAssetLink initWithMessageLink:hostVersion:](v2, "initWithMessageLink:hostVersion:", v4, v5);
    v7 = *(_QWORD *)(v1 + 40);
    v8 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 80), "setSupportedDataClasses:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 88));
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 80), "setProgressDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 192), "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAirlockForDataclasses:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 88));

    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAssetLink:", *(_QWORD *)(*(_QWORD *)(v1 + 40) + 80));

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 80), "open");
  }
  return result;
}

void __58__ATLegacyDeviceSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208))
  {
    objc_msgSend(*(id *)(a1 + 48), "sessionGroupingKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ATAssetSessionTaskGroupingKey"));

    if (v3)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 136) = 4;
      objc_msgSend(*(id *)(a1 + 40), "_reportLocalProgress");
    }
  }
}

void __57__ATLegacyDeviceSyncManager_session_didBeginSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "readyDataClasses");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "dataClass");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayByAddingObject:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setReadyDataClasses:", v3);

    }
  }
}

void __58__ATLegacyDeviceSyncManager_session_didUpdateSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208))
  {
    objc_msgSend(*(id *)(a1 + 48), "sessionGroupingKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ATAssetSessionTaskGroupingKey"));

    objc_msgSend(*(id *)(a1 + 48), "dataClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 144);
      *(_QWORD *)(v6 + 144) = v5;

    }
    else
    {
      v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("Media"));

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 48), "progress");
        v10 = v9;
        v11 = *(_QWORD *)(a1 + 40);
        if (*(double *)(v11 + 168) != v9)
        {
          v12 = *(void **)(v11 + 72);
          v13 = (void *)MEMORY[0x1E0CF7690];
          v18 = CFSTR("OverallProgress");
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 48), "progress");
          objc_msgSend(v14, "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "messageWithName:parameters:", CFSTR("Progress"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sendMessage:withCompletion:", v17, &__block_literal_global_3850);

          *(double *)(*(_QWORD *)(a1 + 40) + 168) = v10;
        }
      }
    }
  }
}

uint64_t __62__ATLegacyDeviceSyncManager_environmentMonitorDidChangePower___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncAllowed");
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v2 + 72))
  {
    v3 = objc_msgSend(*(id *)(v2 + 64), "count");
    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v4);
    if (v3)

  }
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (v5 && objc_msgSend(v5, "isRunning") && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    _ATLogCategoryiTunesSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "message link closed mid sync - cancelling active session", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setError:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "cancel");
  }
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("Capabilities"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("HostInfo"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("RequestingSync"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("SyncFailed"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("FinishedSyncingMetadata"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("AssetMetrics"));
  objc_msgSend(*(id *)(a1 + 40), "removeHandlerForMessage:", CFSTR("SyncStatus"));
  objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "valueForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateStatusWithValue:forKey:", v9, CFSTR("ConnectedLibraries"));

}

void __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  _QWORD v11[5];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  ATGrappaDeviceInfo();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CF7690];
    v12 = CFSTR("GrappaSupportInfo");
    v13[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageWithName:parameters:", CFSTR("Capabilities"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_2;
    v11[3] = &unk_1E927E0D0;
    v7 = *(void **)(a1 + 32);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "sendMessage:withCompletion:", v6, v11);
  }
  else
  {
    _ATLogCategoryiTunesSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_ERROR, "Could not get grappa device info. Don't expect anything to work properly after this point.", v10, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0CF2228], "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "valueForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateStatusWithValue:forKey:", v9, CFSTR("ConnectedLibraries"));

}

void __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  if (!a2)
  {
    block[5] = v2;
    block[6] = v3;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_3;
    block[3] = &unk_1E927E120;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendInstalledAssets");
  objc_msgSend(*(id *)(a1 + 32), "_sendDiskUsage");
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncAllowed");
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_2;
  v27[3] = &unk_1E927DAF0;
  v3 = *(void **)(a1 + 32);
  v27[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setHandlerForMessage:handler:", CFSTR("Capabilities"), v27);
  v26[0] = v2;
  v26[1] = 3221225472;
  v26[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_4;
  v26[3] = &unk_1E927DAF0;
  v4 = *(void **)(a1 + 32);
  v26[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setHandlerForMessage:handler:", CFSTR("HostInfo"), v26);
  v25[0] = v2;
  v25[1] = 3221225472;
  v25[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_6;
  v25[3] = &unk_1E927DAF0;
  v5 = *(void **)(a1 + 32);
  v25[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "setHandlerForMessage:handler:", CFSTR("RequestingSync"), v25);
  v24[0] = v2;
  v24[1] = 3221225472;
  v24[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_8;
  v24[3] = &unk_1E927DAF0;
  v6 = *(void **)(a1 + 32);
  v24[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "setHandlerForMessage:handler:", CFSTR("SyncFailed"), v24);
  v23[0] = v2;
  v23[1] = 3221225472;
  v23[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_10;
  v23[3] = &unk_1E927DAF0;
  v7 = *(void **)(a1 + 32);
  v23[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "setHandlerForMessage:handler:", CFSTR("FinishedSyncingMetadata"), v23);
  v22[0] = v2;
  v22[1] = 3221225472;
  v22[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_12;
  v22[3] = &unk_1E927DAF0;
  v8 = *(void **)(a1 + 32);
  v22[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "setHandlerForMessage:handler:", CFSTR("AssetMetrics"), v22);
  v21[0] = v2;
  v21[1] = 3221225472;
  v21[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_14;
  v21[3] = &unk_1E927DAF0;
  v9 = *(void **)(a1 + 32);
  v21[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "setHandlerForMessage:handler:", CFSTR("SyncStatus"), v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allClients", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "registerMessageHandlersWithLink:", *(_QWORD *)(a1 + 32));
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v12);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "addObject:", *(_QWORD *)(a1 + 32));
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_3;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_5;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_7;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_9;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_11;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_13;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_15;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSyncStatusMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAssetMetricsMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishedSyncingMetadataMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSyncFailedMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestingSyncMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleHostInfoMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCapabilitiesMessage:fromLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

_QWORD *__53__ATLegacyDeviceSyncManager_cancelSyncOnMessageLink___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_QWORD *)(v1 + 72) == result[5])
  {
    result = *(_QWORD **)(v1 + 208);
    if (result)
      return (_QWORD *)objc_msgSend(result, "cancel");
  }
  return result;
}

void __66__ATLegacyDeviceSyncManager_initiateSyncForLibrary_onMessageLink___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("ATLegacyDeviceSyncManager.m"), 119, &stru_1E927E4E0);

  }
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("RequestingSync"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessage:withCompletion:", v4, 0);

}

uint64_t __33__ATLegacyDeviceSyncManager_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_sendSyncAllowed");
  return result;
}

+ (id)legacyDeviceSyncManager
{
  return objc_alloc_init(ATLegacyDeviceSyncManager);
}

@end
