@implementation ASDAppQuery

- (void)_updateCachedResultsWithResults:(uint64_t)a1
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  obj = a2;
  if (a1)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v57;
      v53 = *MEMORY[0x1E0CB3110];
      *(_QWORD *)&v4 = 138543618;
      v49 = v4;
      v54 = *(_QWORD *)v57;
      do
      {
        v7 = 0;
        v51 = v5;
        do
        {
          if (*(_QWORD *)v57 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v7);
          objc_msgSend(v8, "bundleID", v49);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "progress");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "remoteProgress");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              if (!v11)
              {
                v11 = -[ASDAppQuery _newProgressForApp:fromRemoteProgress:usingServiceBroker:](a1, v8, v12);
                -[ASDAppQuery _downloadProgressForApp:fromRemoteProgress:](a1, v8, v13);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setDownloadProgress:", v28);

                -[ASDAppQuery _installProgressForApp:fromRemoteProgress:](a1, v13);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setInstallProgress:", v29);

                objc_msgSend(v8, "setProgressPhase:", -[NSObject phase](v13, "phase"));
                -[ASDAppQuery _postProcessProgressForApp:fromRemoteProgress:](a1, v8, v13);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setPostProcessProgress:", v30);
                goto LABEL_26;
              }
              objc_msgSend(v11, "setCompletedUnitCount:", -[NSObject completedUnitCount](v12, "completedUnitCount"));
              v14 = -[NSObject downloadCompletedUnitCount](v13, "downloadCompletedUnitCount");
              objc_msgSend(v8, "downloadProgress");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setCompletedUnitCount:", v14);

              v16 = -[NSObject downloadTotalUnitCount](v13, "downloadTotalUnitCount");
              objc_msgSend(v8, "downloadProgress");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setTotalUnitCount:", v16);

              if (-[NSObject phase](v13, "phase") == 2)
              {
                v18 = (void *)MEMORY[0x1E0CB37E8];
                -[NSObject throughput](v13, "throughput");
                objc_msgSend(v18, "numberWithDouble:");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "downloadProgress");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setThroughput:", v19);

                objc_msgSend(v8, "downloadProgress");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)MEMORY[0x1E0CB37E8];
                -[NSObject throughput](v13, "throughput");
                objc_msgSend(v22, "numberWithDouble:");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setUserInfoObject:forKey:", v23, v53);

                v24 = -[NSObject secondsRemaining](v13, "secondsRemaining");
                if (v24 < 0)
                {
                  v25 = 0;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject secondsRemaining](v13, "secondsRemaining"));
                  v25 = objc_claimAutoreleasedReturnValue();
                  v50 = (void *)v25;
                }
                objc_msgSend(v8, "downloadProgress");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setEstimatedTimeRemaining:", v25);

                if ((v24 & 0x8000000000000000) == 0)
              }
              v32 = -[NSObject installCompletedUnitCount](v13, "installCompletedUnitCount");
              objc_msgSend(v8, "installProgress");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setCompletedUnitCount:", v32);

              v34 = -[NSObject installTotalUnitCount](v13, "installTotalUnitCount");
              objc_msgSend(v8, "installProgress");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setTotalUnitCount:", v34);

              objc_msgSend(v8, "setProgressPhase:", -[NSObject phase](v13, "phase"));
              v36 = -[NSObject postProcessCompletedUnitCount](v13, "postProcessCompletedUnitCount");
              objc_msgSend(v8, "postProcessProgress");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setCompletedUnitCount:", v36);

              v38 = -[NSObject postProcessTotalUnitCount](v13, "postProcessTotalUnitCount");
              objc_msgSend(v8, "postProcessProgress");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setTotalUnitCount:", v38);

              if (-[NSObject phase](v13, "phase") == 5)
              {
                v40 = (void *)MEMORY[0x1E0CB37E8];
                -[NSObject throughput](v13, "throughput");
                objc_msgSend(v40, "numberWithDouble:");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "postProcessProgress");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setThroughput:", v41);

                objc_msgSend(v8, "postProcessProgress");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = (void *)MEMORY[0x1E0CB37E8];
                -[NSObject throughput](v13, "throughput");
                objc_msgSend(v44, "numberWithDouble:");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setUserInfoObject:forKey:", v45, v53);

                v46 = -[NSObject secondsRemaining](v13, "secondsRemaining");
                if (v46 < 0)
                {
                  v47 = 0;
                  v30 = v52;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject secondsRemaining](v13, "secondsRemaining"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v30;
                }
                objc_msgSend(v8, "postProcessProgress");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setEstimatedTimeRemaining:", v47);

                v52 = v30;
                v5 = v51;
                if ((v46 & 0x8000000000000000) == 0)
LABEL_26:

              }
              objc_msgSend(v8, "setHasPostProcessing:", -[NSObject hasPostProcessing](v13, "hasPostProcessing"));
              objc_msgSend(v8, "setEssentialBackgroundAssetDownloadEstimate:", -[NSObject essentialBackgroundAssetDownloadEstimate](v13, "essentialBackgroundAssetDownloadEstimate"));
              objc_msgSend(v8, "setProgress:", v11);
              v6 = v54;
LABEL_28:

            }
            else if (v11)
            {
              objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));
              goto LABEL_28;
            }
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v8, v9);
            goto LABEL_30;
          }
          ASDLogHandleForCategory(12);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            v26 = (void *)objc_opt_class();
            *(_DWORD *)buf = v49;
            v61 = v26;
            v62 = 2114;
            v63 = v8;
            v27 = v26;
            _os_log_fault_impl(&dword_19A03B000, v13, OS_LOG_TYPE_FAULT, "[%{public}@]: Encountered result with no bundleID: %{public}@", buf, 0x16u);

          }
