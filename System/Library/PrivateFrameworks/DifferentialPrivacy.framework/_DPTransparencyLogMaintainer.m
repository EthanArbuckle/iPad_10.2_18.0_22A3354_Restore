@implementation _DPTransparencyLogMaintainer

- (_DPTransparencyLogMaintainer)initWithDirectoryPath:(id)a3
{
  id v5;
  _DPTransparencyLogMaintainer *v6;
  _DPTransparencyLogMaintainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPTransparencyLogMaintainer;
  v6 = -[_DPTransparencyLogMaintainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);

  return v7;
}

- (_DPTransparencyLogMaintainer)init
{
  void *v3;
  _DPTransparencyLogMaintainer *v4;

  +[_DPStrings transparencyLogDirectoryPath](_DPStrings, "transparencyLogDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DPTransparencyLogMaintainer initWithDirectoryPath:](self, "initWithDirectoryPath:", v3);

  return v4;
}

+ (double)lifetimeOfFile:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = kSecondsIn3Day;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;
  if (v5)
  {
    v27 = v6;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v27);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v27;

    if (!v7)
    {
      +[_DPLog framework](_DPLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[_DPTransparencyLogMaintainer lifetimeOfFile:].cold.4((uint64_t)v3, v8, v9);

    }
    if (!-[NSObject count](v7, "count"))
    {
      v18 = 0.0;
      goto LABEL_28;
    }
    -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("key"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = objc_msgSend(v12, "length");
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v12;
        v31 = 2112;
        v32 = v3;
        _os_log_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_INFO, "Found the key %@ in transparency log %@", buf, 0x16u);
      }

      +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_24;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[_DPTransparencyLogMaintainer lifetimeOfFile:].cold.3((uint64_t)v3, v16, v19, v20, v21, v22, v23, v24);

    }
    +[_DPLog framework](_DPLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[_DPTransparencyLogMaintainer lifetimeOfFile:].cold.2();

    v17 = 0;
LABEL_24:
    if (objc_msgSend(v17, "transparencyLogLifetime"))
      v18 = (double)(unint64_t)objc_msgSend(v17, "transparencyLogLifetime") * 24.0 * 3600.0;
    else
      v18 = (double)v4;

    goto LABEL_28;
  }
  +[_DPLog framework](_DPLog, "framework");
  v7 = objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[_DPTransparencyLogMaintainer lifetimeOfFile:].cold.1((uint64_t)v3, v6, v7);
  v8 = v6;
LABEL_28:

  return v18;
}

+ (BOOL)checkAndRemoveFile:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "lifetimeOfFile:", v3);
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v8 = *MEMORY[0x1E0C998E8];
  v25 = 0;
  v9 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v26, v8, &v25);
  v10 = v26;
  v11 = v25;
  if ((v9 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:].cold.3();
    goto LABEL_9;
  }
  if (!v10)
  {
    +[_DPLog framework](_DPLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:].cold.1((uint64_t)v3, v12, v14, v15, v16, v17, v18, v19);
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "dateByAddingTimeInterval:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject compare:](v12, "compare:", v7) == -1)
  {
    v24 = 0;
    v13 = objc_msgSend(v6, "removeItemAtURL:error:", v3, &v24);
    v21 = v24;
    +[_DPLog framework](_DPLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v3;
        _os_log_impl(&dword_1D3FAA000, v23, OS_LOG_TYPE_INFO, "Successfully removed transparency log %@.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      +[_DPTransparencyLogMaintainer checkAndRemoveFile:].cold.2((uint64_t)v3, v21, v23);
    }

  }
  else
  {
    v13 = 1;
  }
LABEL_10:

  return v13;
}

- (BOOL)doMaintenance
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_DPTransparencyLogMaintainer reportsDirectoryPath](self, "reportsDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8256B78](v5);
        objc_msgSend((id)objc_opt_class(), "checkAndRemoveFile:", v9, (_QWORD)v12);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
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
  v7[2] = __69___DPTransparencyLogMaintainer_scheduleMaintenanceWithName_database___block_invoke;
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

+ (void)lifetimeOfFile:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "Failed to read transparency log file %@ with error %@.", v6);

  OUTLINED_FUNCTION_1_0();
}

+ (void)lifetimeOfFile:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, (uint64_t)v0, "No key properties was found for key %@ in file %@", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)lifetimeOfFile:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "No key found in the transparency log %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)lifetimeOfFile:(NSObject *)a3 .cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "Failed to parse the JSON transparency log for file %@ with error %@.", v6);

  OUTLINED_FUNCTION_1_0();
}

+ (void)checkAndRemoveFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "No value for NSURLCreationDateKey from %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)checkAndRemoveFile:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "Failed to remove transparency log %@ with error %@.", v6);

  OUTLINED_FUNCTION_1_0();
}

+ (void)checkAndRemoveFile:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, (uint64_t)v0, "Failed to read NSURLCreationDateKey from %@ with error %@.", v1);
  OUTLINED_FUNCTION_1();
}

@end
