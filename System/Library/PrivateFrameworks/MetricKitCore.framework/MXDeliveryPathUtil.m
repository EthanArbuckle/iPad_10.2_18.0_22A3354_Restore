@implementation MXDeliveryPathUtil

- (id)metricReportFilepathsFromClient:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[MXDeliveryPathUtil _applicationContainerPath](self, "_applicationContainerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXDeliveryPathUtil _metricDeliveryDirectoryForAppContainerPath:forClient:](self, "_metricDeliveryDirectoryForAppContainerPath:forClient:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXDeliveryPathUtil _filepathsFromDirectory:withError:](self, "_filepathsFromDirectory:withError:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)diagnosticReportFilepathsFromClient:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[MXDeliveryPathUtil _applicationContainerPath](self, "_applicationContainerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXDeliveryPathUtil _diagnosticDeliveryDirectoryForAppContainerPath:forClient:](self, "_diagnosticDeliveryDirectoryForAppContainerPath:forClient:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXDeliveryPathUtil _filepathsFromDirectory:withError:](self, "_filepathsFromDirectory:withError:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_filepathsFromDirectory:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[MXStorageUtilProtocol filesFromDirectory:error:](self->_storageUtil, "filesFromDirectory:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_applicationContainerPath
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/Caches/MetricKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXDeliveryPathUtil _applicationContainerPath].cold.1();
  return v4;
}

- (id)_metricDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Reports"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_diagnosticDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Diagnostics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MXDeliveryPathUtil)initWithStorageUtil:(id)a3 andBundleUtil:(id)a4
{
  id v7;
  id v8;
  MXDeliveryPathUtil *v9;
  MXDeliveryPathUtil *v10;
  os_log_t v11;
  OS_os_log *logHandle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXDeliveryPathUtil;
  v9 = -[MXDeliveryPathUtil init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storageUtil, a3);
    objc_storeStrong((id *)&v10->_bundleUtil, a4);
    v11 = os_log_create("com.apple.metrickit", "delivery.filepath.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle)
      objc_storeStrong((id *)&v10->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v10;
}

- (id)filepathOfMetricForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  -[MXDeliveryPathUtil _metricDeliveryDirectoryForAppContainerPath:forClient:](self, "_metricDeliveryDirectoryForAppContainerPath:forClient:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("report_"), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)filepathOfDiagnosticForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  -[MXDeliveryPathUtil _diagnosticDeliveryDirectoryForAppContainerPath:forClient:](self, "_diagnosticDeliveryDirectoryForAppContainerPath:forClient:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("diagnostic_report_"), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)applicationContainerPathForBundleID:(id)a3
{
  id v4;
  int v5;
  NSObject *logHandle;
  _BOOL4 v7;
  void *v8;

  v4 = a3;
  v5 = -[MXBundleUtilProtocol isAppInstalledForBundleID:](self->_bundleUtil, "isAppInstalledForBundleID:", v4);
  logHandle = self->_logHandle;
  v7 = os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[MXDeliveryPathUtil applicationContainerPathForBundleID:].cold.1(logHandle);
    -[MXDeliveryPathUtil _applicationContainerPath](self, "_applicationContainerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
      -[MXDeliveryPathUtil applicationContainerPathForBundleID:].cold.2();
    v8 = 0;
  }

  return v8;
}

- (BOOL)createMetricDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;

  v8 = a4;
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Reports"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v11 = -[MXDeliveryPathUtil _createMetricDirectoryForDeliveryAtPath:forClient:withError:](self, "_createMetricDirectoryForDeliveryAtPath:forClient:withError:", v10, v8, &v17);

  v12 = v17;
  v13 = v12;
  if (v11)
  {
    v16 = v12;
    -[MXDeliveryPathUtil _protectMetricUntilFirstUserAuthForPath:withError:](self, "_protectMetricUntilFirstUserAuthForPath:withError:", v10, &v16);
    v14 = v16;

    v13 = v14;
  }
  else if (a5)
  {
    v13 = objc_retainAutorelease(v12);
    *a5 = v13;
  }

  return v11;
}

- (BOOL)createDiagnosticDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;

  v8 = a4;
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Diagnostics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v11 = -[MXDeliveryPathUtil _createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:](self, "_createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:", v10, v8, &v17);
  v12 = v17;
  v13 = v12;
  if (v11)
  {
    v16 = v12;
    -[MXDeliveryPathUtil _protectDiagnosticUntilFirstUserAuthForPath:forClient:withError:](self, "_protectDiagnosticUntilFirstUserAuthForPath:forClient:withError:", v10, v8, &v16);
    v14 = v16;

    v13 = v14;
  }
  else if (a5)
  {
    v13 = objc_retainAutorelease(v12);
    *a5 = v13;
  }

  return v11;
}

