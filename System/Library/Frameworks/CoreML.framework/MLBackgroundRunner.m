@implementation MLBackgroundRunner

- (MLBackgroundRunner)init
{
  MLBackgroundRunner *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *watchdogQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *delegateQueue;
  MLBackgroundRunner *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MLBackgroundRunner;
  v2 = -[MLBackgroundRunner init](&v11, sel_init);
  if (!v2)
    goto LABEL_3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("CoreML Background Extension Watchdog Queue", v3);
  watchdogQueue = v2->_watchdogQueue;
  v2->_watchdogQueue = (OS_dispatch_queue *)v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("CoreML Background Extension Queue", v6);
  delegateQueue = v2->_delegateQueue;
  v2->_delegateQueue = (OS_dispatch_queue *)v7;

  v9 = 0;
  if (-[MLBackgroundRunner createExtensionDataSourceWithInfoKey:conformingToProtocol:](v2, "createExtensionDataSourceWithInfoKey:conformingToProtocol:", CFSTR("MLBackgroundDataSourceClass"), &unk_1EE465710))
  {
LABEL_3:
    v9 = v2;
  }

  return v9;
}

- (BOOL)prepareForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLBackgroundRunner setActivity:](self, "setActivity:", v4);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MLBackgroundTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  -[MLBackgroundRunner setTask:](self, "setTask:", v7);

  -[MLBackgroundRunner task](self, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Unable to de-serialize task from data: %@", buf, 0xCu);
    }

  }
  return v9 != 0;
}

- (BOOL)createExtensionDataSourceWithInfoKey:(id)a3 conformingToProtocol:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  Class v11;
  objc_class *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v20;
  objc_class *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    v11 = NSClassFromString(v10);
    if (v11)
    {
      v12 = v11;
      if ((-[objc_class conformsToProtocol:](v11, "conformsToProtocol:", v7) & 1) != 0)
      {
        v13 = objc_alloc_init(v12);
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v20 = 138543618;
          v21 = v12;
          v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_19C486000, v14, OS_LOG_TYPE_INFO, "Created data source of class %{public}@: %@", (uint8_t *)&v20, 0x16u);
        }

        -[MLBackgroundRunner setDataSource:](self, "setDataSource:", v13);
        v15 = 1;
        goto LABEL_12;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        v15 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v20 = 138543874;
      v21 = v6;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v7;
      v16 = "Info.plist key %{public}@ has value \"%{public}@\", but that class doesn't conform to the %{public}@ protocol";
      v17 = v13;
      v18 = 32;
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v20 = 138543618;
      v21 = v6;
      v22 = 2114;
      v23 = v10;
      v16 = "Info.plist key %{public}@ has value \"%{public}@\", but no class with that name was found.";
      v17 = v13;
      v18 = 22;
    }
    _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);
    goto LABEL_11;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (unsigned)start
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned __int8 v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  __CFString *v35;
  MLDictionaryFeatureProvider *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  MLArrayBatchProvider *v41;
  void *v42;
  MLArrayBatchProvider *v43;
  void *v44;
  NSObject *v45;
  MLArrayBatchProvider *v46;
  uint64_t v47;
  void *v49;
  void *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  __int128 v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  MLBackgroundRunner *v58;
  MLArrayBatchProvider *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  uint64_t *v64;
  __int128 *v65;
  __int128 *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[7];
  _QWORD v74[6];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD block[6];
  id obj;
  uint64_t v81;
  const __CFString *v82;
  __CFString *v83;
  uint8_t v84[4];
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE buf[24];
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  __int128 v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[MLBackgroundRunner task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  if (!v4)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MLBackgroundRunner task](self, "task");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v95) = 138412290;
      *(_QWORD *)((char *)&v95 + 4) = objc_opt_class();
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Task of unexpected type: %@", (uint8_t *)&v95, 0xCu);

    }
    goto LABEL_13;
  }
  -[MLBackgroundRunner dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MLBackgroundRunner dataSource](self, "dataSource");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v95) = 138412290;
      *(_QWORD *)((char *)&v95 + 4) = v50;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Data source (%@) for inference does not conform to MLBackgroundPredictionTask", (uint8_t *)&v95, 0xCu);

    }
