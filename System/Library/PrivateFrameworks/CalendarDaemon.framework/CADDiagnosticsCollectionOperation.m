@implementation CADDiagnosticsCollectionOperation

- (CADDiagnosticsCollectionOperation)initWithConnection:(id)a3 token:(unsigned int)a4 options:(int64_t)a5 trafficLogsCollectionMode:(unint64_t)a6
{
  id v11;
  CADDiagnosticsCollectionOperation *v12;
  CADDiagnosticsCollectionOperation *v13;
  uint64_t v14;
  NSMutableDictionary *files;
  uint64_t v16;
  NSMutableSet *changedFiles;
  uint64_t v18;
  NSURL *logDirectoryURL;
  uint64_t v20;
  NSURL *incomingLogDirectoryURL;
  uint64_t v22;
  NSURL *completedLogDirectoryURL;
  NSMutableSet *v24;
  NSMutableSet *temporaryFileNames;
  uint64_t v26;
  NSURL *logFileURL;
  NSURL *v28;
  FILE *v29;
  NSDateFormatter *v30;
  NSDateFormatter *dateFormatter;
  void *v32;
  NSURL *v33;
  char v34;
  id v35;
  void *v36;
  NSURL *v37;
  char v38;
  id v39;
  CADDiagnosticsCollectionOperation *v40;
  void *v41;
  NSObject *v42;
  int v43;
  id v45;
  id v46;
  objc_super v47;
  uint8_t buf[4];
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CADDiagnosticsCollectionOperation;
  v12 = -[CADDiagnosticsCollectionOperation init](&v47, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conn, a3);
    v13->_token = a4;
    v13->_options = a5;
    v13->_trafficLogsCollectionMode = a6;
    v14 = objc_opt_new();
    files = v13->_files;
    v13->_files = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    changedFiles = v13->_changedFiles;
    v13->_changedFiles = (NSMutableSet *)v16;

    v13->_lock._os_unfair_lock_opaque = 0;
    -[CADDiagnosticsCollectionOperation _createLogDirectory](v13, "_createLogDirectory");
    v18 = objc_claimAutoreleasedReturnValue();
    logDirectoryURL = v13->_logDirectoryURL;
    v13->_logDirectoryURL = (NSURL *)v18;

    -[NSURL URLByAppendingPathComponent:](v13->_logDirectoryURL, "URLByAppendingPathComponent:", CFSTR("Incoming/"));
    v20 = objc_claimAutoreleasedReturnValue();
    incomingLogDirectoryURL = v13->_incomingLogDirectoryURL;
    v13->_incomingLogDirectoryURL = (NSURL *)v20;

    -[NSURL URLByAppendingPathComponent:](v13->_logDirectoryURL, "URLByAppendingPathComponent:", CFSTR("Completed/"));
    v22 = objc_claimAutoreleasedReturnValue();
    completedLogDirectoryURL = v13->_completedLogDirectoryURL;
    v13->_completedLogDirectoryURL = (NSURL *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    temporaryFileNames = v13->_temporaryFileNames;
    v13->_temporaryFileNames = v24;

    -[CADDiagnosticsCollectionOperation _createLogFile](v13, "_createLogFile");
    v26 = objc_claimAutoreleasedReturnValue();
    logFileURL = v13->_logFileURL;
    v13->_logFileURL = (NSURL *)v26;

    v28 = v13->_logFileURL;
    if (v28)
    {
      v29 = fopen(-[NSURL fileSystemRepresentation](v28, "fileSystemRepresentation"), "w");
      v13->_logFile = v29;
      if (v29)
      {
        v30 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        dateFormatter = v13->_dateFormatter;
        v13->_dateFormatter = v30;

        -[NSDateFormatter setDateFormat:](v13->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd' 'HH:mm:ss.SSSSSZZZ"));
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v13->_incomingLogDirectoryURL;
        v46 = 0;
        v34 = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v33, 1, 0, &v46);
        v35 = v46;
        v36 = v35;
        if ((v34 & 1) == 0)
          -[CADDiagnosticsCollectionOperation logError:](v13, "logError:", CFSTR("Unable to create incoming directory:%@"), v35);
        v37 = v13->_completedLogDirectoryURL;
        v45 = v36;
        v38 = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v37, 1, 0, &v45);
        v39 = v45;

        if ((v38 & 1) == 0)
          -[CADDiagnosticsCollectionOperation logError:](v13, "logError:", CFSTR("Unable to create completed directory:%@"), v39);

        goto LABEL_9;
      }
      v41 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v42 = v41;
        v43 = *__error();
        *(_DWORD *)buf = 67109120;
        v49 = v43;
        _os_log_impl(&dword_1B6A18000, v42, OS_LOG_TYPE_ERROR, "Unable to open log file: %{errno}i", buf, 8u);

      }
    }
    v40 = 0;
    goto LABEL_13;
  }
