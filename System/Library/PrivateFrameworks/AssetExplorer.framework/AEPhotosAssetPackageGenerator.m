@implementation AEPhotosAssetPackageGenerator

- (void)_commonAEPhotosAssetPackageGeneratorInitWithAsset:(id)a3 assetReference:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_group *v9;
  OS_dispatch_group *packagerWorkGroup;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  PHAssetExportRequest *v15;
  id v16;
  PHAssetExportRequest *exportRequest;
  PHAssetExportRequest *v18;
  NSObject *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *packagerIvarIsolationQueue;
  id v22;
  _BYTE buf[32];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (OS_dispatch_group *)dispatch_group_create();
  packagerWorkGroup = self->__packagerWorkGroup;
  self->__packagerWorkGroup = v9;

  objc_storeStrong((id *)&self->__asset, a3);
  v11 = (void *)objc_msgSend(v8, "copy");

  v12 = v11;
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x24BE72738]);
    v14 = *(_OWORD *)(MEMORY[0x24BE72860] + 16);
    *(_OWORD *)buf = *MEMORY[0x24BE72860];
    *(_OWORD *)&buf[16] = v14;
    v12 = (void *)objc_msgSend(v13, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v7, 0, buf);
  }
  objc_storeStrong((id *)&self->_sourceAssetReference, v12);
  if (!v11)

  v22 = 0;
  objc_msgSend(MEMORY[0x24BDE34C0], "exportRequestForAsset:error:", v7, &v22);
  v15 = (PHAssetExportRequest *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  exportRequest = self->__exportRequest;
  self->__exportRequest = v15;

  v18 = self->__exportRequest;
  if (!v18)
  {
    PLAssetExplorerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_21E23A000, v19, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not create export request for asset: %{public}@. Error: %{public}@", buf, 0x16u);
    }

    v18 = self->__exportRequest;
  }
  -[PHAssetExportRequest setAnalyticsActivityType:](v18, "setAnalyticsActivityType:", *MEMORY[0x24BE8F6B8]);
  -[PHAssetExportRequest setShouldSendTimingIntervalsToAnalytics:](self->__exportRequest, "setShouldSendTimingIntervalsToAnalytics:", 1);
  v20 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AssetExplorer.AEPhotosAssetPackageGenerator.ivarQueue", MEMORY[0x24BDAC9C0]);
  packagerIvarIsolationQueue = self->__packagerIvarIsolationQueue;
  self->__packagerIvarIsolationQueue = v20;

}

- (AEPhotosAssetPackageGenerator)initWithAssetReference:(id)a3
{
  id v4;
  void *v5;
  AEPhotosAssetPackageGenerator *v6;
  AEPhotosAssetPackageGenerator *v7;
  AEPhotosAssetPackageGenerator *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)AEPhotosAssetPackageGenerator;
    v6 = -[AEPhotosAssetPackageGenerator init](&v10, sel_init);
    v7 = v6;
    if (v6)
      -[AEPhotosAssetPackageGenerator _commonAEPhotosAssetPackageGeneratorInitWithAsset:assetReference:](v6, "_commonAEPhotosAssetPackageGeneratorInitWithAsset:assetReference:", v5, v4);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AEPhotosAssetPackageGenerator)initWithAsset:(id)a3
{
  id v4;
  AEPhotosAssetPackageGenerator *v5;
  AEPhotosAssetPackageGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEPhotosAssetPackageGenerator;
  v5 = -[AEPhotosAssetPackageGenerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AEPhotosAssetPackageGenerator _commonAEPhotosAssetPackageGeneratorInitWithAsset:assetReference:](v5, "_commonAEPhotosAssetPackageGeneratorInitWithAsset:assetReference:", v4, 0);

  return v6;
}

