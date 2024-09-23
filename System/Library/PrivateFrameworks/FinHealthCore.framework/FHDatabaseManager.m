@implementation FHDatabaseManager

- (void)_createDataDirectory
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _getDataDirectory](self, "_getDataDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v5);

}

- (id)getDateFormatter
{
  return self->_dateFormatter;
}

- (id)getDatabaseFileName
{
  return CFSTR("finhealth.db");
}

- (BOOL)_isEligibleForSchemaMigration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  const __CFString *v17;
  int v18;
  BOOL v19;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select sch_version_id, sch_upgrade_status from fh_schema order by sch_id desc limit %d;"),
    1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("10.71"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "next"))
  {
    v6 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(v3, "stringAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decimalNumberWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v3, "unsignedIntegerAtIndex:", 1);
    v5 = (void *)v8;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isEqual:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = (int)v13;

    v15 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert into fh_schema (sch_version_id, sch_upgrade_status, sch_date, sch_getall_status) values (%@, %d, %d, %d)"), CFSTR("10.71"), 2, v14, 0);
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = CFSTR("Fail");
      if (v15)
        v17 = CFSTR("Success");
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_DEBUG, "createSchemaVersionRecord: %@", buf, 0xCu);
    }

  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v3);
  v18 = objc_msgSend(v5, "isEqual:", v4) ^ 1;
  if (v9 == 2)
    v19 = v18;
  else
    v19 = 1;

  return v19;
}

- (void)_logSchema:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select sql from sqlite_master where type='table' and name=%@;"),
    a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "next"))
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "stringAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

}

- (void)_updateAggregateTablesSchema
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  __CFString *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select count(*) from PRAGMA_TABLE_INFO('features_datetime');"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "next"))
  {
    v4 = objc_msgSend(v3, "intAtIndex:", 0);
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v3);
    if (v4 <= 4)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("features_datetime"), CFSTR("features_amount"), CFSTR("features_detailed_category"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_DEBUG, "Aggreagate tables are out of date. Drop and re-create", buf, 2u);
      }

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B4A2000, v7, OS_LOG_TYPE_DEBUG, "Schema before change:", buf, 2u);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            -[FHDatabaseManager _logSchema:](self, "_logSchema:", v13);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v10);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
        CFSTR("features_merchant"),
        CFSTR("(merchant_aggregate_id integer primary key autoincrement, merchant_aggregate_type text, merchant_aggregate_value text, start_date integer, end_date integer, UNIQUE(merchant_aggregate_type, start_date, end_date))"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v15);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
        CFSTR("features_detailed_category"),
        CFSTR("(category_aggregate_id integer primary key autoincrement, detailed_category text, amount integer, transaction_count integer, country_code text, recurring_transaction_ratio real, time_of_day integer, time_window integer, start_date real, end_date real,  UNIQUE(detailed_category, time_of_day, time_window, country_code))"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v16);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
        CFSTR("features_datetime"),
        CFSTR("(datetime_aggregate_id integer primary key autoincrement, datetime_aggregate_type text, datetime_aggregate_value_start_date integer, datetime_aggregate_value_end_date integer, start_date integer, end_date integer, UNIQUE(datetime_aggregate_type, start_date, end_date))"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v17);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
        CFSTR("features_amount"),
        CFSTR("(amount_aggregate_id integer primary key autoincrement, amount_aggregate_type text, amount_aggregate_value integer, comparison_operator text, start_date integer, end_date integer, UNIQUE(amount_aggregate_type, start_date, end_date))"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v18);

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B4A2000, v19, OS_LOG_TYPE_DEBUG, "Schema after change:", buf, 2u);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = v8;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(v20);
            -[FHDatabaseManager _logSchema:](self, "_logSchema:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v22);
      }

    }
  }
  else
  {
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v3);
  }
  v25 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", CFSTR("select sql from sqlite_master where type='table' and name=%@;"),
                  CFSTR("features_events"));

  if (objc_msgSend(v25, "next"))
  {
    objc_msgSend(v25, "stringAtIndex:", 0);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = &stru_250C67C70;
  }
  v36 = v25;
  objc_msgSend(v25, "close");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_events"),
    CFSTR("(e_id integer primary key autoincrement, e_identifier text, start_date integer, end_date integer, UNIQUE(e_identifier, start_date, end_date))"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v26;
  -[__CFString lowercaseString](v26, "lowercaseString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lowercaseString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "isEqualToString:", v32);

  if ((v33 & 1) == 0)
  {
    -[FHDatabaseManager _logSchema:](self, "_logSchema:", CFSTR("features_events"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("features_events"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v34);

    -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v28);
    -[FHDatabaseManager _logSchema:](self, "_logSchema:", CFSTR("features_events"));
  }

}

- (id)init:(BOOL)a3
{
  return -[FHDatabaseManager init:multiThreadingEnabled:](self, "init:multiThreadingEnabled:", a3, 1);
}

- (id)init:(BOOL)a3 multiThreadingEnabled:(BOOL)a4
{
  FHDatabaseManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *secondsInDay;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDecimalNumber *decimalRmseThreshold;
  uint64_t v13;
  NSMutableDictionary *amountAggregatesCache;
  uint64_t v15;
  NSMutableDictionary *merchantAggregatesCache;
  uint64_t v17;
  NSMutableDictionary *dateTimeAggregatesCache;
  void *v19;
  PQLConnection *v20;
  PQLConnection *db;
  uint64_t v22;
  NSMutableArray *transactionFeaturesCache;
  NSDateFormatter *v24;
  NSDateFormatter *dateFormatter;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  PQLConnection *v31;
  int v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  FHBatchProcessor *batchProcessor;
  FHDatabaseEntity *v42;
  id WeakRetained;
  uint64_t v44;
  FHDatabaseEntity *transactionsEntity;
  _QWORD v48[4];
  id v49;
  _QWORD block[4];
  FHDatabaseManager *v51;
  BOOL v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)FHDatabaseManager;
  v4 = -[FHDatabaseManager init](&v54, sel_init, a3, a4);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 86400);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decimalNumberWithString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    secondsInDay = v4->_secondsInDay;
    v4->_secondsInDay = (NSDecimalNumber *)v7;

    v9 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), 0x4000000000000000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decimalNumberWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    decimalRmseThreshold = v4->_decimalRmseThreshold;
    v4->_decimalRmseThreshold = (NSDecimalNumber *)v11;

    v13 = objc_opt_new();
    amountAggregatesCache = v4->_amountAggregatesCache;
    v4->_amountAggregatesCache = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    merchantAggregatesCache = v4->_merchantAggregatesCache;
    v4->_merchantAggregatesCache = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    dateTimeAggregatesCache = v4->_dateTimeAggregatesCache;
    v4->_dateTimeAggregatesCache = (NSMutableDictionary *)v17;

    -[FHDatabaseManager _getDataDirectory](v4, "_getDataDirectory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (PQLConnection *)objc_alloc_init(MEMORY[0x24BEDD630]);
    db = v4->_db;
    v4->_db = v20;

    v4->_transactionFeaturesOffset = 0;
    *(_QWORD *)&v4->_lockDatabaseBookKeeping._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v4->_lockDatabaseFetch._os_unfair_lock_opaque = 0;
    v4->_lockSQLStreaming._os_unfair_lock_opaque = 0;
    v22 = objc_opt_new();
    transactionFeaturesCache = v4->_transactionFeaturesCache;
    v4->_transactionFeaturesCache = (NSMutableArray *)v22;

    -[PQLConnection setSqliteErrorHandler:](v4->_db, "setSqliteErrorHandler:", &__block_literal_global_74);
    -[PQLConnection setBusyHandler:](v4->_db, "setBusyHandler:", &__block_literal_global_77);
    v24 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v4->_dateFormatter;
    v4->_dateFormatter = v24;

    -[NSDateFormatter setDateFormat:](v4->_dateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss Z"));
    if (v19)
    {
      -[FHDatabaseManager _createDataDirectory](v4, "_createDataDirectory");
      -[FHDatabaseManager getDatabaseFileName](v4, "getDatabaseFileName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v19, "stringByAppendingPathComponent:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLWithString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v29;
        _os_log_impl(&dword_23B4A2000, v30, OS_LOG_TYPE_DEBUG, "dbUrl: %@", buf, 0xCu);
      }

      v31 = v4->_db;
      v53 = 0;
      v32 = -[PQLConnection openAtURL:withFlags:error:](v31, "openAtURL:withFlags:error:", v29, 3211270, &v53);
      v33 = v53;
      v34 = (void *)-[PQLConnection fetch:](v4->_db, "fetch:", CFSTR("PRAGMA journal_mode"));
      if (objc_msgSend(v34, "next"))
      {
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v34, "stringAtIndex:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v36;
          _os_log_impl(&dword_23B4A2000, v35, OS_LOG_TYPE_DEBUG, "Before Journal mode: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v34, "close");
      v37 = (void *)-[PQLConnection fetch:](v4->_db, "fetch:", CFSTR("PRAGMA journal_mode=WAL"));

      if (objc_msgSend(v37, "next"))
      {
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v37, "stringAtIndex:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v39;
          _os_log_impl(&dword_23B4A2000, v38, OS_LOG_TYPE_DEBUG, "After Journal mode: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v37, "close");
      if (v32)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_86;
        block[3] = &unk_250C664A0;
        v51 = v4;
        v52 = a3;
        if (init_multiThreadingEnabled__onceToken != -1)
          dispatch_once(&init_multiThreadingEnabled__onceToken, block);

      }
    }
    objc_initWeak((id *)buf, v4);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_2;
    v48[3] = &unk_250C664C8;
    objc_copyWeak(&v49, (id *)buf);
    +[FHBatchProcessor initWithBuilder:](FHBatchProcessor, "initWithBuilder:", v48);
    v40 = objc_claimAutoreleasedReturnValue();
    batchProcessor = v4->_batchProcessor;
    v4->_batchProcessor = (FHBatchProcessor *)v40;

    v42 = [FHDatabaseEntity alloc];
    WeakRetained = objc_loadWeakRetained((id *)buf);
    v44 = -[FHDatabaseEntity initWithEntity:databaseManager:](v42, "initWithEntity:databaseManager:", CFSTR("transactions"), WeakRetained);
    transactionsEntity = v4->_transactionsEntity;
    v4->_transactionsEntity = (FHDatabaseEntity *)v44;

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);

  }
  return v4;
}

void __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (a3)
  {
    if (v9)
    {
LABEL_7:
      v10 = 138543618;
      v11 = v7;
      v12 = 2080;
      v13 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_ERROR, "Sqlite error: [%{public}@], %s", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2080;
      v13 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_ERROR, "Sqlite [no statement available] failed on %{public}@:, %s", (uint8_t *)&v10, 0x16u);
    }

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
  }

}

BOOL __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_75(uint64_t a1, uint64_t a2, unsigned int a3)
{
  NSObject *v4;
  _BOOL4 v5;
  int v7;
  unsigned int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a3 >= 0xA)
  {
    if (v5)
    {
      v7 = 67109378;
      v8 = a3;
      v9 = 2080;
      v10 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_23B4A2000, v4, OS_LOG_TYPE_ERROR, "Exhautsed all retries :%d, %s", (uint8_t *)&v7, 0x12u);
    }

  }
  else
  {
    if (v5)
    {
      v7 = 67109378;
      v8 = a3;
      v9 = 2080;
      v10 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke";
      _os_log_impl(&dword_23B4A2000, v4, OS_LOG_TYPE_ERROR, "Database is locked, retrying. retries :%d, %s", (uint8_t *)&v7, 0x12u);
    }

    sqlite3_sleep(200);
  }
  return a3 < 0xA;
}

uint64_t __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_86(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebuildTablesAndIndexes:", *(unsigned __int8 *)(a1 + 40));
}

void __48__FHDatabaseManager_init_multiThreadingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "enableMerchantCounts");
    objc_msgSend(v3, "setDatabaseManager:", WeakRetained);
    objc_msgSend(v3, "addInternalState:", 2);
  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[FHDatabaseManager init:multiThreadingEnabled:]_block_invoke_2";
      _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_ERROR, "%s strongSelf is nil", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)insertTransactionInInternalStateDirty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "transactionServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__FHDatabaseManager_insertTransactionInInternalStateDirty___block_invoke;
    v11[3] = &unk_250C664F0;
    v12 = v4;
    +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDatabaseEntity clearDataWithClauseBuilder:](self->_transactionsEntity, "clearDataWithClauseBuilder:", v6);

  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionServiceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert into transactions (t_identifier, t_service_identifier, t_fh_internal_state) values (%@, %@, %d)"), v7, v8, 1);

  return v9;
}

void __59__FHDatabaseManager_insertTransactionInInternalStateDirty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "transactionServiceIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("transactions.t_service_identifier"), v4);

}

- (BOOL)updateFinanceTransactionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "financeTransactionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("update transactions set t_finance_transaction_id = %@ where t_identifier == %@"), v5, v6);
  return (char)self;
}

- (BOOL)updateTransactionWholeRaw:(id)a3
{
  return -[FHDatabaseManager _updateTransaction:withNewInternalState:](self, "_updateTransaction:withNewInternalState:", a3, 2);
}

- (BOOL)updateTransactionInternalStateByIdentifier:(id)a3 newInternalState:(unint64_t)a4
{
  void *v6;

  -[FHDatabaseManager getTransactionByIdentifier:](self, "getTransactionByIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[FHDatabaseManager _updateTransaction:withNewInternalState:](self, "_updateTransaction:withNewInternalState:", v6, a4);

  return a4;
}

- (BOOL)_updateTransaction:(id)a3 withNewInternalState:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  void *v84;
  void *v85;
  _QWORD v86[2];
  int v87;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1518];
  objc_msgSend(v4, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "decimalValue");
  }
  else
  {
    v86[0] = 0;
    v86[1] = 0;
    v87 = 0;
  }
  objc_msgSend(v5, "decimalNumberWithDecimal:", v86);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v8;
  objc_msgSend(v8, "decimalNumberByMultiplyingBy:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v10, "intValue");

  objc_msgSend(v4, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(v4, "transactionStatusChangedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  if (objc_msgSend(v4, "mapsMerchantID"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v4, "mapsMerchantID"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v85 = 0;
  }
  if (objc_msgSend(v4, "mapsMerchantBrandID"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v4, "mapsMerchantBrandID"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = 0;
  }
  objc_msgSend(v4, "merchantDetailedCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v4, "merchantDetailedCategory");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("undefined");
  }
  v83 = v18;

  objc_msgSend(v4, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "secondsFromGMT"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }

  objc_msgSend(v4, "peerPaymentCounterpartHandle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v4, "peerPaymentCounterpartHandle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v81 = 0;
  }

  if (objc_msgSend(v4, "peerPaymentType"))
    v64 = objc_msgSend(v4, "peerPaymentType");
  else
    v64 = 0;
  v66 = (int)v16;
  v67 = (int)v13;
  objc_msgSend(v4, "transactionDescription");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v4, "recurring");
  objc_msgSend(v4, "disputeOpenDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceReferenceDate");
  v63 = (int)v24;

  objc_msgSend(v4, "disputeLastUpdatedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSinceReferenceDate");
  v61 = (int)v26;

  objc_msgSend(v4, "transactionServiceIdentifier");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "financeTransactionIdentifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentHash");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionSourceIdentifier");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v4, "transactionStatus");
  v60 = objc_msgSend(v4, "transactionSource");
  v58 = objc_msgSend(v4, "cardType");
  v57 = objc_msgSend(v4, "transactionType");
  v56 = objc_msgSend(v4, "accountType");
  objc_msgSend(v4, "altDSID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "receiptIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchantUniqueIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v4, "industryCode");
  objc_msgSend(v4, "name");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v4, "category");
  objc_msgSend(v4, "displayName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "street");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "city");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zip");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "country");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v4, "mapsMerchantResultProviderID");
  v32 = objc_msgSend(v4, "mapsMerchantBrandResultProviderID");
  objc_msgSend(v4, "location");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "coordinate");
  v34 = v33;
  objc_msgSend(v4, "location");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "coordinate");
  v36 = v35;
  objc_msgSend(v4, "location");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "verticalAccuracy");
  v38 = v37;
  objc_msgSend(v4, "location");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "horizontalAccuracy");
  v40 = v39;
  v41 = objc_msgSend(v4, "disputeType");
  v42 = objc_msgSend(v4, "disputeStatus");
  objc_msgSend(v4, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("update transactions set t_service_identifier = %@, t_finance_transaction_id = %@, t_payment_hash = %@, t_source_identifier = %@, t_amount = %d, t_currencycode = %@, t_timezone = %@, t_date = %d, t_status = %d, t_status_changed_date = %d, t_source = %d, t_card_type = %d, t_type = %d, a_type = %d, t_altDSID = %@, t_receipt_identifier = %@, t_fh_internal_state = %d, m_merchant_identifier = %@, m_industrycode = %d, m_name = %@, m_raw_name = %@, m_category = %d, m_detailed_category = %@, m_displayname = %@, m_street = %@, m_city = %@, m_state = %@, m_zip = %@, m_country_code = %@, m_country = %@, m_maps_merchant_id = %@, m_maps_merchant_result_id = %d, m_maps_merchant_brand_id = %@, m_maps_merchant_brand_result_id = %d, lat = %f, long = %f, v_accuracy = %f, h_accuracy = %f, dispute_type = %d, dispute_status = %d, peer_pay_counterpart = %@, peer_pay_type = %d, t_description = %@, peer_pay_is_recurring = %d, dispute_open_date = %d, dispute_last_updated_date = %d where t_identifier == %@"), v80, v76, v79, v78, v68, v74, v82, v67, v62, v66, v60, v58, v57, v56, v75, v59,
          a4,
          v45,
          v52,
          v73,
          v55,
          v50,
          v83,
          v54,
          v53,
          v51,
          v27,
          v28,
          v29,
          v30,
          v85,
          v31,
          v84,
          v32,
          v34,
          v36,
          v38,
          v40,
          v41,
          v42,
          v81,
          v64,
          v77,
          v65,
          v63,
          v61,
          v44);

  return v71;
}

- (BOOL)updateTransactionsInternalStateToState:(id)a3 oldInternalState:(unint64_t)a4 newInternalState:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("update transactions set t_fh_internal_state = %d where t_date >= %d and t_date <= %d and t_fh_internal_state %@ %d and t_fh_internal_state != %d"), a5, -[FHDatabaseManager _startingDateSmartFeatureComputation](self, "_startingDateSmartFeatureComputation"), -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate"), v9, a4, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v10);
  return a4;
}

- (BOOL)insertInstrumentationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_DEBUG, "instrumentationRecord: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("Source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("TagType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("PassType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = (unint64_t)v13;

  objc_msgSend(v4, "objectForKey:", CFSTR("HeuristicIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AccountState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("PaidUsingRing"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  v20 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert into features_instrumentation (tag_source, tag_type, tag_click_date, pass_type, heuristics_identifier, account_state, paid_using_ring) values (%d, %d, %d, %d, %@, %d, %d)"), v7, v9, v14, v11, v15, v17, v19);
  return v20;
}

- (BOOL)_insertModelRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("modelName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("modelVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dataType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("dataIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("predictedScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_predicted_realtime (identifier, feature_name, feature_predicted_class, version, data_type, predicted_score) values (%@, %@, %d, %@, %d, %f)"), v9, v5, 0, v6, v8, v10);
  return (char)self;
}

- (unint64_t)getTransactionInternalState:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions t where t.t_identifier == %@ order by t_date desc limit %d"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "next"))
    v6 = objc_msgSend(v5, "unsignedIntegerAtIndex:", 18);
  else
    v6 = 0;
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v5);

  return v6;
}

- (id)getTransactionByFinanceTransactionIdentifier:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", CFSTR("select * from transactions where t_finance_transaction_id == %@"), a3);
  if (objc_msgSend(v4, "next"))
  {
    -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "close");

  return v5;
}

