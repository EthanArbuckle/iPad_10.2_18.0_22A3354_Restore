@implementation AEChatKitTransport

- (AEChatKitTransport)init
{
  AEChatKitTransport *v2;
  dispatch_group_t v3;
  OS_dispatch_group *packagePreparationGroup;
  dispatch_queue_t v5;
  OS_dispatch_queue *urlSidetableIsolationQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *alternateURLsByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *primaryURLsByIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AEChatKitTransport;
  v2 = -[AEPackageTransport init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    packagePreparationGroup = v2->__packagePreparationGroup;
    v2->__packagePreparationGroup = (OS_dispatch_group *)v3;

    v5 = dispatch_queue_create("com.apple.AssetExplorer.AEChatKitTransport.sidetable-isolation", MEMORY[0x24BDAC9C0]);
    urlSidetableIsolationQueue = v2->__urlSidetableIsolationQueue;
    v2->__urlSidetableIsolationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    alternateURLsByIdentifier = v2->__alternateURLsByIdentifier;
    v2->__alternateURLsByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    primaryURLsByIdentifier = v2->__primaryURLsByIdentifier;
    v2->__primaryURLsByIdentifier = v9;

  }
  return v2;
}

- (void)stagePersistedPayloads:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AEChatKitAssetPackage *v12;
  AEChatKitAssetPackage *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = [AEChatKitAssetPackage alloc];
          v13 = -[AEChatKitAssetPackage initWithPayload:](v12, "initWithPayload:", v11, (_QWORD)v14);
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    -[AEChatKitTransport stagePackages:](self, "stagePackages:", v5);
  }

}

- (id)_persistedURLsFromURLs:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  int v32;
  void *v33;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id obj;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v39 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    v11 = 0x24BDD1000uLL;
    v36 = *(_QWORD *)v47;
    v37 = v6;
    while (2)
    {
      v12 = 0;
      v38 = v9;
      do
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isFileURL"))
        {
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v16;
          v43 = v7;
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("mov")))
          {
            objc_msgSend(v15, "stringByDeletingPathExtension");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uppercaseString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByAppendingPathExtension:", v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v19;
          }
          objc_msgSend(v13, "lastPathComponent");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x24BDBCF48];
          v50[0] = v39;
          v50[1] = v20;
          v41 = (void *)v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fileURLWithPathComponents:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v11 + 1408), "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v25 = objc_msgSend(v24, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 0, 0, &v45);
          v26 = v45;

          if ((v25 & 1) != 0)
          {
            objc_msgSend(v23, "URLByAppendingPathComponent:", v15);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 1408), "defaultManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0;
            v29 = objc_msgSend(v28, "copyItemAtURL:toURL:error:", v14, v27, &v44);
            v30 = v44;

            if ((v29 & 1) != 0)
            {
              v31 = v27;
              v32 = 0;
            }
            else
            {
              if (a5)
                *a5 = objc_retainAutorelease(v30);

              v31 = 0;
              v43 = 0;
              v32 = 2;
            }

          }
          else
          {
            v31 = 0;
            if (a5)
              *a5 = objc_retainAutorelease(v26);
            v32 = 2;
            v27 = v43;
            v43 = 0;
          }

          if (v32)
          {

            v6 = v37;
            v7 = v43;
            goto LABEL_26;
          }
          v10 = v36;
          v6 = v37;
          v7 = v43;
          v9 = v38;
          v11 = 0x24BDD1000;
        }
        else
        {
          v31 = v14;
        }
        objc_msgSend(v7, "setObject:forKey:", v31, v13);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_26:

  v33 = (void *)objc_msgSend(v7, "copy");
  return v33;
}

