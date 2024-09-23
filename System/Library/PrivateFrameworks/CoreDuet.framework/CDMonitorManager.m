@implementation CDMonitorManager

+ (id)monitorManagerForEventStreams:(id)a3 domain:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CDMonitorManager_monitorManagerForEventStreams_domain___block_invoke;
  v10[3] = &unk_1E26E4AA8;
  v11 = v5;
  v12 = a4;
  v6 = monitorManagerForEventStreams_domain__onceToken;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&monitorManagerForEventStreams_domain__onceToken, v10);
  v8 = (id)monitorManagerForEventStreams_domain__sharedInstance;

  return v8;
}

- (void)populateCurrentValueForStreamName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE109C80))
    objc_msgSend(v6, "synchronouslyReflectCurrentValue");

  objc_autoreleasePoolPop(v4);
}

- (id)_monitorForStreamName:(id)a3
{
  id v4;
  CDMonitorManager *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_monitors, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deliverNotificationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *monitorWorkQueue;
  id v15;
  _QWORD *v16;
  id v17;
  void *context;
  void *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x193FEE914]();
  v6 = v4;
  if (v4)
  {
    context = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CDMonitorManager _allMonitors](self, "_allMonitors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE109DA0))
          {
            monitorWorkQueue = self->_monitorWorkQueue;
            v20[0] = v11;
            v20[1] = 3221225472;
            v20[2] = __45__CDMonitorManager_deliverNotificationEvent___block_invoke;
            v20[3] = &unk_1E26E3250;
            v20[4] = v13;
            v21 = v6;
            v15 = v19;
            v16 = v20;
            block[0] = v11;
            block[1] = 3221225472;
            block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
            block[3] = &unk_1E26E3380;
            v27 = v15;
            v28 = v16;
            v17 = v15;
            dispatch_async(monitorWorkQueue, block);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v9);
    }

    v5 = context;
  }
  objc_autoreleasePoolPop(v5);

}

- (id)_allMonitors
{
  CDMonitorManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_monitors, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

uint64_t __45__CDMonitorManager_deliverNotificationEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveNotificationEvent:", *(_QWORD *)(a1 + 40));
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85(_QWORD *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4 || (v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x193FEEAF4](*(_QWORD *)(a1[4] + 32))) != 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85_cold_1();

    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, a1[6], v3);
  }

}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4 || (v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x193FEEAF4](*(_QWORD *)(a1[4] + 24))) != 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_cold_1();

    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, a1[6], v3);
  }

}

