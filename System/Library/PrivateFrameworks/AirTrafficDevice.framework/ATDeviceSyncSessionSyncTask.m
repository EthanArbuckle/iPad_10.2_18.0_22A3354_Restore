@implementation ATDeviceSyncSessionSyncTask

- (ATDeviceSyncSessionSyncTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  id v7;
  ATDeviceSyncSessionSyncTask *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ATDeviceSettings *settings;
  uint64_t v13;
  NSMutableArray *streamReaders;
  void *v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATDeviceSyncSessionSyncTask;
  v8 = -[ATDeviceSyncSessionTask initWithDataClass:onMessageLink:](&v17, sel_initWithDataClass_onMessageLink_, v7, a4);
  if (v8)
  {
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientForDataclass:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EFC7B610) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("ATDeviceSyncSessionSyncTask.m"), 49, CFSTR("client for data class '%@' is not an ATSyncClient"), v7);

    }
    objc_storeWeak((id *)&v8->_pluginClient, v10);
    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    settings = v8->_settings;
    v8->_settings = (ATDeviceSettings *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    streamReaders = v8->_streamReaders;
    v8->_streamReaders = (NSMutableArray *)v13;

    v8->_startAssetTaskWhenFinished = 1;
    v8->_isFinishing = 0;
    v8->_addedTransportUpgradeException = 0;
    v8->_syncIterationCount = 0;
    v8->_totalItemsSyncedCount = 0;

  }
  return v8;
}

- (id)sessionGroupingKey
{
  return CFSTR("ATDeviceSyncSessionSyncTaskGroupingKey");
}

