@implementation MTIDSyncEngine

- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTIDSyncEngine *v14;
  MTIDSyncEngine *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MTIDSyncEngine;
  v14 = -[MTIDSyncEngine init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    -[MTIDSyncEngine setQueue:](v14, "setQueue:", v12);
    -[MTIDSyncEngine setDelegate:](v15, "setDelegate:", v13);
    -[MTIDSyncEngine setZoneID:](v15, "setZoneID:", v11);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSyncEngine setQueuedRecordIDs:](v15, "setQueuedRecordIDs:", v16);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSyncEngine setPendingRecordIDs:](v15, "setPendingRecordIDs:", v17);

    -[MTIDSyncEngine setupContainerWithIdentifier:](v15, "setupContainerWithIdentifier:", v10);
    -[MTIDSyncEngine setQualityOfService:](v15, "setQualityOfService:", 17);
  }

  return v15;
}

- (void)setupContainerWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_accountDidChange_, *MEMORY[0x24BDB8E60], 0);

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "useCloudKitSandbox"))
    v8 = 2;
  else
    v8 = 1;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9038]), "initWithContainerIdentifier:environment:", v5, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v9);
  -[MTIDSyncEngine setContainer:](self, "setContainer:", v10);

  -[MTIDSyncEngine container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "environment");

  if (v13 == 2)
  {
    MTMetricsKitOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20D758000, v14, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService is using iCloud container in the sandbox environment", v15, 2u);
    }

  }
}

- (void)accountDidChange:(id)a3
{
  id v4;
  MTIDSyncEngine *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[MTIDSyncEngine state](v5, "state") == 2)
  {
    MTMetricsKitOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Restarting ID sync engine because account has changed", v7, 2u);
    }

    -[MTIDSyncEngine setState:](v5, "setState:", 0);
    -[MTIDSyncEngine startEngine](v5, "startEngine");
  }
  objc_sync_exit(v5);

}

- (void)setState:(int64_t)a3
{
  void *v4;
  void *v5;
  MTIDSyncEngine *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_state = a3;
  if (!a3)
  {
    -[MTIDSyncEngine pendingRecordIDs](obj, "pendingRecordIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[MTIDSyncEngine queuedRecordIDs](obj, "queuedRecordIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[MTIDSyncEngine _endTransaction](obj, "_endTransaction");
  }
  objc_sync_exit(obj);

}

- (void)startEngine
{
  void *v2;
  MTIDSyncEngine *obj;
  _QWORD v4[4];
  id v5;
  id location;

  obj = self;
  objc_sync_enter(obj);
  if (-[MTIDSyncEngine state](obj, "state"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[MTIDSyncEngine setState:](obj, "setState:", 1);
    objc_sync_exit(obj);

    objc_initWeak(&location, obj);
    -[MTIDSyncEngine container](obj, "container");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __29__MTIDSyncEngine_startEngine__block_invoke;
    v4[3] = &unk_24C7A19F8;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v2, "fetchUserRecordIDWithCompletionHandler:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __29__MTIDSyncEngine_startEngine__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;
  id WeakRetained;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v11 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "handleUserRecordID:", v5);

    v13 = objc_loadWeakRetained(v11);
    objc_msgSend(v13, "container");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __29__MTIDSyncEngine_startEngine__block_invoke_2;
    v15[3] = &unk_24C7A19D0;
    objc_copyWeak(&v16, v11);
    objc_msgSend(v14, "accountInfoWithCompletionHandler:", v15);

    objc_destroyWeak(&v16);
    goto LABEL_8;
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDB8EA8]))
    goto LABEL_5;
  v9 = objc_msgSend(v7, "code");

  if (v9 == 9)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v8, "handleUserRecordID:", 0);
LABEL_5:

  }
  v10 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v10, "handleEngineStartedWithError:", v7);

LABEL_8:
}

void __29__MTIDSyncEngine_startEngine__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id WeakRetained;
  _QWORD v32[4];
  id v33;
  id v34;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
