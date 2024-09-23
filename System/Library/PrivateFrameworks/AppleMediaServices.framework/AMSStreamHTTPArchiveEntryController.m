@implementation AMSStreamHTTPArchiveEntryController

+ (void)ams_addEntriesForTaskInfo:(id)a3
{
  id v4;
  void *v5;
  AMSStreamHTTPArchiveEntry *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  AMSStreamHTTPArchiveEntry *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[AMSHTTPArchiveController _disabled](AMSHTTPArchiveController, "_disabled"))
  {
    AMSSetLogKeyIfNeeded();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AMSStreamHTTPArchiveEntry initWithHTTPArchiveTaskInfo:]([AMSStreamHTTPArchiveEntry alloc], "initWithHTTPArchiveTaskInfo:", v4);
    v9 = (void *)MEMORY[0x1E0C99E98];
    -[AMSStreamHTTPArchiveEntry urlString](v6, "urlString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSHTTPArchiveController harURLFilters](AMSHTTPArchiveController, "harURLFilters");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_14;
    v12 = (void *)v11;
    +[AMSHTTPArchiveController harURLFilters](AMSHTTPArchiveController, "harURLFilters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
      goto LABEL_14;
    -[AMSStreamHTTPArchiveEntry urlString](v6, "urlString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(a1, "_shouldWriteEntryDirectlyToDiskForURLString:", v15);

    if (v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        AMSLogableURL(v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v19;
        v29 = 2114;
        v30 = v5;
        v31 = 2114;
        v32 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing filtered HAR entries to disk for URL string: %{public}@", buf, 0x20u);

      }
      v26 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_streamToDiskWithEntries:", v21);
    }
    else
    {
LABEL_14:
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_opt_class();
        AMSLogableURL(v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v24;
        v29 = 2114;
        v30 = v5;
        v31 = 2114;
        v32 = v25;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Stream Entry to buffer for URL string: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1, "buffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v6);
    }

    goto LABEL_20;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = (AMSStreamHTTPArchiveEntry *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_18C849000, &v6->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error adding HAR, disabled", buf, 0x16u);
LABEL_20:

  }
}

+ (AMSCircularBuffer)buffer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEAD878 != -1)
    dispatch_once(&qword_1ECEAD878, block);
  return (AMSCircularBuffer *)(id)_MergedGlobals_142;
}

+ (void)ams_streamEntriesToDisk
{
  void *v3;
  id v4;

  objc_msgSend(a1, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flush");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    objc_msgSend(a1, "_streamToDiskWithEntries:", v4);

}

+ (void)initialize
{
  __CFNotificationCenter *DarwinNotifyCenter;
  AMSObserver *v4;

  v4 = -[AMSObserver initWithResultBlock:]([AMSObserver alloc], "initWithResultBlock:", &__block_literal_global_120);
  +[AMSMemoryPressure subscribe:](AMSMemoryPressure, "subscribe:", v4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerShouldSaveToDisk, CFSTR("SSHTTPArchiveShouldSaveToDiskNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerShouldSaveToDiskDecompressed, CFSTR("SSHTTPArchiveShouldSaveToDiskDecompressedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

uint64_t __49__AMSStreamHTTPArchiveEntryController_initialize__block_invoke()
{
  return +[AMSStreamHTTPArchiveEntryController _updateMaxBufferSize](AMSStreamHTTPArchiveEntryController, "_updateMaxBufferSize");
}

void __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke(uint64_t a1)
{
  AMSCircularBuffer *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = -[AMSCircularBuffer initWithMaxSize:]([AMSCircularBuffer alloc], "initWithMaxSize:", 0);
  v3 = (void *)_MergedGlobals_142;
  _MergedGlobals_142 = (uint64_t)v2;

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

uint64_t __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaxBufferSize");
}

+ (id)ams_combineEntriesForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_harFileURLsInPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createNewFileNameForCombining:extension:", 1, CFSTR(".har"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(a1, "_createNewFileWithFileName:outputDirectory:error:", v8, v6, &v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v47;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    AMSLogKey();
    v44 = v8;
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v9);
    v16 = a4;
    v17 = v10;
    v18 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v13;
    v50 = 2114;
    v51 = v15;
    v52 = 2114;
    v53 = v19;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Combining HAR entries to fileURL: %{public}@", buf, 0x20u);

    v9 = v18;
    v10 = v17;
    a4 = v16;

    v7 = v14;
    v8 = v44;
  }

  if (v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject", v44);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v49 = (uint64_t)v22;
      v50 = 2114;
      v51 = v10;
      v23 = v9;
      v24 = v22;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create a new HAR file. error = %{public}@", buf, 0x16u);

      v9 = v23;
    }

    v25 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v9, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "open");
    if ((objc_msgSend(a1, "_writeHeaderToStream:", v26) & 1) != 0)
    {
      objc_msgSend(a1, "_performCombiningFiles:toStream:", v7, v26);
      if ((objc_msgSend(a1, "_writeFooterToStream:", v26) & 1) != 0)
      {
        objc_msgSend(v26, "close");
        v25 = v7;
      }
      else
      {
        v35 = v9;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v36, "OSLogObject", v44);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_opt_class();
          v46 = v38;
          AMSLogableURL(v35);
          v39 = a4;
          v40 = v8;
          v41 = v7;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = (uint64_t)v38;
          v50 = 2114;
          v51 = v42;
          _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create footer for new fileURL: %{public}@", buf, 0x16u);

          v7 = v41;
          v8 = v40;
          a4 = v39;

        }
        v25 = 0;
        if (a4)
          *a4 = 0;
        v9 = v35;
      }
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject", v44);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = a4;
        v30 = v9;
        v31 = (void *)objc_opt_class();
        v45 = v31;
        AMSLogableURL(v30);
        v32 = v8;
        v33 = v7;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = (uint64_t)v31;
        v9 = v30;
        a4 = v29;
        v50 = 2114;
        v51 = v34;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create header for new fileURL: %{public}@", buf, 0x16u);

        v7 = v33;
        v8 = v32;

      }
      v25 = 0;
      if (a4)
        *a4 = 0;
    }

  }
  return v25;
}