- (id)_getTransactionByIdentifier:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", CFSTR("select * from transactions t where t.t_identifier == %@ order by t_date desc limit %d"), a3, 1);
  if (objc_msgSend(v4, "next"))
  {
    -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "close");

  return v5;
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4
{
  return -[FHDatabaseManager getTransactionsByInternalState:internalState:offSet:](self, "getTransactionsByInternalState:internalState:offSet:", a3, a4, 0);
}

- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 onTransaction:(id)a5
{
  return -[FHDatabaseManager streamTransactionsWithLimit:internalState:offSet:onTransaction:](self, "streamTransactionsWithLimit:internalState:offSet:onTransaction:", a3, a4, 0, a5);
}

- (int)streamTransactionsWithLimit:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 onTransaction:(id)a6
{
  void (**v10)(id, void *);
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v10 = (void (**)(id, void *))a6;
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions t where t_fh_internal_state == %d order by t_date desc limit %d offset %d"), a4, a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(v11, "next"))
  {
    do
    {
      v13 = (void *)MEMORY[0x23B865790]();
      -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v14);
      ++v12;

      objc_autoreleasePoolPop(v13);
    }
    while ((objc_msgSend(v11, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v11);

  return v12;
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5
{
  return -[FHDatabaseManager getTransactionsByInternalState:internalState:offSet:addCompoundFeatures:](self, "getTransactionsByInternalState:internalState:offSet:addCompoundFeatures:", a3, a4, a5, 0);
}

- (id)getTransactionsByInternalState:(unint64_t)a3 internalState:(unint64_t)a4 offSet:(unint64_t)a5 addCompoundFeatures:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions t where t_fh_internal_state == %d order by t_date desc limit %d offset %d"), a4, a3, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "next"))
  {
    do
    {
      -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "transactionType"))
        v14 = 0;
      else
        v14 = objc_msgSend(v13, "transactionStatus") == 1;
      v15 = objc_msgSend(v13, "transactionType");
      if (v14 || v15 == 3)
        objc_msgSend(v11, "addObject:", v13);

    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v12);
  if (v6)
  {
    v30 = v12;
    v31 = v11;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v11;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHDatabaseManager compoundFeaturesForTransaction:](self, "compoundFeaturesForTransaction:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "objectForKey:", CFSTR("FHSmartFeatureCompoundTypePointsOfInterest"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23 && objc_msgSend(v23, "count"))
          {
            v25 = objc_alloc(MEMORY[0x24BDBCE70]);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v25, "initWithObjectsAndKeys:", v26, CFSTR("FHSmartFeatureCompoundTypePointsOfInterest"), 0);

            objc_msgSend(v20, "setCompoundFeatures:", v27);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }

    v12 = v30;
    v11 = v31;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)getTransactionsByDetailedCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions where m_detailed_category == %@ order by t_date desc"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v6);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getRecurringTransactionIdentifiers
{
  return -[FHDatabaseManager getRecurringTransactionIdentifiersByClass:](self, "getRecurringTransactionIdentifiersByClass:", 0);
}

- (id)getRecurringTransactionIdentifiersByClass:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_new();
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select identifier from features_predicted_realtime where feature_name='FHSmartFeatureAggregateTypeRecurring' and feature_predicted_class=%d limit %d"), a3, -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      objc_msgSend(v6, "stringAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v6);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getTransactionIdsInTimeRangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = (int)v9;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions t where t_date >= %d and t_date <= %d and a_type == %d order by t_date desc limit %d"), v10, (int)v11, 2, -1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "next"))
  {
    do
    {
      objc_msgSend(v12, "stringAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);

    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v12);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)insertFeatures:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "accountType");

  v10 = v9 == 2
     && -[FHDatabaseManager insertFeaturesDeterminiticRealtime:realtimeFeatures:](self, "insertFeaturesDeterminiticRealtime:realtimeFeatures:", v8, v6)&& -[FHDatabaseManager insertFeaturesPredictedRealtime:realtimeFeatures:](self, "insertFeaturesPredictedRealtime:realtimeFeatures:", v8, v6)&& -[FHDatabaseManager insertFeaturesCompoundRealtime:realtimeFeatures:](self, "insertFeaturesCompoundRealtime:realtimeFeatures:", v8, v6);

  return v10;
}

- (BOOL)insertFeaturesDeterminiticRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "timeOfDay");
  v9 = objc_msgSend(v6, "transactionDateAtZerothHour");
  v10 = objc_msgSend(v6, "merchantCategory");
  v11 = objc_msgSend(v6, "isInternationalSpend");
  v12 = objc_msgSend(v6, "isTapToPay");

  LOBYTE(self) = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_deterministic_realtime (t_identifier, a, b, c, f, g) values (%@, %d, %d, %d, %d, %d)"), v7, v8, v9, v10, v11, v12);
  return (char)self;
}

- (BOOL)insertFeaturesPredictedRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "repeatingPatternClass");
  if ((unint64_t)objc_msgSend(v7, "repeatingPatternClass") <= 2)
    -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", CFSTR("delete from features_predicted_realtime where identifier == %@ and feature_name == %@"), v6, CFSTR("FHSmartFeatureAggregateTypeRecurring"));
  v8 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_predicted_realtime (identifier, feature_name, feature_predicted_class, version, data_type, predicted_score) values (%@, %@, %d, %@, %d, %f)"), v6, CFSTR("FHSmartFeatureAggregateTypeRecurring"), objc_msgSend(v7, "repeatingPatternClass"), CFSTR("0"), 0, 0);

  return v8;
}

- (BOOL)insertFeaturesCompoundRealtime:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  BOOL v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "smartCompoundFeatures");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  v9 = (void *)v8;
  objc_msgSend(v7, "smartCompoundFeatures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("FHSmartFeatureCompoundTypeEventTagging"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "smartCompoundFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("FHSmartFeatureCompoundTypeTripEvents"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_5;
LABEL_6:
    v17 = 1;
    goto LABEL_7;
  }

LABEL_5:
  v14 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v7, "smartCompoundFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[FHDatabaseManager insertFeaturesEvents:](self, "insertFeaturesEvents:", v16);

LABEL_7:
  v18 = v17 & -[FHDatabaseManager insertFeaturesCompoundRealtimeWithoutEvents:realtimeFeatures:](self, "insertFeaturesCompoundRealtimeWithoutEvents:realtimeFeatures:", v6, v7);

  return v18;
}

- (BOOL)insertFeaturesCompoundRealtimeWithoutEvents:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23B865790]();
  v9 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v7, "smartCompoundFeaturesDictionaryForJson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "dataWithJSONObject:options:error:", v10, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;

  if (v11)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
    v14 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_compound_realtime (t_identifier, t_compound_feature_value) values (%@, %@)"), v6, v13);
  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_23B4A2000, v13, OS_LOG_TYPE_DEBUG, "Failed to parse smartCompoundFeaturesDictionaryForJson: %@", buf, 0xCu);

    }
    v14 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v14;
}

- (BOOL)insertFeaturesEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.FHSmartFeatureCompoundTypeEventTagging"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.FHSmartFeatureCompoundTypeTripEvents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  if (objc_msgSend(v7, "count"))
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_DEBUG, "Distinct event ranked values: %@", buf, 0xCu);
    }

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v33;
    v10 = 1;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "eventStartDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        v15 = v14;

        objc_msgSend(v12, "eventEndDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = v17;

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v12, "eventIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v19);
              v10 &= -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_events (e_identifier, start_date, end_date) values (%@, %d, %d)"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), (int)v15, (int)v18);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v21);
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v27);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10 & 1;
}

- (BOOL)insertFeaturesGrouping:(id)a3 realtimeFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  FHDatabaseManager *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "mapsMerchantID"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v7, "mapsMerchantID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v7, "mapsMerchantBrandID"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v7, "mapsMerchantBrandID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_11:
      v17 = 1;
      if (!v9)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
    if (!v8)
      goto LABEL_11;
  }
  if (!objc_msgSend(v8, "length"))
    goto LABEL_11;
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = v6;
  v12 = self;
  v13 = objc_msgSend(v8, "integerValue");
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  self = v12;
  v6 = v11;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)"), v11, v24, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[FHDatabaseManager _execute:](self, "_execute:", v16);
  if (!v9)
    goto LABEL_14;
LABEL_12:
  if (objc_msgSend(v9, "length"))
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = objc_msgSend(v9, "integerValue");
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)"), v6, v19, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v17 &= -[FHDatabaseManager _execute:](self, "_execute:", v22);
  }
LABEL_14:

  return v17;
}

- (id)getTaggedPastCalendarEvents
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FHDatabaseManager *v18;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -31536000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = (int)v6;

  v18 = self;
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from features_events where end_date < %d limit %d"), v7, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "next"))
  {
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v8, "unsignedIntAtIndex:", 2));
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v8, "unsignedIntAtIndex:", 3));
      v11 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v8, "stringAtIndex:", 1);
      v12 = v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v9, v10, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v13, CFSTR("featureEventIdentifiers"), v9, CFSTR("featureEventStartDate"), v10, CFSTR("featureEventEndDate"), v14, CFSTR("featureEventDateRangeKey"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v12;
      objc_msgSend(v12, "addObject:", v15);

    }
    while ((objc_msgSend(v8, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](v18, "closeAndUnlock:", v8);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)getFeaturePredicate:(id)a3 FHSmartFeatureAggregateType:(id)a4
{
  id v5;
  id v6;
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

  v5 = a4;
  v6 = a3;
  FHSmartFeaturesDict();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("predicate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "objectForKey:", CFSTR("index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("filteringOperator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("match"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("SELF[%@] %@ '%@'"), v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_computeSingleMerchantAggregateFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  NSObject *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v34;
  id v35;
  int64_t v36;
  int64_t v37;
  int v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FHSmartFeaturesDict();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FHMerchantSmartFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("featureValueIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v8, "intValue");

  -[FHDatabaseManager getFeaturePredicate:FHSmartFeatureAggregateType:](self, "getFeaturePredicate:FHSmartFeatureAggregateType:", CFSTR("FHMerchantSmartFeatures"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("aggrWindow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_merchantAggregatesCache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v10, "intValue");
  v14 = -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate");
  v15 = v14 - 86400 * v13;
  v36 = v14;
  if (v12)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[FHDatabaseManager _computeSingleMerchantAggregateFeature:]";
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }
  }
  else
  {
    v17 = v14;
    v34 = v9;
    v35 = v4;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select m_displayname, count(*) c, m_detailed_category from transactions where transactions.t_date >= %d and transactions.t_date <= %d and transactions.t_type == %lu and transactions.t_status == %lu and transactions.a_type == %d group by m_displayname order by c desc"), v15, v17, 0, 1, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "next"))
    {
      do
      {
        v19 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v18, "stringAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringAtIndex:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringAtIndex:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayWithObjects:", v20, v21, v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
          -[NSObject addObject:](v16, "addObject:", v23);

      }
      while ((objc_msgSend(v18, "next") & 1) != 0);
    }
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v18);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_merchantAggregatesCache, "setObject:forKey:", v12, v11);
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[FHDatabaseManager _computeSingleMerchantAggregateFeature:]";
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_23B4A2000, v24, OS_LOG_TYPE_DEBUG, "%s resultArray %@ added to cache", buf, 0x16u);
    }

    v9 = v34;
    v4 = v35;
  }

  objc_msgSend(v12, "filteredArrayUsingPredicate:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    v26 = v9;
    objc_msgSend(v25, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28 <= v38)
    {
      v32 = 1;
    }
    else
    {
      v37 = v15;
      v29 = v4;
      objc_msgSend(v25, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndex:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v4 = v29;
        v32 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_merchant (merchant_aggregate_type, merchant_aggregate_value, start_date, end_date) values (%@, %@, %d, %d)"), v29, v31, v37, v36);

      }
      else
      {
        v32 = 1;
        v4 = v29;
      }
    }
    v9 = v26;
  }
  else
  {
    v32 = 1;
  }

  return v32;
}

- (BOOL)computeMerchantAggregateFeatures
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  FHMerchantSmartFeaturesArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__FHDatabaseManager_computeMerchantAggregateFeatures__block_invoke;
  v5[3] = &unk_250C66518;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  -[NSMutableDictionary removeAllObjects](self->_merchantAggregatesCache, "removeAllObjects");
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__FHDatabaseManager_computeMerchantAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_computeSingleMerchantAggregateFeature:", a2);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (BOOL)_computeSingleDatetimeAggregateFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  NSObject *v15;
  int64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v33;
  int64_t v34;
  int64_t v35;
  int v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FHSmartFeaturesDict();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FHDateTimeSmartFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("featureValueIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v8, "intValue");

  v37 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("aggrWindow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_dateTimeAggregatesCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(v9, "intValue");
  v13 = -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate");
  v14 = v13 - 86400 * v12;
  v34 = v14;
  v35 = v13;
  if (v11)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[FHDatabaseManager _computeSingleDatetimeAggregateFeature:]";
      v40 = 2112;
      v41 = v10;
      _os_log_impl(&dword_23B4A2000, v15, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }

  }
  else
  {
    v16 = v13;
    v33 = v4;
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select sum(t.t_amount) daily_spend, f.b from transactions t inner join features_deterministic_realtime f on t.t_identifier = f.t_identifier where t.t_date >= %d and t.t_date <= %d and t.t_type == %lu and t.t_status == %lu and t.a_type == %d group by f.b order by daily_spend desc limit %d"), v14, v16, 0, 1, 2, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "next"))
    {
      do
      {
        v19 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v18, "numberAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberAtIndex:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayWithObjects:", v20, v21, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v22);
      }
      while ((objc_msgSend(v18, "next") & 1) != 0);
    }
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v18);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_dateTimeAggregatesCache, "setObject:forKey:", v11, v10);

    v4 = v33;
  }
  -[FHDatabaseManager getFeaturePredicate:FHSmartFeatureAggregateType:](self, "getFeaturePredicate:FHSmartFeatureAggregateType:", CFSTR("FHDateTimeSmartFeatures"), v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v11;
  }
  v25 = v24;
  if (objc_msgSend(v24, "count")
    && (objc_msgSend(v25, "firstObject"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "count"),
        v26,
        v27 > v36))
  {
    v28 = v4;
    objc_msgSend(v25, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v4 = v28;
      v31 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_datetime (datetime_aggregate_type, datetime_aggregate_value_start_date, datetime_aggregate_value_end_date, start_date, end_date) values (%@, %d, %d, %d, %d)"), v28, objc_msgSend(v30, "intValue"), (int)objc_msgSend(v30, "intValue") + 86399, v34, v35);

    }
    else
    {
      v31 = 0;
      v4 = v28;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)computeDatetimeAggregateFeatures
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  FHDateTimeSmartFeaturesArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__FHDatabaseManager_computeDatetimeAggregateFeatures__block_invoke;
  v5[3] = &unk_250C66518;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  -[NSMutableDictionary removeAllObjects](self->_dateTimeAggregatesCache, "removeAllObjects");
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __53__FHDatabaseManager_computeDatetimeAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_computeSingleDatetimeAggregateFeature:", a2);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (BOOL)_computeSingleAmountAggregateFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  BOOL v32;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FHSmartFeaturesDict();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FHAmountSmartFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v4;
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("expression"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("aggrWindow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_amountAggregatesCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(v9, "intValue");
  v13 = -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate");
  v14 = v13;
  v15 = v13 - 86400 * v12;
  if (v11)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[FHDatabaseManager _computeSingleAmountAggregateFeature:]";
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_DEBUG, "%s resultArray for %@ is already cached", buf, 0x16u);
    }

  }
  else
  {
    v35 = v13;
    v37 = v8;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v15;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __58__FHDatabaseManager__computeSingleAmountAggregateFeature___block_invoke;
    v40[3] = &unk_250C66540;
    v40[4] = self;
    v19 = v18;
    v41 = v19;
    v20 = v17;
    v42 = v20;
    +[FHBatchProcessor initWithBuilder:](FHBatchProcessor, "initWithBuilder:", v40);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fetchAndProcessInBatchMode");
    objc_msgSend(v21, "filteredTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_amountAggregatesCache, "setObject:forKey:", v11, v10);
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[FHDatabaseManager _computeSingleAmountAggregateFeature:]";
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_23B4A2000, v22, OS_LOG_TYPE_DEBUG, "%s resultArray %@ added to cache", buf, 0x16u);
    }

    v14 = v35;
    v8 = v37;
    v15 = v34;
    if (!v11)
      goto LABEL_15;
  }
  if (!objc_msgSend(v11, "count"))
  {
LABEL_15:
    v32 = 1;
    goto LABEL_18;
  }
  v38 = v10;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("%@"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") - 1;

  if (v25 >= 1)
  {
    do
    {
      objc_msgSend(v23, "addObject:", v11);
      --v25;
    }
    while (v25);
  }
  v36 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("comparator"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:argumentArray:", v8, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "expressionValueWithObject:context:", 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "doubleValue");
    v32 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_amount (amount_aggregate_type, amount_aggregate_value, comparison_operator, start_date, end_date) values (%@, %d, %@, %d, %d)"), v39, (int)v31, v26, v15, v14);
  }
  else
  {
    v32 = 1;
  }

  v8 = v27;
  v7 = v36;
  v10 = v38;
LABEL_18:

  return v32;
}

void __58__FHDatabaseManager__computeSingleAmountAggregateFeature___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setDatabaseManager:", v3);
  objc_msgSend(v4, "addInternalState:", 2);
  objc_msgSend(v4, "setMostRecentTransactionFromDatabase:", objc_msgSend((id)a1[4], "mostRecentTransactionDate"));
  objc_msgSend(v4, "setStartDate:", a1[5]);
  objc_msgSend(v4, "setEndDate:", a1[6]);

}

- (BOOL)computeAmountAggregateFeatures
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  FHAmountSmartFeaturesArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__FHDatabaseManager_computeAmountAggregateFeatures__block_invoke;
  v5[3] = &unk_250C66518;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  -[NSMutableDictionary removeAllObjects](self->_amountAggregatesCache, "removeAllObjects");
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __51__FHDatabaseManager_computeAmountAggregateFeatures__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_computeSingleAmountAggregateFeature:", a2);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (id)getFHSmartFeatureByMerchantType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select merchant_aggregate_value, start_date, end_date from features_merchant where merchant_aggregate_type == %@ order by end_date desc"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "next"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "stringAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantDisplayName:", v6);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowStartDate:", v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowEndDate:", v8);

  }
  else
  {
    v5 = 0;
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

  return v5;
}

- (id)getFHSmartFeatureByAmountType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select amount_aggregate_value, comparison_operator, start_date, end_date from features_amount where amount_aggregate_type == %@ order by end_date desc"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "next"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setAmount:", objc_msgSend(v4, "integerAtIndex:", 0));
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setComparator:", v6);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowStartDate:", v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowEndDate:", v8);

  }
  else
  {
    v5 = 0;
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

  return v5;
}

- (id)getFHSmartFeatureByDateTimeType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select datetime_aggregate_value_start_date, datetime_aggregate_value_end_date, start_date, end_date from features_datetime where datetime_aggregate_type == %@ order by end_date desc"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "next"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartDate:", v6);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndDate:", v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowStartDate:", v8);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "integerAtIndex:", 3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProcessingWindowEndDate:", v9);

  }
  else
  {
    v5 = 0;
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

  return v5;
}