LABEL_8:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "handleEngineStartedWithError:", v8);

    goto LABEL_9;
  }
  if (objc_msgSend(v5, "accountStatus") == 1)
  {
    if ((objc_msgSend(v5, "supportsDeviceToDeviceEncryption") & 1) == 0)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v9, "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MTError(702, CFSTR("iCloud account for container %@ doesn't support device to device encryption"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_8;
    }
  }
  else
  {
    v24 = objc_msgSend(v5, "accountStatus");
    MTError(701, CFSTR("iCloud account is not available. Account status: %ld"), v25, v26, v27, v28, v29, v30, v24);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_8;
  }
  v18 = (id *)(a1 + 32);
  v19 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v19, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained(v18);
  objc_msgSend(v21, "container");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "privateCloudDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __29__MTIDSyncEngine_startEngine__block_invoke_3;
  v32[3] = &unk_24C7A19A8;
  v8 = v20;
  v33 = v8;
  objc_copyWeak(&v34, v18);
  objc_msgSend(v23, "fetchRecordZoneWithID:completionHandler:", v8, v32);

  objc_destroyWeak(&v34);
LABEL_9:

}

void __29__MTIDSyncEngine_startEngine__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id WeakRetained;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDB8EA8]))
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 != 26)
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "handleEngineStartedWithError:", v6);

    goto LABEL_8;
  }
  MTMetricsKitOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl(&dword_20D758000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Creating new zone with ID %@", buf, 0xCu);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91F0]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  v12 = (id *)(a1 + 40);
  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v13, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "privateCloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __29__MTIDSyncEngine_startEngine__block_invoke_10;
  v17[3] = &unk_24C7A1980;
  objc_copyWeak(&v18, v12);
  objc_msgSend(v15, "saveRecordZone:completionHandler:", v11, v17);

  objc_destroyWeak(&v18);
LABEL_8:

}

void __29__MTIDSyncEngine_startEngine__block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleEngineStartedWithError:", v4);

}

- (id)fetchRecordWithIDs:(id)a3
{
  id v4;
  MTPromise *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  MTPromise *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  MTPromise *v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc_init(MTPromise);
  MTMetricsKitOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with IDs", buf, 2u);
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB90E8]), "initWithRecordIDs:", v4);
  -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution](self, "applicationBundleIdentifierOverrideForNetworkAttribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v8);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37__MTIDSyncEngine_fetchRecordWithIDs___block_invoke;
  v14[3] = &unk_24C7A0E68;
  v10 = v5;
  v15 = v10;
  objc_msgSend(v7, "setFetchRecordsCompletionBlock:", v14);
  -[MTIDSyncEngine container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateCloudDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v7);

  return v10;
}

void __37__MTIDSyncEngine_fetchRecordWithIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v6)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with ID. error %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v7, v6);

}

- (void)fetchRecordWithID:(id)a3
{
  id v4;
  MTIDSyncEngine *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[MTIDSyncEngine state](v5, "state") == 2)
  {
    objc_sync_exit(v5);

    MTMetricsKitOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "recordName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching record with ID %@", buf, 0xCu);

    }
    -[MTIDSyncEngine addPendingRecordID:](v5, "addPendingRecordID:", v4);
    v8 = objc_alloc(MEMORY[0x24BDB90E8]);
    v18 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRecordIDs:", v9);

    -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution](v5, "applicationBundleIdentifierOverrideForNetworkAttribution");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v11);

    objc_initWeak((id *)buf, v5);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __36__MTIDSyncEngine_fetchRecordWithID___block_invoke;
    v15[3] = &unk_24C7A1A20;
    v16 = v4;
    objc_copyWeak(&v17, (id *)buf);
    objc_msgSend(v10, "setFetchRecordsCompletionBlock:", v15);
    -[MTIDSyncEngine container](v5, "container");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "privateCloudDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v10);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[MTIDSyncEngine startEngine](v5, "startEngine");
    objc_sync_exit(v5);

  }
}

