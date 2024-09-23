@implementation MKDiagnosticsMigrator

- (MKDiagnosticsMigrator)init
{
  MKDiagnosticsMigrator *v2;
  void *v3;
  uint64_t v4;
  NSString *basePath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKDiagnosticsMigrator;
  v2 = -[MKMigrator init](&v7, sel_init);
  if (v2)
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Library/MigrationKit/Diagnostics"));
    v4 = objc_claimAutoreleasedReturnValue();
    basePath = v2->_basePath;
    v2->_basePath = (NSString *)v4;

  }
  return v2;
}

- (void)saveData:(id)a3 fileName:(id)a4
{
  id v4;

  v4 = -[MKDiagnosticsMigrator saveData:toFile:](self, "saveData:toFile:", a3, a4);
}

- (void)savePerformanceMetrics:(id)a3
{
  NSString *v4;
  NSString *performanceMetricsPath;

  -[MKDiagnosticsMigrator saveData:toFile:](self, "saveData:toFile:", a3, CFSTR("performance.json"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  performanceMetricsPath = self->_performanceMetricsPath;
  self->_performanceMetricsPath = v4;

}

- (id)saveData:(id)a3 toFile:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSString *basePath;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v20;
  uint8_t buf[4];
  MKDiagnosticsMigrator *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a3;
  objc_msgSend(v7, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  basePath = self->_basePath;
  v20 = 0;
  v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", basePath, 1, 0, &v20);
  v12 = v20;

  if ((v11 & 1) == 0)
  {
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MKDiagnosticsMigrator saveData:toFile:].cold.2((uint64_t)self, (uint64_t)v12, v13);

  }
  -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "writeToFile:atomically:", v14, 0);

  +[MKLog log](MKLog, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_21EC08000, v17, OS_LOG_TYPE_INFO, "%@: Saved data to file: %@", buf, 0x16u);
    }

    v18 = v14;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MKDiagnosticsMigrator saveData:toFile:].cold.1((uint64_t)self, v17);

    v18 = 0;
  }

  return v18;
}

- (id)pathForPerformanceMetrics
{
  return self->_performanceMetricsPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetricsPath, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
}

- (void)saveData:(uint64_t)a1 toFile:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ Failed to save data to file", (uint8_t *)&v2, 0xCu);
}

- (void)saveData:(os_log_t)log toFile:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "%@: Failed to create directories: %@", (uint8_t *)&v3, 0x16u);
}

@end
