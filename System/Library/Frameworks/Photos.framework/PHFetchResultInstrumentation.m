@implementation PHFetchResultInstrumentation

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  if (a7 == -1)
    -[PHFetchResultInstrumentation didFailFetchRequestWithContext:](self, "didFailFetchRequestWithContext:", a3, a4, a5, a6);
  else
    -[PHFetchResultInstrumentation didExecuteFetchRequestWithContext:resultCount:sqlString:bindVariables:](self, "didExecuteFetchRequestWithContext:resultCount:sqlString:bindVariables:", a3, a7, a5, a6);
}

- (void)didExecuteFetchRequestWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_os_log *v13;
  NSObject *v14;
  os_signpost_id_t signpostId;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self->_importantFetchName)
  {
    v13 = self->_importantFetchSignpost.log;
    v14 = v13;
    signpostId = self->_importantFetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
    {
      v16 = 134217984;
      v17 = a4;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v14, OS_SIGNPOST_INTERVAL_END, signpostId, "ImportantPhotosFetch", "%tu", (uint8_t *)&v16, 0xCu);
    }

  }
  -[PHFetchResultInstrumentation endTrackingStatisticsWithContext:resultCount:sqlString:bindVariables:](self, "endTrackingStatisticsWithContext:resultCount:sqlString:bindVariables:", v10, a4, v11, v12);

}

- (void)willExecuteFetchRequestWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSString *importantFetchName;
  OS_os_log *log;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHFetchResultInstrumentation beginTrackingStatisticsWithContext:](self, "beginTrackingStatisticsWithContext:", v4);
  if (self->_importantFetchName)
  {
    PLImportantFetchGetLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      importantFetchName = self->_importantFetchName;
      v11 = 138543362;
      v12 = importantFetchName;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ImportantPhotosFetch", "%{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v8 = 0;
    v6 = 0;
  }
  log = self->_importantFetchSignpost.log;
  self->_importantFetchSignpost.log = (OS_os_log *)v8;

  self->_importantFetchSignpost.signpostId = v6;
}

- (void)beginTrackingStatisticsWithContext:(id)a3
{
  NSSQLiteDatabaseStatistics *v4;
  NSSQLiteDatabaseStatistics *statsStart;
  id v6;

  v6 = a3;
  if (!-[PHFetchResultInstrumentation isPerformanceLoggingDisabled](self, "isPerformanceLoggingDisabled"))
  {
    self->_wasTrackingStatistics = objc_msgSend(v6, "trackSQLiteDatabaseStatistics");
    objc_msgSend(v6, "setTrackSQLiteDatabaseStatistics:", 1);
    objc_msgSend(v6, "databaseStatistics");
    v4 = (NSSQLiteDatabaseStatistics *)objc_claimAutoreleasedReturnValue();
    statsStart = self->_statsStart;
    self->_statsStart = v4;

    self->_timeStart = CFAbsoluteTimeGetCurrent();
  }

}

- (void)endTrackingStatisticsWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a5;
  v11 = a6;
  if (!-[PHFetchResultInstrumentation isPerformanceLoggingDisabled](self, "isPerformanceLoggingDisabled"))
  {
    objc_msgSend(v15, "setTrackSQLiteDatabaseStatistics:", self->_wasTrackingStatistics);
    objc_msgSend(v15, "databaseStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "totalCachePages");
    v14 = v13 - -[NSSQLiteDatabaseStatistics totalCachePages](self->_statsStart, "totalCachePages");
    self->_byteCount = v14 * objc_msgSend(v12, "pageSize");
    self->_rowCount = a4;
    self->_duration = CFAbsoluteTimeGetCurrent() - self->_timeStart;
    -[PHFetchResultInstrumentation logFetchWithSqlString:bindVariables:](self, "logFetchWithSqlString:bindVariables:", v10, v11);

  }
}

- (BOOL)isPerformanceLoggingDisabled
{
  if (sOnceToken != -1)
    dispatch_once(&sOnceToken, &__block_literal_global_17668);
  return sIsLoggingDisabled;
}