- (CDMonitorManager)initWithEventStreams:(id)a3 domain:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  objc_class *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  dispatch_queue_t v53;
  void *v54;
  NSObject *v55;
  __CFNotificationCenter *DarwinNotifyCenter;
  dispatch_source_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v61;
  void *context;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id observer;
  int v69;
  id obj;
  uint64_t v72;
  _QWORD handler[4];
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  void *v82;
  NSObject *v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  objc_super v98;
  _BYTE location[24];
  __int16 v100;
  uint64_t v101;
  void *v102[3];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v98.receiver = self;
  v98.super_class = (Class)CDMonitorManager;
  observer = -[CDMonitorManager init](&v98, sel_init);
  if (observer)
  {
    context = (void *)MEMORY[0x193FEE914]();
    if (!KnowledgeMonitorLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)location = xmmword_1E26E60E8;
      *(_QWORD *)&location[16] = 0;
      KnowledgeMonitorLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (KnowledgeMonitorLibraryCore_frameworkLibrary)
    {
      v102[0] = 0;
      if (!UsageTrackingLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)location = xmmword_1E26E6100;
        *(_QWORD *)&location[16] = 0;
        UsageTrackingLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (UsageTrackingLibraryCore_frameworkLibrary)
      {
        v102[0] = 0;
        +[_CDLogging contextChannel](_CDLogging, "contextChannel", v61);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[CDMonitorManager initWithEventStreams:domain:].cold.7();
      }
      else
      {
        +[_CDLogging contextChannel](_CDLogging, "contextChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[CDMonitorManager initWithEventStreams:domain:].cold.6();
      }

      +[_CDLogging contextChannel](_CDLogging, "contextChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[CDMonitorManager initWithEventStreams:domain:].cold.5();
    }
    else
    {
      +[_CDLogging contextChannel](_CDLogging, "contextChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[CDMonitorManager initWithEventStreams:domain:].cold.4();
    }

    _CDDomainAvailabilityDescription(a4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDMonitorManager initWithEventStreams:domain:].cold.3();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)observer + 9);
    *((_QWORD *)observer + 9) = v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v63, "allEventStreams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v11)
    {
      v72 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v95 != v72)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v13, "eventStreamProperties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            +[_CDLogging contextChannel](_CDLogging, "contextChannel");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[CDMonitorManager initWithEventStreams:domain:].cold.2((uint8_t *)v102, v13, (void **)((char *)v102 + 4), v23);
            goto LABEL_64;
          }
          objc_msgSend(v15, "lowercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsString:", CFSTR("(internal)"));

          if (!v17
            || +[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
          {
            objc_msgSend(v13, "eventStreamProperties");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isAvailable");

            if ((v19 & 1) != 0)
            {
              objc_msgSend(v13, "eventStreamProperties");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (objc_msgSend(v20, "domainAvailability") & a4) == 0;

              if (!v21)
              {
                objc_msgSend(v13, "eventStreamProperties");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "monitorClass");
                v23 = objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  v24 = NSClassFromString((NSString *)&v23->isa);
                  v25 = v24;
                  if (v24)
                  {
                    v26 = objc_alloc_init(v24);
                    if (v26)
                    {
                      objc_msgSend(v13, "eventStreamProperties");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = objc_msgSend(v27, "isInstant");

                      objc_msgSend(v13, "eventStreamProperties");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend(v29, "isHistorical");

                      objc_msgSend(v13, "eventStreamProperties");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v69 = objc_msgSend(v31, "setupOnDemand");

                      objc_msgSend(v13, "eventStreamProperties");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "pollingPeriod");

                      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
                      v34 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)location = 138544130;
                        *(_QWORD *)&location[4] = v15;
                        *(_WORD *)&location[12] = 1024;
                        *(_DWORD *)&location[14] = v28;
                        *(_WORD *)&location[18] = 1024;
                        *(_DWORD *)&location[20] = v30;
                        v100 = 2048;
                        v101 = v33;
                        _os_log_debug_impl(&dword_18DDBE000, v34, OS_LOG_TYPE_DEBUG, "Monitor %{public}@ IsInstant=%d, IsHistorical=%d, PollingPeriod=%ld", location, 0x22u);
                      }

                      if (v28
                        && -[NSObject conformsToProtocol:](v26, "conformsToProtocol:", &unk_1EE109C80))
                      {
                        v90[0] = MEMORY[0x1E0C809B0];
                        v90[1] = 3221225472;
                        v90[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke;
                        v90[3] = &unk_1E26E6078;
                        v91 = observer;
                        v92 = v15;
                        v93 = v13;
                        -[NSObject setInstantHandler:](v26, "setInstantHandler:", v90);

                      }
                      if (v30)
                      {
                        if (-[NSObject conformsToProtocol:](v26, "conformsToProtocol:", &unk_1EE109CE0))
                        {
                          v86[0] = MEMORY[0x1E0C809B0];
                          v86[1] = 3221225472;
                          v86[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85;
                          v86[3] = &unk_1E26E60A0;
                          v64 = observer;
                          v87 = v64;
                          v35 = v15;
                          v88 = v35;
                          v89 = v13;
                          -[NSObject setHistoricalHandler:](v26, "setHistoricalHandler:", v86);
                          if ((unint64_t)(v33 - 1) <= 6)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduetd.monitor.%@"), v35);
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_initWeak((id *)location, v26);
                            v84[0] = MEMORY[0x1E0C809B0];
                            v84[1] = 3221225472;
                            v84[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_91;
                            v84[3] = &unk_1E26E2C60;
                            objc_copyWeak(&v85, (id *)location);
                            +[_CDPeriodicSchedulerJob jobWithPeriod:schedulerJobName:handler:](_CDPeriodicSchedulerJob, "jobWithPeriod:schedulerJobName:handler:", v33, v36, v84);
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v38, "registerJob:", v37);

                            objc_destroyWeak(&v85);
                            objc_destroyWeak((id *)location);

                          }
                          objc_msgSend(v13, "eventStreamProperties");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v39, "shouldSaveCurrentEventOnShutdown");

                          if (v40)
                          {
                            v41 = v26;
                            objc_msgSend(*((id *)observer + 9), "addObject:", v41);
                            v79[0] = MEMORY[0x1E0C809B0];
                            v79[1] = 3221225472;
                            v79[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2;
                            v79[3] = &unk_1E26E4A58;
                            v80 = v64;
                            v81 = v35;
                            v82 = v13;
                            v83 = v41;
                            v42 = v41;
                            -[NSObject setShutdownHandler:](v42, "setShutdownHandler:", v79);

                          }
                        }
                        if (-[NSObject conformsToProtocol:](v26, "conformsToProtocol:", &unk_1EE109D40))
                        {
                          v75[0] = MEMORY[0x1E0C809B0];
                          v75[1] = 3221225472;
                          v75[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_100;
                          v75[3] = &unk_1E26E60C8;
                          v76 = observer;
                          v77 = v15;
                          v78 = v13;
                          -[NSObject setHistoricalDeletingHandler:](v26, "setHistoricalDeletingHandler:", v75);

                        }
                      }
                      objc_msgSend(v66, "setObject:forKey:", v26, v15);
                      if (v69)
                        objc_msgSend(v65, "addObject:", v15);
                    }
                    else
                    {
                      +[_CDLogging contextChannel](_CDLogging, "contextChannel");
                      v46 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromClass(v25);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)location = 138543618;
                        *(_QWORD *)&location[4] = v47;
                        *(_WORD *)&location[12] = 2114;
                        *(_QWORD *)&location[14] = v15;
                        _os_log_error_impl(&dword_18DDBE000, v46, OS_LOG_TYPE_ERROR, "Unable to initialize monitor %{public}@ for streamName %{public}@", location, 0x16u);

                      }
                    }
                  }
                  else
                  {
                    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)location = 138543618;
                      *(_QWORD *)&location[4] = v23;
                      *(_WORD *)&location[12] = 2114;
                      *(_QWORD *)&location[14] = v15;
                      _os_log_error_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_ERROR, "Unable to find monitor class %{public}@ for streamName %{public}@", location, 0x16u);
                    }
                  }
                }
                else
                {
                  +[_CDLogging contextChannel](_CDLogging, "contextChannel");
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)location = 138543362;
                    *(_QWORD *)&location[4] = v15;
                    _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "No monitor for %{public}@", location, 0xCu);
                  }
                }

                goto LABEL_64;
              }
              +[_CDLogging contextChannel](_CDLogging, "contextChannel");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)location = 138412546;
                *(_QWORD *)&location[4] = v67;
                *(_WORD *)&location[12] = 2112;
                *(_QWORD *)&location[14] = v15;
                v43 = v23;
                v44 = "Monitor is not supported in the %@ domain: %@ ";
                v45 = 22;
