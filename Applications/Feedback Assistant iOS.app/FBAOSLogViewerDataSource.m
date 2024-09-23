@implementation FBAOSLogViewerDataSource

- (FBAOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  FBAOSLogViewerDataSource *v14;
  unsigned int v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id pageFetchCompletion;
  id v23;
  id fetchErrorBlock;
  uint64_t v25;
  OSLogPersistence *loggerLib;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *savedEvents;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  NSObject *v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  void *v37;
  FBAOSLogViewerDataSource *v38;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)FBAOSLogViewerDataSource;
  v14 = -[FBAOSLogViewerDataSource init](&v41, "init");
  if (!v14)
  {
LABEL_11:
    v38 = v14;
    goto LABEL_15;
  }
  v40 = 0;
  v15 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", &v40);
  v16 = v40;
  v17 = sub_100018AFC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      *(_DWORD *)buf = 138543362;
      v43 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Initializing log viewer with log archive [%{public}@]", buf, 0xCu);

    }
    v21 = objc_retainBlock(v12);
    pageFetchCompletion = v14->_pageFetchCompletion;
    v14->_pageFetchCompletion = v21;

    v23 = objc_retainBlock(v13);
    fetchErrorBlock = v14->_fetchErrorBlock;
    v14->_fetchErrorBlock = v23;

    objc_storeStrong((id *)&v14->_logArchivePath, a3);
    v14->_pageSize = a4;
    v25 = objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLibWithArchive:pageSize:](v14, "loggerLibWithArchive:pageSize:", v11, -[FBAOSLogViewerDataSource pageSize](v14, "pageSize")));
    loggerLib = v14->_loggerLib;
    v14->_loggerLib = (OSLogPersistence *)v25;

    -[OSLogPersistence setDelegate:](v14->_loggerLib, "setDelegate:", v14);
    v28 = objc_opt_new(NSMutableArray, v27);
    savedEvents = v14->_savedEvents;
    v14->_savedEvents = (NSMutableArray *)v28;

    v14->_oldestEventMachTime = 0;
    v14->_gotDelegateCallbackInLastFetch = 0;
    v14->_numberOfEventsInLastFetch = 0;
    v14->_numberOfEmptyFetches = 0;
    v14->_pendingNextPageRequest = 0;
    v14->_fetchWatchdog = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource fetchErrorBlock](v14, "fetchErrorBlock"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](v14, "loggerLib"));
      v32 = objc_msgSend(v31, "fba_hasValidStartAndEndDates");

      if ((v32 & 1) == 0)
      {
        -[FBAOSLogViewerDataSource setFoundCorruptDate:](v14, "setFoundCorruptDate:", 1);
        v33 = sub_100018AFC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          sub_1000995B0(v14, v34);

        v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource fetchErrorBlock](v14, "fetchErrorBlock"));
        v36 = sub_100033BD0(-1008);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        ((void (**)(_QWORD, void *))v35)[2](v35, v37);

      }
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1000996B8(v14, v16, v19);

  v38 = 0;
LABEL_15:

  return v38;
}

- (void)dealloc
{
  objc_super v3;

  -[FBAOSLogViewerDataSource setLoggerLib:](self, "setLoggerLib:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FBAOSLogViewerDataSource;
  -[FBAOSLogViewerDataSource dealloc](&v3, "dealloc");
}

- (void)nextPage
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](self, "loggerLib"));
  v4 = objc_msgSend(v3, "fba_hasValidStartAndEndDates");

  if (v4)
  {
    v5 = sub_100018AFC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Next Page", v7, 2u);
    }

    if (-[FBAOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") < 1)
      -[FBAOSLogViewerDataSource nextPageForReal](self, "nextPageForReal");
    else
      -[FBAOSLogViewerDataSource setPendingNextPageRequest:](self, "setPendingNextPageRequest:", (char *)-[FBAOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") + 1);
  }
}

- (void)nextPageForReal
{
  -[FBAOSLogViewerDataSource prepareForNextPage](self, "prepareForNextPage");
  -[FBAOSLogViewerDataSource fetchNextBatch](self, "fetchNextBatch");
}

- (int64_t)numberOfLogs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource savedEvents](self, "savedEvents"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (id)logAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource savedEvents](self, "savedEvents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fba_toString"));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource oldestEventTimestamp](self, "oldestEventTimestamp"));

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](self, "loggerLib"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource oldestEventTimestamp](self, "oldestEventTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](self, "loggerLib"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  v8 = objc_msgSend(v5, "compare:", v7) != 0;

  return v8;
}

