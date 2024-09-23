@implementation MXMetricServices

- (MXMetricServices)initWithClientUtil:(id)a3 andSourcePathUtil:(id)a4
{
  id v7;
  id v8;
  MXMetricServices *v9;
  NSMutableSet *v10;
  NSMutableSet *services;
  os_log_t v12;
  OS_os_log *logHandle;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MXMetricServices;
  v9 = -[MXMetricServices init](&v15, sel_init);
  if (v9)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    services = v9->_services;
    v9->_services = v10;

    objc_storeStrong((id *)&v9->_clientUtil, a3);
    objc_storeStrong((id *)&v9->_sourcePathUtil, a4);
    v12 = os_log_create("com.apple.metrickit", "metric.service.manager");
    logHandle = v9->_logHandle;
    v9->_logHandle = (OS_os_log *)v12;

    if (!v9->_logHandle)
      objc_storeStrong((id *)&v9->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v9;
}

- (id)clientMetricPayloadsForAllClients
{
  void *v3;
  NSObject *logHandle;
  uint8_t v6[16];

  -[MXMetricServices _createServices](self, "_createServices");
  -[MXMetricServices _startServices](self, "_startServices");
  if (-[MXMetricServices _isMetricSourceDataAvailable](self, "_isMetricSourceDataAvailable"))
  {
    -[MXMetricServices _clientMetricsFromServices](self, "_clientMetricsFromServices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMetricServices _stopServices](self, "_stopServices");
    -[MXMetricServices _cleanServiceMetricsDirectories](self, "_cleanServiceMetricsDirectories");
    return v3;
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_INFO, "No data available to process", v6, 2u);
    }
    -[MXMetricServices _stopServices](self, "_stopServices");
    return 0;
  }
}

- (void)_createServices
{
  void *v3;
  NSObject *logHandle;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[MXMetricServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Initializing MXCore Services\n", v7, 2u);
    }
    -[MXMetricServices services](self, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE668D0], "sharedPowerlogService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)_startServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *logHandle;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MXMetricServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412290;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "startService", v16) & 1) == 0)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v10;
            _os_log_error_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_ERROR, "%@ service failed to start", buf, 0xCu);
          }
          -[MXMetricServices services](self, "services");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v10);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  v13 = self->_logHandle;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    -[MXMetricServices services](self, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_21E837000, v14, OS_LOG_TYPE_INFO, "Services started:%@", buf, 0xCu);

  }
}

- (void)_stopServices
{
  void *v3;
  NSObject *logHandle;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MXMetricServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Stopping MXCore Services\n", buf, 2u);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MXMetricServices services](self, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v17;
      *(_QWORD *)&v8 = 138412290;
      v15 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v12, "stopService", v15) & 1) == 0)
          {
            v13 = self->_logHandle;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v21 = v12;
              _os_log_error_impl(&dword_21E837000, v13, OS_LOG_TYPE_ERROR, "%@ service failed to stop", buf, 0xCu);
            }
            -[MXMetricServices services](self, "services");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeObject:", v12);

          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v9);
    }

  }
}

- (void)_cleanServiceMetricsDirectories
{
  void *v3;
  NSObject *logHandle;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[MXMetricServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Cleaning MXCore Services Data Directories\n", buf, 2u);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[MXMetricServices services](self, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v16;
      *(_QWORD *)&v8 = 138412290;
      v14 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isStarted", v14))
          {
            v13 = self->_logHandle;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              v20 = v12;
              _os_log_error_impl(&dword_21E837000, v13, OS_LOG_TYPE_ERROR, "Cannot clean %@ data directory when service is started", buf, 0xCu);
            }
          }
          else
          {
            -[MXSourcePathUtilProtocol cleanDataDirectoryForSource:](self->_sourcePathUtil, "cleanDataDirectoryForSource:", objc_msgSend(v12, "sourceID"));
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)_isMetricSourceDataAvailable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  NSObject *logHandle;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MXMetricServices services](self, "services", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "metricsSupported") && (objc_msgSend(v8, "metricsAvailable") & 1) == 0)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            -[MXMetricServices _isMetricSourceDataAvailable].cold.1((uint64_t)v8, logHandle);
          v9 = 0;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (id)_metricPayloadsForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *logHandle;
  void *v7;

  v4 = a3;
  -[MXMetricServices _metricsFromServicesForClient:](self, "_metricsFromServicesForClient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    -[MXMetricServices _metricPayloadsForClient:].cold.1((uint64_t)v5, logHandle);
  +[MXCorePayloadConstructor buildPayloadForClient:fromClientMetricsDictionary:](MXCorePayloadConstructor, "buildPayloadForClient:fromClientMetricsDictionary:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_metricsFromServicesForClient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *logHandle;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MXMetricServices services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412546;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "getMetricsForClient:", v4, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            v24 = 2112;
            v25 = v13;
            _os_log_debug_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEBUG, "Service: %@ returned data: %@", buf, 0x16u);
          }
          objc_msgSend(&unk_24E2FF000, "objectAtIndexedSubscript:", objc_msgSend(v12, "sourceID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, v15);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)_clientMetricsFromServices
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *logHandle;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MXClientUtilProtocol allClients](self->_clientUtil, "allClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138412290;
    v14 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[MXMetricServices _metricPayloadsForClient:](self, "_metricPayloadsForClient:", v10, v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
        }
        else
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v20 = v10;
            _os_log_error_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_ERROR, "No metric report for client:%@", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSMutableSet)services
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourcePathUtil:(id)a3
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
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_isMetricSourceDataAvailable
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21E837000, a2, OS_LOG_TYPE_ERROR, "Service %@ returned NO for metrics check ", (uint8_t *)&v2, 0xCu);
}

- (void)_metricPayloadsForClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21E837000, a2, OS_LOG_TYPE_DEBUG, "Client Metrics to Parse:%@", (uint8_t *)&v2, 0xCu);
}

@end
