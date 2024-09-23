@implementation HMDMobileAssetManager

- (HMDMobileAssetManager)init
{
  HMDMobileAssetManager *v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  uint64_t v8;
  NSBackgroundActivityScheduler *scheduler;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSBackgroundActivityScheduler *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HMDMobileAssetManager;
  v2 = -[HMDMobileAssetManager init](&v19, sel_init);
  if (v2)
  {
    v3 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.homed.HMDMobileAssetManager.BackgroundActivityScheduler"));
    scheduler = v2->_scheduler;
    v2->_scheduler = (NSBackgroundActivityScheduler *)v8;

    -[NSBackgroundActivityScheduler setRepeats:](v2->_scheduler, "setRepeats:", 1);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceForKey:", CFSTR("mobileCatalogUpdatePeriodSeconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = (double)objc_msgSend(v12, "integerValue");
    else
      v13 = 86400.0;
    -[NSBackgroundActivityScheduler setInterval:](v2->_scheduler, "setInterval:", v13);
    objc_initWeak(&location, v2);
    v14 = v2->_scheduler;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__HMDMobileAssetManager_init__block_invoke;
    v16[3] = &unk_1E89C0B20;
    objc_copyWeak(&v17, &location);
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v14, "scheduleWithBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)purgeAllInstalledAssets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.HomeKit"));
  objc_msgSend(v2, "returnTypes:", 2);
  if (!objc_msgSend(v2, "queryMetaDataSync"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v2;
    objc_msgSend(v2, "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v20;
      v6 = *MEMORY[0x1E0D4DEE8];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "attributes");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v13;
            v25 = 2112;
            v26 = v10;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Requesting purge of asset with version %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __48__HMDMobileAssetManager_purgeAllInstalledAssets__block_invoke;
          v17[3] = &unk_1E89C0B48;
          v18 = v10;
          v14 = v10;
          objc_msgSend(v8, "purge:", v17);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v4);
    }

    v2 = v15;
  }

}

- (void)handleMetadataAssetUpdated
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Asset installed/updated - processing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDMobileAssetManager_handleMetadataAssetUpdated__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_downloadNewAsset:(id)a3 availableVersion:(unint64_t)a4 newVersion:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "version");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = a5;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Current version %@  best installed version %ld  best not installed version %ld - requesting download", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v15 = objc_alloc_init(MEMORY[0x1E0D4E088]);
    objc_msgSend(v15, "setDiscretionary:", 0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HMDMobileAssetManager__downloadNewAsset_availableVersion_newVersion___block_invoke;
    v16[3] = &unk_1E89C0B70;
    v18 = a5;
    v17 = v8;
    objc_msgSend(v17, "startDownload:then:", v15, v16);

  }
}

- (void)_installAvailableAsset:(id)a3 version:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getLocalFileUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "version");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2048;
      v26 = a4;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Current version: %@,  Best installed asset version: %ld,  path: %@", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("plain-metadata.config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Trying to update metadata in URL %@ from mobile asset.", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMobileAssetManager delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mobileAssetManager:didReceiveMetadata:", self, v19);

    }
  }

}

- (void)_updateMetadata
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  HMDMobileAssetManager *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  unint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.HomeKit"));
  objc_msgSend(v4, "queryMetaDataSync");
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v37 = v4;
    v35 = self;
    -[HMDMobileAssetManager setIndexDownloaded:](self, "setIndexDownloaded:", 1);
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v36 = v5;
    obj = v5;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (!v45)
    {
      v39 = 0;
      v46 = 0;
      v38 = 0;
      goto LABEL_32;
    }
    v39 = 0;
    v46 = 0;
    v38 = 0;
    v44 = *(_QWORD *)v50;
    v43 = *MEMORY[0x1E0D4DEE0];
    v8 = *MEMORY[0x1E0D4DEE8];
    v42 = *MEMORY[0x1E0D4DEE8];
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
        objc_msgSend(v10, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v43);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intValue");

        objc_msgSend(v10, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (int)objc_msgSend(v15, "intValue");

        v17 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v10, "state");
          objc_msgSend(v40, "version");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v54 = v19;
          v55 = 2048;
          v56 = v20;
          v57 = 2048;
          v58 = v16;
          v59 = 2112;
          v60 = v21;
          v61 = 2048;
          v62 = v7;
          v63 = 2048;
          v64 = v46;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Asset (state %ld  Version %ld)  Current version %@  best installed version %ld  best not installed version %ld", buf, 0x3Eu);

          v8 = v42;
        }

        objc_autoreleasePoolPop(v17);
        if (v13 == 1)
        {
          if (objc_msgSend(v10, "state") == 2)
          {
            if (v7 >= v16)
              goto LABEL_23;
            v22 = v10;
            if (v46 <= v16)
            {

              v23 = 0;
              v46 = 0;
            }
            else
            {
              v23 = v39;
            }
            v24 = v38;
            if (v38)
            {
              objc_msgSend(v38, "attributes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v8);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = (void *)MEMORY[0x1D17BA0A0]();
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v54 = v29;
                v55 = 2112;
                v56 = (uint64_t)v26;
                _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Requesting purge of asset with version %@", buf, 0x16u);

                v8 = v42;
              }

              objc_autoreleasePoolPop(v27);
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __40__HMDMobileAssetManager__updateMetadata__block_invoke;
              v47[3] = &unk_1E89C0B48;
              v48 = v26;
              v30 = v26;
              objc_msgSend(v38, "purge:", v47);

              v38 = v22;
              v7 = v16;
              goto LABEL_22;
            }
            v39 = v23;
            v38 = v22;
            v7 = v16;
          }
          else if (v46 < v16 && v7 < v16)
          {
            v23 = v10;
            v46 = v16;
            v24 = v39;
LABEL_22:

            v39 = v23;
          }
        }
