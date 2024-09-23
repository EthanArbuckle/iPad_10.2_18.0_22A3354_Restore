@implementation MXDeliveryDataCacher

- (id)metricsForClient:(id)a3
{
  id v4;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXDeliveryDataCacher metricsForClient:].cold.1();
  deliveryPathUtil = self->_deliveryPathUtil;
  v9 = 0;
  -[MXDeliveryPathUtilProtocol metricReportFilepathsFromClient:withError:](deliveryPathUtil, "metricReportFilepathsFromClient:withError:", v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!v9)
  {
    -[MXDeliveryDataCacher _metricsFromFilepaths:](self, "_metricsFromFilepaths:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)diagnosticsForClient:(id)a3
{
  id v4;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXDeliveryDataCacher diagnosticsForClient:].cold.1();
  deliveryPathUtil = self->_deliveryPathUtil;
  v9 = 0;
  -[MXDeliveryPathUtilProtocol diagnosticReportFilepathsFromClient:withError:](deliveryPathUtil, "diagnosticReportFilepathsFromClient:withError:", v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!v9)
  {
    -[MXDeliveryDataCacher _diagnosticsFromFilepaths:](self, "_diagnosticsFromFilepaths:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {

      v7 = 0;
    }
  }

  return v7;
}

- (MXDeliveryDataCacher)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4 andStorageUtil:(id)a5
{
  id v9;
  id v10;
  id v11;
  MXDeliveryDataCacher *v12;
  MXDeliveryDataCacher *v13;
  os_log_t v14;
  OS_os_log *logHandle;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MXDeliveryDataCacher;
  v12 = -[MXDeliveryDataCacher init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientUtil, a3);
    objc_storeStrong((id *)&v13->_deliveryPathUtil, a4);
    objc_storeStrong((id *)&v13->_storageUtil, a5);
    v14 = os_log_create("com.apple.metrickit", "delivery.cache.manager");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v14;

    if (!v13->_logHandle)
      objc_storeStrong((id *)&v13->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v13;
}

- (BOOL)saveMetrics:(id)a3 toDeliveryDirectoryForBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *logHandle;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MXDeliveryPathUtilProtocol applicationContainerPathForBundleID:](self->_deliveryPathUtil, "applicationContainerPathForBundleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    deliveryPathUtil = self->_deliveryPathUtil;
    v31 = 0;
    v10 = -[MXDeliveryPathUtilProtocol createMetricDirectoryAtPath:forClient:withError:](deliveryPathUtil, "createMetricDirectoryAtPath:forClient:withError:", v8, v7, &v31);
    v11 = v31;
    if ((v10 & 1) != 0)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (!v13)
      {

        v23 = 1;
        goto LABEL_27;
      }
      v14 = v13;
      v25 = v6;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        v18 = v11;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
          v26 = v18;
          -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:](self, "_writeMetricReport:atAppContainerPath:forClient:withError:", v19, v8, v7, &v26);
          v11 = v26;

          if (v11)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v11;
              v34 = 2112;
              v35 = v7;
              _os_log_error_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_ERROR, "Encountered error: %@ while writing payload for client: %@", buf, 0x16u);
            }
            ++v15;
          }
          ++v17;
          v18 = v11;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v14);

      if (v15 < 1)
      {
        v23 = 1;
        v6 = v25;
        goto LABEL_27;
      }
      v21 = self->_logHandle;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.3((uint64_t)v8, v15, v21);
      v22 = self->_logHandle;
      v6 = v25;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.2((uint64_t)v11, (uint64_t)v7, v22);
    }
    else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    {
      -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.4();
    }
    v23 = 0;
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.1();
  -[MXClientUtilProtocol removeClientFromPersistenceForBundleID:](self->_clientUtil, "removeClientFromPersistenceForBundleID:", v7);
  v23 = 0;
LABEL_28:

  return v23;
}