- (void)prepareForNextPage
{
  -[FBAOSLogViewerDataSource setEventCountForCurrentPage:](self, "setEventCountForCurrentPage:", 0);
  -[FBAOSLogViewerDataSource setNumberOfEmptyFetches:](self, "setNumberOfEmptyFetches:", 0);
  -[FBAOSLogViewerDataSource prepareForNextDateRangeFetch](self, "prepareForNextDateRangeFetch");
}

- (void)prepareForNextDateRangeFetch
{
  -[FBAOSLogViewerDataSource setNumberOfEventsInLastFetch:](self, "setNumberOfEventsInLastFetch:", 0);
  -[FBAOSLogViewerDataSource setGotDelegateCallbackInLastFetch:](self, "setGotDelegateCallbackInLastFetch:", 0);
  -[FBAOSLogViewerDataSource setFetchWatchdog:](self, "setFetchWatchdog:", 0);
}

- (BOOL)lastFetchReturnedZeroEvents
{
  if (-[FBAOSLogViewerDataSource numberOfEventsInLastFetch](self, "numberOfEventsInLastFetch"))
    return 0;
  else
    return -[FBAOSLogViewerDataSource gotDelegateCallbackInLastFetch](self, "gotDelegateCallbackInLastFetch");
}

- (void)fetchNextBatch
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  __int16 v20;
  void *v21;

  v3 = sub_100018AFC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100099770(self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource oldestEventTimestamp](self, "oldestEventTimestamp"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](self, "loggerLib"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));

  }
  v9 = 10.0;
  if (-[FBAOSLogViewerDataSource numberOfEmptyFetches](self, "numberOfEmptyFetches") >= 2)
    v9 = fmin(__exp10((double)-[FBAOSLogViewerDataSource numberOfEmptyFetches](self, "numberOfEmptyFetches")), 1.79769313e308);
  v10 = sub_100018AFC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v18 = 134217984;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Time delta: [%f]", (uint8_t *)&v18, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v9));
  v13 = sub_100018AFC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fba_toString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fba_toString"));
    v18 = 138543618;
    v19 = *(double *)&v15;
    v20 = 2114;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "start date: [%{public}@]  end date: [%{public}@] ", (uint8_t *)&v18, 0x16u);

  }
  -[FBAOSLogViewerDataSource prepareForNextDateRangeFetch](self, "prepareForNextDateRangeFetch");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource loggerLib](self, "loggerLib"));
  objc_msgSend(v17, "fetchFromStartDate:toEndDate:", v7, v12);

}

- (id)loggerLibWithArchive:(id)a3 pageSize:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = objc_alloc_init((Class)OSLogPersistence);
  objc_msgSend(v6, "setOptions:", 1);
  objc_msgSend(v6, "setBatchSize:", a4);
  objc_msgSend(v6, "setLogArchive:", v5);

  v7 = sub_100018AFC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "archiveVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fba_toString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fba_toString"));
    v15 = 134218498;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Log archive version is [%lu] start date: [%{public}@] end date [%{public}@]", (uint8_t *)&v15, 0x20u);

  }
  return v6;
}

