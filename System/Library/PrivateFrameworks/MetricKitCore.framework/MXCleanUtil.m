@implementation MXCleanUtil

- (MXCleanUtil)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4
{
  id v7;
  id v8;
  MXCleanUtil *v9;
  MXCleanUtil *v10;
  os_log_t v11;
  OS_os_log *logHandle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXCleanUtil;
  v9 = -[MXCleanUtil init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientUtil, a3);
    objc_storeStrong((id *)&v10->_deliveryPathUtil, a4);
    v11 = os_log_create("com.apple.metrickit", "cache.clean.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle)
      objc_storeStrong((id *)&v10->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v10;
}

- (void)cleanStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start guard clean", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanDirectoriesForUninstalledClients
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start clean directories for uninstalled clients", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanDirectoriesForUninstalledClient:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE668E8], "isAppInstalledForBundleID:", v4) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXCleanUtil _cleanDirectoriesForUninstalledClient:].cold.1();
    -[MXCleanUtil _cleanDeliveryDirectoriesForClient:](self, "_cleanDeliveryDirectoriesForClient:", v4);
    -[MXCleanUtil _cleanSourceDirectoriesForClient:](self, "_cleanSourceDirectoriesForClient:", v4);
  }

}

- (void)_cleanDeliveryDirectoriesForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanDeliveryDirectoriesForClient:].cold.1();
  -[MXCleanUtil _metricDeliveryDirectoryForClient:](self, "_metricDeliveryDirectoryForClient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _cleanDirectory:](self, "_cleanDirectory:", v5);
  -[MXCleanUtil _diagnosticDeliveryDirectoryForClient:](self, "_diagnosticDeliveryDirectoryForClient:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _cleanDirectory:](self, "_cleanDirectory:", v6);

}

- (id)_metricDeliveryDirectoryForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXCleanUtil _metricDeliveryParentDirectory](self, "_metricDeliveryParentDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _metricDeliveryDirectoryForClient:].cold.1();

  return v6;
}

- (id)_metricDeliveryParentDirectory
{
  void *v3;
  void *v4;

  -[MXDeliveryPathUtilProtocol applicationContainerPath](self->_deliveryPathUtil, "applicationContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Reports"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _metricDeliveryParentDirectory].cold.1();
  return v4;
}

- (id)_diagnosticDeliveryDirectoryForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXCleanUtil _diagnosticDeliveryParentDirectory](self, "_diagnosticDeliveryParentDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _diagnosticDeliveryDirectoryForClient:].cold.1();

  return v6;
}

- (id)_diagnosticDeliveryParentDirectory
{
  void *v3;
  void *v4;

  -[MXDeliveryPathUtilProtocol applicationContainerPath](self->_deliveryPathUtil, "applicationContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Diagnostics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _diagnosticDeliveryParentDirectory].cold.1();
  return v4;
}

- (void)_cleanSourceDirectoriesForClient:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanSourceDirectoriesForClient:].cold.1();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(&unk_24E2FEF70, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(&unk_24E2FEF70);
        -[MXCleanUtil _cleanSourceDirectoryForSource:andClient:](self, "_cleanSourceDirectoryForSource:andClient:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_24E2FEF70, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_cleanSourceDirectoryForSource:(id)a3 andClient:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanSourceDirectoryForSource:andClient:].cold.1();
  -[MXCleanUtil _sourceDirectoryForSource:andClient:](self, "_sourceDirectoryForSource:andClient:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _cleanDirectory:](self, "_cleanDirectory:", v8);

}

- (void)_cleanDirectory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v7);
  v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXCleanUtil _cleanDirectory:].cold.1();

}

- (id)_sourceDirectoryForSource:(id)a3 andClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _sourceDirectoryForSource:andClient:].cold.1();

  return v10;
}

- (void)_cleanDirectoriesForStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start cleaning directories for stale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanDeliveryDirectoriesForStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start cleaning delivery directories for stale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanMetricDeliveryDirectoriesForStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start cleaning delivery directories for stale metrics data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)_metricDeliveryDirectories
{
  void *v3;
  void *v4;

  -[MXCleanUtil _metricDeliveryParentDirectory](self, "_metricDeliveryParentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _subdirectoriesFromDirectory:](self, "_subdirectoriesFromDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _metricDeliveryDirectories].cold.1();

  return v4;
}

