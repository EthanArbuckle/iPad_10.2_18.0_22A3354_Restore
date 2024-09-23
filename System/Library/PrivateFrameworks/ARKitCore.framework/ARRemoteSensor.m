@implementation ARRemoteSensor

- (ARRemoteSensor)initWithListenerEndpoint:(id)a3
{
  id v4;
  ARServerConnection *v5;
  ARRemoteSensor *v6;

  v4 = a3;
  v5 = -[ARServerConnection initWithListenerEndpoint:]([ARServerConnection alloc], "initWithListenerEndpoint:", v4);

  v6 = -[ARRemoteSensor initWithServerConnection:](self, "initWithServerConnection:", v5);
  return v6;
}

- (ARRemoteSensor)initWithServerConnection:(id)a3
{
  id v5;
  ARRemoteSensor *v6;
  ARRemoteSensor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteSensor;
  v6 = -[ARRemoteSensor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverConnection, a3);
    -[ARServerConnection setDelegate:](v7->_serverConnection, "setDelegate:", v7);
    -[ARServerConnection setExportedInterface:](v7->_serverConnection, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF098038));
    -[ARServerConnection setExportedObject:](v7->_serverConnection, "setExportedObject:", v7);
    -[ARServerConnection setRemoteObjectInterface:](v7->_serverConnection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0A4078));
    v7->_running = 0;
  }

  return v7;
}

- (ARRemoteSensor)initWithServiceName:(id)a3
{
  id v4;
  ARServerConnection *v5;
  ARRemoteSensor *v6;

  v4 = a3;
  v5 = -[ARServerConnection initWithServiceName:]([ARServerConnection alloc], "initWithServiceName:", v4);

  v6 = -[ARRemoteSensor initWithServerConnection:](self, "initWithServerConnection:", v5);
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  ARRemoteSensor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_8();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)ARRemoteSensor;
  -[ARRemoteSensor dealloc](&v6, sel_dealloc);
}

- (void)sensorDidFailWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARRemoteSensor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didFailWithError:", self, v4);

}

- (void)sensorDidOutputSensorData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARRemoteSensor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didOutputSensorData:", self, v4);

}

- (void)sensorDidPause
{
  void *v3;
  char v4;
  id v5;

  -[ARRemoteSensor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ARRemoteSensor delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensorDidPause:", self);

  }
}

- (void)sensorDidRestart
{
  void *v3;
  char v4;
  id v5;

  -[ARRemoteSensor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ARRemoteSensor delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensorDidRestart:", self);

  }
}

- (void)sensorDidStart
{
  void *v3;
  char v4;
  id v5;

  -[ARRemoteSensor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ARRemoteSensor delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensorDidStart:", self);

  }
}

- (unint64_t)providedDataTypes
{
  uint64_t v2;
  ARServerConnection *serverConnection;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = MEMORY[0x1E0C809B0];
  serverConnection = self->_serverConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__ARRemoteSensor_providedDataTypes__block_invoke;
  v8[3] = &unk_1E6672EB8;
  v8[4] = self;
  -[ARServerConnection synchronousRemoteObjectProxyWithErrorHandler:](serverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __35__ARRemoteSensor_providedDataTypes__block_invoke_66;
  v7[3] = &unk_1E66742C8;
  v7[4] = &v9;
  objc_msgSend(v4, "providedDataTypesWithReply:", v7);
  v5 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __35__ARRemoteSensor_providedDataTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __35__ARRemoteSensor_providedDataTypes__block_invoke_66(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)start
{
  ARServerConnection *serverConnection;
  void *v4;
  _QWORD v5[5];

  if (!-[ARRemoteSensor isRunning](self, "isRunning"))
  {
    -[ARRemoteSensor setRunning:](self, "setRunning:", 1);
    serverConnection = self->_serverConnection;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __23__ARRemoteSensor_start__block_invoke;
    v5[3] = &unk_1E6672EB8;
    v5[4] = self;
    -[ARServerConnection synchronousRemoteObjectProxyWithErrorHandler:](serverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");

  }
}

void __23__ARRemoteSensor_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)stop
{
  ARServerConnection *serverConnection;
  void *v4;
  _QWORD v5[5];

  if (-[ARRemoteSensor isRunning](self, "isRunning"))
  {
    -[ARRemoteSensor setRunning:](self, "setRunning:", 0);
    serverConnection = self->_serverConnection;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__ARRemoteSensor_stop__block_invoke;
    v5[3] = &unk_1E6672EB8;
    v5[4] = self;
    -[ARServerConnection synchronousRemoteObjectProxyWithErrorHandler:](serverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

  }
}

void __22__ARRemoteSensor_stop__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (ARServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
