@implementation ATXSleepSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_5 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_5, &__block_literal_global_41);
  return (id)sharedInstance__pasExprOnceResult_6;
}

void __42__ATXSleepSuggestionServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6;
  sharedInstance__pasExprOnceResult_6 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSleepSuggestionServer)init
{
  ATXSleepSuggestionServer *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCListener *listener;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXSleepSuggestionServer;
  v2 = -[ATXSleepSuggestionServer init](&v8, sel_init);
  if (v2)
  {
    __atxlog_handle_sleep_schedule();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXSleepSuggestionServer: launched", v7, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.sleepSchedule"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (ATXSleepSuggestionServer)initWithEvents:(id)a3
{
  id v5;
  ATXSleepSuggestionServer *v6;
  ATXSleepSuggestionServer *v7;

  v5 = a3;
  v6 = -[ATXSleepSuggestionServer init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_events, a3);

  return v7;
}

- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSArray *v5;
  NSArray *events;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSArray *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSArray *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  ATXSleepSuggestionServer *v66;
  void *v67;
  void (**v68)(id, void *, _QWORD);
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  char v78[16];
  char v79[16];
  _BYTE v80[128];
  uint64_t v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (!self->_events)
  {
    -[ATXSleepSuggestionServer queryEvents](self, "queryEvents");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    events = self->_events;
    self->_events = v5;

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setDateFormat:", CFSTR("HH:mm"));
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = self->_events;
  if (v12 && -[NSArray count](v12, "count"))
  {
    v67 = v7;
    v68 = (void (**)(id, void *, _QWORD))v4;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v66 = self;
    v13 = self->_events;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v71 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v18, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringFromDate:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

          __atxlog_handle_modes();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.8((uint64_t)v79, (uint64_t)v18);

          objc_msgSend(v18, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringFromDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v23);

          __atxlog_handle_modes();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.7((uint64_t)v78, (uint64_t)v18);

        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v15);
    }

    if ((unint64_t)objc_msgSend(v10, "count") >= 3 && (unint64_t)objc_msgSend(v11, "count") > 2)
    {
      objc_msgSend(v10, "sortUsingSelector:", sel_compare_);
      objc_msgSend(v11, "sortUsingSelector:", sel_compare_);
      __atxlog_handle_sleep_schedule();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.6();

      __atxlog_handle_sleep_schedule();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.5();

      v31 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v11, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v11, "count") >> 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsSeparatedByString:", CFSTR(":"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHour:", objc_msgSend(v41, "integerValue"));

      v69 = v39;
      objc_msgSend(v39, "componentsSeparatedByString:", CFSTR(":"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMinute:", objc_msgSend(v43, "integerValue"));

      objc_msgSend(v31, "setCalendar:", v67);
      objc_msgSend(v67, "timeZone");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTimeZone:", v44);

      v45 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsSeparatedByString:", CFSTR(":"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setHour:", objc_msgSend(v48, "integerValue"));

      objc_msgSend(v46, "componentsSeparatedByString:", CFSTR(":"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setMinute:", objc_msgSend(v50, "integerValue"));

      objc_msgSend(v45, "setCalendar:", v67);
      objc_msgSend(v67, "timeZone");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTimeZone:", v51);

      __atxlog_handle_sleep_schedule();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.4(v45, v31, v52);

      if (-[ATXSleepSuggestionServer isSleepScheduleBetweenTheBoundariesWithBedtime:wakeupTime:](v66, "isSleepScheduleBetweenTheBoundariesWithBedtime:wakeupTime:", v45, v31))
      {
        v53 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90D8]), "initWithBedtimeComponents:wakeupComponents:weekdays:", v45, v31, 127);
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C8]), "initWithOccurence:", v53);
        v55 = objc_alloc(MEMORY[0x1E0C99EA0]);
        v56 = (void *)objc_msgSend(v55, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
        v57 = 3600 * objc_msgSend(v45, "hour");
        v58 = objc_msgSend(v45, "minute");
        objc_msgSend(v56, "setInteger:forKey:", v57 + 60 * v58, *MEMORY[0x1E0CF95F0]);
        v68[2](v68, v54, 0);
        v59 = v66->_events;
        v66->_events = 0;

      }
      else
      {
        __atxlog_handle_sleep_schedule();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.3();

        v61 = (void *)MEMORY[0x1E0CB35C8];
        v62 = *MEMORY[0x1E0CF8B18];
        v63 = *MEMORY[0x1E0CF8B20];
        v74 = *MEMORY[0x1E0CB2938];
        v75 = CFSTR("Predicted schedule isn't between the boundaries");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v68)[2](v68, 0, v65);

        v53 = v66->_events;
        v66->_events = 0;
      }

      v7 = v67;
      v4 = (void (**)(id, _QWORD, void *))v68;
    }
    else
    {
      __atxlog_handle_sleep_schedule();
      v25 = objc_claimAutoreleasedReturnValue();
      v7 = v67;
      v4 = (void (**)(id, _QWORD, void *))v68;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.2();

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CF8B18];
      v28 = *MEMORY[0x1E0CF8B10];
      v76 = *MEMORY[0x1E0CB2938];
      v77 = CFSTR("Couldn't find enough events to predict sleep schedule");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v68)[2](v68, 0, v30);

      v31 = v66->_events;
      v66->_events = 0;
    }
  }
  else
  {
    __atxlog_handle_modes();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.1();

    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CF8B18];
    v35 = *MEMORY[0x1E0CF8B20];
    v81 = *MEMORY[0x1E0CB2938];
    v82[0] = CFSTR("ATXSleepSuggestionServer: Failed to retrieve userIsFirstBacklightOnAfterWakeup");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, v35, v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v36);

  }
}