LABEL_13:

    return 1;
  }
  *(_QWORD *)&v95 = 0;
  *((_QWORD *)&v95 + 1) = &v95;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__14413;
  v98 = __Block_byref_object_dispose__14414;
  v99 = 0;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  -[MLBackgroundRunner task](self, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setAllowBackgroundGPUCompute:", 1);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_19C486000, v11, OS_LOG_TYPE_INFO, "Using model configuration: %@", buf, 0xCu);
  }

  kdebug_trace();
  v12 = *((_QWORD *)&v95 + 1);
  obj = *(id *)(*((_QWORD *)&v95 + 1) + 40);
  +[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v9, v10, &obj);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v12 + 40), obj);
  kdebug_trace();
  if (v55 && !*(_QWORD *)(*((_QWORD *)&v95 + 1) + 40))
  {
    v16 = 1;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v51 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v95 + 1) + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v92 = v51;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Error loading model from %@ (%@): %@", buf, 0x20u);
    }

    v16 = 0;
  }

  objc_autoreleasePoolPop(v7);
  if (v16)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v92 = __Block_byref_object_copy__14413;
    v93 = __Block_byref_object_dispose__14414;
    v94 = 0;
    -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-batchProviderForTask:"), v17, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__MLBackgroundRunner_start__block_invoke;
    block[3] = &unk_1E3D66E20;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(v19, block);

    objc_msgSend(v18, "invalidate");
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-count"), v21, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v74[0] = v20;
    v74[1] = 3221225472;
    v74[2] = __27__MLBackgroundRunner_start__block_invoke_2;
    v74[3] = &unk_1E3D66200;
    v74[4] = &v75;
    v74[5] = buf;
    dispatch_sync(v23, v74);

    objc_msgSend(v22, "invalidate");
    -[MLBackgroundRunner dataSource](self, "dataSource");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLBackgroundRunner task](self, "task");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76[3] >= 1)
    {
      v25 = 0;
      *(_QWORD *)&v24 = 138412290;
      v52 = v24;
      do
      {
        if (-[MLBackgroundRunner shouldStop](self, "shouldStop", v52))
          break;
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LODWORD(v86) = 134217984;
          *(_QWORD *)((char *)&v86 + 4) = v25;
          _os_log_impl(&dword_19C486000, v26, OS_LOG_TYPE_INFO, "Processing batch %ld", (uint8_t *)&v86, 0xCu);
        }

        *(_QWORD *)&v86 = 0;
        *((_QWORD *)&v86 + 1) = &v86;
        v87 = 0x3032000000;
        v88 = __Block_byref_object_copy__14413;
        v89 = __Block_byref_object_dispose__14414;
        v90 = 0;
        -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-featuresAtIndex:"), v27, 2.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        kdebug_trace();
        -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        v73[0] = v20;
        v73[1] = 3221225472;
        v73[2] = __27__MLBackgroundRunner_start__block_invoke_102;
        v73[3] = &unk_1E3D66228;
        v73[4] = &v86;
        v73[5] = buf;
        v73[6] = v25;
        dispatch_sync(v29, v73);

        kdebug_trace();
        objc_msgSend(v28, "invalidate");
        v67 = 0;
        v68 = &v67;
        v69 = 0x3032000000;
        v70 = __Block_byref_object_copy__14413;
        v71 = __Block_byref_object_dispose__14414;
        v72 = 0;
        -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-predictionFrom*"), v30, 10.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
        v32 = objc_claimAutoreleasedReturnValue();
        v61[0] = v20;
        v61[1] = 3221225472;
        v61[2] = __27__MLBackgroundRunner_start__block_invoke_2_105;
        v61[3] = &unk_1E3D66250;
        v64 = &v67;
        v62 = v55;
        v65 = &v86;
        v63 = v54;
        v66 = &v95;
        dispatch_sync(v32, v61);

        objc_msgSend(v31, "invalidate");
        if (*(_QWORD *)(*((_QWORD *)&v95 + 1) + 40))
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v47 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 40);
            *(_DWORD *)v84 = v52;
            v85 = v47;
            _os_log_error_impl(&dword_19C486000, v33, OS_LOG_TYPE_ERROR, "Error executing model: %@", v84, 0xCu);
          }

        }
        if (!v68[5])
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 40), "localizedFailureReason");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
            v35 = (__CFString *)v34;
          else
            v35 = CFSTR("Timeout");
          v36 = [MLDictionaryFeatureProvider alloc];
          v82 = CFSTR("errorString");
          v83 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *((_QWORD *)&v95 + 1);
          v60 = *(id *)(*((_QWORD *)&v95 + 1) + 40);
          v39 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v36, "initWithDictionary:error:", v37, &v60);
          objc_storeStrong((id *)(v38 + 40), v60);
          v40 = (void *)v68[5];
          v68[5] = v39;

        }
        v41 = [MLArrayBatchProvider alloc];
        v81 = v68[5];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[MLArrayBatchProvider initWithFeatureProviderArray:](v41, "initWithFeatureProviderArray:", v42);

        -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-task:processPredictionResults:error:"), v44, 5.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
        v45 = objc_claimAutoreleasedReturnValue();
        v56[0] = v20;
        v56[1] = 3221225472;
        v56[2] = __27__MLBackgroundRunner_start__block_invoke_116;
        v56[3] = &unk_1E3D66278;
        v57 = v53;
        v58 = self;
        v46 = v43;
        v59 = v46;
        dispatch_sync(v45, v56);

        objc_msgSend(v22, "invalidate");
        _Block_object_dispose(&v67, 8);

        _Block_object_dispose(&v86, 8);
        ++v25;
      }
      while (v25 < v76[3]);
    }

    -[MLBackgroundRunner stop](self, "stop");
    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(buf, 8);

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }

  _Block_object_dispose(&v95, 8);
  return v14;
}

- (void)stop
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];

  -[MLBackgroundRunner setShouldStop:](self, "setShouldStop:", 1);
  kdebug_trace();
  -[MLBackgroundRunner watchdogQueue](self, "watchdogQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLBackgroundWatchdog watchdogWithTimeout:label:queue:](MLBackgroundWatchdog, "watchdogWithTimeout:label:queue:", CFSTR("-taskWillEnd:"), v3, 5.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MLBackgroundRunner delegateQueue](self, "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__MLBackgroundRunner_stop__block_invoke;
  block[3] = &unk_1E3D66E48;
  block[4] = self;
  dispatch_sync(v4, block);

  objc_msgSend(v5, "invalidate");
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (MLBackgroundTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSObject)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (OS_dispatch_queue)watchdogQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWatchdogQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

uint64_t __26__MLBackgroundRunner_stop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "taskWillEnd:", v4);

  return kdebug_trace();
}

void __27__MLBackgroundRunner_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v7, "batchProviderForTask:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __27__MLBackgroundRunner_start__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __27__MLBackgroundRunner_start__block_invoke_102(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "featuresAtIndex:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __27__MLBackgroundRunner_start__block_invoke_2_105(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "predictionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "predictionFromFeatures:options:error:", v2, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __27__MLBackgroundRunner_start__block_invoke_116(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  kdebug_trace();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "task:processPredictionResults:error:", v4, *(_QWORD *)(a1 + 48), 0);

  return kdebug_trace();
}

@end