- (void)start
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  ATDeviceSyncSessionSyncTask *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  _ATLogCategoryDeviceSync();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "syncDataClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Task starting for %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_taskStartTime = v6;
  -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "endpointType");

  if (!v8)
  {
    -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATDeviceSyncSessionSyncTask _sendSyncRequestOnMessageLink:](self, "_sendSyncRequestOnMessageLink:", v9);

  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionSyncTask_cancel__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryDeviceSync();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "command");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = self;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = v10;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: received request %{public}@. params=%{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "command");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Sync"));

  if (v12)
  {
    -[ATDeviceSyncSessionSyncTask _processSyncRequest:onMessageLink:](self, "_processSyncRequest:onMessageLink:", v7, v6);
  }
  else
  {
    objc_msgSend(v7, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("UpdateSyncSessionTask"));

    if (v14)
    {
      objc_msgSend(v7, "parameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueForKey:", CFSTR("_CompletedItemCount"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongLongValue");

      objc_msgSend(v7, "parameters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:", CFSTR("_TotalItemCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedLongLongValue");

      -[ATDeviceSyncSessionSyncTask _updateProgressWithCount:totalItemCount:forEndpointType:](self, "_updateProgressWithCount:totalItemCount:forEndpointType:", v17, v20, 0);
      objc_msgSend(v7, "responseWithError:parameters:", 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendResponse:withCompletion:", v21, 0);

    }
    else
    {
      objc_msgSend(v7, "command");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("SyncTaskFinished"));

      if (v23)
      {
        objc_msgSend(v7, "parameters");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("_SyncTaskFinishedResult"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v24, "objectForKey:", CFSTR("_SyncTaskFinishedResult"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("ATError"), objc_msgSend(v27, "integerValue"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v24, "objectForKey:", CFSTR("_SyncTaskFinishedSyncAssets"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v24, "objectForKey:", CFSTR("_SyncTaskFinishedSyncAssets"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATDeviceSyncSessionSyncTask setStartAssetTaskWhenFinished:](self, "setStartAssetTaskWhenFinished:", objc_msgSend(v29, "BOOLValue"));

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[ATDeviceSyncSessionSyncTask startAssetTaskWhenFinished](self, "startAssetTaskWhenFinished"))
          objc_msgSend(v30, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("_SyncTaskFinishedSyncAssets"));
        objc_msgSend(v7, "responseWithError:parameters:", 0, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __61__ATDeviceSyncSessionSyncTask_messageLink_didReceiveRequest___block_invoke;
        v33[3] = &unk_1E927D638;
        v33[4] = self;
        v34 = v6;
        v35 = v25;
        v32 = v25;
        objc_msgSend(v34, "sendResponse:withCompletion:", v31, v33);

      }
    }
  }

}

- (void)_finishSyncWithError:(id)a3
{
  id v4;
  ATDeviceSettings *settings;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  settings = self->_settings;
  -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings updateLastSyncTimeForLibrary:dataClass:](settings, "updateLastSyncTimeForLibrary:dataClass:", v7, v8);

  _ATLogCategoryDeviceSync();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: finishSyncWithError. err=%{public}@", buf, 0x16u);
  }

  -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "endpointType");

  if (v11)
  {
    -[ATDeviceSyncSessionSyncTask _finishTaskWithError:](self, "_finishTaskWithError:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("_SyncTaskFinishedResult"));

    }
    if (!-[ATDeviceSyncSessionSyncTask startAssetTaskWhenFinished](self, "startAssetTaskWhenFinished"))
      objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("_SyncTaskFinishedSyncAssets"));
    v14 = objc_alloc(MEMORY[0x1E0CF76A0]);
    -[ATSessionTask dataClass](self, "dataClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCommand:dataClass:parameters:", CFSTR("SyncTaskFinished"), v15, v12);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__ATDeviceSyncSessionSyncTask__finishSyncWithError___block_invoke;
    v17[3] = &unk_1E927D660;
    v17[4] = self;
    v18 = v4;
    -[ATDeviceSyncSessionTask sendRequest:withCompletion:](self, "sendRequest:withCompletion:", v16, v17);

  }
}

- (void)_finishTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATDeviceSyncSessionAssetTask *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  _BOOL4 startAssetTaskWhenFinished;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4 && self->_startAssetTaskWhenFinished)
  {
    if ((objc_msgSend(v6, "isCancelled") & 1) == 0
      && (objc_msgSend(v7, "isFinished") & 1) == 0
      && objc_msgSend(v5, "isOpen"))
    {
      v8 = [ATDeviceSyncSessionAssetTask alloc];
      -[ATSessionTask dataClass](self, "dataClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ATDeviceSyncSessionAssetTask initWithDataClass:onMessageLink:](v8, "initWithDataClass:onMessageLink:", v9, v5);

      v38[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSessionTasks:", v11);

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    _ATLogCategoryDeviceSync();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      startAssetTaskWhenFinished = self->_startAssetTaskWhenFinished;
      *(_DWORD *)buf = 138544386;
      v27 = self;
      v28 = 1024;
      v29 = startAssetTaskWhenFinished;
      v30 = 1024;
      v31 = objc_msgSend(v7, "isCancelled");
      v32 = 1024;
      v33 = objc_msgSend(v7, "isFinished");
      v34 = 1024;
      v35 = objc_msgSend(v5, "isOpen");
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: not starting asset task. syncAssets=%d, cancelled=%d, finished=%d, messageLinkOpen=%d", buf, 0x24u);
    }
    goto LABEL_12;
  }
  _ATLogCategoryDeviceSync();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = self->_startAssetTaskWhenFinished;
    v13 = objc_msgSend(v7, "isCancelled");
    v14 = objc_msgSend(v7, "isFinished");
    v15 = objc_msgSend(v5, "isOpen");
    objc_msgSend(v4, "msv_description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v27 = self;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = v13;
    v32 = 1024;
    v33 = v14;
    v34 = 1024;
    v35 = v15;
    v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_ERROR, "%{public}@: not starting asset task. syncAssets=%d, cancelled=%d, finished=%d, messageLinkOpen=%d error=%{public}@", buf, 0x2Eu);

  }
LABEL_12:

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke;
  v22[3] = &unk_1E927D688;
  v22[4] = self;
  v23 = v4;
  v24 = v5;
  v25 = v7;
  v19 = v7;
  v20 = v5;
  v21 = v4;
  dispatch_async(v18, v22);

}

- (void)_sendSyncRequestOnMessageLink:(id)a3
{
  id v4;
  ATDeviceSettings *settings;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  int v14;
  ATDeviceSyncSessionSyncTask *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  settings = self->_settings;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryDeviceSync();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: sending sync request. syncState=%{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    if (objc_msgSend(v8, "lastServerRevision"))
      v10 = 1;
    else
      v10 = 2;
    v11 = objc_msgSend(v8, "lastClientRevision");
    WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
    v13 = objc_msgSend(WeakRetained, "currentRevision");

  }
  else
  {
    v13 = 0;
    v11 = 0;
    v10 = 2;
  }
  -[ATDeviceSyncSessionSyncTask _sendSyncRequestWithChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:](self, "_sendSyncRequestWithChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", v11, v13, v13, v10, v4);

}

- (void)_sendSyncRequestWithChangesAfterRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 onMessageLink:(id)a7
{
  id v11;
  ATDeviceSettings *settings;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  SEL v42;
  unsigned int v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  settings = self->_settings;
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  objc_msgSend(WeakRetained, "revisionVersionToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
    goto LABEL_9;
  objc_msgSend(v15, "versionToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = v17 == 0;
  else
    v20 = 1;
  if (v20)
  {

  }
  else
  {
    objc_msgSend(v15, "versionToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "isEqualToString:", v21);

    if ((v22 & 1) != 0)
    {
LABEL_9:
      _ATLogCategoryDeviceSync();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATSessionTask dataClass](self, "dataClass");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v47 = self;
        v48 = 2114;
        v49 = v24;
        v50 = 2114;
        v51 = v25;
        v52 = 2048;
        v53 = a3;
        v54 = 2048;
        v55 = a4;
        v56 = 2114;
        v57 = v15;
        _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: building sync request. library=%{public}@, dataclass=%{public}@, fromRevision=%lld, toRevision=%lld. current sync state=%{public}@", buf, 0x3Eu);

      }
      ++self->_syncIterationCount;
      -[ATDeviceSyncSessionTask queue](self, "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_94;
      block[3] = &unk_1E927D6D8;
      v43 = a6;
      v27 = &v36;
      block[4] = self;
      v36 = v11;
      v39 = a3;
      v40 = a4;
      v37 = v15;
      v41 = a5;
      v38 = v17;
      v42 = a2;
      v28 = v11;
      dispatch_async(v26, block);

      v29 = v37;
      goto LABEL_15;
    }
  }
  _ATLogCategoryDeviceSync();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "versionToken");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = self;
    v48 = 2114;
    v49 = v31;
    v50 = 2114;
    v51 = v17;
    _os_log_impl(&dword_1D1868000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: library version token has changed from %{public}@ to %{public}@ - forcing reset", buf, 0x20u);

  }
  objc_msgSend(v11, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke;
  v44[3] = &unk_1E927E1C0;
  v27 = &v45;
  v44[4] = self;
  v45 = v11;
  v32 = v11;
  -[ATDeviceSyncSessionSyncTask _resetSyncDataForLibrary:withCompletionHandler:](self, "_resetSyncDataForLibrary:withCompletionHandler:", v29, v44);
LABEL_15:

}

- (void)_sendSyncRequestWithParams:(id)a3 withSyncType:(unsigned int)a4 syncState:(id)a5 newRevision:(unint64_t)a6 versionToken:(id)a7 inputStream:(id)a8 onMessageLink:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  ATDeviceSyncSessionSyncTask *v37;
  id v38;
  unint64_t v39;
  _QWORD v40[3];
  _QWORD v41[4];

  v12 = *(_QWORD *)&a4;
  v41[3] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v33 = a7;
  v16 = a9;
  v17 = (void *)MEMORY[0x1E0C99E08];
  v18 = a8;
  if (a3)
    objc_msgSend(v17, "dictionaryWithDictionary:", a3);
  else
    objc_msgSend(v17, "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("LibraryID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("SyncType"));

  v40[0] = CFSTR("LastServerRevision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "lastServerRevision"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v22;
  v40[1] = CFSTR("LastClientRevision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "lastClientRevision"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v23;
  v40[2] = CFSTR("NewRevisionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
  v24 = a6;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v26, CFSTR("SyncState"));

  v27 = objc_alloc(MEMORY[0x1E0CF76A0]);
  -[ATSessionTask dataClass](self, "dataClass");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithCommand:dataClass:parameters:", CFSTR("Sync"), v28, v19);

  objc_msgSend(v29, "setDataStream:", v18);
  objc_msgSend(v29, "setOptions:", 3);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __132__ATDeviceSyncSessionSyncTask__sendSyncRequestWithParams_withSyncType_syncState_newRevision_versionToken_inputStream_onMessageLink___block_invoke;
  v34[3] = &unk_1E927D718;
  v38 = v16;
  v39 = v24;
  v35 = v15;
  v36 = v33;
  v37 = self;
  v30 = v16;
  v31 = v33;
  v32 = v15;
  -[ATDeviceSyncSessionTask sendRequest:withCompletion:](self, "sendRequest:withCompletion:", v29, v34);

}

- (void)_processSyncResponse:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  ATDeviceSettings *settings;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id WeakRetained;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  ATDeviceSettings *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  ATDeviceSettings *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[5];
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isPartial") & 1) == 0)
  {
    settings = self->_settings;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask dataClass](self, "dataClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("SyncState"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("SyncType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
    objc_msgSend(WeakRetained, "revisionVersionToken");
    v44 = objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(WeakRetained, "currentRevision");
    _ATLogCategoryDeviceSync();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = self;
      v50 = 2114;
      v51 = v19;
      v52 = 2048;
      v53 = v17;
      v54 = 2114;
      v55 = v11;
      _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: processing sync response. library=%{public}@, currentRevision=%llu, syncState=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(v11, "versionToken");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v11, "versionToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", v44);

      if ((v23 & 1) == 0)
      {
        _ATLogCategoryDeviceSync();
        v36 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v44;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "versionToken");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = self;
          v50 = 2114;
          v51 = v37;
          v52 = 2114;
          v53 = v44;
          _os_log_impl(&dword_1D1868000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring sync response because the revision token has changed (%{public}@ -> %{public}@)", buf, 0x20u);

        }
        v38 = self->_settings;
        objc_msgSend(v7, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATSessionTask dataClass](self, "dataClass");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATDeviceSettings setSyncState:forLibrary:dataClass:](v38, "setSyncState:forLibrary:dataClass:", 0, v39, v40);

        objc_msgSend(v6, "dataStream");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke;
        v46[3] = &unk_1E927E1C0;
        v46[4] = self;
        v47 = v7;
        -[ATDeviceSyncSessionSyncTask _drainInputStream:withCompletion:](self, "_drainInputStream:withCompletion:", v41, v46);

        v24 = v43;
        goto LABEL_21;
      }
    }
    if (v15 == 2)
    {
      _ATLogCategoryDeviceSync();
      v42 = objc_claimAutoreleasedReturnValue();
      v24 = v43;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = self;
        _os_log_impl(&dword_1D1868000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: the server is requesting a reset sync - prepare for a full update", buf, 0xCu);
      }

    }
    else
    {
      v24 = v43;
      if (v15 == 1)
      {
        v25 = objc_msgSend(v43, "newRevision");
        if (v25 == objc_msgSend(v11, "lastServerRevision"))
        {
          _ATLogCategoryDeviceSync();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = self;
            v50 = 2114;
            v51 = v27;
            _os_log_impl(&dword_1D1868000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: sync complete for library %{public}@", buf, 0x16u);

          }
          v28 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v28, "setLastClientRevision:", objc_msgSend(v43, "lastClientRevision"));
          objc_msgSend(v28, "setVersionToken:", v44);
          _ATLogCategoryDeviceSync();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = self;
            v50 = 2114;
            v51 = v30;
            v52 = 2114;
            v53 = (uint64_t)v28;
            _os_log_impl(&dword_1D1868000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);

          }
          v31 = self->_settings;
          objc_msgSend(v7, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATSessionTask dataClass](self, "dataClass");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATDeviceSettings setSyncState:forLibrary:dataClass:](v31, "setSyncState:forLibrary:dataClass:", v28, v32, v33);

          objc_msgSend(v6, "dataStream");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke_117;
          v45[3] = &unk_1E927E0D0;
          v45[4] = self;
          -[ATDeviceSyncSessionSyncTask _drainInputStream:withCompletion:](self, "_drainInputStream:withCompletion:", v34, v45);

          v35 = (void *)v44;
          goto LABEL_21;
        }
      }
    }
    v35 = (void *)v44;
    -[ATDeviceSyncSessionSyncTask _applyChangesForSyncResponse:toCurrentRevision:versionToken:onMessageLink:](self, "_applyChangesForSyncResponse:toCurrentRevision:versionToken:onMessageLink:", v6, v17, v44, v7);