LABEL_55:
                _os_log_impl(&dword_18DDBE000, v43, OS_LOG_TYPE_INFO, v44, location, v45);
              }
            }
            else
            {
              +[_CDLogging contextChannel](_CDLogging, "contextChannel");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)location = 138412290;
                *(_QWORD *)&location[4] = v15;
                v43 = v23;
                v44 = "Monitor is not supported on this platform: %@";
                v45 = 12;
                goto LABEL_55;
              }
            }
LABEL_64:

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v11);
    }

    objc_storeStrong((id *)observer + 1, v66);
    objc_storeStrong((id *)observer + 2, v65);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      -[CDMonitorManager initWithEventStreams:domain:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)observer + 7);
    *((_QWORD *)observer + 7) = v49;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)observer + 8);
    *((_QWORD *)observer + 8) = v51;

    v53 = dispatch_queue_create("com.apple.CDMonitorManager.workQueue", MEMORY[0x1E0C80D50]);
    v54 = (void *)*((_QWORD *)observer + 10);
    *((_QWORD *)observer + 10) = v53;

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_18DDBE000, v55, OS_LOG_TYPE_INFO, "Registering for device shutdown notification", location, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, observer, (CFNotificationCallback)_handleShutdownNotification, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    signal(15, (void (__cdecl *)(int))1);
    v57 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, MEMORY[0x1E0C80D38]);
    v58 = (void *)*((_QWORD *)observer + 11);
    *((_QWORD *)observer + 11) = v57;

    v59 = *((_QWORD *)observer + 11);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_105;
    handler[3] = &unk_1E26E2F20;
    v74 = observer;
    dispatch_source_set_event_handler(v59, handler);
    dispatch_resume(*((dispatch_object_t *)observer + 11));

    objc_autoreleasePoolPop(context);
  }

  return (CDMonitorManager *)observer;
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_91(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x193FEE914]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "update");

  objc_autoreleasePoolPop(v2);
}

