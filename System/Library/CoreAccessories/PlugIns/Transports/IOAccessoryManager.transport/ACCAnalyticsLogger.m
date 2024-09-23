@implementation ACCAnalyticsLogger

+ (id)loggerForUser:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint8_t v8[16];

  v3 = *(_QWORD *)&a3;
  if ((id)objc_opt_class() == a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] attempt to instatiate abstract class ACCEventLogger", v8, 2u);
    }
    v6 = 0;
  }
  else
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_getAssociatedObject(v5, "ACCAnalyticsLoggerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)v5), "initForUser:", v3);
      objc_setAssociatedObject(v5, "ACCAnalyticsLoggerInstance", v6, (void *)0x301);
    }
    objc_sync_exit(v5);

  }
  return v6;
}

+ (id)databasePathForUser:(int)a3
{
  if (a3)
    return CFSTR("/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_accessoryd_v3.db");
  else
    return CFSTR("/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_UserEventAgent_v3.db");
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  if (v7 < 86400.0)
    return 0;
  if (v7 < 604800.0)
    return 1;
  if (v7 < 2592000.0)
    return 7;
  if (v7 >= 31536000.0)
    return 365;
  return 30;
}

- (id)initForUser:(int)a3
{
  uint64_t v3;
  ACCAnalyticsLogger *v4;
  ACCAnalyticsLogger *v5;
  uint64_t v6;
  NSMutableArray *pluginEventsBeforeFirstUnlock;
  uint64_t v8;
  NSMutableArray *accessorydEventsBeforeFirstUnlock;
  NSLock *v10;
  NSLock *eventCacheLock;
  void *v12;
  uint64_t v13;
  ACCAnalyticsLoggerSQLiteStore *database;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  dispatch_queue_t v18;
  OS_dispatch_queue *loggingQueue;
  int isInternalBuild;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *figaroTopicName;
  void *v28;
  void *v29;
  uint64_t v30;
  NSURL *figaroUploadURL;
  void **p_figaroUploadURL;
  void *v33;
  void *v34;
  uint64_t v35;
  NSURL *figaroBagURL;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v54;
  objc_super v55;

  v3 = *(_QWORD *)&a3;
  v55.receiver = self;
  v55.super_class = (Class)ACCAnalyticsLogger;
  v4 = -[ACCAnalyticsLogger init](&v55, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_user = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    pluginEventsBeforeFirstUnlock = v5->_pluginEventsBeforeFirstUnlock;
    v5->_pluginEventsBeforeFirstUnlock = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    accessorydEventsBeforeFirstUnlock = v5->_accessorydEventsBeforeFirstUnlock;
    v5->_accessorydEventsBeforeFirstUnlock = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    eventCacheLock = v5->_eventCacheLock;
    v5->_eventCacheLock = v10;

    +[ACCAnalyticsLogger databasePathForUser:](ACCAnalyticsLogger, "databasePathForUser:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACCAnalyticsLoggerSQLiteStore storeWithPath:schema:](ACCAnalyticsLoggerSQLiteStore, "storeWithPath:schema:", v12, CFSTR("CREATE TABLE IF NOT EXISTS all_events (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_all_events AFTER INSERT ON all_events\nBEGIN\nDELETE FROM all_events WHERE id != NEW.id AND id % 999 = NEW.id % 999;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nwrap_failure_count INTEGER\n);\n"));
    v13 = objc_claimAutoreleasedReturnValue();
    database = v5->_database;
    v5->_database = (ACCAnalyticsLoggerSQLiteStore *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.accessoryd.eventLogging", v15);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_create("com.apple.accessoryd.eventLoggingQueue", 0);
    loggingQueue = v5->_loggingQueue;
    v5->_loggingQueue = (OS_dispatch_queue *)v18;

    isInternalBuild = systemInfo_isInternalBuild();
    v21 = 259200;
    if (isInternalBuild)
      v21 = 86400;
    v5->_secondsBetweenUploads = v21;
    v5->_secondsBetweenUploadError = 3600;
    v22 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/CoreAccessories.framework"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pathForResource:ofType:", CFSTR("ACCAnalyticsLogging"), CFSTR("plist"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithContentsOfFile:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("figaro_topic"));
    v26 = objc_claimAutoreleasedReturnValue();
    figaroTopicName = v5->_figaroTopicName;
    v5->_figaroTopicName = (NSString *)v26;

    v28 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("figaro_uploadURL"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    p_figaroUploadURL = (void **)&v5->_figaroUploadURL;
    figaroUploadURL = v5->_figaroUploadURL;
    v5->_figaroUploadURL = (NSURL *)v30;

    v33 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("figaro_bagURL"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URLWithString:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    figaroBagURL = v5->_figaroBagURL;
    v5->_figaroBagURL = (NSURL *)v35;

    objc_msgSend(v25, "valueForKey:", CFSTR("figaro_allowInsecureCertificate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v5 + 88) = *((_BYTE *)v5 + 88) & 0xFE | objc_msgSend(v37, "BOOLValue");

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("figaro_endpointDomain"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.accessory.eventLogging"));
    objc_msgSend(v39, "stringForKey:", CFSTR("figaro_topic"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_storeStrong((id *)&v5->_figaroTopicName, v40);
    v54 = v40;
    v41 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v39, "stringForKey:", CFSTR("figaro_uploadURL"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URLWithString:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      objc_storeStrong((id *)&v5->_figaroUploadURL, v43);
    v44 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v39, "stringForKey:", CFSTR("figaro_bagURL"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "URLWithString:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      objc_storeStrong((id *)&v5->_figaroBagURL, v46);
    *((_BYTE *)v5 + 88) |= objc_msgSend(v39, "BOOLForKey:", CFSTR("figaro_allowInsecureCertificate"));
    objc_msgSend(v39, "stringForKey:", CFSTR("figaro_endpointDomain"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = v47;

      v38 = v49;
    }
    if (systemInfo_isInternalBuild())
    {

      *((_BYTE *)v5 + 88) |= 8u;
      v38 = CFSTR("xp-qa.apple.com");
      if (!v5->_figaroUploadURL)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/report/2/%@"), CFSTR("xp-qa.apple.com"), v5->_figaroTopicName);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = *p_figaroUploadURL;
        *p_figaroUploadURL = (void *)v51;

      }
    }

  }
  return v5;
}

- (void)logEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  id obja;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v26 = MEMORY[0x24BDACB70];
    v27 = "[#ACCEventLogger] attempt to log an event with no name";
LABEL_33:
    _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_67;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v26 = MEMORY[0x24BDACB70];
    v27 = "[#ACCEventLogger] attempt to log an event with no attributes";
    goto LABEL_33;
  }
  if (_isDeviceAnalyticsEnabled_onceToken != -1)
    dispatch_once(&_isDeviceAnalyticsEnabled_onceToken, &__block_literal_global_304);
  if (_isDeviceAnalyticsEnabled_dataCollectionEnabled)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:](ACCAnalyticsLogger, "addBuiltInFieldsToEvent:", v9);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v84 = (uint64_t)v6;
      v85 = 2112;
      v86 = v9;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro event: %@\neventDict: %@", buf, 0x16u);
    }
    v10 = MKBDeviceUnlockedSinceBoot();
    -[ACCAnalyticsLogger eventCacheLock](self, "eventCacheLock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    v12 = -[ACCAnalyticsLogger user](self, "user");
    if (v10)
    {
      if (v12)
      {
        if (-[ACCAnalyticsLogger user](self, "user") != 1)
          goto LABEL_59;
        -[ACCAnalyticsLogger accessorydEventsBeforeFirstUnlock](self, "accessorydEventsBeforeFirstUnlock");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          goto LABEL_59;
        v52 = v9;
        v53 = v8;
        v54 = v6;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        -[ACCAnalyticsLogger accessorydEventsBeforeFirstUnlock](self, "accessorydEventsBeforeFirstUnlock");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        if (v59)
        {
          v57 = *(_QWORD *)v68;
          v15 = MEMORY[0x24BDACB70];
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v68 != v57)
                objc_enumerationMutation(obj);
              v61 = v16;
              v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v16);
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v18 = v17;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v64;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v64 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v84 = (uint64_t)v23;
                      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    objc_msgSend(v18, "objectForKey:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ACCAnalyticsLogger _logEventNamed:withAttributes:](self, "_logEventNamed:withAttributes:", v23, v24);

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
                }
                while (v20);
              }

              v16 = v61 + 1;
            }
            while (v61 + 1 != v59);
            v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
          }
          while (v59);
        }

        -[ACCAnalyticsLogger accessorydEventsBeforeFirstUnlock](self, "accessorydEventsBeforeFirstUnlock");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ACCAnalyticsLogger pluginEventsBeforeFirstUnlock](self, "pluginEventsBeforeFirstUnlock");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (!v35)
        {
LABEL_59:
          -[ACCAnalyticsLogger eventCacheLock](self, "eventCacheLock");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "unlock");

          -[ACCAnalyticsLogger _logEventNamed:withAttributes:](self, "_logEventNamed:withAttributes:", v6, v9);
LABEL_66:

          goto LABEL_67;
        }
        v52 = v9;
        v53 = v8;
        v54 = v6;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        -[ACCAnalyticsLogger pluginEventsBeforeFirstUnlock](self, "pluginEventsBeforeFirstUnlock");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
        if (v60)
        {
          v58 = *(_QWORD *)v76;
          v36 = MEMORY[0x24BDACB70];
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v76 != v58)
                objc_enumerationMutation(obja);
              v62 = v37;
              v38 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v37);
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v74 = 0u;
              v39 = v38;
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v72;
                do
                {
                  for (j = 0; j != v41; ++j)
                  {
                    if (*(_QWORD *)v72 != v42)
                      objc_enumerationMutation(v39);
                    v44 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v84 = (uint64_t)v44;
                      _os_log_impl(&dword_21722C000, v36, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    objc_msgSend(v39, "objectForKey:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ACCAnalyticsLogger _logEventNamed:withAttributes:](self, "_logEventNamed:withAttributes:", v44, v45);

                  }
                  v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
                }
                while (v41);
              }

              v37 = v62 + 1;
            }
            while (v62 + 1 != v60);
            v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
          }
          while (v60);
        }

        -[ACCAnalyticsLogger pluginEventsBeforeFirstUnlock](self, "pluginEventsBeforeFirstUnlock");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v46 = v25;
      objc_msgSend(v25, "removeAllObjects");

      v8 = v53;
      v6 = v54;
      v9 = v52;
      goto LABEL_59;
    }
    if (v12)
    {
      if (-[ACCAnalyticsLogger user](self, "user") != 1)
        goto LABEL_65;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v6;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to accessoryd array", buf, 0xCu);
      }
      -[ACCAnalyticsLogger accessorydEventsBeforeFirstUnlock](self, "accessorydEventsBeforeFirstUnlock");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v9, v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);

      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      -[ACCAnalyticsLogger accessorydEventsBeforeFirstUnlock](self, "accessorydEventsBeforeFirstUnlock");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 134217984;
      v84 = v31;
      v32 = MEMORY[0x24BDACB70];
      v33 = "[#ACCEventLogger] accessorydEventsBeforeFirstUnlock count: %lu";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v6;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to plugin array", buf, 0xCu);
      }
      -[ACCAnalyticsLogger pluginEventsBeforeFirstUnlock](self, "pluginEventsBeforeFirstUnlock");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v9, v6);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v49);

      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      -[ACCAnalyticsLogger pluginEventsBeforeFirstUnlock](self, "pluginEventsBeforeFirstUnlock");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 134217984;
      v84 = v50;
      v32 = MEMORY[0x24BDACB70];
      v33 = "[#ACCEventLogger] pluginEventsBeforeFirstUnlock count: %lu";
    }
    _os_log_impl(&dword_21722C000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);