LABEL_23:
        ++v9;
      }
      while (v45 != v9);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      v45 = v31;
      if (!v31)
      {
LABEL_32:

        -[HMDMobileAssetManager _downloadNewAsset:availableVersion:newVersion:](v35, "_downloadNewAsset:availableVersion:newVersion:", v39, v7, v46);
        -[HMDMobileAssetManager _installAvailableAsset:version:](v35, "_installAvailableAsset:version:", v38, v7);

        v5 = v36;
        v4 = v37;
        goto LABEL_33;
      }
    }
  }
  v32 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v34;
    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Empty results for asset update query", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v32);
LABEL_33:

}

- (void)_downloadCatalogAndUpdateMetadataIfAble
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];

  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDiscretionary:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke;
  v5[3] = &unk_1E89C0B48;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D4E038], "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.HomeKit"), v4, v5);

}

- (void)_handleMetadataAssetUpdated
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDMobileAssetManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.HomeKit"));
  v5 = objc_msgSend(v4, "queryMetaDataSync");
  if (v5)
  {
    v6 = v5;
    if (v5 == 2)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = (uint64_t)v9;
        v10 = "%{public}@XML file not found. Need to download the catalog first.";
LABEL_12:
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0xCu);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if ((unint64_t)(v6 - 1) > 9)
        v15 = CFSTR("MAQueryUnknownResult");
      else
        v15 = off_1E89C0CA0[v6 - 1];
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to query the asset due to %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (!-[HMDMobileAssetManager indexDownloaded](self, "indexDownloaded"))
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = (uint64_t)v9;
        v10 = "%{public}@First time download or periodically update the mobile catalog and metadata asset.";
        goto LABEL_12;
      }
LABEL_13:

      objc_autoreleasePoolPop(v7);
      -[HMDMobileAssetManager _downloadCatalogAndUpdateMetadataIfAble](self, "_downloadCatalogAndUpdateMetadataIfAble");
      goto LABEL_17;
    }
    -[HMDMobileAssetManager _updateMetadata](self, "_updateMetadata");
  }
LABEL_17:

}

- (HMDMobileAssetManagerDelegate)delegate
{
  return (HMDMobileAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)indexDownloaded
{
  return self->_indexDownloaded;
}

- (void)setIndexDownloaded:(BOOL)a3
{
  self->_indexDownloaded = a3;
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke_2;
  v5[3] = &unk_1E89C0B98;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40) - 1;
      if (v5 > 0x1C)
        v6 = CFSTR("MADownloadUnknownResult");
      else
        v6 = off_1E89C0BB8[v5];
      v7 = v6;
      v8 = 138543618;
      v9 = v4;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_ERROR, "%{public}@Failed to download the cataloag due to %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateMetadata");
  }
}

void __40__HMDMobileAssetManager__updateMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v9 = "%{public}@Failed to purge the asset with version %@";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v12;
    v9 = "%{public}@Asset with version %@ purged";
    v10 = v6;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __71__HMDMobileAssetManager__downloadNewAsset_availableVersion_newVersion___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2 > 0x1D)
        v8 = CFSTR("MADownloadUnknownResult");
      else
        v8 = off_1E89C0BB8[a2 - 1];
      v11 = v8;
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Asset download failed with result %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(__CFString **)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully download the new asset %ld", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

uint64_t __51__HMDMobileAssetManager_handleMetadataAssetUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMetadataAssetUpdated");
}

void __48__HMDMobileAssetManager_purgeAllInstalledAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v9 = "%{public}@Failed to purge the asset with version %@";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v12;
    v9 = "%{public}@Asset with version %@ purged successfully";
    v10 = v6;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __29__HMDMobileAssetManager_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, uint64_t);
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleMetadataAssetUpdated");
  v3[2](v3, 1);

}

@end