- (BOOL)deleteAllFeatureRecordsForTransaction:(id)a3
{
  id v4;
  FHDatabaseEntity *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v4 = a3;
  v5 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("fh_card_recurring_predictions"), self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __59__FHDatabaseManager_deleteAllFeatureRecordsForTransaction___block_invoke;
  v13 = &unk_250C664F0;
  v6 = v4;
  v14 = v6;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", CFSTR("delete from features_deterministic_realtime where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)"), v6, v10, v11, v12, v13)&& -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", CFSTR("delete from features_predicted_realtime where identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)"), v6)&& -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", CFSTR("delete from features_compound_realtime where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)"), v6)&& -[FHDatabaseManager deleteWithSQL:](
         self,
         "deleteWithSQL:",
         CFSTR("delete from features_heuristics where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)"),
         v6)
    && -[FHDatabaseEntity clearDataWithClauseBuilder:](v5, "clearDataWithClauseBuilder:", v7);

  return v8;
}

uint64_t __59__FHDatabaseManager_deleteAllFeatureRecordsForTransaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("fh_card_recurring_predictions.source_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)deleteAllRecordsInTransactions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__FHDatabaseManager_deleteAllRecordsInTransactions___block_invoke;
  v8[3] = &unk_250C664F0;
  v9 = v4;
  v5 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FHDatabaseEntity clearDataWithClauseBuilder:](self->_transactionsEntity, "clearDataWithClauseBuilder:", v6);

  return (char)self;
}

uint64_t __52__FHDatabaseManager_deleteAllRecordsInTransactions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("transactions.t_source_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)deleteTransactionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__FHDatabaseManager_deleteTransactionWithIdentifier___block_invoke;
  v8[3] = &unk_250C664F0;
  v9 = v4;
  v5 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FHDatabaseEntity clearDataWithClauseBuilder:](self->_transactionsEntity, "clearDataWithClauseBuilder:", v6);

  return (char)self;
}

uint64_t __53__FHDatabaseManager_deleteTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("transactions.t_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)deleteBankConnectTransactionWithFinanceTransactionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__FHDatabaseManager_deleteBankConnectTransactionWithFinanceTransactionIdentifier___block_invoke;
  v8[3] = &unk_250C664F0;
  v9 = v4;
  v5 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FHDatabaseEntity clearDataWithClauseBuilder:](self->_transactionsEntity, "clearDataWithClauseBuilder:", v6);

  return (char)self;
}

void __82__FHDatabaseManager_deleteBankConnectTransactionWithFinanceTransactionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("transactions.t_identifier"), v3);
  objc_msgSend(v4, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("transactions.t_finance_transaction_id"), *(_QWORD *)(a1 + 32));

}

- (BOOL)removeFinanceTransactionIdentifier:(id)a3
{
  return -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("update transactions set t_finance_transaction_id=null where t_identifier != t_finance_transaction_id and t_finance_transaction_id = %@"), a3);
}

- (BOOL)deleteAllRecordsInPeerPaymentFeatures:(id)a3
{
  id v4;
  FHDatabaseEntity *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("features_peer_payments"), self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__FHDatabaseManager_deleteAllRecordsInPeerPaymentFeatures___block_invoke;
  v10[3] = &unk_250C664F0;
  v11 = v4;
  v6 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v5, "clearDataWithClauseBuilder:", v7);

  return v8;
}

uint64_t __59__FHDatabaseManager_deleteAllRecordsInPeerPaymentFeatures___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("features_peer_payments.source_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)deleteAllRecordsInAccountInfoForTransactionSource:(id)a3
{
  id v4;
  FHDatabaseEntity *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("fh_account_information"), self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__FHDatabaseManager_deleteAllRecordsInAccountInfoForTransactionSource___block_invoke;
  v10[3] = &unk_250C664F0;
  v11 = v4;
  v6 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v5, "clearDataWithClauseBuilder:", v7);

  return v8;
}

uint64_t __71__FHDatabaseManager_deleteAllRecordsInAccountInfoForTransactionSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("fh_account_information.source_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)updateGetAllStatus:(unint64_t)a3
{
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("update fh_schema set sch_getall_status = %d where sch_version_id == %@"), a3, CFSTR("10.71"));
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_DEBUG, "updateGetAllStatus successful", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[PQLConnection lastError](self->_db, "lastError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_ERROR, "Update failed with error: %@", buf, 0xCu);

  }
  return v4;
}

- (BOOL)shouldCallGetAllTransactions
{
  void *v3;
  BOOL v4;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select sch_getall_status from fh_schema where sch_version_id == %@;"),
    CFSTR("10.71"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "next"))
    v4 = objc_msgSend(v3, "unsignedIntegerAtIndex:", 0) != 1;
  else
    v4 = 1;
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v3);

  return v4;
}

- (id)compoundFeaturesForTransaction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select t_identifier, t_compound_feature_value from features_compound_realtime where t_identifier == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  if (objc_msgSend(v4, "next"))
  {
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FinHealthFeatureHelper reconstructCompoundFeatures:](FinHealthFeatureHelper, "reconstructCompoundFeatures:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

  return v5;
}

- (id)reconstructTransaction:(id)a3
{
  id v3;
  FHTransaction *v4;
  uint64_t v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  CLLocationDegrees v35;
  CLLocationDegrees v36;
  double v37;
  CLLocationCoordinate2D v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  void *v51;
  void *v52;

  v3 = a3;
  v4 = objc_alloc_init(FHTransaction);
  v5 = (int)objc_msgSend(v3, "intAtIndex:", 6);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "unsignedIntAtIndex:", 9));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "unsignedIntAtIndex:", 11));
  objc_msgSend(v3, "stringAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setIdentifier:](v4, "setIdentifier:", v9);

  objc_msgSend(v3, "stringAtIndex:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionServiceIdentifier:](v4, "setTransactionServiceIdentifier:", v10);

  objc_msgSend(v3, "stringAtIndex:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setFinanceTransactionIdentifier:](v4, "setFinanceTransactionIdentifier:", v11);

  objc_msgSend(v3, "stringAtIndex:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPaymentHash:](v4, "setPaymentHash:", v12);

  objc_msgSend(v3, "stringAtIndex:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionSourceIdentifier:](v4, "setTransactionSourceIdentifier:", v13);

  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decimalNumberByDividingBy:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAmount:](v4, "setAmount:", v15);

  -[FHTransaction setAmountFromDatabase:](v4, "setAmountFromDatabase:", v5);
  objc_msgSend(v3, "stringAtIndex:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCurrencyCode:](v4, "setCurrencyCode:", v16);

  -[FHTransaction setTransactionDate:](v4, "setTransactionDate:", v7);
  -[FHTransaction setTransactionStatus:](v4, "setTransactionStatus:", (int)objc_msgSend(v3, "intAtIndex:", 10));
  -[FHTransaction setTransactionStatusChangedDate:](v4, "setTransactionStatusChangedDate:", v8);
  -[FHTransaction setTransactionSource:](v4, "setTransactionSource:", (int)objc_msgSend(v3, "intAtIndex:", 12));
  -[FHTransaction setCardType:](v4, "setCardType:", (int)objc_msgSend(v3, "intAtIndex:", 13));
  -[FHTransaction setTransactionType:](v4, "setTransactionType:", (int)objc_msgSend(v3, "intAtIndex:", 14));
  -[FHTransaction setAccountType:](v4, "setAccountType:", (int)objc_msgSend(v3, "intAtIndex:", 15));
  objc_msgSend(v3, "stringAtIndex:", 16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setAltDSID:](v4, "setAltDSID:", v17);

  objc_msgSend(v3, "stringAtIndex:", 17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setReceiptIdentifier:](v4, "setReceiptIdentifier:", v18);

  -[FHTransaction setTransactionInternalState:](v4, "setTransactionInternalState:", (int)objc_msgSend(v3, "intAtIndex:", 18));
  objc_msgSend(v3, "stringAtIndex:", 19);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantUniqueIdentifier:](v4, "setMerchantUniqueIdentifier:", v19);

  -[FHTransaction setIndustryCode:](v4, "setIndustryCode:", (int)objc_msgSend(v3, "intAtIndex:", 20));
  objc_msgSend(v3, "stringAtIndex:", 21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setName:](v4, "setName:", v20);

  objc_msgSend(v3, "stringAtIndex:", 22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setRawName:](v4, "setRawName:", v21);

  -[FHTransaction setCategory:](v4, "setCategory:", (int)objc_msgSend(v3, "intAtIndex:", 23));
  objc_msgSend(v3, "stringAtIndex:", 24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMerchantDetailedCategory:](v4, "setMerchantDetailedCategory:", v22);

  objc_msgSend(v3, "stringAtIndex:", 25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setDisplayName:](v4, "setDisplayName:", v23);

  objc_msgSend(v3, "stringAtIndex:", 26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setStreet:](v4, "setStreet:", v24);

  objc_msgSend(v3, "stringAtIndex:", 27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCity:](v4, "setCity:", v25);

  objc_msgSend(v3, "stringAtIndex:", 28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setState:](v4, "setState:", v26);

  objc_msgSend(v3, "stringAtIndex:", 29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setZip:](v4, "setZip:", v27);

  objc_msgSend(v3, "stringAtIndex:", 30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountryCode:](v4, "setCountryCode:", v28);

  objc_msgSend(v3, "stringAtIndex:", 31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setCountry:](v4, "setCountry:", v29);

  objc_msgSend(v3, "stringAtIndex:", 32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantID:](v4, "setMapsMerchantID:", objc_msgSend(v30, "longLongValue"));

  -[FHTransaction setMapsMerchantResultProviderID:](v4, "setMapsMerchantResultProviderID:", objc_msgSend(v3, "intAtIndex:", 33));
  objc_msgSend(v3, "stringAtIndex:", 34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setMapsMerchantBrandID:](v4, "setMapsMerchantBrandID:", objc_msgSend(v31, "longLongValue"));

  -[FHTransaction setMapsMerchantBrandResultProviderID:](v4, "setMapsMerchantBrandResultProviderID:", objc_msgSend(v3, "intAtIndex:", 35));
  objc_msgSend(v3, "stringAtIndex:", 42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPeerPaymentCounterpartHandle:](v4, "setPeerPaymentCounterpartHandle:", v32);

  -[FHTransaction setPeerPaymentType:](v4, "setPeerPaymentType:", (int)objc_msgSend(v3, "intAtIndex:", 43));
  objc_msgSend(v3, "stringAtIndex:", 44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setTransactionDescription:](v4, "setTransactionDescription:", v33);

  -[FHTransaction setRecurring:](v4, "setRecurring:", objc_msgSend(v3, "intAtIndex:", 45) != 0);
  objc_msgSend(v3, "doubleAtIndex:", 36);
  v35 = v34;
  objc_msgSend(v3, "doubleAtIndex:", 37);
  v37 = v36;
  v38 = CLLocationCoordinate2DMake(v35, v36);
  if ((v35 != 0.0 || v37 != 0.0) && CLLocationCoordinate2DIsValid(v38))
  {
    v39 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v3, "doubleAtIndex:", 39);
    v41 = v40;
    objc_msgSend(v3, "doubleAtIndex:", 38);
    v43 = v42;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v39, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v44, v38.latitude, v38.longitude, 0.0, v41, v43);
    -[FHTransaction setLocation:](v4, "setLocation:", v45);

  }
  if (objc_msgSend(v3, "intAtIndex:", 8))
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", (int)objc_msgSend(v3, "intAtIndex:", 8));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTimeZone:](v4, "setTimeZone:", v46);

  }
  -[FHTransaction setDisputeType:](v4, "setDisputeType:", (int)objc_msgSend(v3, "intAtIndex:", 40));
  -[FHTransaction setDisputeStatus:](v4, "setDisputeStatus:", (int)objc_msgSend(v3, "intAtIndex:", 41));
  objc_msgSend(v3, "stringAtIndex:", 42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction setPeerPaymentCounterpartHandle:](v4, "setPeerPaymentCounterpartHandle:", v47);

  -[FHTransaction setPeerPaymentType:](v4, "setPeerPaymentType:", (int)objc_msgSend(v3, "intAtIndex:", 43));
  v48 = objc_msgSend(v3, "unsignedIntAtIndex:", 46);
  v49 = objc_msgSend(v3, "unsignedIntAtIndex:", 47);
  if (v48 >= 1)
  {
    v50 = v49;
    if (v49 >= 1)
    {
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)v48);
      -[FHTransaction setDisputeOpenDate:](v4, "setDisputeOpenDate:", v51);

      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", (double)v50);
      -[FHTransaction setDisputeLastUpdatedDate:](v4, "setDisputeLastUpdatedDate:", v52);

    }
  }

  return v4;
}

- (id)featuresForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = a3;
  -[FHDatabaseManager getTransactionByIdentifier:](self, "getTransactionByIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FHDatabaseManager _hasDeterministicRealtime:](self, "_hasDeterministicRealtime:", v4)
    && !objc_msgSend(v5, "transactionType")
    && objc_msgSend(v5, "transactionStatus") == 1
    && objc_msgSend(v5, "accountType") == 2)
  {
    -[FHDatabaseManager _computeAllAggregateFeaturesWithTransactionId:](self, "_computeAllAggregateFeaturesWithTransactionId:", v4);
    -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select t_features, t_compound_features, locale from transaction_features where t_identifier == %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "next"))
    {
      objc_msgSend(v6, "stringAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringAtIndex:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:](self, "_createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:", v7, v8, v9, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v6);
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "transactionType") == 10 && objc_msgSend(v5, "accountType") == 2)
  {
    -[FHDatabaseManager _computePaymentFeaturesForTransaction:](self, "_computePaymentFeaturesForTransaction:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FHDatabaseManager _getDisputeFeaturesForTransaction:](self, "_getDisputeFeaturesForTransaction:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || objc_msgSend(v5, "transactionType") || objc_msgSend(v5, "transactionStatus"))
      goto LABEL_15;
    v15 = objc_msgSend(v5, "accountType");

    if (v15 != 2)
    {
      v10 = 0;
      goto LABEL_17;
    }
    -[FHDatabaseManager _computeDisputeFeaturesForTransaction:](self, "_computeDisputeFeaturesForTransaction:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v11;
  if (!v11)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("|"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:](self, "_createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:", v13, 0, 0, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

  return v10;
}

- (BOOL)_hasDeterministicRealtime:(id)a3
{
  void *v4;
  char v5;

  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from features_deterministic_realtime where t_identifier == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "next");
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);

  return v5;
}

- (id)_filterAggregateFeatureByCurrentWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_timeIntervalSinceReferenceDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF.%K == nil and SELF.%K == nil) or %lu - SELF.%K.%K < SELF.%K.%K - SELF.%K.%K"), CFSTR("processingWindowStartDate"), CFSTR("processingWindowEndDate"), -[FHDatabaseManager _mostRecentTransactionDate](self, "_mostRecentTransactionDate"), CFSTR("processingWindowEndDate"), v5, CFSTR("processingWindowEndDate"), v5, CFSTR("processingWindowStartDate"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6
{
  return -[FHDatabaseManager _createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:forApplication:](self, "_createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:forApplication:", a3, a4, a5, a6, CFSTR("Search"));
}

- (id)_createFeatureResponseFromFeatures:(id)a3 compoundFeatures:(id)a4 locale:(id)a5 forTxnID:(id)a6 forApplication:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSArray *inferredMerchants;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  FHFeaturesResponse *v43;
  NSObject *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void (**v58)(_QWORD, _QWORD);
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("|"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[FinHealthFeatureHelper reconstructAggregateFeaturesWithProcessingWindow:](FinHealthFeatureHelper, "reconstructAggregateFeaturesWithProcessingWindow:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FHApplicationToTagsMapping();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v16;
  objc_msgSend(v19, "objectForKey:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("featuresWithIds"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K in %@"), CFSTR("name"), v21);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _filterAggregateFeatureByCurrentWindow:](self, "_filterAggregateFeatureByCurrentWindow:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __104__FHDatabaseManager__createFeatureResponseFromFeatures_compoundFeatures_locale_forTxnID_forApplication___block_invoke;
  v63[3] = &unk_250C66568;
  v52 = v21;
  v64 = v52;
  v22 = v17;
  v65 = v22;
  v23 = v14;
  v66 = v23;
  v24 = MEMORY[0x23B865904](v63);
  if (objc_msgSend(v13, "length"))
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v13);
  v58 = (void (**)(_QWORD, _QWORD))v24;
  if (_os_feature_enabled_impl())
  {
    FHDataDirectory();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("/inferred_merchants.txt"));
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v26;
    if (objc_msgSend(v27, "fileExistsAtPath:", v26))
    {
      inferredMerchants = self->_inferredMerchants;

      if (inferredMerchants)
      {
LABEL_8:
        if (self->_inferredMerchants)
        {
          v46 = v23;
          v47 = v18;
          v48 = v15;
          v49 = v13;
          v50 = v12;
          -[FHDatabaseManager _getTransactionByIdentifier:](self, "_getTransactionByIdentifier:", v15);
          v45 = objc_claimAutoreleasedReturnValue();
          -[NSObject displayName](v45, "displayName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v33 = self->_inferredMerchants;
          v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v60 != v36)
                  objc_enumerationMutation(v33);
                if (v32)
                {
                  v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                  if (objc_msgSend(v38, "containsString:", v32))
                  {
                    v39 = objc_msgSend(v38, "rangeOfString:", CFSTR("###"));
                    if (v39 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      objc_msgSend(v38, "substringFromIndex:", v39 + 3);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      ((void (**)(_QWORD, void *))v58)[2](v58, v40);
                      FinHealthLogObject(CFSTR("FinHealthCore"));
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v68 = v38;
                        v69 = 2112;
                        v70 = v40;
                        _os_log_impl(&dword_23B4A2000, v41, OS_LOG_TYPE_DEBUG, "inferredMerchantEntry: %@, productsWithLabels: %@", buf, 0x16u);
                      }

                    }
                  }
                }
              }
              v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            }
            while (v35);
          }

          v13 = v49;
          v12 = v50;
          v18 = v47;
          v15 = v48;
          v23 = v46;
          v42 = v45;
        }
        else
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v51;
            _os_log_impl(&dword_23B4A2000, v42, OS_LOG_TYPE_DEBUG, "check finalFilePath: %@", buf, 0xCu);
          }
        }

        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v51, 4, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsSeparatedByCharactersInSet:", v29);
      v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v31 = self->_inferredMerchants;
      self->_inferredMerchants = v30;

    }
    goto LABEL_8;
  }
LABEL_26:
  v43 = -[FHFeaturesResponse initWithSmartFeatures:aggregateFeatureswithProcessingWindow:compoundFeatures:transactionID:]([FHFeaturesResponse alloc], "initWithSmartFeatures:aggregateFeatureswithProcessingWindow:compoundFeatures:transactionID:", v53, v54, v22, v15);

  return v43;
}

void __104__FHDatabaseManager__createFeatureResponseFromFeatures_compoundFeatures_locale_forTxnID_forApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  FHSmartCompoundFeatureRankedValue *v23;
  void *v24;
  FHSmartCompoundFeatureRankedValue *v25;
  void *v26;
  FHSmartCompoundFeature *v27;
  void *v28;
  FHSmartCompoundFeature *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v47);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v5)
  {
    v30 = v4;
    v31 = v3;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v34 = v4;
    objc_msgSend(v34, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      v32 = *(_QWORD *)v44;
      v33 = a1;
      do
      {
        v9 = 0;
        v35 = v7;
        do
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v9);
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
          {
            v38 = v9;
            v11 = (void *)objc_opt_new();
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v37 = v10;
            objc_msgSend(v34, "objectForKey:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v40;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v40 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                  objc_msgSend(v17, "objectForKey:", CFSTR("featureLabel"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v17, "objectForKey:", CFSTR("featureRank"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "doubleValue");
                  objc_msgSend(v19, "stringWithFormat:", CFSTR("%f"), v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  v23 = [FHSmartCompoundFeatureRankedValue alloc];
                  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithString:", v22);
                  v25 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndRank:featureRank:](v23, "initWithLabelAndRank:featureRank:", v18, v24);
                  objc_msgSend(v11, "addObject:", v25);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              }
              while (v14);
            }

            a1 = v33;
            if (objc_msgSend(v11, "count"))
            {
              v26 = *(void **)(v33 + 40);
              v27 = [FHSmartCompoundFeature alloc];
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[FHSmartCompoundFeature initWithCompoundFeatureKey:smartCompoundFeatures:locale:](v27, "initWithCompoundFeatureKey:smartCompoundFeatures:locale:", v37, v28, *(_QWORD *)(v33 + 48));
              objc_msgSend(v26, "addObject:", v29);

            }
            v8 = v32;
            v7 = v35;
            v9 = v38;
          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v7);
    }

    v4 = v30;
    v3 = v31;
    v5 = 0;
  }

}