- (id)_subdirectoriesFromDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXCleanUtil _subdirectoriesFromDirectory:].cold.1();
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v14, &v17))
            v15 = v17 == 0;
          else
            v15 = 1;
          if (!v15)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (void)_cleanMetricDeliveryDirectoryForStaleDataForDirectory:(id)a3
{
  id v4;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanMetricDeliveryDirectoryForStaleDataForDirectory:].cold.1();
  if (-[MXCleanUtil _isMetricDeliveryStaleForDirectory:](self, "_isMetricDeliveryStaleForDirectory:", v4))
    -[MXCleanUtil _cleanDirectory:](self, "_cleanDirectory:", v4);

}

- (BOOL)_isMetricDeliveryStaleForDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MXCleanUtil _filenamesFromDirectory:](self, "_filenamesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _lastFileDateFromMetricFilenames:](self, "_lastFileDateFromMetricFilenames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXCleanUtil _isStaleForDate:](self, "_isStaleForDate:", v6);
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isMetricDeliveryStaleForDirectory:].cold.1();

  return v7;
}

- (id)_filenamesFromDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v18;
  MXCleanUtil *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXCleanUtil _filenamesFromDirectory:].cold.2();
    v8 = 0;
  }
  else
  {
    v19 = self;
    v8 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v15, &v20))
            v16 = v20 == 0;
          else
            v16 = 0;
          if (v16)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    if (os_log_type_enabled((os_log_t)v19->_logHandle, OS_LOG_TYPE_DEBUG))
      -[MXCleanUtil _filenamesFromDirectory:].cold.1();
    v6 = v18;
  }

  return v8;
}

- (id)_lastFileDateFromMetricFilenames:(id)a3
{
  void *v4;
  void *v5;

  -[MXCleanUtil _datesFromMetricFilenames:](self, "_datesFromMetricFilenames:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _latestDateFromDates:](self, "_latestDateFromDates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _lastFileDateFromMetricFilenames:].cold.1();

  return v5;
}

- (id)_datesFromMetricFilenames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[MXCleanUtil _dateFromMetricFilename:](self, "_dateFromMetricFilename:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _datesFromMetricFilenames:].cold.1();

  return v5;
}

- (void)_cleanDiagnosticDeliveryDirectoriesForStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start cleaning delivery directories for stale diagnostics data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)_diagnosticDeliveryDirectories
{
  void *v3;
  void *v4;

  -[MXCleanUtil _diagnosticDeliveryParentDirectory](self, "_diagnosticDeliveryParentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _subdirectoriesFromDirectory:](self, "_subdirectoriesFromDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _diagnosticDeliveryDirectories].cold.1();

  return v4;
}

- (void)_cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:(id)a3
{
  id v4;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:].cold.1();
  if (-[MXCleanUtil _isDiagnosticDeliveryStaleForDirectory:](self, "_isDiagnosticDeliveryStaleForDirectory:", v4))
    -[MXCleanUtil _cleanDirectory:](self, "_cleanDirectory:", v4);

}

- (BOOL)_isDiagnosticDeliveryStaleForDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MXCleanUtil _filenamesFromDirectory:](self, "_filenamesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _lastFileDateFromDiagnosticFilenames:](self, "_lastFileDateFromDiagnosticFilenames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXCleanUtil _isStaleForDate:](self, "_isStaleForDate:", v6);
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isDiagnosticDeliveryStaleForDirectory:].cold.1();

  return v7;
}

- (id)_lastFileDateFromDiagnosticFilenames:(id)a3
{
  void *v4;
  void *v5;

  -[MXCleanUtil _datesFromDiagnosticFilenames:](self, "_datesFromDiagnosticFilenames:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _latestDateFromDates:](self, "_latestDateFromDates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _lastFileDateFromDiagnosticFilenames:].cold.1();

  return v5;
}

- (id)_datesFromDiagnosticFilenames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[MXCleanUtil _dateFromDiagnosticFilename:](self, "_dateFromDiagnosticFilename:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _datesFromDiagnosticFilenames:].cold.1();

  return v5;
}

- (id)_dateFromDiagnosticFilename:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("diagnostic_report_"), &stru_24E2F9F08);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateStringFromUnprefixedFilename:](self, "_dateStringFromUnprefixedFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateFromDateString:](self, "_dateFromDateString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateFromDiagnosticFilename:].cold.1();

  return v6;
}

- (id)_dateFromMetricFilename:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("report_"), &stru_24E2F9F08);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateStringFromUnprefixedFilename:](self, "_dateStringFromUnprefixedFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateFromDateString:](self, "_dateFromDateString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateFromMetricFilename:].cold.1();

  return v6;
}

- (id)_dateFromDateString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD1500];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:", v7);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v6, "dateFromString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateFromDateString:].cold.1();

  return v8;
}

