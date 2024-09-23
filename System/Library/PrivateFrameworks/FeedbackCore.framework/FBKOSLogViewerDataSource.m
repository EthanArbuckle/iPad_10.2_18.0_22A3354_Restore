@implementation FBKOSLogViewerDataSource

- (FBKOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  FBKOSLogViewerDataSource *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id pageFetchCompletion;
  void *v22;
  id fetchErrorBlock;
  uint64_t v24;
  OSLogPersistence *loggerLib;
  uint64_t v26;
  NSMutableArray *savedEvents;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  FBKOSLogViewerDataSource *v34;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)FBKOSLogViewerDataSource;
  v14 = -[FBKOSLogViewerDataSource init](&v37, sel_init);
  if (!v14)
  {
LABEL_11:
    v34 = v14;
    goto LABEL_15;
  }
  v36 = 0;
  v15 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", &v36);
  v16 = v36;
  Log_8();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_DEFAULT, "Initializing log viewer with log archive [%{public}@]", buf, 0xCu);

    }
    v20 = _Block_copy(v12);
    pageFetchCompletion = v14->_pageFetchCompletion;
    v14->_pageFetchCompletion = v20;

    v22 = _Block_copy(v13);
    fetchErrorBlock = v14->_fetchErrorBlock;
    v14->_fetchErrorBlock = v22;

    objc_storeStrong((id *)&v14->_logArchivePath, a3);
    v14->_pageSize = a4;
    -[FBKOSLogViewerDataSource loggerLibWithArchive:pageSize:](v14, "loggerLibWithArchive:pageSize:", v11, -[FBKOSLogViewerDataSource pageSize](v14, "pageSize"));
    v24 = objc_claimAutoreleasedReturnValue();
    loggerLib = v14->_loggerLib;
    v14->_loggerLib = (OSLogPersistence *)v24;

    -[OSLogPersistence setDelegate:](v14->_loggerLib, "setDelegate:", v14);
    v26 = objc_opt_new();
    savedEvents = v14->_savedEvents;
    v14->_savedEvents = (NSMutableArray *)v26;

    v14->_oldestEventMachTime = 0;
    v14->_gotDelegateCallbackInLastFetch = 0;
    v14->_numberOfEventsInLastFetch = 0;
    v14->_numberOfEmptyFetches = 0;
    v14->_pendingNextPageRequest = 0;
    v14->_fetchWatchdog = 0;
    -[FBKOSLogViewerDataSource fetchErrorBlock](v14, "fetchErrorBlock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[FBKOSLogViewerDataSource loggerLib](v14, "loggerLib");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "fba_hasValidStartAndEndDates");

      if ((v30 & 1) == 0)
      {
        -[FBKOSLogViewerDataSource setFoundCorruptDate:](v14, "setFoundCorruptDate:", 1);
        Log_8();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[FBKOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:].cold.1(v14, v31);

        -[FBKOSLogViewerDataSource fetchErrorBlock](v14, "fetchErrorBlock");
        v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        FBKErrorOfType(-1008);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v32)[2](v32, v33);

      }
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[FBKOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:].cold.2(v14, v16, v18);

  v34 = 0;
LABEL_15:

  return v34;
}