LABEL_30:

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v5);
    }
  }

}

- (ASDAppQuery)initWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASDAppQuery *v8;

  v4 = a3;
  +[ASDAppQuery _defaultExecutor]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDNotificationCenter defaultCenter](ASDNotificationCenter, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDAppQuery initWithPredicate:queryExecutor:serviceBroker:notificationCenter:](self, "initWithPredicate:queryExecutor:serviceBroker:notificationCenter:", v4, v5, v6, v7);

  return v8;
}

- (ASDAppQuery)initWithPredicate:(id)a3 queryExecutor:(id)a4 serviceBroker:(id)a5 notificationCenter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASDAppQuery *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *notificationQueue;
  uint64_t v21;
  NSPredicate *predicate;
  uint64_t v23;
  NSMutableDictionary *resultCache;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ASDAppQuery;
  v14 = -[ASDAppQuery init](&v27, sel_init);
  if (v14)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDAppQuery", v15);
    dispatchQueue = v14->_dispatchQueue;
    v14->_dispatchQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDAppQuery.notify", v18);
    notificationQueue = v14->_notificationQueue;
    v14->_notificationQueue = (OS_dispatch_queue *)v19;

    v21 = objc_msgSend(v10, "copy");
    predicate = v14->_predicate;
    v14->_predicate = (NSPredicate *)v21;

    objc_storeStrong((id *)&v14->_serviceBroker, a5);
    objc_storeStrong((id *)&v14->_queryExecutor, a4);
    v23 = objc_opt_new();
    resultCache = v14->_resultCache;
    v14->_resultCache = (NSMutableDictionary *)v23;

    objc_storeStrong((id *)&v14->_notificationCenter, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v14, sel__handleBrokerConnectionNotification_, ASDServiceBrokerConnectedNotification, v14->_serviceBroker);

  }
  return v14;
}

+ (id)_defaultExecutor
{
  objc_opt_self();
  if (_MergedGlobals_23 != -1)
    dispatch_once(&_MergedGlobals_23, &__block_literal_global_0);
  return (id)qword_1ECFFA980;
}

uint64_t __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __27__ASDAppQuery_setObserver___block_invoke(uint64_t a1)
{
  void *v2;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "addNotificationObserver:forName:");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addProgressObserver:");
  }
  else
  {
    objc_msgSend(v2, "removeNotificationObserver:forName:");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeProgressObserver:");
  }
}

- (void)executeQueryWithResultHandler:(id)a3
{
  id v4;
  NSPredicate *predicate;
  NRDevice *device;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  predicate = self->_predicate;
  device = self->_device;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke;
  v8[3] = &unk_1E37BDD10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ASDAppQuery _executeQueryWithPredicate:onPairedDevice:withCompletion:]((uint64_t)self, predicate, device, v8);

}

- (void)_executeQueryWithPredicate:(void *)a3 onPairedDevice:(void *)a4 withCompletion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 17))
    {
      v11 = (*(_QWORD *)(a1 + 80) >> 1) & 1;
      v12 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke;
      v17[3] = &unk_1E37BDBD8;
      v13 = &v18;
      v18 = v9;
      objc_msgSend(v12, "executeUpdatesQueryWithPredicateReloadingFromServer:onPairedDevice:withResultHandler:", v11, v8, v17);
    }
    else
    {
      v14 = *(void **)(a1 + 48);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke_2;
      v15[3] = &unk_1E37BDBD8;
      v13 = &v16;
      v16 = v9;
      objc_msgSend(v14, "executeQueryWithPredicate:onPairedDevice:withResultHandler:", v7, v8, v15);
    }

  }
}

- (void)setObserver:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__ASDAppQuery_setObserver___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id *v6;
  id *v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  -[ASDAppQuery _debugReceivedApps:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = -[ASDAppQuery _replaceCachedResultsWithResults:]((id *)v2, v3);
    -[ASDAppQuery _handleQueryOptionsWithResults:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_3;
    v12[3] = &unk_1E37BDCC0;
    v6 = &v14;
    v14 = *(id *)(a1 + 56);
    v7 = &v13;
    v13 = *(id *)(a1 + 40);
    v8 = v12;
  }
  else
  {
    v5 = *(NSObject **)(v2 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_4;
    v9[3] = &unk_1E37BDCC0;
    v6 = &v11;
    v11 = *(id *)(a1 + 56);
    v7 = &v10;
    v10 = *(id *)(a1 + 48);
    v8 = v9;
  }
  dispatch_async(v5, v8);

}

- (id)_replaceCachedResultsWithResults:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[ASDAppQuery _updateCachedResultsWithResults:]((uint64_t)v2, v3);
    v4 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v2[7], "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "valueForKey:", CFSTR("bundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v9);

    objc_msgSend(v6, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAppQuery _removeCachedResultsForBundleIDs:]((uint64_t)v2, v10);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_removeCachedResultsForBundleIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ASDApp *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "progress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            objc_msgSend(v13, "setCompletedUnitCount:", objc_msgSend(v13, "totalUnitCount"));
          v15 = -[ASDApp initWithBundleID:]([ASDApp alloc], "initWithBundleID:", v10);
          if (objc_msgSend(v12, "isStoreApp"))
          {
            -[ASDApp setStatus:](v15, "setStatus:", 256);
            -[ASDApp setStoreItemID:](v15, "setStoreItemID:", objc_msgSend(v12, "storeItemID"));
          }
          objc_msgSend(v4, "addObject:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 56), "removeObjectsForKeys:", v5);
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (void)_handleQueryOptionsWithResults:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "loadUpdateMetadataIfNecessary");
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }
    }
  }

}