- (id)_latestDateFromDates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v7)
          v7 = v10;
        v11 = v7;
        objc_msgSend(v10, "laterDate:", v7);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _latestDateFromDates:].cold.1();

  return v7;
}

- (BOOL)_isStaleForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *logHandle;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 1209600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDate:", v5);

  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isStaleForDate:].cold.1(v8, (uint64_t)v4, logHandle);

  return v8;
}

- (void)_cleanSourceDirectoriesForStaleData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Start clean Source Directories for stale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanClientlessSourceDirectoryForStaleData
{
  id v3;

  -[MXCleanUtil _clientlessSourceDirectory](self, "_clientlessSourceDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _cleanStaleDataForSourceDirectory:](self, "_cleanStaleDataForSourceDirectory:", v3);

}

- (void)_cleanStaleDataForSourceDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanStaleDataForSourceDirectory:].cold.1();
  -[MXCleanUtil _filenamesFromDirectory:](self, "_filenamesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[MXCleanUtil _isStaleSourceForFilename:](self, "_isStaleSourceForFilename:", v10))
        {
          objc_msgSend(v4, "stringByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MXCleanUtil _cleanFileFromFilePath:](self, "_cleanFileFromFilePath:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)_isStaleSourceForFilename:(id)a3
{
  id v4;
  BOOL v5;
  _BOOL4 v6;
  BOOL v7;

  v4 = a3;
  if (-[MXCleanUtil _isMetricSourceFilename:](self, "_isMetricSourceFilename:", v4))
    v5 = -[MXCleanUtil _isStaleMetricSourceForFilename:](self, "_isStaleMetricSourceForFilename:", v4);
  else
    v5 = 0;
  v6 = -[MXCleanUtil _isDiagnosticSourceFilename:](self, "_isDiagnosticSourceFilename:", v4);
  if (v6)
    LOBYTE(v6) = -[MXCleanUtil _isStaleDiagnosticSourceForFilename:](self, "_isStaleDiagnosticSourceForFilename:", v4);
  v7 = v5 || v6;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isStaleSourceForFilename:].cold.1();

  return v7;
}

- (BOOL)_isMetricSourceFilename:(id)a3
{
  char v4;

  v4 = objc_msgSend(a3, "containsString:", CFSTR("log-"));
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isMetricSourceFilename:].cold.1();
  return v4;
}

- (BOOL)_isStaleMetricSourceForFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MXCleanUtil _dateStringFromMetricSourceFilename:](self, "_dateStringFromMetricSourceFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateFromDateString:](self, "_dateFromDateString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXCleanUtil _isStaleForDate:](self, "_isStaleForDate:", v6);
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isStaleMetricSourceForFilename:].cold.1();

  return v7;
}

- (id)_dateStringFromMetricSourceFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("log-"), &stru_24E2F9F08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateStringFromUnprefixedFilename:](self, "_dateStringFromUnprefixedFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateStringFromMetricSourceFilename:].cold.1();

  return v6;
}

- (id)_dateStringFromUnprefixedFilename:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "substringToIndex:", objc_msgSend(CFSTR("yyyy-MM-dd"), "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateStringFromUnprefixedFilename:].cold.1();
  return v5;
}

- (BOOL)_isDiagnosticSourceFilename:(id)a3
{
  char v4;

  v4 = objc_msgSend(a3, "containsString:", CFSTR("diag-log-"));
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isDiagnosticSourceFilename:].cold.1();
  return v4;
}

- (BOOL)_isStaleDiagnosticSourceForFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MXCleanUtil _dateStringFromDiagnosticSourceFilename:](self, "_dateStringFromDiagnosticSourceFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateFromDateString:](self, "_dateFromDateString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXCleanUtil _isStaleForDate:](self, "_isStaleForDate:", v6);
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _isStaleDiagnosticSourceForFilename:].cold.1();

  return v7;
}

- (id)_dateStringFromDiagnosticSourceFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("diag-log-"), &stru_24E2F9F08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCleanUtil _dateStringFromUnprefixedFilename:](self, "_dateStringFromUnprefixedFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _dateStringFromDiagnosticSourceFilename:].cold.1();

  return v6;
}

- (id)_clientlessSourceDirectory
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24E2FEF88, "objectAtIndexedSubscript:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _clientlessSourceDirectory].cold.1();

  return v5;
}