uint64_t __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 48))
  {
    v1 = result;
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2_cold_1();

    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 48) + 16))();
  }
  return result;
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v3 = a2;
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_100_cold_1();

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  }
}

uint64_t __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_105(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "Got a SIGTERM.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleShutdownNotification");
}

void __57__CDMonitorManager_monitorManagerForEventStreams_domain___block_invoke(uint64_t a1)
{
  CDMonitorManager *v1;
  void *v2;

  v1 = -[CDMonitorManager initWithEventStreams:domain:]([CDMonitorManager alloc], "initWithEventStreams:domain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)monitorManagerForEventStreams_domain__sharedInstance;
  monitorManagerForEventStreams_domain__sharedInstance = (uint64_t)v1;

}

- (id)_allStreamNames
{
  CDMonitorManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_monitors, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInstantHandler:(id)a3 forStreamName:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)MEMORY[0x193FEEAF4](a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_instantHandlerMap, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setInstantHandler:(id)a3 forStream:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v6, "eventStreamProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[CDMonitorManager _setInstantHandler:forStreamName:](self, "_setInstantHandler:forStreamName:", v10, v9);

  objc_autoreleasePoolPop(v7);
}

- (void)setInstantHandler:(id)a3
{
  void *v4;
  void *v5;
  id generalInstantHandler;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  v5 = (void *)MEMORY[0x193FEEAF4](v7);
  generalInstantHandler = self->_generalInstantHandler;
  self->_generalInstantHandler = v5;

  objc_autoreleasePoolPop(v4);
}

- (void)_setHistoricalHandler:(id)a3 forStreamName:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)MEMORY[0x193FEEAF4](a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_historicalHandlerMap, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setHistoricalHandler:(id)a3 forStream:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v6, "eventStreamProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[CDMonitorManager _setHistoricalHandler:forStreamName:](self, "_setHistoricalHandler:forStreamName:", v10, v9);

  objc_autoreleasePoolPop(v7);
}

- (void)setHistoricalHandler:(id)a3
{
  void *v4;
  void *v5;
  id generalHistoricalHandler;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  v5 = (void *)MEMORY[0x193FEEAF4](v7);
  generalHistoricalHandler = self->_generalHistoricalHandler;
  self->_generalHistoricalHandler = v5;

  objc_autoreleasePoolPop(v4);
}

- (void)setHistoricalDeletingHandler:(id)a3
{
  void *v4;
  void *v5;
  id generalHistoricalDeletingHandler;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  v5 = (void *)MEMORY[0x193FEEAF4](v7);
  generalHistoricalDeletingHandler = self->_generalHistoricalDeletingHandler;
  self->_generalHistoricalDeletingHandler = v5;

  objc_autoreleasePoolPop(v4);
}