LABEL_21:

  }
}

- (void)_applyChangesForSyncResponse:(id)a3 toCurrentRevision:(unint64_t)a4 versionToken:(id)a5 onMessageLink:(id)a6
{
  id v9;
  id v10;
  id v11;
  ATDeviceSettings *settings;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  unint64_t v37;
  SEL v38;
  int v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  settings = self->_settings;
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("SyncState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("SyncType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke;
  block[3] = &unk_1E927D790;
  v39 = v20;
  block[4] = self;
  v30 = v11;
  v35 = v42;
  v36 = v40;
  v31 = v9;
  v32 = v15;
  v33 = v17;
  v34 = v10;
  v37 = a4;
  v38 = a2;
  v22 = v10;
  v23 = v17;
  v24 = v15;
  v25 = v9;
  v26 = v11;
  dispatch_async(v21, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

- (void)_processSyncRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ATDeviceSettings *settings;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id *v28;
  id *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  unint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  int v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[2];
  _QWORD v57[5];
  id v58;
  _QWORD v59[3];
  int v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[3];
  int v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[2];
  _QWORD v68[5];
  id v69;
  _QWORD v70[2];
  uint8_t buf[4];
  ATDeviceSyncSessionSyncTask *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ++self->_syncIterationCount;
  objc_msgSend(v6, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SyncState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  settings = self->_settings;
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  v15 = objc_msgSend(WeakRetained, "currentRevision");
  _ATLogCategoryDeviceSync();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "parameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v72 = self;
    v73 = 2114;
    v74 = v17;
    _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: received sync request. params=%{public}@", buf, 0x16u);

  }
  _ATLogCategoryDeviceSync();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v72 = self;
    v73 = 2114;
    v74 = v13;
    v75 = 2114;
    v76 = v9;
    v77 = 2048;
    v78 = v15;
    _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: syncState=%{public}@, requestSyncState=%{public}@, currentRevision=%llu", buf, 0x2Au);
  }
  v43 = v15;

  objc_msgSend(WeakRetained, "revisionVersionToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "versionToken");
  v20 = objc_claimAutoreleasedReturnValue();
  v45 = v9;
  if (v20
    && (v21 = (void *)v20,
        objc_msgSend(v13, "versionToken"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "isEqualToString:", v19),
        v22,
        v9 = v45,
        v21,
        (v23 & 1) == 0))
  {
    _ATLogCategoryDeviceSync();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "versionToken");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v72 = self;
      v73 = 2114;
      v74 = v36;
      v75 = 2114;
      v76 = v19;
      _os_log_impl(&dword_1D1868000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: library version token has changed from %{public}@ to %{public}@ - forcing reset", buf, 0x20u);

    }
    objc_msgSend(v6, "dataStream");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke;
    v68[3] = &unk_1E927D7B8;
    v68[4] = self;
    v28 = &v69;
    v69 = v6;
    v70[1] = v43;
    v29 = (id *)v70;
    v70[0] = v7;
    v30 = v68;
  }
  else
  {
    v24 = objc_msgSend(v9, "lastServerRevision");
    if (v24 <= objc_msgSend(v13, "lastServerRevision"))
    {
      objc_msgSend(v6, "parameters");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("SyncType"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "integerValue");

      if (v33 == 2)
      {
        v42 = 0;
        v34 = v45;
      }
      else
      {
        v34 = v45;
        v42 = objc_msgSend(v45, "lastServerRevision");
      }
      v37 = objc_msgSend(v34, "newRevision");
      if (v37 == objc_msgSend(v13, "lastClientRevision"))
      {
        _ATLogCategoryDeviceSync();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v72 = self;
          _os_log_impl(&dword_1D1868000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request data we've already applied", buf, 0xCu);
        }

        objc_msgSend(v6, "dataStream");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_124;
        v61[3] = &unk_1E927D7E0;
        v61[4] = self;
        v28 = &v62;
        v62 = v6;
        v63[1] = v42;
        v63[2] = v43;
        v64 = v33;
        v29 = (id *)v63;
        v63[0] = v7;
        v30 = v61;
      }
      else
      {
        v39 = objc_msgSend(v34, "lastClientRevision");
        if (v39 <= objc_msgSend(v13, "lastClientRevision"))
        {
          if (objc_msgSend(v34, "lastServerRevision") <= v43)
          {
            -[ATDeviceSyncSessionTask queue](self, "queue");
            v44 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_2;
            block[3] = &unk_1E927D858;
            block[4] = self;
            v53 = v33;
            v28 = &v47;
            v47 = v7;
            v29 = &v48;
            v48 = v6;
            v49 = v13;
            v50 = v34;
            v51 = v19;
            v52 = v42;
            dispatch_async(v44, block);

            v27 = v49;
            goto LABEL_30;
          }
          _ATLogCategoryDeviceSync();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v72 = self;
            _os_log_impl(&dword_1D1868000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: client has a newer revision than the server - forcing reset sync", buf, 0xCu);
          }

          objc_msgSend(v6, "dataStream");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_126;
          v54[3] = &unk_1E927D7B8;
          v54[4] = self;
          v28 = &v55;
          v55 = v6;
          v56[1] = v43;
          v29 = (id *)v56;
          v56[0] = v7;
          v30 = v54;
        }
        else
        {
          _ATLogCategoryDeviceSync();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v72 = self;
            _os_log_impl(&dword_1D1868000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request data because we are out of sync - draining request stream and respond with our current state", buf, 0xCu);
          }

          objc_msgSend(v6, "dataStream");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_125;
          v57[3] = &unk_1E927D7E0;
          v57[4] = self;
          v28 = &v58;
          v58 = v6;
          v59[1] = v42;
          v59[2] = v43;
          v60 = v33;
          v29 = (id *)v59;
          v59[0] = v7;
          v30 = v57;
        }
      }
    }
    else
    {
      _ATLogCategoryDeviceSync();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = self;
        v73 = 2114;
        v74 = v26;
        _os_log_impl(&dword_1D1868000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: server revision for %{public}@ has been reset - forcing reset", buf, 0x16u);

      }
      objc_msgSend(v6, "dataStream");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_123;
      v65[3] = &unk_1E927D7B8;
      v65[4] = self;
      v28 = &v66;
      v66 = v6;
      v67[1] = v43;
      v29 = (id *)v67;
      v67[0] = v7;
      v30 = v65;
    }
  }
  -[ATDeviceSyncSessionSyncTask _drainInputStream:withCompletion:](self, "_drainInputStream:withCompletion:", v27, v30);
LABEL_30:

}

- (void)_sendSyncResponseToRequest:(id)a3 withChangesAfterRevision:(unint64_t)a4 toRevision:(unint64_t)a5 withNewRevision:(unint64_t)a6 withSyncType:(unsigned int)a7 onMessageLink:(id)a8
{
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  SEL v26;
  unsigned int v27;

  v15 = a3;
  v16 = a8;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke;
  v20[3] = &unk_1E927D8F8;
  v27 = a7;
  v20[4] = self;
  v21 = v16;
  v22 = v15;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a2;
  v18 = v15;
  v19 = v16;
  dispatch_async(v17, v20);

}

- (void)_sendSyncResponseToRequest:(id)a3 withParams:(id)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 inputStream:(id)a7 onMessageLink:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  ATDeviceSettings *settings;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  unint64_t v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v10 = *(_QWORD *)&a6;
  v39[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a8;
  settings = self->_settings;
  v30 = a7;
  v16 = a3;
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask dataClass](self, "dataClass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings syncStateForLibrary:dataClass:](settings, "syncStateForLibrary:dataClass:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v13;
  if (v13)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("LibraryID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("SyncType"));

  v38[0] = CFSTR("LastServerRevision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "lastServerRevision"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v23;
  v38[1] = CFSTR("LastClientRevision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "lastClientRevision"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v24;
  v38[2] = CFSTR("NewRevisionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v26, CFSTR("SyncState"));

  objc_msgSend(v16, "responseWithError:parameters:", 0, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setDataStream:", v31);
  objc_msgSend(v27, "setOptions:", 3);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __124__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withParams_withNewRevision_withSyncType_inputStream_onMessageLink___block_invoke;
  v34[3] = &unk_1E927D7B8;
  v34[4] = self;
  v35 = v19;
  v36 = v14;
  v37 = a5;
  v28 = v14;
  v29 = v19;
  objc_msgSend(v28, "sendResponse:withCompletion:", v27, v34);

}

- (void)_resetSyncDataForLibrary:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__ATDeviceSyncSessionSyncTask__resetSyncDataForLibrary_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E927D920;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(WeakRetained, "resetSyncDataWithCompletion:", v11);

}

- (void)_drainInputStream:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = objc_alloc(MEMORY[0x1E0D4D0E8]);
    -[ATDeviceSyncSessionTask queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithInputStream:queue:", v6, v10);

    -[NSMutableArray addObject:](self->_streamReaders, "addObject:", v11);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke;
    v19[3] = &unk_1E927D948;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    v20 = v8;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_140;
    v17[3] = &unk_1E927D970;
    v13 = (id)MEMORY[0x1D8230780](v19);
    v18 = v13;
    objc_msgSend(v11, "setDidFinishReadingBlock:", v17);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_2;
    v15[3] = &unk_1E927D998;
    v14 = v13;
    v16 = v14;
    objc_msgSend(v11, "setDidEncounterErrorBlock:", v15);
    objc_msgSend(v11, "setDidReadDataBlock:", &__block_literal_global_3315);
    objc_msgSend(v11, "start");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)clientTotalItemCount forEndpointType:(int)a5
{
  unint64_t v5;
  unint64_t v6;
  objc_super v7;

  if (self->_syncIterationCount == 1)
  {
    if (a5 == 1)
    {
      self->_serverCurrentItemCount = a3;
      self->_serverTotalItemCount = clientTotalItemCount;
      if (self->_clientTotalItemCount)
        clientTotalItemCount = self->_clientTotalItemCount;
      self->_clientTotalItemCount = clientTotalItemCount;
    }
    else
    {
      self->_clientCurrentItemCount = a3;
      self->_clientTotalItemCount = clientTotalItemCount;
    }
    v5 = self->_clientCurrentItemCount + self->_serverCurrentItemCount;
    v6 = clientTotalItemCount + self->_serverTotalItemCount;
    v7.receiver = self;
    v7.super_class = (Class)ATDeviceSyncSessionSyncTask;
    -[ATDeviceSyncSessionTask updateProgressWithCount:totalItemCount:](&v7, sel_updateProgressWithCount_totalItemCount_, v5, v6);
  }
}

- (BOOL)startAssetTaskWhenFinished
{
  return self->_startAssetTaskWhenFinished;
}

- (void)setStartAssetTaskWhenFinished:(BOOL)a3
{
  self->_startAssetTaskWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamReaders, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_pluginClient);
}

void __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (v3 && !*((_BYTE *)v3 + 201))
  {
    objc_msgSend(v3, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(v4[24], "removeObject:", WeakRetained);
    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v9 = 138543618;
    v10 = v4;
    v11 = 2048;
    v12 = WeakRetained;
    v6 = "%{public}@: Removing reader=%p";
  }
  else
  {
    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v9 = 138543618;
    v10 = v4;
    v11 = 2048;
    v12 = WeakRetained;
    v6 = "%{public}@: Not removing reader=%p";
  }
  _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
LABEL_8:

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

}

uint64_t __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__ATDeviceSyncSessionSyncTask__resetSyncDataForLibrary_withCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to reset sync data store. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    v6 = (_QWORD *)a1[4];
    v7 = a1[5];
    v8 = (void *)v6[23];
    objc_msgSend(v6, "dataClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSyncState:forLibrary:dataClass:", 0, v7, v9);

  }
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __124__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withParams_withNewRevision_withSyncType_inputStream_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync response data. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", v3);
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      v7 = objc_msgSend(v6, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    objc_msgSend(WeakRetained, "revisionVersionToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVersionToken:", v10);

    objc_msgSend(v8, "setLastServerRevision:", *(_QWORD *)(a1 + 56));
    _ATLogCategoryDeviceSync();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", (uint8_t *)&v17, 0x20u);

    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSyncState:forLibrary:dataClass:", v8, v15, v16);

  }
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _QWORD v37[4];
  id v38;
  id obj;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[3];
  char v51;

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3330;
  v46 = __Block_byref_object_dispose__3331;
  v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__3330;
  v40[4] = __Block_byref_object_dispose__3331;
  v41 = 0;
  v38 = 0;
  obj = 0;
  objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 0x2000, &obj, &v38);
  objc_storeStrong(&v41, obj);
  objc_storeStrong(&v47, v38);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", &unk_1E928BB40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *(unsigned int *)(a1 + 88);
  v4 = objc_msgSend(*(id *)(a1 + 40), "endpointType");
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v43[5];
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2;
  v29[3] = &unk_1E927D880;
  v10 = *(_QWORD *)(a1 + 32);
  v32 = v50;
  v29[4] = v10;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 72);
  v36 = *(_DWORD *)(a1 + 88);
  v30 = v11;
  v33 = v40;
  v34 = v12;
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 80);
  v31 = v13;
  v35 = v14;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_3;
  v26[3] = &unk_1E927D8A8;
  v15 = *(void **)(a1 + 40);
  v26[4] = *(_QWORD *)(a1 + 32);
  v27 = v15;
  v28 = v37;
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_134;
  v20[3] = &unk_1E927D8D0;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v22 = v48;
  v23 = v37;
  v20[4] = v16;
  v24 = &v42;
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 80);
  v21 = v18;
  v25 = v19;
  objc_msgSend(WeakRetained, "getChangesForSyncType:endpointType:afterRevision:upToRevision:withSyncParams:intoOutputStream:withStartHandler:withProgressHandler:withCompletionHandler:", v3, v4, v6, v5, v7, v8, v29, v26, v20);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 80);
    v5 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));
    objc_msgSend(WeakRetained, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("ATDeviceSyncSessionSyncTask.m"), 564, CFSTR("start handler already invoked for client %@"), v7);

  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withParams:withNewRevision:withSyncType:inputStream:onMessageLink:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v7;
  void *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 >> 4 >= 0x271 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) == 0)
  {
    _ATLogCategoryDeviceSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "adding transport upgrade exception for %lld changes total", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "socket");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTransportUpgradeException");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithCount:totalItemCount:forEndpointType:", a2, a3, 1);
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 176));
    objc_msgSend(WeakRetained, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("ATDeviceSyncSessionSyncTask.m"), 606, CFSTR("end handler already invoked for client %@"), v9);

  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithCount:totalItemCount:forEndpointType:", v10, v10, 1);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "streamStatus"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "open");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "close");
    }
    _ATLogCategoryDeviceSync();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v3;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_ERROR, "%{public}@: failed to read sync response data. err=%{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v15;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: finished reading sync response data for library=%{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", &unk_1E928BB58);
    }
    v16 = *(_BYTE **)(a1 + 32);
    if (v16[200])
    {
      objc_msgSend(v16, "messageLink");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "socket");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeTransportUpgradeException");

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
    }
  }

}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48));
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_125(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48));
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_126(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), 2, *(_QWORD *)(a1 + 48));
}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  _QWORD v18[5];
  _QWORD v19[4];

  objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", &unk_1E928BB28);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *(unsigned int *)(a1 + 88);
  v4 = objc_msgSend(*(id *)(a1 + 40), "endpointType");
  objc_msgSend(*(id *)(a1 + 48), "dataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_3;
  v18[3] = &unk_1E927D808;
  v18[4] = v19;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_4;
  v9[3] = &unk_1E927D830;
  v9[4] = *(_QWORD *)(a1 + 32);
  v15 = v19;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 80);
  v14 = v7;
  v16 = v8;
  v17 = *(_DWORD *)(a1 + 88);
  objc_msgSend(WeakRetained, "applyChangesForSyncType:endpointType:fromStream:withSyncParams:withProgressHandler:withCompletionHandler:", v3, v4, v5, v6, v18, v9);

  _Block_object_dispose(v19, 8);
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "dataStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "streamStatus");

  if (!v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "dataStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_drainInputStream:withCompletion:", v11, 0);

  }
  _ATLogCategoryDeviceSync();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v14;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to process sync request changes. err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "responseWithError:parameters:", v7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 72);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_129;
    v27[3] = &unk_1E927E0D0;
    v27[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "sendResponse:withCompletion:", v15, v27);
    objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", v7);
  }
  else
  {
    if (v13)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v29 = v17;
      v30 = 2048;
      v31 = a3;
      v32 = 2048;
      v33 = a4;
      v34 = 2114;
      v35 = v18;
      _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: sync request processed successfully. beforeRevision=%llu, afterRevision=%llu, oldSyncState=%{public}@", buf, 0x2Au);
    }

    v19 = *(void **)(a1 + 48);
    if (v19)
    {
      v20 = (void *)objc_msgSend(v19, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v20;
    objc_msgSend(v20, "setLastServerRevision:", objc_msgSend(*(id *)(a1 + 56), "lastServerRevision"));
    objc_msgSend(v15, "setLastClientRevision:", objc_msgSend(*(id *)(a1 + 56), "newRevision"));
    objc_msgSend(v15, "setVersionToken:", *(_QWORD *)(a1 + 64));
    _ATLogCategoryDeviceSync();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 72), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);

    }
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(*(id *)(a1 + 72), "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataClass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSyncState:forLibrary:dataClass:", v15, v25, v26);

    objc_msgSend(*(id *)(a1 + 32), "_sendSyncResponseToRequest:withChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), a3, a4, *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 72));
  }

}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send error response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int8x16_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int8x16_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", &unk_1E928BB10);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *(unsigned int *)(a1 + 112);
  v4 = objc_msgSend(*(id *)(a1 + 40), "endpointType");
  objc_msgSend(*(id *)(a1 + 48), "dataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_2;
  v20[3] = &unk_1E927D740;
  v21 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_3;
  v11[3] = &unk_1E927D768;
  v11[4] = v21;
  v7 = *(int8x16_t *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 80);
  v17 = vextq_s8(v7, v7, 8uLL);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(_QWORD *)(a1 + 104);
  v16 = v8;
  v18 = v9;
  v19 = v10;
  objc_msgSend(WeakRetained, "applyChangesForSyncType:endpointType:fromStream:withSyncParams:withProgressHandler:withCompletionHandler:", v3, v4, v5, v6, v20, v11);

}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithCount:totalItemCount:forEndpointType:", a2, a3, 0);
  v12[0] = CFSTR("_CompletedItemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("_TotalItemCount");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CF76A0]);
  objc_msgSend(*(id *)(a1 + 32), "dataClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCommand:dataClass:parameters:", CFSTR("UpdateSyncSessionTask"), v10, v8);

  objc_msgSend(*(id *)(a1 + 32), "sendRequest:withCompletion:", v11, 0);
}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v11 + 176));
    objc_msgSend(WeakRetained, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("ATDeviceSyncSessionSyncTask.m"), 443, CFSTR("end handler already invoked by client %@"), v13);

  }
  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "_updateProgressWithCount:totalItemCount:forEndpointType:", v14, v14, 0);
    objc_msgSend(*(id *)(a1 + 40), "dataStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "streamStatus");

    if (!v16)
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "dataStream");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_drainInputStream:withCompletion:", v18, 0);

    }
    _ATLogCategoryDeviceSync();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v20)
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v37 = v21;
        v38 = 2114;
        v39 = v7;
        _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to process incoming server changes. err=%{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", v7);
    }
    else
    {
      if (v20)
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        v38 = 2048;
        v39 = a4;
        _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: sync response applied successfully. afterRevision=%llu", buf, 0x16u);
      }

      v23 = *(void **)(a1 + 48);
      if (v23)
      {
        v24 = (void *)objc_msgSend(v23, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;
      objc_msgSend(v24, "setLastServerRevision:", objc_msgSend(*(id *)(a1 + 56), "newRevision"));
      objc_msgSend(v25, "setLastClientRevision:", objc_msgSend(*(id *)(a1 + 56), "lastClientRevision"));
      objc_msgSend(v25, "setVersionToken:", *(_QWORD *)(a1 + 64));
      _ATLogCategoryDeviceSync();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 72), "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v27;
        v38 = 2114;
        v39 = v28;
        v40 = 2114;
        v41 = v25;
        _os_log_impl(&dword_1D1868000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);

      }
      v29 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      objc_msgSend(*(id *)(a1 + 72), "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dataClass");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSyncState:forLibrary:dataClass:", v25, v30, v31);

      _ATLogCategoryDeviceSync();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (a3 == a4)
      {
        if (v33)
        {
          v34 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v37 = v34;
          _os_log_impl(&dword_1D1868000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: no new revisions after response - we're in sync!", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", 0);
      }
      else
      {
        if (v33)
        {
          v35 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v37 = v35;
          v38 = 2048;
          v39 = a3;
          v40 = 2048;
          v41 = a4;
          _os_log_impl(&dword_1D1868000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: revision changed from %lld to %lld - syncing again", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_sendSyncRequestWithChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", objc_msgSend(*(id *)(a1 + 56), "lastClientRevision"), *(_QWORD *)(a1 + 96), a4, 1, *(_QWORD *)(a1 + 72));
      }

    }
  }

}