- (void)_debugReceivedApps:(uint64_t)a1
{
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v6 = a2;
  if (a1)
  {
    ASDLogHandleForCategory(12);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
    {
      v5 = objc_msgSend(v6, "count");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __34__ASDAppQuery__debugReceivedApps___block_invoke;
      v7[3] = &unk_1E37BDD88;
      v7[4] = a1;
      v7[5] = v5;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
    }
  }

}

uint64_t __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_2;
  block[3] = &unk_1E37BDCE8;
  block[4] = v7;
  v13 = v5;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_sync(v9, block);

}

+ (id)queryForBetaApps
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isBetaApp == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPredicate:", v3);

  return v4;
}

+ (id)queryForStoreApps
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isAppClip == NO AND isStoreApp == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPredicate:", v3);

  return v4;
}

void __31__ASDAppQuery__defaultExecutor__block_invoke()
{
  ASDAppQueryExecutor *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = [ASDAppQueryExecutor alloc];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ASDAppQueryExecutor initWithServiceBroker:](v0, "initWithServiceBroker:", v1);

  v3 = (void *)qword_1ECFFA980;
  qword_1ECFFA980 = v2;

}

+ (id)queryForAlmondApps
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("softwarePlatform == %ld"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPredicate:", v3);

  return v4;
}

+ (id)queryForAppClipWithStoreItemID:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isAppClip == YES AND isStoreApp == YES AND storeItemID == %lld"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v4);

  return v5;
}

+ (id)queryForBeagleApps
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isOcelot == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPredicate:", v3);

  return v4;
}

+ (id)queryForBetaAppsWithStoreItemIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isAppClip == NO AND isBetaApp == YES AND storeItemID IN %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPredicate:", v6);
  return v7;
}

+ (id)queryForBundleIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleID IN %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPredicate:", v6);
  return v7;
}

+ (id)queryForBundleAtPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundlePath == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPredicate:", v6);
  return v7;
}

+ (id)queryDefaultPairedWatchForBetaApps
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Please note that this ASDAppQuery doesn't return real results yet.", v8, 2u);
  }

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isBetaApp == YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPredicate:", v5);

  return v6;
}

+ (id)queryForBetaAppsOnPairedDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isBetaApp == YES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPredicate:onPairedDevice:", v6, v4);

  return v7;
}

+ (id)queryForStoreItemIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isAppClip == NO AND isStoreApp == YES AND storeItemID IN %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPredicate:", v6);
  return v7;
}

+ (id)queryForSystemAppsOnPairedDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isSystemApp == YES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPredicate:onPairedDevice:", v6, v4);

  return v7;
}

+ (id)queryForUpdates
{
  _BYTE *v2;

  v2 = objc_alloc((Class)a1);
  if (v2)
  {
    v2 = (_BYTE *)objc_msgSend(v2, "init");
    if (v2)
      v2[17] = 1;
  }
  return v2;
}

- (ASDAppQuery)init
{
  void *v3;
  ASDAppQuery *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASDAppQuery initWithPredicate:](self, "initWithPredicate:", v3);

  return v4;
}

+ (id)queryWithPredicate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v4);

  return v5;
}

+ (id)queryWithPredicate:(id)a3 onPairedDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:onPairedDevice:", v7, v6);

  return v8;
}

- (ASDAppQuery)initWithPredicate:(id)a3 onPairedDevice:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  ASDAppQuery *v13;

  v7 = a4;
  v8 = a3;
  +[ASDAppQuery _defaultExecutor]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDNotificationCenter defaultCenter](ASDNotificationCenter, "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (self)
  {
    v13 = -[ASDAppQuery initWithPredicate:queryExecutor:serviceBroker:notificationCenter:](self, "initWithPredicate:queryExecutor:serviceBroker:notificationCenter:", v8, v9, v10, v11);
    self = v13;
    if (v13)
      objc_storeStrong((id *)&v13->_device, a4);
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDNotificationCenter removeNotificationObserver:forName:](self->_notificationCenter, "removeNotificationObserver:forName:", self, CFSTR("LS"));
  -[ASDNotificationCenter removeProgressObserver:](self->_notificationCenter, "removeProgressObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ASDAppQuery;
  -[ASDAppQuery dealloc](&v3, sel_dealloc);
}

- (ASDAppQueryResultsObserver)observer
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__ASDAppQuery_observer__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDAppQueryResultsObserver *)v3;
}

void __23__ASDAppQuery_observer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setQueryOptions:(int64_t)a3
{
  self->_queryOptions = a3;
  -[ASDAppQueryExecutor setQueryOptions:](self->_queryExecutor, "setQueryOptions:");
}

+ (void)anyWithPredicate:(id)a3 withResultHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[ASDAppQuery _defaultExecutor]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ASDAppQuery_anyWithPredicate_withResultHandler___block_invoke;
  v9[3] = &unk_1E37BDBD8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "executeQueryWithPredicate:onPairedDevice:withResultHandler:", v6, 0, v9);

}

void __50__ASDAppQuery_anyWithPredicate_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __45__ASDAppQuery_executeQueryWithResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)notificationCenter:(id)a3 receivedNotifications:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke;
  v8[3] = &unk_1E37BDC98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

void __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 16))
  {
    v2 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke_32;
    v5[3] = &unk_1E37BDD38;
    v5[4] = v1;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  }
  else
  {
    ASDLogHandleForCategory(12);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring notifications until query has been run at least once", buf, 0xCu);

    }
  }
}