- (void)dealloc
{
  objc_super v3;

  -[FBKOSLogViewerDataSource setLoggerLib:](self, "setLoggerLib:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FBKOSLogViewerDataSource;
  -[FBKOSLogViewerDataSource dealloc](&v3, sel_dealloc);
}

- (void)nextPage
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v6[16];

  -[FBKOSLogViewerDataSource loggerLib](self, "loggerLib");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fba_hasValidStartAndEndDates");

  if (v4)
  {
    Log_8();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Next Page", v6, 2u);
    }

    if (-[FBKOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") < 1)
      -[FBKOSLogViewerDataSource nextPageForReal](self, "nextPageForReal");
    else
      -[FBKOSLogViewerDataSource setPendingNextPageRequest:](self, "setPendingNextPageRequest:", -[FBKOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") + 1);
  }
}

- (void)nextPageForReal
{
  -[FBKOSLogViewerDataSource prepareForNextPage](self, "prepareForNextPage");
  -[FBKOSLogViewerDataSource fetchNextBatch](self, "fetchNextBatch");
}

- (int64_t)numberOfLogs
{
  void *v2;
  int64_t v3;

  -[FBKOSLogViewerDataSource savedEvents](self, "savedEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)logAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[FBKOSLogViewerDataSource savedEvents](self, "savedEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fba_toString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasMoreLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[FBKOSLogViewerDataSource oldestEventTimestamp](self, "oldestEventTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[FBKOSLogViewerDataSource loggerLib](self, "loggerLib");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[FBKOSLogViewerDataSource oldestEventTimestamp](self, "oldestEventTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOSLogViewerDataSource loggerLib](self, "loggerLib");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7) != 0;

  return v8;
}

- (void)prepareForNextPage
{
  -[FBKOSLogViewerDataSource setEventCountForCurrentPage:](self, "setEventCountForCurrentPage:", 0);
  -[FBKOSLogViewerDataSource setNumberOfEmptyFetches:](self, "setNumberOfEmptyFetches:", 0);
  -[FBKOSLogViewerDataSource prepareForNextDateRangeFetch](self, "prepareForNextDateRangeFetch");
}

- (void)prepareForNextDateRangeFetch
{
  -[FBKOSLogViewerDataSource setNumberOfEventsInLastFetch:](self, "setNumberOfEventsInLastFetch:", 0);
  -[FBKOSLogViewerDataSource setGotDelegateCallbackInLastFetch:](self, "setGotDelegateCallbackInLastFetch:", 0);
  -[FBKOSLogViewerDataSource setFetchWatchdog:](self, "setFetchWatchdog:", 0);
}

- (BOOL)lastFetchReturnedZeroEvents
{
  return !-[FBKOSLogViewerDataSource numberOfEventsInLastFetch](self, "numberOfEventsInLastFetch")
      && -[FBKOSLogViewerDataSource gotDelegateCallbackInLastFetch](self, "gotDelegateCallbackInLastFetch");
}

- (void)fetchNextBatch
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "numberOfEmptyFetches");
  OUTLINED_FUNCTION_2_3(&dword_21D9A9000, v1, v2, "Empty page count: [%lu]", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_2_1();
}

- (id)loggerLibWithArchive:(id)a3 pageSize:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BE60C88];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setOptions:", 1);
  objc_msgSend(v7, "setBatchSize:", a4);
  objc_msgSend(v7, "setLogArchive:", v6);

  Log_8();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "archiveVersion");
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fba_toString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fba_toString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218498;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Log archive version is [%lu] start date: [%{public}@] end date [%{public}@]", (uint8_t *)&v15, 0x20u);

  }
  return v7;
}

