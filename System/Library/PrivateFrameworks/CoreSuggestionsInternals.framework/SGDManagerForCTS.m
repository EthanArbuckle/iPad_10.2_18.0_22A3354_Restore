@implementation SGDManagerForCTS

+ (id)sharedSingletonInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SGDManagerForCTS_sharedSingletonInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSingletonInstance_onceToken != -1)
    dispatch_once(&sharedSingletonInstance_onceToken, block);
  return (id)sharedSingletonInstance_singletonInstance;
}

- (SGDManagerForCTS)initWithHarvestStoreGetter:(id)a3 xpcActivityManager:(id)a4
{
  id v6;
  id v7;
  SGDManagerForCTS *v8;
  SGDManagerForCTS *v9;
  void *v10;
  uint64_t v11;
  id harvestStoreGetter;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGDManagerForCTS;
  v8 = -[SGDManagerForCTS init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_xpcActivityManager, a4);
    pthread_mutex_init(&v9->_geocodeLock, 0);
    pthread_mutex_init(&v9->_verificationLock, 0);
    if (v6)
      v10 = v6;
    else
      v10 = &__block_literal_global_12;
    v11 = MEMORY[0x1C3BD5158](v10);
    harvestStoreGetter = v9->_harvestStoreGetter;
    v9->_harvestStoreGetter = (id)v11;

    v9->_ctsCriteriaState = 0;
    if (_os_feature_enabled_impl())
      v13 = +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  }

  return v9;
}

- (void)registerForCTS
{
  -[SGDManagerForCTS _registerForCTSTrimActivity](self, "_registerForCTSTrimActivity");
  -[SGDManagerForCTS _registerForCTSVacuumActivity](self, "_registerForCTSVacuumActivity");
  -[SGDManagerForCTS _registerForCTSIdentityAnalysisActivity](self, "_registerForCTSIdentityAnalysisActivity");
  -[SGDManagerForCTS _registerForCTSSendRTCActivity](self, "_registerForCTSSendRTCActivity");
  -[SGDManagerForCTS _registerForCollectWeeklyStats](self, "_registerForCollectWeeklyStats");
  -[SGDManagerForCTS _registerForContactDetailCacheRebuildActivity](self, "_registerForContactDetailCacheRebuildActivity");
  -[SGDManagerForCTS _registerProcessPendingGeocodesActivity](self, "_registerProcessPendingGeocodesActivity");
  -[SGDManagerForCTS _registerProcessPendingVerificationActivity](self, "_registerProcessPendingVerificationActivity");
  -[SGDManagerForCTS _registerMailIntelligenceTasksActivity](self, "_registerMailIntelligenceTasksActivity");
  -[SGDManagerForCTS _registerHarvestedURLMetricUploadActivity](self, "_registerHarvestedURLMetricUploadActivity");
  -[SGDManagerForCTS _registerAnalyticsHeartbeatActivity](self, "_registerAnalyticsHeartbeatActivity");
  -[SGDManagerForCTS _registerMobileAssetMetadataDownloadActivity](self, "_registerMobileAssetMetadataDownloadActivity");
}

- (id)serviceContext
{
  SGServiceContext *v3;
  void *v4;
  SGServiceContext *v5;

  v3 = [SGServiceContext alloc];
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGServiceContext initWithStore:](v3, "initWithStore:", v4);

  return v5;
}

- (void)_registerMobileAssetMetadataDownloadActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for MobileAsset metadata download with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SGDManagerForCTS__registerMobileAssetMetadataDownloadActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 11, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performMobileAssetMetadataDownloadActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  SGDManagerForCTS *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[3];

  v4 = a3;
  v26[2] = 0;
  v26[0] = CFSTR("com.apple.suggestd.ma-metadata-download");
  v26[1] = mach_absolute_time();
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke;
  v24[3] = &unk_1E7DA9670;
  v8 = v5;
  v25 = v8;
  objc_msgSend(v6, "downloadMetadataWithCompletion:", v24);

  SGRecordMeasurementState(v26);
  dispatch_group_enter(v8);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3810000000;
  v22 = 0;
  v23 = 0;
  v21[3] = "";
  v21[4] = CFSTR("com.apple.suggestd.ma-metadata-download");
  v22 = mach_absolute_time();
  v23 = 0;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_24;
  v18[3] = &unk_1E7DB7430;
  v20 = v21;
  v9 = v8;
  v19 = v9;
  +[SGAsset downloadMetadataWithCompletion:](SGAsset, "downloadMetadataWithCompletion:", v18);
  v10 = v9;
  v11 = dispatch_time(0, 5000000000);
  v12 = dispatch_group_wait(v10, v11);

  if (v12)
  {
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 4);
    dispatch_get_global_queue(9, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_25;
    v14[3] = &unk_1E7DB7800;
    v15 = v10;
    v16 = self;
    v17 = v4;
    dispatch_async(v13, v14);

  }
  _Block_object_dispose(v21, 8);

  SGRecordMeasurementState(v26);
}

- (void)_registerForCollectWeeklyStats
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "registering _registerForCollectWeeklyStats", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SGDManagerForCTS__registerForCollectWeeklyStats__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 5, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performCollectWeeklyStats:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked", a3))
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Can not harvest items until first unlock. Waiting for later.", buf, 2u);
    }

  }
  else if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < 0.00001)
  {
    v6 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLimitingStartDate:", v4);

    objc_msgSend(v6, "recentCalls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      +[SGDManagerForCTS _logCallInteractions:](SGDManagerForCTS, "_logCallInteractions:", v5);

  }
}

