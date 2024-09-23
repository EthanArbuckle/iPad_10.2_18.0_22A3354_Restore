@implementation EDSQLQueryLogger

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__EDSQLQueryLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_88 != -1)
    dispatch_once(&log_onceToken_88, block);
  return (id)log_log_88;
}

void __23__EDSQLQueryLogger_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_88;
  log_log_88 = (uint64_t)v1;

}

- (EDSQLQueryLogger)init
{
  EDSQLQueryLogger *v2;
  uint64_t v3;
  EFAssertableScheduler *queryLoggingScheduler;
  uint64_t v5;
  NSString *queryLogDirectoryPath;
  uint64_t v7;
  NSString *queryLogFilePath;
  uint64_t v9;
  NSFileHandle *rawQueryLogInputFileHandle;
  uint64_t v11;
  NSString *queryCountLogFilePath;
  NSMutableArray *v13;
  NSMutableArray *queryStatisticsArray;
  NSMutableDictionary *v15;
  NSMutableDictionary *queryCountDict;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EDSQLQueryLogger;
  v2 = -[EDSQLQueryLogger init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EFSQLPreparedStatement"), 17);
    v3 = objc_claimAutoreleasedReturnValue();
    queryLoggingScheduler = v2->_queryLoggingScheduler;
    v2->_queryLoggingScheduler = (EFAssertableScheduler *)v3;

    -[EDSQLQueryLogger _createQueryLogDirectoryPath](v2, "_createQueryLogDirectoryPath");
    v5 = objc_claimAutoreleasedReturnValue();
    queryLogDirectoryPath = v2->_queryLogDirectoryPath;
    v2->_queryLogDirectoryPath = (NSString *)v5;

    -[EDSQLQueryLogger _createQueryLogFilePath](v2, "_createQueryLogFilePath");
    v7 = objc_claimAutoreleasedReturnValue();
    queryLogFilePath = v2->_queryLogFilePath;
    v2->_queryLogFilePath = (NSString *)v7;

    -[EDSQLQueryLogger _createFileIfNeeded:](v2, "_createFileIfNeeded:", v2->_queryLogFilePath);
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v2->_queryLogFilePath);
    v9 = objc_claimAutoreleasedReturnValue();
    rawQueryLogInputFileHandle = v2->_rawQueryLogInputFileHandle;
    v2->_rawQueryLogInputFileHandle = (NSFileHandle *)v9;

    -[EDSQLQueryLogger _createQueryCountLogFilePath](v2, "_createQueryCountLogFilePath");
    v11 = objc_claimAutoreleasedReturnValue();
    queryCountLogFilePath = v2->_queryCountLogFilePath;
    v2->_queryCountLogFilePath = (NSString *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queryStatisticsArray = v2->_queryStatisticsArray;
    v2->_queryStatisticsArray = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryCountDict = v2->_queryCountDict;
    v2->_queryCountDict = v15;

  }
  return v2;
}

- (void)logQueryString:(id)a3 label:(id)a4 firstRowExecutionTimeInNanoseconds:(unint64_t)a5 totalExecutionTimeInNanoseconds:(unint64_t)a6 numberOfRows:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  EDSQLQueryLogger *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v12 = a3;
  v13 = a4;
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke;
  v17[3] = &unk_1E94A1DC0;
  v15 = v13;
  v18 = v15;
  v16 = v12;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v19 = v16;
  v20 = self;
  objc_msgSend(v14, "performBlock:", v17);

}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18[7];

  v18[6] = *(id *)MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_3(v2, v3, v4);

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D1EF48], "redactedQueryStringForQueryString:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("redactedQuery"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("firstRowExecutionTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("totalExecutionTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfRows"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("transactionLabel"));
  v18[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18[0];
  if (!v10)
  {
    +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_2();
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "rawQueryLogInputFileHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14 = objc_msgSend(v13, "writeData:error:", v10, &v17);
  v15 = v17;

  if ((v14 & 1) == 0)
  {
    +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_1();
    }

  }
}

- (id)_createQueryLogDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("QueryPerformance"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
    v11[0] = 0;
    objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, v11);
    v7 = v11[0];
    if (v7)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "path");
        objc_claimAutoreleasedReturnValue();
        -[EDSQLQueryLogger _createQueryLogDirectoryPath].cold.1();
      }

    }
  }
  objc_msgSend(v3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_createQueryLogFilePath
{
  void *v2;
  void *v3;

  -[EDSQLQueryLogger queryLogDirectoryPath](self, "queryLogDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Logs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createQueryCountLogFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EDSQLQueryLogger queryLogDirectoryPath](self, "queryLogDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("queryCountLogs_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  EFSystemBuildVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("json.compressed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_createFileIfNeeded:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);
  if ((v5 & 1) == 0)
    objc_msgSend(v4, "createFileAtPath:contents:attributes:", v3, 0, 0);

  return v5 ^ 1;
}

- (void)_recreateFile:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v6))
    -[EDSQLQueryLogger _removeFile:](self, "_removeFile:", v6);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createFileAtPath:contents:attributes:", v6, 0, 0);

}

