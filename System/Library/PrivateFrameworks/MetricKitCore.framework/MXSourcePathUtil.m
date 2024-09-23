@implementation MXSourcePathUtil

- (MXSourcePathUtil)initWithDateUtil:(id)a3 andStorageUtil:(id)a4
{
  id v7;
  id v8;
  MXSourcePathUtil *v9;
  MXSourcePathUtil *v10;
  os_log_t v11;
  OS_os_log *logHandle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXSourcePathUtil;
  v9 = -[MXSourcePathUtil init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateUtil, a3);
    objc_storeStrong((id *)&v10->_storageUtil, a4);
    v11 = os_log_create("com.apple.metrickit", "source.filepath.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle)
      objc_storeStrong((id *)&v10->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v10;
}

- (id)filePathOfMetricSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:](self, "_setupSourceDirectoryForSourceID:andBundleID:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MXSourcePathUtil _filePathOfMetricSourcePayloadForDate:andSourceDirectory:](self, "_filePathOfMetricSourcePayloadForDate:andSourceDirectory:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)filePathOfDiagnosticSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:](self, "_setupSourceDirectoryForSourceID:andBundleID:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MXSourcePathUtil _filePathOfDiagnosticSourcePayloadForDate:andSourceDirectory:](self, "_filePathOfDiagnosticSourcePayloadForDate:andSourceDirectory:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cleanDataDirectoryForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 3)
    -[MXSourcePathUtil _removeFilesForSourceID:](self, "_removeFilesForSourceID:");
}

- (void)cleanDiagnosticsDirectoryForSource:(int64_t)a3 andClient:(id)a4
{
  if ((unint64_t)(a3 - 3) <= 2)
    -[MXSourcePathUtil _removeFilesForSourceID:andClient:](self, "_removeFilesForSourceID:andClient:");
}

- (void)removeDeliveredDiagnosticsForSourceID:(int64_t)a3 forDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MXStorageUtilProtocol *storageUtil;
  void *v11;
  id v12;
  OS_os_log *logHandle;
  id v14;
  void *v15;
  MXStorageUtilProtocol *v16;
  id v17;
  id v18;

  v6 = a4;
  objc_msgSend(&unk_24E2FF018, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.3();
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  storageUtil = self->_storageUtil;
  v18 = 0;
  -[MXStorageUtilProtocol filesFromDirectory:error:](storageUtil, "filesFromDirectory:error:", v9, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  logHandle = self->_logHandle;
  if (v12)
  {
    v14 = v12;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.2();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.1(logHandle);
    -[MXDateUtil stringFromDate:](self->_dateUtil, "stringFromDate:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_storageUtil;
    v17 = 0;
    -[MXStorageUtilProtocol removeFiles:withFilenameContainsSubstring:fromDirectory:error:](v16, "removeFiles:withFilenameContainsSubstring:fromDirectory:error:", v11, v15, v9, &v17);
    v14 = v17;

  }
}

- (id)_filePathOfMetricSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4
{
  MXDateUtil *dateUtil;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  dateUtil = self->_dateUtil;
  v6 = a4;
  -[MXDateUtil stringFromDate:](dateUtil, "stringFromDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("log-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_filePathOfDiagnosticSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4
{
  MXDateUtil *dateUtil;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  dateUtil = self->_dateUtil;
  v6 = a4;
  -[MXDateUtil stringFromDate:](dateUtil, "stringFromDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("diag-log-%@-%@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_setupSourceDirectoryForSourceID:(int64_t)a3 andBundleID:(id)a4
{
  void *v6;
  id v7;
  MXStorageUtilProtocol *storageUtil;
  uint64_t v10;

  -[MXSourcePathUtil _sourceDirectoryForSource:andBundleID:](self, "_sourceDirectoryForSource:andBundleID:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MXStorageUtilProtocol isDataExistAsDirectoryForPath:](self->_storageUtil, "isDataExistAsDirectoryForPath:", v6))
  {
    if (a3 == 2)
    {
      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
        -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:].cold.1();
      if ((-[MXStorageUtilProtocol removeExistingFilesFromDirectory:](self->_storageUtil, "removeExistingFilesFromDirectory:", v6) & 1) == 0)
      {
        v7 = 0;
        goto LABEL_11;
      }
    }
LABEL_10:
    v7 = v6;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:].cold.2();
  storageUtil = self->_storageUtil;
  v10 = 0;
  v7 = 0;
  if (-[MXStorageUtilProtocol createDirectory:error:](storageUtil, "createDirectory:error:", v6, &v10))
    goto LABEL_10;
LABEL_11:

  return v7;
}

- (id)_sourceDirectoryForSource:(int64_t)a3 andBundleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(&unk_24E2FF030, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 2)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)(a3 - 3) > 2)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_removeFilesForSourceID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  MXStorageUtilProtocol *storageUtil;
  void *v8;
  id v9;
  OS_os_log *logHandle;
  id v11;
  MXStorageUtilProtocol *v12;
  id v13;
  id v14;

  objc_msgSend(&unk_24E2FF048, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.3();
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  storageUtil = self->_storageUtil;
  v14 = 0;
  -[MXStorageUtilProtocol filesFromDirectory:error:](storageUtil, "filesFromDirectory:error:", v6, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  logHandle = self->_logHandle;
  if (v9)
  {
    v11 = v9;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.2();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.1(logHandle);
    v12 = self->_storageUtil;
    v13 = 0;
    -[MXStorageUtilProtocol removeFiles:fromDirectory:error:](v12, "removeFiles:fromDirectory:error:", v8, v6, &v13);
    v11 = v13;
  }

}

- (void)_removeFilesForSourceID:(int64_t)a3 andClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MXStorageUtilProtocol *storageUtil;
  void *v12;
  id v13;
  OS_os_log *logHandle;
  id v15;
  MXStorageUtilProtocol *v16;
  id v17;
  id v18;

  v6 = a4;
  objc_msgSend(&unk_24E2FF060, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.3();
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  storageUtil = self->_storageUtil;
  v18 = 0;
  -[MXStorageUtilProtocol filesFromDirectory:error:](storageUtil, "filesFromDirectory:error:", v10, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  logHandle = self->_logHandle;
  if (v13)
  {
    v15 = v13;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.2();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:].cold.1(logHandle);
    v16 = self->_storageUtil;
    v17 = 0;
    -[MXStorageUtilProtocol removeFiles:fromDirectory:error:](v16, "removeFiles:fromDirectory:error:", v12, v10, &v17);
    v15 = v17;
  }

}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDateUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStorageUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_dateUtil, 0);
}

- (void)removeDeliveredDiagnosticsForSourceID:(void *)a1 forDate:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_0(a1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_0(&dword_21E837000, v2, v3, "Found %lu files to clean for source: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)removeDeliveredDiagnosticsForSourceID:forDate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Failed to read contents of %@ source directory: %@");
  OUTLINED_FUNCTION_5();
}

- (void)removeDeliveredDiagnosticsForSourceID:forDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Cleaning %@ Directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setupSourceDirectoryForSourceID:andBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Source Directory %@ exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setupSourceDirectoryForSourceID:andBundleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Creating Source Directory at path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