uint64_t __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncRequestOnMessageLink:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", 0);
}

void __132__ATDeviceSyncSessionSyncTask__sendSyncRequestWithParams_withSyncType_syncState_newRevision_versionToken_inputStream_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      v12 = objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;
    -[NSObject setLastServerRevision:](v12, "setLastServerRevision:", objc_msgSend(*(id *)(a1 + 32), "lastServerRevision"));
    -[NSObject setLastClientRevision:](v9, "setLastClientRevision:", *(_QWORD *)(a1 + 64));
    -[NSObject setVersionToken:](v9, "setVersionToken:", *(_QWORD *)(a1 + 40));
    _ATLogCategoryDeviceSync();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "dataClass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@:%{public}@, %{public}@", (uint8_t *)&v21, 0x2Au);

    }
    v18 = *(void **)(*(_QWORD *)(a1 + 48) + 184);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dataClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSyncState:forLibrary:dataClass:", v9, v19, v20);

    objc_msgSend(*(id *)(a1 + 48), "_processSyncResponse:onMessageLink:", v5, *(_QWORD *)(a1 + 56));
    goto LABEL_14;
  }
  v7 = objc_msgSend(*(id *)(a1 + 48), "isRunning");
  _ATLogCategoryDeviceSync();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 48);
      v21 = 138543618;
      v22 = v13;
      v23 = 1024;
      LODWORD(v24) = objc_msgSend(v5, "messageID");
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring sync response with id %u because that sync was canceled", (uint8_t *)&v21, 0x12u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v21 = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync changes. err=%{public}@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_finishSyncWithError:", v6);
LABEL_15:

}

