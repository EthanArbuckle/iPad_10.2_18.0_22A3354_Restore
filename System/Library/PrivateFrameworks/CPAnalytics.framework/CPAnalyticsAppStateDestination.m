@implementation CPAnalyticsAppStateDestination

- (CPAnalyticsAppStateDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6;
  id v7;
  CPAnalyticsAppStateDestination *v8;
  CPAnalyticsAppStateDestination *v9;
  uint64_t v10;
  NSArray *sessionCounters;
  uint64_t v12;
  NSArray *featureCounters;
  uint64_t v14;
  NSSet *appEventNames;
  void *v16;
  uint64_t v17;
  NSArray *v18;
  CPAnalyticsScreenManager *v19;
  CPAnalyticsScreenManager *screenManager;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CPAnalyticsAppStateDestination;
  v8 = -[CPAnalyticsDashboardDestination initWithConfig:cpAnalyticsInstance:](&v27, sel_initWithConfig_cpAnalyticsInstance_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[CPAnalyticsAppStateDestination _createCountersFromConfig:withKey:](v8, "_createCountersFromConfig:withKey:", v6, CFSTR("counters"));
    v10 = objc_claimAutoreleasedReturnValue();
    sessionCounters = v9->_sessionCounters;
    v9->_sessionCounters = (NSArray *)v10;

    -[CPAnalyticsAppStateDestination _createCountersFromConfig:withKey:](v9, "_createCountersFromConfig:withKey:", v6, CFSTR("activeUserFeatures"));
    v12 = objc_claimAutoreleasedReturnValue();
    featureCounters = v9->_featureCounters;
    v9->_featureCounters = (NSArray *)v12;

    -[CPAnalyticsAppStateDestination _validateAndParseAppEvents:](v9, "_validateAndParseAppEvents:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    appEventNames = v9->_appEventNames;
    v9->_appEventNames = (NSSet *)v14;

    if (-[NSSet count](v9->_appEventNames, "count"))
    {
      -[CPAnalyticsAppStateDestination _createCountersFromAppEvents:](v9, "_createCountersFromAppEvents:", v9->_appEventNames);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObjectsFromArray:](v9->_featureCounters, "arrayByAddingObjectsFromArray:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v9->_featureCounters;
      v9->_featureCounters = (NSArray *)v17;

    }
    else
    {
      v16 = v9->_featureCounters;
      v9->_featureCounters = (NSArray *)MEMORY[0x24BDBD1A8];
    }

    v19 = -[CPAnalyticsScreenManager initWithConfig:cpAnalyticsInstance:]([CPAnalyticsScreenManager alloc], "initWithConfig:cpAnalyticsInstance:", v6, v7);
    screenManager = v9->_screenManager;
    v9->_screenManager = v19;

    -[CPAnalyticsScreenManager namesOfViewsToTrack](v9->_screenManager, "namesOfViewsToTrack");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsAppStateDestination _createCountersFromScreenNames:](v9, "_createCountersFromScreenNames:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray arrayByAddingObjectsFromArray:](v9->_featureCounters, "arrayByAddingObjectsFromArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v9->_featureCounters;
    v9->_featureCounters = (NSArray *)v23;

    objc_msgSend(v7, "systemProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsAppStateDestination registerSystemProperties:](v9, "registerSystemProperties:", v25);

  }
  return v9;
}

- (void)updateWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  CPAnalyticsEventCounter *v19;
  NSObject *p_super;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSSet *appEventNames;
  uint64_t v27;
  NSArray *featureCounters;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  NSArray *sessionCounters;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  NSArray *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  NSArray *v61;
  NSObject *v62;
  NSObject *v63;
  int v64;
  void *v65;
  void *v66;
  CPAnalyticsAppStateDestination *v67;
  id v68;
  void *v69;
  id v70;
  NSObject *obj;
  _QWORD v72[4];
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  NSObject *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  NSObject *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t v95[128];
  uint8_t buf[4];
  _BYTE v97[14];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPAnalyticsAppStateDestination screenManager](self, "screenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithConfig:", v4);

  -[CPAnalyticsAppStateDestination _validateAndParseAppEvents:](self, "_validateAndParseAppEvents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v4;
  v69 = v6;
  v67 = self;
  if (objc_msgSend(v6, "count"))
  {
    -[CPAnalyticsAppStateDestination appEventNames](self, "appEventNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = (void *)v8;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v13 = v6;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v92;
      obj = v13;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v92 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (objc_msgSend(v12, "containsObject:", v18))
          {
            CPAnalyticsLog();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v97 = v18;
              _os_log_error_impl(&dword_20AB22000, v47, OS_LOG_TYPE_ERROR, "AppEvent, %@, already exists in AppState whitelist", buf, 0xCu);
            }
LABEL_57:
            v4 = v68;
            goto LABEL_62;
          }
          v90[0] = MEMORY[0x24BDAC760];
          v90[1] = 3221225472;
          v90[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke;
          v90[3] = &unk_24C36EB88;
          v90[4] = v18;
          if (objc_msgSend(v11, "indexOfObjectPassingTest:", v90) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = -[CPAnalyticsEventCounter initWithEventName:]([CPAnalyticsEventCounter alloc], "initWithEventName:", v18);
            if (v19)
            {
              p_super = &v19->super;
              objc_msgSend(v9, "addObject:", v19);
            }
            else
            {
              v21 = v11;
              v22 = v9;
              v23 = v12;
              CPAnalyticsLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v97 = v18;
                _os_log_error_impl(&dword_20AB22000, v24, OS_LOG_TYPE_ERROR, "Could not create AppEvent counter from event name: %@", buf, 0xCu);
              }

              p_super = 0;
              v12 = v23;
              v9 = v22;
              v11 = v21;
              v13 = obj;
            }
          }
          else
          {
            CPAnalyticsLog();
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v97 = v18;
              _os_log_error_impl(&dword_20AB22000, p_super, OS_LOG_TYPE_ERROR, "AppEvent Counter, %@, already exists in AppState counters config", buf, 0xCu);
            }
          }

        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
    v25 = objc_claimAutoreleasedReturnValue();
    self = v67;
    appEventNames = v67->_appEventNames;
    v67->_appEventNames = (NSSet *)v25;

    -[NSArray arrayByAddingObjectsFromArray:](v67->_featureCounters, "arrayByAddingObjectsFromArray:", v9);
    v27 = objc_claimAutoreleasedReturnValue();
    featureCounters = v67->_featureCounters;
    v67->_featureCounters = (NSArray *)v27;

    v4 = v68;
    v6 = v69;
  }
  -[CPAnalyticsAppStateDestination _createCountersFromConfig:withKey:](self, "_createCountersFromConfig:withKey:", v4, CFSTR("counters"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v29;
  if (objc_msgSend(v29, "count"))
  {
    -[CPAnalyticsAppStateDestination sessionCounters](self, "sessionCounters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v87;
      v34 = MEMORY[0x24BDAC760];
      while (2)
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v87 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = v34;
          v84[1] = 3221225472;
          v84[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_34;
          v84[3] = &unk_24C36EB88;
          v37 = v36;
          v85 = v37;
          if (objc_msgSend(v9, "indexOfObjectPassingTest:", v84) != 0x7FFFFFFFFFFFFFFFLL)
          {
            obj = v37;
            CPAnalyticsLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v97 = v37;
              _os_log_error_impl(&dword_20AB22000, v62, OS_LOG_TYPE_ERROR, "Counter, %@, already exists in AppState config", buf, 0xCu);
            }

            v47 = v85;
            v11 = v30;
            v12 = v30;
            goto LABEL_57;
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v32)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v30);
    v38 = objc_claimAutoreleasedReturnValue();
    self = v67;
    sessionCounters = v67->_sessionCounters;
    v67->_sessionCounters = (NSArray *)v38;

    v4 = v68;
    v6 = v69;
  }
  -[CPAnalyticsAppStateDestination _createCountersFromConfig:withKey:](self, "_createCountersFromConfig:withKey:", v4, CFSTR("activeUserFeatures"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v9;
    v41 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v81;
      v44 = MEMORY[0x24BDAC760];
      while (2)
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v81 != v43)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "name");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = v44;
          v78[1] = 3221225472;
          v78[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_35;
          v78[3] = &unk_24C36EB88;
          v47 = v46;
          v79 = v47;
          if (objc_msgSend(v40, "indexOfObjectPassingTest:", v78) != 0x7FFFFFFFFFFFFFFFLL)
          {
            CPAnalyticsLog();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v97 = v47;
              _os_log_error_impl(&dword_20AB22000, v63, OS_LOG_TYPE_ERROR, "Feature, %@, already exists in AppState config", buf, 0xCu);
            }

            v61 = (NSArray *)v79;
            v12 = v66;
            v4 = v68;
            v11 = v40;
            goto LABEL_61;
          }

        }
        v42 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
        if (v42)
          continue;
        break;
      }
    }

    CPAnalyticsLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v64 = -[NSObject count](obj, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v97 = v64;
      *(_WORD *)&v97[4] = 2112;
      *(_QWORD *)&v97[6] = obj;
      _os_log_debug_impl(&dword_20AB22000, v48, OS_LOG_TYPE_DEBUG, "[AppStateDestination] Updated %d featureCounters %@", buf, 0x12u);
    }

    objc_msgSend(v40, "arrayByAddingObjectsFromArray:", obj);
    v49 = objc_claimAutoreleasedReturnValue();
    self = v67;
    v50 = v67->_featureCounters;
    v67->_featureCounters = (NSArray *)v49;

    v4 = v68;
    v6 = v69;
  }
  -[CPAnalyticsScreenManager namesOfViewsToTrack](self->_screenManager, "namesOfViewsToTrack");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsAppStateDestination _createCountersFromScreenNames:](self, "_createCountersFromScreenNames:", v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v11, "count"))
  {
    v65 = v9;
    -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters");
    v47 = objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v70 = v11;
    v52 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v75;
      v55 = MEMORY[0x24BDAC760];
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v75 != v54)
            objc_enumerationMutation(v70);
          v57 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
          objc_msgSend(v57, "name");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v55;
          v72[1] = 3221225472;
          v72[2] = __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_36;
          v72[3] = &unk_24C36EB88;
          v59 = v58;
          v73 = v59;
          if (-[NSObject indexOfObjectPassingTest:](v47, "indexOfObjectPassingTest:", v72) == 0x7FFFFFFFFFFFFFFFLL)
            -[NSObject addObject:](obj, "addObject:", v57);

        }
        v53 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
      }
      while (v53);
    }
    v11 = v70;

    -[NSObject arrayByAddingObjectsFromArray:](v47, "arrayByAddingObjectsFromArray:", obj);
    v60 = objc_claimAutoreleasedReturnValue();
    v4 = v68;
    v61 = v67->_featureCounters;
    v67->_featureCounters = (NSArray *)v60;
    v9 = v65;
    v12 = v66;