- (int64_t)_mostRecentTransactionDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  int64_t v7;

  v3 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", CFSTR("select * from transactions t where t.t_type == %lu and t.t_status == %lu and t.a_type == %d order by t_date desc limit %d"), 0, 1, 2, 1);
  if (objc_msgSend(v3, "next"))
  {
    -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = (uint64_t)v6;

  }
  else
  {
    v7 = -1;
  }
  objc_msgSend(v3, "close");

  return v7;
}

- (int64_t)_startingDateSmartFeatureComputation
{
  if (-[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate") == -1)
    return -1;
  else
    return 0;
}

- (void)computeAllAggregateFeatures
{
  -[FHDatabaseManager _computeAllAggregateFeaturesWithTransactionId:](self, "_computeAllAggregateFeaturesWithTransactionId:", 0);
}

- (void)_computeAllAggregateFeaturesWithTransactionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  FHDatabaseManager *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  FHAmountSmartFeaturesArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke;
  v44[3] = &unk_250C66590;
  v44[4] = self;
  v8 = v5;
  v45 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v44);

  FHDateTimeSmartFeaturesArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v7;
  v42[1] = 3221225472;
  v42[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_2;
  v42[3] = &unk_250C66590;
  v42[4] = self;
  v10 = v8;
  v43 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v42);

  FHMerchantSmartFeaturesArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v7;
  v40[1] = 3221225472;
  v40[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_3;
  v40[3] = &unk_250C66590;
  v40[4] = self;
  v12 = v10;
  v41 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v40);

  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = -[FHDatabaseManager _startingDateSmartFeatureComputation](self, "_startingDateSmartFeatureComputation");
  v15 = -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate");
  FHMultiClassPredictionsSmartFeaturesAsString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("select f.identifier, l.smart_feature_name FHSmartFeatureAggregateType from features_predicted_realtime f inner join features_prediction_labels l on f.feature_name = l.feature_name and l.feature_predicted_class = f.feature_predicted_class where f.identifier in (select t_identifier from transactions where t_date >= %lu and t_date <= %lu and t_fh_internal_state == %lu) and f.feature_name in (%@)"), v14, v15, 2, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "appendFormat:", CFSTR("select simple_features.t_identifier, group_concat(FHSmartFeatureAggregateType, '"));
  objc_msgSend(v18, "appendString:", CFSTR("|||"));
  objc_msgSend(v18, "appendString:", CFSTR("'), compound_features.t_compound_feature_value simple_features from ("));
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" union "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendString:", v21);

  objc_msgSend(v18, "appendString:", CFSTR(") simple_features left join features_compound_realtime compound_features on simple_features.t_identifier = compound_features.t_identifier "));
  if (v4)
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    v23 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ where simple_features.t_identifier == '%@' limit %%d"), v23, v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[FHDatabaseManager _invertFeaturesForTransactions:](self, "_invertFeaturesForTransactions:", v24);
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_153;
    v30[3] = &unk_250C665B8;
    v33 = &v34;
    v25 = v18;
    v31 = v25;
    v32 = self;
    -[FHDatabaseManager streamTransactionsWithLimit:internalState:onTransaction:](self, "streamTransactionsWithLimit:internalState:onTransaction:", -1, 2, v30);
    if (objc_msgSend((id)v35[5], "count"))
    {
      objc_msgSend((id)v35[5], "componentsJoinedByString:", CFSTR(", "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD17C8];
      v28 = (void *)objc_msgSend(v25, "copy");
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ where simple_features.t_identifier in (%@) GROUP BY simple_features.t_identifier limit %%d"), v28, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[FHDatabaseManager _invertFeaturesForTransactions:](self, "_invertFeaturesForTransactions:", v29);
    }

    _Block_object_dispose(&v34, 8);
  }

}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getFHSmartFeatureByAmountType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "comparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "amount");
  objc_msgSend(v3, "processingWindowStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  objc_msgSend(v3, "processingWindowEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  if (v4)
  {
    v12 = (void *)MEMORY[0x23B865790]();
    v13 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where t_amount %@ %lu"), v15, (unint64_t)v8, (unint64_t)v11, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_autoreleasePoolPop(v12);
  }

}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getFHSmartFeatureByDateTimeType:", v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = (unint64_t)v5;

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = (unint64_t)v8;

  objc_msgSend(v3, "processingWindowStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = (unint64_t)v11;

  objc_msgSend(v3, "processingWindowEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = (unint64_t)v14;

  v16 = (void *)MEMORY[0x23B865790]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where t_date >= %lu and t_date <= %lu and a_type == %d"), v18, v12, v15, v6, v9, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

  objc_autoreleasePoolPop(v16);
}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getFHSmartFeatureByMerchantType:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processingWindowStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = (unint64_t)v5;

  objc_msgSend(v3, "processingWindowEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = (unint64_t)v8;

  v10 = (void *)MEMORY[0x23B865790]();
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "merchantDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("select t_identifier, '%@,%lu,%lu' FHSmartFeatureAggregateType from transactions where m_displayname == \"%@\"), v14, v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  objc_autoreleasePoolPop(v10);

}

void __67__FHDatabaseManager__computeAllAggregateFeaturesWithTransactionId___block_invoke_153(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") == 5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "componentsJoinedByString:", CFSTR(", "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ where simple_features.t_identifier in (%@) GROUP BY simple_features.t_identifier limit %%d"), v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_invertFeaturesForTransactions:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");

  }
  if (!objc_msgSend(v12, "transactionType")
    && objc_msgSend(v12, "transactionStatus") == 1
    && objc_msgSend(v12, "accountType") == 2)
  {
    v7 = (void *)MEMORY[0x23B865790]();
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("'%@'"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    objc_autoreleasePoolPop(v7);
  }

}

- (void)_invertFeaturesForTransactions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  uint32_t v23;
  id v24;
  void *context;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FHDatabaseManager _lockFreeFetch:](self, "_lockFreeFetch:", v4, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "next"))
  {
    while (1)
    {
      v6 = (void *)MEMORY[0x23B865790]();
      objc_msgSend(v5, "stringAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _getTransactionByIdentifier:](self, "_getTransactionByIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "transactionType")
        || objc_msgSend(v8, "transactionStatus") != 1
        || objc_msgSend(v8, "accountType") != 2)
      {
        goto LABEL_18;
      }
      context = (void *)MEMORY[0x23B865790]();
      v9 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v5, "stringAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("|||"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[FHDatabaseManager _getDisputeFeaturesForTransaction:](self, "_getDisputeFeaturesForTransaction:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      objc_msgSend(v5, "stringAtIndex:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (objc_msgSend(v12, "count") || v15)
          break;
      }
LABEL_17:

      objc_autoreleasePoolPop(context);
LABEL_18:

      objc_autoreleasePoolPop(v6);
      if ((objc_msgSend(v5, "next") & 1) == 0)
        goto LABEL_19;
    }
    v24 = v4;
    objc_msgSend(v8, "financeTransactionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FHDatabaseManager _insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:](self, "_insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:", v12, v15, v7, v16);

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEBUG;
        v22 = "_insertOrUpdateTransactionFeatures success";
        v23 = 2;
LABEL_15:
        _os_log_impl(&dword_23B4A2000, v20, v21, v22, buf, v23);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      v20 = v19;
      v21 = OS_LOG_TYPE_ERROR;
      v22 = "_insertOrUpdateTransactionFeatures fails for transactionID %@";
      v23 = 12;
      goto LABEL_15;
    }

    v4 = v24;
    goto LABEL_17;
  }
LABEL_19:
  objc_msgSend(v5, "close");

}

- (void)clearCardProcessingHistory
{
  FHDatabaseEntity *v2;
  id v3;
  FHDatabaseEntity *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  id location;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = [FHDatabaseEntity alloc];
  v3 = objc_loadWeakRetained(&location);
  v4 = -[FHDatabaseEntity initWithEntity:databaseManager:](v2, "initWithEntity:databaseManager:", CFSTR("fh_processing_history"), v3);

  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", &__block_literal_global_162);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v4, "clearDataWithClauseBuilder:", v5);
  FinHealthLogObject(CFSTR("FinHealthClient"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("Failed to perform");
    if (v6)
      v8 = CFSTR("Successfully performed operation");
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = CFSTR("FHSmartFeatureCompoundTypePointsOfInterest");
    _os_log_impl(&dword_23B4A2000, v7, OS_LOG_TYPE_DEBUG, "%@: delete all card processing history records of feature %@", buf, 0x16u);
  }

  objc_destroyWeak(&location);
}

uint64_t __47__FHDatabaseManager_clearCardProcessingHistory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("fh_processing_history.feature_name"), CFSTR("FHSmartFeatureCompoundTypePointsOfInterest"));
}

- (BOOL)_insertOrUpdateTransactionFeatures:(id)a3 compoundFeatures:(id)a4 transactionID:(id)a5 financeTransactionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  BOOL v30;
  id v32;
  id v33;
  FHDatabaseManager *v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
    goto LABEL_13;
  v33 = v11;
  objc_msgSend(v10, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("|"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)-[PQLConnection fetch:](self->_db, "fetch:", CFSTR("select t_features, t_compound_features, locale from transaction_features where t_identifier == %@"), v12);
  v34 = self;
  if (!objc_msgSend(v16, "next"))
  {
    v26 = v33;
    goto LABEL_11;
  }
  v32 = v11;
  v17 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v16, "stringAtIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("|"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  FHRepeatingAggregateFeatureSet();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "intersectsSet:", v21))
    goto LABEL_6;
  FHRepeatingAggregateFeatureSet();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v10, "intersectsSet:", v22);

  if (v23)
  {
    FHRepeatingAggregateFeatureSet();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minusSet:", v21);
LABEL_6:

  }
  objc_msgSend(v20, "unionSet:", v10);
  objc_msgSend(v20, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR("|"));
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = v33;
  if (!v33)
  {
    objc_msgSend(v16, "stringAtIndex:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v15 = (void *)v25;
  v11 = v32;
LABEL_11:
  objc_msgSend(v16, "close");
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localeIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[FHDatabaseManager _execute:](v34, "_execute:", CFSTR("insert or replace into transaction_features (t_identifier, t_features, t_compound_features, locale, t_mark_for_delete, t_finance_transaction_id) values (%@, %@, %@, %@, %d, %@)"), v12, v15, v26, v28, 0, v13);

  if (!v29)
  {
LABEL_13:
    v30 = 0;
    goto LABEL_14;
  }
  v30 = 1;
LABEL_14:

  return v30;
}

- (id)getTransactionSmartFeaturesForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  char v16;
  unint64_t transactionFeaturesOffset;
  void *v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  FHApplications();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    FHApplicationToTagsMapping();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("featuresWithIds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[FHDatabaseManager getTransactionSmartFeaturesForApplication:]";
      v38 = 2112;
      v39 = v4;
      v40 = 2112;
      v41 = (uint64_t)v10;
      _os_log_impl(&dword_23B4A2000, v11, OS_LOG_TYPE_DEBUG, "%s Application[%@] is asking for tags with transaction ids: %@", buf, 0x20u);
    }

    v12 = (void *)MEMORY[0x24BDD1758];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke;
    v33[3] = &unk_250C66620;
    v27 = v10;
    v28 = v4;
    v34 = v27;
    v13 = v4;
    v35 = v13;
    objc_msgSend(v12, "predicateWithBlock:", v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:", CFSTR("Search")))
      self->_transactionFeaturesOffset = 0;
    objc_msgSend(v5, "addObjectsFromArray:", self->_transactionFeaturesCache);
    -[NSMutableArray removeAllObjects](self->_transactionFeaturesCache, "removeAllObjects");
    v14 = 0;
    while (1)
    {
      v15 = objc_msgSend(v5, "count");
      if (v15 >= 0x64)
        break;
      v16 = objc_msgSend(v13, "isEqualToString:", CFSTR("Search"));
      transactionFeaturesOffset = self->_transactionFeaturesOffset;
      if ((v16 & 1) != 0)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select t_identifier, t_features, t_compound_features, locale from transaction_features where t_mark_for_delete = %d limit %d offset %d"), 0, 100, transactionFeaturesOffset);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select t_identifier, t_features, t_compound_features, locale from transaction_features limit %d offset %d"), 100, transactionFeaturesOffset, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke_2;
      v30[3] = &unk_250C66648;
      v30[4] = self;
      v31 = v13;
      v32 = v5;
      v19 = -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v30, v29, v18);
      self->_transactionFeaturesOffset += v19;

      v14 = v18;
      if (!v19)
        goto LABEL_15;
    }
    v18 = v14;
LABEL_15:
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(v5, "count");
      v23 = self->_transactionFeaturesOffset;
      v24 = CFSTR("True");
      *(_DWORD *)buf = 136316418;
      v37 = "-[FHDatabaseManager getTransactionSmartFeaturesForApplication:]";
      if (v15 < 0x64)
        v24 = CFSTR("False");
      v38 = 2112;
      v39 = v13;
      v40 = 2048;
      v41 = v22;
      v42 = 2112;
      v43 = v24;
      v44 = 2048;
      v45 = v23;
      v46 = 2112;
      v47 = v5;
      _os_log_impl(&dword_23B4A2000, v21, OS_LOG_TYPE_DEBUG, "%s Transaction features for Application[%@] count[%lu] moreComing[%@] scanOffset[%lu] :%@", buf, 0x3Eu);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v4 = v28;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v15 = a1;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(v3, "objectForKey:", CFSTR("t_features"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsString:", v9))
        {

LABEL_13:
          v13 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v3, "objectForKey:", CFSTR("t_compound_features"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsString:", v9);

        if ((v12 & 1) != 0)
          goto LABEL_13;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      a1 = v15;
      if (v6)
        continue;
      break;
    }
  }

  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Search")))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("t_features"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqualToString:", &stru_250C67C70);
LABEL_14:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __63__FHDatabaseManager_getTransactionSmartFeaturesForApplication___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_createFeatureResponseFromFeatures:compoundFeatures:locale:forTxnID:forApplication:", v6, v8, v10, v12, *(_QWORD *)(a1 + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (id *)(a1 + 48);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= 0x64)
    v13 = (id *)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(*v13, "addObject:", v14);

}

- (BOOL)updateDeleteFlagInTransactionFeatures:(unint64_t)a3 forID:(id)a4
{
  return -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("update transaction_features set t_mark_for_delete = %d where t_identifier == %@"), a3, a4);
}

- (BOOL)deleteAllMarkedTransactionFeatures
{
  FHDatabaseEntity *v2;
  id v3;
  FHDatabaseEntity *v4;
  void *v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  v2 = [FHDatabaseEntity alloc];
  v3 = objc_loadWeakRetained(&location);
  v4 = -[FHDatabaseEntity initWithEntity:databaseManager:](v2, "initWithEntity:databaseManager:", CFSTR("transaction_features"), v3);

  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", &__block_literal_global_176);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v4, "clearDataWithClauseBuilder:", v5);

  objc_destroyWeak(&location);
  return v6;
}

uint64_t __55__FHDatabaseManager_deleteAllMarkedTransactionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIntegerClause:fieldName:expression:", CFSTR("=="), CFSTR("transaction_features.t_mark_for_delete"), 1);
}

- (BOOL)deleteAllRecordsInTransactionFeatures:(id)a3
{
  return -[FHDatabaseManager deleteWithSQL:](self, "deleteWithSQL:", CFSTR("delete from transaction_features where t_identifier in (select t_identifier from transactions t where t.t_source_identifier == %@)"), a3);
}

- (BOOL)deleteAllRecordsFromTransactionFeatures
{
  FHDatabaseEntity *v2;
  BOOL v3;

  v2 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("transaction_features"), self);
  v3 = -[FHDatabaseEntity clearData](v2, "clearData");

  return v3;
}

- (BOOL)deleteTaggedButDeletedEvent:(id)a3
{
  id v4;
  FHDatabaseEntity *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("features_events"), self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__FHDatabaseManager_deleteTaggedButDeletedEvent___block_invoke;
  v10[3] = &unk_250C664F0;
  v11 = v4;
  v6 = v4;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v5, "clearDataWithClauseBuilder:", v7);

  return v8;
}

uint64_t __49__FHDatabaseManager_deleteTaggedButDeletedEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addStringClause:fieldName:expression:", CFSTR("=="), CFSTR("features_events.e_identifier"), *(_QWORD *)(a1 + 32));
}

- (BOOL)deleteTaggedEventsInTimeRange:(id)a3 startDate:(id)a4 comparatorOfEndDate:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FHDatabaseEntity *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[FHDatabaseEntity initWithEntity:databaseManager:]([FHDatabaseEntity alloc], "initWithEntity:databaseManager:", CFSTR("features_events"), self);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __89__FHDatabaseManager_deleteTaggedEventsInTimeRange_startDate_comparatorOfEndDate_endDate___block_invoke;
  v25 = &unk_250C66690;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  +[FHDatabaseClauseFromBuilder initWithBuilder:](FHDatabaseClauseFromBuilder, "initWithBuilder:", &v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[FHDatabaseEntity clearDataWithClauseBuilder:](v14, "clearDataWithClauseBuilder:", v19, v22, v23, v24, v25);

  return v20;
}

void __89__FHDatabaseManager_deleteTaggedEventsInTimeRange_startDate_comparatorOfEndDate_endDate___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "addDateClause:fieldName:expression:", v3, CFSTR("features_events.start_date"), v4);
  objc_msgSend(v5, "addDateClause:fieldName:expression:", a1[6], CFSTR("features_events.end_date"), a1[7]);

}

