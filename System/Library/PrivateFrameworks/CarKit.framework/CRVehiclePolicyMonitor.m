@implementation CRVehiclePolicyMonitor

- (CRVehiclePolicyMonitor)initWithVehicleCertificateSerial:(id)a3
{
  id v4;
  CRVehiclePolicyMonitor *v5;
  CRVehiclePolicyMonitor *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRVehiclePolicyMonitor;
  v5 = -[CRVehiclePolicyMonitor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CRVehiclePolicyMonitor setVehicleCertificateSerial:](v5, "setVehicleCertificateSerial:", v4);
    -[CRVehiclePolicyMonitor monitoringConnection](v6, "monitoringConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehiclePolicyMonitor setServiceConnection:](v6, "setServiceConnection:", v7);

    -[CRVehiclePolicyMonitor setMonitoring:](v6, "setMonitoring:", 0);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CRVehiclePolicyMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)CRVehiclePolicyMonitor;
  -[CRVehiclePolicyMonitor dealloc](&v3, sel_dealloc);
}

- (id)monitoringConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[8];
  _QWORD v9[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.monitoring.service"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC498);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9A4480);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);
  objc_msgSend(v3, "setExportedObject:", self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CRVehiclePolicyMonitor_monitoringConnection__block_invoke;
  v9[3] = &unk_1E5427E58;
  v9[4] = self;
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit vehicle policy monitoring service.", v8, 2u);
  }

  objc_msgSend(v3, "resume");
  return v3;
}

uint64_t __46__CRVehiclePolicyMonitor_monitoringConnection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "startMonitoring");
  return result;
}

- (void)startMonitoring
{
  void *v3;
  void *v4;
  id v5;

  -[CRVehiclePolicyMonitor setMonitoring:](self, "setMonitoring:", 1);
  -[CRVehiclePolicyMonitor vehicleCertificateSerial](self, "vehicleCertificateSerial");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRVehiclePolicyMonitor serviceConnection](self, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startMonitoringCertificateSerial:reply:", v5, &__block_literal_global_27_0);

}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_26()
{
  NSObject *v0;
  uint8_t v1[16];

  CarGeneralLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEFAULT, "started monitoring", v1, 2u);
  }

}

- (void)stopMonitoring
{
  void *v3;
  void *v4;
  id v5;

  -[CRVehiclePolicyMonitor setMonitoring:](self, "setMonitoring:", 0);
  -[CRVehiclePolicyMonitor vehicleCertificateSerial](self, "vehicleCertificateSerial");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRVehiclePolicyMonitor serviceConnection](self, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_28_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopMonitoringCertificateSerial:reply:", v5, &__block_literal_global_30);

}

void __40__CRVehiclePolicyMonitor_stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __40__CRVehiclePolicyMonitor_stopMonitoring__block_invoke_29()
{
  NSObject *v0;
  uint8_t v1[16];

  CarGeneralLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEFAULT, "stopped monitoring", v1, 2u);
  }

}

- (void)willEnableCertificateSerial:(id)a3 reply:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "client received willEnableCertificateSerial", buf, 2u);
  }

  -[CRVehiclePolicyMonitor vehicleCertificateSerial](self, "vehicleCertificateSerial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToData:", v7);

  if ((v10 & 1) != 0)
  {
    -[CRVehiclePolicyMonitor delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CRVehiclePolicyMonitor delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "willEnableVehicleTrackedByMonitor:", self);

    }
    v6[2](v6);
  }
  else
  {
    CarGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "not monitoring this serial, ignoring", v15, 2u);
    }

  }
}

- (void)willDisableCertificateSerial:(id)a3 reply:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "client received willDisableCertificateSerial", buf, 2u);
  }

  -[CRVehiclePolicyMonitor vehicleCertificateSerial](self, "vehicleCertificateSerial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToData:", v7);

  if ((v10 & 1) != 0)
  {
    -[CRVehiclePolicyMonitor delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CRVehiclePolicyMonitor delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "willDisableVehicleTrackedByMonitor:", self);

    }
    v6[2](v6);
  }
  else
  {
    CarGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "not monitoring this serial, ignoring", v15, 2u);
    }

  }
}

- (NSData)vehicleCertificateSerial
{
  return self->_vehicleCertificateSerial;
}

- (void)setVehicleCertificateSerial:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleCertificateSerial, a3);
}

- (CRVehiclePolicyMonitoring)delegate
{
  return (CRVehiclePolicyMonitoring *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicleCertificateSerial, 0);
}

void __41__CRVehiclePolicyMonitor_startMonitoring__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "failed to connect to monitoring service %@", a5, a6, a7, a8, 2u);
}

@end
