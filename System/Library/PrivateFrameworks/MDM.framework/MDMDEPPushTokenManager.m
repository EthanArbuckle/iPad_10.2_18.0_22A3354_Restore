@implementation MDMDEPPushTokenManager

- (MDMDEPPushTokenManager)initWithPushServiceManager:(id)a3
{
  id v5;
  MDMDEPPushTokenManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workerQueue;
  uint64_t v9;
  DMCNetworkMonitor *networkMonitor;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMDEPPushTokenManager;
  v6 = -[MDMDEPPushTokenManager init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("MDMDEPPushTokenManager_worker_queue", 0);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_pushServiceManager, a3);
    v9 = objc_opt_new();
    networkMonitor = v6->_networkMonitor;
    v6->_networkMonitor = (DMCNetworkMonitor *)v9;

    v6->_syncInterval = 300.0;
  }

  return v6;
}

- (void)startMonitoringDEPPushTokenChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Start monitoring for app push token changes...", v6, 2u);
  }
  -[MDMDEPPushTokenManager pushServiceManager](self, "pushServiceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startListeningForDEPPushMessage");

  -[MDMDEPPushTokenManager pushServiceManager](self, "pushServiceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestAppTokenForTopic:environment:", 0x24EB6D660, 0);

}

- (id)depPushToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[MDMDEPPushTokenManager workerQueue](self, "workerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__MDMDEPPushTokenManager_depPushToken__block_invoke;
  v6[3] = &unk_24EB68168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__MDMDEPPushTokenManager_depPushToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__MDMDEPPushTokenManager_syncDEPPushTokenWithCompletion___block_invoke;
  v6[3] = &unk_24EB68190;
  v7 = v4;
  v5 = v4;
  -[MDMDEPPushTokenManager _syncPushTokenShouldForce:shouldScheduleRetry:completionHandler:](self, "_syncPushTokenShouldForce:shouldScheduleRetry:completionHandler:", 1, 0, v6);

}

uint64_t __57__MDMDEPPushTokenManager_syncDEPPushTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_queue_appTokenNeedsToBeSynced
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshDetailsFromDisk");

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastDEPPushTokenHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMDEPPushTokenManager appToken](self, "appToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DMCSHA256Hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToData:", v5) ^ 1;

  return v8;
}

- (void)_syncPushTokenShouldForce:(BOOL)a3 shouldScheduleRetry:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  -[MDMDEPPushTokenManager workerQueue](self, "workerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke;
  block[3] = &unk_24EB68208;
  block[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(v9, block);

}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int16 v6;

  objc_msgSend(*(id *)(a1 + 32), "networkMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2;
  v4[3] = &unk_24EB68208;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_WORD *)(a1 + 48);
  objc_msgSend(v2, "waitForNetworkWithCompletionHandler:", v4);

}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  __int16 v6;

  objc_msgSend(*(id *)(a1 + 32), "workerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_3;
  block[3] = &unk_24EB68208;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_WORD *)(a1 + 48);
  dispatch_async(v2, block);

}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "appToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_queue_appTokenNeedsToBeSynced") & 1) != 0 || *(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v2, "DMCSHA256Hash");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_queue_setLastestPushTokenToSync:", v3);
      v4 = (void *)objc_opt_new();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_8;
      v11[3] = &unk_24EB681E0;
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v2;
      v13 = v3;
      v15 = *(_BYTE *)(a1 + 49);
      v14 = *(id *)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "syncDEPPushToken:pushTopic:completionBlock:", v12, 0x24EB6D660, v11);

    }
    else
    {
      v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Push token has been synced.", buf, 2u);
      }
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v10 + 16))(v10, 0, 0, 0);
    }
  }
  else
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Push token is not available.", buf, 2u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "_noPushTokenError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v8);

    }
  }

}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_8(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  char v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2_9;
  block[3] = &unk_24EB681B8;
  v21 = a2;
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v22 = *(_BYTE *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v19 = v11;
  v20 = *(id *)(a1 + 56);
  v12 = v8;
  v13 = v7;
  dispatch_async(v9, block);

}

uint64_t __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2_9(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t result;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v29 = v4;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Push token sync succeed. Response: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateCloudConfigurationWithLastPushTokenHash:", *(_QWORD *)(a1 + 56));

    v6 = (void *)objc_opt_new();
    v7 = &stru_24EB6A400;
    v23 = CFSTR("Token");
    v24 = CFSTR("Token hash");
    v8 = *(const __CFString **)(a1 + 48);
    if (!v8)
      v8 = &stru_24EB6A400;
    if (*(_QWORD *)(a1 + 56))
      v7 = *(const __CFString **)(a1 + 56);
    v9 = *MEMORY[0x24BE2A5A8];
    v25[0] = v8;
    v25[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v23, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logRegularEventForTopic:reason:details:", v9, CFSTR("App Push Token Synced"), v10, v23, v24);

    if (!*(_QWORD *)(a1 + 56)
      || (objc_msgSend(*(id *)(a1 + 64), "_queue_lastestPushTokenToSync"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToData:", *(_QWORD *)(a1 + 56)),
          v11,
          v12))
    {
      objc_msgSend(*(id *)(a1 + 64), "_queue_setLastestPushTokenToSync:", 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to upload push token with reponse: %{public}@, error: %{public}@", buf, 0x16u);
    }
    v15 = (void *)objc_opt_new();
    v17 = *(_QWORD *)(a1 + 40);
    v16 = *(const __CFString **)(a1 + 48);
    if (!v16)
      v16 = &stru_24EB6A400;
    v26[0] = CFSTR("Token");
    v26[1] = CFSTR("Token hash");
    v18 = *(const __CFString **)(a1 + 56);
    if (!v18)
      v18 = &stru_24EB6A400;
    v19 = *MEMORY[0x24BE2A5A8];
    v27[0] = v16;
    v27[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logErrorEventForTopic:reason:error:details:", v19, CFSTR("App Push Token Sync Failed"), v17, v20);

    if (*(_BYTE *)(a1 + 81))
    {
      v21 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v21, OS_LOG_TYPE_INFO, "MDMDEPPushTokenManager: Retrying push token sync...", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 64), "_retryPushTokenSync");
    }
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_retryPushTokenSync
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];

  -[MDMDEPPushTokenManager workerQueue](self, "workerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMDEPPushTokenManager syncInterval](self, "syncInterval");
  if (v4 <= 86400.0)
    v5 = v4;
  else
    v5 = 86400.0;
  -[MDMDEPPushTokenManager syncInterval](self, "syncInterval");
  if (v6 <= 86400.0)
    v7 = v6;
  else
    v7 = 86400.0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__MDMDEPPushTokenManager__retryPushTokenSync__block_invoke;
  v10[3] = &unk_24EB68230;
  v10[4] = self;
  +[MDMBackgroundTaskUtilities scheduleOneShotBackgroundTask:usingQueue:interval:gracePeriod:callback:](MDMBackgroundTaskUtilities, "scheduleOneShotBackgroundTask:usingQueue:interval:gracePeriod:callback:", CFSTR("com.apple.mdmd.MDMDEPPushTokenManager"), v3, v10, v5, v7);

  -[MDMDEPPushTokenManager syncInterval](self, "syncInterval");
  v9 = v8 + v8;
  if (v9 > 86400.0)
    v9 = 86400.0;
  -[MDMDEPPushTokenManager setSyncInterval:](self, "setSyncInterval:", v9);
}

uint64_t __45__MDMDEPPushTokenManager__retryPushTokenSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syncPushTokenShouldForce:shouldScheduleRetry:completionHandler:", 0, 1, 0);
}

- (void)_queue_setLastestPushTokenToSync:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v11 = CFSTR("LatestPushTokenHashToSync");
    v12 = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    MDMDEPTokenSyncActivitiesFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCWriteToBinaryFile:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MDMDEPTokenSyncActivitiesFilePath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "removeItemAtPath:error:", v8, &v10);
    v5 = v10;

    if (v5)
    {
      v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v5;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to remove DEP token sync activity file with error: %{public}@", buf, 0xCu);
      }
    }
  }

}