uint64_t __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;

  if (!a2)
  {
    v2 = result;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(result + 32) + 176));
    v4 = objc_msgSend(WeakRetained, "currentRevision");

    return objc_msgSend(*(id *)(v2 + 32), "_sendSyncRequestWithChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", 0, v4, v4, 2, *(_QWORD *)(v2 + 40));
  }
  return result;
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_94(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  id v37;
  id obj;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];
  char v48;
  _QWORD v49[3];
  char v50;
  _QWORD v51[4];

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3330;
  v45 = __Block_byref_object_dispose__3331;
  v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__3330;
  v39[4] = __Block_byref_object_dispose__3331;
  v40 = 0;
  v37 = 0;
  obj = 0;
  objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 0x2000, &obj, &v37);
  objc_storeStrong(&v40, obj);
  objc_storeStrong(&v46, v37);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", &unk_1E928BAE0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *(unsigned int *)(a1 + 96);
  v4 = objc_msgSend(*(id *)(a1 + 40), "endpointType");
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = MEMORY[0x1E0C809B0];
  v8 = v42[5];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_98;
  v28[3] = &unk_1E927D6B0;
  v9 = *(_QWORD *)(a1 + 32);
  v32 = v49;
  v28[4] = v9;
  v36 = *(_DWORD *)(a1 + 96);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 80);
  v29 = v10;
  v34 = v11;
  v30 = *(id *)(a1 + 56);
  v33 = v39;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 88);
  v31 = v12;
  v35 = v13;
  v25[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2;
  v25[3] = &unk_1E927D8A8;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v27 = v51;
  v25[4] = v14;
  v25[0] = v7;
  v25[1] = 3221225472;
  v26 = v15;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_103;
  v19[3] = &unk_1E927D8D0;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v21 = v47;
  v19[4] = v16;
  v20 = v17;
  v18 = *(_QWORD *)(a1 + 88);
  v22 = v51;
  v23 = &v41;
  v24 = v18;
  objc_msgSend(WeakRetained, "getChangesForSyncType:endpointType:afterRevision:upToRevision:withSyncParams:intoOutputStream:withStartHandler:withProgressHandler:withCompletionHandler:", v3, v4, v5, v6, 0, v8, v28, v25, v19);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 88);
    v5 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));
    objc_msgSend(WeakRetained, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("ATDeviceSyncSessionSyncTask.m"), 271, CFSTR("start handler already invoked by client %@"), v7);

  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_sendSyncRequestWithParams:withSyncType:syncState:newRevision:versionToken:inputStream:onMessageLink:", a2, *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56));
  }
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  if (a3 >> 4 >= 0x271 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 200))
  {
    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "adding transport upgrade exception for %lld changes total", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "socket");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTransportUpgradeException");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
  }
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 176));
    objc_msgSend(WeakRetained, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("ATDeviceSyncSessionSyncTask.m"), 303, CFSTR("end handler already invoked by client %@"), v9);

    goto LABEL_14;
  }
  *(_BYTE *)(v4 + 24) = 1;
  _ATLogCategoryDeviceSync();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dataClass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "msv_description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "%{public}@: finished writing sync request data for library=%{public}@, dataclass=%{public}@ error=%{public}@", buf, 0x2Au);