LABEL_65:
    -[ACCAnalyticsLogger eventCacheLock](self, "eventCacheLock");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "unlock");

    goto LABEL_66;
  }
LABEL_67:

}

- (void)_logEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ACCAnalyticsLogger *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[ACCAnalyticsLogger loggingQueue](self, "loggingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke;
  block[3] = &unk_24D719F58;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_76;
  block[3] = &unk_24D719F30;
  block[4] = WeakRetained;
  v15 = v4;
  v6 = v3;
  v16 = v6;
  v17 = &v18;
  dispatch_sync(v5, block);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = (void *)v19[5];
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[#ACCEventLogger] ACCEventLogging: figaroDate %@", buf, 0xCu);
  }
  if (!v19[5])
  {
    objc_msgSend(WeakRetained, "resetUploadDateAndClearDBEntries:dueToError:", 0, 1);
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "compare:") == 1)
  {
    v12 = 0;
    v13 = 0;
    v9 = objc_msgSend(WeakRetained, "forceUploadWithError:httpStatusCode:", &v12, &v13);
    v10 = v12;
    if ((v9 & 1) == 0)
    {
      if ((unint64_t)(v13 - 400) > 0x63)
      {
        v11 = 0;
LABEL_12:
        objc_msgSend(WeakRetained, "resetUploadDateAndClearDBEntries:dueToError:", v11, v9 ^ 1u);
        if (v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: failed with error: %@", buf, 0xCu);
        }

        goto LABEL_16;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(&v13);
    }
    v11 = 1;
    goto LABEL_12;
  }
LABEL_16:

  _Block_object_dispose(&v18, 8);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_76(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1
    && (*(_BYTE *)(v1 + 88) & 2) == 0
    && (objc_msgSend(*(id *)(v1 + 80), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventDictForEventName:withAttributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventDictWithBlacklistedFieldsStrippedFrom:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addEventDict:toTable:", v4, CFSTR("all_events"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] database entry count: %lu", (uint8_t *)&v12, 0xCu);
    }
    if (v8 > 0x3E7 || v6 == 999)
    {
      if ((v6 != 999 || v8 != 999) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_76_cold_1(v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "incrementWrapFailureCount");
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "incrementSuccessCount");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "uploadDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (void)resetUploadDateAndClearDBEntries:(BOOL)a3 dueToError:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[4];
  id v9;
  BOOL v10;
  BOOL v11;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke;
  block[3] = &unk_24D719F80;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  v11 = a4;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(WeakRetained[1], "clearAllData");
    if (!*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(uint64_t)v3[6]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3[1], "setUploadDate:", v5);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(uint64_t)v3[7]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[1], "setUploadDate:", v4);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3[1], "uploadDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: next analytic sync event: %@", (uint8_t *)&v6, 0xCu);
LABEL_8:

    }
  }

}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSDictionary *metricsBase;
  id v17;
  _QWORD v19[4];
  id v20;

  if (a4)
  {
    v7 = a3;
    v8 = (void *)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCED8];
    v10 = a3;
    objc_msgSend(v9, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_figaroTopicName, CFSTR("topic"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a3, CFSTR("eventType"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "numberWithDouble:", v14 * 1000.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("eventTime"));

  metricsBase = self->_metricsBase;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke;
  v19[3] = &unk_24D719FA8;
  v17 = v11;
  v20 = v17;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](metricsBase, "enumerateKeysAndObjectsUsingBlock:", v19);

  return v17;
}