void __36__MTIDSyncEngine_fetchRecordWithID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v7)
  {
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFetchedRecords:error:", v10, v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "handleFetchedRecords:error:", 0, v6);

  }
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "removePendingRecordID:", *(_QWORD *)(a1 + 32));

}

- (void)fetchAllRecords
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MTIDSyncEngine *obj;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id buf[2];
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  obj = self;
  objc_sync_enter(obj);
  if (-[MTIDSyncEngine state](obj, "state") == 2)
  {
    objc_sync_exit(obj);

    MTMetricsKitOSLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20D758000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: Started fetching all record changes", (uint8_t *)buf, 2u);
    }

    v3 = objc_alloc_init(MEMORY[0x24BDB90C0]);
    -[MTIDSyncEngine zoneID](obj, "zoneID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v4;
    v25[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BDB90C8]);
    -[MTIDSyncEngine zoneID](obj, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v8, v5);

    -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution](obj, "applicationBundleIdentifierOverrideForNetworkAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v10);

    objc_initWeak(buf, obj);
    v12 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke;
    v20[3] = &unk_24C7A1A48;
    objc_copyWeak(&v21, buf);
    objc_msgSend(v9, "setRecordChangedBlock:", v20);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke_2;
    v18[3] = &unk_24C7A1A70;
    objc_copyWeak(&v19, buf);
    objc_msgSend(v9, "setRecordWithIDWasDeletedBlock:", v18);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __33__MTIDSyncEngine_fetchAllRecords__block_invoke_3;
    v16[3] = &unk_24C7A1A98;
    objc_copyWeak(&v17, buf);
    objc_msgSend(v9, "setRecordZoneFetchCompletionBlock:", v16);
    -[MTIDSyncEngine _beginTransaction](obj, "_beginTransaction");
    -[MTIDSyncEngine container](obj, "container");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "privateCloudDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v9);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);

  }
  else
  {
    -[MTIDSyncEngine startEngine](obj, "startEngine");
    objc_sync_exit(obj);

  }
}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleFetchedRecords:error:", v5, 0);
}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleDeletedRecordID:error:", v3, 0);

}

void __33__MTIDSyncEngine_fetchAllRecords__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pendingRecordIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "_endTransaction");

  }
}

- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4
{
  id v6;
  MTIDSyncEngine *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD block[5];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = self;
    objc_sync_enter(v7);
    if (-[MTIDSyncEngine qualityOfService](v7, "qualityOfService") < a4)
      -[MTIDSyncEngine setQualityOfService:](v7, "setQualityOfService:", a4);
    if (-[MTIDSyncEngine state](v7, "state") == 2)
    {
      -[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      -[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v6);

      if (!v9)
      {
        -[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          v13 = dispatch_time(0, 1000000000);
          -[MTIDSyncEngine queue](v7, "queue");
          v14 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __54__MTIDSyncEngine_saveRecordsWithIDs_qualityOfService___block_invoke;
          block[3] = &unk_24C7A0748;
          block[4] = v7;
          dispatch_after(v13, v14, block);

        }
      }
    }
    else
    {
      -[MTIDSyncEngine startEngine](v7, "startEngine");
    }
    objc_sync_exit(v7);

  }
}

uint64_t __54__MTIDSyncEngine_saveRecordsWithIDs_qualityOfService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commit");
}

- (void)commit
{
  MTIDSyncEngine *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[MTIDSyncEngine queuedRecordIDs](v2, "queuedRecordIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MTIDSyncEngine qualityOfService](v2, "qualityOfService");
  -[MTIDSyncEngine queuedRecordIDs](v2, "queuedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[MTIDSyncEngine setQualityOfService:](v2, "setQualityOfService:", 17);
  objc_sync_exit(v2);

  if (objc_msgSend(v4, "count"))
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218240;
      v9 = objc_msgSend(v4, "count");
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Started saving %ld records with qos %ld", (uint8_t *)&v8, 0x16u);
    }

    -[MTIDSyncEngine addRecordIDsToSave:recordIDsToDelete:qualityOfService:](v2, "addRecordIDsToSave:recordIDsToDelete:qualityOfService:", v4, 0, v5);
  }

}