- (id)beginGenerating
{
  void *v3;
  void *v4;

  -[AEPhotosAssetPackageGenerator _asset](self, "_asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEPhotosAssetPackageGenerator _generatePackageFromAsset:](self, "_generatePackageFromAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)retrieveGeneratedPackageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  intptr_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[AEPhotosAssetPackageGenerator _packagerWorkGroup](self, "_packagerWorkGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_wait(v5, 0);

  if (v6)
  {
    -[AEPhotosAssetPackageGenerator _packagerWorkGroup](self, "_packagerWorkGroup");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_2;
    block[3] = &unk_24E23BB80;
    block[4] = self;
    v14 = v4;
    v9 = v4;
    dispatch_group_notify(v7, v8, block);

    v10 = v14;
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke;
    v15[3] = &unk_24E23BB30;
    v16 = v4;
    v11 = v4;
    -[AEPhotosAssetPackageGenerator _callCompletionWithResult:](self, "_callCompletionWithResult:", v15);
    v10 = v16;
  }

  return v6 == 0;
}

- (NSProgress)progress
{
  void *v2;
  void *v3;

  -[AEPhotosAssetPackageGenerator _exportRequest](self, "_exportRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v3;
}

- (void)_callCompletionWithResult:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  -[AEPhotosAssetPackageGenerator progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCancelled");

  v7 = 0;
  v8 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v11 = 0;
  v12 = &v11;
  v20 = __Block_byref_object_copy__1308;
  v21 = __Block_byref_object_dispose__1309;
  v22 = 0;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1308;
  v15 = __Block_byref_object_dispose__1309;
  v16 = 0;
  if ((v6 & 1) == 0)
  {
    -[AEPhotosAssetPackageGenerator _packagerIvarIsolationQueue](self, "_packagerIvarIsolationQueue", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AEPhotosAssetPackageGenerator__callCompletionWithResult___block_invoke;
    block[3] = &unk_24E23BBD0;
    block[4] = self;
    block[5] = &v17;
    block[6] = &v11;
    dispatch_sync(v9, block);

    v8 = v18[5];
    v7 = v12[5];
  }
  v4[2](v4, v8, v7, v6);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

- (void)_generatePackageWithAssetExportFileURLs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  AEPhotosAssetPackageGenerator *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[AEPhotosAssetPackageGenerator _asset](self, "_asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEPhotosAssetPackageGenerator _packagerWorkGroup](self, "_packagerWorkGroup");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke;
  v14[3] = &unk_24E23BC20;
  v15 = v7;
  v16 = v6;
  v17 = self;
  v18 = v8;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_group_async(v9, v10, v14);

}

- (id)_generatePackageFromAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  NSObject *v27;
  uint8_t buf[16];

  v4 = a3;
  -[AEPhotosAssetPackageGenerator _packagerWorkGroup](self, "_packagerWorkGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);
  -[AEPhotosAssetPackageGenerator _exportRequest](self, "_exportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = _os_feature_enabled_impl();
  if ((v6 & PLIsLockdownMode()) == 1)
  {
    PLPickerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E23A000, v8, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location and caption metadata by default.", buf, 2u);
    }

  }
  -[AEPhotosAssetPackageGenerator preparationOptions](self, "preparationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AEPhotosAssetPackageGenerator preparationOptions](self, "preparationOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shouldIncludeLocation");

    -[AEPhotosAssetPackageGenerator preparationOptions](self, "preparationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shouldIncludeCaption");

    -[AEPhotosAssetPackageGenerator preparationOptions](self, "preparationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userEncodingPolicy");

  }
  v13 = PUActivityItemSharingPreferencesMake();
  v15 = v14;
  v16 = objc_alloc(MEMORY[0x24BE72D20]);
  -[AEPhotosAssetPackageGenerator _exportRequest](self, "_exportRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "variants");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithAsset:availableSharingVariants:activityType:preferences:", v4, v18, *MEMORY[0x24BE8F6B8], v13, v15);

  objc_msgSend(v19, "assetExportRequestOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFlattenSlomoVideos:", 0);
  -[AEPhotosAssetPackageGenerator _exportRequest](self, "_exportRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke;
  v25[3] = &unk_24E23BC70;
  v25[4] = self;
  v26 = v4;
  v27 = v5;
  v22 = v5;
  v23 = v4;
  objc_msgSend(v21, "exportWithOptions:completionHandler:", v20, v25);

  return v7;
}

- (id)_createOutputDirectoryBaseURLWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "fileExistsAtPath:", v8))
  {
    PLAssetExplorerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = v5;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_21E23A000, v11, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Output directory for identifier '%{public}@' already exists at: '%{public}@'. Deleting...", (uint8_t *)&v20, 0x16u);
    }

    if ((objc_msgSend(v9, "removeItemAtURL:error:", v10, a4) & 1) == 0)
    {
      PLAssetExplorerGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *a4;
        v20 = 138543618;
        v21 = v8;
        v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_21E23A000, v12, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error deleting directory '%{public}@'. Error: %{public}@", (uint8_t *)&v20, 0x16u);
      }

    }
  }
  if (*a4)
    goto LABEL_16;
  v14 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4);
  PLAssetExplorerGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = *a4;
      v20 = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_21E23A000, v16, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Unable to create directory '%{public}@' for saving exported asset resources of identifier: %{public}@. Error: %{public}@", (uint8_t *)&v20, 0x20u);
    }

LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v5;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_21E23A000, v16, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Created output directory for identifier '%{public}@' at: '%{public}@'.", (uint8_t *)&v20, 0x16u);
  }

  v17 = v10;
LABEL_17:

  return v17;
}

- (id)_copyItemAtURL:(id)a3 toOutputDirectory:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD1580];
  v9 = a4;
  objc_msgSend(v8, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "copyItemAtURL:toURL:error:", v7, v12, a5))
  {
    v13 = v12;
  }
  else
  {
    PLAssetExplorerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *a5;
      v17 = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_21E23A000, v14, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Couldn't copy item at URL '%{public}@' to '%{public}@'. Error: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)_copyAssetExportFileURLs:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEPhotosAssetPackageGenerator _createOutputDirectoryBaseURLWithIdentifier:error:](self, "_createOutputDirectoryBaseURLWithIdentifier:error:", v9, a5);
  v10 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v8;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v13)
    {
      v14 = v13;
      v25 = v8;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v17, v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[AEPhotosAssetPackageGenerator _copyItemAtURL:toOutputDirectory:error:](self, "_copyItemAtURL:toOutputDirectory:error:", v18, v26, a5);
          if (!v19)
          {
            PLAssetExplorerGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = *a5;
              *(_DWORD *)buf = 138543618;
              v32 = v12;
              v33 = 2114;
              v34 = v22;
              _os_log_impl(&dword_21E23A000, v21, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error making local copy of asset export file URLs: %{public}@. Error: %{public}@", buf, 0x16u);
            }

            v11 = 0;
            goto LABEL_14;
          }
          v20 = v19;
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
          continue;
        break;
      }
LABEL_14:
      v8 = v25;
    }
  }
  else
  {
    PLAssetExplorerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v23 = *a5;
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_21E23A000, v12, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error making local copy of asset export file URLs because the temporary output directory coudln't be created: %{public}@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_assetPackageforPHAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  AEMutableAssetPackage *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  _BYTE v60[20];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDE36D0]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDE36D8]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDE36C8]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetExplorerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_21E23A000, v8, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Creating asset package for asset %{public}@ with file URLS: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v6, "isPhoto"))
    v10 = objc_msgSend(v6, "canPlayLoopingVideo") ^ 1;
  else
    v10 = 0;
  if ((objc_msgSend(v6, "isVideo") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v6, "canPlayLoopingVideo");
  if (v50)
    v12 = v10;
  else
    v12 = 0;
  if (v12 == 1)
  {
    v13 = v50;
    if (objc_msgSend(v6, "playbackStyle") == 3)
    {
      if (!v49)
      {
        PLAssetExplorerGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E23A000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] No video URL found for Live Photo asset, from asset export request.", buf, 2u);
        }
        v29 = 0;
        v15 = 0;
        v14 = 0;
        goto LABEL_57;
      }
      v14 = v49;
      v15 = 0;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
  }
  else
  {
    if (v49)
      v16 = v11;
    else
      v16 = 0;
    if (v16 != 1)
    {
      PLAssetExplorerGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "uuid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        v19 = v18;
        if (v50)
          v20 = CFSTR("YES");
        else
          v20 = CFSTR("NO");
        v21 = v20;
        v22 = v19;
        if (v11)
          v23 = CFSTR("YES");
        else
          v23 = CFSTR("NO");
        v24 = v23;
        v25 = v21;
        if (v49)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        v27 = v26;
        v28 = v24;
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        v59 = (uint64_t (*)(uint64_t, uint64_t))v21;
        *(_WORD *)v60 = 2114;
        *(_QWORD *)&v60[2] = v24;
        *(_WORD *)&v60[10] = 2114;
        *(_QWORD *)&v60[12] = v27;
        _os_log_impl(&dword_21E23A000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not retrieve valid URLs for creating a package for asset: %{public}@. Is image? %{public}@. Photo URL available? %{public}@. Is video or auto/loop? %{public}@. Video URL available? %{public}@.", buf, 0x34u);

      }
      v29 = 0;
      v15 = 0;
      v14 = 0;
      v13 = 0;
      goto LABEL_57;
    }
    v14 = v49;
    if (objc_msgSend(v6, "isHighFrameRateVideo"))
    {
      objc_msgSend(v6, "ALAssetURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v13 = 0;
  }
  v30 = v6;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__1308;
  *(_QWORD *)v60 = __Block_byref_object_dispose__1309;
  *(_QWORD *)&v60[8] = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1308;
  v56 = __Block_byref_object_dispose__1309;
  v57 = 0;
  objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "masterThumbnailFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "sizeWithFallBackSize:", 256.0, 256.0);
  v34 = v33;
  v36 = v35;
  v37 = objc_alloc_init(MEMORY[0x24BDE3598]);
  objc_msgSend(v37, "setVersion:", 0);
  objc_msgSend(v37, "setSynchronous:", 1);
  objc_msgSend(v37, "setDeliveryMode:", 1);
  objc_msgSend(v37, "setNetworkAccessAllowed:", 0);
  objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = ___PreviewImageForAsset_block_invoke;
  v51[3] = &unk_24E23BCF8;
  v51[4] = buf;
  v51[5] = &v52;
  objc_msgSend(v38, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v30, 0, v37, v51, v34, v36);

  if (a5)
  {
    v39 = (void *)v53[5];
    if (v39)
      *a5 = objc_retainAutorelease(v39);
  }
  v29 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(buf, 8);

  if (!v29)
  {
    PLAssetExplorerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v30, "uuid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *a5;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v44;
      _os_log_impl(&dword_21E23A000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not generate preview image for asset: %{public}@. Error: %{public}@", buf, 0x16u);

    }
    v29 = 0;
LABEL_57:
    v40 = 0;
    goto LABEL_58;
  }
  objc_msgSend(v30, "uuid");
  v17 = objc_claimAutoreleasedReturnValue();
  v40 = -[AEMutableAssetPackage initWithAssetIdentifier:]([AEMutableAssetPackage alloc], "initWithAssetIdentifier:", v17);
  if (v13)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMutableAssetPackage storeURL:forType:](v40, "storeURL:forType:", v13, v41);

  }
  if (v14)
  {
    objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMutableAssetPackage storeURL:forType:](v40, "storeURL:forType:", v14, v42);

  }
  -[AEMutableAssetPackage setSidecarObject:forKey:](v40, "setSidecarObject:forKey:", v29, CFSTR("com.apple.assetexplorer.asset-preview-image"));
  if (v15)
    -[AEMutableAssetPackage storeURL:forType:](v40, "storeURL:forType:", v15, CFSTR("com.apple.assetexplorer.alasset.url"));
  -[AEMutableAssetPackage storeMetadataFromPHAsset:imageURL:adjustmentURL:](v40, "storeMetadataFromPHAsset:imageURL:adjustmentURL:", v30, v50, v48);