LABEL_61:

LABEL_62:
    v6 = v69;
  }
  else
  {
    v12 = v66;
  }

}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPAnalyticsAppStateDestination _updateDependenciesBeforeProcessingEvent:](self, "_updateDependenciesBeforeProcessingEvent:", v4);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.screenView"), "isEqualToString:", v5);

  if (v6)
    -[CPAnalyticsAppStateDestination sendDashboardScreenViewEventForEvent:](self, "sendDashboardScreenViewEventForEvent:", v4);
  -[CPAnalyticsAppStateDestination appEventNames](self, "appEventNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[CPAnalyticsAppStateDestination sendDashboardAppEventForEvent:](self, "sendDashboardAppEventForEvent:", v4);
    -[CPAnalyticsAppStateDestination _sendDashboardMediaEventIfNeededForEvent:](self, "_sendDashboardMediaEventIfNeededForEvent:", v4);
    -[CPAnalyticsAppStateDestination _sendDashboardErrorEventIfNeededForEvent:](self, "_sendDashboardErrorEventIfNeededForEvent:", v4);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CPAnalyticsAppStateDestination sessionCounters](self, "sessionCounters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14++), "countEvent:", v4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19++), "countEvent:", v4);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  if (+[CPAnalyticsAppStateDestination isValidSessionEndEvent:](CPAnalyticsAppStateDestination, "isValidSessionEndEvent:", v4))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("signpostDuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsAppStateDestination _computeSessionData:](self, "_computeSessionData:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsAppStateDestination _sendAppSessionEventFromSourceEvent:payload:](self, "_sendAppSessionEventFromSourceEvent:payload:", v4, v21);
    -[CPAnalyticsAppStateDestination _sendFeatureCounts](self, "_sendFeatureCounts");
    -[CPAnalyticsAppStateDestination _resetCounters](self, "_resetCounters");

  }
}