- (void)deleteRecordsWithIDs:(id)a3
{
  -[MTIDSyncEngine addRecordIDsToSave:recordIDsToDelete:qualityOfService:](self, "addRecordIDsToSave:recordIDsToDelete:qualityOfService:", 0, a3, -1);
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5
{
  id v8;
  MTIDSyncEngine *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  int64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v27 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (-[MTIDSyncEngine state](v9, "state") == 2)
  {
    v26 = a5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14);
          -[MTIDSyncEngine delegate](v9, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "recordWithID:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[MTIDSyncEngine addPendingRecordID:](v9, "addPendingRecordID:", v15);
            objc_msgSend(v10, "addObject:", v17);
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v12);
    }

    objc_initWeak(&location, v9);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9158]), "initWithRecordsToSave:recordIDsToDelete:", v10, v27);
    objc_msgSend(v18, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setQualityOfService:", v26);

    -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution](v9, "applicationBundleIdentifierOverrideForNetworkAttribution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v20);

    objc_msgSend(v18, "setSavePolicy:", 0);
    objc_msgSend(v18, "setAtomic:", 0);
    v22 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke;
    v31[3] = &unk_24C7A1AC0;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v18, "setPerRecordCompletionBlock:", v31);
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke_2;
    v28[3] = &unk_24C7A1AE8;
    v23 = v10;
    v29 = v23;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v18, "setCompletionBlock:", v28);
    -[MTIDSyncEngine container](v9, "container");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "privateCloudDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addOperation:", v18);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
  else
  {
    -[MTIDSyncEngine startEngine](v9, "startEngine");
  }
  objc_sync_exit(v9);

}

void __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleSavedRecord:error:", v6, v5);

}

void __72__MTIDSyncEngine_addRecordIDsToSave_recordIDsToDelete_qualityOfService___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = (id *)(a1 + 40);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained(v6);
        objc_msgSend(v8, "recordID", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "removePendingRecordID:", v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)addPendingRecordID:(id)a3
{
  MTIDSyncEngine *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[MTIDSyncEngine _beginTransaction](v4, "_beginTransaction");
  objc_sync_exit(v4);

}

- (void)removePendingRecordID:(id)a3
{
  MTIDSyncEngine *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v8);

  -[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[MTIDSyncEngine _endTransaction](v4, "_endTransaction");
  objc_sync_exit(v4);

}

+ (double)transactionTimeout
{
  return *(double *)&_transactionTimeout;
}

+ (void)setTransactionTimeout:(double)a3
{
  _transactionTimeout = *(_QWORD *)&a3;
}

- (void)_beginTransaction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  -[MTIDSyncEngine transactions](self, "transactions");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)v12[5];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v12[5];
    v12[5] = v4;

    -[MTIDSyncEngine setTransactions:](self, "setTransactions:", v12[5]);
    v3 = (void *)v12[5];
  }
  if (!objc_msgSend(v3, "count"))
  {
    v6 = (void *)v12[5];
    v7 = (void *)os_transaction_create();
    objc_msgSend(v6, "addObject:", v7);

  }
  +[MTIDSyncEngine transactionTimeout](MTIDSyncEngine, "transactionTimeout");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MTIDSyncEngine__beginTransaction__block_invoke;
  block[3] = &unk_24C7A1B10;
  block[4] = &v11;
  dispatch_after(v9, MEMORY[0x24BDAC9B8], block);
  _Block_object_dispose(&v11, 8);

}

