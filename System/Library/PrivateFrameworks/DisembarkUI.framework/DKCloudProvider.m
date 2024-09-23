@implementation DKCloudProvider

- (DKCloudProvider)init
{
  DKCloudProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *progressQueue;
  BYBuddyDaemonCloudSyncClient *v5;
  BYBuddyDaemonCloudSyncClient *cloudSyncClient;
  NWPathEvaluator *v7;
  NWPathEvaluator *pathEvaluator;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  DKBackupProvider *v16;
  uint64_t v17;
  NSArray *backupProviders;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)DKCloudProvider;
  v2 = -[DKCloudProvider init](&v24, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.diskembarkui.progress", 0);
    progressQueue = v2->_progressQueue;
    v2->_progressQueue = (OS_dispatch_queue *)v3;

    v5 = (BYBuddyDaemonCloudSyncClient *)objc_alloc_init(MEMORY[0x24BE85878]);
    cloudSyncClient = v2->_cloudSyncClient;
    v2->_cloudSyncClient = v5;

    -[BYBuddyDaemonCloudSyncClient setDelegate:](v2->_cloudSyncClient, "setDelegate:", v2);
    v7 = (NWPathEvaluator *)objc_alloc_init(MEMORY[0x24BDE07E8]);
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_appleAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = -[DKBackupProvider initWithAccount:]([DKBackupProvider alloc], "initWithAccount:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
          objc_msgSend(v9, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    v17 = objc_msgSend(v9, "copy");
    backupProviders = v2->_backupProviders;
    v2->_backupProviders = (NSArray *)v17;

  }
  return v2;
}

- (unint64_t)isUploadSupportedForCurrentNetwork
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DKCloudProvider pathEvaluator](self, "pathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  v7 = 0;
  if (v6 && v6 != 4)
  {
    if (v6 == 2)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[DKCloudProvider backupProviders](self, "backupProviders", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isManualBackupOnCellularAllowed"))
            {

              v7 = 0;
              goto LABEL_20;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v10)
            continue;
          break;
        }
      }

      if (objc_msgSend(v4, "isExpensive"))
        v13 = 2;
      else
        v13 = 1;
    }
    else
    {
      v13 = 1;
    }
    if ((objc_msgSend(v4, "status") | 2) == 3)
      v7 = v13;
    else
      v7 = 0;
  }
LABEL_20:

  return v7;
}

- (void)hasDataToUpload:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, uint64_t);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[DKCloudProvider backupProviders](self, "backupProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "isBackupEnabled"))
          {
            v4[2](v4, 1);

            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[DKCloudProvider cloudSyncClient](self, "cloudSyncClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __35__DKCloudProvider_hasDataToUpload___block_invoke;
    v13[3] = &unk_24F20E310;
    v14 = v4;
    objc_msgSend(v12, "needsToSync:", v13);

  }
  else
  {
    v4[2](v4, 0);
  }
LABEL_13:

}

void __35__DKCloudProvider_hasDataToUpload___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__DKCloudProvider_hasDataToUpload___block_invoke_2;
  v3[3] = &unk_24F20E2E8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __35__DKCloudProvider_hasDataToUpload___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) != 0);
}

- (BOOL)isRestoring
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[DKCloudProvider backupProviders](self, "backupProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isRestoring") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)beginUploadAllowingExpensiveCellular:(BOOL)a3 progressHandler:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];
  _QWORD v20[5];
  _QWORD block[5];
  id v22;
  id v23;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke;
  block[3] = &unk_24F20E338;
  block[4] = self;
  v22 = v8;
  v23 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[DKCloudProvider progressQueue](self, "progressQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke_2;
  v20[3] = &unk_24F20DE18;
  v20[4] = self;
  dispatch_async(v13, v20);

  _DKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_229405000, v14, OS_LOG_TYPE_DEFAULT, "Beginning cloud upload...", v19, 2u);
  }

  _DKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_229405000, v15, OS_LOG_TYPE_DEFAULT, "Starting backup(s)...", v19, 2u);
  }

  -[DKCloudProvider backupProviders](self, "backupProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKCloudProvider _startBackupWithProviders:allowExpensiveCellular:](self, "_startBackupWithProviders:allowExpensiveCellular:", v16, v6);

  _DKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_229405000, v17, OS_LOG_TYPE_DEFAULT, "Starting sync...", v19, 2u);
  }

  -[DKCloudProvider cloudSyncClient](self, "cloudSyncClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startSync");

}

uint64_t __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProgressHandler:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletion:", *(_QWORD *)(a1 + 48));
}

uint64_t __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setTimeRemaining:", 0.0);
  v2 = (void *)MEMORY[0x24BDD1768];
  objc_msgSend(*(id *)(a1 + 32), "backupProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressWithTotalUnitCount:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackupProgress:", v4);

  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSyncProgress:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackupResults:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSyncErrors:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNotifiedCompletion:", 0);
}

