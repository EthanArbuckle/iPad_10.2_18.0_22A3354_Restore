@implementation OSLogStatistics

- (OSLogStatistics)initWithLogArchivePath:(id)a3 forRelativePaths:(id)a4 errorOut:(id *)a5
{
  id v9;
  id v10;
  OSLogStatistics *v11;
  OSLogStatistics *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  OSLogStatistics *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)OSLogStatistics;
  v11 = -[OSLogStatistics init](&v18, sel_init);
  v12 = v11;
  if (v11
    && (objc_storeStrong((id *)&v11->_archivePath, a3),
        -[OSLogStatistics _initializeEventSourceWithPaths:](v12, "_initializeEventSourceWithPaths:", v10),
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    _logHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_19EA26000, v15, OS_LOG_TYPE_ERROR, "Encountered error during initialisation of OSLogStatistics: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v14);

    v16 = 0;
  }
  else
  {
    v16 = v12;
  }

  return v16;
}

- (OSLogStatistics)initWithLogArchivePath:(id)a3 errorOut:(id *)a4
{
  return -[OSLogStatistics initWithLogArchivePath:forRelativePaths:errorOut:](self, "initWithLogArchivePath:forRelativePaths:errorOut:", a3, 0, a4);
}

- (NSDate)start
{
  return -[OSLogEventSource oldestDate](self->_eventSource, "oldestDate");
}

- (NSDate)end
{
  return -[OSLogEventSource newestDate](self->_eventSource, "newestDate");
}

- (id)_initializeEventSourceWithPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OSLogStatistics archivePath](self, "archivePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (v6 = (void *)MEMORY[0x1E0C99E98],
        -[OSLogStatistics archivePath](self, "archivePath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    if (v4)
      +[OSLogEventStore storeWithArchiveURL:relativePaths:](OSLogEventStore, "storeWithArchiveURL:relativePaths:", v8, v4);
    else
      +[OSLogEventStore storeWithArchiveURL:](OSLogEventStore, "storeWithArchiveURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_15:
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Failed to initialize event store");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else
  {
    if (v4)
      +[OSLogEventStore localStoreWithRelativePaths:](OSLogEventStore, "localStoreWithRelativePaths:", v4);
    else
      +[OSLogEventStore localStore](OSLogEventStore, "localStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!v9)
      goto LABEL_15;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1986;
  v26 = __Block_byref_object_dispose__1987;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1986;
  v20 = __Block_byref_object_dispose__1987;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke;
  v15[3] = &unk_1E4157710;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend(v9, "prepareWithCompletionHandler:", v15);
  v10 = (void *)v17[5];
  if (v10)
  {
    objc_storeStrong((id *)&self->_eventSource, v10);
    v11 = 0;
  }
  else
  {
    v11 = (id)v23[5];
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
LABEL_16:

  return v11;
}

- (id)aggregationForStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 withOptions:(unint64_t)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  OSLogEventStream *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  OSLogStatisticsAggregation *v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  id v22;
  OSLogStatisticsAggregation *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  OSLogStatisticsAggregation *v30;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  NSObject *v35;
  _BYTE *v36;
  _QWORD v37[4];
  id v38;
  OSLogStatisticsAggregation *v39;
  id v40[2];
  id location;
  uint8_t v42[4];
  uint64_t v43;
  _BYTE buf[24];
  id v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = -[OSLogEventStream initWithSource:]([OSLogEventStream alloc], "initWithSource:", self->_eventSource);
  -[OSLogEventStreamBase setFlags:](v15, "setFlags:", 20);
  _logHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v45 = v14;
    v46 = 2048;
    v47 = a6;
    _os_log_impl(&dword_19EA26000, v16, OS_LOG_TYPE_DEFAULT, "Starting aggregation with start date : %@, end date : %@, predicate: %@, and flags %lu", buf, 0x2Au);
  }

  if ((a6 & 1) != 0)
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 1);
  if ((a6 & 2) != 0)
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") ^ 2);
  if ((a6 & 4) != 0)
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 0x20);
  if ((a6 & 8) != 0)
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 0x200);
  -[OSLogEventStream setFilterPredicate:](v15, "setFilterPredicate:", v14);
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSince1970");
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = -[OSLogStatisticsAggregation initWithLabel:tier:]([OSLogStatisticsAggregation alloc], "initWithLabel:tier:", CFSTR("All"), 1);
  objc_initWeak(&location, v15);
  v20 = dispatch_semaphore_create(0);
  v21 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke;
  v37[3] = &unk_1E4157738;
  v22 = v13;
  v38 = v22;
  v40[1] = v18;
  objc_copyWeak(v40, &location);
  v23 = v19;
  v39 = v23;
  -[OSLogEventStreamBase setEventHandler:](v15, "setEventHandler:", v37);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v45) = 0;
  v34[0] = v21;
  v34[1] = 3221225472;
  v34[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2;
  v34[3] = &unk_1E4157760;
  v36 = buf;
  v24 = v20;
  v35 = v24;
  -[OSLogEventStreamBase setInvalidationHandler:](v15, "setInvalidationHandler:", v34);
  v25 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[OSLogEventStream activateStreamFromDate:](v15, "activateStreamFromDate:", v25);
  if (!v12)

  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  _logHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl(&dword_19EA26000, v26, OS_LOG_TYPE_DEFAULT, "Finished enumerating all events.", v42, 2u);
  }

  -[OSLogStatistics processingError](self, "processingError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    _logHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[OSLogStatistics processingError](self, "processingError");
      v32 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138412290;
      v43 = v32;
      v33 = (void *)v32;
      _os_log_error_impl(&dword_19EA26000, v28, OS_LOG_TYPE_ERROR, "Encountered error during enumeration of tracepoints: %@", v42, 0xCu);

    }
    if (a7)
    {
      -[OSLogStatistics processingError](self, "processingError");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v29 = v35;
  v30 = v23;

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v40);

  objc_destroyWeak(&location);
  return v30;
}