+ (BOOL)_shouldWriteEntryDirectlyToDiskForURLString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    +[AMSHTTPArchiveController harURLFilters](AMSHTTPArchiveController, "harURLFilters", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (void)_streamToDiskWithEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[AMSHTTPArchiveController _disabled](AMSHTTPArchiveController, "_disabled"))
  {
    objc_msgSend(a1, "_createNewFileNameForCombining:extension:", 0, CFSTR(".temp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSHTTPArchive directory](AMSHTTPArchive, "directory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a1;
    v39 = 0;
    objc_msgSend(a1, "_createNewFileWithFileName:outputDirectory:error:", v5, v6, &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".temp"), CFSTR(".har"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E98];
    +[AMSHTTPArchive directory](AMSHTTPArchive, "directory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v13;
      v16 = v9;
      v17 = v5;
      v18 = v4;
      v19 = v8;
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v20;
      v8 = v19;
      v4 = v18;
      v5 = v17;
      v9 = v16;
      v13 = v36;
      v42 = 2114;
      v43 = v21;
      v44 = 2114;
      v45 = v22;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing HAR entries to temporary fileURL: %{public}@", buf, 0x20u);

    }
    if (v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = (uint64_t)v25;
        v42 = 2114;
        v43 = v8;
        v26 = v25;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create a new HAR file. error = %{public}@", buf, 0x16u);

      }
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v7, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "open");
    if ((objc_msgSend(v37, "_writeHeaderToStream:", v23) & 1) != 0)
    {
      objc_msgSend(v37, "_writeEntries:toStream:", v4, v23);
      if ((objc_msgSend(v37, "_writeFooterToStream:", v23) & 1) != 0)
      {
        objc_msgSend(v23, "close");
        objc_msgSend(v37, "_moveTemporaryFileURL:toFinalFileURL:", v7, v13);
        objc_msgSend(v37, "_periodicCleanup");
LABEL_25:

        goto LABEL_26;
      }
      v27 = v7;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v28, "OSLogObject");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        v7 = v27;
        goto LABEL_25;
      }
      v35 = (void *)objc_opt_class();
      v38 = v9;
      v31 = v35;
      AMSLogableURL(v27);
      v32 = v13;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (uint64_t)v35;
      v42 = 2114;
      v43 = v33;
      v34 = "%{public}@: Failed to create footer for temporary fileURL: %{public}@";
    }
    else
    {
      v27 = v7;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v28, "OSLogObject");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v30 = (void *)objc_opt_class();
      v38 = v9;
      v31 = v30;
      AMSLogableURL(v27);
      v32 = v13;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (uint64_t)v30;
      v42 = 2114;
      v43 = v33;
      v34 = "%{public}@: Failed to create header for temporary fileURL: %{public}@";
    }
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);

    v13 = v32;
    v8 = 0;
    v9 = v38;
    goto LABEL_24;
  }