- (id)_createCountersFromConfig:(id)a3 withKey:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CPAnalyticsEventCounter *v12;
  CPAnalyticsEventCounter *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [CPAnalyticsEventCounter alloc];
        v13 = -[CPAnalyticsEventCounter initWithConfig:](v12, "initWithConfig:", v11, (_QWORD)v15);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_createCountersFromAppEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CPAnalyticsEventCounter *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = -[CPAnalyticsEventCounter initWithEventName:]([CPAnalyticsEventCounter alloc], "initWithEventName:", v10);
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          CPAnalyticsLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v10;
            _os_log_error_impl(&dword_20AB22000, v12, OS_LOG_TYPE_ERROR, "Could not create AppEvent counter from event name: %@", buf, 0xCu);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_createCountersFromScreenNames:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CPAnalyticsEventCounter *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = CFSTR("<!--");
    do
    {
      v9 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "hasPrefix:", v8) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("screen_"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = CFSTR("cpa_common_currentScreen");
          v29 = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPAnalyticsEventMatcher eventMatcherWithEventName:properties:](CPAnalyticsEventMatcher, "eventMatcherWithEventName:properties:", CFSTR("com.apple.photos.CPAnalytics.screenView"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[CPAnalyticsEventCounter initWithName:matcher:]([CPAnalyticsEventCounter alloc], "initWithName:matcher:", v11, v13);
          if (v14)
          {
            objc_msgSend(v21, "addObject:", v14);
          }
          else
          {
            v15 = v7;
            v16 = v8;
            v17 = v4;
            CPAnalyticsLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v10;
              _os_log_error_impl(&dword_20AB22000, v18, OS_LOG_TYPE_ERROR, "Could not create screen counter from screen name: %@", buf, 0xCu);
            }

            v4 = v17;
            v8 = v16;
            v7 = v15;
            v6 = v20;
          }

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  return v21;
}