- (BOOL)saveDiagnostic:(id)a3 toDeliveryDirectoryForBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  char v10;
  id v11;
  BOOL v12;
  id v13;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[MXDeliveryPathUtilProtocol applicationContainerPathForBundleID:](self->_deliveryPathUtil, "applicationContainerPathForBundleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  deliveryPathUtil = self->_deliveryPathUtil;
  v16 = 0;
  v10 = -[MXDeliveryPathUtilProtocol createDiagnosticDirectoryAtPath:forClient:withError:](deliveryPathUtil, "createDiagnosticDirectoryAtPath:forClient:withError:", v8, v7, &v16);
  v11 = v16;
  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.4();
  v15 = v11;
  v12 = -[MXDeliveryDataCacher _writeDiagnosticReport:atAppContainerPath:forClient:withError:](self, "_writeDiagnosticReport:atAppContainerPath:forClient:withError:", v6, v8, v7, &v15);
  v13 = v15;

  if (!v12 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXDeliveryDataCacher saveDiagnostic:toDeliveryDirectoryForBundleID:].cold.1();

  return v12;
}

- (void)notifyDataAvailableForDelivery
{
  notify_post("com.apple.metrickit.data");
}

- (BOOL)_writeMetricReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  NSObject *logHandle;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  void *v24;
  void *v25;
  NSObject *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    -[MXStorageUtilProtocol archivedDataWithObject:error:](self->_storageUtil, "archivedDataWithObject:error:", v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && !*a6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.5(logHandle);
      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.4();
      deliveryPathUtil = self->_deliveryPathUtil;
      objc_msgSend(v10, "timeStampEnd");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXDeliveryPathUtilProtocol filepathOfMetricForDeliveryFromAppContainerPath:forClient:atDate:](deliveryPathUtil, "filepathOfMetricForDeliveryFromAppContainerPath:forClient:atDate:", v11, v12, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.3();
      v21 = -[MXStorageUtilProtocol saveData:withFilePath:](self->_storageUtil, "saveData:withFilePath:", v13, v25);
      if ((v21 & 1) == 0)
      {
        v26 = self->_logHandle;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.2(v26);
      }

    }
    else
    {
      v14 = self->_logHandle;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.1((uint64_t)a6, v14, v15, v16, v17, v18, v19, v20);
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *logHandle;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  void *v23;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    -[MXStorageUtilProtocol archivedDataWithObject:error:](self->_storageUtil, "archivedDataWithObject:error:", v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && !*a6)
    {
      deliveryPathUtil = self->_deliveryPathUtil;
      objc_msgSend(v10, "timeStampEnd");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXDeliveryPathUtilProtocol filepathOfDiagnosticForDeliveryFromAppContainerPath:forClient:atDate:](deliveryPathUtil, "filepathOfDiagnosticForDeliveryFromAppContainerPath:forClient:atDate:", v11, v12, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
        -[MXDeliveryDataCacher _writeDiagnosticReport:atAppContainerPath:forClient:withError:].cold.3();
      v21 = -[MXStorageUtilProtocol saveData:withFilePath:](self->_storageUtil, "saveData:withFilePath:", v13, v24);
      if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
        -[MXDeliveryDataCacher _writeDiagnosticReport:atAppContainerPath:forClient:withError:].cold.2();

    }
    else
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.1((uint64_t)a6, logHandle, v15, v16, v17, v18, v19, v20);
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_metricsFromFilepaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *logHandle;
  void *v12;
  MXStorageUtilProtocol *storageUtil;
  uint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  MXStorageUtilProtocol *v19;
  void *v20;
  id v22;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[16];
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v10;
          _os_log_debug_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEBUG, "Metric report: %@", buf, 0xCu);
        }
        -[MXStorageUtilProtocol dataFromPath:](self->_storageUtil, "dataFromPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        storageUtil = self->_storageUtil;
        v14 = objc_opt_class();
        v25 = v7;
        -[MXStorageUtilProtocol unarchivedObjectOfClass:fromData:error:](storageUtil, "unarchivedObjectOfClass:fromData:error:", v14, v12, &v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v25;

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          objc_msgSend(v22, "addObject:", v15);
        }
        else if (v16)
        {
          v18 = self->_logHandle;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[MXDeliveryDataCacher _metricsFromFilepaths:].cold.1((uint64_t)v30, v18);
        }
        v19 = self->_storageUtil;
        v24 = v16;
        -[MXStorageUtilProtocol removeFile:error:](v19, "removeFile:error:", v10, &v24);
        v7 = v24;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v6);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_diagnosticsFromFilepaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *logHandle;
  void *v12;
  MXStorageUtilProtocol *storageUtil;
  uint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  MXStorageUtilProtocol *v19;
  void *v20;
  id v22;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[16];
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v10;
          _os_log_debug_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEBUG, "Diagnostic report: %@", buf, 0xCu);
        }
        -[MXStorageUtilProtocol dataFromPath:](self->_storageUtil, "dataFromPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        storageUtil = self->_storageUtil;
        v14 = objc_opt_class();
        v25 = v7;
        -[MXStorageUtilProtocol unarchivedObjectOfClass:fromData:error:](storageUtil, "unarchivedObjectOfClass:fromData:error:", v14, v12, &v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v25;

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          objc_msgSend(v22, "addObject:", v15);
        }
        else if (v16)
        {
          v18 = self->_logHandle;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[MXDeliveryDataCacher _diagnosticsFromFilepaths:].cold.1((uint64_t)v30, v18);
        }
        v19 = self->_storageUtil;
        v24 = v16;
        -[MXStorageUtilProtocol removeFile:error:](v19, "removeFile:error:", v10, &v24);
        v7 = v24;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v6);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStorageUtil:(id)a3
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
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
}