- (void)cancelUpload
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[16];
  _QWORD block[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[DKCloudProvider progressQueue](self, "progressQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DKCloudProvider_cancelUpload__block_invoke;
  block[3] = &unk_24F20DE18;
  block[4] = self;
  dispatch_async(v3, block);

  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling backup(s)...", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[DKCloudProvider backupProviders](self, "backupProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "cancel");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

  _DKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling sync...", buf, 2u);
  }

  -[DKCloudProvider cloudSyncClient](self, "cloudSyncClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelSync");

}

uint64_t __31__DKCloudProvider_cancelUpload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNotifiedCompletion:", 1);
}

- (void)_startBackupWithProviders:(id)a3 allowExpensiveCellular:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    -[DKCloudProvider _startBackupForProvider:remainingProviders:allowExpensiveCellular:](self, "_startBackupForProvider:remainingProviders:allowExpensiveCellular:", v8, v7, v4);

  }
  else
  {
    _DKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_229405000, v9, OS_LOG_TYPE_DEFAULT, "All backups complete!", v10, 2u);
    }

    -[DKCloudProvider _communicateProgress](self, "_communicateProgress");
  }

}

- (void)_startBackupForProvider:(id)a3 remainingProviders:(id)a4 allowExpensiveCellular:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[5];
  id v26;
  id v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKCloudProvider progressQueue](self, "progressQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke;
  block[3] = &unk_24F20DD78;
  block[4] = self;
  v13 = v8;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  dispatch_async(v11, block);

  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_2;
  v23[3] = &unk_24F20E388;
  v23[4] = self;
  v24 = v14;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_4;
  v18[3] = &unk_24F20E3D8;
  v18[4] = self;
  v19 = v13;
  v20 = v24;
  v21 = v9;
  v22 = v5;
  v15 = v9;
  v16 = v24;
  v17 = v13;
  objc_msgSend(v17, "startBackupWithExpensiveCellularAllowed:progressHandler:completionHandler:", v5, v23, v18);

}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentBackupProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "backupProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addChild:withPendingUnitCount:", *(_QWORD *)(a1 + 48), 1);

}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_2(uint64_t a1, uint64_t a2, float a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  float v16;

  objc_msgSend(*(id *)(a1 + 32), "progressQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_3;
  v12 = &unk_24F20E360;
  v7 = *(id *)(a1 + 40);
  v16 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = a2;
  dispatch_async(v6, &v9);

  objc_msgSend(*(id *)(a1 + 32), "_communicateProgress", v9, v10, v11, v12);
}

uint64_t __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(float)(*(float *)(a1 + 56) * 100.0));
  return objc_msgSend(*(id *)(a1 + 40), "setTimeRemaining:", (double)*(unint64_t *)(a1 + 48) * 60.0);
}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "progressQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_5;
  v10 = &unk_24F20E3B0;
  v5 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v3;
  v14 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v4, &v7);

  objc_msgSend(*(id *)(a1 + 32), "_communicateProgress", v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "_startBackupWithProviders:allowExpensiveCellular:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "currentBackupProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "currentBackupProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "account");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "backupResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[DKCloudUploadResult resultWithAccount:success:error:](DKCloudUploadResult, "resultWithAccount:success:error:", v5, *(_QWORD *)(a1 + 48) == 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentBackupProvider:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
  }
}

- (void)_communicateProgress
{
  NSObject *v3;
  _QWORD block[5];

  -[DKCloudProvider progressQueue](self, "progressQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__DKCloudProvider__communicateProgress__block_invoke;
  block[3] = &unk_24F20DE18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__DKCloudProvider__communicateProgress__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[6];
  int v21;
  _QWORD v22[5];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "notifiedCompletion") & 1) != 0)
    goto LABEL_8;
  objc_msgSend(*v1, "backupProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFinished") & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(*v1, "syncProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  if (!v4)
  {
LABEL_8:
    objc_msgSend(*v1, "backupProgress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fractionCompleted");
    v11 = v10;
    objc_msgSend(*v1, "syncProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fractionCompleted");
    *(float *)&v11 = v13 * 0.25 + v11 * 0.75;

    objc_msgSend(*v1, "timeRemaining");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __39__DKCloudProvider__communicateProgress__block_invoke_2;
    v20[3] = &unk_24F20E400;
    v20[4] = *v1;
    v21 = LODWORD(v11);
    v20[5] = v14;
    v15 = v20;
    goto LABEL_9;
  }
  objc_msgSend(*v1, "setNotifiedCompletion:", 1);
  objc_msgSend(*v1, "syncErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  _DKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__DKCloudProvider__communicateProgress__block_invoke_cold_2(v1);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v8, OS_LOG_TYPE_DEFAULT, "Sync completed successfully!", buf, 2u);
  }

  objc_msgSend(*v1, "backupResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  _DKLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __39__DKCloudProvider__communicateProgress__block_invoke_cold_1(v1);
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v19, OS_LOG_TYPE_DEFAULT, "Backup(s) completed successfully!", buf, 2u);
  }

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __39__DKCloudProvider__communicateProgress__block_invoke_11;
  v22[3] = &unk_24F20DE18;
  v22[4] = *v1;
  v15 = v22;
