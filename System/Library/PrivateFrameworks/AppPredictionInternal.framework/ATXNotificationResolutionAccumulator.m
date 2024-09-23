@implementation ATXNotificationResolutionAccumulator

- (ATXNotificationResolutionAccumulator)init
{
  ATXNotificationResolutionAccumulator *v2;
  uint64_t v3;
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationResolutionAccumulator;
  v2 = -[ATXNotificationResolutionAccumulator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    memoryPressureMonitor = v2->_memoryPressureMonitor;
    v2->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v3;

    -[ATXMemoryPressureMonitor registerObserver:](v2->_memoryPressureMonitor, "registerObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v4;

  -[ATXMemoryPressureMonitor unregisterObserver:](self->_memoryPressureMonitor, "unregisterObserver:", self);
  memoryPressureMonitor = self->_memoryPressureMonitor;
  self->_memoryPressureMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)ATXNotificationResolutionAccumulator;
  -[ATXNotificationResolutionAccumulator dealloc](&v4, sel_dealloc);
}

- (void)computeFeaturesForNotification:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  NSDate *v9;
  NSDate *v10;
  ATXUnifiedComputedAndInferredModeStream *v11;
  BPSPublisher *v12;
  BPSPublisher *unifiedModePublisher;
  void *v14;
  void *v15;
  void *v16;
  BPSPublisher *v17;
  BPSPublisher *notificationPublisher;
  NSDate *startDate;
  NSDate *v20;
  NSDate *endDate;

  objc_storeStrong((id *)&self->_userNotification, a3);
  v7 = a3;
  self->_mode = a4;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  -[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", -1209600.0);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXUnifiedComputedAndInferredModeStream initWithStartTime:toEndTime:]([ATXUnifiedComputedAndInferredModeStream alloc], "initWithStartTime:toEndTime:", v10, v9);
  -[ATXUnifiedComputedAndInferredModeStream fetchUnifiedModeEvents](v11, "fetchUnifiedModeEvents");
  v12 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
  unifiedModePublisher = self->_unifiedModePublisher;
  self->_unifiedModePublisher = v12;

  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Notification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Usage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v9, 0, 0, 0);
  v17 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
  notificationPublisher = self->_notificationPublisher;
  self->_notificationPublisher = v17;

  startDate = self->_startDate;
  self->_startDate = v10;
  v20 = v10;

  endDate = self->_endDate;
  self->_endDate = v9;

  -[ATXNotificationResolutionAccumulator computeTimeToLaunchAppForNotification](self, "computeTimeToLaunchAppForNotification");
  -[ATXNotificationResolutionAccumulator computeHistoricalResolutionsIfNecessary](self, "computeHistoricalResolutionsIfNecessary");
}

- (void)computeTimeToLaunchAppForNotification
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[ATXUserNotification timestamp](self->_userNotification, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[ATXUserNotification timestamp](self->_userNotification, "timestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", v6 + 3600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "App");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "InFocus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, v7, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_40;
  v14[3] = &unk_1E82DBF90;
  v14[4] = self;
  v12 = v4;
  v15 = v12;
  v16 = &v17;
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:shouldContinue:", &__block_literal_global_18, v14);
  self->_timeToLaunchApp = v18[3];

  _Block_object_dispose(&v17, 8);
}

void __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_notification_categorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(v2);

  }
}