void __56__ASDAppQuery_notificationCenter_receivedNotifications___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _BYTE v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("LS"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RD"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_8:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AC"), *(_OWORD *)v33, *(_QWORD *)&v33[16], v34);
      v11 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("RD")))
      {
        ASDLogHandleForCategory(12);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (void *)objc_opt_class();
          *(_DWORD *)v33 = 138543362;
          *(_QWORD *)&v33[4] = v15;
          v16 = v15;
          _os_log_impl(&dword_19A03B000, v14, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps registered notification", v33, 0xCu);

        }
        v17 = *(_QWORD *)(a1 + 32);
        if (!v17)
          goto LABEL_35;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AP"));
        v18 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject count](v18, "count"))
          -[ASDAppQuery _handleAppsUpdatedWithResults:](v17, v18);
      }
      else if (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("UR")))
      {
        ASDLogHandleForCategory(12);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (void *)objc_opt_class();
          *(_DWORD *)v33 = 138543362;
          *(_QWORD *)&v33[4] = v20;
          v21 = v20;
          _os_log_impl(&dword_19A03B000, v19, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps unregistered notification", v33, 0xCu);

        }
        v22 = *(_QWORD *)(a1 + 32);
        if (!v22)
          goto LABEL_35;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BI"));
        v18 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject count](v18, "count"))
          -[ASDAppQuery _handleAppsRemovedWithBundleIDs:](v22, v18);
      }
      else
      {
        if (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("RL")))
        {
          ASDLogHandleForCategory(12);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (void *)objc_opt_class();
            *(_DWORD *)v33 = 138543362;
            *(_QWORD *)&v33[4] = v25;
            v26 = v25;
            _os_log_impl(&dword_19A03B000, v24, OS_LOG_TYPE_INFO, "[%{public}@]: Handling apps refreshed notification", v33, 0xCu);

          }
          -[ASDAppQuery _handleNotificationRefreshWithUserInfo:](*(_QWORD *)(a1 + 32), v4);
          goto LABEL_35;
        }
        v27 = -[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("ER"));
        ASDLogHandleForCategory(12);
        v28 = objc_claimAutoreleasedReturnValue();
        v18 = v28;
        if (v27)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = (void *)objc_opt_class();
            *(_DWORD *)v33 = 138543618;
            *(_QWORD *)&v33[4] = v29;
            *(_WORD *)&v33[12] = 2114;
            *(_QWORD *)&v33[14] = v3;
            v30 = v29;
            _os_log_impl(&dword_19A03B000, v18, OS_LOG_TYPE_INFO, "[%{public}@]: Handling app error notification action: %{public}@", v33, 0x16u);

          }
          -[ASDAppQuery _handleNotificationErrorWithUserInfo:](*(_QWORD *)(a1 + 32), v4);
          goto LABEL_35;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)v33 = 138543618;
          *(_QWORD *)&v33[4] = v31;
          *(_WORD *)&v33[12] = 2114;
          *(_QWORD *)&v33[14] = v3;
          v32 = v31;
          _os_log_error_impl(&dword_19A03B000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Received unhandled action: %{public}@", v33, 0x16u);

        }
      }

LABEL_35:
      goto LABEL_36;
    }
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    if (v8)
    {
      objc_msgSend(v8, "pairingID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v7);

      ASDLogHandleForCategory(12);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if ((v10 & 1) == 0)
      {
        if (v12)
        {
          *(_DWORD *)v33 = 138543618;
          *(_QWORD *)&v33[4] = objc_opt_class();
          *(_WORD *)&v33[12] = 2114;
          *(_QWORD *)&v33[14] = v7;
          v23 = *(id *)&v33[4];
          _os_log_impl(&dword_19A03B000, v11, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring notification for unmatched device: %{public}@", v33, 0x16u);

        }
        goto LABEL_35;
      }
      if (v12)
      {
        *(_DWORD *)v33 = 138543618;
        *(_QWORD *)&v33[4] = objc_opt_class();
        *(_WORD *)&v33[12] = 2114;
        *(_QWORD *)&v33[14] = v7;
        v13 = *(id *)&v33[4];
        _os_log_impl(&dword_19A03B000, v11, OS_LOG_TYPE_INFO, "[%{public}@]: Handling device specific notification: %{public}@", v33, 0x16u);

      }
      goto LABEL_8;
    }
  }
  else
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v33 = 138543618;
      *(_QWORD *)&v33[4] = objc_opt_class();
      *(_WORD *)&v33[12] = 2114;
      *(_QWORD *)&v33[14] = v3;
      v11 = *(id *)&v33[4];
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Received unexpected notification: %{public}@", v33, 0x16u);
      goto LABEL_35;
    }
  }
LABEL_36:

}

- (void)_handleNotificationRefreshWithUserInfo:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BI"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleID IN %@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 88);
      v13[0] = v5;
      v13[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "andPredicateWithSubpredicates:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = *(id *)(a1 + 88);
    }
    v9 = *(void **)(a1 + 72);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke;
    v11[3] = &unk_1E37BDE78;
    v11[4] = a1;
    v12 = v3;
    v10 = v3;
    -[ASDAppQuery _executeQueryWithPredicate:onPairedDevice:withCompletion:](a1, v8, v9, v11);

  }
}

- (void)_handleNotificationErrorWithUserInfo:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AP"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      -[ASDAppQuery _handleAppsUpdatedWithResults:](a1, v3);

  }
}

- (void)notificationCenter:(id)a3 receivedProgress:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ASDAppQuery_notificationCenter_receivedProgress___block_invoke;
  v8[3] = &unk_1E37BDC98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