void __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_blacklistedFields;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke;
  block[3] = &unk_24D719FD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setDateProperty:forKey:", a1[5], a1[6]);
}

- (id)datePropertyForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke;
  block[3] = &unk_24D719FF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "datePropertyForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSURL)figaroUploadURL
{
  NSURL *figaroUploadURL;
  NSURL *v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  id v28;
  id location;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  figaroUploadURL = self->_figaroUploadURL;
  if (figaroUploadURL)
  {
    v4 = figaroUploadURL;
  }
  else
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v5 = dispatch_semaphore_create(0);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy_;
    v27[4] = __Block_byref_object_dispose_;
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("User-Agent");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("accessoryd/%s"), "1.1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHTTPAdditionalHeaders:", v8);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v6, self, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_figaroBagURL;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke;
    v15[3] = &unk_24D71A020;
    objc_copyWeak(&v20, &location);
    v18 = v27;
    v11 = v5;
    v16 = v11;
    v19 = &v21;
    v12 = v9;
    v17 = v12;
    objc_msgSend(v12, "dataTaskWithURL:completionHandler:", v10, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v4 = (NSURL *)(id)v22[5];

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v27, 8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  id obj;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_35;
  if (!v6 || v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
LABEL_26:

LABEL_27:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "invalidateAndCancel");
        goto LABEL_35;
      }
      *(_WORD *)buf = 0;
      v28 = MEMORY[0x24BDACB70];
      v29 = "[#ACCEventLogger] Unable to fetch figaro endpoint";
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
        || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      v28 = MEMORY[0x24BDACB70];
      v29 = "[#ACCEventLogger] Malformed config payload!";
    }
    _os_log_impl(&dword_21722C000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    goto LABEL_34;
  }
  if ((WeakRetained[11] & 8) != 0)
  {
LABEL_19:
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metricsBase"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)WeakRetained[8];
    WeakRetained[8] = v21;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metricsUrl"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("/2/%@"), WeakRetained[3]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] got metrics endpoint: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scheme");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("https"));

      if (v27)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v25);

    }
    goto LABEL_26;
  }
  objc_msgSend(v10, "valueForKey:", CFSTR("disabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLValue"))
    v12 = 2;
  else
    v12 = 0;
  *((_BYTE *)WeakRetained + 88) = WeakRetained[11] & 0xFD | v12;

  if ((WeakRetained[11] & 2) == 0)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("sendDisabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (!v14)
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("postFrequency"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      if (v16 >= 0x3E8)
        WeakRetained[6] = v16 / 0x3E8;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("blacklistedEvents"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)WeakRetained[10];
      WeakRetained[10] = v17;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("blacklistedFields"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)WeakRetained[9];
      WeakRetained[9] = v19;

      goto LABEL_19;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] figaro is disabled", buf, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

LABEL_35:
}

