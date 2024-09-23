@implementation CMContinuityCaptureNWServer

- (CMContinuityCaptureNWServer)initWithQueue:(id)a3
{
  id v5;
  void *v6;
  CMContinuityCaptureTransportNWDevice *v7;
  void *v8;
  CMContinuityCaptureTransportNWDevice *v9;
  CMContinuityCaptureNWServer *v10;
  CMContinuityCaptureNWServer *v11;
  CMContinuityCaptureRemoteCompositeDevice *v12;
  CMContinuityCaptureRemoteCompositeDevice *compositeDevice;
  NSObject *v14;
  CMContinuityCaptureRemoteCompositeDevice *v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;
  _BYTE buf[12];
  __int16 v21;
  CMContinuityCaptureRemoteCompositeDevice *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = [CMContinuityCaptureTransportNWDevice alloc];
  +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice](CMContinuityCaptureCapabilities, "capabilitiesForCurrentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CMContinuityCaptureTransportNWDevice initWithCapabilities:identifier:remote:](v7, "initWithCapabilities:identifier:remote:", v8, self->_identifier, 0);

  v19.receiver = self;
  v19.super_class = (Class)CMContinuityCaptureNWServer;
  v10 = -[CMContinuityCaptureNWTransportBase initWithDevice:](&v19, sel_initWithDevice_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, v6);
    objc_storeStrong((id *)&v11->_device, v9);
    objc_storeStrong((id *)&v11->_queue, a3);
    v12 = -[CMContinuityCaptureRemoteCompositeDevice initWithTransportServer:videoPreviewLayer:]([CMContinuityCaptureRemoteCompositeDevice alloc], "initWithTransportServer:videoPreviewLayer:", v11, 0);
    compositeDevice = v11->_compositeDevice;
    v11->_compositeDevice = v12;

    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v11->_compositeDevice;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ composite device %{public}@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v11);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__CMContinuityCaptureNWServer_initWithQueue___block_invoke;
    v17[3] = &unk_24F06C0A8;
    objc_copyWeak(&v18, (id *)buf);
    -[CMContinuityCaptureNWTransportBase createTimeSyncClock:](v11, "createTimeSyncClock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    -[CMContinuityCaptureNWServer setupTCPConnection](v11, "setupTCPConnection");
    -[CMContinuityCaptureTransportNWDevice activate:](v11->_device, "activate:", 1);
  }

  return v11;
}

void __45__CMContinuityCaptureNWServer_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("timeSyncClock"));
    objc_storeStrong(v5 + 8, a2);
    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("timeSyncClock"));
  }

}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  CMContinuityCaptureNWServer *v2;
  CMContinuityCaptureTimeSyncClock *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (void)setupTCPConnection
{
  NSObject *host_with_numeric_port;
  NSObject *secure_tcp;
  OS_nw_connection *v5;
  OS_nw_connection *connection;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureNWServer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(localIPAddress, "UTF8String");
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  if (!host_with_numeric_port)
  {
    CMContinuityCaptureLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp endpoint", buf, 0xCu);
    }
    secure_tcp = 0;
    goto LABEL_10;
  }
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
  v5 = (OS_nw_connection *)nw_connection_create(host_with_numeric_port, secure_tcp);
  connection = self->_connection;
  self->_connection = v5;

  v7 = self->_connection;
  if (!v7)
  {
    CMContinuityCaptureLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp connection", buf, 0xCu);
    }
LABEL_10:

    goto LABEL_4;
  }
  -[CMContinuityCaptureNWServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v7, v8);

  v9 = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__CMContinuityCaptureNWServer_setupTCPConnection__block_invoke;
  v11[3] = &unk_24F06C120;
  objc_copyWeak(&v12, &location);
  nw_connection_set_state_changed_handler(v9, v11);
  objc_destroyWeak(&v12);
  nw_connection_start((nw_connection_t)self->_connection);
LABEL_4:

  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureNWServer_setupTCPConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _QWORD *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = 138412802;
    v11 = WeakRetained;
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW connection state %d error %@", (uint8_t *)&v10, 0x1Cu);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v8;
  if (a2 == 3 && v8)
  {
    objc_msgSend(*((id *)v8 + 3), "setActiveConnection:", *((_QWORD *)v8 + 7));
    objc_msgSend(v9, "scheduleReadForConnection:dataTillNow:", v9[7], 0);
  }

}

- (ContinuityCaptureTaskDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  ContinuityCaptureTaskDelegate *v4;
  ContinuityCaptureTaskDelegate *delegate;

  v4 = (ContinuityCaptureTaskDelegate *)a3;
  -[CMContinuityCaptureNWTransportBase setTaskDelegate:](self, "setTaskDelegate:", v4);
  delegate = self->_delegate;
  self->_delegate = v4;

}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureNWServer localDevice](self, "localDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)clientDeviceModel
{
  return self->clientDeviceModel;
}

- (unint64_t)currentSessionID
{
  return self->currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  self->currentSessionID = a3;
}

- (int64_t)currentTransport
{
  return self->currentTransport;
}

- (NSDate)sessionActivationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice
{
  return (CMContinuityCaptureRemoteCompositeDevice *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeDevice, 0);
  objc_storeStrong((id *)&self->sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