- (void)_removeFile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSQLQueryLogger _removeFile:].cold.1((uint64_t)v3, v8, (uint64_t)v10);
    }

  }
}

- (void)submitQueryLogData
{
  void *v3;
  _QWORD v4[5];

  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__EDSQLQueryLogger_submitQueryLogData__block_invoke;
  v4[3] = &unk_1E949AEB8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  char v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint8_t v60;
  char v61[7];
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  NSObject *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v56, "fileExistsAtPath:", v2);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_processing"));
    v5 = objc_claimAutoreleasedReturnValue();

    v54 = v5;
    if (objc_msgSend(v56, "fileExistsAtPath:", v5))
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_8(v5, v6, v7);

      objc_msgSend(*(id *)(a1 + 32), "_removeFile:", v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v9 = objc_msgSend(v56, "moveItemAtPath:toPath:error:", v8, v5, &v64);
    v53 = v64;

    if ((v9 & 1) == 0)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "ef_publicDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v66 = v19;
        v67 = 2112;
        v68 = v54;
        v69 = 2114;
        v70 = v20;
        _os_log_error_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_ERROR, "Failed to rename file from: %@ to %@ due to error: %{public}@", buf, 0x20u);

      }
      goto LABEL_51;
    }
    objc_msgSend(*(id *)(a1 + 32), "rawQueryLogInputFileHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "closeFile");

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "queryLogFilePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_recreateFile:", v12);

    v13 = (void *)MEMORY[0x1E0CB3608];
    objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileHandleForWritingAtPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRawQueryLogInputFileHandle:", v15);

    v63 = 0;
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v5, 1, &v63);
    v52 = v63;
    if (v52)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_7();
      }
      goto LABEL_50;
    }
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v55);
    v16 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    while ((-[NSObject isAtEnd](v16, "isAtEnd", v52) & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1D824B334]();
      v62 = v21;
      -[NSObject scanUpToString:intoString:](v16, "scanUpToString:intoString:", CFSTR("}{"), &v62);
      v23 = v62;

      v24 = (void *)objc_msgSend(v23, "mutableCopy");
      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(v24, "substringToIndex:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("{"));

        if ((v26 & 1) == 0)
          objc_msgSend(v24, "insertString:atIndex:", CFSTR("{"), 0);
        objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v24, "length") - 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("}"));

        if ((v28 & 1) == 0)
          objc_msgSend(v24, "appendString:", CFSTR("}"));
        v29 = -[NSObject scanLocation](v16, "scanLocation");
        if (v29 <= objc_msgSend(v55, "length") - 2)
          -[NSObject setScanLocation:](v16, "setScanLocation:", -[NSObject scanLocation](v16, "scanLocation") + 1);
        objc_msgSend(*(id *)(a1 + 32), "_createQueryCountDict:", v24);
      }
      else
      {
        +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_6(&v60, v61, v30);

      }
      v21 = v23;
      objc_autoreleasePoolPop(v22);
    }
    objc_msgSend(*(id *)(a1 + 32), "_preprocessQueryInfo");
    objc_msgSend(*(id *)(a1 + 32), "_removeFile:", v54);
    objc_msgSend(*(id *)(a1 + 32), "queryStatisticsArray");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (v32)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_1(v36, v50, v51);
      goto LABEL_49;
    }
    v33 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(*(id *)(a1 + 32), "queryStatisticsArray");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v33, "dataWithJSONObject:options:error:", v34, 0, &v59);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v59;

    objc_msgSend(*(id *)(a1 + 32), "queryStatisticsArray");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeAllObjects");

    if (!v35)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        -[NSObject ef_publicDescription](v36, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_2();
      }
      goto LABEL_48;
    }
    v58 = 0;
    objc_msgSend(v35, "compressedDataUsingAlgorithm:error:", 0, &v58);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v58;

    if (!v38)
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "queryCountLogFilePath");
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_3();
      }
      goto LABEL_47;
    }
    v40 = *(void **)(a1 + 32);
    objc_msgSend(v40, "queryCountLogFilePath");
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_recreateFile:", v41);

    objc_msgSend(*(id *)(a1 + 32), "queryCountLogFilePath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    LOBYTE(v41) = -[NSObject writeToFile:options:error:](v38, "writeToFile:options:error:", v42, 1, &v57);
    v43 = v57;

    if ((v41 & 1) != 0)
    {
      if ((objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 38) & 1) != 0)
      {
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
        v18 = v52;
LABEL_51:

        v17 = v54;
        goto LABEL_52;
      }
      objc_msgSend(*(id *)(a1 + 32), "queryCountLogFilePath");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = DRSubmitLog();
      v46 = 0;

      if ((v45 & 1) == 0)
      {
        +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          -[NSObject ef_publicDescription](v46, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_4();
        }

      }
      v48 = *(void **)(a1 + 32);
      objc_msgSend(v48, "queryCountLogFilePath");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_removeFile:", v49);

    }
    else
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "queryCountLogFilePath");
        objc_claimAutoreleasedReturnValue();
        -[NSObject ef_publicDescription](v43, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_5();
      }
    }

    goto LABEL_47;
  }
  +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "queryLogFilePath");
    objc_claimAutoreleasedReturnValue();
    __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_9();
  }
