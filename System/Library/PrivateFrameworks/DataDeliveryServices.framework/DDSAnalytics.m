@implementation DDSAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance_sharedInstance;
}

void __30__DDSAnalytics_sharedInstance__block_invoke()
{
  DDSAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(DDSAnalytics);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (DDSAnalytics)init
{
  DDSAnalytics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *analyticByIdentifier;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *analyticQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DDSAnalytics;
  v2 = -[DDSAnalytics init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    analyticByIdentifier = v2->_analyticByIdentifier;
    v2->_analyticByIdentifier = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSAnalytics", v5);
    analyticQueue = v2->_analyticQueue;
    v2->_analyticQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)cancelRecordingForAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Cancel recording asset analytic for %@", buf, 0xCu);

  }
  -[DDSAnalytics analyticQueue](self, "analyticQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__DDSAnalytics_cancelRecordingForAsset___block_invoke;
  v9[3] = &unk_1EA1412F0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

void __40__DDSAnalytics_cancelRecordingForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "analyticByIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (void)recordAssetAction:(int)a3 forAsset:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  int v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  DefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[DDSAnalytics stringForAction:](self, "stringForAction:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    _os_log_debug_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEBUG, "Record asset action: %{public}@ for %{public}@", buf, 0x16u);

  }
  -[DDSAnalytics analyticQueue](self, "analyticQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DDSAnalytics_recordAssetAction_forAsset___block_invoke;
  block[3] = &unk_1EA141908;
  block[4] = self;
  v13 = v6;
  v14 = v4;
  v9 = v6;
  dispatch_sync(v8, block);

}

void __43__DDSAnalytics_recordAssetAction_forAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  DDSAssetDownloadAnalytic *v6;

  objc_msgSend(*(id *)(a1 + 32), "analyticByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v6 = (DDSAssetDownloadAnalytic *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[DDSAssetDownloadAnalytic initWithAsset:]([DDSAssetDownloadAnalytic alloc], "initWithAsset:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "analyticByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
  -[DDSTimedAnalytic updateWithAction:](v6, "updateWithAction:", *(unsigned int *)(a1 + 48));
  if ((*(_DWORD *)(a1 + 48) - 3) <= 1)
    objc_msgSend(*(id *)(a1 + 32), "reportAssetDownloadAnalytic:", v6);

}