uint64_t __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_40(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7
    && (objc_msgSend(v3, "eventBody"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "starting"),
        v8,
        v9))
  {
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[5]);
    v13 = v12;

    v14 = 0;
    v15 = v13 / 10.0;
    if (v13 < 0.0)
      v15 = 0.0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (unint64_t)(ceil(v15) * 10.0);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)computeHistoricalResolutionsIfNecessary
{
  ATXNotificationResolutionAccumulator *v2;
  NSMutableDictionary *cachedHistoricalResolutionsForNotifications;
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  ATXHistoricalResolutonsForNotification *v17;
  void *historicalResolutionsForNotification;
  void *v19;
  ATXHistoricalResolutonsForNotification *v20;
  NSMutableDictionary *v21;
  ATXNotificationResolutionAccumulator *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  if (!cachedHistoricalResolutionsForNotifications)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
    v5 = obj->_cachedHistoricalResolutionsForNotifications;
    obj->_cachedHistoricalResolutionsForNotifications = (NSMutableDictionary *)v4;

    v2 = obj;
    cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  }
  -[ATXUserNotification bundleID](v2->_userNotification, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedHistoricalResolutionsForNotifications, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "userNotification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUserNotification bundleID](obj->_userNotification, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      -[ATXUserNotification timestamp](obj->_userNotification, "timestamp");
      v13 = v12;
      objc_msgSend(v7, "userNotification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      v16 = (uint64_t)(v13 - v15);

      if ((unint64_t)(v16 - 1) <= 0xE0F)
      {
        v17 = v7;
        historicalResolutionsForNotification = obj->_historicalResolutionsForNotification;
        obj->_historicalResolutionsForNotification = v17;
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  -[ATXNotificationResolutionAccumulator cacheAppLaunchDataFromStartTime:toEndTime:](obj, "cacheAppLaunchDataFromStartTime:toEndTime:", obj->_startDate, obj->_endDate);
  -[ATXNotificationResolutionAccumulator historicalResolutionForNotification](obj, "historicalResolutionForNotification");
  if ((unint64_t)-[NSMutableDictionary count](obj->_cachedHistoricalResolutionsForNotifications, "count") >= 0xA)
    -[ATXNotificationResolutionAccumulator removeOldestEntry](obj, "removeOldestEntry");
  -[ATXUserNotification bundleID](obj->_userNotification, "bundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = obj->_historicalResolutionsForNotification;
    v21 = obj->_cachedHistoricalResolutionsForNotifications;
    -[ATXUserNotification bundleID](obj->_userNotification, "bundleID");
    historicalResolutionsForNotification = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, historicalResolutionsForNotification);
    goto LABEL_11;
  }
LABEL_12:

  objc_sync_exit(obj);
}

- (void)cacheAppLaunchDataFromStartTime:(id)a3 toEndTime:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSDictionary *cacheHistoricalAppLaunches;
  NSDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "App");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "InFocus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v6, v7, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_44;
  v27[3] = &unk_1E82DB0C8;
  v13 = v8;
  v28 = v13;
  v14 = (id)objc_msgSend(v12, "sinkWithCompletion:receiveInput:", &__block_literal_global_43_0, v27);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (NSDictionary *)v13;
  v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sortUsingComparator:", &__block_literal_global_48);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v17);
  }

  cacheHistoricalAppLaunches = self->_cacheHistoricalAppLaunches;
  self->_cacheHistoricalAppLaunches = v15;
  v22 = v15;

}

void __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_notification_categorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(v2);

  }
}

void __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_44(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "starting");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v19, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v19, "eventBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v19, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eventBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteTimestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
}