- (BOOL)forceUploadWithError:(id *)a3 httpStatusCode:(int64_t *)a4
{
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v12;
  ACCAnalyticsLogger *v13;
  uint64_t *v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[ACCAnalyticsLogger getLoggingJSON:error:](self, "getLoggingJSON:error:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke;
  block[3] = &unk_24D71A048;
  v12 = v7;
  v13 = self;
  v15 = &v21;
  v16 = a3;
  v14 = &v17;
  v9 = v7;
  dispatch_sync(queue, block);
  *a4 = v18[3];
  LOBYTE(a4) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a4;
}

uint64_t __58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = 0;
  if (v2)
  {
    result = objc_msgSend(*(id *)(result + 40), "_onQueuePostJSON:error:httpStatusCode:", v2, *(_QWORD *)(result + 64), *(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
    if ((result & 1) != 0)
      v3 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = v3;
  return result;
}

- (BOOL)_onQueuePostJSON:(id)a3 error:(id *)a4 httpStatusCode:(int64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  uint8_t v19[16];
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint64_t *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("User-Agent");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("accessoryd/%s"), "1.1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPAdditionalHeaders:", v10);

  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v8, self, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCAnalyticsLogger figaroUploadURL](self, "figaroUploadURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint - using bag instead", buf, 2u);
  }
  -[ACCAnalyticsLogger figaroBagURL](self, "figaroBagURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
LABEL_5:
    v13 = objc_alloc_init(MEMORY[0x24BDD16B0]);
    objc_msgSend(v13, "setURL:", v12);
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v13, "setHTTPBody:", v7);
    v14 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke;
    v20[3] = &unk_24D71A070;
    v23 = &v25;
    v24 = buf;
    v15 = v14;
    v21 = v15;
    v22 = v11;
    objc_msgSend(v22, "dataTaskWithRequest:completionHandler:", v13, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro start", v19, 2u);
    }
    objc_msgSend(v16, "resume");
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    *a5 = v26[3];
    v17 = v30[24] != 0;

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v17 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint", buf, 2u);
      v17 = 0;
    }
  }

  return v17;
}