- (BOOL)_createMetricDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  NSObject *logHandle;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  if ((-[MXStorageUtilProtocol createDirectory:error:](self->_storageUtil, "createDirectory:error:", a3, a5) & 1) != 0)
    return 1;
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    -[MXDeliveryPathUtil _createMetricDirectoryForDeliveryAtPath:forClient:withError:].cold.1((uint64_t)a5, logHandle, v8, v9, v10, v11, v12, v13);
  objc_msgSend(*a5, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {
    v15 = objc_msgSend(*a5, "code");

    if (v15 == 516)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (BOOL)_createDiagnosticDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSObject *logHandle;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v9))
  {
    if ((-[MXStorageUtilProtocol createDirectory:error:](self->_storageUtil, "createDirectory:error:", v8, a5) & 1) == 0)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXDeliveryPathUtil _createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:].cold.1((uint64_t)a5, logHandle, v11, v12, v13, v14, v15, v16);
      objc_msgSend(*a5, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {

LABEL_13:
        v19 = 0;
        goto LABEL_11;
      }
      v18 = objc_msgSend(*a5, "code");

      if (v18 != 516)
        goto LABEL_13;
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
  {
    -[MXDeliveryPathUtil _createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:].cold.2();
  }
  v19 = 1;
LABEL_11:

  return v19;
}

- (void)_protectMetricUntilFirstUserAuthForPath:(id)a3 withError:(id *)a4
{
  MXStorageUtilProtocol *storageUtil;
  id v7;
  id v8;

  storageUtil = self->_storageUtil;
  v7 = a3;
  -[MXStorageUtilProtocol attributesOfItemAtPath:error:](storageUtil, "attributesOfItemAtPath:error:", v7, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MXStorageUtilProtocol setAuthProtectionForPath:fromAttributes:](self->_storageUtil, "setAuthProtectionForPath:fromAttributes:", v7, v8);

}

- (void)_protectDiagnosticUntilFirstUserAuthForPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  MXStorageUtilProtocol *storageUtil;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  storageUtil = self->_storageUtil;
  v9 = a4;
  -[MXStorageUtilProtocol attributesOfItemAtPath:error:](storageUtil, "attributesOfItemAtPath:error:", v11, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(storageUtil) = objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v9);

  if ((_DWORD)storageUtil)
    -[MXStorageUtilProtocol setAuthProtectionForPath:fromAttributes:](self->_storageUtil, "setAuthProtectionForPath:fromAttributes:", v11, v10);

}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorageUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleUtil:(id)a3
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
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);
}

- (void)applicationContainerPathForBundleID:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BE668E8];
  v2 = a1;
  objc_msgSend(v1, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v2, v4, "Container Path: %@", v5);

}

- (void)applicationContainerPathForBundleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v0, v1, "Application: %@ uninstalled", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_applicationContainerPath
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v0, v1, "Application Container Path: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_createMetricDirectoryForDeliveryAtPath:(uint64_t)a3 forClient:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Error creating metrics directory: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_createDiagnosticDirectoryForDeliveryAtPath:(uint64_t)a3 forClient:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Error creating diagnostics directory: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21E837000, v0, v1, "failed to verify SDK version for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