- (void)_evictPersistedURLsForPackageIdentifier:(id)a3 evictFiles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  AEChatKitTransport *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a4;
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__981;
  v35 = __Block_byref_object_dispose__982;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__981;
  v29 = __Block_byref_object_dispose__982;
  v30 = 0;
  -[AEChatKitTransport _urlSidetableIsolationQueue](self, "_urlSidetableIsolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __73__AEChatKitTransport__evictPersistedURLsForPackageIdentifier_evictFiles___block_invoke;
  v20 = &unk_24E23B848;
  v21 = self;
  v23 = &v31;
  v8 = v6;
  v22 = v8;
  v24 = &v25;
  dispatch_barrier_sync(v7, &v17);

  if (v4)
  {
    v9 = (void *)v32[5];
    if (v9 || v26[5])
    {
      v10 = (void *)MEMORY[0x24BDBCEF0];
      v11 = objc_msgSend(v9, "count", v17, v18, v19, v20, v21);
      objc_msgSend(v10, "setWithCapacity:", objc_msgSend((id)v26[5], "count") + v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)v32[5];
      if (v13)
      {
        objc_msgSend(v13, "allValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v14);

      }
      v15 = (void *)v26[5];
      if (v15)
      {
        objc_msgSend(v15, "allValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v16);

      }
      -[AEChatKitTransport _evictPersistedURLs:](self, "_evictPersistedURLs:", v12);

    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

- (void)_evictPersistedURLs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFileURL"))
        {
          objc_msgSend(MEMORY[0x24BE72D70], "defaultManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeItemAtURL:completion:", v8, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_preparePackageForCommit:(id)a3 inBaseDirectory:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AEChatKitAssetPackage *v14;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "durableURLsSnapshotApplyingSuppression:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEChatKitTransport _persistedURLsFromURLs:inBaseDirectory:outError:](self, "_persistedURLsFromURLs:inBaseDirectory:outError:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sidecarSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:sidecar:]([AEChatKitAssetPackage alloc], "initWithAssetIdentifier:durableURLs:sidecar:", v12, v11, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_beginStagingWorkForPackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "durableURLsSnapshotApplyingSuppression:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AEPackageTransport delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workingDirForDraft");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    -[AEChatKitTransport _packagePreparationGroup](self, "_packagePreparationGroup");
    v12 = objc_claimAutoreleasedReturnValue();
    -[AEChatKitTransport _workQueue](self, "_workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke;
    v15[3] = &unk_24E23BC20;
    v15[4] = self;
    v16 = v6;
    v17 = v11;
    v18 = v5;
    dispatch_group_async(v12, v13, v15);

  }
  else
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_fault_impl(&dword_21E23A000, v14, OS_LOG_TYPE_FAULT, "Draft directory is empty or nil. Unable to persist attachments for staging: %@", buf, 0xCu);
    }

  }
}

- (void)_updatePrimaryURLsForPackageIdentifier:(id)a3 urls:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AEPackageTransport stagedPackageForIdentifier:](self, "stagedPackageForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject replaceURLForType:withURL:](v10, "replaceURLForType:withURL:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    -[AEChatKitTransport _stagePackage:initiateStagingWork:](self, "_stagePackage:initiateStagingWork:", v10, 0);
    v7 = v18;
  }
  else
  {
    PLAssetExplorerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_21E23A000, v10, OS_LOG_TYPE_ERROR, "Staging work ending early; couldn't find staged package with identifier %@",
        buf,
        0xCu);
    }
  }

}

- (void)_notifyDelegateOfStagingCompleteForIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEPackageTransport delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "chatKitTransport:didUpdatePersistedURLsForPackageIdentifier:", self, v5);

}

- (id)_chatkitPackageForIdentifer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  AEChatKitAssetPackage *v10;
  AEChatKitAssetPackage *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  -[AEPackageTransport stagedPackageForIdentifier:](self, "stagedPackageForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AEChatKitTransport _packagePreparationGroup](self, "_packagePreparationGroup");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__981;
    v20 = __Block_byref_object_dispose__982;
    v21 = 0;
    -[AEChatKitTransport _urlSidetableIsolationQueue](self, "_urlSidetableIsolationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__AEChatKitTransport__chatkitPackageForIdentifer___block_invoke;
    block[3] = &unk_24E23B898;
    block[4] = self;
    v15 = &v16;
    v8 = v4;
    v14 = v8;
    dispatch_sync(v7, block);

    objc_msgSend(v5, "sidecarSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [AEChatKitAssetPackage alloc];
    v11 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:sidecar:](v10, "initWithAssetIdentifier:durableURLs:sidecar:", v8, v17[5], v9);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_workQueue
{
  return dispatch_get_global_queue(25, 0);
}

- (id)finalizePackage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DCIM_MakeUniqueDirectoryWithPath();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEChatKitTransport _preparePackageForCommit:inBaseDirectory:outError:](self, "_preparePackageForCommit:inBaseDirectory:outError:", v6, v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)commitPackage:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "browserItemPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__AEChatKitTransport_commitPackage___block_invoke;
  v6[3] = &unk_24E23BC48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)stagePackage:(id)a3
{
  -[AEChatKitTransport _stagePackage:initiateStagingWork:](self, "_stagePackage:initiateStagingWork:", a3, 1);
}