void __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v9;
      v10 = MEMORY[0x24BDACB70];
      v11 = "[#ACCEventLogger] Figaro event error: %@";
      v12 = 12;
LABEL_11:
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v12);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v13, "statusCode");
    if (objc_msgSend(v13, "statusCode") < 200 || objc_msgSend(v13, "statusCode") > 299)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 67109120;
        LODWORD(v18) = objc_msgSend(v13, "statusCode");
        v14 = MEMORY[0x24BDACB70];
        v15 = "[#ACCEventLogger] Figaro error: %d";
        v16 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        v14 = MEMORY[0x24BDACB70];
        v15 = "[#ACCEventLogger] Figaro success";
        v16 = 2;
LABEL_14:
        _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    v10 = MEMORY[0x24BDACB70];
    v11 = "[#ACCEventLogger] Received the wrong kind of class";
    v12 = 2;
    goto LABEL_11;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "invalidateAndCancel");

}

+ (void)addBuiltInFieldsToEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = v3;
  if (addBuiltInFieldsToEvent__onceToken != -1)
  {
    dispatch_once(&addBuiltInFieldsToEvent__onceToken, &__block_literal_global_0);
    v3 = v4;
  }
  if (addBuiltInFieldsToEvent__build)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", addBuiltInFieldsToEvent__build, CFSTR("build"));
    v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productVersion)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", addBuiltInFieldsToEvent__productVersion, CFSTR("productVersion"));
    v3 = v4;
  }
  if (addBuiltInFieldsToEvent__modelNumberStr)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", addBuiltInFieldsToEvent__modelNumberStr, CFSTR("modelString"));
    v3 = v4;
  }
  if (addBuiltInFieldsToEvent__platform)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", addBuiltInFieldsToEvent__platform, CFSTR("platform"));
    v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productType)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", addBuiltInFieldsToEvent__productType, CFSTR("productType"));
    v3 = v4;
  }

}

