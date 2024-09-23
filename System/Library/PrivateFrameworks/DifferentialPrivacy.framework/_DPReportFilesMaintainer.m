@implementation _DPReportFilesMaintainer

- (_DPReportFilesMaintainer)initWithDirectoryPath:(id)a3
{
  id v5;
  _DPReportFilesMaintainer *v6;
  _DPReportFilesMaintainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPReportFilesMaintainer;
  v6 = -[_DPReportFilesMaintainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);

  return v7;
}

- (_DPReportFilesMaintainer)init
{
  void *v3;
  _DPReportFilesMaintainer *v4;

  +[_DPStrings reportsDirectoryPath](_DPStrings, "reportsDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DPReportFilesMaintainer initWithDirectoryPath:](self, "initWithDirectoryPath:", v3);

  return v4;
}

+ (id)reportsInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *context;
  char v15;

  v3 = a3;
  context = (void *)MEMORY[0x1D8256B78]();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtPath:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v9, &v15))
      {
        if (v15)
        {
          objc_msgSend(v6, "skipDescendents");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
      }

      objc_msgSend(v6, "nextObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    while (v11);
  }
  v12 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(context);
  return v12;
}

+ (id)retiredReportsPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), a3, CFSTR("Retired"));
}

+ (BOOL)removeFilesFrom:(id)a3 olderThanSecond:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = 0x1E0CB3000uLL;
    do
    {
      objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("%@/%@"), v5, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v12, &v21))
      {
        if (v21)
        {
          objc_msgSend(v8, "skipDescendents");
        }
        else
        {
          objc_msgSend(v7, "attributesOfItemAtPath:error:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileCreationDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "compare:", v6) == -1)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "attributesOfItemAtPath:error:", v12, 0);
            v16 = v11;
            v17 = v6;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "fileSize");

            v6 = v17;
            v11 = v16;

            objc_msgSend(v7, "removeItemAtPath:error:", v12, 0);
          }

        }
      }

      objc_msgSend(v8, "nextObject");
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v19;
    }
    while (v19);
  }

  return 1;
}

+ (BOOL)retireFiles:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  char v21;
  id v23;
  char v24;
  NSObject *obj;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  if ((objc_msgSend(v26, "fileExistsAtPath:isDirectory:", v6, &v33) & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      +[_DPReportFilesMaintainer retireFiles:toDirectory:].cold.2();
    goto LABEL_19;
  }
  if (!v33)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      +[_DPReportFilesMaintainer retireFiles:toDirectory:].cold.1();
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v7)
  {
    v8 = v7;
    v23 = v5;
    v9 = *(_QWORD *)v30;
    v24 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v17, "attributesOfItemAtPath:error:", v16, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileSize");

        v28 = 0;
        LOBYTE(v17) = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v11, v15, &v28);
        v19 = v28;
        if ((v17 & 1) == 0)
        {
          +[_DPLog daemon](_DPLog, "daemon");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v35 = v11;
            v36 = 2112;
            v37 = v15;
            v38 = 2112;
            v39 = v19;
            _os_log_debug_impl(&dword_1D3FAA000, v20, OS_LOG_TYPE_DEBUG, "moveItemAtURL:%@ toURL:%@ failed with error %@", buf, 0x20u);
          }

          v24 = 0;
        }

      }
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v8);
    v5 = v23;
    v21 = v24;
  }
  else
  {
    v21 = 1;
  }
LABEL_20:

  return v21 & 1;
}

- (BOOL)doMaintenance
{
  double v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (double)(unint64_t)kSecondsIn3Day;
  v4 = (void *)MEMORY[0x1D8256B78](self, a2);
  objc_msgSend((id)objc_opt_class(), "removeFilesFrom:olderThanSecond:", self->_reportsDirectoryPath, v3);
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "retiredReportsPath:", self->_reportsDirectoryPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFilesFrom:olderThanSecond:", v6, v3);

  objc_autoreleasePoolPop(v4);
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
  v7[2] = __65___DPReportFilesMaintainer_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E95D8FC0;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256D34](v7);
  +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v4, kSecondsIn24Hours, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v6);
}

- (NSString)reportsDirectoryPath
{
  return self->_reportsDirectoryPath;
}

- (void)setReportsDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportsDirectoryPath, 0);
}

+ (void)retireFiles:toDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_1D3FAA000, v0, v1, "fileExistsAtPath:isDirectory: was successful for %@ ; isDirectory=%d");
}

+ (void)retireFiles:toDirectory:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_1D3FAA000, v0, v1, "fileExistsAtPath:isDirectory: failed for %@ ; isDirectory=%d");
}

@end