- (void)_registerForCTSTrimActivity
{
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SGDManagerForCTS__registerForCTSTrimActivity__block_invoke;
  v4[3] = &unk_1E7DA9648;
  objc_copyWeak(&v5, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_performTrimActivity:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
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
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint8_t buf[8];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v4 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (objc_msgSend(MEMORY[0x1E0D198F0], "allowAgeBasedPruning"))
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "Pruning entities more than a year old", buf, 2u);
    }

    v37 = 0;
    v38 = 0;
    *(_QWORD *)buf = CFSTR("com.apple.suggestd.trim");
    v6 = mach_absolute_time();
    v7 = MEMORY[0x1E0C809B0];
    v37 = v6;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke;
    v33[3] = &unk_1E7DA9698;
    v33[4] = self;
    v8 = v4;
    v34 = v8;
    v35 = &v39;
    v9 = (void *)MEMORY[0x1C3BD5158](v33);
    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke_2;
    v32[3] = &unk_1E7DA96C0;
    v32[4] = self;
    objc_msgSend(MEMORY[0x1E0CAA078], "sg_usingSharedStoreForReadingOnly:", v32);
    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pruneEntitiesOlderThanOneYearWithSuspensionHandler:", v9);

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pruneMailIntelligenceOlderThanOneYearWithSuspensionHandler:", v9);

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deleteInteractionEntitiesExceedingLimit:withSuspensionHandler:", &unk_1E7E0BE70, v9);

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteCompletedReimportRequests");

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteAllReimportRequestsOlderThanDate:", v19);

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trimURLs");

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pruneNLEventEntitiesOlderThanTwoWeeks");

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pruneReminders");

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      goto LABEL_27;
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "analyzeDatabase");

    if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0
      || (+[SGExtractionModel cleanModelAssets](SGExtractionModel, "cleanModelAssets"),
          (-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0)
      || ((*((void (**)(void))self->_harvestStoreGetter + 2))(),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "vacuum"),
          v24,
          (-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v8) & 1) != 0))
    {
LABEL_27:
      if (*((_BYTE *)v40 + 24))
        -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v8, 3);
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0D81080];
      +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sharedSingletonWithDirectory:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke_41;
      v30[3] = &unk_1E7DA96E8;
      v30[4] = self;
      v31 = v8;
      objc_msgSend(v29, "trimDbWithDeferralBlock:", v30);

    }
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))self->_harvestStoreGetter + 2))(self->_harvestStoreGetter, v10, v11, v12, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "clearCaches");

    SGRecordMeasurementState(buf);
    SGRecordMeasurementState(buf);
  }
  else
  {
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_INFO, "NOT pruning entities more than a year old, due to preference setting.", buf, 2u);
    }

  }
  _Block_object_dispose(&v39, 8);

}

- (void)_registerForCTSVacuumActivity
{
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SGDManagerForCTS__registerForCTSVacuumActivity__block_invoke;
  v4[3] = &unk_1E7DA9648;
  objc_copyWeak(&v5, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 1, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_performVacuumActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Vacuuming the database", (uint8_t *)&v6, 2u);
  }

  v7 = 0;
  v8 = 0;
  v6 = CFSTR("com.apple.suggestd.vacuum");
  v7 = mach_absolute_time();
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vacuum");

  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCaches");

  SGRecordMeasurementState(&v6);
  SGRecordMeasurementState(&v6);
}

- (void)_registerForCTSIdentityAnalysisActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for identity analysis with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SGDManagerForCTS__registerForCTSIdentityAnalysisActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performIdentityAnalysisActivity:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[3];

  v6[2] = 0;
  v5 = a3;
  v6[0] = CFSTR("com.apple.suggestd.identityanalysis");
  v6[1] = mach_absolute_time();
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyzeMergeBlobs:", v5);

  SGRecordMeasurementState(v6);
  SGRecordMeasurementState(v6);

}

- (void)_registerForCTSSendRTCActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for RTC log sending with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SGDManagerForCTS__registerForCTSSendRTCActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performSendRTCActivity:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  SGDManagerForCTS *v14;
  _QWORD v15[3];

  v4 = a3;
  v15[2] = 0;
  v15[0] = CFSTR("com.apple.suggestd.sendrtc");
  v15[1] = mach_absolute_time();
  v5 = dispatch_semaphore_create(0);
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__SGDManagerForCTS__performSendRTCActivity___block_invoke;
  v12[3] = &unk_1E7DA96E8;
  v8 = v4;
  v13 = v8;
  v14 = self;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __44__SGDManagerForCTS__performSendRTCActivity___block_invoke_49;
  v10[3] = &unk_1E7DA9710;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v6, "sendRTCLogsWithShouldContinueBlock:completion:", v12, v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  SGRecordMeasurementState(v15);

  SGRecordMeasurementState(v15);
}

- (void)_registerForContactDetailCacheRebuildActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for contact detail cache rebuilding with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SGDManagerForCTS__registerForContactDetailCacheRebuildActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 6, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)performContactDetailCacheRebuildActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SGDManagerForCTS *v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SGDManagerForCTS_performContactDetailCacheRebuildActivity___block_invoke;
  v7[3] = &unk_1E7DA9698;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = v11;
  objc_msgSend(v5, "rebuildContactDetailsCacheWithShouldContinueBlock:", v7);

  _Block_object_dispose(v11, 8);
}

- (void)_registerProcessPendingGeocodesActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for pending-geocode processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SGDManagerForCTS__registerProcessPendingGeocodesActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 7, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performProcessPendingGeocodesActivity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _opaque_pthread_mutex_t *p_geocodeLock;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  SGDManagerForCTS *v23;
  NSObject *v24;
  uint8_t buf[8];
  _QWORD v26[3];

  v4 = a3;
  v26[2] = 0;
  v26[0] = CFSTR("com.apple.suggestd.process-pending-geocodes");
  v26[1] = mach_absolute_time();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)5u, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.suggestions.geocode-write", v6);

  if (!pthread_mutex_trylock(&self->_geocodeLock))
  {
    p_geocodeLock = &self->_geocodeLock;
    v8 = 0;
    while (1)
    {
      if (!objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode"))
      {
        v11 = v8;
        goto LABEL_15;
      }
      v9 = (void *)MEMORY[0x1C3BD4F6C]();
      (*((void (**)(void))self->_harvestStoreGetter + 2))();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextPendingGeocode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v9);
      if (!v11)
        goto LABEL_15;
      if (v4
        && -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4))
      {
        break;
      }
      v12 = (void *)MEMORY[0x1C3BD4F6C]();
      +[SGStorageEvent storageEventFromEntity:](SGStorageEvent, "storageEventFromEntity:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v12);
      v14 = dispatch_semaphore_create(0);
      v15 = (void *)MEMORY[0x1E0D19810];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke;
      v20[3] = &unk_1E7DA9738;
      v21 = v7;
      v8 = v11;
      v22 = v8;
      v23 = self;
      v16 = v14;
      v24 = v16;
      objc_msgSend(v15, "geocodeEvent:withCallback:", v13, v20);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

    }
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_INFO, "Deferring remaining geocodes for later", buf, 2u);
    }

    if ((-[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3) & 1) == 0)
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "Invalid state transition to DEFER", buf, 2u);
      }

    }
LABEL_15:
    pthread_mutex_unlock(p_geocodeLock);

  }
  SGRecordMeasurementState(v26);

  SGRecordMeasurementState(v26);
}

- (void)_registerProcessPendingVerificationActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for pending-verification processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SGDManagerForCTS__registerProcessPendingVerificationActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 8, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performProcessPendingVerificationActivity:(id)a3 overrideVerificationStatus:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned __int16 v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *queue;
  uint64_t v42;
  dispatch_semaphore_t v43;
  id v44;
  void *v45;
  NSObject *log;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v51;
  void *v52;
  _QWORD block[6];
  NSObject *v54;
  id v55;
  id v56;
  dispatch_semaphore_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[3];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v44 = a4;
  v68[2] = 0;
  v68[0] = CFSTR("com.apple.suggestd.process-pending-verification");
  v68[1] = mach_absolute_time();
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Starting CTS job for document verification.", buf, 2u);
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)5u, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.suggestions.verification-write", v7);

  if (pthread_mutex_trylock(&self->_verificationLock))
  {
    sgEventsLogHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, log, OS_LOG_TYPE_ERROR, "SGDManagerForCTS _performProcessPendingVerificationActivity: Could not obtain a lock for document verification.", buf, 2u);
    }
  }
  else
  {
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emailsPendingVerification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    log = v9;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v10)
    {
      v47 = *(_QWORD *)v65;
      while (2)
      {
        v48 = v10;
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v65 != v47)
            objc_enumerationMutation(log);
          v52 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (v51
            && -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v51))
          {
            sgEventsLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v52, "loggingIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v71 = v36;
              _os_log_impl(&dword_1C3607000, v35, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Deferring CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);

            }
            if ((-[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v51, 3) & 1) == 0)
            {
              sgEventsLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v52, "loggingIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v38;
                _os_log_error_impl(&dword_1C3607000, v37, OS_LOG_TYPE_ERROR, "SGDManagerForCTS _performProcessPendingVerificationActivity: Could not defer CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);

              }
            }
            goto LABEL_45;
          }
          objc_msgSend(v52, "duplicateKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "entityKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v52, "duplicateKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "entityKey");
            v16 = objc_claimAutoreleasedReturnValue();

            -[NSObject messageId](v16, "messageId");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              sgEventsLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v52, "loggingIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v18;
                _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Starting CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);

              }
              v43 = dispatch_semaphore_create(0);
              (*((void (**)(void))self->_harvestStoreGetter + 2))();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "loadEntitiesFoundInEmail:entityType:", v16, 2);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                v42 = objc_msgSend(v44, "integerValue");
                v20 = 0;
              }
              else
              {
                +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = 0;
                v25 = objc_msgSend(v24, "verifyDKIMSignatureForMailWithIdentifier:error:", v49, &v63);
                v40 = v24;
                v39 = v63;
                v42 = v25;
                if (v25)
                  v26 = 10;
                else
                  v26 = 11;
                v59 = 0u;
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v27 = v45;
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
                if (v28)
                {
                  v29 = *(_QWORD *)v60;
                  do
                  {
                    for (j = 0; j != v28; ++j)
                    {
                      if (*(_QWORD *)v60 != v29)
                        objc_enumerationMutation(v27);
                      v31 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
                      +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "logEventInteractionForEntity:interface:actionType:", v31, 0, v26);

                    }
                    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
                  }
                  while (v28);
                }

                v20 = v39;
              }
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __90__SGDManagerForCTS__performProcessPendingVerificationActivity_overrideVerificationStatus___block_invoke;
              block[3] = &unk_1E7DA9760;
              v58 = v42;
              block[4] = v52;
              block[5] = self;
              v54 = v16;
              v55 = v45;
              v56 = v20;
              v57 = v43;
              v22 = v43;
              v33 = v20;
              v34 = v45;
              dispatch_async(queue, block);
              dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

            }
            else
            {
              sgEventsLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v52, "loggingIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v23;
                _os_log_fault_impl(&dword_1C3607000, v22, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Entity pending source verification did not have a message ID. [SGEntity (%{public}@)]", buf, 0xCu);

              }
            }

          }
          else
          {
            sgEventsLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v52, "loggingIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v71 = v21;
              _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Entity pending source verification did not have an email entity key. [SGEntity (%{public}@)]", buf, 0xCu);

            }
          }

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_45:

    pthread_mutex_unlock(&self->_verificationLock);
  }

  SGRecordMeasurementState(v68);
  SGRecordMeasurementState(v68);

}

- (void)_registerMailIntelligenceTasksActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for mail event aggregation processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SGDManagerForCTS__registerMailIntelligenceTasksActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 9, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performMailIntelligenceTasksActivity:(id)a3
{
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  BOOL should_defer;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  uint8_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  char v27;

  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D81590], "lockState");
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDManagerForCTS _performMailIntelligenceTasksActivity: Starting CTS job for Mail Intelligence Tasks", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x2020000000;
    v27 = 1;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__SGDManagerForCTS__performMailIntelligenceTasksActivity___block_invoke;
    v16[3] = &unk_1E7DA9788;
    v18 = buf;
    v9 = v5;
    v17 = v9;
    v19 = &v20;
    v10 = (void *)MEMORY[0x1C3BD5158](v16);
    +[SGMIMaintenance executeDailyTasksWithShouldContinue:](SGMIMaintenance, "executeDailyTasksWithShouldContinue:", v10);
    if (v25[24])
      goto LABEL_18;
    if (*((_BYTE *)v21 + 24))
    {
      *((_BYTE *)v21 + 24) = 1;
    }
    else
    {
      should_defer = xpc_activity_should_defer((xpc_activity_t)v9);
      *((_BYTE *)v21 + 24) = should_defer;
      if (!should_defer)
      {
        sgLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_WORD *)v15 = 0;
        v13 = "Mail Intelligence Task interrupted by device lock state change";
LABEL_16:
        _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, v13, v15, 2u);
LABEL_17:

LABEL_18:
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(buf, 8);
        goto LABEL_19;
      }
    }
    if (!xpc_activity_set_state((xpc_activity_t)v9, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDManagerForCTS.m"), 708, CFSTR("Unexpected failure of CTS deferral"));

    }
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    *(_WORD *)v15 = 0;
    v13 = "Mail Intelligence Task deferred by CTS";
    goto LABEL_16;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1C3607000, v8, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performMailIntelligenceTasksActivity: Activity running even though Class A protected data is unavailable", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    abort();
LABEL_19:

}

- (void)_registerAnalyticsHeartbeatActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Registering for SGXPCActivityAnalyticsHeartbeat with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SGDManagerForCTS__registerAnalyticsHeartbeatActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 14, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performAnalyticsHeartbeatActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getPSUSummarizationAnalyticsClass_softClass;
  v10 = getPSUSummarizationAnalyticsClass_softClass;
  if (!getPSUSummarizationAnalyticsClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getPSUSummarizationAnalyticsClass_block_invoke;
    v6[3] = &unk_1E7DB7220;
    v6[4] = &v7;
    __getPSUSummarizationAnalyticsClass_block_invoke((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "logHeartbeat");

}

- (void)_registerHarvestedURLMetricUploadActivity
{
  NSObject *v3;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "[HarvestedURLMetric] Registering for harvested URL metrics upload task with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SGDManagerForCTS__registerHarvestedURLMetricUploadActivity__block_invoke;
  v5[3] = &unk_1E7DA9648;
  objc_copyWeak(&v6, &location);
  -[SGXPCActivityManagerProtocol registerForActivity:handler:](xpcActivityManager, "registerForActivity:handler:", 10, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_performHarvestedURLMetricUploadAcitivity:(id)a3
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[4];
  _QWORD v59[4];
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v3 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Can not access entity store. Waiting for later.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Performing harvested URL metric upload CTS job.", buf, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -777600.0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 86400.0);
    objc_msgSend(MEMORY[0x1E0DBD290], "baseURLStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("facetime.apple.com/join");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:", v4, v6, 0, v11, 0, 100);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v62 = v15;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Got %tu URL(s) in the store.", buf, 0xCu);
    }

    if (-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v47))
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Deferring for later right after getting URLs", buf, 2u);
      }

      -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v47, 3);
    }
    else
    {
      v42 = v11;
      v43 = v6;
      v44 = v4;
      v46 = (void *)objc_opt_new();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v41 = v13;
      v17 = v13;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v54;
        while (2)
        {
          v21 = 0;
          v45 = v19;
          do
          {
            if (*(_QWORD *)v54 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v21);
            v23 = (void *)MEMORY[0x1C3BD4F6C]();
            if ((objc_msgSend(v22, "flags") & 8) != 0)
            {
              v24 = v17;
              objc_msgSend(v22, "bundleIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                v58[0] = CFSTR("offeredCount");
                v58[1] = CFSTR("acceptedCount");
                v59[0] = &unk_1E7E0BE88;
                v59[1] = &unk_1E7E0BE88;
                v58[2] = CFSTR("bundleIdentifier");
                objc_msgSend(v25, "_pas_stringBackedByUTF8CString");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v58[3] = CFSTR("urlType");
                v59[2] = v27;
                v59[3] = CFSTR("FaceTime");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (void *)objc_msgSend(v28, "mutableCopy");

                objc_msgSend(v46, "setObject:forKeyedSubscript:", v26, v25);
              }
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("offeredCount"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v29, "intValue") + 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("offeredCount"));

              if ((objc_msgSend(v22, "flags") & 2) != 0)
              {
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("acceptedCount"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v31, "intValue") + 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("acceptedCount"));

              }
              if (-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v47))
              {
                sgLogHandle();
                v40 = objc_claimAutoreleasedReturnValue();
                v11 = v42;
                v6 = v43;
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C3607000, v40, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Deferring for later while enumerating URLs", buf, 2u);
                }

                -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v47, 3);
                objc_autoreleasePoolPop(v23);
                v4 = v44;
                goto LABEL_43;
              }

              v17 = v24;
              v19 = v45;
            }
            objc_autoreleasePoolPop(v23);
            ++v21;
          }
          while (v19 != v21);
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          if (v19)
            continue;
          break;
        }
      }

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v46, "allValues");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v50 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            sgLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v38;
              _os_log_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] payload: %@", buf, 0xCu);
            }

            AnalyticsSendEvent();
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v35);
      }

      sgLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Done with harvested URL metric upload CTS job.", buf, 2u);
      }
      v6 = v43;
      v4 = v44;
      v11 = v42;