- (void)computeRecurringClassesWithMerchantCounts:(id)a3 peerPaymentCounts:(id)a4 merchantDetailedCategoryCounts:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  FHRealtimeFeaturesResponse *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[7];
  _QWORD v81[5];
  NSDecimalNumber *v82;
  uint8_t buf[8];
  uint8_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  NSDecimalNumber *v88;
  uint8_t v89[4];
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v11 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4A2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "processAggregateFeatures:computeRecurringHistograms", ", buf, 2u);
  }

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B4A2000, v14, OS_LOG_TYPE_INFO, "BEGIN \"processAggregateFeatures:computeRecurringHistograms\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v84 = buf;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy_;
  v87 = __Block_byref_object_dispose_;
  v88 = self->_decimalRmseThreshold;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy_;
  v81[4] = __Block_byref_object_dispose_;
  v82 = self->_secondsInDay;
  v15 = MEMORY[0x24BDAC760];
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke;
  v80[3] = &unk_250C66748;
  v80[5] = buf;
  v80[6] = v81;
  v80[4] = self;
  v42 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23B865904](v80);
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy_;
  v78 = __Block_byref_object_dispose_;
  v79 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy_;
  v72 = __Block_byref_object_dispose_;
  v73 = (id)objc_opt_new();
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy_;
  v66 = __Block_byref_object_dispose_;
  v67 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v40 = (void *)objc_opt_new();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = (void *)objc_opt_new();
  objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_194);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v15;
  v47[1] = 3221225472;
  v47[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2_195;
  v47[3] = &unk_250C667B0;
  v47[4] = self;
  v36 = v9;
  v48 = v36;
  v52 = &v74;
  v38 = v16;
  v49 = v38;
  v53 = &v62;
  v37 = v10;
  v50 = v37;
  v54 = &v56;
  v55 = &v68;
  v35 = v8;
  v51 = v35;
  -[FHDatabaseManager streamTransactionsWithLimit:internalState:onTransaction:](self, "streamTransactionsWithLimit:internalState:onTransaction:", -1, 2, v47);
  v42[2](v42, v75[5], v69[5]);
  objc_msgSend((id)v75[5], "removeAllObjects");
  if (objc_msgSend((id)v63[5], "count"))
  {
    ((void (**)(_QWORD, uint64_t, void *))v42)[2](v42, v63[5], v40);
    objc_msgSend((id)v63[5], "removeAllObjects");
  }
  ((void (**)(_QWORD, uint64_t, void *))v42)[2](v42, v57[5], v41);
  objc_msgSend((id)v57[5], "removeAllObjects");
  -[FHDatabaseManager _getTransactionsMarkedForRecurrChange](self, "_getTransactionsMarkedForRecurrChange");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v91, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v22 = objc_alloc_init(FHRealtimeFeaturesResponse);
        v23 = objc_alloc(MEMORY[0x24BDBCED8]);
        -[FHDatabaseManager compoundFeaturesForTransaction:](self, "compoundFeaturesForTransaction:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

        objc_msgSend(v17, "objectForKey:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("FHSmartFeatureCompoundTypeRecurringChange"));
        -[FHRealtimeFeaturesResponse setSmartCompoundFeatures:](v22, "setSmartCompoundFeatures:", v25);
        if (-[FHDatabaseManager insertFeaturesCompoundRealtime:realtimeFeatures:](self, "insertFeaturesCompoundRealtime:realtimeFeatures:", v21, v22))
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            goto LABEL_19;
          *(_DWORD *)v89 = 138412290;
          v90 = v26;
          v28 = v27;
          v29 = OS_LOG_TYPE_DEBUG;
          v30 = "insertSuccess: smartFeatureValues: %@";
        }
        else
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          *(_DWORD *)v89 = 138412290;
          v90 = v26;
          v28 = v27;
          v29 = OS_LOG_TYPE_ERROR;
          v30 = "insertFailure smartFeatureValues: %@";
        }
        _os_log_impl(&dword_23B4A2000, v28, v29, v30, v89, 0xCu);
LABEL_19:

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v91, 16);
    }
    while (v18);
  }

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v31 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_signpost_id_make_with_pointer(v32, self);

  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v89 = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4A2000, v31, OS_SIGNPOST_INTERVAL_END, v33, "processAggregateFeatures:computeRecurringHistograms", ", v89, 2u);
  }

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v89 = 0;
    _os_log_impl(&dword_23B4A2000, v34, OS_LOG_TYPE_INFO, "END \"processAggregateFeatures:computeRecurringHistograms\", v89, 2u);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(buf, 8);

}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2;
  v7[3] = &unk_250C66720;
  v9 = *(_OWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_186);
  if ((unint64_t)objc_msgSend(v6, "count") >= 3)
  {
    v7 = (void *)MEMORY[0x23B865790]();
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_4;
    v13[3] = &unk_250C666F8;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    v16 = v5;
    v17 = *(id *)(a1 + 40);
    +[FinHealthRecurringHelper rootMeanSquareErrorForSlidingWindowWithCompletion:slidingWindowWidth:decimalThreshold:decimalDenominator:decimalKeyEntry:completion:](FinHealthRecurringHelper, "rootMeanSquareErrorForSlidingWindowWithCompletion:slidingWindowWidth:decimalThreshold:decimalDenominator:decimalKeyEntry:completion:", v8, 3, v9, v10, CFSTR("transactionDate"), v13);

    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKey:", CFSTR("repeatingClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("repeatingClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "intValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("transactionDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKey:", CFSTR("transactionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = (double)((int)a2 - (uint64_t)(int)v6);
  if ((_DWORD)a2 == (_DWORD)v6)
    return (uint64_t)(v13 - v10);
  return (uint64_t)v14;
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  FHRealtimeFeaturesResponse *v18;
  NSObject *v19;
  id v20;
  void *context;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v5 = 3;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x23B865790]();
    objc_msgSend(v6, "objectForKey:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("transactionDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v6, "objectForKey:", CFSTR("repeatingClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v20, "doubleValue");
    if ((objc_msgSend(v13, "_execute:", CFSTR("insert or replace into features_heuristics (t_identifier, t_heuristics_identifier, t_heuristics_value, t_heuristics_score) values (%@, %@, %d, %f)"), v7, v14, (uint64_t)v10, v15) & 1) == 0)
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_ERROR, "FHInsertOrUpdateIntoFeaturesHeuristics failed for %@", buf, 0xCu);
      }

    }
    v17 = v12;
    v18 = objc_alloc_init(FHRealtimeFeaturesResponse);
    -[FHRealtimeFeaturesResponse setRepeatingPatternClass:](v18, "setRepeatingPatternClass:", v17);
    if ((objc_msgSend(*(id *)(a1 + 40), "insertFeaturesPredictedRealtime:realtimeFeatures:", v7, v18) & 1) == 0)
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_23B4A2000, v19, OS_LOG_TYPE_ERROR, "FHInsertIntoFeaturesPredictedRealTime failed for %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

    objc_autoreleasePoolPop(context);
    ++a2;
    --v5;
  }
  while (v5);

}

BOOL __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_192(uint64_t a1, uint64_t a2, void *a3)
{
  return (unint64_t)objc_msgSend(a3, "integerValue") >= 3;
}

void __112__FHDatabaseManager_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts___block_invoke_2_195(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  FHRealtimeFeaturesResponse *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23B865790]();
  objc_msgSend(*(id *)(a1 + 32), "populateRecurringClassHistogramsWithPeerPaymentsCounts:histogram:transaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v3);
  objc_autoreleasePoolPop(v4);
  v5 = *(void **)(a1 + 48);
  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 32), "populateMerchantRecurringClassHistograms:transaction:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v3);
  if (_os_feature_enabled_impl())
  {
    v7 = (void *)MEMORY[0x23B865790]();
    objc_msgSend(*(id *)(a1 + 32), "populateRecurringClassHistogramsWithMerchantDetailedCategoryCounts:histogram:transaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v3);
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(v3, "displayName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v3, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") && !objc_msgSend(v3, "transactionType"))
    {
      v11 = objc_msgSend(v3, "transactionStatus");

      if (v11 == 1)
      {
        v12 = (void *)MEMORY[0x23B865790]();
        objc_msgSend(v3, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(v3, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v15, "integerValue") >= 3)
            v16 = 1;
          else
            v16 = 2;

          v17 = objc_alloc_init(FHRealtimeFeaturesResponse);
          -[FHRealtimeFeaturesResponse setRepeatingPatternClass:](v17, "setRepeatingPatternClass:", v16);
          if ((objc_msgSend(*(id *)(a1 + 32), "insertFeaturesPredictedRealtime:realtimeFeatures:", v13, v17) & 1) == 0)
          {
            FinHealthLogObject(CFSTR("FinHealthCore"));
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = 138412290;
              v20 = v13;
              _os_log_impl(&dword_23B4A2000, v18, OS_LOG_TYPE_ERROR, "FHInsertIntoFeaturesPredictedRealTime failed for %@", (uint8_t *)&v19, 0xCu);
            }

          }
        }

        objc_autoreleasePoolPop(v12);
      }
    }
    else
    {

    }
  }

}

- (void)populateRecurringClassHistogramsWithPeerPaymentsCounts:(id)a3 histogram:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *context;
  void *v31;
  id v32;
  id obj;
  uint64_t v34;
  _QWORD v35[2];
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "peerPaymentCounterpartHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "transactionType") == 3)
  {
    objc_msgSend(v7, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "integerValue") >= 3)
      v12 = objc_msgSend(v9, "recurring") ^ 1;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v9, "accountType") == 1 && objc_msgSend(v9, "transactionType") == 6;
  if ((v12 | v13) == 1)
  {
    v31 = v10;
    v32 = v7;
    context = (void *)MEMORY[0x23B865790]();
    +[FinHealthRecurringHelper histogramKeysForTransaction:](FinHealthRecurringHelper, "histogramKeysForTransaction:", v9);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v14)
    {
      v15 = v14;
      v34 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v17, "featureLabel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "transactionDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          v22 = v21;

          v23 = (void *)MEMORY[0x24BDD1518];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "decimalValue");
          }
          else
          {
            v35[0] = 0;
            v35[1] = 0;
            v36 = 0;
          }
          objc_msgSend(v23, "decimalNumberWithDecimal:", v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v42[0] = v26;
          v41[0] = CFSTR("transactionDate");
          v41[1] = CFSTR("identifier");
          objc_msgSend(v9, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v27;
          v41[2] = CFSTR("repeatingClass");
          objc_msgSend(v17, "featureRank");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42[2] = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v19, "addObject:", v29);
          else
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v29, 0);
          objc_msgSend(v8, "setValue:forKey:", v19, v18);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v15);
    }

    objc_autoreleasePoolPop(context);
    v10 = v31;
    v7 = v32;
  }

}

- (void)populateMerchantRecurringClassHistograms:(id)a3 transaction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  _QWORD v31[2];
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x23B865790]();
  objc_msgSend(v6, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && objc_msgSend(v8, "length")
    && !objc_msgSend(v6, "transactionType")
    && objc_msgSend(v6, "transactionStatus") == 1
    && !objc_msgSend(v6, "transactionSource")
    && (objc_msgSend(v6, "cardType") == 7 || objc_msgSend(v6, "cardType") == 6))
  {
    v27 = v9;
    v28 = v7;
    context = (void *)MEMORY[0x23B865790]();
    +[FinHealthRecurringHelper histogramKeysForTransaction:](FinHealthRecurringHelper, "histogramKeysForTransaction:", v6);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v10)
    {
      v11 = v10;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "featureLabel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "transactionDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v18 = v17;

          v19 = (void *)MEMORY[0x24BDD1518];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "decimalValue");
          }
          else
          {
            v31[0] = 0;
            v31[1] = 0;
            v32 = 0;
          }
          objc_msgSend(v19, "decimalNumberWithDecimal:", v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v38[0] = v22;
          v37[0] = CFSTR("transactionDate");
          v37[1] = CFSTR("identifier");
          objc_msgSend(v6, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v38[1] = v23;
          v37[2] = CFSTR("repeatingClass");
          objc_msgSend(v13, "featureRank");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38[2] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v15, "addObject:", v25);
          else
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v25, 0);
          objc_msgSend(v5, "setValue:forKey:", v15, v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v11);
    }

    objc_autoreleasePoolPop(context);
    v9 = v27;
    v7 = v28;
  }

  objc_autoreleasePoolPop(v7);
}

- (void)populateRecurringClassHistogramsWithMerchantDetailedCategoryCounts:(id)a3 histogram:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *context;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  _QWORD v37[2];
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "merchantDetailedCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "length"))
    {
      if (objc_msgSend(v9, "accountType") == 2
        && !objc_msgSend(v9, "transactionType")
        && objc_msgSend(v9, "transactionStatus") == 1)
      {
        objc_msgSend(v7, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if (v13 >= 3)
        {
          v34 = v7;
          context = (void *)MEMORY[0x23B865790]();
          objc_msgSend(v9, "amount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v11;
          +[FinHealthRecurringHelper histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:", v11, v14, 0, objc_msgSend(v9, "amountFromDatabase"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          obj = v15;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v16)
          {
            v17 = v16;
            v36 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v40 != v36)
                  objc_enumerationMutation(obj);
                v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v19, "featureLabel");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "transactionDate");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "timeIntervalSinceReferenceDate");
                v24 = v23;

                v25 = (void *)MEMORY[0x24BDD1518];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26;
                if (v26)
                {
                  objc_msgSend(v26, "decimalValue");
                }
                else
                {
                  v37[0] = 0;
                  v37[1] = 0;
                  v38 = 0;
                }
                objc_msgSend(v25, "decimalNumberWithDecimal:", v37);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                v44[0] = v28;
                v43[0] = CFSTR("transactionDate");
                v43[1] = CFSTR("identifier");
                objc_msgSend(v9, "identifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v44[1] = v29;
                v43[2] = CFSTR("repeatingClass");
                objc_msgSend(v19, "featureRank");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v44[2] = v30;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                  objc_msgSend(v21, "addObject:", v31);
                else
                  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v31, 0);
                objc_msgSend(v8, "setValue:forKey:", v21, v20);

              }
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
            }
            while (v17);
          }

          objc_autoreleasePoolPop(context);
          v11 = v33;
          v7 = v34;
        }
      }
    }
  }

}

- (void)retrieveAll
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[FHDatabaseManager delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = (id)v3;
    -[FHDatabaseManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_256A31160) & 1) != 0)
    {
      -[FHDatabaseManager delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = 0;
        do
        {
          v8 = (void *)MEMORY[0x23B865790]();
          -[FHDatabaseManager _getAllTransactions:limit:](self, "_getAllTransactions:limit:", v7, 25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHDatabaseManager delegate](self, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "processBatch:", v9);

          v11 = objc_msgSend(v9, "count");
          objc_autoreleasePoolPop(v8);
          v7 += 25;
        }
        while (v11);
      }
    }
    else
    {

    }
  }
}

- (id)_getAllTransactions:(unint64_t)a3 limit:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = (void *)objc_opt_new();
  -[FHDatabaseManager _fetch:](self, "_fetch:", CFSTR("select * from transactions limit %d, %d"), a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "next"))
  {
    do
    {
      -[FHDatabaseManager reconstructTransaction:](self, "reconstructTransaction:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
    while ((objc_msgSend(v8, "next") & 1) != 0);
  }
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v8);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)deleteDatabase:(id *)a3
{
  os_unfair_lock_s *p_lockDatabaseBookKeeping;

  p_lockDatabaseBookKeeping = &self->_lockDatabaseBookKeeping;
  os_unfair_lock_lock(&self->_lockDatabaseBookKeeping);
  -[FHDatabaseManager _rebuildTablesAndIndexes:](self, "_rebuildTablesAndIndexes:", 1);
  os_unfair_lock_unlock(p_lockDatabaseBookKeeping);
  return 1;
}

- (BOOL)_execute:(id)a3
{
  FHDatabaseManager *v3;
  os_unfair_lock_s *p_lockDatabaseExecute;
  id v5;
  uint64_t v7;

  v3 = self;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseExecute);
  LOBYTE(v3) = -[PQLConnection execute:args:](v3->_db, "execute:args:", v5, &v7);

  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return (char)v3;
}

- (BOOL)deleteWithRollBack:(BOOL)a3 SQL:(id)a4 args:(char *)a5
{
  _BOOL4 v6;
  id v8;
  PQLConnection *db;
  int v10;
  PQLConnection *v11;
  char v12;

  v6 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  db = self->_db;
  if (!v6)
  {
    v12 = -[PQLConnection execute:args:](db, "execute:args:", v8, a5);
    goto LABEL_8;
  }
  if (!-[PQLConnection execute:](db, "execute:", CFSTR("BEGIN")))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v10 = -[PQLConnection execute:args:](self->_db, "execute:args:", v8, a5);
  v11 = self->_db;
  if (!v10)
  {
    -[PQLConnection execute:](v11, "execute:", CFSTR("ROLLBACK"));
    goto LABEL_7;
  }
  -[PQLConnection execute:](v11, "execute:", CFSTR("COMMIT"));
  v12 = 1;
LABEL_8:
  os_unfair_lock_unlock(&self->_lockDatabaseExecute);

  return v12;
}

- (BOOL)deleteWithSQL:(id)a3
{
  uint64_t v4;

  return -[FHDatabaseManager deleteWithRollBack:SQL:args:](self, "deleteWithRollBack:SQL:args:", 0, a3, &v4);
}

- (BOOL)executeAsPreparedStatement:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lockDatabaseExecute;
  sqlite3 *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  sqlite3_stmt *v15;
  unint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  __int128 v21;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  ppStmt = 0;
  v9 = (sqlite3 *)-[PQLConnection dbHandle](self->_db, "dbHandle");
  v10 = objc_retainAutorelease(v6);
  if (sqlite3_prepare_v2(v9, (const char *)objc_msgSend(v10, "UTF8String"), -1, &ppStmt, 0))
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_23B4A2000, v11, OS_LOG_TYPE_DEBUG, "Failed to prepare sql statement %@", buf, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      v13 = 0;
      *(_QWORD *)&v12 = 138412802;
      v21 = v12;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v13, v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = ppStmt;
        v16 = v13 + 1;
        v17 = objc_retainAutorelease(v14);
        if (sqlite3_bind_text(v15, v13 + 1, (const char *)objc_msgSend(v17, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            v24 = v10;
            v25 = 2112;
            v26 = v17;
            v27 = 2048;
            v28 = v13;
            _os_log_impl(&dword_23B4A2000, v18, OS_LOG_TYPE_DEBUG, "sql statement %@ failed to bind %@ at index %lu", buf, 0x20u);
          }

        }
        ++v13;
      }
      while (v16 < objc_msgSend(v7, "count"));
    }
    sqlite3_step(ppStmt);
  }
  v19 = sqlite3_finalize(ppStmt);
  os_unfair_lock_unlock(p_lockDatabaseExecute);

  return v19 == 0;
}

- (BOOL)_executeRaw:(id)a3
{
  FHDatabaseManager *v3;
  os_unfair_lock_s *p_lockDatabaseExecute;
  id v5;

  v3 = self;
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseExecute);
  LOBYTE(v3) = -[PQLConnection executeRaw:](v3->_db, "executeRaw:", v5);

  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return (char)v3;
}

- (id)_fetch:(id)a3
{
  os_unfair_lock_s *p_lockDatabaseFetch;
  id v5;
  void *v6;
  uint64_t v8;

  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  v5 = a3;
  os_unfair_lock_lock(p_lockDatabaseFetch);
  v6 = (void *)-[PQLConnection fetch:args:](self->_db, "fetch:args:", v5, &v8);

  return v6;
}

- (id)_fetchv:(id)a3 args:(char *)a4
{
  os_unfair_lock_s *p_lockDatabaseFetch;
  id v7;
  void *v8;

  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  v7 = a3;
  os_unfair_lock_lock(p_lockDatabaseFetch);
  v8 = (void *)-[PQLConnection fetch:args:](self->_db, "fetch:args:", v7, a4);

  return v8;
}

- (id)_lockFreeFetch:(id)a3
{
  uint64_t v4;

  return (id)-[PQLConnection fetch:args:](self->_db, "fetch:args:", a3, &v4);
}

- (void)closeAndUnlock:(id)a3
{
  objc_msgSend(a3, "close");
  os_unfair_lock_unlock(&self->_lockDatabaseFetch);
}

- (BOOL)_isDatabaseCorrupt
{
  os_unfair_lock_s *p_lockDatabaseFetch;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lockDatabaseFetch = &self->_lockDatabaseFetch;
  os_unfair_lock_lock(&self->_lockDatabaseFetch);
  -[FHDatabaseManager _getDataDirectory](self, "_getDataDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("finhealth.db"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = _sqlite3_integrity_check();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v5);
    v12 = 134217984;
    v13 = v10;
    _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_DEBUG, "Integrity check time: %f", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_unlock(p_lockDatabaseFetch);
  return v7 == 11;
}

- (BOOL)_truncateDatabase
{
  os_unfair_lock_s *p_lockDatabaseExecute;
  sqlite3 *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  p_lockDatabaseExecute = &self->_lockDatabaseExecute;
  os_unfair_lock_lock(&self->_lockDatabaseExecute);
  v4 = (sqlite3 *)-[PQLConnection dbHandle](self->_db, "dbHandle");
  v5 = _sqlite3_db_truncate();
  if (v5)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109634;
      v8[1] = v5;
      v9 = 2080;
      v10 = sqlite3_errmsg(v4);
      v11 = 1024;
      v12 = sqlite3_extended_errcode(v4);
      _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_ERROR, "Failed to truncate database %d (%s, %d)", (uint8_t *)v8, 0x18u);
    }

  }
  os_unfair_lock_unlock(p_lockDatabaseExecute);
  return v5 == 0;
}