- (OSLogEventSource)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_eventSource, a3);
}

- (NSError)processingError
{
  return self->_processingError;
}

- (void)setProcessingError:(id)a3
{
  objc_storeStrong((id *)&self->_processingError, a3);
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_processingError, 0);
  objc_storeStrong((id *)&self->_eventSource, 0);
}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  int v6;
  id WeakRetained;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_QWORD *)(a1 + 32)
    && (v4 = objc_msgSend(v3, "unixDate"),
        v5 = (double)*(uint64_t *)v4,
        v6 = *(_DWORD *)(v4 + 8),
        v3 = v8,
        (double)v6 / 1000000.0 + v5 > *(double *)(a1 + 56)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "invalidate");

  }
  else if (objc_msgSend(v3, "type") == 1536 || objc_msgSend(v8, "type") == 1024)
  {
    objc_msgSend(*(id *)(a1 + 40), "_addTraceEvent:", v8);
  }

}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;

  v5 = a3;
  switch(a2)
  {
    case 1:
      _logHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v12 = 0;
      v7 = "Stream disconnected.";
      v8 = (uint8_t *)&v12;
      break;
    case 2:
      _logHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = 0;
      v7 = "Stream backlogged, too many events.";
      v8 = (uint8_t *)&v11;
      break;
    case 3:
      _logHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v10 = 0;
      v7 = "Invalid position.";
      v8 = (uint8_t *)&v10;
      break;
    case 7:
      _logHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v9 = 0;
      v7 = "Client has insufficient permissions to access the archive.";
      v8 = (uint8_t *)&v9;
      break;
    default:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_12;
  }
  _os_log_impl(&dword_19EA26000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = 40;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v6 = 32;
    v7 = v11;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + v6) + 8);
  v9 = v7;
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;

}

@end