LABEL_9:
  v40 = v13;
LABEL_13:

  return v40;
}

- (id)loadLogCollectors
{
  void *v3;
  CADDiagnosticsCalDAVTrafficLogCollector *v4;
  CADDiagnosticsCalDAVTrafficLogCollector *v5;
  CADDiagnosticsCalDAVSpotlightLogCollector *v6;
  CADDiagnosticsDatabaseCollector *v7;
  CADDiagnosticsDiagnosticDatabaseCollector *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (self->_trafficLogsCollectionMode)
  {
    v4 = objc_alloc_init(CADDiagnosticsCalDAVTrafficLogCollector);
    v5 = v4;
    if (self->_trafficLogsCollectionMode == 1)
      -[CADDiagnosticsCalDAVTrafficLogCollector setLimitedLogs:](v4, "setLimitedLogs:", 1);
    objc_msgSend(v3, "addObject:", v5);

  }
  v11[0] = self;
  v6 = objc_alloc_init(CADDiagnosticsCalDAVSpotlightLogCollector);
  v11[1] = v6;
  v7 = objc_alloc_init(CADDiagnosticsDatabaseCollector);
  v11[2] = v7;
  v8 = objc_alloc_init(CADDiagnosticsDiagnosticDatabaseCollector);
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  return v3;
}

- (void)main
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  CADDiagnosticsCollectionOperation *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CADDiagnosticsCollectionOperation log:](self, "log:", CFSTR("Started collecting diagnostics"));
  -[CADDiagnosticsCollectionOperation loadLogCollectors](self, "loadLogCollectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__CADDiagnosticsCollectionOperation_main__block_invoke;
  v16[3] = &unk_1E6A37420;
  v4 = v3;
  v17 = v4;
  v18 = self;
  -[CADDiagnosticsCollectionOperation batch:](self, "batch:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((-[CADDiagnosticsCollectionOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      -[CADDiagnosticsCollectionOperation log:](self, "log:", CFSTR("Asking %@ to collect logs"), objc_opt_class());
      objc_msgSend(v10, "collect:", self);
      -[CADDiagnosticsCollectionOperation log:](self, "log:", CFSTR("%@ has fininshed collecting logs"), objc_opt_class());
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (-[CADDiagnosticsCollectionOperation isCancelled](self, "isCancelled"))
    v11 = CFSTR("Diagnostics collection canceled");
  else
    v11 = CFSTR("Finished collecting diagnostics");
  -[CADDiagnosticsCollectionOperation log:](self, "log:", v11);
  -[CADDiagnosticsCollectionOperation finish](self, "finish");

}

void __41__CADDiagnosticsCollectionOperation_main__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
      if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) != 0)
        break;
      objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Asking %@ to determine what logs it will produce"), objc_opt_class());
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "count");
      objc_msgSend(v7, "determineExpectedOutputFiles:", *(_QWORD *)(a1 + 40));
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "count") - v8;
      objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("%@ expects to produce %lu logs"), objc_opt_class(), v9, (_QWORD)v10);
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)determineExpectedOutputFiles:(id)a3
{
  objc_msgSend(a3, "setStatus:forFile:", 1, self->_logFileURL);
}