- (id)_queue_lastestPushTokenToSync
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCED8];
  MDMDEPTokenSyncActivitiesFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LatestPushTokenHashToSync"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_noPushTokenError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12127, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)pushServiceManager:(id)a3 didReceiveAppToken:(id)a4 forTopic:(id)a5 environment:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!a6 && objc_msgSend(v10, "isEqualToString:", 0x24EB6D660))
  {
    v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Received app token for topic: %{public}@, appToken: %{public}@", buf, 0x16u);
    }
    -[MDMDEPPushTokenManager workerQueue](self, "workerQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __85__MDMDEPPushTokenManager_pushServiceManager_didReceiveAppToken_forTopic_environment___block_invoke;
    v14[3] = &unk_24EB68258;
    v14[4] = self;
    v15 = v9;
    dispatch_async(v13, v14);

  }
}

void __85__MDMDEPPushTokenManager_pushServiceManager_didReceiveAppToken_forTopic_environment___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "appToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToData:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAppToken:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_syncPushTokenShouldForce:shouldScheduleRetry:completionHandler:", 0, 1, 0);
  }
}

- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint64_t v11;
  uint64_t v12;

  if (!a6)
  {
    v11 = v6;
    v12 = v7;
    if (objc_msgSend(a4, "isEqualToString:", 0x24EB6D660))
    {
      v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Received message from DEP server, fetching cloud config again...", v10, 2u);
      }
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retrieveAndStoreCloudConfigurationDetailsCompletionBlock:", &__block_literal_global_0);

    }
  }
}

void __92__MDMDEPPushTokenManager_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v2;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to retrieve & store cloud config with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshDetailsFromDisk");

  }
}

- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5
{
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315138;
      v9 = "-[MDMDEPPushTokenManager pushServiceManager:didReceivePublicToken:forEnvironment:]";
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEBUG, "MDMDEPPushTokenManager: %s", (uint8_t *)&v8, 0xCu);
    }
    -[MDMDEPPushTokenManager pushServiceManager](self, "pushServiceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestAppTokenForTopic:environment:", 0x24EB6D660, 0);

  }
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (MDMPushServiceManager)pushServiceManager
{
  return self->_pushServiceManager;
}

- (void)setPushServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_pushServiceManager, a3);
}

- (DMCNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (NSData)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
  objc_storeStrong((id *)&self->_appToken, a3);
}

- (double)syncInterval
{
  return self->_syncInterval;
}

- (void)setSyncInterval:(double)a3
{
  self->_syncInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_pushServiceManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