- (void)logFetchWithSqlString:(id)a3 bindVariables:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  void *v14;
  int64_t byteCount;
  int64_t rowCount;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_type_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  double duration;
  void *v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  os_log_type_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  double v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = 0;
  v39 = (os_log_type_t *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__17686;
  v36 = __Block_byref_object_dispose__17687;
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__PHFetchResultInstrumentation_logFetchWithSqlString_bindVariables___block_invoke;
  v31[3] = &unk_1E35D95B8;
  v31[4] = &v38;
  v31[5] = &v32;
  -[PHFetchResultInstrumentation classifyFetchPerformanceWithTuple:](self, "classifyFetchPerformanceWithTuple:", v31);
  PLFetchPerformanceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, v39[24]);

  if (v9)
  {
    -[PHFetchResultInstrumentation formatSqlString:withBindVariables:](self, "formatSqlString:withBindVariables:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLFetchPerformanceGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *((_BYTE *)v39 + 24);
    if (os_log_type_enabled(v11, v12))
    {
      v27 = v10;
      v28 = v7;
      v29 = v6;
      v25 = v33[5];
      duration = self->_duration;
      qos_class_self();
      PLShortStringFromQoSClass();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult fetchRequest](self->_fetchResult, "fetchRequest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "entityName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      byteCount = self->_byteCount;
      rowCount = self->_rowCount;
      v17 = -[PHFetchResultInstrumentation bytesPerRow](self, "bytesPerRow");
      -[PHFetchResult fetchOptions](self->_fetchResult, "fetchOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult fetchRequest](self->_fetchResult, "fetchRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414594;
      v43 = v25;
      v44 = 2048;
      v45 = duration;
      v46 = 2112;
      v47 = v13;
      v48 = 2112;
      v49 = v14;
      v50 = 2048;
      v51 = rowCount;
      v52 = 2048;
      v53 = byteCount;
      v54 = 2048;
      v55 = v17;
      v56 = 2112;
      v57 = v18;
      v58 = 2112;
      v59 = v19;
      v60 = 2112;
      v10 = v27;
      v61 = v27;
      _os_log_impl(&dword_1991EC000, v11, v12, "%@PhotoKit Fetch: duration: %.2f, QoS: %@, entity: %@, count: %lld, bytes: %lld, bytes per row: %lld\nPHFetchOptions: %@\nNSFetchRequest: %@%@", buf, 0x66u);

      v7 = v28;
      v6 = v29;

    }
    if (-[PHFetchResultInstrumentation areBacktracesEnabled](self, "areBacktracesEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v39 + 24) == 17)
        v22 = OS_LOG_TYPE_ERROR;
      else
        v22 = *((_BYTE *)v39 + 24);
      PLFetchPerformanceGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, v22))
      {
        v24 = v33[5];
        *(_DWORD *)buf = 138412546;
        v43 = v24;
        v44 = 2112;
        v45 = *(double *)&v21;
        _os_log_impl(&dword_1991EC000, v23, v22, "%@PhotoKit Fetch: Backtrace\n%@", buf, 0x16u);
      }

    }
  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

- (void)classifyFetchPerformanceWithTuple:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  void (**v6)(id, _QWORD, __CFString *);

  v6 = (void (**)(id, _QWORD, __CFString *))a3;
  v4 = -[PHFetchResultInstrumentation classifyFetchPerformanceLogLevel](self, "classifyFetchPerformanceLogLevel");
  if ((_DWORD)v4 == 2)
    v5 = &stru_1E35DFFF8;
  else
    v5 = CFSTR("Slow ");
  if (-[NSString hasPrefix:](self->_importantFetchName, "hasPrefix:", CFSTR("!")))
  {
    if ((((_BYTE)v4 - 1) & 0xFE) != 0)
      v4 = v4;
    else
      v4 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), self->_importantFetchName, v5);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, v4, v5);

}

void __68__PHFetchResultInstrumentation_logFetchWithSqlString_bindVariables___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (unsigned)classifyFetchPerformanceLogLevel
{
  qos_class_t v4;
  uint64_t v5;
  int64_t rowCount;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  if (self->_suppressSlowFetchReports)
    return 2;
  v4 = qos_class_self();
  v5 = -[PHFetchResultInstrumentation bytesPerRow](self, "bytesPerRow");
  if (v4 < QOS_CLASS_USER_INITIATED)
  {
    v7 = 2;
  }
  else
  {
    rowCount = self->_rowCount;
    if ((rowCount > 100 || v5 <= 327680) && (rowCount < 101 || v5 <= 163840))
    {
      v7 = 16;
      if (rowCount > 100 || v5 <= 81920)
      {
        if (v5 <= 40960 || rowCount <= 100)
          v7 = 2;
        else
          v7 = 16;
      }
    }
    else
    {
      v7 = 17;
    }
  }
  +[PHFetchLogRateLimiter sharedRateLimiter](PHFetchLogRateLimiter, "sharedRateLimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rateLimitedLogLevelForLogForLevel:", v7);

  return v9;
}

- (int64_t)bytesPerRow
{
  int64_t result;
  uint64_t v3;
  int64_t *p_byteCount;

  p_byteCount = &self->_byteCount;
  result = self->_byteCount;
  v3 = p_byteCount[1];
  if (v3 >= 1)
    result /= v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsStart, 0);

  objc_storeStrong((id *)&self->_importantFetchName, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (void)didFailFetchRequestWithContext:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSObject *v6;
  os_signpost_id_t signpostId;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_importantFetchName)
  {
    v5 = self->_importantFetchSignpost.log;
    v6 = v5;
    signpostId = self->_importantFetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
    {
      v8 = 134217984;
      v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_END, signpostId, "ImportantPhotosFetch", "%tu", (uint8_t *)&v8, 0xCu);
    }

  }
  if (!-[PHFetchResultInstrumentation isPerformanceLoggingDisabled](self, "isPerformanceLoggingDisabled"))
    objc_msgSend(v4, "setTrackSQLiteDatabaseStatistics:", self->_wasTrackingStatistics);

}

- (id)formatSqlString:(id)a3 withBindVariables:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *context;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    context = (void *)MEMORY[0x19AEBEADC]();
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v7, "appendFormat:", CFSTR("\nsql: %@"), v5);
    v8 = objc_msgSend(v6, "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71688], "stringFromBindVariable:withTypePrefix:", v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("\nsql: bind[%tu] = %@"), i, v13);

        objc_autoreleasePoolPop(v11);
      }
    }
    v14 = (__CFString *)objc_msgSend(v7, "copy");

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v14 = &stru_1E35DFFF8;
  }

  return v14;
}

- (BOOL)areBacktracesEnabled
{
  if (sOnceToken != -1)
    dispatch_once(&sOnceToken, &__block_literal_global_17668);
  return sAreBacktracesEnabled;
}

@end