void __46__ACCAnalyticsLogger_addBuiltInFieldsToEvent___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v13 = v0;
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)addBuiltInFieldsToEvent__build;
    addBuiltInFieldsToEvent__build = v1;

    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDBD200]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v3;

    v5 = MGCopyAnswer();
    v6 = (void *)addBuiltInFieldsToEvent__modelNumberStr;
    addBuiltInFieldsToEvent__modelNumberStr = v5;

    v7 = MGCopyAnswer();
    v8 = (void *)addBuiltInFieldsToEvent__platform;
    addBuiltInFieldsToEvent__platform = v7;

    v9 = MGCopyAnswer();
    v10 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v9;

    v11 = MGCopyAnswer();
    v12 = (void *)addBuiltInFieldsToEvent__productType;
    addBuiltInFieldsToEvent__productType = v11;

    v0 = v13;
  }

}

- (id)getLoggingJSON:(BOOL)a3 error:(id *)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[7];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke;
  v7[3] = &unk_24D71A0B8;
  v7[5] = &v9;
  v7[6] = a4;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tryToOpenDatabase") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allEvents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "summaryCounts");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectEnumerator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("success_count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v5 += objc_msgSend(v10, "integerValue");

          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("wrap_failure_count"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v11, "integerValue");

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = v12;
    v14 = *(_QWORD *)(*(_QWORD *)(v31 + 32) + 24);
    if (v14)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("topic"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("topic"));

    }
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v16, "numberWithDouble:", v17 * 1000.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("eventTime"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("accessoryHealthSummary"), CFSTR("eventType"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("success_count"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("wrap_failure_count"));

    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:](ACCAnalyticsLogger, "addBuiltInFieldsToEvent:", v13);
    v21 = (void *)objc_msgSend(v32, "mutableCopy");
    objc_msgSend(v21, "addObject:", v13);
    v38[0] = CFSTR("postTime");
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v22, "numberWithDouble:", v23 * 1000.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = CFSTR("events");
    v39[0] = v24;
    v39[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v25, *(unsigned __int8 *)(v31 + 56), *(_QWORD *)(v31 + 48));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(v31 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] can't get logging JSON because database is not openable", buf, 2u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[12];
  int v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    -[ACCAnalyticsLogger URLSession:didReceiveChallenge:completionHandler:].cold.1();
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro challenge", buf, 2u);
  }
  v19 = 0;
  if (objc_msgSend(v9, "previousFailureCount") >= 1)
    goto LABEL_5;
  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (!v14)
  {
    v11[2](v11, 1, 0);
    goto LABEL_12;
  }
  objc_msgSend(v9, "protectionSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "serverTrust");

  MEMORY[0x219A08CB0](v16, &v19);
  if ((*((_BYTE *)self + 88) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Force Accepting Figaro Credential", v18, 2u);
    }
    goto LABEL_15;
  }
  if (v19 == 1 || v19 == 4)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v17);

    goto LABEL_12;
  }