- (BOOL)isCurrentPageComplete
{
  unint64_t v3;

  v3 = -[FBKOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage");
  return v3 >= -[FBKOSLogViewerDataSource pageSize](self, "pageSize");
}

- (BOOL)shouldContinue
{
  return !-[FBKOSLogViewerDataSource isCurrentPageComplete](self, "isCurrentPageComplete")
      && -[FBKOSLogViewerDataSource hasMoreLogs](self, "hasMoreLogs");
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[FBKOSLogViewerDataSource setGotDelegateCallbackInLastFetch:](self, "setGotDelegateCallbackInLastFetch:", 1);
  Log_8();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FBKOSLogViewerDataSource persistence:results:error:].cold.3();

  if (objc_msgSend(v7, "count"))
  {
    if (!v8)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v14 = v7;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
LABEL_14:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
          v20 = -[FBKOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage", (_QWORD)v28);
          v21 = objc_msgSend((id)v12, "count") + v20;
          if (v21 >= -[FBKOSLogViewerDataSource pageSize](self, "pageSize"))
            break;
          v22 = objc_msgSend(v19, "machTimestamp");
          if (v22 > -[FBKOSLogViewerDataSource oldestEventMachTime](self, "oldestEventMachTime"))
          {
            objc_msgSend((id)v12, "addObject:", v19);
            -[FBKOSLogViewerDataSource setOldestEventMachTime:](self, "setOldestEventMachTime:", objc_msgSend(v19, "machTimestamp"));
            objc_msgSend(v19, "timestamp");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBKOSLogViewerDataSource setOldestEventTimestamp:](self, "setOldestEventTimestamp:", v23);

          }
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v16)
              goto LABEL_14;
            break;
          }
        }
      }

      -[FBKOSLogViewerDataSource setEventCountForCurrentPage:](self, "setEventCountForCurrentPage:", -[FBKOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage")+ objc_msgSend((id)v12, "count"));
      -[FBKOSLogViewerDataSource setNumberOfEventsInLastFetch:](self, "setNumberOfEventsInLastFetch:", objc_msgSend((id)v12, "count"));
      Log_8();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[FBKOSLogViewerDataSource persistence:results:error:].cold.1((void *)v12, v24);

      -[FBKOSLogViewerDataSource savedEvents](self, "savedEvents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend((id)v12, "copy");
      objc_msgSend(v25, "addObjectsFromArray:", v26);

      v13 = -[FBKOSLogViewerDataSource shouldContinue](self, "shouldContinue");
      goto LABEL_25;
    }
    Log_8();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FBKOSLogViewerDataSource persistence:results:error:].cold.2((uint64_t)v8, v10);

    -[FBKOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v13 = 0;
      goto LABEL_26;
    }
    -[FBKOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock");
    v12 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v8);
  }
  else
  {
    Log_8();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "No more results, done", buf, 2u);
    }
  }
  v13 = 0;
LABEL_25:

LABEL_26:
  return v13;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD);
  NSObject *v16;
  _QWORD block[5];

  if (-[FBKOSLogViewerDataSource gotDelegateCallbackInLastFetch](self, "gotDelegateCallbackInLastFetch", a3, a4)
    && !-[FBKOSLogViewerDataSource lastFetchReturnedZeroEvents](self, "lastFetchReturnedZeroEvents"))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[FBKOSLogViewerDataSource numberOfEmptyFetches](self, "numberOfEmptyFetches") + 1;
  }
  -[FBKOSLogViewerDataSource setNumberOfEmptyFetches:](self, "setNumberOfEmptyFetches:", v5);
  v6 = -[FBKOSLogViewerDataSource fetchWatchdog](self, "fetchWatchdog");
  -[FBKOSLogViewerDataSource setFetchWatchdog:](self, "setFetchWatchdog:", v6 + 1);
  if (v6 < 1000)
  {
    v10 = -[FBKOSLogViewerDataSource shouldContinue](self, "shouldContinue");
    Log_8();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.2();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__FBKOSLogViewerDataSource_persistenceDidFinishReadingForStartDate_endDate___block_invoke;
      block[3] = &unk_24E156D78;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      if (v12)
        -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.5();

      -[FBKOSLogViewerDataSource pageFetchCompletion](self, "pageFetchCompletion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        Log_8();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.4(self);

        -[FBKOSLogViewerDataSource pageFetchCompletion](self, "pageFetchCompletion");
        v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, FBKOSLogViewerDataSource *))v15)[2](v15, self);

      }
      if (-[FBKOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") >= 1)
      {
        Log_8();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.3();

        -[FBKOSLogViewerDataSource setPendingNextPageRequest:](self, "setPendingNextPageRequest:", -[FBKOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") - 1);
        -[FBKOSLogViewerDataSource nextPageForReal](self, "nextPageForReal");
      }
    }
  }
  else
  {
    -[FBKOSLogViewerDataSource setFoundCorruptDate:](self, "setFoundCorruptDate:", 1);
    Log_8();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.1();

    -[FBKOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    FBKErrorOfType(-1008);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
}

uint64_t __76__FBKOSLogViewerDataSource_persistenceDidFinishReadingForStartDate_endDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchNextBatch");
}

- (NSMutableArray)savedEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSavedEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)foundCorruptDate
{
  return self->_foundCorruptDate;
}

- (void)setFoundCorruptDate:(BOOL)a3
{
  self->_foundCorruptDate = a3;
}

- (OSLogPersistence)loggerLib
{
  return (OSLogPersistence *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoggerLib:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)logArchivePath
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogArchivePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)oldestEventTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldestEventTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)numberOfEventsInLastFetch
{
  return self->_numberOfEventsInLastFetch;
}