- (void)_stagePackage:(id)a3 initiateStagingWork:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AEChatKitTransport;
  -[AEPackageTransport stagePackage:](&v7, sel_stagePackage_, v6);
  if (v4)
    -[AEChatKitTransport _beginStagingWorkForPackage:](self, "_beginStagingWorkForPackage:", v6);

}

- (void)stagePackages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AEChatKitTransport;
  -[AEPackageTransport stagePackages:](&v14, sel_stagePackages_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AEChatKitTransport _beginStagingWorkForPackage:](self, "_beginStagingWorkForPackage:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AEChatKitTransport;
  -[AEPackageTransport unstagePackageWithIdentifier:andNotify:](&v12, sel_unstagePackageWithIdentifier_andNotify_, v6, v4);
  -[AEChatKitTransport _packagePreparationGroup](self, "_packagePreparationGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  -[AEChatKitTransport _workQueue](self, "_workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__AEChatKitTransport_unstagePackageWithIdentifier_andNotify___block_invoke;
  v10[3] = &unk_24E23BC48;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_group_async(v7, v8, v10);

}

- (void)_unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  AEChatKitTransport *v12;
  BOOL v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AEChatKitTransport;
  -[AEPackageTransport unstagePackagesWithIdentifiers:](&v14, sel_unstagePackagesWithIdentifiers_, v6);
  -[AEChatKitTransport _packagePreparationGroup](self, "_packagePreparationGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  -[AEChatKitTransport _workQueue](self, "_workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__AEChatKitTransport__unstagePackagesWithIdentifiers_evictFiles___block_invoke;
  block[3] = &unk_24E23B8C0;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v9 = v6;
  dispatch_group_async(v7, v8, block);

}

- (void)unstagePackagesWithIdentifiers:(id)a3 evictFiles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    -[AEChatKitTransport _unstagePackagesWithIdentifiers:evictFiles:](self, "_unstagePackagesWithIdentifiers:evictFiles:", v6, 1);
  }
  else
  {
    -[AEChatKitTransport orderedStagedPayloads](self, "orderedStagedPayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEChatKitTransport _unstagePackagesWithIdentifiers:evictFiles:](self, "_unstagePackagesWithIdentifiers:evictFiles:", v6, 0);
    v8 = v7;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", kAEChatKitPayloadSendSource);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            ++v11;
            AEChatKitSendAnalyticsEventAssetSentFromSource(objc_msgSend(v15, "integerValue"));
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    AEChatKitSendAnalyticsEventAssetsSentCount(v11);

  }
}

- (void)unstagePackagesWithIdentifiers:(id)a3
{
  -[AEChatKitTransport unstagePackagesWithIdentifiers:evictFiles:](self, "unstagePackagesWithIdentifiers:evictFiles:", a3, 1);
}

- (id)orderedStagedPayloads
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AEPackageTransport orderedStagedIdentifiers](self, "orderedStagedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[AEChatKitTransport payloadForIdentifier:](self, "payloadForIdentifier:", v11, v15, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          PLAssetExplorerGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_impl(&dword_21E23A000, v13, OS_LOG_TYPE_ERROR, "Failed to generate browser payload for package identifier %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)payloadForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[AEChatKitTransport _chatkitPackageForIdentifer:](self, "_chatkitPackageForIdentifer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserItemPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_group)_packagePreparationGroup
{
  return self->__packagePreparationGroup;
}

- (OS_dispatch_queue)_urlSidetableIsolationQueue
{
  return self->__urlSidetableIsolationQueue;
}

- (NSMutableDictionary)_alternateURLsByIdentifier
{
  return self->__alternateURLsByIdentifier;
}

- (NSMutableDictionary)_primaryURLsByIdentifier
{
  return self->__primaryURLsByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__primaryURLsByIdentifier, 0);
  objc_storeStrong((id *)&self->__alternateURLsByIdentifier, 0);
  objc_storeStrong((id *)&self->__urlSidetableIsolationQueue, 0);
  objc_storeStrong((id *)&self->__packagePreparationGroup, 0);
}

void __65__AEChatKitTransport__unstagePackagesWithIdentifiers_evictFiles___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_evictPersistedURLsForPackageIdentifier:evictFiles:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(unsigned __int8 *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __61__AEChatKitTransport_unstagePackageWithIdentifier_andNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evictPersistedURLsForPackageIdentifier:evictFiles:", *(_QWORD *)(a1 + 40), 1);
}