uint64_t __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)historicalResolutionForNotification
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  BPSPublisher *unifiedModePublisher;
  BPSPublisher *notificationPublisher;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  ATXHistoricalResolutonsForNotification *v68;
  ATXHistoricalResolutonsForNotification *historicalResolutionsForNotification;
  NSDictionary *cacheHistoricalAppLaunches;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  _QWORD v110[5];
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  _QWORD *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  _QWORD v137[5];
  id v138;
  _QWORD v139[6];

  v3 = (void *)MEMORY[0x1E0C99D68];
  -[ATXUserNotification timestamp](self->_userNotification, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", v4 + -86400.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[ATXUserNotification timestamp](self->_userNotification, "timestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", v6 + -604800.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v103 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v87 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v101 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v99 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v97 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v95 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v93 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v91 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v89 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v82 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v80 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v78 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = (void *)objc_opt_new();
  v14 = MEMORY[0x1E0C809B0];
  unifiedModePublisher = self->_unifiedModePublisher;
  notificationPublisher = self->_notificationPublisher;
  v139[0] = MEMORY[0x1E0C809B0];
  v139[1] = 3221225472;
  v139[2] = __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke;
  v139[3] = &unk_1E82DBFF8;
  v139[4] = self;
  -[BPSPublisher orderedMergeWithOther:comparator:](unifiedModePublisher, "orderedMergeWithOther:comparator:", notificationPublisher, v139);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x3032000000;
  v137[3] = __Block_byref_object_copy__4;
  v137[4] = __Block_byref_object_dispose__4;
  v138 = 0;
  v110[0] = v14;
  v110[1] = 3221225472;
  v110[2] = __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_55;
  v110[3] = &unk_1E82DC040;
  v110[4] = self;
  v132 = v137;
  v74 = v108;
  v111 = v74;
  v109 = v7;
  v112 = v109;
  v105 = v8;
  v113 = v105;
  v73 = v106;
  v114 = v73;
  v107 = v103;
  v115 = v107;
  v104 = v87;
  v116 = v104;
  v71 = v13;
  v117 = v71;
  v133 = xmmword_1C9E7EA10;
  v102 = v101;
  v118 = v102;
  v88 = v9;
  v119 = v88;
  v100 = v99;
  v120 = v100;
  v86 = v10;
  v121 = v86;
  v134 = xmmword_1C9E7EA20;
  v98 = v97;
  v122 = v98;
  v85 = v11;
  v123 = v85;
  v96 = v95;
  v124 = v96;
  v84 = v12;
  v125 = v84;
  v135 = xmmword_1C9E7EA30;
  v94 = v93;
  v126 = v94;
  v83 = v82;
  v127 = v83;
  v136 = 1800;
  v92 = v91;
  v128 = v92;
  v81 = v80;
  v129 = v81;
  v90 = v89;
  v130 = v90;
  v79 = v78;
  v131 = v79;
  v72 = v17;
  v18 = (id)objc_msgSend(v17, "sinkWithCompletion:shouldContinue:", &__block_literal_global_53, v110);
  v19 = objc_alloc(MEMORY[0x1E0CF9018]);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v109, "countForObject:", v21);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v107, "countForObject:", v23);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = percentageOfBundleIDInBucket((uint64_t)v25, v109);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v19, "initWithBundleID:dailyNumberOfNotificationsReceivedForBundleID:weeklyNumberOfNotificationsReceivedForBundleID:dailyPercentageOfNotificationsReceivedForBundleID:weeklyPercentageOfNotificationsReceivedForBundleID:", v20, v22, v24, v26, percentageOfBundleIDInBucket((uint64_t)v27, v107));

  v28 = objc_alloc(MEMORY[0x1E0CF9018]);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v105, "countForObject:", v30);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v104, "countForObject:", v32);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = percentageOfBundleIDInBucket((uint64_t)v34, v105);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v28, "initWithBundleID:dailyNumberOfNotificationsReceivedForBundleID:weeklyNumberOfNotificationsReceivedForBundleID:dailyPercentageOfNotificationsReceivedForBundleID:weeklyPercentageOfNotificationsReceivedForBundleID:", v29, v31, v33, v35, percentageOfBundleIDInBucket((uint64_t)v36, v104));

  v37 = objc_alloc(MEMORY[0x1E0CF8FE8]);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = percentageOfBundleIDInBucket((uint64_t)v39, v102);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = percentageOfBundleIDInBucket((uint64_t)v41, v100);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = percentageOfBundleIDInBucket((uint64_t)v43, v98);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = percentageOfBundleIDInBucket((uint64_t)v45, v96);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = percentageOfBundleIDInBucket((uint64_t)v47, v94);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = percentageOfBundleIDInBucket((uint64_t)v49, v92);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v37, "initWithBundleID:percentageForOneMinuteDuration:percentageForTwoMinutesDuration:percentageForFiveMinutesDuration:percentageForTenMinutesDuration:percentageForTwentyMinutesDuration:percentageForThirtyMinutesDuration:percentageForSixtyMinutesDuration:", v38, v40, v42, v44, v46, v48, v50, percentageOfBundleIDInBucket((uint64_t)v51, v90));

  v52 = objc_alloc(MEMORY[0x1E0CF8FE8]);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = percentageOfBundleIDInBucket((uint64_t)v54, v88);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = percentageOfBundleIDInBucket((uint64_t)v56, v86);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = percentageOfBundleIDInBucket((uint64_t)v58, v85);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = percentageOfBundleIDInBucket((uint64_t)v60, v84);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = percentageOfBundleIDInBucket((uint64_t)v62, v83);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = percentageOfBundleIDInBucket((uint64_t)v64, v81);
  -[ATXUserNotification bundleID](self->_userNotification, "bundleID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v52, "initWithBundleID:percentageForOneMinuteDuration:percentageForTwoMinutesDuration:percentageForFiveMinutesDuration:percentageForTenMinutesDuration:percentageForTwentyMinutesDuration:percentageForThirtyMinutesDuration:percentageForSixtyMinutesDuration:", v53, v55, v57, v59, v61, v63, v65, percentageOfBundleIDInBucket((uint64_t)v66, v79));

  v68 = -[ATXHistoricalResolutonsForNotification initWithNotification:historicalVolumeByCountAndPercentage:modeConditionedHistoricalVolumeByCountAndPercentage:historicalResolutionByPercentage:modeConditionedHistoricalResolutionByPercentage:]([ATXHistoricalResolutonsForNotification alloc], "initWithNotification:historicalVolumeByCountAndPercentage:modeConditionedHistoricalVolumeByCountAndPercentage:historicalResolutionByPercentage:modeConditionedHistoricalResolutionByPercentage:", self->_userNotification, v77, v76, v75, v67);
  historicalResolutionsForNotification = self->_historicalResolutionsForNotification;
  self->_historicalResolutionsForNotification = v68;

  cacheHistoricalAppLaunches = self->_cacheHistoricalAppLaunches;
  self->_cacheHistoricalAppLaunches = 0;

  _Block_object_dispose(v137, 8);
}