- (id)queryEvents
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[4];

  v48[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "userIsFirstBacklightOnAfterWakeup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D15A08];
  v33 = (void *)v3;
  v48[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v2;
  v47 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v5, 0, 100000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "eventStreams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v12;
    v43 = 2080;
    v44 = "-[ATXSleepSuggestionServer queryEvents]";
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  v39 = 0;
  v32 = v8;
  objc_msgSend(v8, "executeQuery:error:", v7, &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;
  v15 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v21, "endDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", v23);
        v25 = v24;

        objc_msgSend(v21, "startDate");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v21, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            if (v25 >= 14400.0 && v25 < 72000.0)
              objc_msgSend(v15, "addObject:", v21);
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  if (v14)
  {
    __atxlog_handle_modes();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ATXSleepSuggestionServer queryEvents].cold.1(v14, v29);

    v30 = 0;
  }
  else
  {
    v30 = v15;
  }

  return v30;
}

- (BOOL)isSleepScheduleBetweenTheBoundariesWithBedtime:(id)a3 wakeupTime:(id)a4
{
  id v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v5 = a4;
  v6 = a3;
  v7 = (double)objc_msgSend(v6, "hour");
  v8 = objc_msgSend(v6, "minute");

  v9 = (double)v8 / 60.0 + v7;
  v10 = objc_msgSend(v5, "hour");
  v11 = objc_msgSend(v5, "minute");

  v12 = objc_msgSend(MEMORY[0x1E0D80E38], "isTime:betweenStartTime:endTime:", v9, 19.9833333, 11.0166667);
  if (v12)
    LOBYTE(v12) = objc_msgSend(MEMORY[0x1E0D80E38], "isTime:betweenStartTime:endTime:", (double)v11 / 60.0 + (double)v10, 19.9833333, 11.0166667);
  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = a4;
  __atxlog_handle_sleep_schedule();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXSleepSuggestionServer: connection attempted", v12, 2u);
  }

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.proactive.sleepSchedule"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    ATXSleepSuggestionInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_43_2);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_45);
    objc_msgSend(v5, "resume");
    v9 = 1;
  }
  else
  {
    __atxlog_handle_sleep_schedule();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXSleepSuggestionServer listener:shouldAcceptNewConnection:].cold.1();

    v9 = 0;
  }

  return v9;
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  __atxlog_handle_sleep_schedule();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44()
{
  NSObject *v0;

  __atxlog_handle_sleep_schedule();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44_cold_1();

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXSleepSuggestionServer: Failed to retrieve userIsFirstBacklightOnAfterWakeup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Couldn't find enough events to predict sleep schedule", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Predicted schedule isn't between the boundaries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictedSleepSuggestionWithCompletionHandler:(NSObject *)a3 .cold.4(void *a1, void *a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 134218752;
  v7 = objc_msgSend(a1, "hour");
  v8 = 2048;
  v9 = objc_msgSend(a1, "minute");
  v10 = 2048;
  v11 = objc_msgSend(a2, "hour");
  v12 = 2048;
  v13 = objc_msgSend(a2, "minute");
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "Predicted Bedtime: %ld:%ld, Wakeup: %ld:%ld", (uint8_t *)&v6, 0x2Au);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Sorted wakeup time array:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Sorted bedtime array:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)predictedSleepSuggestionWithCompletionHandler:(uint64_t)a1 .cold.7(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_2_6(&dword_1C9A3B000, v5, v6, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Wakeup time counted in the prediction:%@");

  OUTLINED_FUNCTION_3_2();
}

- (void)predictedSleepSuggestionWithCompletionHandler:(uint64_t)a1 .cold.8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_2_6(&dword_1C9A3B000, v5, v6, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Bedtime counted in the prediction:%@");

  OUTLINED_FUNCTION_3_2();
}

- (void)queryEvents
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Error querying Core Duet: %@", v4, 0xCu);

}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v2 = 2112;
  v3 = CFSTR("com.apple.proactive.sleepSchedule");
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionServer: rejecting connection %@ without entitlement %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXSleepSuggestionServer: interruption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXSleepSuggestionServer: invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
