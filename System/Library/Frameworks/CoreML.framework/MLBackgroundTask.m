@implementation MLBackgroundTask

- (MLBackgroundTask)init
{
  MLBackgroundTask *v2;
  MLBackgroundTask *v3;
  objc_super v5;

  v2 = self;
  if ((-[MLBackgroundTask isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = v2;
    v5.super_class = (Class)MLBackgroundTask;
    v2 = -[MLBackgroundTask init](&v5, sel_init);
    v3 = v2;
  }

  return v3;
}

- (id)activityForScheduling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id DASActivityClass;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  void *v30;
  _BYTE buf[24];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v28;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLBackgroundTask taskIdentifier](self, "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@::%@"), v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    DASActivityClass = get_DASActivityClass();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v10 = (uint64_t *)get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
    v32 = get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
    if (!get_DASSchedulingPriorityBackgroundSymbolLoc_ptr)
    {
      v11 = (void *)DuetActivitySchedulerLibrary();
      v10 = (uint64_t *)dlsym(v11, "_DASSchedulingPriorityBackground");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
      get_DASSchedulingPriorityBackgroundSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(buf, 8);
    if (!v10)
      goto LABEL_16;
    v12 = *v10;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v15 = (id *)get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr;
    v32 = get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr;
    if (!get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr)
    {
      v16 = (void *)DuetActivitySchedulerLibrary();
      v15 = (id *)dlsym(v16, "_DASExtensionLaunchReasonMLCompute");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
      get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(buf, 8);
    if (!v15)
      goto LABEL_16;
    v17 = *v15;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v18 = (uint64_t *)get_DASActivityDurationModerateSymbolLoc_ptr;
    v32 = get_DASActivityDurationModerateSymbolLoc_ptr;
    if (!get_DASActivityDurationModerateSymbolLoc_ptr)
    {
      v19 = (void *)DuetActivitySchedulerLibrary();
      v18 = (uint64_t *)dlsym(v19, "_DASActivityDurationModerate");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
      get_DASActivityDurationModerateSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(buf, 8);
    if (!v18)
    {
LABEL_16:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v20 = *v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DASActivityClass, "extensionLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v8, v12, v14, v17, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = CFSTR("MLBackgroundTask");
    v30 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUserInfo:", v24);

    objc_msgSend(v23, "setAfterUserIsInactive:", 1);
    objc_msgSend(v23, "setCpuIntensive:", 1);
    objc_msgSend(v23, "setRequiresPlugin:", 1);
    objc_msgSend(v23, "setMemoryIntensive:", 1);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[MLBackgroundTask taskIdentifier](self, "taskIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Unable to archive task %@: %@", buf, 0x16u);

    }
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  MLBackgroundTask *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MLBackgroundTask *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MLBackgroundTask taskIdentifier](self, "taskIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLBackgroundTask taskIdentifier](v4, "taskIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MLBackgroundTask taskIdentifier](self, "taskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_taskIdentifier, CFSTR("taskIdentifier"));
}

- (MLBackgroundTask)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *taskIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  taskIdentifier = self->_taskIdentifier;
  self->_taskIdentifier = v5;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTaskIdentifier:", self->_taskIdentifier);
  return v4;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

+ (BOOL)scheduleTask:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE buf[24];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "Task must be a MLBackgroundPredictionTask or MLBackgroundModelUpdateTask.", buf, 2u);
    }
    v11 = 0;
    goto LABEL_19;
  }
  if (get_DASActivityClass() && get_DASSchedulerClass())
  {
    objc_msgSend(v3, "activityForScheduling");
    v4 = objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v5 = (void *)get_DASActivityGroupClass_softClass;
    v16 = get_DASActivityGroupClass_softClass;
    if (!get_DASActivityGroupClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __get_DASActivityGroupClass_block_invoke;
      v18 = &unk_1E3D65388;
      v19 = &v13;
      __get_DASActivityGroupClass_block_invoke((uint64_t)buf);
      v5 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "groupWithName:maxConcurrent:", CFSTR("CoreML Background Compute"), 1, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DASSchedulerClass(), "sharedScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitActivity:inGroup:", v4, v7);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v18 = v4;
      _os_log_impl(&dword_19C486000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling task %@ on scheduler %@. Activity: %@", buf, 0x20u);
    }

    if (v4)
      v10 = v8 == 0;
    else
      v10 = 1;
    v11 = !v10;

LABEL_19:
    goto LABEL_20;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

+ (BOOL)cancelTaskWithIdentifier:(id)a3
{
  objc_msgSend(a3, "length");
  return 0;
}

+ (BOOL)cancelAllTasks
{
  return 0;
}

+ (BOOL)taskIsScheduledWithIdentifier:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