LABEL_8:
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v16;
    v21 = 2114;
    v22 = v17;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: finished writing sync request data for library=%{public}@, dataclass=%{public}@", buf, 0x20u);

    goto LABEL_8;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "streamStatus"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "open");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "close");
  }
  v18 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v18, "_finishSyncWithError:", v3);
  else
    objc_msgSend(v18, "setCurrentItemDescriptions:", &unk_1E928BAF8);
LABEL_14:

}

void __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 201) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 200))
  {
    objc_msgSend((id)v2, "messageLink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "socket");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTransportUpgradeException");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 176));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "syncCompletedWithError:", *(_QWORD *)(a1 + 40));
  v28 = v6;
  v7 = dispatch_group_create();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_2;
        v31[3] = &unk_1E927E198;
        v15 = v7;
        v16 = *(_QWORD *)(a1 + 32);
        v32 = v15;
        v33 = v16;
        v34 = v14;
        objc_msgSend(v14, "stopWithCompletion:", v31);

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v18 = v17 - *(double *)(*(_QWORD *)(a1 + 32) + 208);
  _ATLogCategoryDeviceSync();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v28;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v28, "syncDataClass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v21;
    v41 = 2114;
    v42 = *(double *)&v22;
    v43 = 2048;
    v44 = v18;
    _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Task finished for %{public}@ in %.2f seconds", buf, 0x20u);

  }
  v23 = (double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 224) / v18;
  _ATLogCategoryDeviceSync();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    *(_DWORD *)buf = 134218240;
    v40 = v25;
    v41 = 2048;
    v42 = v23;
    _os_log_impl(&dword_1D1868000, v24, OS_LOG_TYPE_DEFAULT, "==> synced %lld total items (%.2f items/s)", buf, 0x16u);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224)
    && !objc_msgSend(*(id *)(a1 + 48), "endpointType")
    && !*(_QWORD *)(a1 + 40)
    && (objc_msgSend(*(id *)(a1 + 56), "isCancelled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 56), "isFinished") & 1) == 0)
  {
    ATReportEventAddDoubleToScalarKey();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v28);
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_93;
  block[3] = &unk_1E927E148;
  v27 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v30 = v27;
  dispatch_group_notify(v7, v26, block);

}

uint64_t __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "removeObject:", *(_QWORD *)(a1 + 48));
}