void __51__ASDAppQuery_notificationCenter_receivedProgress___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  ASDApp *v21;
  void *v22;
  ASDApp *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  NSObject *v75;
  id v76;
  __int128 v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  id obj;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  id v89;
  __int16 v90;
  NSObject *v91;
  __int16 v92;
  NSObject *v93;
  ASDApp *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v2 = objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = *(id *)(a1 + 40);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    if (!v3)
      goto LABEL_45;
    v5 = v3;
    v6 = *(_QWORD *)v85;
    v81 = *MEMORY[0x1E0CB3110];
    *(_QWORD *)&v4 = 138543874;
    v77 = v4;
    v7 = 0x1E0CB3000uLL;
    v82 = v2;
    while (1)
    {
      v8 = 0;
      v79 = v5;
      do
      {
        if (*(_QWORD *)v85 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v8);
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        objc_msgSend(v9, "bundleID", v77);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          if (!objc_msgSend(v9, "reportRemotely"))
            goto LABEL_15;
          ASDLogHandleForCategory(12);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = (void *)objc_opt_class();
            v19 = v18;
            objc_msgSend(v9, "bundleID");
            v20 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v18;
            v90 = 2114;
            v91 = v20;
            _os_log_impl(&dword_19A03B000, v17, OS_LOG_TYPE_INFO, "[%{public}@]: Found untracked progress for remote install: %{public}@", buf, 0x16u);

          }
          v21 = [ASDApp alloc];
          objc_msgSend(v9, "bundleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[ASDApp initWithBundleID:](v21, "initWithBundleID:", v22);

          -[ASDApp setStatus:](v23, "setStatus:", 1);
          -[ASDApp setRemoteProgress:](v23, "setRemoteProgress:", v9);
          v24 = *(_QWORD *)(a1 + 32);
          v94 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDAppQuery _updateCachedResultsWithResults:](v24, v25);

          v26 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(v9, "bundleID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = 0x1E0CB3000;
          if (!v12)
          {
LABEL_15:
            ASDLogHandleForCategory(12);
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              goto LABEL_43;
            v28 = (void *)objc_opt_class();
            v13 = v28;
            objc_msgSend(v9, "bundleID");
            v29 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v28;
            v90 = 2114;
            v91 = v29;
            _os_log_impl(&dword_19A03B000, v12, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring untracked progress for: %{public}@", buf, 0x16u);

            goto LABEL_17;
          }
        }
        if (-[NSObject isInstalled](v12, "isInstalled"))
        {
          ASDLogHandleForCategory(12);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = (void *)objc_opt_class();
            v15 = v14;
            objc_msgSend(v9, "bundleID");
            v16 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v14;
            v90 = 2114;
            v91 = v16;
            _os_log_impl(&dword_19A03B000, v13, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring progress for installed: %{public}@", buf, 0x16u);

            v7 = 0x1E0CB3000;
          }
LABEL_17:

          goto LABEL_43;
        }
        -[NSObject progress](v12, "progress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          ASDLogHandleForCategory(12);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v89 = v46;
            v90 = 2114;
            v91 = v12;
            v47 = v46;
            _os_log_impl(&dword_19A03B000, v45, OS_LOG_TYPE_INFO, "[%{public}@]: Progress started for: %{public}@", buf, 0x16u);

          }
          v31 = -[ASDAppQuery _newProgressForApp:fromRemoteProgress:usingServiceBroker:](*(_QWORD *)(a1 + 32), v12, v9);
          -[NSObject setProgress:](v12, "setProgress:", v31);
          -[ASDAppQuery _downloadProgressForApp:fromRemoteProgress:](*(_QWORD *)(a1 + 32), v12, v9);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setDownloadProgress:](v12, "setDownloadProgress:", v48);

          -[ASDAppQuery _installProgressForApp:fromRemoteProgress:](*(_QWORD *)(a1 + 32), v9);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setInstallProgress:](v12, "setInstallProgress:", v49);

          -[NSObject setProgressPhase:](v12, "setProgressPhase:", objc_msgSend(v9, "phase"));
          -[ASDAppQuery _postProcessProgressForApp:fromRemoteProgress:](*(_QWORD *)(a1 + 32), v12, v9);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setPostProcessProgress:](v12, "setPostProcessProgress:", v50);