LABEL_26:

}

+ (void)_moveTemporaryFileURL:(id)a3 toFinalFileURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v12 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v5, v6, &v18);
    v10 = v18;

    if ((v12 & 1) == 0)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        objc_msgSend(v10, "localizedDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v15;
        v21 = 2114;
        v22 = v6;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to move temporary har file to final path: %{public}@, error: %{public}@", buf, 0x20u);

      }
    }
  }

}

+ (id)_createNewFileNameForCombining:(BOOL)a3 extension:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = &stru_1E2548760;
  if (v4)
    v10 = CFSTR("_amscombined");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%f_streamwrite%@%@"), CFSTR("amstoold"), v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_createNewFileWithFileName:(id)a3 outputDirectory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v17);
  v11 = v17;

  if ((v13 & 1) != 0)
    goto LABEL_4;
  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v15 = 0;
    *a5 = v11;
  }
  else
  {
    v15 = 0;
  }
LABEL_5:

  return v15;
}

+ (void)_writeEntries:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v37;
    v9 = 0x1E0CB3000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v8);
        v27 = v10;
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v11, "entries");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v30)
        {
          v29 = *(_QWORD *)v33;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v33 != v29)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
              context = (void *)MEMORY[0x18D78A1C4]();
              objc_msgSend(v13, "ams_decompressedData");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_writeData:enumeratingBytesToStream:", v14, v7);
              objc_msgSend(v8, "lastObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11 == v15)
              {
                objc_msgSend(v11, "entries");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "lastObject");
                v17 = v9;
                v18 = v7;
                v19 = a1;
                v20 = v8;
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = v13 == v21;
                v8 = v20;
                a1 = v19;
                v7 = v18;
                v9 = v17;
                if (v22)
                  goto LABEL_15;
              }
              else
              {

              }
              objc_msgSend(*(id *)(v9 + 2368), "stringWithFormat:", CFSTR(","));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "dataUsingEncoding:", 4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_writeData:enumeratingBytesToStream:", v24, v7);

LABEL_15:
              objc_autoreleasePoolPop(context);
              ++v12;
            }
            while (v30 != v12);
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v30);
        }

        v10 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v26);
  }

}

+ (BOOL)_writeHeaderToStream:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_headerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_writeData:enumeratingBytesToStream:", v5, v4);

  return (char)a1;
}

+ (id)_headerData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{\"name\":\"AppleMediaServices\",\"version\":\"2.0\"}"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\"creator\":%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\"log\":%@,\"entries\":["), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_writeFooterToStream:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_footerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_writeData:enumeratingBytesToStream:", v5, v4);

  return (char)a1;
}

+ (id)_footerData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("],\"version\":\"1.2\"}}"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_writeData:(id)a3 enumeratingBytesToStream:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AMSStreamHTTPArchiveEntryController__writeData_enumeratingBytesToStream___block_invoke;
  v10[3] = &unk_1E2545FD8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateByteRangesUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __75__AMSStreamHTTPArchiveEntryController__writeData_enumeratingBytesToStream___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2);
  if (!result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

+ (void)_updateMaxBufferSize
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSMemoryPressure lastKnownStatus](AMSMemoryPressure, "lastKnownStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", 0))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 25;
      goto LABEL_15;
    }
    v6 = objc_opt_class();
    v7 = 25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v11 = 138543618;
    *(_QWORD *)&v11[4] = v6;
    *(_WORD *)&v11[12] = 2112;
    *(_QWORD *)&v11[14] = v8;
LABEL_11:
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Received memory warning, writing to disk to flush the buffer. Current max: %@", v11, 0x16u);

LABEL_15:
    objc_msgSend(a1, "ams_streamEntriesToDisk");
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "isEqualToString:", 0))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 12;
      goto LABEL_15;
    }
    v9 = objc_opt_class();
    v7 = 12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v11 = 138543618;
    *(_QWORD *)&v11[4] = v9;
    *(_WORD *)&v11[12] = 2112;
    *(_QWORD *)&v11[14] = v8;
    goto LABEL_11;
  }
  v7 = 50;