- (void)_resetCounters
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[CPAnalyticsAppStateDestination sessionCounters](self, "sessionCounters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "resetCount");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "resetCount", (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (id)_validateAndParseAppEvents:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("appEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple."), (_QWORD)v12))
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateDependenciesBeforeProcessingEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPAnalyticsAppStateDestination screenManager](self, "screenManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processEvent:", v4);

}

- (id)_computeSessionData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[CPAnalyticsAppStateDestination screenManager](self, "screenManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentScreenViewName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("cpa_session_exitScreen"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[CPAnalyticsAppStateDestination screenManager](self, "screenManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "screensViewCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("cpa_session_screenViewCount"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:", round(v12 * 100.0) / 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("cpa_session_timeInApp"));

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("cpa_session_id"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CPAnalyticsAppStateDestination sessionCounters](self, "sessionCounters", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  return v5;
}

- (void)_sendAppSessionEventFromSourceEvent:(id)a3 payload:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.session"), a3, v6);
  -[CPAnalyticsDashboardDestination cpAnalyticsInstance](self, "cpAnalyticsInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.appSession"), v6);

}

- (void)_sendFeatureCounts
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CPAnalyticsAppStateDestination featureCounters](self, "featureCounters", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[CPAnalyticsDashboardDestination cpAnalyticsInstance](self, "cpAnalyticsInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.featureUsageCounts"), v5);

  }
}

- (BOOL)shouldSendSampleWithRate:(unint64_t)a3
{
  return arc4random_uniform(a3) == 1;
}

- (void)sendDashboardScreenViewEventForEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(v5, "copyRawPayload");
  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.screenView"), v5, v4);
  if (-[CPAnalyticsAppStateDestination shouldSendSampleWithRate:](self, "shouldSendSampleWithRate:", 30))
    -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.screenView.v2"), v5, v4);

}

- (void)sendDashboardAppEventForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = CFSTR("cpa_event_name");
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.event"), v4, v6);
  if (-[CPAnalyticsAppStateDestination shouldSendSampleWithRate:](self, "shouldSendSampleWithRate:", 30))
    -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.event.v2"), v4, v6);

}

