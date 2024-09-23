@implementation MXDiagnosticServices

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *logHandle;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
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
  v4 = a3;
  -[MXDiagnosticServices services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Cleaning MXSource Services Data Directories\n", buf, 2u);
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MXDiagnosticServices services](self, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v18;
      *(_QWORD *)&v10 = 138412290;
      v16 = v10;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "isStarted", v16))
          {
            v15 = self->_logHandle;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              v22 = v14;
              _os_log_error_impl(&dword_21E837000, v15, OS_LOG_TYPE_ERROR, "Cannot clean %@ data directory when service is started", buf, 0xCu);
            }
          }
          else
          {
            -[MXSourcePathUtilProtocol cleanDiagnosticsDirectoryForSource:andClient:](self->_sourcePathUtil, "cleanDiagnosticsDirectoryForSource:andClient:", objc_msgSend(v14, "sourceID"), v4);
          }
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v11);
    }

  }
}

- (NSMutableSet)services
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (MXDiagnosticServices)initWithSourcePathUtil:(id)a3 andDateUtil:(id)a4
{
  id v7;
  id v8;
  MXDiagnosticServices *v9;
  NSMutableSet *v10;
  NSMutableSet *services;
  os_log_t v12;
  OS_os_log *logHandle;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MXDiagnosticServices;
  v9 = -[MXDiagnosticServices init](&v15, sel_init);
  if (v9)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    services = v9->_services;
    v9->_services = v10;

    objc_storeStrong((id *)&v9->_sourcePathUtil, a3);
    objc_storeStrong((id *)&v9->_dateUtil, a4);
    v12 = os_log_create("com.apple.metrickit", "diagnostic.service.manager");
    logHandle = v9->_logHandle;
    v9->_logHandle = (OS_os_log *)v12;

    if (!v9->_logHandle)
      objc_storeStrong((id *)&v9->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v9;
}

- (id)diagnosticPayloadForClient:(id)a3 andDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v6))
  {
    -[MXDiagnosticServices _createServicesForClient:](self, "_createServicesForClient:", v6);
    -[MXDiagnosticServices _startServices](self, "_startServices");
    -[MXDiagnosticServices _diagnosticPayloadForClient:andDate:](self, "_diagnosticPayloadForClient:andDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXDiagnosticServices _stopServices](self, "_stopServices");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_createServicesForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *logHandle;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MXDiagnosticServices services](self, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Initializing MXSource Services\n", buf, 2u);
    }
    -[MXDiagnosticServices services](self, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE668C8], "sharedHangTracerService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    -[MXDiagnosticServices services](self, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE668E0], "sharedSpinTracerService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    -[MXDiagnosticServices services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE668D8], "sharedReportCrashService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MXDiagnosticServices services](self, "services", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setCurrentClient:", v4);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v16);
    }

  }
}

- (void)_startServices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *logHandle;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[MXDiagnosticServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MXDiagnosticServices services](self, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v19;
      *(_QWORD *)&v7 = 138412290;
      v17 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v11, "startService", v17) & 1) == 0)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v23 = v11;
              _os_log_error_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_ERROR, "%@ service failed to start", buf, 0xCu);
            }
            -[MXDiagnosticServices services](self, "services");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v11);

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    v14 = self->_logHandle;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      -[MXDiagnosticServices services](self, "services");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_21E837000, v15, OS_LOG_TYPE_INFO, "Services started:%@", buf, 0xCu);

    }
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
  -[MXDiagnosticServices services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Stopping MXSource Services\n", buf, 2u);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MXDiagnosticServices services](self, "services");
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
            -[MXDiagnosticServices services](self, "services");
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

- (id)_diagnosticPayloadForClient:(id)a3 andDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *logHandle;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[MXDiagnosticServices dateUtil](self, "dateUtil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXDiagnosticServices _diagnosticsFromServicesForClient:dateString:](self, "_diagnosticsFromServicesForClient:dateString:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    -[MXDiagnosticServices _diagnosticPayloadForClient:andDate:].cold.1((uint64_t)v10, logHandle);
  +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:](MXCorePayloadConstructor, "buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:", v6, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_diagnosticsFromServicesForClient:(id)a3 dateString:(id)a4
{
  id v6;
  id v7;
  MXDiagnosticServices *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *logHandle;
  void *v18;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self;
  -[MXDiagnosticServices services](self, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v23;
    *(_QWORD *)&v11 = 138412546;
    v20 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "getDiagnosticsForClient:dateString:", v6, v7, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          logHandle = v8->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v27 = v15;
            v28 = 2112;
            v29 = v16;
            _os_log_debug_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEBUG, "Service: %@ returned data: %@", buf, 0x16u);
          }
          objc_msgSend(&unk_24E2FEF58, "objectAtIndexedSubscript:", objc_msgSend(v15, "sourceID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v16, v18);

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v12);
  }

  return v21;
}

- (id)diagnosticPayloadForClient:(id)a3 isExtension:(BOOL)a4 andMainAppBundleID:(id)a5 andDate:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v8)
    v13 = v11;
  else
    v13 = v10;
  v14 = v13;
  v15 = a6;
  -[MXDiagnosticServices _createServicesForClient:](self, "_createServicesForClient:", v14);
  -[MXDiagnosticServices _startServices](self, "_startServices");
  -[MXDiagnosticServices _diagnosticPayloadForClient:andDate:](self, "_diagnosticPayloadForClient:andDate:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXDiagnosticServices _stopServices](self, "_stopServices");
  return v16;
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourcePathUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateUtil:(id)a3
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
  objc_storeStrong((id *)&self->_dateUtil, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_diagnosticPayloadForClient:(uint64_t)a1 andDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21E837000, a2, OS_LOG_TYPE_DEBUG, "Client Diagnostics to Parse: %@", (uint8_t *)&v2, 0xCu);
}

@end
