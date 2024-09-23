@implementation MXPayloadValidator

- (MXPayloadValidator)initWithLogHandle:(id)a3
{
  id v5;
  MXPayloadValidator *v6;
  MXPayloadValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXPayloadValidator;
  v6 = -[MXPayloadValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logHandle, a3);

  return v7;
}

- (BOOL)validatePayload:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *logHandle;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[MXPayloadValidator _validatePayload:](self, "_validatePayload:", v4);
  if (!v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      -[MXPayloadValidator validatePayload:].cold.1((uint64_t)v4, logHandle, v7, v8, v9, v10, v11, v12);
  }

  return v5;
}

- (BOOL)_validatePayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *logHandle;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
      -[MXPayloadValidator _validatePayload:].cold.1();
    goto LABEL_10;
  }
  objc_msgSend(v4, "datestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      -[MXPayloadValidator _validatePayload:].cold.2((uint64_t)v5, logHandle, v11, v12, v13, v14, v15, v16);
LABEL_10:
    v17 = 0;
    goto LABEL_19;
  }
  v7 = objc_msgSend(v5, "sourceID");
  objc_msgSend(v5, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    switch(v7)
    {
      case 2:
        v9 = -[MXPayloadValidator _validatePowerlogData:](self, "_validatePowerlogData:", v8);
        break;
      case 3:
        v9 = -[MXPayloadValidator _validateHangTracerData:](self, "_validateHangTracerData:", v8);
        break;
      case 4:
        v9 = -[MXPayloadValidator _validateSpinTracerData:](self, "_validateSpinTracerData:", v8);
        break;
      case 5:
        v9 = -[MXPayloadValidator _validateReportCrashData:](self, "_validateReportCrashData:", v8);
        break;
      default:
        goto LABEL_13;
    }
    v17 = v9;
  }
  else
  {
    v18 = self->_logHandle;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MXPayloadValidator _validatePayload:].cold.3(v5, v18);
LABEL_13:
    v17 = 0;
  }

LABEL_19:
  return v17;
}

- (BOOL)_validatePowerlogData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
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
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
            -[MXPayloadValidator _validatePowerlogData:].cold.1();

          v10 = 0;
          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_15:

  return v10;
}

- (BOOL)_validateHangTracerData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
            -[MXPayloadValidator _validateHangTracerData:].cold.1();

          v13 = 0;
          goto LABEL_15;
        }
        v10 = v9;
        objc_msgSend(v10, "hangDiagnostic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:](self, "_sanitizeDeviceMetadataForDiagnostic:", v11);

        objc_msgSend(v10, "appLaunchDiagnostic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:](self, "_sanitizeDeviceMetadataForDiagnostic:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_15:

  return v13;
}

- (BOOL)_validateSpinTracerData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
            -[MXPayloadValidator _validateSpinTracerData:].cold.1();

          v13 = 0;
          goto LABEL_15;
        }
        v10 = v9;
        objc_msgSend(v10, "cpuExceptionDiagnostic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:](self, "_sanitizeDeviceMetadataForDiagnostic:", v11);

        objc_msgSend(v10, "diskWriteExceptionDiagnostic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:](self, "_sanitizeDeviceMetadataForDiagnostic:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_15:

  return v13;
}

- (BOOL)_validateReportCrashData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
            -[MXPayloadValidator _validateReportCrashData:].cold.1();

          v11 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v9, "crashDiagnostic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:](self, "_sanitizeDeviceMetadataForDiagnostic:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_15:

  return v11;
}

- (void)_sanitizeDeviceMetadataForDiagnostic:(id)a3
{
  id v4;
  MXBundleUtil *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *logHandle;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  void *v26;
  MXBundleUtil *v27;
  id v28;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v5 = objc_alloc_init(MXBundleUtil);
  objc_msgSend(v4, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v5;
  if (-[MXBundleUtil isAppExtensionFromBundleID:](v5, "isAppExtensionFromBundleID:", v7))
  {
    -[MXBundleUtil mainAppBundleIDforExtension:](v5, "mainAppBundleIDforExtension:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v28 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v28);
  v10 = v28;
  v25 = v10;
  v26 = v7;
  if (v10)
  {
    v11 = (uint64_t)v10;
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      -[MXPayloadValidator _sanitizeDeviceMetadataForDiagnostic:].cold.1((uint64_t)v7, v11, logHandle);
    v24 = 0;
  }
  else
  {
    if (!v9)
    {
      v24 = 0;
      goto LABEL_11;
    }
    v24 = objc_msgSend(v9, "isBeta");
  }

LABEL_11:
  v13 = objc_alloc(MEMORY[0x24BDDE650]);
  objc_msgSend(MEMORY[0x24BE668E8], "regionFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "osVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "modelIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metaData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applicationBuildVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "platformArchitecture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metaData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v23) = v24;
  LODWORD(v23) = objc_msgSend(v4, "pid");
  v22 = (void *)objc_msgSend(v13, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:bundleID:pid:isTestFlightApp:", v14, v15, v16, v18, v19, v21, v23);

  if (v22)
    objc_msgSend(v4, "setMetaData:", v22);

LABEL_14:
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
}

- (void)validatePayload:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Invalid payload: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_validatePayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Invalid payload as nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_validatePayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Invalid payload: %@ due to payload datestamp is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_validatePayload:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_4(&dword_21E837000, v3, v5, "Invalid payload: %@ due to payload metrics of client: %@ is nil", (uint8_t *)&v6);

}

- (void)_validatePowerlogData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Invalid Powerlog Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_validateHangTracerData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Invalid HangTracer Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_validateSpinTracerData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Invalid SpinTracer Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_validateReportCrashData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Invalid ReportCrash Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sanitizeDeviceMetadataForDiagnostic:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_4(&dword_21E837000, a3, (uint64_t)a3, "There was an error querying the LS database for bundle id %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end