LABEL_9:
  dispatch_async(MEMORY[0x24BDAC9B8], v15);
}

void __39__DKCloudProvider__communicateProgress__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  DKCloudUploadResults *v8;

  v8 = objc_alloc_init(DKCloudUploadResults);
  objc_msgSend(*(id *)(a1 + 32), "backupResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  -[DKCloudUploadResults setBackupResults:](v8, "setBackupResults:", v3);

  objc_msgSend(*(id *)(a1 + 32), "syncErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKCloudUploadResult resultWithSuccess:error:](DKCloudUploadResult, "resultWithSuccess:error:", objc_msgSend(v4, "count") == 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKCloudUploadResults setSyncResult:](v8, "setSyncResult:", v5);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, DKCloudUploadResults *))v7)[2](v7, v8);

  }
}

void __39__DKCloudProvider__communicateProgress__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(float, double);

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressHandler");
    v3 = (void (**)(float, double))objc_claimAutoreleasedReturnValue();
    v3[2](*(float *)(a1 + 48), *(double *)(a1 + 40));

  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DKCloudProvider progressQueue](self, "progressQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__DKCloudProvider_syncCompletedWithErrors___block_invoke;
  block[3] = &unk_24F20E428;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  -[DKCloudProvider _communicateProgress](self, "_communicateProgress");
}

void __43__DKCloudProvider_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setSyncErrors:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "syncProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "totalUnitCount");
  objc_msgSend(*(id *)(a1 + 32), "syncProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedUnitCount:", v2);

}

- (void)syncProgress:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[DKCloudProvider progressQueue](self, "progressQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__DKCloudProvider_syncProgress___block_invoke;
  v6[3] = &unk_24F20E450;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);

  -[DKCloudProvider _communicateProgress](self, "_communicateProgress");
}

void __32__DKCloudProvider_syncProgress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = (uint64_t)(*(double *)(a1 + 40) * 100.0);
  objc_msgSend(*(id *)(a1 + 32), "syncProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", v1);

}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)backupProviders
{
  return self->_backupProviders;
}

- (void)setBackupProviders:(id)a3
{
  objc_storeStrong((id *)&self->_backupProviders, a3);
}

- (DKBackupProvider)currentBackupProvider
{
  return self->_currentBackupProvider;
}

- (void)setCurrentBackupProvider:(id)a3
{
  objc_storeStrong((id *)&self->_currentBackupProvider, a3);
}

- (BYBuddyDaemonCloudSyncClient)cloudSyncClient
{
  return self->_cloudSyncClient;
}

- (void)setCloudSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncClient, a3);
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSProgress)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(id)a3
{
  objc_storeStrong((id *)&self->_backupProgress, a3);
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(id)a3
{
  objc_storeStrong((id *)&self->_syncProgress, a3);
}

- (NSMutableArray)backupResults
{
  return self->_backupResults;
}

- (void)setBackupResults:(id)a3
{
  objc_storeStrong((id *)&self->_backupResults, a3);
}

- (NSArray)syncErrors
{
  return self->_syncErrors;
}

- (void)setSyncErrors:(id)a3
{
  objc_storeStrong((id *)&self->_syncErrors, a3);
}

- (BOOL)notifiedCompletion
{
  return self->_notifiedCompletion;
}

- (void)setNotifiedCompletion:(BOOL)a3
{
  self->_notifiedCompletion = a3;
}

- (OS_dispatch_queue)progressQueue
{
  return self->_progressQueue;
}

- (void)setProgressQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_syncErrors, 0);
  objc_storeStrong((id *)&self->_backupResults, 0);
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong((id *)&self->_backupProgress, 0);
  objc_storeStrong((id *)&self->_cloudSyncClient, 0);
  objc_storeStrong((id *)&self->_currentBackupProvider, 0);
  objc_storeStrong((id *)&self->_backupProviders, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

void __39__DKCloudProvider__communicateProgress__block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "backupResults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_229405000, v2, v3, "Backup(s) completed with errors: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __39__DKCloudProvider__communicateProgress__block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "syncErrors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_229405000, v2, v3, "Sync completed with errors: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