uint64_t __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_93(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryDeviceSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: All readers stopped. wrapping up task ..", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void __52__ATDeviceSyncSessionSyncTask__finishSyncWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryDeviceSync();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: received response. params=%{public}@", (uint8_t *)&v23, 0x16u);

  }
  if (v6 || (objc_msgSend(v5, "error"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    _ATLogCategoryDeviceSync();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "messageLink");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (void *)v6;
      if (!v6)
      {
        objc_msgSend(v5, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v23 = 138543874;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync request on %{public}@. err=%{public}@", (uint8_t *)&v23, 0x20u);
      if (!v6)

    }
  }
  objc_msgSend(v5, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("_SyncTaskFinishedSyncAssets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("_SyncTaskFinishedSyncAssets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStartAssetTaskWhenFinished:", objc_msgSend(v17, "BOOLValue"));

  }
  v20 = a1 + 32;
  v19 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(v20 + 8);
  if (v6 | v18)
  {
    if (v18)
      v21 = v18;
    else
      v21 = v6;
    objc_msgSend(v19, "_finishTaskWithError:", v21);
  }
  else
  {
    objc_msgSend(v5, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_finishTaskWithError:", v22);

  }
}

void __61__ATDeviceSyncSessionSyncTask_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response on %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
  if (*(_QWORD *)(a1 + 48))
    v7 = *(id *)(a1 + 48);
  else
    v7 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_finishSyncWithError:", v7);

}

void __37__ATDeviceSyncSessionSyncTask_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finishSyncWithError:", v3);

}

@end
