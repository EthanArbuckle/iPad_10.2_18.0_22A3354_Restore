@implementation ACCAnalyticsLoggerSQLiteStore

+ (ACCAnalyticsLoggerSQLiteStore)storeWithPath:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  if (storeWithPath_schema__onceToken != -1)
    dispatch_once(&storeWithPath_schema__onceToken, &__block_literal_global_272);
  objc_msgSend(v6, "stringByStandardizingPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)storeWithPath_schema__loggingStores, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:schema:", v9, v7);
    objc_msgSend((id)storeWithPath_schema__loggingStores, "setObject:forKeyedSubscript:", v10, v9);
  }

  objc_sync_exit(v8);
  return (ACCAnalyticsLoggerSQLiteStore *)v10;
}

void __54__ACCAnalyticsLoggerSQLiteStore_storeWithPath_schema___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)storeWithPath_schema__loggingStores;
  storeWithPath_schema__loggingStores = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[ACCSQLite close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)ACCAnalyticsLoggerSQLiteStore;
  -[ACCSQLite dealloc](&v3, sel_dealloc);
}

- (BOOL)tryToOpenDatabase
{
  BOOL v3;
  id v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[ACCSQLite isOpen](self, "isOpen"))
    return 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: db is closed, attempting to open", buf, 2u);
  }
  v6 = 0;
  v3 = -[ACCSQLite openWithError:](self, "openWithError:", &v6);
  v4 = v6;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: failed to open db with error %@", buf, 0xCu);
  }

  return v3;
}

- (int64_t)successCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return 0;
  v11[0] = CFSTR("success_count");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("accessoryDatabaseCounts");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCSQLite select:from:where:bindings:](self, "select:from:where:bindings:", v3, CFSTR("success_count"), CFSTR("event_type = ?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("success_count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (int64_t)wrapFailureCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return 0;
  v11[0] = CFSTR("wrap_failure_count");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("accessoryDatabaseCounts");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCSQLite select:from:where:bindings:](self, "select:from:where:bindings:", v3, CFSTR("success_count"), CFSTR("event_type = ?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("wrap_failure_count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (void)incrementSuccessCount
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v3 = -[ACCAnalyticsLoggerSQLiteStore successCount](self, "successCount");
    v4 = -[ACCAnalyticsLoggerSQLiteStore wrapFailureCount](self, "wrapFailureCount");
    v9[0] = CFSTR("accessoryDatabaseCounts");
    v8[0] = CFSTR("event_type");
    v8[1] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v8[2] = CFSTR("wrap_failure_count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("success_count"), v7);

  }
}

- (void)incrementWrapFailureCount
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v3 = -[ACCAnalyticsLoggerSQLiteStore successCount](self, "successCount");
    v4 = -[ACCAnalyticsLoggerSQLiteStore wrapFailureCount](self, "wrapFailureCount");
    v9[0] = CFSTR("accessoryDatabaseCounts");
    v8[0] = CFSTR("event_type");
    v8[1] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v8[2] = CFSTR("wrap_failure_count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("success_count"), v7);

  }
}

- (id)summaryCounts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[ACCSQLite selectAllFrom:where:bindings:](self, "selectAllFrom:where:bindings:", CFSTR("success_count"), 0, 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("event_type"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v21[0] = CFSTR("success_count");
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("success_count"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v21[1] = CFSTR("wrap_failure_count");
            v22[0] = v9;
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("wrap_failure_count"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v10;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v8);

          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogger: ignoring entry in success counts table without an event name", buf, 2u);
          }

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v4);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] successCountsDict: %@", buf, 0xCu);
    }

  }
  else
  {
    v14 = (id)objc_opt_new();
  }
  return v14;
}

- (NSArray)allEvents
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v20[0] = CFSTR("data");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCSQLite select:from:](self, "select:from:", v3, CFSTR("all_events"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
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
          v11 = (void *)MEMORY[0x24BDD1770];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "objectForKeyedSubscript:", CFSTR("data"), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "propertyListWithData:options:format:error:", v12, 0, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (id)objc_opt_new();
  }
  return (NSArray *)v5;
}

- (void)addEventDict:(id)a3 toTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = v9;
    if (v9 || !v8)
    {
      if (v9 && !v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v16[0] = CFSTR("timestamp");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = CFSTR("data");
      v17[0] = v11;
      v17[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", v7, v12);

    }
  }

}

- (NSDate)uploadDate
{
  void *v3;

  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[ACCSQLite datePropertyForKey:](self, "datePropertyForKey:", CFSTR("upload_date"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)setUploadDate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    -[ACCSQLite setDateProperty:forKey:](self, "setDateProperty:forKey:", v4, CFSTR("upload_date"));

}

- (void)clearAllData
{
  if (-[ACCAnalyticsLoggerSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[ACCSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("success_count"), CFSTR("event_type like ?"), &unk_24D726438);
    -[ACCSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("all_events"), CFSTR("id >= 0"), 0);
  }
}

@end