LABEL_37:

          goto LABEL_38;
        }
        v31 = v30;
        objc_msgSend(v30, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount"));
        ASDLogHandleForCategory(12);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v73 = (void *)objc_opt_class();
          v74 = v73;
          objc_msgSend(v31, "fractionCompleted");
          *(_DWORD *)buf = v77;
          v89 = v73;
          v7 = 0x1E0CB3000;
          v90 = 2048;
          v91 = v75;
          v92 = 2114;
          v93 = v12;
          _os_log_debug_impl(&dword_19A03B000, v32, OS_LOG_TYPE_DEBUG, "[%{public}@]: Setting %.2f for: %{public}@", buf, 0x20u);

        }
        v33 = objc_msgSend(v9, "downloadCompletedUnitCount");
        -[NSObject downloadProgress](v12, "downloadProgress");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setCompletedUnitCount:", v33);

        v35 = objc_msgSend(v9, "downloadTotalUnitCount");
        -[NSObject downloadProgress](v12, "downloadProgress");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTotalUnitCount:", v35);

        if (objc_msgSend(v9, "phase") == 2)
        {
          v37 = *(void **)(v7 + 2024);
          objc_msgSend(v9, "throughput");
          objc_msgSend(v37, "numberWithDouble:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject downloadProgress](v12, "downloadProgress");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setThroughput:", v38);

          -[NSObject downloadProgress](v12, "downloadProgress");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *(void **)(v7 + 2024);
          objc_msgSend(v9, "throughput");
          objc_msgSend(v41, "numberWithDouble:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setUserInfoObject:forKey:", v42, v81);

          v43 = objc_msgSend(v9, "secondsRemaining");
          if (v43 < 0)
          {
            v44 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", objc_msgSend(v9, "secondsRemaining"));
            v44 = objc_claimAutoreleasedReturnValue();
            v78 = (void *)v44;
          }
          -[NSObject downloadProgress](v12, "downloadProgress");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setEstimatedTimeRemaining:", v44);

          if ((v43 & 0x8000000000000000) == 0)
          v7 = 0x1E0CB3000uLL;
        }
        v52 = objc_msgSend(v9, "installCompletedUnitCount");
        -[NSObject installProgress](v12, "installProgress");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setCompletedUnitCount:", v52);

        v54 = objc_msgSend(v9, "installTotalUnitCount");
        -[NSObject installProgress](v12, "installProgress");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setTotalUnitCount:", v54);

        -[NSObject setProgressPhase:](v12, "setProgressPhase:", objc_msgSend(v9, "phase"));
        v56 = objc_msgSend(v9, "postProcessCompletedUnitCount");
        -[NSObject postProcessProgress](v12, "postProcessProgress");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setCompletedUnitCount:", v56);

        v58 = objc_msgSend(v9, "postProcessTotalUnitCount");
        -[NSObject postProcessProgress](v12, "postProcessProgress");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setTotalUnitCount:", v58);

        if (objc_msgSend(v9, "phase") == 5)
        {
          v60 = v6;
          v61 = *(void **)(v7 + 2024);
          objc_msgSend(v9, "throughput");
          objc_msgSend(v61, "numberWithDouble:");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject postProcessProgress](v12, "postProcessProgress");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setThroughput:", v62);

          -[NSObject postProcessProgress](v12, "postProcessProgress");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = *(void **)(v7 + 2024);
          objc_msgSend(v9, "throughput");
          objc_msgSend(v65, "numberWithDouble:");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setUserInfoObject:forKey:", v66, v81);

          v67 = objc_msgSend(v9, "secondsRemaining");
          if (v67 < 0)
          {
            v68 = 0;
            v50 = v80;
          }
          else
          {
            objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", objc_msgSend(v9, "secondsRemaining"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v50;
          }
          -[NSObject postProcessProgress](v12, "postProcessProgress");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setEstimatedTimeRemaining:", v68);

          v80 = v50;
          v2 = v82;
          v6 = v60;
          v5 = v79;
          if (v67 < 0)
            goto LABEL_38;
          goto LABEL_37;
        }
        v2 = v82;
LABEL_38:
        -[NSObject setHasPostProcessing:](v12, "setHasPostProcessing:", objc_msgSend(v9, "hasPostProcessing"));
        -[NSObject setEssentialBackgroundAssetDownloadEstimate:](v12, "setEssentialBackgroundAssetDownloadEstimate:", objc_msgSend(v9, "essentialBackgroundAssetDownloadEstimate"));
        if (objc_msgSend(v31, "isFinished"))
        {
          ASDLogHandleForCategory(12);
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v71 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v89 = v71;
            v90 = 2114;
            v91 = v12;
            v72 = v71;
            _os_log_impl(&dword_19A03B000, v70, OS_LOG_TYPE_INFO, "[%{public}@]: Progress complete for: %{public}@", buf, 0x16u);

            v2 = v82;
          }

        }
        -[NSObject addObject:](v2, "addObject:", v12);

        v7 = 0x1E0CB3000;
LABEL_43:

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
      if (!v5)
      {
LABEL_45:

        -[ASDAppQuery _sendResultsChangedWithResults:](*(_QWORD *)(a1 + 32), v2);
        goto LABEL_48;
      }
    }
  }
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v89 = (id)objc_opt_class();
    v76 = v89;
    _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_INFO, "[%{public}@]: Ignoring progress until query has been run at least once", buf, 0xCu);

  }
LABEL_48:

}