- (id)_createLogDirectory
{
  void *v2;
  id v3;
  char *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CalendarDiagnosticAttachmentsXXXXXX"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = strdup((const char *)objc_msgSend(v3, "fileSystemRepresentation"));
  if (mkdtemp(v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = *__error();
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "Unable to create log directory: %{errno}i", (uint8_t *)v10, 8u);

    }
    free(v4);
    v5 = 0;
  }

  return v5;
}

- (id)_randomString
{
  uint64_t i;
  int v3;
  char v4;
  _BYTE v6[7];

  for (i = 0; i != 6; ++i)
  {
    v3 = (int)random() % 36;
    if (v3 >= 10)
      v4 = 87;
    else
      v4 = 48;
    v6[i] = v4 + v3;
  }
  v6[6] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)temporaryFileForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (-[NSMutableSet containsObject:](self->_temporaryFileNames, "containsObject:", v4))
  {
    v6 = v4;
    do
    {
      objc_msgSend(v4, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByDeletingPathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADDiagnosticsCollectionOperation _randomString](self, "_randomString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathExtension:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v5;
    }
    while ((-[NSMutableSet containsObject:](self->_temporaryFileNames, "containsObject:", v5) & 1) != 0);
  }
  -[NSMutableSet addObject:](self->_temporaryFileNames, "addObject:", v5);
  -[NSURL URLByAppendingPathComponent:](self->_incomingLogDirectoryURL, "URLByAppendingPathComponent:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)deleteTemporaryFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_incomingLogDirectoryURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](self->_temporaryFileNames, "containsObject:", v8) & 1) != 0)
    {
      -[NSMutableSet removeObject:](self->_temporaryFileNames, "removeObject:", v8);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v10 = objc_msgSend(v9, "removeItemAtURL:error:", v4, &v12);
      v11 = v12;

      if ((v10 & 1) == 0)
        -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Error removing %@: %@"), v4, v11);

    }
    else
    {
      -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Ignoring attempt to delete file %@, which wasn't returned by -temporaryFileForName:!"), v8);
    }

  }
  else
  {
    -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Ignoring attempt to delete URL %@, which is not in the log directory %@!"), v4, self->_incomingLogDirectoryURL);
  }

}

- (id)_createLogFile
{
  return -[NSURL URLByAppendingPathComponent:](self->_logDirectoryURL, "URLByAppendingPathComponent:", CFSTR("CalendarDiagnosticExtensionLogs.txt"));
}

- (void)log:(id)a3
{
  uint64_t v3;

  -[CADDiagnosticsCollectionOperation logWithLevel:formatString:arguments:](self, "logWithLevel:formatString:arguments:", 0, a3, &v3);
}

- (void)logError:(id)a3
{
  uint64_t v3;

  -[CADDiagnosticsCollectionOperation logWithLevel:formatString:arguments:](self, "logWithLevel:formatString:arguments:", 16, a3, &v3);
}