LABEL_43:
      v13 = v41;

    }
  }

}

- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  NSObject *v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  id v50;
  _QWORD block[4];
  NSObject *v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v50 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDManagerForCTS.m"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domainIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "tombstoneExistsForSpotlightReferenceWithBundleIdentifier:uniqueIdentifier:domainIdentifier:", v16, v17, v18);

  if (v19)
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEFAULT, "Tombstone exists for queued item; deleting.", buf, 2u);
    }
    v21 = 0;
    v22 = v50;
    goto LABEL_25;
  }
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v23, "reimportRequestsContainBundleIdentifier:uniqueIdentifier:", v24, v25);

  if ((v26 & 1) == 0)
  {
    if (objc_msgSend(v12, "backpressureHazard"))
    {
      if (processSearchableItem_pipeline_context_harvestMetrics___pasOnceToken60 != -1)
        dispatch_once(&processSearchableItem_pipeline_context_harvestMetrics___pasOnceToken60, &__block_literal_global_98);
      v27 = processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke_2;
      block[3] = &unk_1E7DB6A30;
      v52 = v11;
      v53 = v13;
      dispatch_async(v27, block);

      v28 = v52;
    }
    else
    {
      +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v29, "processSearchableItem:harvestMetrics:", v11, v13);

      sgLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v31;
        _os_log_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEFAULT, "Plugins finished CSSI processing via CTS: %@", buf, 0xCu);

      }
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0D80F90], "searchableItemIsEligibleForDissectorPipeline:targetPluginsCustomAttributeName:", v11, CFSTR("com_apple_suggestions_targetPlugins")) & 1) == 0)
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v22 = v50;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "uniqueIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v39;
      _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "Dissector pipeline ignoring %@", buf, 0xCu);

    }
    v21 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v11, "bundleID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D19A38]);

  v22 = v50;
  if (v33)
  {
    objc_msgSend(v11, "attributeSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "authors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      objc_msgSend(v11, "attributeSet");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accountIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        +[SGMessage messageWithSearchableItem:](SGTextMessage, "messageWithSearchableItem:", v11);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[SGDManagerForCTS processTextMessage:pipeline:context:harvestMetrics:](self, "processTextMessage:pipeline:context:harvestMetrics:", v20, v50, v12, v13);
LABEL_25:

        goto LABEL_26;
      }
      sgLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v11, "uniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v46;
        v48 = "text message CSSI %@ has no accountIdentifier";
        goto LABEL_33;
      }
    }
    else
    {
      sgLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v11, "uniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v46;
        v48 = "text message CSSI %@ has no authors";
LABEL_33:
        _os_log_fault_impl(&dword_1C3607000, v45, OS_LOG_TYPE_FAULT, v48, buf, 0xCu);
        goto LABEL_34;
      }
    }
  }
  else
  {
    objc_msgSend(v11, "bundleID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0D19A28]);

    if (v41)
    {
      +[SGMessage messageWithSearchableItem:](SGSimpleMailMessage, "messageWithSearchableItem:", v11);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributeSet");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "emailHeaders");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SGDManagerForCTS processMailMessage:headers:pipeline:context:harvestMetrics:](self, "processMailMessage:headers:pipeline:context:harvestMetrics:", v20, v43, v50, v12, v13);

      goto LABEL_25;
    }
    sgLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v11, "uniqueIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v46;
      v56 = 2112;
      v57 = v47;
      _os_log_fault_impl(&dword_1C3607000, v45, OS_LOG_TYPE_FAULT, "Unhandled CSSI %@ from %@ in -[SGDManagerForCTS processSearchableItem:pipeline:context:]", buf, 0x16u);

LABEL_34:
    }
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    abort();
  v21 = 0;
LABEL_26:
  objc_autoreleasePoolPop(v14);

  return v21;
}

- (BOOL)processTextMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "spotlightUniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spotlightDomainIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spotlightBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SGDManagerForCTS _shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:](self, "_shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:", v14, v15, v16, 0, 0);

  if (v17)
  {
    v18 = -[SGDManagerForCTS _processMessage:pipeline:context:harvestMetrics:](self, "_processMessage:pipeline:context:harvestMetrics:", v10, v11, v12, v13);
  }
  else
  {
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v20;
      _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "SGTextMessage %@ has been processed without dissection, so it will be dropped from the dissector pipeline.", (uint8_t *)&v22, 0xCu);

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)processMailMessage:(id)a3 headers:(id)a4 pipeline:(id)a5 context:(id)a6 harvestMetrics:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  BOOL v35;
  int v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v38 = v15;
  if (objc_msgSend(v12, "isSent"))
  {
    (*((void (**)(void))self->_harvestStoreGetter + 2))();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerSentMailMessage:", v12);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v12, "from");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emailAddress");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_7;
  v19 = (void *)v18;
  objc_msgSend(v12, "accountHandles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "from");
  v21 = v13;
  v22 = v16;
  v23 = v14;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "emailAddress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v20, "containsObject:", v25);

  v14 = v23;
  v16 = v22;
  v13 = v21;

  if (v37)
  {
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      v28 = "SGSimpleMailMessage %@ appears to be a sent email not in the sent mail folder, so it will be dropped from th"
            "e dissector pipeline.";
LABEL_12:
      _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

    }
LABEL_13:

    v35 = 0;
    v34 = v38;
    goto LABEL_14;
  }