- (void)_rebuildTablesAndIndexes:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  _BOOL4 v31;
  NSObject *v32;
  const __CFString *v33;
  uint64_t k;
  void *v35;
  BOOL v36;
  _BOOL4 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  const __CFString *v49;
  uint64_t v50;

  v3 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v5 = -[FHDatabaseManager _isEligibleForSchemaMigration](self, "_isEligibleForSchemaMigration");
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v49 = v7;
    _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_DEBUG, "isEligibleForSchemaMigration: %@", buf, 0xCu);
  }

  v37 = v5;
  if (v3 || v5)
  {
    if (-[FHDatabaseManager _isDatabaseCorrupt](self, "_isDatabaseCorrupt"))
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_ERROR, "DB corrupted. Truncating", buf, 2u);
      }

      -[FHDatabaseManager _truncateDatabase](self, "_truncateDatabase");
    }
    v36 = v3;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    DropTablesAndIndexes();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(v9);
          v14 = *(const __CFString **)(*((_QWORD *)&v42 + 1) + 8 * i);
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v14;
            _os_log_impl(&dword_23B4A2000, v15, OS_LOG_TYPE_DEBUG, "sqlExecuteCommand: %@", buf, 0xCu);
          }

          -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v11);
    }

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_INFO, "Recreating database", buf, 2u);
    }

    LOBYTE(v3) = v36;
  }
  -[FHDatabaseManager _instrumentationTableMigration](self, "_instrumentationTableMigration");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("t_identifier"), CFSTR("t_heuristics_identifier"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _checkUniqueConstraints:uniqueConstraintSet:](self, "_checkUniqueConstraints:uniqueConstraintSet:", CFSTR("features_heuristics"), v17);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  CreateTablesAndIndexes();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    v22 = 1;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v22 &= -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v20);
  }
  else
  {
    v22 = 1;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("alter table %@ add column %@ %@;"),
    CFSTR("features_instrumentation"),
    CFSTR("pass_type"),
    CFSTR("integer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v24);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("alter table %@ add column %@ %@;"),
    CFSTR("features_instrumentation"),
    CFSTR("heuristics_identifier"),
    CFSTR("text"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v25);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("alter table %@ add column %@ %@;"),
    CFSTR("features_instrumentation"),
    CFSTR("account_state"),
    CFSTR("integer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _execute:](self, "_execute:", v26);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("alter table %@ add column %@ %@;"),
    CFSTR("features_instrumentation"),
    CFSTR("paid_using_ring"),
    CFSTR("integer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _execute:](self, "_execute:", v27);

  if (v3 || (v37 & v22) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    v30 = (int)v29;

    v31 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert into fh_schema (sch_version_id, sch_upgrade_status, sch_date, sch_getall_status) values (%@, %d, %d, %d)"), CFSTR("10.71"), 2, v30, 0);
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = CFSTR("Fail");
      if (v31)
        v33 = CFSTR("Success");
      *(_DWORD *)buf = 138412290;
      v49 = v33;
      _os_log_impl(&dword_23B4A2000, v32, OS_LOG_TYPE_INFO, "createSchemaVersionRecord: %@", buf, 0xCu);
    }

  }
  for (k = 0; k != 11; ++k)
  {
    FHTransactionRepeatingPatternClassToFHSmartFeature(k);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into features_prediction_labels (feature_name, feature_predicted_class, smart_feature_name) values (%@, %d, %@)"), CFSTR("FHSmartFeatureAggregateTypeRecurring"), k, v35);

  }
}

- (void)_instrumentationTableMigration
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info('%@');"),
    CFSTR("features_instrumentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _fetch:](self, "_fetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "next"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "stringAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("source_identifier"));

      v5 |= v7;
    }
    while ((objc_msgSend(v4, "next") & 1) != 0);
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
        CFSTR("features_instrumentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v8);

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v11 = CFSTR("features_instrumentation");
        _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_DEBUG, "Drop table %@", buf, 0xCu);
      }

    }
  }
  else
  {
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v4);
  }

}

- (void)_checkUniqueConstraints:(id)a3 uniqueConstraintSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA index_info('%@');"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _fetch:](self, "_fetch:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "next") & 1) != 0)
  {
    objc_msgSend(v9, "stringAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v9);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA index_list('%@');"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDatabaseManager _fetch:](self, "_fetch:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      if (objc_msgSend(v12, "next"))
      {
        do
        {
          objc_msgSend(v12, "stringAtIndex:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v7, "containsObject:", v14);

          v13 += v15;
        }
        while ((objc_msgSend(v12, "next") & 1) != 0);
      }
      if (v13 != objc_msgSend(v7, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHDatabaseManager _executeRaw:](self, "_executeRaw:", v16);

        FinHealthLogObject(CFSTR("FinHealthCore"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_23B4A2000, v17, OS_LOG_TYPE_DEBUG, "Drop table %@", buf, 0xCu);
        }

      }
      -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v12);

    }
  }
  else
  {
    -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v9);
  }

}

- (unint64_t)streamGenericSQLFetch:(id)a3 predicate:(id)a4 sqlFetchQuery:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  os_unfair_lock_s *lock;
  os_unfair_lock_t locka;
  void *v27;
  uint64_t v28;

  v8 = (void (**)(id, void *))a3;
  v9 = a4;
  v10 = a5;
  lock = &self->_lockSQLStreaming;
  os_unfair_lock_lock(&self->_lockSQLStreaming);
  v27 = v10;
  -[FHDatabaseManager _fetchv:args:](self, "_fetchv:args:", v10, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "next");
  if ((_DWORD)v12)
  {
    do
    {
      v13 = (void *)MEMORY[0x23B865790](v12);
      v14 = (void *)objc_opt_new();
      v15 = (void *)objc_opt_new();
      if (objc_msgSend(v11, "columns", lock))
      {
        v16 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndex:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
            v18 = (__CFString *)v17;
          else
            v18 = &stru_250C67C70;
          if (v9)
          {
            objc_msgSend(v11, "columnNameAtIndex:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v18, v19);

          }
          objc_msgSend(v14, "addObject:", v18);

          ++v16;
        }
        while (objc_msgSend(v11, "columns") > v16);
      }
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "filteredArrayUsingPredicate:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v22);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v21);
      }

      objc_autoreleasePoolPop(v13);
      v12 = objc_msgSend(v11, "next");
    }
    while ((v12 & 1) != 0);
  }
  v23 = objc_msgSend(v11, "rowNumber", lock);
  -[FHDatabaseManager closeAndUnlock:](self, "closeAndUnlock:", v11);
  os_unfair_lock_unlock(locka);

  return v23;
}

- (unint64_t)streamQueryResults:(id)a3 usingFetchHandler:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__FHDatabaseManager_streamQueryResults_usingFetchHandler___block_invoke;
  v10[3] = &unk_250C667D8;
  v11 = v6;
  v7 = v6;
  v8 = -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v10, 0, a3, 0);

  return v8;
}

uint64_t __58__FHDatabaseManager_streamQueryResults_usingFetchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)processingTimeForFeature:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select feature_processing_date, feature_data from fh_processing_history where feature_name == '%@'"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __46__FHDatabaseManager_processingTimeForFeature___block_invoke;
  v8[3] = &unk_250C66800;
  v8[4] = &v9;
  v8[0] = MEMORY[0x24BDAC760];
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v8, 0, v5, 0);
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__FHDatabaseManager_processingTimeForFeature___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "unsignedIntegerValue");

}

- (id)processingDataForFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select feature_processing_date, feature_data from fh_processing_history where feature_name == '%@'"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __46__FHDatabaseManager_processingDataForFeature___block_invoke;
  v8[3] = &unk_250C66800;
  v8[4] = &v9;
  v8[0] = MEMORY[0x24BDAC760];
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v8, 0, v5, 0);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__FHDatabaseManager_processingDataForFeature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectAtIndex:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)updateProcessingTimeForFeature:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v8 = a3;
  objc_msgSend(v4, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = (unint64_t)v6;

  -[FHDatabaseManager _updateProcessingTimeForFeature:processingDate:data:](self, "_updateProcessingTimeForFeature:processingDate:data:", v8, v7, 0);
}

- (void)updateProcessingTimeForFeature:(id)a3 data:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  unint64_t v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v11 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = (unint64_t)v9;

  -[FHDatabaseManager _updateProcessingTimeForFeature:processingDate:data:](self, "_updateProcessingTimeForFeature:processingDate:data:", v11, v10, v7);
}

- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4
{
  -[FHDatabaseManager _updateProcessingTimeForFeature:processingDate:data:](self, "_updateProcessingTimeForFeature:processingDate:data:", a3, a4, 0);
}

- (void)_updateProcessingTimeForFeature:(id)a3 processingDate:(unint64_t)a4 data:(id)a5
{
  -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into fh_processing_history (feature_name, feature_processing_date, feature_data) values (%@, %lu, %@)"), a3, a4, a5);
}

- (id)_getTransactionsMarkedForRecurrChange
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD v8[5];
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = (id)objc_opt_new();
  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__FHDatabaseManager__getTransactionsMarkedForRecurrChange__block_invoke;
  v8[3] = &unk_250C66828;
  objc_copyWeak(&v14, &location);
  v8[4] = self;
  v10 = v25;
  v11 = v23;
  v12 = v22;
  v13 = &v16;
  v4 = v3;
  v9 = v4;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v8, 0, CFSTR("select distinct t.t_identifier, ifnull(h.t_heuristics_score, -1) from transactions t left join features_heuristics h on t.t_identifier == h.t_identifier order by t.m_displayname asc, t.t_date asc limit %d"), -1);
  v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (void *)objc_msgSend((id)v17[5], "copy");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  return v6;
}

void __58__FHDatabaseManager__getTransactionsMarkedForRecurrChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  FHSmartCompoundFeatureRankedValue *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "getTransactionByIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Price Increase for"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    if (v15)
    {
      objc_msgSend(v15, "displayName");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v9
        && v16
        && objc_msgSend(v9, "length")
        && objc_msgSend(v17, "length")
        && (objc_msgSend(v9, "isEqualToString:", v17) & 1) != 0)
      {
        if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != (double)-1)
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
            *(_DWORD *)buf = 134217984;
            v45 = v19;
            _os_log_impl(&dword_23B4A2000, v18, OS_LOG_TYPE_DEBUG, "previousPreComputedRmseValue: %f", buf, 0xCu);
          }

          objc_msgSend(v8, "transactionDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          v42 = (unint64_t)v21;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "transactionDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeIntervalSinceReferenceDate");
          v40 = (unint64_t)v23;

          v24 = (void *)MEMORY[0x24BDD1518];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (double)(v42 - v40));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "decimalNumberWithString:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "decimalNumberByDividingBy:", v5[3]);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:");
          if (v13 == (double)-1
            && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 3)
          {
            v41 = v26;
            +[FinHealthRecurringHelper rootMeanSquareError:startIndex:arrayLength:](FinHealthRecurringHelper, "rootMeanSquareError:startIndex:arrayLength:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") - 3, 3);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "lessThan:", v5[4]))
            {
              objc_msgSend(v8, "amount");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "amount");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v28;
              objc_msgSend(v28, "decimalNumberBySubtracting:");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v39, "isPositive"))
              {
                v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                v29 = (void *)MEMORY[0x24BDBCE30];
                v36 = v27;
                v30 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndRank:featureRank:]([FHSmartCompoundFeatureRankedValue alloc], "initWithLabelAndRank:featureRank:", v10, v39);
                objc_msgSend(v29, "arrayWithObjects:", v30, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKey:", v31, v7);

                v27 = v36;
              }
              FinHealthLogObject(CFSTR("FinHealthCore"));
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v45 = (const char *)v7;
                v46 = 2112;
                v47 = v39;
                _os_log_impl(&dword_23B4A2000, v32, OS_LOG_TYPE_DEBUG, "currentTransactionId: %@, changeInAmount: %@", buf, 0x16u);
              }

            }
            v26 = v41;
          }

        }
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeAllObjects");
      }

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    v33 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v8;
    v34 = v8;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
LABEL_28:

    goto LABEL_29;
  }
  if (!WeakRetained)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[FHDatabaseManager _getTransactionsMarkedForRecurrChange]_block_invoke";
      _os_log_impl(&dword_23B4A2000, v7, OS_LOG_TYPE_ERROR, "%s strongSelf is nil", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)publishEventsToBiome
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
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
  _QWORD v20[4];
  id v21;
  _BYTE *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v3 = -[FHDatabaseManager processingTimeForFeature:](self, "processingTimeForFeature:", CFSTR("FHProcessingHistoryInstrumentation"));
  v4 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke;
  v29[3] = &unk_250C66800;
  v29[4] = &v30;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v29, 0, CFSTR("select * from features_instrumentation"), 0);
  v5 = v31[3];
  if (v5)
  {
    v6 = v5 - 2592000;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K > %lu AND SELF.%K <= %lu"), CFSTR("tag_click_date"), v5 - 2592000, CFSTR("tag_click_date"), v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v3 != v31[3])
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (uint64_t (*)(uint64_t, uint64_t))v31[3];
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[FHDatabaseManager publishEventsToBiome]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        v35 = v9;
        _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_DEBUG, "[%s] starting instrumentation streaming to Biome: leastRecentInstrumentationEntryDate: %lu, mostRecentInstrumentationEntryDate: %lu", buf, 0x20u);
      }

      -[FHDatabaseManager _updateProcessingTimeForFeature:processingDate:](self, "_updateProcessingTimeForFeature:processingDate:", CFSTR("FHProcessingHistoryInstrumentation"), v31[3]);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v35 = __Block_byref_object_copy_;
      v36 = __Block_byref_object_dispose_;
      BiomeLibrary();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "WalletPaymentsCommerce");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "FinancialInsights");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "Search");
      v37 = (id)objc_claimAutoreleasedReturnValue();

      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy_;
      v27[4] = __Block_byref_object_dispose_;
      BiomeLibrary();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "WalletPaymentsCommerce");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "FinancialInsights");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "PaymentRingSuggestions");
      v28 = (id)objc_claimAutoreleasedReturnValue();

      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = __Block_byref_object_copy_;
      v25[4] = __Block_byref_object_dispose_;
      BiomeLibrary();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "WalletPaymentsCommerce");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "FinancialInsights");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "RecurringSendSuggestions");
      v26 = (id)objc_claimAutoreleasedReturnValue();

      -[FHDatabaseManager getAllPeerPaymentSignalsFilterDismissed:](self, "getAllPeerPaymentSignalsFilterDismissed:", 0);
      v20[0] = v4;
      v20[1] = 3221225472;
      v20[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke_256;
      v20[3] = &unk_250C66878;
      v22 = buf;
      v23 = v27;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v24 = v25;
      -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v20, v7, CFSTR("select * from features_instrumentation"), 0);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[FHDatabaseManager publishEventsToBiome]";
      _os_log_impl(&dword_23B4A2000, v7, OS_LOG_TYPE_DEBUG, "%s No instrumentation records found", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v30, 8);
}

void __41__FHDatabaseManager_publishEventsToBiome__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    v4 = objc_msgSend(v3, "count") == 8;
    v3 = v9;
    if (v4)
    {
      objc_msgSend(v9, "objectAtIndex:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (int)objc_msgSend(v5, "intValue");

      v3 = v9;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(_QWORD *)(v7 + 24);
      if (v8 <= v6)
        v8 = v6;
      *(_QWORD *)(v7 + 24) = v8;
    }
  }

}

void __41__FHDatabaseManager_publishEventsToBiome__block_invoke_256(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[5];
  uint8_t v54[4];
  const char *v55;
  __int16 v56;
  void *v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count") == 8)
  {
    objc_msgSend(v4, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    objc_msgSend(v4, "objectAtIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectAtIndex:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectAtIndex:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == 2 && (int)v6 <= 199)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C840]), "initWithTagSource:tagType:passType:tagClickDate:", v6, v8, 2, v13);
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[FHDatabaseManager publishEventsToBiome]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_23B4A2000, v15, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING search event: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendEvent:", v14);

    }
    else
    {
      if ((v6 - 200) <= 4)
      {
        objc_msgSend(v4, "objectAtIndex:", 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        objc_msgSend(v4, "objectAtIndex:", 7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        objc_msgSend(v4, "objectAtIndex:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        objc_msgSend(v4, "objectAtIndex:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue") - 200;

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C830]), "initWithAccountState:paidUsingRing:lastPaymentCategory:paymentAction:", v18, v20, v22, v24);
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[FHDatabaseManager publishEventsToBiome]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          _os_log_impl(&dword_23B4A2000, v26, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING payment ring event: %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "source");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sendEvent:", v25);

      }
      if (v10 == 1)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v59 = __Block_byref_object_copy_;
        v60 = __Block_byref_object_dispose_;
        objc_msgSend(v4, "objectAtIndex:", 5);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __41__FHDatabaseManager_publishEventsToBiome__block_invoke_259;
        v53[3] = &unk_250C66850;
        v53[4] = buf;
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v53);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceReferenceDate");
        v31 = v30;

        if (objc_msgSend(v28, "count"))
        {
          objc_msgSend(v28, "objectAtIndex:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "periodicCategory");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = FHRecurringPeerPaymentPeriodicCategoryTypeFromString(v33);

          objc_msgSend(v32, "signalDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (unint64_t)v34 - (unint64_t)v31;
          if (v35 <= 0x93A80)
            v36 = 2;
          else
            v36 = 3;
          if (v35 <= 0x3F480)
            v37 = 1;
          else
            v37 = v36;
          objc_msgSend(v4, "objectAtIndex:", 4);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "intValue");

          objc_msgSend(v4, "objectAtIndex:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "intValue");

          v42 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v4, "objectAtIndex:", 3);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "numberWithInt:", objc_msgSend(v43, "intValue"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = objc_msgSend(*(id *)(a1 + 32), "count");
          v46 = objc_alloc(MEMORY[0x24BE0C838]);
          if (v45 <= 1)
            v47 = 1;
          else
            v47 = 2;
          v48 = (void *)objc_msgSend(v46, "initWithUserSelection:passType:tagClickDate:frequency:suggestionsRange:dayRange:", v41, v39, v44, v51, v47, v37);
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v54 = 136315394;
            v55 = "-[FHDatabaseManager publishEventsToBiome]_block_invoke_2";
            v56 = 2112;
            v57 = v48;
            _os_log_impl(&dword_23B4A2000, v49, OS_LOG_TYPE_DEBUG, "%s FH_BIOME_REPORTING recurring send suggestion event: %@", v54, 0x16u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "source");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "sendEvent:", v48);

        }
        _Block_object_dispose(buf, 8);

      }
    }

  }
}

uint64_t __41__FHDatabaseManager_publishEventsToBiome__block_invoke_259(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "peerPaymentHeuristicIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v6;
}