- (void)setShutdownHandler:(id)a3
{
  void *v4;
  void *v5;
  id generalShutdownHandler;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  v5 = (void *)MEMORY[0x193FEEAF4](v7);
  generalShutdownHandler = self->_generalShutdownHandler;
  self->_generalShutdownHandler = v5;

  objc_autoreleasePoolPop(v4);
}

- (void)_startMonitorForStreamName:(id)a3
{
  void *v4;
  void *v5;
  NSObject *monitorWorkQueue;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)os_transaction_create();
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE109C80))
  {
    monitorWorkQueue = self->_monitorWorkQueue;
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__CDMonitorManager__startMonitorForStreamName___block_invoke;
    v10[3] = &unk_1E26E2F20;
    v11 = v4;
    v8 = v5;
    v9 = v10;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
    block[3] = &unk_1E26E3380;
    v13 = v8;
    v14 = v9;
    dispatch_async(monitorWorkQueue, block);

  }
}

uint64_t __47__CDMonitorManager__startMonitorForStreamName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)startMonitorForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v4, "eventStreamProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      -[CDMonitorManager startMonitorForStream:].cold.2();

    -[CDMonitorManager _startMonitorForStreamName:](self, "_startMonitorForStreamName:", v7);
  }
  else
  {
    if (v9)
      -[CDMonitorManager startMonitorForStream:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)start
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *context;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x193FEE914](self, a2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CDMonitorManager _allStreamNames](self, "_allStreamNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_lazyMonitorNames, "containsObject:", v8) & 1) != 0)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v8;
            _os_log_debug_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEBUG, "------> Skipping start for OnDemand monitor : %{public}@", buf, 0xCu);
          }

        }
        else
        {
          -[CDMonitorManager _startMonitorForStreamName:](self, "_startMonitorForStreamName:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_stopMonitorForStreamName:(id)a3
{
  void *v4;
  void *v5;
  OS_dispatch_queue *monitorWorkQueue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE109C80))
  {
    monitorWorkQueue = self->_monitorWorkQueue;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__CDMonitorManager__stopMonitorForStreamName___block_invoke;
    v12[3] = &unk_1E26E2F20;
    v13 = v5;
    v8 = v12;
    v9 = monitorWorkQueue;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
    block[3] = &unk_1E26E3380;
    v15 = v10;
    v16 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
}

uint64_t __46__CDMonitorManager__stopMonitorForStreamName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)stopMonitorForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v4, "eventStreamProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      -[CDMonitorManager stopMonitorForStream:].cold.2();

    -[CDMonitorManager _stopMonitorForStreamName:](self, "_stopMonitorForStreamName:", v7);
  }
  else
  {
    if (v9)
      -[CDMonitorManager stopMonitorForStream:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)stop
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *context;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x193FEE914](self, a2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CDMonitorManager _allStreamNames](self, "_allStreamNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_lazyMonitorNames, "containsObject:", v8) & 1) != 0)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v8;
            _os_log_debug_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEBUG, "------> Skipping stop for OnDemand monitor : %{public}@", buf, 0xCu);
          }

        }
        else
        {
          -[CDMonitorManager _stopMonitorForStreamName:](self, "_stopMonitorForStreamName:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_currentEventForStreamName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "conformsToProtocol:", &unk_1EE109C80))
  {
    objc_msgSend(v4, "currentEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)currentEventForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v4, "eventStreamProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDMonitorManager _currentEventForStreamName:](self, "_currentEventForStreamName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)currentEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CDMonitorManager _allStreamNames](self, "_allStreamNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CDMonitorManager _currentEventForStreamName:](self, "_currentEventForStreamName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (void)_updateForStreamName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE109CE0))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDMonitorManager _updateForStreamName:].cold.1();

    objc_msgSend(v6, "update");
  }

}

- (void)updateForStream:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v7, "eventStreamProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[CDMonitorManager _updateForStreamName:](self, "_updateForStreamName:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)update
{
  void *v3;
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
  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CDMonitorManager _allStreamNames](self, "_allStreamNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[CDMonitorManager _updateForStreamName:](self, "_updateForStreamName:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_lastUpdateForStreamName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[CDMonitorManager _monitorForStreamName:](self, "_monitorForStreamName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "conformsToProtocol:", &unk_1EE109CE0))
  {
    objc_msgSend(v4, "lastUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lastUpdateForStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v4, "eventStreamProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDMonitorManager _lastUpdateForStreamName:](self, "_lastUpdateForStreamName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)lastUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CDMonitorManager _allStreamNames](self, "_allStreamNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CDMonitorManager _lastUpdateForStreamName:](self, "_lastUpdateForStreamName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (void)handleShutdownNotification
{
  NSMutableSet *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_shutdownHandlingMonitors;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v4 = 138412290;
    v12 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "shutdownHandler", v12, (_QWORD)v13);
        v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v10 = (objc_class *)objc_opt_class();
            NSStringFromClass(v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v12;
            v18 = v11;
            _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, "Calling shutdown handler for monitor %@.", buf, 0xCu);

          }
          v9[2](v9);
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

}

- (void)_addMonitor:(id)a3 forStreamName:(id)a4
{
  id v6;
  CDMonitorManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_monitors, "setObject:forKeyedSubscript:", v8, v6);
    objc_sync_exit(v7);

  }
}

- (void)addMonitor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend((id)objc_opt_class(), "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMonitorManager _addMonitor:forStreamName:](self, "_addMonitor:forStreamName:", v6, v5);

  objc_autoreleasePoolPop(v4);
}

- (void)_removeMonitorForStreamName:(id)a3
{
  id v4;
  CDMonitorManager *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary removeObjectForKey:](v5->_monitors, "removeObjectForKey:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeMonitor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend((id)objc_opt_class(), "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMonitorManager _removeMonitorForStreamName:](self, "_removeMonitorForStreamName:", v5);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)_hasMonitorForStreamName:(id)a3
{
  id v4;
  CDMonitorManager *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_monitors, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasMonitor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend((id)objc_opt_class(), "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CDMonitorManager _hasMonitorForStreamName:](self, "_hasMonitorForStreamName:", v6);

  objc_autoreleasePoolPop(v5);
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIGTERMHandlerSource, 0);
  objc_storeStrong((id *)&self->_monitorWorkQueue, 0);
  objc_storeStrong((id *)&self->_shutdownHandlingMonitors, 0);
  objc_storeStrong((id *)&self->_historicalHandlerMap, 0);
  objc_storeStrong((id *)&self->_instantHandlerMap, 0);
  objc_storeStrong(&self->_generalShutdownHandler, 0);
  objc_storeStrong(&self->_generalHistoricalDeletingHandler, 0);
  objc_storeStrong(&self->_generalHistoricalHandler, 0);
  objc_storeStrong(&self->_generalInstantHandler, 0);
  objc_storeStrong((id *)&self->_lazyMonitorNames, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
}

- (void)initWithEventStreams:domain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Lazily initialized Monitors = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithEventStreams:(_QWORD *)a3 domain:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_18DDBE000, a4, OS_LOG_TYPE_ERROR, "Stream missing name: %@", a1, 0xCu);

}

- (void)initWithEventStreams:domain:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Initializing monitor manager for domain %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithEventStreams:domain:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "KnowledgeMonitorLibrary is NOT available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithEventStreams:domain:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "KnowledgeMonitorLibrary is available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithEventStreams:domain:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "UsageTrackingLibrary is NOT available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithEventStreams:domain:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "UsageTrackingLibrary is available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Calling instant handler for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Calling historical handler for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Calling shutdown handler for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_100_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Calling deletion handler for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)startMonitorForStream:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a1, a3, "------>Did NOT -startMonitorForStream: (OnDemand monitor) %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)startMonitorForStream:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "------> -startMonitorForStream: (OnDemand monitor) %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)stopMonitorForStream:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a1, a3, "------>Did NOT -stopMonitorForStream: (OnDemand monitor) %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)stopMonitorForStream:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "------> -stopMonitorForStream: (OnDemand monitor) %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_updateForStreamName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Updating monitor %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
