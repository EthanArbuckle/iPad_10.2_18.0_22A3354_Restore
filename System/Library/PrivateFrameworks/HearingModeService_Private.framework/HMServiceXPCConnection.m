@implementation HMServiceXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  int v3;
  void *v5;
  int v6;

  if (self->_entitled)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  -[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.HearingModeService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v6)
  {
    LOBYTE(v3) = 1;
    self->_entitled = 1;
    return v3;
  }
  if (gLogCategory_HMServiceDaemon > 90)
  {
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (gLogCategory_HMServiceDaemon != -1 || (v3 = _LogCategory_Initialize()) != 0)
  {
    -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
    LogPrintF();
    goto LABEL_8;
  }
  return v3;
}

- (void)xpcConnectionInvalidated
{
  HMServiceClient *hearingModeClient;
  HMServiceClient *v4;
  int v5;
  HMServiceClient *v6;
  HMServiceClient *v7;

  v7 = self->_hearingModeClient;
  hearingModeClient = self->_hearingModeClient;
  self->_hearingModeClient = 0;

  v4 = v7;
  if (v7)
  {
    if (gLogCategory_HMServiceDaemon <= 10)
    {
      if (gLogCategory_HMServiceDaemon != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        v6 = v4;
        LogPrintF();
        v4 = v7;
      }
    }
    -[HMServiceClient invalidate](v4, "invalidate", v6);
    v4 = v7;
  }

}

- (void)clientActivate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  id *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id obj;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v9 = MEMORY[0x24BDAC760];
  v32 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke;
  v24[3] = &unk_250EBB1E0;
  v26 = &v27;
  v10 = v8;
  v25 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x242648A28](v24);
  if (gLogCategory_HMServiceDaemon <= 10
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    v18 = v7;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_hearingModeClient, a3);
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  -[HMServiceDaemon _update](self->_daemon, "_update", v18);
  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "availableRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_HMServiceDaemon <= 30
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    v19 = objc_msgSend(v13, "count");
    LogPrintF();
  }
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_2;
  v23[3] = &unk_250EBB208;
  v23[4] = self;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23, v19);
  if ((objc_msgSend(v7, "internalFlags") & 1) != 0)
  {
    v14 = (id *)(v28 + 5);
    obj = (id)v28[5];
    v15 = -[HMServiceXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
    objc_storeStrong(v14, obj);
    if (v15)
    {
      +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "availableDiagnosticRecords");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (gLogCategory_HMServiceDaemon <= 30
        && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
      {
        v20 = objc_msgSend(v17, "count");
        LogPrintF();
      }
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_3;
      v21[3] = &unk_250EBB230;
      v21[4] = self;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v21, v20);

    }
  }

  v11[2](v11);
  _Block_object_dispose(&v27, 8);

}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(_QWORD *)(v1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));
  }
  return result;
}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientReportHMDeviceRecordChanged:");
}

uint64_t __52__HMServiceXPCConnection_clientActivate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientReportDiagnosticRecord:");
}

- (void)clientModifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__HMServiceXPCConnection_clientModifyDeviceConfig_identifier_completion___block_invoke;
  v16[3] = &unk_250EBB1E0;
  v18 = &v19;
  v11 = v10;
  v17 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x242648A28](v16);
  if (v9 && v8)
  {
    if (gLogCategory_HMServiceDaemon <= 30
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[HMServiceDaemon _modifyDeviceConfig:identifier:completion:](self->_daemon, "_modifyDeviceConfig:identifier:completion:", v8, v9, v11, v8);
    }
    else
    {
      -[HMServiceDaemon _modifyDeviceConfig:identifier:completion:](self->_daemon, "_modifyDeviceConfig:identifier:completion:", v8, v9, v11, v15);
    }
  }
  else
  {
    NSErrorF();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v20[5];
    v20[5] = v13;

  }
  v12[2](v12);

  _Block_object_dispose(&v19, 8);
}

uint64_t __73__HMServiceXPCConnection_clientModifyDeviceConfig_identifier_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(_QWORD *)(v1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));
  }
  return result;
}

- (void)clientReportHMDeviceRecordChanged:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *records;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "bluetoothUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v10, "bluetoothAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      records = self->_records;
      if (!records)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v8 = self->_records;
        self->_records = v7;

        records = self->_records;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](records, "setObject:forKeyedSubscript:", v10, v4);
      if (self->_hearingModeClient)
      {
        -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientHMDeviceRecordChanged:", v10);

      }
    }

  }
}

- (void)clientReportHMDeviceRecordLost:(id)a3
{
  void *v4;
  void *v5;
  HMServiceClient *hearingModeClient;
  NSMutableDictionary *records;
  HMServiceClient *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "bluetoothUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_records, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      hearingModeClient = self->_hearingModeClient;
      if (hearingModeClient)
      {
        records = self->_records;
        v8 = hearingModeClient;
        -[NSMutableDictionary setObject:forKeyedSubscript:](records, "setObject:forKeyedSubscript:", 0, v4);
        -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "clientHMDeviceRecordLost:", v10);
      }
    }
  }

}

- (void)clientReportDiagnosticRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "bluetoothUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "bluetoothAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && self->_hearingModeClient)
    {
      -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientHMDeviceDiagnosticRecordFound:", v7);

    }
  }

}

- (void)clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93__HMServiceXPCConnection_clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke;
  v16[3] = &unk_250EBB1E0;
  v18 = &v19;
  v8 = v7;
  v17 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x242648A28](v16);
  if (v6)
  {
    v10 = (id *)(v20 + 5);
    obj = (id)v20[5];
    v11 = -[HMServiceXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
    objc_storeStrong(v10, obj);
    if (v11)
    {
      if (gLogCategory_HMServiceDaemon <= 30
        && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMServiceDaemon _triggerDiagnosticCheckForIdentifier:completion:](self->_daemon, "_triggerDiagnosticCheckForIdentifier:completion:", v6, v8, v6);
      }
      else
      {
        -[HMServiceDaemon _triggerDiagnosticCheckForIdentifier:completion:](self->_daemon, "_triggerDiagnosticCheckForIdentifier:completion:", v6, v8, v14);
      }
    }
  }
  else
  {
    NSErrorF();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v20[5];
    v20[5] = v12;

  }
  v9[2](v9);

  _Block_object_dispose(&v19, 8);
}

uint64_t __93__HMServiceXPCConnection_clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_HMServiceDaemon <= 90
      && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    result = *(_QWORD *)(v1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (HMServiceDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (HMServiceClient)hearingModeClient
{
  return self->_hearingModeClient;
}

- (void)setHearingModeClient:(id)a3
{
  objc_storeStrong((id *)&self->_hearingModeClient, a3);
}

- (NSMutableDictionary)records
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_hearingModeClient, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