LABEL_52:

}

- (void)_preprocessQueryInfo
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t j;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertIsExecuting:", 1);

  -[EDSQLQueryLogger _sortQueryCountDict](self, "_sortQueryCountDict");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v38, "count");
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternal");

  if (v6)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = v38;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[EDSQLQueryLogger _writeQueryStatistics:](self, "_writeQueryStatistics:", v13);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v8);
    }
  }
  else
  {
    v14 = (double)v4 * 0.1;
    if (v4)
      v15 = (unint64_t)v14 == 0;
    else
      v15 = 0;
    if (v15)
      v16 = 1;
    else
      v16 = (unint64_t)v14;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = v38;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v18)
    {
      v19 = 0;
      v20 = *(_QWORD *)v40;
      while (2)
      {
        v21 = 0;
        v22 = v19;
        v23 = v16 >= v19;
        v24 = v16 - v19;
        v37 = v22 + v18;
        if (v23)
          v25 = v24;
        else
          v25 = 0;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          v26 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v21);
          -[EDSQLQueryLogger queryCountDict](self, "queryCountDict", v37);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 == v21)
          {

            goto LABEL_28;
          }
          -[EDSQLQueryLogger _writeQueryStatistics:](self, "_writeQueryStatistics:", v28);

          ++v21;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        v19 = v37;
        if (v18)
          continue;
        break;
      }
    }
LABEL_28:

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v16 < v4)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v29);

        ++v16;
      }
      while (v4 != v16);
    }
    for (j = (unint64_t)((double)v4 * 0.01); j; --j)
    {
      v31 = arc4random_uniform(objc_msgSend(v7, "count") - 1);
      objc_msgSend(v7, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

      objc_msgSend(v17, "objectAtIndexedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSQLQueryLogger _writeQueryStatistics:](self, "_writeQueryStatistics:", v36);

      objc_msgSend(v7, "removeObjectAtIndex:", v31);
    }
  }

}

- (void)_writeQueryStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertIsExecuting:", 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "queryCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketValueForQueryLogCount:bucketValues:", v6, &unk_1E94E5650);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "firstRowMaxExecutionTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "firstRowMinExecutionTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "timePerRowMaxExecutionTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "timePerRowMinExecutionTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMaxExecutionTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMinExecutionTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "queryCountByTransactionLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSQLQueryLogger _createQueryStatisticsDictionary:queryCountByTransactionLabel:queryCountNum:firstRowExecutionTimeStats:totalExecutionTimeStats:timePerRowExecutionTimeStats:](self, "_createQueryStatisticsDictionary:queryCountByTransactionLabel:queryCountNum:firstRowExecutionTimeStats:totalExecutionTimeStats:timePerRowExecutionTimeStats:", v18, v17, v7, v10, v16, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSQLQueryLogger queryStatisticsArray](self, "queryStatisticsArray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v19);

}