void __35__MTIDSyncEngine__beginTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_endTransaction
{
  id v2;

  -[MTIDSyncEngine transactions](self, "transactions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)handleUserRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTIDSyncEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__MTIDSyncEngine_handleUserRecordID___block_invoke;
  v7[3] = &unk_24C7A0F90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__MTIDSyncEngine_handleUserRecordID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDidChangeWithUserRecordID:", *(_QWORD *)(a1 + 40));

}

- (void)handleEngineStartedWithError:(id)a3
{
  id v4;
  MTIDSyncEngine *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTIDSyncEngine setState:](v5, "setState:", 2 * (v4 == 0));
  objc_sync_exit(v5);

  -[MTIDSyncEngine queue](v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__MTIDSyncEngine_handleEngineStartedWithError___block_invoke;
  v8[3] = &unk_24C7A0F90;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __47__MTIDSyncEngine_handleEngineStartedWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncEngineDidStartWithError:", *(_QWORD *)(a1 + 40));

}

- (void)handleSavedRecord:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  MTIDSyncEngine *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB8EA8];
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDB8EA8]))
  {
    v10 = objc_msgSend(v7, "code");

    if (v10 == 14)
    {
      objc_msgSend(v7, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F10]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        MTMetricsKitOSLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v6, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v15;
          _os_log_impl(&dword_20D758000, v13, OS_LOG_TYPE_DEBUG, "MetricsKit: Server has a newer version of record with ID %@, use server record instead", buf, 0xCu);

        }
        v16 = v12;

        v7 = 0;
        v6 = v16;
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqual:", v9))
  {

    goto LABEL_13;
  }
  v18 = objc_msgSend(v7, "code");

  if (v18 == 11)
  {
    -[MTIDSyncEngine delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordWasDeleted:", v19);

LABEL_11:
  }
LABEL_13:
  -[MTIDSyncEngine queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__MTIDSyncEngine_handleSavedRecord_error___block_invoke;
  block[3] = &unk_24C7A08F8;
  v24 = v7;
  v25 = self;
  v26 = v6;
  v21 = v6;
  v22 = v7;
  dispatch_async(v20, block);

}

void __42__MTIDSyncEngine_handleSavedRecord_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    MTMetricsKitOSLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recordName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_20D758000, v2, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save record with ID %@ error %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordWasFailedToSave:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordWasSaved:", *(_QWORD *)(a1 + 48));

  }
}

- (void)handleFetchedRecords:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  MTIDSyncEngine *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with error %@", buf, 0xCu);
    }
  }
  else
  {
    -[MTIDSyncEngine queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__MTIDSyncEngine_handleFetchedRecords_error___block_invoke;
    v10[3] = &unk_24C7A0F90;
    v11 = v6;
    v12 = self;
    dispatch_async(v9, v10);

    v8 = v11;
  }

}

void __45__MTIDSyncEngine_handleFetchedRecords_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
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
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "delegate", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordWasFetched:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)handleDeletedRecordID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete record with ID %@ error %@", buf, 0x16u);

    }
  }
  else
  {
    -[MTIDSyncEngine queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__MTIDSyncEngine_handleDeletedRecordID_error___block_invoke;
    v11[3] = &unk_24C7A0F90;
    v11[4] = self;
    v12 = v6;
    dispatch_async(v10, v11);

  }
}

void __46__MTIDSyncEngine_handleDeletedRecordID_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordWasDeleted:", *(_QWORD *)(a1 + 40));

}

- (int64_t)state
{
  return self->_state;
}

- (MTIDSyncEngineDelegate)delegate
{
  return (MTIDSyncEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSMutableSet)queuedRecordIDs
{
  return self->_queuedRecordIDs;
}

- (void)setQueuedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_queuedRecordIDs, a3);
}

- (NSMutableSet)pendingRecordIDs
{
  return self->_pendingRecordIDs;
}

- (void)setPendingRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRecordIDs, a3);
}

- (NSMutableArray)transactions
{
  return (NSMutableArray *)objc_loadWeakRetained((id *)&self->_transactions);
}

- (void)setTransactions:(id)a3
{
  objc_storeWeak((id *)&self->_transactions, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactions);
  objc_storeStrong((id *)&self->_pendingRecordIDs, 0);
  objc_storeStrong((id *)&self->_queuedRecordIDs, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
