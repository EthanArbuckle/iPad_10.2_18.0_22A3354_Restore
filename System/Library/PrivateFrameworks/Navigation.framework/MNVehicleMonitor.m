@implementation MNVehicleMonitor

- (void)dealloc
{
  objc_super v3;

  -[MNVehicleMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)MNVehicleMonitor;
  -[MNVehicleMonitor dealloc](&v3, sel_dealloc);
}

- (void)startMonitoring
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id buf[2];

  MNGetMNVehicleMonitorLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring vehicle connection.", (uint8_t *)buf, 2u);
  }

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v5 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0CA5740]), "UTF8String");
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke;
  handler[3] = &unk_1E61D2F68;
  objc_copyWeak(&v13, buf);
  notify_register_dispatch(v5, &self->_vehicleConnectedToken, v4, handler);
  v7 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0CA5748]), "UTF8String");
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke_7;
  v9[3] = &unk_1E61D2FB8;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v11, buf);
  notify_register_dispatch(v7, &self->_vehicleDisconnectedToken, v8, v9);
  self->_isMonitoring = 1;
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

}

void __35__MNVehicleMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  char v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MNGetMNVehicleMonitorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Received vehicle connected notification.", (uint8_t *)&v8, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[MNVehicleMonitor startMonitoring]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_8;
  }
  v5 = objc_loadWeakRetained(WeakRetained + 1);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(v4 + 1);
    -[NSObject vehicleMonitorDidConnectToVehicle:](v7, "vehicleMonitorDidConnectToVehicle:", v4);
LABEL_8:

  }
}

void __35__MNVehicleMonitor_startMonitoring__block_invoke_7(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = dispatch_time(0, 200000000);
  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke_2;
  block[3] = &unk_1E61D2F90;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_after(v2, v3, block);
  objc_destroyWeak(&v5);
}

void __35__MNVehicleMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *WeakRetained;
  id v7;
  char v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[MNCarPlayConnectionMonitor sharedInstance](MNCarPlayConnectionMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  MNGetMNVehicleMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Received vehicle disconnected notification.", (uint8_t *)&v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)&WeakRetained[1].isa);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0)
        goto LABEL_12;
      v9 = objc_loadWeakRetained((id *)&v4[1].isa);
      -[NSObject vehicleMonitorDidDisconnectFromVehicle:](v9, "vehicleMonitorDidDisconnectFromVehicle:", v4);
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315138;
        v11 = "-[MNVehicleMonitor startMonitoring]_block_invoke";
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v10, 0xCu);
      }
    }

    goto LABEL_12;
  }
  if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Received vehicle disconnected notification, but a CarPlay connection is still detected. Ignoring notification.", (uint8_t *)&v10, 2u);
  }
LABEL_12:

}

- (void)stopMonitoring
{
  NSObject *v3;
  int vehicleConnectedToken;
  int vehicleDisconnectedToken;
  uint8_t v6[16];

  if (self->_isMonitoring)
  {
    MNGetMNVehicleMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring vehicle connection.", v6, 2u);
    }

    vehicleConnectedToken = self->_vehicleConnectedToken;
    if (vehicleConnectedToken)
      notify_cancel(vehicleConnectedToken);
    vehicleDisconnectedToken = self->_vehicleDisconnectedToken;
    if (vehicleDisconnectedToken)
      notify_cancel(vehicleDisconnectedToken);
    self->_isMonitoring = 0;
  }
}

- (MNVehicleMonitorDelegate)delegate
{
  return (MNVehicleMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