LABEL_58:

  return v40;
}

- (void)requestReviewAssetWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[AEPhotosAssetPackageGenerator beginGenerating](self, "beginGenerating");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E23BB30;
  v8 = v4;
  v6 = v4;
  -[AEPhotosAssetPackageGenerator retrieveGeneratedPackageWithCompletion:](self, "retrieveGeneratedPackageWithCompletion:", v7);

}

- (void)cancelReviewAssetRequest
{
  id v2;

  -[AEPhotosAssetPackageGenerator progress](self, "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (PXAssetReference)sourceAssetReference
{
  return self->_sourceAssetReference;
}

- (PUPickerAssetPreparationOptions)preparationOptions
{
  return self->_preparationOptions;
}

- (void)setPreparationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_preparationOptions, a3);
}

- (OS_dispatch_queue)_packagerIvarIsolationQueue
{
  return self->__packagerIvarIsolationQueue;
}

- (OS_dispatch_group)_packagerWorkGroup
{
  return self->__packagerWorkGroup;
}

- (PHAssetExportRequest)_exportRequest
{
  return self->__exportRequest;
}

- (AEAssetPackage)_ivarQueue_currentPackage
{
  return self->__ivarQueue_currentPackage;
}

- (void)_setIvarQueueCurrentPackage:(id)a3
{
  objc_storeStrong((id *)&self->__ivarQueue_currentPackage, a3);
}

- (NSError)_ivarQueue_lastError
{
  return self->__ivarQueue_lastError;
}

- (void)_setIvarQueueLastError:(id)a3
{
  objc_storeStrong((id *)&self->__ivarQueue_lastError, a3);
}

- (PHAsset)_asset
{
  return self->__asset;
}

- (void)set_asset:(id)a3
{
  objc_storeStrong((id *)&self->__asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__asset, 0);
  objc_storeStrong((id *)&self->__ivarQueue_lastError, 0);
  objc_storeStrong((id *)&self->__ivarQueue_currentPackage, 0);
  objc_storeStrong((id *)&self->__exportRequest, 0);
  objc_storeStrong((id *)&self->__packagerWorkGroup, 0);
  objc_storeStrong((id *)&self->__packagerIvarIsolationQueue, 0);
  objc_storeStrong((id *)&self->_preparationOptions, 0);
  objc_storeStrong((id *)&self->_sourceAssetReference, 0);
}