- (id)_sortQueryCountDict
{
  void *v3;
  void *v4;
  void *v5;

  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertIsExecuting:", 1);

  -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysSortedByValueUsingComparator:", &__block_literal_global_75);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__EDSQLQueryLogger__sortQueryCountDict__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "queryCount");
  if (v6 <= objc_msgSend(v4, "queryCount"))
  {
    v8 = objc_msgSend(v5, "queryCount");
    if (v8 >= objc_msgSend(v4, "queryCount"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_createQueryCountDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  EDSQLQueryStatistics *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;

  v4 = a3;
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertIsExecuting:", 1);

  -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v32 = v4;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("redactedQuery"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("firstRowExecutionTime"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("totalExecutionTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfRows"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "doubleValue");
    v16 = v15;
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:", v16 / v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transactionLabel"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("unnamed transaction");
    if (v18)
      v20 = (__CFString *)v18;
    v21 = v20;

    if (v11 && v34 && v12 && v13)
    {
      if (objc_msgSend(v7, "containsObject:", v11))
      {
        -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "addStatisticWithTransactionLabel:firstRowExecutionTime:timePerRowExecutionTime:totalExecutionTime:", v21, v34, v33, v12);
        -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v23, v11);

      }
      else
      {
        v29 = -[EDSQLQueryStatistics initWithQuery:transactionLabel:firstRowExecutionTime:timePerRowExecutionTime:totalExecutionTime:]([EDSQLQueryStatistics alloc], "initWithQuery:transactionLabel:firstRowExecutionTime:timePerRowExecutionTime:totalExecutionTime:", v11, v21, v34, v33, v12);
        objc_msgSend(v7, "arrayByAddingObject:", v11);
        v30 = objc_claimAutoreleasedReturnValue();

        -[EDSQLQueryLogger queryCountDict](self, "queryCountDict");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v29, v11);

        v7 = (void *)v30;
      }
    }
    else
    {
      +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[EDSQLQueryLogger _createQueryCountDict:].cold.2(v26, v27, v28);

    }
    v4 = v32;
  }
  else
  {
    +[EDSQLQueryLogger log](EDSQLQueryLogger, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDSQLQueryLogger _createQueryCountDict:].cold.1((uint64_t)v4, v11, v25);
  }

}

- (id)_createQueryStatisticsDictionary:(id)a3 queryCountByTransactionLabel:(id)a4 queryCountNum:(unint64_t)a5 firstRowExecutionTimeStats:(id)a6 totalExecutionTimeStats:(id)a7 timePerRowExecutionTimeStats:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertIsExecuting:", 1);

  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("redactedQuery"));
  -[EDSQLQueryLogger _bucketTransactionLabels:](self, "_bucketTransactionLabels:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("transactionLabel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("queryCount"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("firstRowExecutionTimeStats"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("totalExecutionTimeStats"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("timePerRowExecutionTimeStats"));

  return v20;
}

- (id)_bucketTransactionLabels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  -[EDSQLQueryLogger queryLoggingScheduler](self, "queryLoggingScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertIsExecuting:", 1);

  v5 = (void *)objc_msgSend(v16, "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v16, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketValueForQueryLogCount:bucketValues:", v11, &unk_1E94E5668);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v10);

      }
      v6 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v5;
}

- (EFAssertableScheduler)queryLoggingScheduler
{
  return self->_queryLoggingScheduler;
}

- (NSString)queryLogDirectoryPath
{
  return self->_queryLogDirectoryPath;
}

- (void)setQueryLogDirectoryPath:(id)a3
{
  objc_storeStrong((id *)&self->_queryLogDirectoryPath, a3);
}

- (NSString)queryLogFilePath
{
  return self->_queryLogFilePath;
}

- (void)setQueryLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_queryLogFilePath, a3);
}

- (NSString)queryCountLogFilePath
{
  return self->_queryCountLogFilePath;
}

- (void)setQueryCountLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_queryCountLogFilePath, a3);
}

- (NSFileHandle)rawQueryLogInputFileHandle
{
  return self->_rawQueryLogInputFileHandle;
}

- (void)setRawQueryLogInputFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_rawQueryLogInputFileHandle, a3);
}

- (NSMutableDictionary)queryCountDict
{
  return self->_queryCountDict;
}

- (void)setQueryCountDict:(id)a3
{
  objc_storeStrong((id *)&self->_queryCountDict, a3);
}

- (NSMutableArray)queryStatisticsArray
{
  return self->_queryStatisticsArray;
}

- (void)setQueryStatisticsArray:(id)a3
{
  objc_storeStrong((id *)&self->_queryStatisticsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStatisticsArray, 0);
  objc_storeStrong((id *)&self->_queryCountDict, 0);
  objc_storeStrong((id *)&self->_rawQueryLogInputFileHandle, 0);
  objc_storeStrong((id *)&self->_queryCountLogFilePath, 0);
  objc_storeStrong((id *)&self->_queryLogFilePath, 0);
  objc_storeStrong((id *)&self->_queryLogDirectoryPath, 0);
  objc_storeStrong((id *)&self->_queryLoggingScheduler, 0);
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to write raw log: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to convert raw log to json data: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "Transaction label is nil", v3);
  OUTLINED_FUNCTION_1();
}

- (void)_createQueryLogDirectoryPath
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to create directory at path: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeFile:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to remove processed file at %@ due to error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "queryStatisticsArray is nil", v3);
  OUTLINED_FUNCTION_1();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to convert query statistics array to NSData due to error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to compress file at %@ due to error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to submit logs to diagnostic pipeline %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to write to file with compressed data at %@ due to error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_6(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a3, (uint64_t)a3, "Detected empty query log", a1);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to read query log file at file path: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Remove file failed in the middle of preprocessing: %@", (uint8_t *)&v3);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_9()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to find query log file at file path: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createQueryCountDict:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Failed to find valid query for log line: %@", (uint8_t *)&v3);
}

- (void)_createQueryCountDict:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "Failed to create valid key for the query count dictionary", v3);
  OUTLINED_FUNCTION_1();
}

@end