- (void)_newProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2 usingServiceBroker:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "totalUnitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPausable:", 1);
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke;
    v19[3] = &unk_1E37BDC98;
    v19[4] = a1;
    v9 = v6;
    v20 = v9;
    objc_msgSend(v7, "setPausingHandler:", v19);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_2;
    v17[3] = &unk_1E37BDC98;
    v17[4] = a1;
    v10 = v9;
    v18 = v10;
    objc_msgSend(v7, "setResumingHandler:", v17);
    objc_msgSend(v7, "setCancellable:", 1);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_3;
    v14[3] = &unk_1E37BDE50;
    v14[4] = a1;
    v15 = v10;
    v11 = v5;
    v16 = v11;
    v12 = v10;
    objc_msgSend(v7, "setCancellationHandler:", v14);
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_downloadProgressForApp:(void *)a3 fromRemoteProgress:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "downloadTotalUnitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKind:", *MEMORY[0x1E0CB30F8]);
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v5, "downloadCompletedUnitCount"));
    if (objc_msgSend(v5, "phase") == 2)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "throughput");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setThroughput:", v9);

      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "throughput");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInfoObject:forKey:", v11, *MEMORY[0x1E0CB3110]);

      if ((objc_msgSend(v5, "secondsRemaining") & 0x8000000000000000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "secondsRemaining"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEstimatedTimeRemaining:", v12);

      }
    }
    objc_msgSend(v7, "setPausable:", 1);
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke;
    v23[3] = &unk_1E37BDC98;
    v23[4] = a1;
    v14 = v6;
    v24 = v14;
    objc_msgSend(v7, "setPausingHandler:", v23);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_2;
    v21[3] = &unk_1E37BDC98;
    v21[4] = a1;
    v15 = v14;
    v22 = v15;
    objc_msgSend(v7, "setResumingHandler:", v21);
    objc_msgSend(v7, "setCancellable:", 1);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_3;
    v18[3] = &unk_1E37BDE50;
    v18[4] = a1;
    v19 = v15;
    v20 = v5;
    v16 = v15;
    objc_msgSend(v7, "setCancellationHandler:", v18);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_installProgressForApp:(uint64_t)a1 fromRemoteProgress:(void *)a2
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB38A8];
    v3 = a2;
    objc_msgSend(v2, "discreteProgressWithTotalUnitCount:", objc_msgSend(v3, "installTotalUnitCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "installCompletedUnitCount");

    objc_msgSend(v4, "setCompletedUnitCount:", v5);
    objc_msgSend(v4, "setPausable:", 0);
    objc_msgSend(v4, "setCancellable:", 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_postProcessProgressForApp:(void *)a3 fromRemoteProgress:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v5, "postProcessTotalUnitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKind:", *MEMORY[0x1E0CB30F8]);
    objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v5, "postProcessCompletedUnitCount"));
    if (objc_msgSend(v5, "phase") == 5)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "throughput");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setThroughput:", v9);

      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "throughput");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInfoObject:forKey:", v11, *MEMORY[0x1E0CB3110]);

      if ((objc_msgSend(v5, "secondsRemaining") & 0x8000000000000000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "secondsRemaining"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEstimatedTimeRemaining:", v12);

      }
    }
    objc_msgSend(v7, "setPausable:", 1);
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke;
    v23[3] = &unk_1E37BDC98;
    v23[4] = a1;
    v14 = v6;
    v24 = v14;
    objc_msgSend(v7, "setPausingHandler:", v23);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_2;
    v21[3] = &unk_1E37BDC98;
    v21[4] = a1;
    v15 = v14;
    v22 = v15;
    objc_msgSend(v7, "setResumingHandler:", v21);
    objc_msgSend(v7, "setCancellable:", 1);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_3;
    v18[3] = &unk_1E37BDE50;
    v18[4] = a1;
    v19 = v15;
    v20 = v5;
    v16 = v15;
    objc_msgSend(v7, "setCancellationHandler:", v18);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_sendResultsChangedWithResults:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    -[ASDAppQuery _handleQueryOptionsWithResults:](a1, v4);
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__ASDAppQuery__sendResultsChangedWithResults___block_invoke;
    v6[3] = &unk_1E37BDC98;
    v6[4] = a1;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)_unitTest_setHasRunOnce:(BOOL)a3
{
  self->_hasRunOnce = a3;
}

uint64_t __72__ASDAppQuery__executeQueryWithPredicate_onPairedDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleBrokerConnectionNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ASDAppQuery__handleBrokerConnectionNotification___block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __51__ASDAppQuery__handleBrokerConnectionNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    ASDLogHandleForCategory(12);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = (id)objc_opt_class();
      v3 = v5;
      _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Forcing query refresh following broker connection", (uint8_t *)&v4, 0xCu);

    }
    -[ASDAppQuery _handleNotificationRefreshWithUserInfo:](*(_QWORD *)(a1 + 32), 0);
  }
}

void __34__ASDAppQuery__debugReceivedApps___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  ASDLogHandleForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 134218754;
    v10 = v7;
    v11 = 2048;
    v12 = a3 + 1;
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEBUG, "%p app %lu of %lu: %@", (uint8_t *)&v9, 0x2Au);
  }

}

- (void)_handlePauseForApp:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting pause: %{public}@", buf, 0xCu);
    }

    v5 = *(void **)(a1 + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke;
    v6[3] = &unk_1E37BDDD8;
    v7 = v3;
    objc_msgSend(v5, "getLibraryServiceWithCompletionHandler:", v6);

  }
}

void __34__ASDAppQuery__handlePauseForApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke_2;
    v13[3] = &unk_1E37BDDB0;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __34__ASDAppQuery__handlePauseForApp___block_invoke_41;
    v11[3] = &unk_1E37BDDB0;
    v12 = v8;
    objc_msgSend(v7, "pauseApp:withReplyHandler:", v12, v11);

    v9 = v14;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", buf, 0x16u);
    }
  }

}

void __34__ASDAppQuery__handlePauseForApp___block_invoke_2(uint64_t a1, void *a2)
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
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __34__ASDAppQuery__handlePauseForApp___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to pause: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Completed pause: %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_handleResumeForApp:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting resume: %{public}@", buf, 0xCu);
    }

    v5 = *(void **)(a1 + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke;
    v6[3] = &unk_1E37BDDD8;
    v7 = v3;
    objc_msgSend(v5, "getLibraryServiceWithCompletionHandler:", v6);

  }
}

void __35__ASDAppQuery__handleResumeForApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke_2;
    v13[3] = &unk_1E37BDDB0;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __35__ASDAppQuery__handleResumeForApp___block_invoke_43;
    v11[3] = &unk_1E37BDDB0;
    v12 = v8;
    objc_msgSend(v7, "resumeApp:withReplyHandler:", v12, v11);

    v9 = v14;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", buf, 0x16u);
    }
  }

}

