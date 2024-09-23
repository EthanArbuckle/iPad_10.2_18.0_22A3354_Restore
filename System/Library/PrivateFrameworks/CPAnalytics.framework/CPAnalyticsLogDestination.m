@implementation CPAnalyticsLogDestination

- (CPAnalyticsLogDestination)init
{
  abort();
}

- (CPAnalyticsLogDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsLogDestination *v6;
  CPAnalyticsLogDestination *v7;
  uint64_t v8;
  NSArray *logEventMatchers;
  os_log_t v10;
  OS_os_log *log;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAnalyticsLogDestination;
  v6 = -[CPAnalyticsLogDestination init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CPAnalyticsLogDestination _logEventMatchersInConfiguration:](v6, "_logEventMatchersInConfiguration:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    logEventMatchers = v7->_logEventMatchers;
    v7->_logEventMatchers = (NSArray *)v8;

    v10 = os_log_create("com.apple.photos.CPAnalytics", "CPAnalyticsLogs");
    log = v7->_log;
    v7->_log = (OS_os_log *)v10;

  }
  return v7;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CPAnalyticsLogDestination logEventMatchers](self, "logEventMatchers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "doesMatch:", v4))
        {
          objc_msgSend(v10, "eventTypeLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "shouldLogEventName");
          objc_msgSend(v10, "eventPropertiesToLog");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "eventPublicPropertiesToLog");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPAnalyticsLogDestination logEvent:withLabel:shouldLogEventName:propertiesToLog:publicPropertiesToLog:](self, "logEvent:withLabel:shouldLogEventName:propertiesToLog:publicPropertiesToLog:", v4, v11, v12, v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)_logEventMatchersInConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  CPAnalyticsLogEventMatcher *v12;
  CPAnalyticsLogEventMatcher *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CPAnalyticsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_error_impl(&dword_20AB22000, v6, OS_LOG_TYPE_ERROR, "Malformed logEvents in configuration %@", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = [CPAnalyticsLogEventMatcher alloc];
          v13 = -[CPAnalyticsLogEventMatcher initWithConfig:](v12, "initWithConfig:", v11, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }

  return v5;
}

- (void)logEvent:(id)a3 withLabel:(id)a4 shouldLogEventName:(BOOL)a5 propertiesToLog:(id)a6 publicPropertiesToLog:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v9 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v31 = a4;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v9)
  {
    v16 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v12, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("eventName: %@"), v17);
    objc_msgSend(v15, "addObject:", v18);

  }
  -[CPAnalyticsLogDestination _descriptionComponentsForEvent:forProperties:](self, "_descriptionComponentsForEvent:forProperties:", v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v19);

  if (objc_msgSend(v15, "count"))
  {
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)objc_msgSend(v20, "initWithFormat:", CFSTR(" { %@ }"), v21);

  }
  else
  {
    v22 = &stru_24C36F380;
  }
  -[CPAnalyticsLogDestination _descriptionComponentsForEvent:forProperties:](self, "_descriptionComponentsForEvent:forProperties:", v12, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v24 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (__CFString *)objc_msgSend(v24, "initWithFormat:", CFSTR(" { %@ }"), v25);

  }
  else
  {
    v26 = &stru_24C36F380;
  }
  if (logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__onceToken != -1)
    dispatch_once(&logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__onceToken, &__block_literal_global_493);
  -[CPAnalyticsLogDestination log](self, "log");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = (void *)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter;
    objc_msgSend(v12, "timestamp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringFromDate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v33 = v31;
    v34 = 2112;
    v35 = v22;
    v36 = 2114;
    v37 = v26;
    v38 = 2114;
    v39 = v30;
    _os_log_impl(&dword_20AB22000, v27, OS_LOG_TYPE_INFO, "%{public}@:%@%{public}@, (@ %{public}@)", buf, 0x2Au);

  }
}

- (id)_descriptionComponentsForEvent:(id)a3 forProperties:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "propertyForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v14, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@: %@"), v13, v16, (_QWORD)v19);
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSArray)logEventMatchers
{
  return self->_logEventMatchers;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logEventMatchers, 0);
}

uint64_t __105__CPAnalyticsLogDestination_logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter;
  logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)logEvent_withLabel_shouldLogEventName_propertiesToLog_publicPropertiesToLog__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSZ"));
}

@end