void __36__AEChatKitTransport_commitPackage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatKitTransport:commitPayload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50__AEChatKitTransport__chatkitPackageForIdentifer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_alternateURLsByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  id *v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[2];
  BOOL v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  _QWORD block[5];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t v68[128];
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__981;
  v66 = __Block_byref_object_dispose__982;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__981;
  v60 = __Block_byref_object_dispose__982;
  v61 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_urlSidetableIsolationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2;
  block[3] = &unk_24E23B848;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v54 = &v62;
  v53 = v4;
  v55 = &v56;
  dispatch_barrier_sync(v2, block);

  DCIM_MakeUniqueDirectoryWithPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v51 = 0;
  objc_msgSend(v6, "_persistedURLsFromURLs:inBaseDirectory:outError:", v7, v5, &v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v51;
  v10 = v57[5];
  if (!v10)
  {
    +[AEAssetPackage unsuppressedURLsFromURLs:](AEAssetPackage, "unsuppressedURLsFromURLs:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v57[5];
    v57[5] = v11;

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_urlSidetableIsolationQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v44[0] = v3;
    v44[1] = 3221225472;
    v44[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_210;
    v44[3] = &unk_24E23B870;
    v44[4] = *(_QWORD *)(a1 + 32);
    v45 = v8;
    v14 = *(id *)(a1 + 40);
    v47 = v10 == 0;
    v46[0] = v14;
    v46[1] = &v56;
    dispatch_barrier_sync(v13, v44);

    PLAssetExplorerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v70 = v16;
      v71 = 2114;
      v72 = v5;
      _os_log_impl(&dword_21E23A000, v15, OS_LOG_TYPE_DEFAULT, "Successfully staged package with identifier %{public}@ using base directory %{public}@", buf, 0x16u);
    }
    v17 = v10 == 0;

    v18 = &v45;
    v19 = (id *)v46;
    if (v17)
    {
      v41[0] = v3;
      v41[1] = 3221225472;
      v41[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_211;
      v41[3] = &unk_24E23B898;
      v20 = *(void **)(a1 + 40);
      v41[4] = *(_QWORD *)(a1 + 32);
      v42 = v20;
      v43 = &v56;
      dispatch_async(MEMORY[0x24BDAC9B8], v41);

    }
  }
  else
  {
    v48[0] = v3;
    v48[1] = 3221225472;
    v48[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_3;
    v48[3] = &unk_24E23BBF8;
    v21 = *(void **)(a1 + 40);
    v48[4] = *(_QWORD *)(a1 + 32);
    v49 = v21;
    v22 = v9;
    v50 = v22;
    dispatch_async(MEMORY[0x24BDAC9B8], v48);
    PLAssetExplorerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v22, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v24;
      v71 = 2114;
      v72 = v5;
      v73 = 2114;
      v74 = v25;
      _os_log_impl(&dword_21E23A000, v23, OS_LOG_TYPE_ERROR, "Error occurred while staging package with identifier %{public}@ using base directory %{public}@: %{public}@", buf, 0x20u);

    }
    v18 = &v49;
    v19 = &v50;
  }

  v26 = (void *)v63[5];
  if (v26)
  {
    v27 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v26, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend((id)v57[5], "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v68, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v38;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(v30);
          objc_msgSend(v29, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v33++));
        }
        while (v31 != v33);
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v68, 16);
      }
      while (v31);
    }

    objc_msgSend(*(id *)(a1 + 32), "_evictPersistedURLs:", v29);
  }
  v35[0] = v3;
  v35[1] = 3221225472;
  v35[2] = __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2_212;
  v35[3] = &unk_24E23BC48;
  v34 = *(void **)(a1 + 40);
  v35[4] = *(_QWORD *)(a1 + 32);
  v36 = v34;
  dispatch_async(MEMORY[0x24BDAC9B8], v35);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_alternateURLsByIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_primaryURLsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unstagePackageWithIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reportError:", *(_QWORD *)(a1 + 48));
}

void __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_210(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_alternateURLsByIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_primaryURLsByIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_211(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryURLsForPackageIdentifier:urls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __50__AEChatKitTransport__beginStagingWorkForPackage___block_invoke_2_212(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfStagingCompleteForIdentifier:", *(_QWORD *)(a1 + 40));
}

void __73__AEChatKitTransport__evictPersistedURLsForPackageIdentifier_evictFiles___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_alternateURLsByIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_primaryURLsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

@end