void __35__ASDAppQuery__handleResumeForApp___block_invoke_2(uint64_t a1, void *a2)
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
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __35__ASDAppQuery__handleResumeForApp___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[ASDAppQuery]: Failed to resume: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Completed resume: %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_handleCancelForApp:(char)a3 reportRemotely:
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEFAULT, "[ASDAppQuery]: Requesting cancelation: %{public}@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 64);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke;
    v8[3] = &unk_1E37BDE28;
    v10 = a3;
    v8[4] = a1;
    v9 = v5;
    objc_msgSend(v7, "getLibraryServiceWithCompletionHandler:", v8);

  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE buf[24];
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_7;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v7 = (void *)qword_1ECFFA988;
    v36 = qword_1ECFFA988;
    if (!qword_1ECFFA988)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke;
      v38 = &unk_1E37BDEA8;
      v39 = &v33;
      __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)buf);
      v7 = (void *)v34[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v33, 8);
    objc_msgSend(v8, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getActivePairedDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairingID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_2;
      v31[3] = &unk_1E37BDE00;
      v14 = *(_QWORD *)(a1 + 32);
      v13 = a1 + 32;
      v31[4] = v14;
      v32 = *(id *)(v13 + 8);
      objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(v13 + 8);
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_44;
      v29[3] = &unk_1E37BDE00;
      v29[4] = *(_QWORD *)v13;
      v30 = v16;
      objc_msgSend(v15, "cancelApp:onPairedDevice:withReplyHandler:", v30, v11, v29);

    }
    else
    {
LABEL_7:
      v17 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_45;
      v27[3] = &unk_1E37BDE00;
      v19 = *(_QWORD *)(a1 + 32);
      v18 = a1 + 32;
      v27[4] = v19;
      v28 = *(id *)(v18 + 8);
      objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(v18 + 8);
      v25[0] = v17;
      v25[1] = 3221225472;
      v25[2] = __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_46;
      v25[3] = &unk_1E37BDE00;
      v25[4] = *(_QWORD *)v18;
      v26 = v21;
      objc_msgSend(v20, "cancelApp:withReplyHandler:", v26, v25);

    }
  }
  else
  {
    ASDLogHandleForCategory(12);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2114;
      v38 = v6;
      _os_log_error_impl(&dword_19A03B000, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", buf, 0x20u);
    }

  }
}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel remote: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v3;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel remote: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Completed remote cancelation: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

void __50__ASDAppQuery__handleCancelForApp_reportRemotely___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v3;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to cancel: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Completed cancelation: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke(uint64_t a1)
{
  -[ASDAppQuery _handlePauseForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_2(uint64_t a1)
{
  -[ASDAppQuery _handleResumeForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __58__ASDAppQuery__downloadProgressForApp_fromRemoteProgress___block_invoke_3(uint64_t a1)
{
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "reportRemotely"));
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke(uint64_t a1)
{
  -[ASDAppQuery _handlePauseForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_2(uint64_t a1)
{
  -[ASDAppQuery _handleResumeForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __61__ASDAppQuery__postProcessProgressForApp_fromRemoteProgress___block_invoke_3(uint64_t a1)
{
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "reportRemotely"));
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke(uint64_t a1)
{
  -[ASDAppQuery _handlePauseForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_2(uint64_t a1)
{
  -[ASDAppQuery _handleResumeForApp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __72__ASDAppQuery__newProgressForApp_fromRemoteProgress_usingServiceBroker___block_invoke_3(uint64_t a1)
{
  -[ASDAppQuery _handleCancelForApp:reportRemotely:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "reportRemotely"));
}

- (void)_handleAppsRemovedWithBundleIDs:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    -[ASDAppQuery _removeCachedResultsForBundleIDs:](a1, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ASDAppQuery _sendResultsChangedWithResults:](a1, v3);

  }
}

- (void)_handleAppsUpdatedWithResults:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 88));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[ASDAppQuery _updateCachedResultsWithResults:](a1, v5);
      objc_msgSend(v4, "addObjectsFromArray:", v5);
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", *(_QWORD *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "valueForKey:", CFSTR("bundleID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAppQuery _removeCachedResultsForBundleIDs:](a1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObjectsFromArray:", v9);
    }
    -[ASDAppQuery _sendResultsChangedWithResults:](a1, v4);

    v3 = v10;
  }

}

void __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke_2;
    block[3] = &unk_1E37BDE50;
    block[4] = v7;
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v6;
      v10 = v15;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Received refresh notification but refresh failed: %{public}@", buf, 0x16u);

    }
  }

}

void __54__ASDAppQuery__handleNotificationRefreshWithUserInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[ASDAppQuery _debugReceivedApps:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "count");
  v4 = *(id **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    -[ASDAppQuery _handleAppsUpdatedWithResults:](*(_QWORD *)(a1 + 32), v3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 48));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minusSet:", v7);

    if (objc_msgSend(v13, "count"))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v13, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAppQuery _handleAppsRemovedWithBundleIDs:](v8, v9);
LABEL_9:

    }
  }
  else
  {
    v10 = v3;
    v13 = v10;
    if (v4)
    {
      -[ASDAppQuery _replaceCachedResultsWithResults:](v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)objc_msgSend(v13, "copy");
      }
      v9 = v12;
      -[ASDAppQuery _sendResultsChangedWithResults:]((uint64_t)v4, v12);

      goto LABEL_9;
    }
  }

}

void __46__ASDAppQuery__sendResultsChangedWithResults___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "appQuery:resultsDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (int64_t)queryOptions
{
  return self->_queryOptions;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serviceBroker, 0);
  objc_storeStrong((id *)&self->_resultCache, 0);
  objc_storeStrong((id *)&self->_queryExecutor, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