LABEL_8:
  objc_msgSend(v12, "spotlightUniqueIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "spotlightDomainIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "spotlightBundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SGDManagerForCTS _shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:](self, "_shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:", v29, v30, v31, v13, v32);

  if (!v33)
  {
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      v28 = "SGSimpleMailMessage %@ has been processed without dissection, so it will be dropped from the dissector pipeline.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v34 = v38;
  v35 = -[SGDManagerForCTS _processMessage:pipeline:context:harvestMetrics:](self, "_processMessage:pipeline:context:harvestMetrics:", v12, v14, v38, v16);
LABEL_14:

  return v35;
}

- (BOOL)_processMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  id v10;
  id v11;
  void *v12;
  SGPipelineEntity *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SGPipelineEntity *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *context;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  SGPipelineEntity *v49;
  _QWORD *v50;
  _QWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _QWORD v57[5];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  SGPipelineEntity *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43 = a4;
  v44 = a5;
  v11 = a6;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v39 = v11;
  objc_msgSend(v10, "setHarvestMetrics:", v11);
  +[SGDPowerLog startDissectionOfMessage:inContext:](SGDPowerLog, "startDissectionOfMessage:inContext:", v10, 1);
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "incStatsCounterWithKey:", CFSTR("dissected_items"));

  v13 = -[SGPipelineEntity initWithMessage:]([SGPipelineEntity alloc], "initWithMessage:", v10);
  -[SGPipelineEntity setHarvestMetrics:](v13, "setHarvestMetrics:", v39);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3810000000;
  v61 = 0;
  v62 = 0;
  v60[3] = "";
  v60[4] = CFSTR("backgroundDissectAndWrite");
  v61 = mach_absolute_time();
  v62 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3810000000;
  v58 = 0;
  v59 = 0;
  v57[3] = "";
  v57[4] = CFSTR("backgroundDissect");
  v58 = mach_absolute_time();
  v59 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v43, "dissectOperationsForMailMessage:entity:inContext:", v10, v13, v44);
  else
    objc_msgSend(v43, "dissectOperationsForTextMessage:entity:inContext:", v10, v13, v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  -[SGEntity duplicateKey](v13, "duplicateKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "entityType") == 5;

  if (v17)
    objc_msgSend(v43, "verificationOperation:withDependencies:", v13, v15);
  else
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_113);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v42);
  if (objc_msgSend(MEMORY[0x1E0D198F0], "shouldHarvestEvents"))
    objc_msgSend(v43, "geocodeOperation:withDependencies:", v13, v15);
  else
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_114);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v41);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_3;
  v56[3] = &unk_1E7DB7220;
  v56[4] = v57;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v56);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v53;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addDependency:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
    }
    while (v20);
  }

  objc_msgSend(v15, "addObject:", v18);
  (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "spotlightBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spotlightUniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spotlightDomainIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413315;
    v64 = v24;
    v65 = 2112;
    v66 = v25;
    v67 = 2112;
    v68 = v26;
    v69 = 2112;
    v70 = v40;
    v71 = 2117;
    v72 = v13;
    _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Constructing store op for bid:%@ uid:%@ did:%@ store:%@ entity:%{sensitive}@", buf, 0x34u);

  }
  objc_msgSend(v10, "spotlightBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spotlightUniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spotlightDomainIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:", v13, v27, v28, v29, v40, v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_115;
  v48[3] = &unk_1E7DB46E0;
  v50 = v60;
  v31 = v13;
  v49 = v31;
  v51 = v57;
  objc_msgSend(v30, "setCompletionBlock:", v48);
  objc_msgSend(v44, "processingQueue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addOperations:waitUntilFinished:", v19, 0);

  objc_msgSend(v44, "processingQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addOperation:", v42);

  objc_msgSend(v44, "processingQueue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addOperation:", v41);

  objc_msgSend(v44, "processingQueue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addOperation:", v18);

  if (objc_msgSend(v44, "backpressureHazard"))
  {
    objc_msgSend(v44, "storageQueue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addOperation:", v30);
  }
  else
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_2_118;
    v45[3] = &unk_1E7DB6A30;
    v46 = v44;
    v47 = v30;
    +[SGSpotlightContactsAdapter notifyWhenFlushed:](SGSpotlightContactsAdapter, "notifyWhenFlushed:", v45);

    v36 = v46;
  }

  objc_msgSend(v30, "waitUntilFinished");
  +[SGDPowerLog endDissectionOfMessage:inContext:](SGDPowerLog, "endDissectionOfMessage:inContext:", v10, 1);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v60, 8);

  objc_autoreleasePoolPop(context);
  return 1;
}

- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5
{
  return -[SGDManagerForCTS processSearchableItem:pipeline:context:harvestMetrics:](self, "processSearchableItem:pipeline:context:harvestMetrics:", a3, a4, a5, 0);
}

- (BOOL)processSearchableItemForTesting:(id)a3
{
  id v4;
  SGRequestContext *v5;
  void *v6;

  v4 = a3;
  v5 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:]([SGRequestContext alloc], "initWithServiceContext:concurrencyBehavior:backpressureHazard:", self->_context, 0, 0);
  +[SGPipeline emptyPipeline](SGPipeline, "emptyPipeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SGDManagerForCTS processSearchableItem:pipeline:context:](self, "processSearchableItem:pipeline:context:", v4, v6, v5);

  return (char)self;
}

