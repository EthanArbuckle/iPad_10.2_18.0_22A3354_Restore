@implementation MXCoreHandler

- (void)registerClientForBundleID:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[MXCoreHandler _updateClientAvailabilityAndPrepareDataActivityForBundleID:](self, "_updateClientAvailabilityAndPrepareDataActivityForBundleID:", v5);
  if ((-[MXClientUtilProtocol hasClientForBundleID:](self->_clientUtil, "hasClientForBundleID:", v5) & 1) == 0)
  {
    -[MXClientUtilProtocol registerClientForBundleID:](self->_clientUtil, "registerClientForBundleID:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientDidRegisterForBundleID:", v5);

  }
}

- (void)_updateClientAvailabilityAndPrepareDataActivityForBundleID:(id)a3
{
  id v4;
  NSObject *logHandle;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MXClientUtilProtocol persistAllClients](self->_clientUtil, "persistAllClients");
  -[MXClientUtilProtocol updateClientAsAvailableFromPersistence](self->_clientUtil, "updateClientAsAvailableFromPersistence");
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v6 = logHandle;
    -[MXCoreHandler clientUtil](self, "clientUtil");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v7, "isClientAvailableForBundleID:", v4);
    _os_log_impl(&dword_21E837000, v6, OS_LOG_TYPE_INFO, "Interested clients now available State: %d\n", (uint8_t *)v9, 8u);

  }
  if (-[MXClientUtilProtocol isClientAvailableFromPersistence](self->_clientUtil, "isClientAvailableFromPersistence"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientIsAvailableForPreparingDataActivity");

  }
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (id)metricsForBundleID:(id)a3
{
  return (id)-[MXDeliveryDataCacherProtocol metricsForClient:](self->_deliveryDataCacher, "metricsForClient:", a3);
}

- (BOOL)shouldDeliverDataForBundleID:(id)a3
{
  return -[MXClientUtilProtocol isClientAvailableForBundleID:](self->_clientUtil, "isClientAvailableForBundleID:", a3);
}

- (id)diagnosticsForBundleID:(id)a3
{
  return (id)-[MXDeliveryDataCacherProtocol diagnosticsForClient:](self->_deliveryDataCacher, "diagnosticsForClient:", a3);
}

- (MXCoreHandler)initWithClientUtil:(id)a3 andDeliveryDataCacher:(id)a4 andDeliveryPathUtil:(id)a5 andMetricServices:(id)a6 andDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MXCoreHandler *v17;
  MXCoreHandler *v18;
  os_log_t v19;
  OS_os_log *logHandle;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXCoreHandler;
  v17 = -[MXCoreHandler init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientUtil, a3);
    objc_storeStrong((id *)&v18->_deliveryDataCacher, a4);
    objc_storeStrong((id *)&v18->_deliveryPathUtil, a5);
    objc_storeStrong((id *)&v18->_metricServices, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v19 = os_log_create("com.apple.metrickit", "core.handler");
    logHandle = v18->_logHandle;
    v18->_logHandle = (OS_os_log *)v19;

    if (!v18->_logHandle)
      objc_storeStrong((id *)&v18->_logHandle, MEMORY[0x24BDACB70]);
  }

  return v18;
}

- (void)registerClientAndTeamForBundleID:(id)a3 andTeamID:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MXCoreHandler _updateClientAvailabilityAndPrepareDataActivityForBundleID:](self, "_updateClientAvailabilityAndPrepareDataActivityForBundleID:", v8);
  if ((-[MXClientUtilProtocol hasClientForBundleID:](self->_clientUtil, "hasClientForBundleID:", v8) & 1) == 0)
  {
    -[MXClientUtilProtocol registerClientForBundleID:](self->_clientUtil, "registerClientForBundleID:", v8);
    -[MXClientUtilProtocol registerTeamForBundleID:andTeamID:](self->_clientUtil, "registerTeamForBundleID:andTeamID:", v8, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientDidRegisterForBundleID:", v8);

  }
}

- (void)performDataActivity
{
  if (-[MXClientUtilProtocol isClientAvailableFromPersistence](self->_clientUtil, "isClientAvailableFromPersistence"))-[MXCoreHandler _processDataActivity](self, "_processDataActivity");
}

- (void)saveMetricPayloadsToDeliveryDirectoryAndReportSuccessForClientMetrics:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  -[MXCoreHandler _reportMetricKitUsage](self, "_reportMetricKitUsage");
  v5 = -[MXCoreHandler _successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:](self, "_successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:", v4);

  -[MXClientUtilProtocol reportPayloadDeliveriesSuccessWithSuccessCount:](self->_clientUtil, "reportPayloadDeliveriesSuccessWithSuccessCount:", v5);
}

- (void)_processDataActivity
{
  id WeakRetained;
  id v4;

  -[MXMetricServicesProtocol clientMetricPayloadsForAllClients](self->_metricServices, "clientMetricPayloadsForAllClients");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics:", v4);

    -[MXCoreHandler _handleClientAvailability](self, "_handleClientAvailability");
    -[MXDeliveryDataCacherProtocol notifyDataAvailableForDelivery](self->_deliveryDataCacher, "notifyDataAvailableForDelivery");
  }

}

- (void)_handleClientAvailability
{
  NSObject *logHandle;
  id WeakRetained;
  uint8_t v5[16];

  -[MXClientUtilProtocol persistAllClients](self->_clientUtil, "persistAllClients");
  if ((-[MXClientUtilProtocol hasAnyClient](self->_clientUtil, "hasAnyClient") & 1) == 0)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "No more available clients, resetting client availability key", v5, 2u);
    }
    -[MXClientUtilProtocol updateClientAsNotAvailableFromPersistence](self->_clientUtil, "updateClientAsNotAvailableFromPersistence");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientIsNotAvailable");

  }
}

- (void)_reportMetricKitUsage
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MXClientUtilProtocol allClients](self->_clientUtil, "allClients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[MXClientUtilProtocol reportMetricKitUsageForBundleID:](self->_clientUtil, "reportMetricKitUsageForBundleID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)_successCountFromSavingMetricPayloadsToDeliveryDirectoryForClientMetrics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *logHandle;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412290;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          v22 = v12;
          _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_DEFAULT, "Payload delivery for client: %@", buf, 0xCu);
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v12, v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += -[MXDeliveryDataCacherProtocol saveMetrics:toDeliveryDirectoryForBundleID:](self->_deliveryDataCacher, "saveMetrics:toDeliveryDirectoryForBundleID:", v14, v12);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldDeliverDataForBundleID:(id)a3 andTeamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (-[MXClientUtilProtocol isClientAvailableForBundleID:](self->_clientUtil, "isClientAvailableForBundleID:", v6))
  {
    -[MXClientUtilProtocol teamIDForBundleID:](self->_clientUtil, "teamIDForBundleID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:", v7) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setClientUtil:(id)a3
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

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MXMetricServicesProtocol)metricServices
{
  return (MXMetricServicesProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (MXCoreHandlerDelegate)delegate
{
  return (MXCoreHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metricServices, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
}

@end