- (void)setNumberOfEventsInLastFetch:(unint64_t)a3
{
  self->_numberOfEventsInLastFetch = a3;
}

- (unint64_t)numberOfEmptyFetches
{
  return self->_numberOfEmptyFetches;
}

- (void)setNumberOfEmptyFetches:(unint64_t)a3
{
  self->_numberOfEmptyFetches = a3;
}

- (BOOL)gotDelegateCallbackInLastFetch
{
  return self->_gotDelegateCallbackInLastFetch;
}

- (void)setGotDelegateCallbackInLastFetch:(BOOL)a3
{
  self->_gotDelegateCallbackInLastFetch = a3;
}

- (unint64_t)eventCountForCurrentPage
{
  return self->_eventCountForCurrentPage;
}

- (void)setEventCountForCurrentPage:(unint64_t)a3
{
  self->_eventCountForCurrentPage = a3;
}

- (unint64_t)oldestEventMachTime
{
  return self->_oldestEventMachTime;
}

- (void)setOldestEventMachTime:(unint64_t)a3
{
  self->_oldestEventMachTime = a3;
}

- (id)pageFetchCompletion
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPageFetchCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (id)fetchErrorBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFetchErrorBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(int64_t)a3
{
  self->_pageSize = a3;
}

- (int64_t)pendingNextPageRequest
{
  return self->_pendingNextPageRequest;
}

- (void)setPendingNextPageRequest:(int64_t)a3
{
  self->_pendingNextPageRequest = a3;
}

- (int64_t)fetchWatchdog
{
  return self->_fetchWatchdog;
}

- (void)setFetchWatchdog:(int64_t)a3
{
  self->_fetchWatchdog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchErrorBlock, 0);
  objc_storeStrong(&self->_pageFetchCompletion, 0);
  objc_storeStrong((id *)&self->_oldestEventTimestamp, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_loggerLib, 0);
  objc_storeStrong((id *)&self->_savedEvents, 0);
}

- (void)initWithArchive:(void *)a1 pageSize:(NSObject *)a2 pageCompletion:error:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "loggerLib");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fba_toString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loggerLib");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fba_toString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543618;
  v12 = v6;
  v13 = 2114;
  v14 = v9;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a2, v10, "Log Archive has invalid dates. Start Date [%{public}@], end date: [%{public}@]", (uint8_t *)&v11);

}

- (void)initWithArchive:(NSObject *)a3 pageSize:pageCompletion:error:.cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "logArchivePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a3, v7, "Could not initialize FBKOSLogViewerDataSource with logarchive file: [%{public}@] error: [%{public}@]", (uint8_t *)&v8);

}

- (void)persistence:(void *)a1 results:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Fetched [%i] log events from data range batch", (uint8_t *)v3, 8u);
}

- (void)persistence:(uint64_t)a1 results:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Error fetching page [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)persistence:results:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Got log events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_ERROR, "Too many fetches. Aborting", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Reading for date range finished, will read another batch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Reading for date range finished, done reading, next page requested ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)persistenceDidFinishReadingForStartDate:(void *)a1 endDate:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "savedEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_2_3(&dword_21D9A9000, v2, v3, "Log events count: [%lu] on completion block", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2_1();
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Reading for date range finished, done reading ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