- (BOOL)hasAlreadyHarvestedSearchableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emailHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[SGDManagerForCTS _shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:](self, "_shouldDissectContentWithUniqueIdentifier:domainIdentifier:bundleIdentifier:headers:accountIdentifier:", v5, v6, v7, v9, v11);

  return (char)self;
}

- (BOOL)_shouldDissectContentWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 bundleIdentifier:(id)a5 headers:(id)a6 accountIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  SGDuplicateKey *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v15)
  {
    v17 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0D80FB0], "messageIdHeaderValuesFromHeaders:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[SGDuplicateKey initWithMessageIdHeaderValues:accountIdentifier:]([SGDuplicateKey alloc], "initWithMessageIdHeaderValues:accountIdentifier:", v18, v16);
      if (v19)
      {
        v28 = v17;
        (*((void (**)(void))self->_harvestStoreGetter + 2))();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDuplicateKey emailKey](v19, "emailKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "addSpotlightReferenceToEmailIfFullyDownloaded:withBundleIdentifier:uniqueIdentifier:domainIdentifier:", v21, v14, v12, v13);

        if (v22)
        {
          sgLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            -[SGDuplicateKey emailKey](v19, "emailKey");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v30 = v12;
            v31 = 2112;
            v32 = v13;
            v33 = 2112;
            v34 = v14;
            v35 = 2112;
            v36 = v24;
            _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "_shouldDissectContentWithUniqueIdentifier:%@ domainIdentifier:%@ bundleIdentifier:%@ added an additional Spotlight reference to existing harvested email record %@", buf, 0x2Au);

          }
          v22 = 1;
        }
        v17 = v28;
      }
      else
      {
        v22 = 1;
      }

      v26 = v19 == 0;
    }
    else
    {
      v22 = 1;
      v26 = 1;
    }

    objc_autoreleasePoolPop(v17);
    if (v22)
      v25 = v26;
    else
      v25 = 1;
  }
  else
  {
    v25 = 1;
  }

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_geocodeLock);
  pthread_mutex_destroy(&self->_verificationLock);
  v3.receiver = self;
  v3.super_class = (Class)SGDManagerForCTS;
  -[SGDManagerForCTS dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_harvestStoreGetter, 0);
}

uint64_t __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_3(uint64_t a1)
{
  return SGRecordMeasurementState((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

uint64_t __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_115(_QWORD *a1)
{
  SGRecordMeasurementState((_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32));
  return +[SGAggregateLogging harvestedEntity:withElapsedTime:](SGAggregateLogging, "harvestedEntity:withElapsedTime:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 48));
}

void __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_2_118(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "storageQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOperation:", *(_QWORD *)(a1 + 40));

}

void __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "processSearchableItem:harvestMetrics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "Plugins finished async CSSI processing via CTS: %@", (uint8_t *)&v6, 0xCu);

  }
}

void __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "processSearchableItem-plugins", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult;
  processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __61__SGDManagerForCTS__registerHarvestedURLMetricUploadActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performHarvestedURLMetricUploadAcitivity:", v3);

}

void __55__SGDManagerForCTS__registerAnalyticsHeartbeatActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performAnalyticsHeartbeatActivity:", v3);

}

uint64_t __58__SGDManagerForCTS__performMailIntelligenceTasksActivity___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    if ((objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked") & 1) == 0)
      goto LABEL_5;
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __58__SGDManagerForCTS__registerMailIntelligenceTasksActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performMailIntelligenceTasksActivity:", v3);

}

intptr_t __90__SGDManagerForCTS__performProcessPendingVerificationActivity_overrideVerificationStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  switch(v2)
  {
    case 2:
      sgEventsLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)(a1 + 48), 0);
        objc_autoreleasePoolPop(v10);
        objc_msgSend(v5, "deleteMessages:", v11);

LABEL_11:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
      }
      v7 = *(void **)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v9 = "SGDManagerForCTS _performProcessPendingVerificationActivity: DKIM verification resulted in permanent failure:"
           " %@. [SGEntity (%{public}@)]";
LABEL_14:
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);

      goto LABEL_10;
    case 1:
      sgEventsLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v13 = *(void **)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v13;
      v16 = 2114;
      v17 = v8;
      v9 = "SGDManagerForCTS _performProcessPendingVerificationActivity: DKIM verification resulted in temporary failure "
           "for 2nd time. Treating as permanent failure: %@. [SGEntity (%{public}@)]";
      goto LABEL_14;
    case 0:
      sgEventsLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v4;
        _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Successfully verified DKIM signature. [SGEntity (%{public}@)]", buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "writeEmailVerificationResultForEmailWithKey:eventEntities:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      goto LABEL_11;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void __63__SGDManagerForCTS__registerProcessPendingVerificationActivity__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (objc_msgSend(MEMORY[0x1E0D198F0], "enableDKIMEnforcement"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_performProcessPendingVerificationActivity:overrideVerificationStatus:", v4, 0);

  }
}

void __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke_2;
  v7[3] = &unk_1E7DB77B0;
  v4 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = *(void **)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

intptr_t __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 40), "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setLocations:", v4);

  objc_msgSend(*(id *)(a1 + 40), "when");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTimeRange:", v5);

  objc_msgSend(*(id *)(a1 + 32), "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isValidAllDayRange") & 1) == 0)
      __assert_rtn("-[SGDManagerForCTS _performProcessPendingGeocodesActivity:]_block_invoke_2", "SGDManagerForCTS.m", 550, "[nextGeocode.timeRange isValidAllDayRange]");

  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeEntityGeocodeResultToDb:", *(_QWORD *)(a1 + 32));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __59__SGDManagerForCTS__registerProcessPendingGeocodesActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performProcessPendingGeocodesActivity:", v3);

}