- (void)predictAndPersistCashCardRecurringTransactions
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  void *v55;
  id v56;
  FHDatabaseManager *ptr;
  uint8_t v58[16];
  _QWORD v59[4];
  id v60;
  FHDatabaseManager *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t);
  id v91;
  _QWORD v92[4];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[4];
  _QWORD v102[6];
  uint8_t buf[8];
  uint8_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v3 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v4 = objc_claimAutoreleasedReturnValue();
  ptr = self;
  v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4A2000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "processAggregateFeatures:computeRecurringCashTransactions", ", buf, 2u);
  }

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_INFO, "BEGIN \"processAggregateFeatures:computeRecurringCashTransactions\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v104 = buf;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy_;
  v107 = __Block_byref_object_dispose_;
  v108 = (id)objc_opt_new();
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v7 = 3;
  v89 = 3;
  v8 = MEMORY[0x24BDAC760];
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select identifier from features_predicted_realtime where feature_name='FHSmartFeatureAggregateTypeRecurring' and feature_predicted_class=%d limit %d"), v7, -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x23B865790]();
    v102[0] = v8;
    v102[1] = 3221225472;
    v102[2] = __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke;
    v102[3] = &unk_250C668A0;
    v102[4] = &v86;
    v102[5] = buf;
    -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v102, 0, v9, 0);
    objc_autoreleasePoolPop(v10);

    v7 = v87[3] + 1;
    v87[3] = v7;
  }
  while (v7 < 0xB);
  _Block_object_dispose(&v86, 8);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *((_QWORD *)v104 + 5));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("select * from features_heuristics order by t_heuristics_identifier asc, t_heuristics_value asc"));
  v12 = objc_claimAutoreleasedReturnValue();
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x2020000000;
  v101[3] = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x2020000000;
  v92[3] = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = (uint64_t)__Block_byref_object_copy_;
  v90 = __Block_byref_object_dispose_;
  v91 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy_;
  v84 = __Block_byref_object_dispose_;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy_;
  v78 = __Block_byref_object_dispose_;
  v79 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0x8000000000000000;
  v59[0] = v8;
  v59[1] = 3221225472;
  v59[2] = __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke_2;
  v59[3] = &unk_250C668C8;
  v56 = v11;
  v60 = v56;
  v61 = ptr;
  v62 = &v86;
  v63 = &v74;
  v64 = &v93;
  v65 = &v97;
  v66 = v101;
  v67 = &v70;
  v68 = &v80;
  v69 = v92;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](ptr, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v59, 0, v12, 0);
  v55 = (void *)v12;
  v13 = v98[3];
  v14 = v94[3];
  v15 = objc_msgSend((id)v81[5], "integerValue");
  -[FHDatabaseManager getTransactionByIdentifier:](ptr, "getTransactionByIdentifier:", v75[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v71[3];
  v18 = objc_msgSend(v16, "amountFromDatabase");
  if (v17 <= v18)
    v19 = v18;
  else
    v19 = v17;
  v71[3] = v19;
  v20 = (double)(v13 / v14);
  switch(v15)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 9:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "merchantDetailedCategory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v16, "amountFromDatabase");
      v25 = objc_msgSend(v16, "transactionType");
      v26 = objc_msgSend(v16, "transactionSource");
      objc_msgSend(v16, "transactionDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v21, v22, v23, v24, (double)(v13 / v14), v25, v26, v28 + v20, 4, v87[5]);
      goto LABEL_13;
    case 3:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "peerPaymentCounterpartHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v16, "amountFromDatabase");
      v34 = objc_msgSend(v16, "peerPaymentType");
      objc_msgSend(v16, "transactionDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)"), v21, v22, v33, (double)(v13 / v14), v34, v35 + v20, 3, v87[5]);
      goto LABEL_14;
    case 4:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "peerPaymentCounterpartHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v71[3];
      v37 = objc_msgSend(v16, "peerPaymentType");
      objc_msgSend(v16, "transactionDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)"), v21, v22, v36, *(_QWORD *)&v20, v37, v38 + v20, 2, v87[5]);
      goto LABEL_14;
    case 5:
      v39 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%f"), objc_msgSend(v16, "amountFromDatabase"), (double)(v13 / v14));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v40, "hash"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "transactionSourceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v16, "amountFromDatabase");
      objc_msgSend(v16, "transactionDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)"), v22, v21, v41, (double)(v13 / v14), 0, v42 + v20, 6, v87[5]);
      goto LABEL_14;
    case 7:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "merchantDetailedCategory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v71[3];
      v44 = objc_msgSend(v16, "transactionType");
      v45 = objc_msgSend(v16, "transactionSource");
      objc_msgSend(v16, "transactionDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v21, v22, v23, v43, *(_QWORD *)&v20, v44, v45, v46 + v20, 2, v87[5]);
      goto LABEL_13;
    case 8:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "merchantDetailedCategory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v71[3];
      v48 = objc_msgSend(v16, "transactionType");
      v49 = objc_msgSend(v16, "transactionSource");
      objc_msgSend(v16, "transactionDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v21, v22, v23, v47, *(_QWORD *)&v20, v48, v49, v50 + v20, 1, v87[5]);
      goto LABEL_13;
    case 10:
      objc_msgSend(v16, "transactionSourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "merchantDetailedCategory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v71[3];
      v52 = objc_msgSend(v16, "transactionType");
      v53 = objc_msgSend(v16, "transactionSource");
      objc_msgSend(v16, "transactionDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      -[FHDatabaseManager _execute:](ptr, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v21, v22, v23, v51, *(_QWORD *)&v20, v52, v53, v54 + v20, 3, v87[5]);
LABEL_13:

LABEL_14:
      break;
    default:
      break;
  }
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v29 = objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_signpost_id_make_with_pointer(v30, ptr);

  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)v58 = 0;
    _os_signpost_emit_with_name_impl(&dword_23B4A2000, v29, OS_SIGNPOST_INTERVAL_END, v31, "processAggregateFeatures:computeRecurringCashTransactions", ", v58, 2u);
  }

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_23B4A2000, v32, OS_LOG_TYPE_INFO, "END \"processAggregateFeatures:computeRecurringCashTransactions\", v58, 2u);
  }

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(v92, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(v101, 8);

  _Block_object_dispose(buf, 8);
}

void __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[2];
  int v14;

  objc_msgSend(a2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD1518];
  objc_msgSend(MEMORY[0x24BDD1518], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "decimalValue");
  }
  else
  {
    v13[0] = 0;
    v13[1] = 0;
    v14 = 0;
  }
  objc_msgSend(v5, "decimalNumberWithDecimal:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "maximumDecimalNumber");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (objc_msgSend(v8, "compare:", v12) == -1)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v8, v4);

}

void __67__FHDatabaseManager_predictAndPersistCashCardRecurringTransactions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndex:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v8, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "getTransactionByIdentifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "numberWithInt:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToNumber:", v11);

  if (v12)
  {
    v87 = v5;
    v13 = v3;
    objc_msgSend(v10, "merchantDetailedCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "amount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v10;
    +[FinHealthRecurringHelper histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForMerchantDetailedCategoryTransaction:transactionAmount:transactionType:amountFromDatabase:", v14, v15, 0, objc_msgSend(v10, "amountFromDatabase"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v94 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v22, "featureLabel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isEqualToString:", v7))
          {
            objc_msgSend(v22, "featureRank");
            v24 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v24;
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
      }
      while (v19);
    }

    v3 = v13;
    v5 = v87;
    v10 = v90;
  }
  objc_msgSend(v10, "transactionDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSinceReferenceDate");
  v27 = v26;

  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_QWORD *)(v28 + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "getTransactionByIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "amountFromDatabase");
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqualToString:", v7))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v92
                                                                   - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                               + 24);
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v32 = *(_QWORD *)(v31 + 24);
      if (v32 <= v30)
        v32 = v30;
      *(_QWORD *)(v31 + 24) = v32;
    }
    else
    {
      v91 = v10;
      v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v35 = *(_QWORD *)(v34 + 24);
      *(_QWORD *)(v34 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v36 = (double)(v33 / v35);
      v86 = v3;
      switch(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "integerValue"))
      {
        case 3:
          v37 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "peerPaymentCounterpartHandle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v29, "amountFromDatabase");
          v40 = objc_msgSend(v29, "peerPaymentType");
          objc_msgSend(v29, "transactionDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceReferenceDate");
          v78 = 3;
          v79 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v77 = v42 + v36;
          v76 = v40;
          v74 = v36;
          v71 = v39;
          v72 = v84;
          v70 = v38;
          goto LABEL_22;
        case 4:
          v88 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "peerPaymentCounterpartHandle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v45 = objc_msgSend(v29, "peerPaymentType");
          objc_msgSend(v29, "transactionDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceReferenceDate");
          v73 = v44;
          v38 = (void *)v43;
          objc_msgSend(v88, "_execute:", CFSTR("insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)"), v43, v39, v73, *(_QWORD *)&v36, v45, v46 + v36, 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          goto LABEL_29;
        case 5:
          v50 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%f"), objc_msgSend(v29, "amountFromDatabase"), (double)(v33 / v35));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v51, "hash"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v29, "amountFromDatabase");
          objc_msgSend(v29, "transactionDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceReferenceDate");
          v78 = 6;
          v79 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v77 = v53 + v36;
          v76 = 0;
          v74 = v36;
          v71 = v38;
          v72 = v52;
          v70 = v39;
LABEL_22:
          objc_msgSend(v37, "_execute:", CFSTR("insert or replace into features_peer_payments (source_identifier, peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type, heuristics_identifier) values (%@, %@, %d, %f, %d, %f, %d, %@)"), v70, v71, v72, *(_QWORD *)&v74, v76, *(_QWORD *)&v77, v78, v79);
          goto LABEL_29;
        case 7:
          v89 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v54 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "displayName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "merchantDetailedCategory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v83 = objc_msgSend(v29, "transactionType");
          v81 = objc_msgSend(v29, "transactionSource");
          objc_msgSend(v29, "transactionDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v57 = v56 + v36;
          v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v59 = 2;
          goto LABEL_27;
        case 8:
          v89 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v54 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "displayName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "merchantDetailedCategory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v83 = objc_msgSend(v29, "transactionType");
          v81 = objc_msgSend(v29, "transactionSource");
          objc_msgSend(v29, "transactionDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v57 = v60 + v36;
          v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v59 = 1;
          goto LABEL_27;
        case 9:
          v47 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "displayName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "merchantDetailedCategory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v29, "amountFromDatabase");
          v82 = objc_msgSend(v29, "transactionType");
          v80 = objc_msgSend(v29, "transactionSource");
          objc_msgSend(v29, "transactionDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          objc_msgSend(v47, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v38, v39, v41, v85, *(_QWORD *)&v36, v82, v80, v49 + v36, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          goto LABEL_28;
        case 10:
          v89 = *(void **)(a1 + 40);
          objc_msgSend(v29, "transactionSourceIdentifier");
          v54 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "displayName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "merchantDetailedCategory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v83 = objc_msgSend(v29, "transactionType");
          v81 = objc_msgSend(v29, "transactionSource");
          objc_msgSend(v29, "transactionDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v57 = v61 + v36;
          v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v59 = 3;
LABEL_27:
          v75 = v55;
          v38 = (void *)v54;
          objc_msgSend(v89, "_execute:", CFSTR("insert or replace into fh_card_recurring_predictions (source_identifier, merchant, detailed_category, amount, frequency, transaction_type, transaction_source, forecast_date, forecast_signal_type, heuristic_identifier) values (%@, %@, %@, %d, %f, %d, %d, %f, %d, %@)"), v54, v39, v41, v75, *(_QWORD *)&v36, v83, v81, *(_QWORD *)&v57, v59, v58);
LABEL_28:

LABEL_29:
          v3 = v86;
          break;
        default:
          break;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0x8000000000000000;
      v10 = v91;
    }

    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  v62 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v7;
  v63 = v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v92;
  v64 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v65 = *(void **)(v64 + 40);
  *(_QWORD *)(v64 + 40) = v9;
  v66 = v9;

  v67 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v68 = *(void **)(v67 + 40);
  *(_QWORD *)(v67 + 40) = v5;
  v69 = v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v27;
}

- (id)getFilteredPeerPaymentForecastingSignals
{
  void *v3;
  void *v4;

  -[FHDatabaseManager getAllPeerPaymentSignalsFilterDismissed:](self, "getAllPeerPaymentSignalsFilterDismissed:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager _filterPeriodicCategories:](self, "_filterPeriodicCategories:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_filterPeriodicCategories:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x23B865790]();
        if (objc_msgSend(v10, "forecastingType") == 3)
        {
          v12 = v10;
          v13 = objc_msgSend(v12, "direction");
          objc_msgSend(v12, "frequency");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          GetPeriodicCategoryFromFrequency(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v13) = -[FHDatabaseManager _signalMatchesSendSuggestionCriteria:periodicCategory:](self, "_signalMatchesSendSuggestionCriteria:periodicCategory:", v13, FHRecurringPeerPaymentPeriodicCategoryTypeFromString(v15));

          if ((_DWORD)v13)
            objc_msgSend(v18, "addObject:", v12);

        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

- (BOOL)_signalMatchesSendSuggestionCriteria:(int64_t)a3 periodicCategory:(unint64_t)a4
{
  return a3 == 1 && a4 - 3 < 3;
}

- (id)getAllPeerPaymentSignalsFilterDismissed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FHPeerPaymentForecastingSignalPersonWithAmount *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[6];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v3 = a3;
  v85 = *MEMORY[0x24BDAC8D0];
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy_;
  v79 = __Block_byref_object_dispose_;
  v80 = (id)objc_opt_new();
  v5 = (void *)objc_opt_new();
  if (v3)
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke;
    v74[3] = &unk_250C668A0;
    v74[4] = &v68;
    v74[5] = &v75;
    -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v74, 0, CFSTR("select * from features_instrumentation"), 0);
    _Block_object_dispose(&v68, 8);
  }
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy_;
  v72 = __Block_byref_object_dispose_;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy_;
  v66 = __Block_byref_object_dispose_;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = (id)objc_opt_new();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke_2;
  v17[3] = &unk_250C668F0;
  v19 = &v68;
  v20 = &v29;
  v21 = &v62;
  v22 = v43;
  v23 = &v75;
  v24 = &v39;
  v25 = &v50;
  v26 = &v44;
  v27 = &v56;
  v28 = &v35;
  v6 = v5;
  v18 = v6;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v17, 0, CFSTR("select * from features_peer_payments order by peer_pay_counterpart, amount, frequency, peer_pay_type, forecast_date, forecast_signal_type limit %lu"), -1);
  if (v69[5] && (objc_msgSend((id)v76[5], "containsObject:", v63[5]) & 1) == 0)
  {
    objc_msgSend((id)v30[5], "addObject:", v63[5]);
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = v69[5];
      v9 = v30[5];
      *(_DWORD *)buf = 138412546;
      v82 = v8;
      v83 = 2112;
      v84 = v9;
      _os_log_impl(&dword_23B4A2000, v7, OS_LOG_TYPE_DEBUG, "heuristicIdentifierSetByPeerPaymentHandleAndAmount %@, %@", buf, 0x16u);
    }

    v10 = v40[3];
    switch(v10)
    {
      case 2:
        v11 = objc_alloc_init(FHPeerPaymentForecastingSignalPerson);
        -[FHPeerPaymentForecastingSignalPerson setPersonId:](v11, "setPersonId:", v69[5]);
        -[FHPeerPaymentForecastingSignal setFrequency:](v11, "setFrequency:", v45[5]);
        -[FHPeerPaymentForecastingSignal setSignalDate:](v11, "setSignalDate:", v57[5]);
        -[FHPeerPaymentForecastingSignalPerson setDirection:](v11, "setDirection:", v36[3]);
        v13 = (void *)objc_msgSend((id)v30[5], "copy");
        -[FHPeerPaymentForecastingSignal setPeerPaymentHeuristicIds:](v11, "setPeerPaymentHeuristicIds:", v13);

        objc_msgSend(v6, "addObject:", v11);
        goto LABEL_13;
      case 6:
        v11 = objc_alloc_init(FHPeerPaymentForecastingSignalTopUpWithAmount);
        -[FHPeerPaymentForecastingSignalPersonWithAmount setAmount:](v11, "setAmount:", v51[5]);
        -[FHPeerPaymentForecastingSignal setFrequency:](v11, "setFrequency:", v45[5]);
        -[FHPeerPaymentForecastingSignal setSignalDate:](v11, "setSignalDate:", v57[5]);
        v14 = (void *)objc_msgSend((id)v30[5], "copy");
        -[FHPeerPaymentForecastingSignal setPeerPaymentHeuristicIds:](v11, "setPeerPaymentHeuristicIds:", v14);

        objc_msgSend(v6, "addObject:", v11);
        goto LABEL_13;
      case 3:
        v11 = objc_alloc_init(FHPeerPaymentForecastingSignalPersonWithAmount);
        -[FHPeerPaymentForecastingSignalPerson setPersonId:](v11, "setPersonId:", v69[5]);
        -[FHPeerPaymentForecastingSignalPersonWithAmount setAmount:](v11, "setAmount:", v51[5]);
        -[FHPeerPaymentForecastingSignal setFrequency:](v11, "setFrequency:", v45[5]);
        -[FHPeerPaymentForecastingSignal setSignalDate:](v11, "setSignalDate:", v57[5]);
        -[FHPeerPaymentForecastingSignalPerson setDirection:](v11, "setDirection:", v36[3]);
        v12 = (void *)objc_msgSend((id)v30[5], "copy");
        -[FHPeerPaymentForecastingSignal setPeerPaymentHeuristicIds:](v11, "setPeerPaymentHeuristicIds:", v12);

        objc_msgSend(v6, "addObject:", v11);
LABEL_13:

        break;
    }
  }
  v15 = (void *)objc_msgSend(v6, "copy");

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v75, 8);
  return v15;
}