uint64_t __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromModeEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromModeEvent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if (v10)
  {
    if (v14)
      goto LABEL_16;
    goto LABEL_13;
  }
  __atxlog_handle_notification_categorization();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1();

  if (!v14)
  {
LABEL_13:
    __atxlog_handle_notification_categorization();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1();

  }
LABEL_16:
  objc_msgSend(v10, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v14, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "compare:", v24);

  return v25;
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_52(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_notification_categorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_52_cold_1(v2);

  }
}

uint64_t __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_55(_QWORD *a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  void *v105;
  id v106;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "mode") == *(_QWORD *)(a1[4] + 16))
      objc_storeStrong((id *)(*(_QWORD *)(a1[26] + 8) + 40), a2);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_72:

      goto LABEL_73;
    }
    objc_msgSend(v6, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "usageType") != 17)
    {
LABEL_71:

      goto LABEL_72;
    }
    v106 = v6;
    v10 = a1[5];
    objc_msgSend(v9, "absoluteTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v10);
    v13 = v12;

    if (v13 >= 0.0 && v13 <= 86400.0)
    {
      v14 = (void *)a1[6];
      objc_msgSend(v9, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      if (*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
      {
        objc_msgSend(v9, "absoluteTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "compare:", v17) == -1)
        {

          goto LABEL_15;
        }
        objc_msgSend(v9, "absoluteTimestamp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "compare:", v19);

        if (v20 != 1)
        {
          v21 = (void *)a1[7];
          objc_msgSend(v9, "bundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v16);
LABEL_15:

        }
      }
    }
    v22 = a1[8];
    objc_msgSend(v9, "absoluteTimestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v22);
    v25 = v24;

    if (v25 < 0.0)
      goto LABEL_24;
    if (v25 > 604800.0)
      goto LABEL_24;
    v26 = (void *)a1[9];
    objc_msgSend(v9, "bundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

    if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
      goto LABEL_24;
    objc_msgSend(v9, "absoluteTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "compare:", v29) == -1)
    {

    }
    else
    {
      objc_msgSend(v9, "absoluteTimestamp");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "compare:", v31);

      if (v32 == 1)
      {
LABEL_24:
        v34 = *(void **)(a1[4] + 64);
        objc_msgSend(v9, "bundleID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = (void *)a1[11];
          objc_msgSend(v9, "bundleID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v104 = v39;
          if (v39)
            v40 = objc_msgSend(v39, "integerValue");
          else
            v40 = 0;
          v41 = objc_msgSend(v36, "count") - 1;
          while (v40 <= v41)
          {
            v42 = v40 + ((v41 - v40) >> 1);
            objc_msgSend(v36, "objectAtIndexedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "absoluteTimestamp");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "timeIntervalSinceDate:", v44);
            v46 = v45;

            if (v46 <= 0.0)
            {
              v40 = v42 + 1;
            }
            else if (v46 <= (double)(uint64_t)a1[27])
            {
              v105 = v43;
              do
              {
                v47 = v42;
                if (v42 <= v40)
                  break;
                --v42;
                objc_msgSend(v36, "objectAtIndexedSubscript:", v47 - 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "absoluteTimestamp");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "timeIntervalSinceDate:", v49);
                v51 = v50;

                if (v51 <= 0.0)
                  break;
              }
              while (v51 <= (double)(uint64_t)a1[27]);
              objc_msgSend(v36, "objectAtIndexedSubscript:", v47);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "absoluteTimestamp");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "timeIntervalSinceDate:", v53);
              v55 = v54;

              if (v55 <= (double)(uint64_t)a1[28])
              {
                v56 = (void *)a1[12];
                objc_msgSend(v9, "bundleID");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "addObject:", v57);

                if (*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                {
                  objc_msgSend(v9, "absoluteTimestamp");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = a1[28];
                  objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v59) = isTimeRangeWithinTimeRange(v58, v59, v60, v61);

                  if ((_DWORD)v59)
                  {
                    v62 = (void *)a1[13];
                    goto LABEL_67;
                  }
                }
LABEL_68:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = (void *)a1[11];
                objc_msgSend(v9, "bundleID");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, v102);

                break;
              }
              if (v55 <= (double)(uint64_t)a1[29])
              {
                v63 = (void *)a1[14];
                objc_msgSend(v9, "bundleID");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "addObject:", v64);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = a1[29];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v66) = isTimeRangeWithinTimeRange(v65, v66, v67, v68);

                if (!(_DWORD)v66)
                  goto LABEL_68;
                v62 = (void *)a1[15];
LABEL_67:
                objc_msgSend(v9, "bundleID");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "addObject:", v99);

                goto LABEL_68;
              }
              if (v55 <= (double)(uint64_t)a1[30])
              {
                v69 = (void *)a1[16];
                objc_msgSend(v9, "bundleID");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "addObject:", v70);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = a1[30];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v72) = isTimeRangeWithinTimeRange(v71, v72, v73, v74);

                if (!(_DWORD)v72)
                  goto LABEL_68;
                v62 = (void *)a1[17];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[31])
              {
                v75 = (void *)a1[18];
                objc_msgSend(v9, "bundleID");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "addObject:", v76);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = a1[31];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v78) = isTimeRangeWithinTimeRange(v77, v78, v79, v80);

                if (!(_DWORD)v78)
                  goto LABEL_68;
                v62 = (void *)a1[19];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[32])
              {
                v81 = (void *)a1[20];
                objc_msgSend(v9, "bundleID");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "addObject:", v82);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = a1[32];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v84) = isTimeRangeWithinTimeRange(v83, v84, v85, v86);

                if (!(_DWORD)v84)
                  goto LABEL_68;
                v62 = (void *)a1[21];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[33])
              {
                v87 = (void *)a1[22];
                objc_msgSend(v9, "bundleID");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "addObject:", v88);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = a1[33];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v90) = isTimeRangeWithinTimeRange(v89, v90, v91, v92);

                if (!(_DWORD)v90)
                  goto LABEL_68;
                v62 = (void *)a1[23];
                goto LABEL_67;
              }
              v43 = v105;
              if (v55 <= (double)(uint64_t)a1[27])
              {
                v93 = (void *)a1[24];
                objc_msgSend(v9, "bundleID");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "addObject:", v94);

                if (!*(_QWORD *)(*(_QWORD *)(a1[26] + 8) + 40))
                  goto LABEL_68;
                objc_msgSend(v9, "absoluteTimestamp");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = a1[27];
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "startTime");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1[26] + 8) + 40), "endTime");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v96) = isTimeRangeWithinTimeRange(v95, v96, v97, v98);

                if (!(_DWORD)v96)
                  goto LABEL_68;
                v62 = (void *)a1[25];
                goto LABEL_67;
              }
            }
            else
            {
              v41 = v42 - 1;
            }

          }
        }

        v6 = v106;
        goto LABEL_71;
      }
      v33 = (void *)a1[10];
      objc_msgSend(v9, "bundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v28);
    }

    goto LABEL_24;
  }
