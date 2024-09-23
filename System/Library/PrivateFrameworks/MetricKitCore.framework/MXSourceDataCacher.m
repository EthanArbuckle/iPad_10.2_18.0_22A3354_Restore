@implementation MXSourceDataCacher

- (MXSourceDataCacher)initWithSourcePathUtil:(id)a3 andStorageUtil:(id)a4 andBundleUtil:(id)a5
{
  id v9;
  id v10;
  id v11;
  MXSourceDataCacher *v12;
  MXSourceDataCacher *v13;
  os_log_t v14;
  OS_os_log *logHandle;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MXSourceDataCacher;
  v12 = -[MXSourceDataCacher init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePathUtil, a3);
    objc_storeStrong((id *)&v13->_storageUtil, a4);
    objc_storeStrong((id *)&v13->_bundleUtil, a5);
    v14 = os_log_create("com.apple.metrickit", "source.cache.manager");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v14;

    if (!v13->_logHandle)
      objc_storeStrong((id *)&v13->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v13;
}

- (BOOL)saveToSourceDirectoryWithMetricSourcePayload:(id)a3
{
  id v4;
  MXStorageUtilProtocol *storageUtil;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  MXSourcePathUtilProtocol *sourcePathUtil;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *logHandle;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  BOOL v24;
  id v26;

  v4 = a3;
  storageUtil = self->_storageUtil;
  v26 = 0;
  -[MXStorageUtilProtocol archivedDataWithObject:error:](storageUtil, "archivedDataWithObject:error:", v4, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.5();
    sourcePathUtil = self->_sourcePathUtil;
    v11 = objc_msgSend(v4, "sourceID");
    objc_msgSend(v4, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXSourcePathUtilProtocol filePathOfMetricSourcePayloadForSourceID:andBundleID:andDate:](sourcePathUtil, "filePathOfMetricSourcePayloadForSourceID:andBundleID:andDate:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v24 = 0;
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.4();
    if ((-[MXStorageUtilProtocol saveData:withFilePath:](self->_storageUtil, "saveData:withFilePath:", v6, v14) & 1) == 0)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.3(logHandle, v16, v17, v18, v19, v20, v21, v22);
    }

  }
  else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
  {
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.2();
  }
  v23 = self->_logHandle;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.1(v23, v4);
  v24 = 1;
LABEL_19:

  return v24;
}

- (BOOL)saveToSourceDirectoryWithDiagnosticSourcePayload:(id)a3
{
  id v4;
  MXStorageUtilProtocol *storageUtil;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  MXSourcePathUtilProtocol *sourcePathUtil;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  BOOL v25;
  NSObject *logHandle;
  id v28;

  v4 = a3;
  storageUtil = self->_storageUtil;
  v28 = 0;
  -[MXStorageUtilProtocol archivedDataWithObject:error:](storageUtil, "archivedDataWithObject:error:", v4, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.5();
    objc_msgSend(v4, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MXBundleUtilProtocol isAppExtensionFromBundleID:](self->_bundleUtil, "isAppExtensionFromBundleID:", v10)&& (-[MXBundleUtilProtocol mainAppBundleIDforExtension:](self->_bundleUtil, "mainAppBundleIDforExtension:", v10), v11 = objc_claimAutoreleasedReturnValue(), v10, (v10 = (void *)v11) == 0))
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXSourceDataCacher saveToSourceDirectoryWithDiagnosticSourcePayload:].cold.3(logHandle, v4);
    }
    else
    {
      sourcePathUtil = self->_sourcePathUtil;
      v13 = objc_msgSend(v4, "sourceID");
      objc_msgSend(v4, "datestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXSourcePathUtilProtocol filePathOfDiagnosticSourcePayloadForSourceID:andBundleID:andDate:](sourcePathUtil, "filePathOfDiagnosticSourcePayloadForSourceID:andBundleID:andDate:", v13, v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
          -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.4();
        if ((-[MXStorageUtilProtocol saveData:withFilePath:](self->_storageUtil, "saveData:withFilePath:", v6, v15) & 1) == 0)
        {
          v16 = self->_logHandle;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);
        }

        goto LABEL_18;
      }

    }
    v25 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.2();
LABEL_18:
  v24 = self->_logHandle;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.1(v24, v4);
  v25 = 1;
LABEL_25:

  return v25;
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourcePathUtil:(id)a3
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

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_6_0(a1);
  objc_msgSend(a2, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v3, v5, "Interested source data is now available : %@", v6);

  OUTLINED_FUNCTION_4_2();
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_21E837000, v0, v1, "Error archiving data: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21E837000, a1, a3, "Error writing file.", a5, a6, a7, a8, 0);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v0, v1, "Log filename: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v0, v1, "Writing data: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)saveToSourceDirectoryWithDiagnosticSourcePayload:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_6_0(a1);
  objc_msgSend(a2, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_21E837000, v3, v5, "Could not resolve Main App bunldeID for extension: %@", v6);

  OUTLINED_FUNCTION_4_2();
}

@end
