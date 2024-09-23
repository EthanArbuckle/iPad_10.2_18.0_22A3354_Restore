@implementation _DPTokenFetcher

- (_DPTokenFetcher)initWithTaskName:(id)a3
{
  id v4;
  _DPTokenFetcher *v5;
  uint64_t v6;
  NSString *taskName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPTokenFetcher;
  v5 = -[_DPTokenFetcher init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    taskName = v5->_taskName;
    v5->_taskName = (NSString *)v6;

    v5->_taskPeriodSeconds = +[_DPTokenFetcher getTaskPeriodSeconds](_DPTokenFetcher, "getTaskPeriodSeconds");
  }

  return v5;
}

- (void)doMaintenance
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Could not create connection to %@", a5, a6, a7, a8, 2u);
}

- (BOOL)cleanupStaleTokensInPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = v3;
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    +[_DPStrings tokensDirectoryPath](_DPStrings, "tokensDirectoryPath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attributesOfItemAtPath:error:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fileCreationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "dateByAddingTimeInterval:", 86500.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "compare:", v7) == -1)
        {
          v16 = v10;
          v17 = v7;
          v29 = 0;
          v18 = v6;
          v19 = objc_msgSend(v6, "removeItemAtPath:error:", v12, &v29);
          v20 = v29;
          +[_DPLog framework](_DPLog, "framework");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if ((v19 & 1) != 0)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v12;
              _os_log_impl(&dword_1D3FAA000, v22, OS_LOG_TYPE_INFO, "Successfully removed token bucket file %@.", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v35 = v12;
            v36 = 2112;
            v37 = v23;
            _os_log_error_impl(&dword_1D3FAA000, v22, OS_LOG_TYPE_ERROR, "Failed to remove token bucket file %@ with error %@.", buf, 0x16u);

          }
          v7 = v17;
          v10 = v16;
          v6 = v18;
          v9 = v27;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }

  return 1;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___DPTokenFetcher_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E95D8FC0;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256D34](v7);
  +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v4, +[_DPTokenFetcher getTaskPeriodSeconds](_DPTokenFetcher, "getTaskPeriodSeconds"), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v6);
}

+ (unint64_t)getTaskPeriodSeconds
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = kSecondsIn4Hours;
  +[_DPStrings submissionServiceDomainName](_DPStrings, "submissionServiceDomainName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPStrings tokenRefreshHoursKeyName](_DPStrings, "tokenRefreshHoursKeyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v3);
  v6 = v5;
  if (!v5)
  {
    +[_DPLog framework](_DPLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v3;
      v15 = 2048;
      v16 = v2;
      v9 = "No defaults in %@, using default token fresh interval of %lu seconds";
      v10 = v8;
      v11 = 22;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "integerForKey:", v4);
  if (v7 >= 1)
  {
    v2 = 3600 * v7;
    +[_DPLog framework](_DPLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412802;
      v14 = v3;
      v15 = 2112;
      v16 = (unint64_t)v4;
      v17 = 2048;
      v18 = v2;
      v9 = "Using value from %@.%@ to refresh tokens every %ld seconds";
      v10 = v8;
      v11 = 32;
LABEL_7:
      _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v2;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (unint64_t)taskPeriodSeconds
{
  return self->_taskPeriodSeconds;
}

- (void)setTaskPeriodSeconds:(unint64_t)a3
{
  self->_taskPeriodSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
}

@end