LABEL_16:
  objc_msgSend(a1, "buffer", *(_OWORD *)v11, *(_QWORD *)&v11[16]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxSize:", v7);

}

+ (void)_periodicCleanup
{
  NSObject *v2;

  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_42_2);

}

AMSKeepAlive *__55__AMSStreamHTTPArchiveEntryController__periodicCleanup__block_invoke()
{
  return +[AMSKeepAlive keepAliveWithName:style:block:](AMSKeepAlive, "keepAliveWithName:style:block:", CFSTR("AMSHTTPArchiveController"), 2, &__block_literal_global_46_1);
}

void __55__AMSStreamHTTPArchiveEntryController__periodicCleanup__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateByAddingTimeInterval:", -86400.0);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  +[AMSHTTPArchive removeHTTPArchiveFilesOlderThanDate:](AMSHTTPArchive, "removeHTTPArchiveFilesOlderThanDate:", v1);
}

+ (id)_harFileURLsInPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    v25 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtPath:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v7;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v9)
    {
      v10 = v9;
      v24 = v3;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
          if (!objc_msgSend(v13, "containsString:", CFSTR("_streamwrite.har"), v24)
            || (objc_msgSend(v13, "containsString:", CFSTR("_amscombined")) & 1) != 0
            || objc_msgSend(v13, "containsString:", CFSTR(".temp")))
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v14, "OSLogObject");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v32 = v16;
              v33 = 2114;
              v34 = v26;
              v35 = 2114;
              v36 = v13;
              _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping HAR combining for: %{public}@.", buf, 0x20u);
            }

          }
          else
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v17, "OSLogObject");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v32 = v19;
              v33 = 2114;
              v34 = v26;
              v35 = 2114;
              v36 = v13;
              _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Logging HAR for fileName: %{public}@.", buf, 0x20u);
            }

            objc_msgSend(v24, "stringByAppendingPathComponent:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v14);
          }

          ++v12;
        }
        while (v10 != v12);
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        v10 = v20;
      }
      while (v20);
      v21 = v8;
      v3 = v24;
    }
    else
    {
      v21 = v8;
    }
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = (id)objc_opt_class();
      v33 = 2114;
      v34 = v26;
      v22 = v32;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Directory containing HAR files does not exist.", buf, 0x16u);

    }
    v25 = 0;
  }

  return v25;
}

+ (void)_performCombiningFiles:(id)a3 toStream:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id obj;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  objc_msgSend(a1, "_headerData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v35 = a1;
  objc_msgSend(a1, "_footerData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v32)
  {
    v11 = 0;
    v28 = -(uint64_t)(v8 + v10);
    v29 = *(_QWORD *)v43;
    v30 = v10;
    v31 = v8;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v41 = 0;
        v34 = v13;
        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v14, "seekToEndReturningOffset:error:", &v41, &v40);
        v15 = v40;

        v16 = v41;
        v17 = v41 - v10;
        v39 = 0;
        objc_msgSend(v14, "seekToOffset:error:", v8, &v39);
        v11 = v39;

        v18 = (void *)MEMORY[0x18D78A1C4]();
        if (v8 < v17)
        {
          v19 = v28 + v16;
          v20 = v8;
          while (1)
          {
            v21 = v19 >= 0x400 ? 1024 : v19;
            v38 = 0;
            objc_msgSend(v14, "readDataUpToLength:error:", v21, &v38);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v38;

            objc_msgSend(v35, "_writeData:enumeratingBytesToStream:", v22, v36);
            if (v19 < 0x401)
              break;
            v20 += 1024;
            v37 = 0;
            objc_msgSend(v14, "seekToOffset:error:", v20, &v37);
            v11 = v37;

            objc_autoreleasePoolPop(v18);
            v18 = (void *)MEMORY[0x18D78A1C4]();
            v19 -= 1024;
            if (v20 >= v17)
              goto LABEL_15;
          }

          v11 = v23;
        }
LABEL_15:
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeItemAtPath:error:", v34, 0);

        objc_msgSend(obj, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34 != v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(","));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dataUsingEncoding:", 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_writeData:enumeratingBytesToStream:", v27, v36);

        }
        v8 = v31;
        v10 = v30;
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v32);

  }
}

@end