- (void)reportAssetDownloadAnalytic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "assetDownloadDurationBuckets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAnalytics bucketForValue:fromBuckets:](self, "bucketForValue:fromBuckets:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "roundNumber:toSignificantDigits:", v10, &unk_1EA14D250);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("aggDuration"));
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("duration"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "success"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("success"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "compatibilityVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("compatibilityVersion"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "contentVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("contentVersion"));

  objc_msgSend(v4, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("assetName"));

  -[DDSAnalytics processName](self, "processName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("process"));

  DefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[DDSAnalytics reportAssetDownloadAnalytic:].cold.1((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);

  objc_msgSend(CFSTR("com.apple.keyboard.dataDeliveryServices."), "stringByAppendingString:", CFSTR("assetDownload"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  v30 = v5;
  AnalyticsSendEventLazy();

  -[DDSAnalytics analyticByIdentifier](self, "analyticByIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "removeObjectForKey:", v32);

}

id __44__DDSAnalytics_reportAssetDownloadAnalytic___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportUpdateCycleAnalytic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "retries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("retries"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "success"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("success"));

  -[DDSAnalytics processName](self, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("process"));

  DefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DDSAnalytics reportUpdateCycleAnalytic:].cold.1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend(CFSTR("com.apple.keyboard.dataDeliveryServices."), "stringByAppendingString:", CFSTR("updateCycle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  v18 = v5;
  AnalyticsSendEventLazy();

  -[DDSAnalytics analyticByIdentifier](self, "analyticByIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObjectForKey:", v20);

}

id __42__DDSAnalytics_reportUpdateCycleAnalytic___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dumpAssetLogWithAssertions:(id)a3 installedAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (DDS_IS_INTERNAL_INSTALL())
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DDS_STRING_FROM_DATE(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("/var/tmp/dds_dump_%@.log"), v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1EA1420B0);
    objc_msgSend(v11, "appendString:", CFSTR("Assertions:\n"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dumpDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendFormat:", CFSTR("\n%@\n"), v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "appendString:", CFSTR("\nInstalled Assets:\n"));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(v23, "debuggingID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendFormat:", CFSTR("\n%@ (%lu)"), v24, objc_msgSend(v23, "contentVersion"));

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v20);
    }

    objc_msgSend(v11, "appendString:", CFSTR("\n\nIn Progress:\n"));
    -[DDSAnalytics analyticByIdentifier](self, "analyticByIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __59__DDSAnalytics_dumpAssetLogWithAssertions_installedAssets___block_invoke;
    v30[3] = &unk_1EA141958;
    v30[4] = self;
    v26 = v11;
    v31 = v26;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);

    DefaultLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_log_impl(&dword_1DA990000, v27, OS_LOG_TYPE_DEFAULT, "Dumping: \n%{public}@", buf, 0xCu);
    }

    objc_msgSend(v26, "writeToFile:atomically:encoding:error:", v28, 1, 4, 0);
    v6 = v29;
  }

}

void __59__DDSAnalytics_dumpAssetLogWithAssertions_installedAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debuggingID");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v11, "startTime");
  v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  DDS_STRING_FROM_DATE(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringForAction:", objc_msgSend(v11, "lastAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\n%@, (start: %@, state: %@ retries: %lu)"), v4, v9, v10, objc_msgSend(v11, "retries"));

}

+ (id)assetDownloadDurationBuckets
{
  if (assetDownloadDurationBuckets_onceToken != -1)
    dispatch_once(&assetDownloadDurationBuckets_onceToken, &__block_literal_global_52);
  return (id)assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets;
}

void __44__DDSAnalytics_assetDownloadDurationBuckets__block_invoke()
{
  void *v0;

  v0 = (void *)assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets;
  assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets = (uint64_t)&unk_1EA14D2C8;

}

- (id)bucketForValue:(id)a3 fromBuckets:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__DDSAnalytics_bucketForValue_fromBuckets___block_invoke;
  v10[3] = &unk_1EA1419A0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __43__DDSAnalytics_bucketForValue_fromBuckets___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7;
  uint64_t v8;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = a2;
  v8 = objc_msgSend(*(id *)(a1 + 32), "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  *a4 = v8 != 1;
}

+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4
{
  id v5;
  id v6;
  char v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "isInteger:", v5);
    objc_msgSend(v5, "doubleValue");
    if (v8 == 0.0)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if ((v7 & 1) != 0)
      {
        v10 = 0;
LABEL_8:
        objc_msgSend(v9, "numberWithInt:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v16 = 0.0;
    }
    else
    {
      v12 = v8;
      v13 = objc_msgSend(v6, "intValue");
      v14 = log10(fabs(v12));
      v15 = __exp10((double)(int)(v13 - vcvtpd_s64_f64(v14)));
      v16 = round(v12 * v15) / v15;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if ((v7 & 1) != 0)
      {
        v10 = (int)v16;
        goto LABEL_8;
      }
    }
    objc_msgSend(v9, "numberWithDouble:", v16);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v11 = v5;
LABEL_11:
  v17 = v11;

  return v17;
}

+ (BOOL)isInteger:(id)a3
{
  id v3;
  CFTypeID v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("BcsilqCSILQ", *(char *)objc_msgSend(objc_retainAutorelease(v3), "objCType"), 0xCuLL) != 0;

  return v5;
}

- (id)processName
{
  if (processName_onceToken != -1)
    dispatch_once(&processName_onceToken, &__block_literal_global_59);
  return (id)processName_processName;
}

void __27__DDSAnalytics_processName__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)processName_processName;
  processName_processName = v0;

}

- (id)stringForAction:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1EA1419E0[a3];
}

- (NSMutableDictionary)analyticByIdentifier
{
  return self->_analyticByIdentifier;
}

- (OS_dispatch_queue)analyticQueue
{
  return self->_analyticQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticQueue, 0);
  objc_storeStrong((id *)&self->_analyticByIdentifier, 0);
}

- (void)reportAssetDownloadAnalytic:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1DA990000, a2, a3, "Report asset download analytic: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)reportUpdateCycleAnalytic:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1DA990000, a2, a3, "Report update catalog analytic: %{public}@", a5, a6, a7, a8, 2u);
}

@end