- (void)logWithLevel:(unsigned __int8)a3 formatString:(id)a4 arguments:(char *)a5
{
  int v6;
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSDateFormatter *dateFormatter;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  os_unfair_lock_s *p_lock;
  id v19;
  void *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, a5);

  v11 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, (os_log_type_t)v6))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1B6A18000, v11, (os_log_type_t)v6, "%{public}@", buf, 0xCu);
  }
  dateFormatter = self->_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v6 <= 1)
  {
    if (v6)
    {
      if (v6 == 1)
        v15 = CFSTR("Info");
    }
    else
    {
      v15 = CFSTR("Default");
    }
  }
  else
  {
    switch(v6)
    {
      case 17:
        v15 = CFSTR("Fault");
        break;
      case 16:
        v15 = CFSTR("Error");
        break;
      case 2:
        v15 = CFSTR("Debug");
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@: %@\n"), v14, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataUsingEncoding:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_logFile)
  {
    v19 = objc_retainAutorelease(v17);
    if (fwrite((const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), 1uLL, self->_logFile) != 1)
    {
      v20 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        v22 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v22;
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Error writing to log file %{errno}i", buf, 8u);

      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v23 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1B6A18000, v23, OS_LOG_TYPE_ERROR, "Dropping message because log file is closed: \"%@\", buf, 0xCu);
    }
  }

}

- (void)finish
{
  os_unfair_lock_s *p_lock;
  FILE *logFile;
  void *v5;
  NSURL *incomingLogDirectoryURL;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  logFile = self->_logFile;
  if (logFile)
  {
    fclose(logFile);
    self->_logFile = 0;
    os_unfair_lock_unlock(p_lock);
    self->_finished = 1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    incomingLogDirectoryURL = self->_incomingLogDirectoryURL;
    v10 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", incomingLogDirectoryURL, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
      -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Couldn't remove incoming direrctory: %@"), v8);
    -[CADDiagnosticsCollectionOperation setStatus:forFile:](self, "setStatus:forFile:", 2, self->_logFileURL);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "Finish called without an open log file. Called more than once?", buf, 2u);
    }
  }
}

- (void)batch:(id)a3
{
  int v4;

  ++self->_batchDepth;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = self->_batchDepth - 1;
  self->_batchDepth = v4;
  if (!v4)
    -[CADDiagnosticsCollectionOperation reportFileStatusChangesToClient](self, "reportFileStatusChangesToClient");
}

- (id)finalFileForFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSURL *completedLogDirectoryURL;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_incomingLogDirectoryURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", v6))
  {
    completedLogDirectoryURL = self->_completedLogDirectoryURL;
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](completedLogDirectoryURL, "URLByAppendingPathComponent:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)setStatus:(unint64_t)a3 forFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;

  v6 = a4;
  -[CADDiagnosticsCollectionOperation finalFileForFile:](self, "finalFileForFile:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "unsignedIntegerValue") != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_files, "setObject:forKeyedSubscript:", v10, v7);

      -[NSMutableSet addObject:](self->_changedFiles, "addObject:", v7);
      if (a3 == 2 && v7 != v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v12 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v6, v7, &v14);
        v13 = v14;

        if ((v12 & 1) == 0)
          -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Error moving incoming file %@ to %@: %@"), v6, v7, v13);

      }
      if (!self->_batchDepth)
        -[CADDiagnosticsCollectionOperation reportFileStatusChangesToClient](self, "reportFileStatusChangesToClient");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("No key found for file %@ %@"), v6, v9);
  }

}

- (void)reportFileStatusChangesToClient
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_changedFiles, "count") || self->_finished)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_changedFiles, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = self->_changedFiles;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v8, 0);
            v11 = (void *)v10;
            if (v10)
            {
              v23[0] = CFSTR("file");
              v23[1] = CFSTR("status");
              v24[0] = v10;
              v24[1] = v9;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v12);

            }
            else
            {
              -[CADDiagnosticsCollectionOperation logError:](self, "logError:", CFSTR("Couldn't create sandbox extension for %@, so this won't be attached."), v8);
            }

          }
          else
          {
            v13 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v8;
              _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "No status for file: %@", buf, 0xCu);
            }
          }

        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_changedFiles, "removeAllObjects");
    -[ClientConnection remoteObjectProxyWithErrorHandler:](self->_conn, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v14, "CADClientReceiveDiagnosticsCollectionResults:forToken:finished:", v15, self->_token, self->_finished);

  }
}

void __68__CADDiagnosticsCollectionOperation_reportFileStatusChangesToClient__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_ERROR, "Error sending diagnostic file results: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)redactLogs
{
  return (self->_options & 1) == 0;
}

- (unsigned)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
  objc_storeStrong((id *)&self->_completedLogDirectoryURL, 0);
  objc_storeStrong((id *)&self->_incomingLogDirectoryURL, 0);
  objc_storeStrong((id *)&self->_logDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryFileNames, 0);
  objc_storeStrong((id *)&self->_changedFiles, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