- (void)saveMetrics:toDeliveryDirectoryForBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21E837000, v0, v1, "Client %@ container does not exist or is not installed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)saveMetrics:(NSObject *)a3 toDeliveryDirectoryForBundleID:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0_0(&dword_21E837000, a2, a3, "Failed to write metric report for %@ with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)saveMetrics:(os_log_t)log toDeliveryDirectoryForBundleID:.cold.3(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_21E837000, log, OS_LOG_TYPE_DEBUG, "Error count: %d, log path: %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_5();
}

- (void)saveMetrics:toDeliveryDirectoryForBundleID:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Failed to create file directory for %@ with error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)saveDiagnostic:toDeliveryDirectoryForBundleID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Failed to write diagnostic report for %@ with error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_writeMetricReport:(uint64_t)a3 atAppContainerPath:(uint64_t)a4 forClient:(uint64_t)a5 withError:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Error archiving data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_writeMetricReport:(os_log_t)log atAppContainerPath:forClient:withError:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E837000, log, OS_LOG_TYPE_ERROR, "Error writing file.", v1, 2u);
}

- (void)_writeMetricReport:atAppContainerPath:forClient:withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21E837000, v0, v1, "File to Write: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_writeMetricReport:atAppContainerPath:forClient:withError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_writeMetricReport:(os_log_t)log atAppContainerPath:forClient:withError:.cold.5(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E837000, log, OS_LOG_TYPE_DEBUG, "Writing data to file.", v1, 2u);
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Error writing data of diagnostic payload: %@ to path: %@ for delivery.");
  OUTLINED_FUNCTION_5();
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_21E837000, v0, OS_LOG_TYPE_DEBUG, "Writing data of diagnostic payload: %@ to path: %@ for delivery.", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)metricsForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Delivering metrics for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_metricsFromFilepaths:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_7_0(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_5_1(&dword_21E837000, v7, v8, "Error while processing metric data on disk: %{public}@");

  OUTLINED_FUNCTION_8_0();
}

- (void)diagnosticsForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Delivering diagnostics for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_diagnosticsFromFilepaths:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_7_0(a1, a2);
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_5_1(&dword_21E837000, v7, v8, "Error while processing diagnostic data on disk: %{public}@");

  OUTLINED_FUNCTION_8_0();
}

@end