- (void)_cleanClientfulSourceDirectoriesForStaleData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[MXCleanUtil _clientfulSourceDirectories](self, "_clientfulSourceDirectories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[MXCleanUtil _cleanStaleDataForSourceDirectory:](self, "_cleanStaleDataForSourceDirectory:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_clientfulSourceDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE668E8], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24E2FEFA0, "objectAtIndexedSubscript:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  objc_msgSend(&unk_24E2FEFB8, "objectAtIndexedSubscript:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  objc_msgSend(&unk_24E2FEFD0, "objectAtIndexedSubscript:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXCleanUtil _subdirectoriesFromDirectory:](self, "_subdirectoriesFromDirectory:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _clientfulSourceDirectories].cold.1();

  return v8;
}

- (void)_cleanFileFromFilePath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
    -[MXCleanUtil _cleanFileFromFilePath:].cold.2();
  v7 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v7);
  v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXCleanUtil _cleanFileFromFilePath:].cold.1();

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
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
}

- (void)_cleanDirectoriesForUninstalledClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Client: %@ is not installed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanDeliveryDirectoriesForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Start clean delivery directory for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_metricDeliveryDirectoryForClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Metric Delivery directory: %@ for client %@");
  OUTLINED_FUNCTION_5();
}

- (void)_metricDeliveryParentDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Metric Delivery directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_diagnosticDeliveryDirectoryForClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Diagnostic Delivery directory: %@ for client %@");
  OUTLINED_FUNCTION_5();
}

- (void)_diagnosticDeliveryParentDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Diagnostics Delivery directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanSourceDirectoriesForClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Start clean Source directories for client: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanSourceDirectoryForSource:andClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Start clean Source:%@ directory for client: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_cleanDirectory:.cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, v2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_21E837000, v4, v5, "Error removing directory: %@ with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

- (void)_sourceDirectoryForSource:andClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Source: %@ directory for client: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_metricDeliveryDirectories
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Metric delivery directories: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_subdirectoriesFromDirectory:.cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, v2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_21E837000, v4, v5, "Error searching contents of directory: %@ with error %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

- (void)_cleanMetricDeliveryDirectoryForStaleDataForDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Start clean Metric delivery for stale data for directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isMetricDeliveryStaleForDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_21E837000, v0, v1, "Metric delivery directory: %@ stale state: %d");
  OUTLINED_FUNCTION_5();
}

- (void)_filenamesFromDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "filenames: %@ from delivery directory: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_filenamesFromDirectory:.cold.2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, v2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_21E837000, v4, v5, "Error searching contents of directory: %@ with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

- (void)_lastFileDateFromMetricFilenames:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "last file date: %@ from metric filenames", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_datesFromMetricFilenames:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "dates: %@ from metric filenames", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_diagnosticDeliveryDirectories
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Diagnostic delivery directories: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Start clean Diagnostic delivery for stale data for directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isDiagnosticDeliveryStaleForDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_21E837000, v0, v1, "Diagnostic delivery directory: %@ stale state: %d");
  OUTLINED_FUNCTION_5();
}

- (void)_lastFileDateFromDiagnosticFilenames:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "last file date: %@ from diagnostic filenames", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_datesFromDiagnosticFilenames:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "diagnostic filenames dates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_dateFromDiagnosticFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "diagnostic filename date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_dateFromMetricFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "metric filename date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_dateFromDateString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Convert string to date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_latestDateFromDates:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "latest date %@ from dates: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_isStaleForDate:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109634;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  v6 = 1024;
  v7 = 2;
  _os_log_debug_impl(&dword_21E837000, log, OS_LOG_TYPE_DEBUG, "Stale state: %d for date: %@ for %d weeks", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanStaleDataForSourceDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Start clean stale data for source directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isStaleSourceForFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_21E837000, v0, v1, "Source filename stale state: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_isMetricSourceFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_21E837000, v0, v1, "is source filename for metric? state: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_isStaleMetricSourceForFilename:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_21E837000, v0, v1, "Metric Source filename: %@ stale state: %d");
  OUTLINED_FUNCTION_5();
}

- (void)_dateStringFromMetricSourceFilename:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Metric Source filename: %@ date string: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_dateStringFromUnprefixedFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "date string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isDiagnosticSourceFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_21E837000, v0, v1, "is source filename for diagnostic? state: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_isStaleDiagnosticSourceForFilename:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_21E837000, v0, v1, "Diagnostic Source filename: %@ stale state: %d");
  OUTLINED_FUNCTION_5();
}

- (void)_dateStringFromDiagnosticSourceFilename:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_21E837000, v0, v1, "Diagnostic Source filename: %@ date string: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_clientlessSourceDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Source Directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_clientfulSourceDirectories
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Source Directories: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_cleanFileFromFilePath:.cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, v2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_21E837000, v4, v5, "Error clean file from path: %@ with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

- (void)_cleanFileFromFilePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Remove item at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
