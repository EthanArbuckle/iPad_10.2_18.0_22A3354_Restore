@implementation MXSourceHandler

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MXSourceHandler diagnosticServices](self, "diagnosticServices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanServiceDiagnosticsDirectoriesForClient:", v4);

}

- (MXDiagnosticServicesProtocol)diagnosticServices
{
  return (MXDiagnosticServicesProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (MXSourceHandler)initWithSourceDataCacher:(id)a3 andDeliveryDataCacher:(id)a4 andSourcePathUtil:(id)a5 andBundleUtil:(id)a6 andDiagnosticServices:(id)a7 andDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  MXSourceHandler *v18;
  MXSourceHandler *v19;
  os_log_t v20;
  OS_os_log *logHandle;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXSourceHandler;
  v18 = -[MXSourceHandler init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceDataCacher, a3);
    objc_storeStrong((id *)&v19->_deliveryDataCacher, a4);
    objc_storeStrong((id *)&v19->_sourcePathUtil, a5);
    objc_storeStrong((id *)&v19->_diagnosticServices, a7);
    objc_storeStrong((id *)&v19->_bundleUtil, a6);
    objc_storeWeak((id *)&v19->_delegate, v17);
    v20 = os_log_create("com.apple.metrickit", "source.handler");
    logHandle = v19->_logHandle;
    v19->_logHandle = (OS_os_log *)v20;

    if (!v19->_logHandle)
      objc_storeStrong((id *)&v19->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v19;
}

- (void)handleMetricDataWithPayload:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  -[MXSourceHandler sourceDataCacher](self, "sourceDataCacher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveToSourceDirectoryWithMetricSourcePayload:", v4);

  if (v6)
  {
    -[MXSourceHandler delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metricPayloadDidCacheToSourceDirectory");

  }
}

- (void)handleDiagnosticDataWithPayload:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *logHandle;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[MXSourceHandler sourceDataCacher](self, "sourceDataCacher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveToSourceDirectoryWithDiagnosticSourcePayload:", v4);

  if (v6)
  {
    -[MXSourceHandler delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diagnosticPayloadDidCacheToSourceDirectory");

    objc_msgSend(v4, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MXBundleUtilProtocol isAppExtensionFromBundleID:](self->_bundleUtil, "isAppExtensionFromBundleID:", v8);
    if ((_DWORD)v9)
    {
      -[MXBundleUtilProtocol mainAppBundleIDforExtension:](self->_bundleUtil, "mainAppBundleIDforExtension:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          -[MXSourceHandler handleDiagnosticDataWithPayload:].cold.1((uint64_t)v8, logHandle);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v11 = 0;
      v10 = v8;
    }
    -[MXSourceHandler diagnosticServices](self, "diagnosticServices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "diagnosticPayloadForClient:isExtension:andMainAppBundleID:andDate:", v8, v9, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v10;
    -[MXSourceHandler deliveryDataCacher](self, "deliveryDataCacher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v17, "saveDiagnostic:toDeliveryDirectoryForBundleID:", v15, v16);

    if ((_DWORD)v14)
    {
      v18 = objc_msgSend(v4, "sourceID");
      objc_msgSend(v4, "datestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXSourceHandler _removeDeliveredPayloadForSourceID:atDate:](self, "_removeDeliveredPayloadForSourceID:atDate:", v18, v19);

      -[MXSourceHandler deliveryDataCacher](self, "deliveryDataCacher");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "notifyDataAvailableForDelivery");

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[MXSourceHandler deliveryDataCacher](self, "deliveryDataCacher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "writeDiagnosticReport:atAppContainerPath:forClient:withError:", v12, v11, v10, a6);

  return (char)a6;
}

- (void)_removeDeliveredPayloadForSourceID:(int64_t)a3 atDate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MXSourceHandler sourcePathUtil](self, "sourcePathUtil");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDeliveredDiagnosticsForSourceID:forDate:", a3, v6);

}

- (MXSourceDataCacherProtocol)sourceDataCacher
{
  return (MXSourceDataCacherProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceDataCacher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeliveryDataCacher:(id)a3
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

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourcePathUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MXSourceHandlerDelegate)delegate
{
  return (MXSourceHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_diagnosticServices, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_sourceDataCacher, 0);
}

- (void)handleDiagnosticDataWithPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21E837000, a2, OS_LOG_TYPE_ERROR, "could not resolve Main App bundleID for extension %@", (uint8_t *)&v2, 0xCu);
}

@end