- (void)_sendDashboardMediaEventIfNeededForEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPAnalyticsDashboardDestination isMediaEvent:](self, "isMediaEvent:"))
    -[CPAnalyticsAppStateDestination sendDashboardMediaEventForEvent:](self, "sendDashboardMediaEventForEvent:", v4);

}

- (void)sendDashboardMediaEventForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = CFSTR("cpa_event_name");
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsDashboardDestination allMediaProperties](self, "allMediaProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsDashboardDestination buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:](self, "buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:", v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.mediaEvent"), v4, v8);
  if (-[CPAnalyticsAppStateDestination shouldSendSampleWithRate:](self, "shouldSendSampleWithRate:", 30))
    -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.mediaEvent.v2"), v4, v8);

}

- (void)_sendDashboardErrorEventIfNeededForEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "propertyForKey:", CFSTR("cpa_error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CPAnalyticsAppStateDestination sendDashboardErrorEventForEvent:](self, "sendDashboardErrorEventForEvent:", v5);
    else
      -[CPAnalyticsDashboardDestination reportMalformedEvent:malformationDescriptionWithFormat:](self, "reportMalformedEvent:malformationDescriptionWithFormat:", v5, CFSTR("unexpected class for payload property %@"), CFSTR("cpa_error"));
  }

}

- (void)sendDashboardErrorEventForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = CFSTR("cpa_event_name");
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsDashboardDestination allErrorProperties](self, "allErrorProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPAnalyticsDashboardDestination isMediaEvent:](self, "isMediaEvent:", v4))
  {
    -[CPAnalyticsDashboardDestination allMediaProperties](self, "allMediaProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  -[CPAnalyticsDashboardDestination buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:](self, "buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:", v7, v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.errorEvent"), v4, v10);

}

- (id)allStandardProperties
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsAppStateDestination;
  -[CPAnalyticsDashboardDestination allStandardProperties](&v6, sel_allStandardProperties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("cpa_common_appSection");
  v7[1] = CFSTR("cpa_common_currentScreen");
  v7[2] = CFSTR("cpa_common_priorScreen");
  v7[3] = CFSTR("cpa_common_numScreensViewed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cpa_isAppEvent")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[CPAnalyticsAppStateDestination appEventNames](self, "appEventNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "containsObject:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)registerSystemProperties:(id)a3
{
  objc_msgSend(a3, "addDynamicProperty:withProvider:", CFSTR("cpa_isAppEvent"), self);
}

- (NSArray)featureCounters
{
  return self->_featureCounters;
}

- (void)setFeatureCounters:(id)a3
{
  objc_storeStrong((id *)&self->_featureCounters, a3);
}

- (NSArray)sessionCounters
{
  return self->_sessionCounters;
}

- (void)setSessionCounters:(id)a3
{
  objc_storeStrong((id *)&self->_sessionCounters, a3);
}

- (NSSet)appEventNames
{
  return self->_appEventNames;
}

- (void)setAppEventNames:(id)a3
{
  objc_storeStrong((id *)&self->_appEventNames, a3);
}

- (CPAnalyticsScreenManager)screenManager
{
  return self->_screenManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenManager, 0);
  objc_storeStrong((id *)&self->_appEventNames, 0);
  objc_storeStrong((id *)&self->_sessionCounters, 0);
  objc_storeStrong((id *)&self->_featureCounters, 0);
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_35(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __51__CPAnalyticsAppStateDestination_updateWithConfig___block_invoke_36(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (BOOL)isValidSessionEndEvent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v11;
  int v12;
  NSObject *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.signpost.appVisiblePeriod"), "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v3, "propertyForKey:", CFSTR("className"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "propertyForKey:", CFSTR("signpostDuration"));
      v7 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      CPAnalyticsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v11;
        _os_log_debug_impl(&dword_20AB22000, v9, OS_LOG_TYPE_DEBUG, "Signpost duration '%@' is not a number for event %@.", (uint8_t *)&v12, 0x16u);

      }
    }
    else
    {
      CPAnalyticsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v3, "name");
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v9;
      _os_log_debug_impl(&dword_20AB22000, v7, OS_LOG_TYPE_DEBUG, "Class name '%@' is not a string for event %@.", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_11;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

@end