void __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x23B865790]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "unsignedIntAtIndex:", 4);
  objc_msgSend(v9, "stringAtIndex:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 1 || v4 == 0;
  if (!v6 && (unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v9, "stringAtIndex:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_autoreleasePoolPop(v3);

}

void __61__FHDatabaseManager_getAllPeerPaymentSignalsFilterDismissed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  FHPeerPaymentForecastingSignalPersonWithAmount *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *context;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  context = (void *)MEMORY[0x23B865790]();
  objc_msgSend(v3, "stringAtIndex:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "objectAtIndex:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (int)objc_msgSend(v3, "intAtIndex:", 3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", v8);
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberByDividingBy:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDD1518]);
  objc_msgSend(v3, "objectAtIndex:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v38 = objc_msgSend(v12, "initWithDouble:");

  v14 = objc_msgSend(v3, "unsignedIntAtIndex:", 5);
  v15 = objc_msgSend(v3, "unsignedIntAtIndex:", 7);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if ((!objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))|| *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != v8)&& (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v42 = v17;
        v43 = 2112;
        v44 = v18;
        _os_log_impl(&dword_23B4A2000, v16, OS_LOG_TYPE_DEBUG, "heuristicIdentifierByPeerPaymentHandleAndAmount %@, %@", buf, 0x16u);
      }

      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      switch(v19)
      {
        case 2:
          v20 = objc_alloc_init(FHPeerPaymentForecastingSignalPerson);
          -[FHPeerPaymentForecastingSignalPerson setPersonId:](v20, "setPersonId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          break;
        case 6:
          v20 = objc_alloc_init(FHPeerPaymentForecastingSignalTopUpWithAmount);
          -[FHPeerPaymentForecastingSignalPersonWithAmount setAmount:](v20, "setAmount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
          -[FHPeerPaymentForecastingSignal setFrequency:](v20, "setFrequency:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
          -[FHPeerPaymentForecastingSignal setSignalDate:](v20, "setSignalDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          goto LABEL_14;
        case 3:
          v20 = objc_alloc_init(FHPeerPaymentForecastingSignalPersonWithAmount);
          -[FHPeerPaymentForecastingSignalPerson setPersonId:](v20, "setPersonId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          -[FHPeerPaymentForecastingSignalPersonWithAmount setAmount:](v20, "setAmount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
          break;
        default:
LABEL_15:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
          goto LABEL_16;
      }
      -[FHPeerPaymentForecastingSignal setFrequency:](v20, "setFrequency:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      -[FHPeerPaymentForecastingSignal setSignalDate:](v20, "setSignalDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      -[FHPeerPaymentForecastingSignalPerson setDirection:](v20, "setDirection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
LABEL_14:
      v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
      -[FHPeerPaymentForecastingSignal setPeerPaymentHeuristicIds:](v20, "setPeerPaymentHeuristicIds:", v21);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);
      goto LABEL_15;
    }
  }
LABEL_16:
  v22 = v15;
  v23 = v14;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v4;
  v26 = v4;

  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v5;
  v29 = v5;

  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v39;
  v32 = v39;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v8;
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v11;
  v35 = v11;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v23;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v22;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v38;

  objc_autoreleasePoolPop(context);
}

- (id)getExpectedWeeklySpend
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseManager getAllPeerPaymentSignalsFilterDismissed:](self, "getAllPeerPaymentSignalsFilterDismissed:", 0);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v32 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x23B865790]();
        v12 = objc_msgSend(v10, "forecastingType");
        objc_msgSend(v10, "signalDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12 == 6)
        {
          objc_msgSend(v13, "timeIntervalSinceDate:", v4);
          if (v25 > 0.0)
          {
            objc_msgSend(v4, "dateByAddingTimeInterval:", (double)0x93A80uLL);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "timeIntervalSinceDate:", v14);
            v28 = v27;

            if (v28 > 0.0)
            {
              v22 = v10;
              objc_msgSend(v22, "amount");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              v23 = v3;
              v24 = v20;
LABEL_16:
              objc_msgSend(v23, "decimalNumberByAdding:", v24);
              v29 = objc_claimAutoreleasedReturnValue();
LABEL_18:
              v19 = (void *)v29;

              goto LABEL_19;
            }
          }
        }
        else if (v12 == 3)
        {
          objc_msgSend(v13, "timeIntervalSinceDate:", v4);
          if (v15 > 0.0)
          {
            objc_msgSend(v4, "dateByAddingTimeInterval:", (double)0x93A80uLL);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceDate:", v14);
            v18 = v17;

            if (v18 > 0.0)
            {
              v19 = v3;
              v20 = v10;
              v21 = objc_msgSend(v20, "direction");
              objc_msgSend(v20, "amount");
              v22 = (id)objc_claimAutoreleasedReturnValue();
              if (v21 == 1)
              {
                v3 = v19;
                objc_msgSend(v19, "decimalNumberBySubtracting:", v22);
                v29 = objc_claimAutoreleasedReturnValue();
                goto LABEL_18;
              }
              if (v21 == 2)
              {
                v3 = v19;
                v23 = v19;
                v24 = v22;
                goto LABEL_16;
              }
LABEL_19:
              v3 = v19;

              v5 = v32;
            }
          }
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  v30 = v3;
  return v30;
}

- (BOOL)recordPeerPaymentForecastingStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v31;
  id obj;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", 100);
  objc_msgSend(v8, "decimalNumberByMultiplyingBy:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");

  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218498;
      v41 = a3;
      v42 = 2112;
      v43 = v7;
      v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_23B4A2000, v13, OS_LOG_TYPE_DEBUG, "Recurring peer payment setup={FHPeerPaymentSuggestionStatusType: %lu, counterpartHandle: %@, Amount: %@}", buf, 0x20u);
    }

    +[FinHealthRecurringHelper histogramKeysForPeerPaymentTransaction:transactionAmount:transactionPeerPaymentSubtype:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForPeerPaymentTransaction:transactionAmount:transactionPeerPaymentSubtype:amountFromDatabase:", v7, v8, 1, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218242;
      v41 = a3;
      v42 = 2112;
      v43 = v8;
      _os_log_impl(&dword_23B4A2000, v13, OS_LOG_TYPE_DEBUG, "Threshold based top up setup={FHPeerPaymentSuggestionStatusType: %lu, Amount: %@}", buf, 0x16u);
    }

    +[FinHealthRecurringHelper histogramKeysForTopUpTransaction:amountFromDatabase:](FinHealthRecurringHelper, "histogramKeysForTopUpTransaction:amountFromDatabase:", v8, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = (void *)objc_msgSend(v15, "copy");

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v41 = (unint64_t)v17;
    _os_log_impl(&dword_23B4A2000, v18, OS_LOG_TYPE_DEBUG, "Forecasting signal uniqueHistogramIds=%@", buf, 0xCu);
  }

  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v17;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v20)
  {
    v21 = v20;
    v31 = v8;
    v33 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v19, "removeAllObjects");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v24, CFSTR("TagType"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v25, CFSTR("PassType"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 101);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v26, CFSTR("Source"));

        objc_msgSend(v23, "featureLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v27, CFSTR("HeuristicIdentifier"));

        v28 = (void *)objc_msgSend(v19, "copy");
        LODWORD(v26) = -[FHDatabaseManager insertInstrumentationRecord:](self, "insertInstrumentationRecord:", v28);

        if (!(_DWORD)v26)
        {
          v29 = 0;
          goto LABEL_20;
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v21)
        continue;
      break;
    }
    v29 = 1;
LABEL_20:
    v8 = v31;
  }
  else
  {
    v29 = 1;
  }

  return v29;
}

- (BOOL)insertOrUpdateBankConnectAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  objc_msgSend(v3, "accountBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByMultiplyingBy:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "creditLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decimalNumberByMultiplyingBy:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "minimumPaymentAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decimalNumberByMultiplyingBy:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "overduePaymentAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decimalNumberByMultiplyingBy:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accountID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "accountType");
  v28 = objc_msgSend(v3, "sourceType");
  objc_msgSend(v3, "currency");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceReferenceDate");
  v26 = (int)v12;
  v13 = objc_msgSend(v3, "accountCategory");
  objc_msgSend(v3, "accountDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "accountStatus");
  objc_msgSend(v3, "nextPaymentDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;
  objc_msgSend(v3, "institutionName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "institutionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueAccountID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into fh_account_information (source_identifier, account_type, account_balance, source_type, account_currency_code, account_date, account_category, account_description, account_status, credit_limit, next_payment_date, minimum_payment_amount, overdue_payment_amount, institution_name, institution_id, unique_account_id) values (%@, %d, %@, %d, %@, %d, %d, %@, %d, %@, %f, %@, %@, %@, %@, %@)"), v30, v29, v33, v28, v27, v26, v13, v14, v15, v32, v18, v25, v24, v19, v20, v21);
  return v22;
}

- (id)getFHAccounts
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__FHDatabaseManager_getFHAccounts__block_invoke;
  v5[3] = &unk_250C66800;
  v5[4] = &v6;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v5, 0, CFSTR("select * from fh_account_information"), 0);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__FHDatabaseManager_getFHAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
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
  void *v22;
  void *v23;
  void *v24;
  FHAccount *v25;

  v3 = a2;
  v25 = objc_alloc_init(FHAccount);
  objc_msgSend(v3, "stringAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setAccountID:](v25, "setAccountID:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithInteger:", (int)objc_msgSend(v3, "intAtIndex:", 2));
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decimalNumberByDividingBy:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setAccountBalance:](v25, "setAccountBalance:", v7);

  -[FHAccount setSourceType:](v25, "setSourceType:", (int)objc_msgSend(v3, "intAtIndex:", 3));
  objc_msgSend(v3, "stringAtIndex:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setCurrency:](v25, "setCurrency:", v8);

  -[FHAccount setAccountCategory:](v25, "setAccountCategory:", (int)objc_msgSend(v3, "intAtIndex:", 6));
  -[FHAccount setAccountType:](v25, "setAccountType:", (int)objc_msgSend(v3, "intAtIndex:", 1));
  objc_msgSend(v3, "stringAtIndex:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setAccountDescription:](v25, "setAccountDescription:", v9);

  -[FHAccount setAccountStatus:](v25, "setAccountStatus:", (int)objc_msgSend(v3, "intAtIndex:", 8));
  objc_msgSend(v3, "decimalNumberAtIndex:", 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decimalNumberByDividingBy:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setCreditLimit:](v25, "setCreditLimit:", v12);

  v13 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "objectAtIndex:", 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setNextPaymentDate:](v25, "setNextPaymentDate:", v15);

  objc_msgSend(v3, "decimalNumberAtIndex:", 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decimalNumberByDividingBy:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setMinimumPaymentAmount:](v25, "setMinimumPaymentAmount:", v18);

  objc_msgSend(v3, "decimalNumberAtIndex:", 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "decimalNumberByDividingBy:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setOverduePaymentAmount:](v25, "setOverduePaymentAmount:", v21);

  objc_msgSend(v3, "stringAtIndex:", 13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setInstitutionName:](v25, "setInstitutionName:", v22);

  objc_msgSend(v3, "stringAtIndex:", 14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHAccount setInstitutionID:](v25, "setInstitutionID:", v23);

  objc_msgSend(v3, "stringAtIndex:", 15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[FHAccount setUniqueAccountID:](v25, "setUniqueAccountID:", v24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v25);

}

- (BOOL)updatePeerPaymentAccountBalance:(id)a3 amount:(id)a4 currencyCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  _QWORD v22[6];
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -1;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__FHDatabaseManager_updatePeerPaymentAccountBalance_amount_currencyCode___block_invoke;
  v22[3] = &unk_250C668A0;
  v22[4] = v23;
  v22[5] = &v24;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v22, 0, CFSTR("select * from fh_account_information"), 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(MEMORY[0x24BDD1518], "defaultDatabaseAmountMultiplier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberByMultiplyingBy:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = *((_DWORD *)v25 + 6);
  if ((_DWORD)v14 != objc_msgSend(v15, "intValue") || *((_DWORD *)v25 + 6) == -1)
  {
    v16 = -[FHDatabaseManager _execute:](self, "_execute:", CFSTR("insert or replace into fh_account_information (source_identifier, account_type, account_balance, account_currency_code, account_date) values (%@, %d, %@, %@, %d)"), v8, 1, v15, v10, (int)v13);
    if (v16)
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v15;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v8;
        v18 = "Updating balance of %@ %@ for transactionSourceIdentifier=%@ in fh_acount_information database table: success";
        v19 = v17;
        v20 = OS_LOG_TYPE_DEBUG;
LABEL_9:
        _os_log_impl(&dword_23B4A2000, v19, v20, v18, buf, 0x20u);
      }
    }
    else
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v15;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v8;
        v18 = "Updating balance of %@ %@ for transactionSourceIdentifier=%@ in fh_acount_information database table: failed";
        v19 = v17;
        v20 = OS_LOG_TYPE_ERROR;
        goto LABEL_9;
      }
    }

    goto LABEL_11;
  }
  LOBYTE(v16) = 1;
LABEL_11:

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __73__FHDatabaseManager_updatePeerPaymentAccountBalance_amount_currencyCode___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  unsigned int v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "unsignedIntAtIndex:", 5);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= (unint64_t)v3)
  {
    v4 = v3;
    if (objc_msgSend(v5, "intAtIndex:", 1) == 1)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "unsignedIntAtIndex:", 2);
    }
  }

}

- (id)getCurrentCashBalance
{
  id v2;
  void *v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__FHDatabaseManager_getCurrentCashBalance__block_invoke;
  v5[3] = &unk_250C668A0;
  v5[4] = v6;
  v5[5] = &v7;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v5, 0, CFSTR("select * from fh_account_information"), 0);
  v2 = objc_alloc(MEMORY[0x24BDD1518]);
  v3 = (void *)objc_msgSend(v2, "initWithInteger:", *((int *)v8 + 6));
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __42__FHDatabaseManager_getCurrentCashBalance__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  unsigned int v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "unsignedIntAtIndex:", 5);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= (unint64_t)v3)
  {
    v4 = v3;
    if (objc_msgSend(v5, "intAtIndex:", 1) == 1)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "unsignedIntAtIndex:", 2);
    }
  }

}

- (void)computePaymentFeatures
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  FHDatabaseManager *v14;

  v3 = objc_alloc(MEMORY[0x24BDBCE48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v4, "fh_dateWithStartOfDayByAddingDaysFromNow:", -7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = (int)v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__FHDatabaseManager_computePaymentFeatures__block_invoke;
  v11[3] = &unk_250C66648;
  v12 = v5;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v5;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v11, 0, CFSTR("select * from transactions t where t_type = %d and t_date >= %d and t_date <= %d and a_type == %d order by t_date desc limit %d"), 10, 0, v8, 2, -1);

}

void __43__FHDatabaseManager_computePaymentFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCE60]);
  v7 = objc_msgSend(v3, "unsignedIntAtIndex:", 9);

  v8 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:", (double)v7);
  if (objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 32)) == -1
    || objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 40)) == 1)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = CFSTR("FHSmartFeatureAggregateTypeRecentPayment");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_msgSend(*(id *)(a1 + 48), "_insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:", v9, 0, v4, v5);
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      v15 = "Insert Payment Features : succeess";
      v16 = v14;
      v17 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl(&dword_23B4A2000, v16, v17, v15, v18, 2u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v18 = 0;
    v15 = "Insert Payment Features : failed";
    v16 = v14;
    v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_10;
  }

}

- (id)_computePaymentFeaturesForTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCE48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "fh_dateWithStartOfDayByAddingDaysFromNow:", -7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (objc_msgSend(v4, "transactionType") == 10)
  {
    if (objc_msgSend(v9, "compare:", v7) == -1
      || (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v9, "compare:", v11),
          v11,
          v12 == 1))
    {
      v10 = 0;
      goto LABEL_12;
    }
    v13 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = CFSTR("FHSmartFeatureAggregateTypeRecentPayment");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "financeTransactionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FHDatabaseManager _insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:](self, "_insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:", v10, 0, v8, v15);

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = 138412290;
        v24 = v8;
        v19 = "Insert Payment Features for transaction id %@:  success";
        v20 = v18;
        v21 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_23B4A2000, v20, v21, v19, (uint8_t *)&v23, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v8;
      v19 = "Insert Payment Features for transaction id %@: failed";
      v20 = v18;
      v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }

  }
LABEL_12:

  return v10;
}

- (void)computeAndPersistDisputeFeaturesForPendingTransactions
{
  int64_t v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[FHDatabaseManager mostRecentTransactionDate](self, "mostRecentTransactionDate");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K > %lu"), CFSTR("t_date"), v3 - 7776000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__FHDatabaseManager_computeAndPersistDisputeFeaturesForPendingTransactions__block_invoke;
  v5[3] = &unk_250C66918;
  v5[4] = self;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v5, v4, CFSTR("select * from transactions t where t.t_type == %lu and t.t_status == %lu and t.a_type == %d order by t_date desc limit %d"), 0, 0, 2, -1);

}

void __75__FHDatabaseManager_computeAndPersistDisputeFeaturesForPendingTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  TransactionFromArray(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_computeDisputeFeaturesForTransaction:", v4);

}

- (id)_computeDisputeFeaturesForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FHDatabaseManager _getDisputeFeaturesForTransaction:](self, "_getDisputeFeaturesForTransaction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "financeTransactionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FHDatabaseManager _insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:](self, "_insertOrUpdateTransactionFeatures:compoundFeatures:transactionID:financeTransactionID:", v6, 0, v7, v8);

    FinHealthLogObject(CFSTR("FinHealthCore"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v16 = 138412290;
        v17 = v7;
        v12 = "computeDisputeFeaturesForTransaction: _insertOrUpdateTransactionFeatures success for transactionID %@ ";
        v13 = v11;
        v14 = OS_LOG_TYPE_DEBUG;
LABEL_8:
        _os_log_impl(&dword_23B4A2000, v13, v14, v12, (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      v12 = "computeDisputeFeaturesForTransaction: _insertOrUpdateTransactionFeatures fails for transactionID %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

  }
  return v6;
}

- (id)_getDisputeFeaturesForTransaction:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  if (_getDisputeFeaturesForTransaction__onceToken != -1)
    dispatch_once(&_getDisputeFeaturesForTransaction__onceToken, &__block_literal_global_272);
  if (objc_msgSend(v3, "disputeStatus"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v4, "addObject:", CFSTR("FHSmartFeatureAggregateTypeDispute"));
    v5 = objc_alloc(MEMORY[0x24BDBCE48]);
    v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v6, "fh_dateWithStartOfDayByAddingDaysFromNow:", -60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_getDisputeFeaturesForTransaction__openDisputeStatuses;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "disputeStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v9))
    {

    }
    else
    {
      objc_msgSend(v3, "disputeLastUpdatedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", v7);

      if (v12 == -1)
      {
LABEL_9:
        v10 = (void *)objc_msgSend(v4, "copy");

        goto LABEL_10;
      }
    }
    objc_msgSend(v4, "addObject:", CFSTR("FHSmartFeatureAggregateTypeRecentDispute"));
    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

void __55__FHDatabaseManager__getDisputeFeaturesForTransaction___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_250C73F48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getDisputeFeaturesForTransaction__openDisputeStatuses;
  _getDisputeFeaturesForTransaction__openDisputeStatuses = v0;

}

- (void)computeAndPersistTransactionGroupings
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke;
  v2[3] = &unk_250C66918;
  v2[4] = self;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v2, 0, CFSTR("select t_description from fts_transactions where a_type == %d AND t_description IS NOT NULL"), 4);
}

void __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v29 = a2;
  objc_msgSend(v29, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v5 = objc_alloc(MEMORY[0x24BDDFD68]);
  v50[0] = *MEMORY[0x24BDDFD18];
  v6 = v50[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v5, "initWithTagSchemes:", v7);

  objc_msgSend(v33, "setString:", v4);
  v8 = objc_msgSend(v4, "length");
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke_2;
  v40[3] = &unk_250C66960;
  v28 = v4;
  v41 = v28;
  v42 = &v43;
  objc_msgSend(v33, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v6, 46, v40);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)v44[5], "componentsJoinedByString:", CFSTR("\" OR \"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\"%@\"), v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)v44[5], "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select t_identifier, t_description, rank from fts_transactions where (t_description match '%@') OR ((fts_transactions match '%@') AND (rank < %f)) AND a_type == %d order by t_identifier;"),
    v31,
    v32,
    0xC020000000000000,
    4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "_lockFreeFetch:", v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1;
  while (objc_msgSend(v34, "next"))
  {
    objc_msgSend(v34, "stringAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleAtIndex:", 2);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v16);
    objc_msgSend(v13, "setObject:forKey:", v17, v15);

    v18 = objc_msgSend(v15, "hash");
    v14 = v18 + 32 * v14;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v19);
        v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v19, "valueForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("insert or replace into fh_grouping (t_identifier, group_id, similarity_score, group_type) values ('%@', %d, %@, %d)"), v23, v14, v26, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "_execute:", v27);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v20);
  }

  _Block_object_dispose(&v43, 8);
}

void __58__FHDatabaseManager_computeAndPersistTransactionGroupings__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)retrieveGroups
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__FHDatabaseManager_retrieveGroups__block_invoke;
  v5[3] = &unk_250C66800;
  v5[4] = &v6;
  -[FHDatabaseManager streamGenericSQLFetch:predicate:sqlFetchQuery:](self, "streamGenericSQLFetch:predicate:sqlFetchQuery:", v5, 0, CFSTR("select t_identifier, group_id from fh_grouping"), 0);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__FHDatabaseManager_retrieveGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDD1518]);
  v6 = objc_msgSend(v3, "intAtIndex:", 1);

  v7 = (void *)objc_msgSend(v5, "initWithInteger:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v9, "arrayByAddingObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v9, v7);
  }

}

- (FHFetchAllTransactionsDelegate)delegate
{
  return (FHFetchAllTransactionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inferredMerchants, 0);
  objc_storeStrong((id *)&self->_transactionsEntity, 0);
  objc_storeStrong((id *)&self->_transactionFeaturesCache, 0);
  objc_storeStrong((id *)&self->_batchProcessor, 0);
  objc_storeStrong((id *)&self->_dateTimeAggregatesCache, 0);
  objc_storeStrong((id *)&self->_merchantAggregatesCache, 0);
  objc_storeStrong((id *)&self->_amountAggregatesCache, 0);
  objc_storeStrong((id *)&self->_decimalRmseThreshold, 0);
  objc_storeStrong((id *)&self->_secondsInDay, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