LABEL_73:

  return 1;
}

- (id)dateIntervalFromModeEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "endTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "endTime");
    else
      objc_msgSend(v4, "startTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v7, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)removeOldestEntry
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_cachedHistoricalResolutionsForNotifications, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    obj = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedHistoricalResolutionsForNotifications, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v11, "userNotification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "compare:", v3) == -1)
        {
          v15 = v14;

          v16 = v10;
          v3 = v15;
          v7 = v16;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);

    if (v7)
      -[NSMutableDictionary removeObjectForKey:](self->_cachedHistoricalResolutionsForNotifications, "removeObjectForKey:", v7);
  }
  else
  {

    v7 = 0;
  }

}

- (void)unloadHistoricalResolutionsForNotifications
{
  NSMutableDictionary *cachedHistoricalResolutionsForNotifications;
  ATXNotificationResolutionAccumulator *obj;

  obj = self;
  objc_sync_enter(obj);
  cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  obj->_cachedHistoricalResolutionsForNotifications = 0;

  objc_sync_exit(obj);
}

- (unint64_t)timeToLaunchApp
{
  return self->_timeToLaunchApp;
}

- (ATXHistoricalResolutonsForNotification)historicalResolutionsForNotification
{
  return self->_historicalResolutionsForNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalResolutionsForNotification, 0);
  objc_storeStrong((id *)&self->_cachedHistoricalResolutionsForNotifications, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_cacheHistoricalAppLaunches, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_notificationPublisher, 0);
  objc_storeStrong((id *)&self->_unifiedModePublisher, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

void __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXNotificationResolutionAccumulator: Error reading App.InFocus stream: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXNotificationResolutionAccumulator: During ordered merge, encountered unknown event: %@", v2);
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_52_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXNotificationResolutionAccumulator: Error from merged publishers: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