LABEL_5:
  v11[2](v11, 2, 0);
LABEL_12:

}

- (BOOL)ignoreServerDisablingMessages
{
  return (*((unsigned __int8 *)self + 88) >> 3) & 1;
}

- (void)setIgnoreServerDisablingMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 88) = *((_BYTE *)self + 88) & 0xF7 | v3;
}

- (BOOL)allowsInsecureFigaroCert
{
  return *((_BYTE *)self + 88) & 1;
}

- (void)setAllowsInsecureFigaroCert:(BOOL)a3
{
  *((_BYTE *)self + 88) = *((_BYTE *)self + 88) & 0xFE | a3;
}

- (NSURL)figaroBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)figaroTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)user
{
  return self->_user;
}

- (void)setUser:(int)a3
{
  self->_user = a3;
}

- (NSMutableArray)pluginEventsBeforeFirstUnlock
{
  return self->_pluginEventsBeforeFirstUnlock;
}

- (void)setPluginEventsBeforeFirstUnlock:(id)a3
{
  objc_storeStrong((id *)&self->_pluginEventsBeforeFirstUnlock, a3);
}

- (NSMutableArray)accessorydEventsBeforeFirstUnlock
{
  return self->_accessorydEventsBeforeFirstUnlock;
}

- (void)setAccessorydEventsBeforeFirstUnlock:(id)a3
{
  objc_storeStrong((id *)&self->_accessorydEventsBeforeFirstUnlock, a3);
}

- (NSLock)eventCacheLock
{
  return self->_eventCacheLock;
}

- (void)setEventCacheLock:(id)a3
{
  objc_storeStrong((id *)&self->_eventCacheLock, a3);
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_eventCacheLock, 0);
  objc_storeStrong((id *)&self->_accessorydEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_pluginEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_figaroBagURL, 0);
  objc_storeStrong((id *)&self->_figaroTopicName, 0);
  objc_storeStrong((id *)&self->_figaroUploadURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 134217984;
  v3 = v1;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[#ACCEventLogger] ACCEventLogging: error %lu forced events to be dropped", (uint8_t *)&v2, 0xCu);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_76_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 134218240;
  v2 = a1;
  v3 = 1024;
  v4 = 999;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[#ACCEventLogger] database count: %lu greater than max count allowed (%d)", (uint8_t *)&v1, 0x12u);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  __assert_rtn("-[ACCAnalyticsLogger URLSession:didReceiveChallenge:completionHandler:]", "ACCAnalyticsLogger.m", 818, "completionHandler");
}

@end