- (BOOL)isCurrentPageComplete
{
  unint64_t v3;

  v3 = -[FBAOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage");
  return v3 >= -[FBAOSLogViewerDataSource pageSize](self, "pageSize");
}

- (BOOL)shouldContinue
{
  if (-[FBAOSLogViewerDataSource isCurrentPageComplete](self, "isCurrentPageComplete"))
    return 0;
  else
    return -[FBAOSLogViewerDataSource hasMoreLogs](self, "hasMoreLogs");
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  char *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];

  v7 = a4;
  v8 = a5;
  -[FBAOSLogViewerDataSource setGotDelegateCallbackInLastFetch:](self, "setGotDelegateCallbackInLastFetch:", 1);
  v9 = sub_100018AFC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000998DC();

  if (objc_msgSend(v7, "count"))
  {
    if (!v8)
    {
      v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v17 = v7;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
LABEL_14:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v21);
          v23 = -[FBAOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage", (_QWORD)v32);
          v24 = (char *)-[NSObject count](v14, "count") + v23;
          if (v24 >= (char *)-[FBAOSLogViewerDataSource pageSize](self, "pageSize"))
            break;
          v25 = objc_msgSend(v22, "machTimestamp");
          if (v25 > (id)-[FBAOSLogViewerDataSource oldestEventMachTime](self, "oldestEventMachTime"))
          {
            -[NSObject addObject:](v14, "addObject:", v22);
            -[FBAOSLogViewerDataSource setOldestEventMachTime:](self, "setOldestEventMachTime:", objc_msgSend(v22, "machTimestamp"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timestamp"));
            -[FBAOSLogViewerDataSource setOldestEventTimestamp:](self, "setOldestEventTimestamp:", v26);

          }
          if (v19 == (id)++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v19)
              goto LABEL_14;
            break;
          }
        }
      }

      -[FBAOSLogViewerDataSource setEventCountForCurrentPage:](self, "setEventCountForCurrentPage:", (char *)-[NSObject count](v14, "count")+ -[FBAOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage"));
      -[FBAOSLogViewerDataSource setNumberOfEventsInLastFetch:](self, "setNumberOfEventsInLastFetch:", -[NSObject count](v14, "count"));
      v27 = sub_100018AFC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        sub_1000997E0(v14, v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource savedEvents](self, "savedEvents"));
      v30 = -[NSObject copy](v14, "copy");
      objc_msgSend(v29, "addObjectsFromArray:", v30);

      v16 = -[FBAOSLogViewerDataSource shouldContinue](self, "shouldContinue");
      goto LABEL_25;
    }
    v11 = sub_100018AFC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100099868((uint64_t)v8, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock"));
    if (!v13)
    {
      v16 = 0;
      goto LABEL_26;
    }
    v14 = objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock"));
    ((void (*)(NSObject *, id))v14[2].isa)(v14, v8);
  }
  else
  {
    v15 = sub_100018AFC();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No more results, done", buf, 2u);
    }
  }
  v16 = 0;
LABEL_25:

LABEL_26:
  return v16;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  NSObject *v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  NSObject *v21;
  _QWORD block[5];

  if (-[FBAOSLogViewerDataSource gotDelegateCallbackInLastFetch](self, "gotDelegateCallbackInLastFetch", a3, a4)
    && !-[FBAOSLogViewerDataSource lastFetchReturnedZeroEvents](self, "lastFetchReturnedZeroEvents"))
  {
    v5 = 0;
  }
  else
  {
    v5 = (char *)-[FBAOSLogViewerDataSource numberOfEmptyFetches](self, "numberOfEmptyFetches") + 1;
  }
  -[FBAOSLogViewerDataSource setNumberOfEmptyFetches:](self, "setNumberOfEmptyFetches:", v5);
  v6 = -[FBAOSLogViewerDataSource fetchWatchdog](self, "fetchWatchdog");
  -[FBAOSLogViewerDataSource setFetchWatchdog:](self, "setFetchWatchdog:", v6 + 1);
  if (v6 < 1000)
  {
    v12 = -[FBAOSLogViewerDataSource shouldContinue](self, "shouldContinue");
    v13 = sub_100018AFC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v15)
        sub_100099940();

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000197BC;
      block[3] = &unk_1000E61B8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (v15)
        sub_100099A18();

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource pageFetchCompletion](self, "pageFetchCompletion"));
      if (v16)
      {
        v17 = sub_100018AFC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          sub_100099998(self);

        v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource pageFetchCompletion](self, "pageFetchCompletion"));
        ((void (**)(_QWORD, FBAOSLogViewerDataSource *))v19)[2](v19, self);

      }
      if (-[FBAOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") >= 1)
      {
        v20 = sub_100018AFC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          sub_10009996C();

        -[FBAOSLogViewerDataSource setPendingNextPageRequest:](self, "setPendingNextPageRequest:", (char *)-[FBAOSLogViewerDataSource pendingNextPageRequest](self, "pendingNextPageRequest") - 1);
        -[FBAOSLogViewerDataSource nextPageForReal](self, "nextPageForReal");
      }
    }
  }
  else
  {
    -[FBAOSLogViewerDataSource setFoundCorruptDate:](self, "setFoundCorruptDate:", 1);
    v7 = sub_100018AFC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100099908();

    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FBAOSLogViewerDataSource fetchErrorBlock](self, "fetchErrorBlock"));
    v10 = sub_100033BD0(-1008);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    ((void (**)(_QWORD, void *))v9)[2](v9, v11);

  }
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

@end