void __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  _QWORD block[4];
  void (**v18)(_QWORD);
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v7, "reviewAssetFromPackageMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_24E23BCA8;
  v22 = *(id *)(a1 + 32);
  v23 = v11;
  v24 = a4;
  v14 = v9;
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2207ACE9C](v19);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v16[2](v16);
  }
  else
  {
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_3;
    block[3] = &unk_24E23BCD0;
    v18 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v9 = (void *)objc_msgSend(v7, "_copyAssetExportFileURLs:forAsset:error:", v5, v8, &v16);
    v10 = v16;
    objc_msgSend(*(id *)(a1 + 32), "_generatePackageWithAssetExportFileURLs:error:", v9, v10);

  }
  else if (v6)
  {
    PLAssetExplorerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_21E23A000, v11, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error during asset export request for asset: %{public}@. Error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_packagerIvarIsolationQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke_150;
    block[3] = &unk_24E23BC48;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v6;
    dispatch_sync(v13, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke_150(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIvarQueueLastError:", *(_QWORD *)(a1 + 40));
}

void __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v2 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 32))
  {
    v4 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v14 = v2;
    objc_msgSend(v4, "_assetPackageforPHAsset:withAssetExportRequestFileURLs:error:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;

    v2 = v6;
  }
  else
  {
    v3 = 0;
  }
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(*(id *)(a1 + 48), "_packagerIvarIsolationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke_2;
  v11[3] = &unk_24E23BBF8;
  v11[4] = *(_QWORD *)(a1 + 48);
  v12 = v2;
  v13 = v7;
  v9 = v7;
  v10 = v2;
  dispatch_sync(v8, v11);

}

uint64_t __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setIvarQueueLastError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setIvarQueueCurrentPackage:", *(_QWORD *)(a1 + 48));
}

void __59__AEPhotosAssetPackageGenerator__callCompletionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_currentPackage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_lastError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_3;
  v2[3] = &unk_24E23BB30;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_callCompletionWithResult:", v2);

}

void __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_4;
  v12[3] = &unk_24E23BB58;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v13 = v7;
  v16 = a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

uint64_t __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

+ (void)deleteTemporaryStorageWithTimeout:(double)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  PLAssetExplorerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E23A000, v4, OS_LOG_TYPE_DEFAULT, "Beginning clean of temporary asset package storage", buf, 2u);
  }

  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v5, "containsString:", CFSTR("Plugin"))
    && objc_msgSend(v6, "fileExistsAtPath:", v5))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 1, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (!v8)
    {
      PLAssetExplorerGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_21E23A000, v10, OS_LOG_TYPE_ERROR, "Failed to get contents of tmp directory with error %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    px_dispatch_queue_create_serial();
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__AEPhotosAssetPackageGenerator_deleteTemporaryStorageWithTimeout___block_invoke;
    v12[3] = &unk_24E23BBA8;
    v13 = v8;
    v15 = a3;
    v14 = v6;
    dispatch_async(v11, v12);

  }
  else
  {
    PLAssetExplorerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E23A000, v11, OS_LOG_TYPE_DEFAULT, "No temporary asset packages to clean up", buf, 2u);
    }
  }

}

void __67__AEPhotosAssetPackageGenerator_deleteTemporaryStorageWithTimeout___block_invoke(uint64_t a1)
{
  double Current;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (CFAbsoluteTimeGetCurrent() - Current > *(double *)(a1 + 48))
        {
          PLAssetExplorerGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E23A000, v16, OS_LOG_TYPE_DEFAULT, "Timed out deleting temporary asset package storage", buf, 2u);
          }

          goto LABEL_19;
        }
        v11 = *(void **)(a1 + 40);
        v20 = 0;
        v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v20);
        v13 = v20;
        if (v12)
        {
          ++v7;
        }
        else
        {
          PLAssetExplorerGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v26 = *(double *)&v15;
            v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_21E23A000, v14, OS_LOG_TYPE_ERROR, "Failed to delete temporary asset package at %@: %{public}@", buf, 0x16u);

          }
          ++v6;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
LABEL_19:

  v17 = CFAbsoluteTimeGetCurrent();
  PLAssetExplorerGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218752;
    v26 = v17 - Current;
    v27 = 2048;
    v28 = v7;
    v29 = 2048;
    v30 = v19;
    v31 = 2048;
    v32 = v6;
    _os_log_impl(&dword_21E23A000, v18, OS_LOG_TYPE_DEFAULT, "Finished deleting temporary asset package storage in %lf seconds. Deleted %lu of %lu with %lu failures", buf, 0x2Au);
  }

}

@end
