@implementation BGSystemTaskCheckpoints

+ (id)logger
{
  if (logger_onceToken_0 != -1)
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  return (id)logger_log_0;
}

void __33__BGSystemTaskCheckpoints_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  v1 = (void *)logger_log_0;
  logger_log_0 = (uint64_t)v0;

}

+ (BOOL)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 value:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218498;
    v13 = a3;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1D13A5000, v10, OS_LOG_TYPE_DEFAULT, "Received checkpoint %lu for %@ with value %@", (uint8_t *)&v12, 0x20u);
  }

  return 1;
}

+ (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v16 = a3;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_1D13A5000, v8, OS_LOG_TYPE_DEFAULT, "Received feature checkpoint %lu for feature %lu", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "reportFeatureCheckpoint:forFeature:error:", a3, a4, &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v16 = (unint64_t)v11;
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = a4;
      _os_log_error_impl(&dword_1D13A5000, v12, OS_LOG_TYPE_ERROR, "Error: %@ feature checkpoint %lu for feature %lu", buf, 0x20u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }

  return v10;
}

+ (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = a3;
    v17 = 2112;
    v18 = (unint64_t)v7;
    _os_log_impl(&dword_1D13A5000, v8, OS_LOG_TYPE_DEFAULT, "Received custom checkpoint %lu for task %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "reportCustomCheckpoint:forTask:error:", a3, v7, &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v16 = (unint64_t)v11;
      v17 = 2048;
      v18 = a3;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_1D13A5000, v12, OS_LOG_TYPE_ERROR, "Error: %@ custom checkpoint %lu for task %@", buf, 0x20u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }

  return v10;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BGSystemTaskCheckpoints_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __41__BGSystemTaskCheckpoints_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (BGSystemTaskCheckpoints)init
{
  BGSystemTaskCheckpoints *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BGSystemTaskCheckpoints;
  v2 = -[BGSystemTaskCheckpoints init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.bgst.taskCheckpoints", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (BOOL)reportProgressForTaskWithName:(id)a3 withGlobalTarget:(unint64_t)a4 completed:(unint64_t)a5 atDate:(id)a6 category:(unint64_t)a7 subCategory:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *queue;
  id v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  BGSystemTaskCheckpoints *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a8;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 1;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  queue = self->_queue;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke;
  v28 = &unk_1E920F950;
  v32 = &v37;
  v33 = &v43;
  v34 = a5;
  v35 = a4;
  v36 = a7;
  v19 = v17;
  v29 = v19;
  v30 = self;
  v20 = v15;
  v31 = v20;
  dispatch_sync(queue, &v25);
  if (!*((_BYTE *)v44 + 24))
  {
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger", v25, v26, v27, v28, v29, v30);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = v38[5];
      *(_DWORD *)buf = 138413314;
      v48 = v24;
      v49 = 2048;
      v50 = a5;
      v51 = 2048;
      v52 = a4;
      v53 = 2048;
      v54 = a7;
      v55 = 2112;
      v56 = v19;
      _os_log_error_impl(&dword_1D13A5000, v21, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
    }

    if (a9)
      *a9 = objc_retainAutorelease((id)v38[5]);
  }
  v22 = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v22;
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 72) < 0x65uLL)
  {
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 72);
      v7 = *(_QWORD *)(a1 + 80);
      v8 = *(_QWORD *)(a1 + 88);
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v54 = v6;
      v55 = 2048;
      v56 = v7;
      v57 = 2048;
      v58 = v8;
      v59 = 2112;
      v60 = v9;
      _os_log_impl(&dword_1D13A5000, v5, OS_LOG_TYPE_DEFAULT, "Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setTaskToProgressMap:", v11);

    }
    v12 = *(__CFString **)(a1 + 32);
    if (!v12)
      v12 = CFSTR("default");
    v13 = v12;
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@-%@"), v15, v16, *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v17);

    }
    objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("progress"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v25 = objc_msgSend(v24, "unsignedIntegerValue");
    else
      v25 = 0;
    objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("target"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      v29 = objc_msgSend(v28, "unsignedIntegerValue");
    else
      v29 = 0;
    if (v29 == *(_QWORD *)(a1 + 80) && (v30 = *(_QWORD *)(a1 + 72), v31 = v30 >= v25, v32 = v30 - v25, v31) && v32 <= 4)
    {
      +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v48 = *(_QWORD *)(a1 + 72);
        v49 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 134218752;
        v54 = v48;
        v55 = 2048;
        v56 = v25;
        v57 = 2048;
        v58 = v29;
        v59 = 2048;
        v60 = v49;
        _os_log_debug_impl(&dword_1D13A5000, v33, OS_LOG_TYPE_DEBUG, "No significant change since last progress report. Caching the result. Completed %lu [Past :%lu] Target %lu [Past :%lu]", buf, 0x2Au);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(void **)(a1 + 48);
      v36 = *(_QWORD *)(a1 + 80);
      v37 = *(_QWORD *)(a1 + 88);
      v38 = *(_QWORD *)(a1 + 32);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_16;
      v50[3] = &unk_1E920F928;
      v39 = *(_QWORD *)(a1 + 72);
      v52 = *(_QWORD *)(a1 + 64);
      v51 = v35;
      objc_msgSend(v34, "reportTaskWorkloadProgress:target:completed:category:subCategory:completionHandler:", v51, v36, v39, v37, v38, v50);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v17);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v40, CFSTR("progress"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "taskToProgressMap");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v17);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v43, CFSTR("target"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 3, 0);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v43 = *(void **)(v47 + 40);
        *(_QWORD *)(v47 + 40) = v46;
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 4, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_16(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a2)
  {
    *(_BYTE *)(v3 + 24) = 1;
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D13A5000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reported task workload progress for %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 0;
    +[BGSystemTaskCheckpoints logger](BGSystemTaskCheckpoints, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_16_cold_1(a1, v4);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)taskToProgressMap
{
  return self->_taskToProgressMap;
}

- (void)setTaskToProgressMap:(id)a3
{
  objc_storeStrong((id *)&self->_taskToProgressMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToProgressMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D13A5000, a2, OS_LOG_TYPE_ERROR, "reportTaskWorkloadProgress: failed for %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