uint64_t __61__SGDManagerForCTS_performContactDetailCacheRebuildActivity___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  if (!a1[4] || !objc_msgSend(*(id *)(a1[5] + 168), "shouldDefer:"))
    return 1;
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEFAULT, "Deferring CD cache rebuild", v4, 2u);
  }

  objc_msgSend(*(id *)(a1[5] + 168), "setState:state:", a1[4], 3);
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

void __65__SGDManagerForCTS__registerForContactDetailCacheRebuildActivity__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  _QWORD v5[3];

  v5[2] = 0;
  v4 = a2;
  v5[0] = CFSTR("com.apple.suggestd.cd-cache-rebuild");
  v5[1] = mach_absolute_time();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performContactDetailCacheRebuildActivity:", v4);

  SGRecordMeasurementState(v5);
  SGRecordMeasurementState(v5);

}

uint64_t __44__SGDManagerForCTS__performSendRTCActivity___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v3[16];

  if (!*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "shouldDefer:"))
    return 1;
  sgLogHandle();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C3607000, v1, OS_LOG_TYPE_DEFAULT, "Deferring sending of RTC Logs", v3, 2u);
  }

  return 0;
}

intptr_t __44__SGDManagerForCTS__performSendRTCActivity___block_invoke_49(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__SGDManagerForCTS__registerForCTSSendRTCActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performSendRTCActivity:", v3);

}

void __59__SGDManagerForCTS__registerForCTSIdentityAnalysisActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performIdentityAnalysisActivity:", v3);

}

void __49__SGDManagerForCTS__registerForCTSVacuumActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performVacuumActivity");

}

uint64_t __41__SGDManagerForCTS__performTrimActivity___block_invoke(_QWORD *a1)
{
  uint64_t result;

  if (!objc_msgSend(*(id *)(a1[4] + 168), "shouldDefer:", a1[5]))
    return objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked") ^ 1;
  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

void __41__SGDManagerForCTS__performTrimActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  id v4;
  id v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pruneDuplicateEventExtractions:", v4);

}

uint64_t __41__SGDManagerForCTS__performTrimActivity___block_invoke_41(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "shouldDefer:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setState:state:", *(_QWORD *)(a1 + 40), 3);
  return v2;
}

void __47__SGDManagerForCTS__registerForCTSTrimActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performTrimActivity:", v3);

}

void __50__SGDManagerForCTS__registerForCollectWeeklyStats__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performCollectWeeklyStats:", v3);

}

void __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsModelAssets metadata download success? %d", (uint8_t *)v5, 8u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_24(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets metadata download success? %d", (uint8_t *)v5, 8u);
  }

  SGRecordMeasurementState((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  uint8_t v7[16];

  while (1)
  {
    v2 = *(id *)(a1 + 32);
    v3 = dispatch_time(0, 1000000000);
    v4 = dispatch_group_wait(v2, v3);

    if (!v4)
      break;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "shouldDefer:", *(_QWORD *)(a1 + 48)))
    {
      sgLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets metadata download - marking activity as done", v7, 2u);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setState:state:", *(_QWORD *)(a1 + 48), 5);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setState:state:", *(_QWORD *)(a1 + 48), 5);
}

void __64__SGDManagerForCTS__registerMobileAssetMetadataDownloadActivity__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performMobileAssetMetadataDownloadActivity:", v3);

}

uint64_t __66__SGDManagerForCTS_initWithHarvestStoreGetter_xpcActivityManager___block_invoke()
{
  return 0;
}

+ (SGDManagerForCTS)defaultInstance
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[SGXPCActivityManager sharedInstance](SGXPCActivityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithHarvestStoreGetter:xpcActivityManager:", &__block_literal_global_4476, v3);

  return (SGDManagerForCTS *)v4;
}

+ (void)_logCallInteractions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t i;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v7 = *MEMORY[0x1E0D0CE98];
    v8 = *MEMORY[0x1E0D0CEA8];
    v25 = *MEMORY[0x1E0D0CEF8];
    v22 = (void *)*MEMORY[0x1E0D19A10];
    v23 = *MEMORY[0x1E0D0CEF0];
    v24 = (void *)*MEMORY[0x1E0D19A50];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v11 = v7 & objc_msgSend(v10, "callStatus", v22);
        if (v11 || (v8 & objc_msgSend(v10, "callStatus")) != 0)
        {
          objc_msgSend(v10, "callerIdForDisplay");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v10, "serviceProvider");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v10, "serviceProvider");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v25);

              v17 = v24;
              if ((v16 & 1) != 0
                || (objc_msgSend(v10, "serviceProvider"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    v19 = objc_msgSend(v18, "isEqualToString:", v23),
                    v18,
                    v17 = v22,
                    v19))
              {
                v20 = v17;
                objc_msgSend(v10, "callerIdForDisplay");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                +[SGMetricsHelper recordConversationTurnWithDetail:received:throughApp:withStore:](SGMetricsHelper, "recordConversationTurnWithDetail:received:throughApp:withStore:", v21, v11 != 0, v20, 0);

              }
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

}

id __35__SGDManagerForCTS_defaultInstance__block_invoke()
{
  return +[SGSqlEntityStore defaultHarvestStore](SGSqlEntityStore, "defaultHarvestStore");
}

uint64_t __43__SGDManagerForCTS_sharedSingletonInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "defaultInstance");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedSingletonInstance_singletonInstance;
  sharedSingletonInstance_singletonInstance = v1;

  return objc_msgSend((id)sharedSingletonInstance_singletonInstance, "registerForCTS");
}

@end
