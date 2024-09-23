@implementation CMContinuityCaptureNWClient

- (CMContinuityCaptureNWClient)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMContinuityCaptureNWClient *v12;
  NSMutableSet *v13;
  NSMutableSet *activeEntities;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CMContinuityCaptureNWClient;
  v12 = -[CMContinuityCaptureNWTransportBase initWithDevice:](&v24, sel_initWithDevice_, v9);
  if (v12)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeEntities = v12->_activeEntities;
    v12->_activeEntities = v13;

    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v12->_queue, a4);
    v15 = objc_storeWeak((id *)&v12->_taskDelegate, v11);
    -[CMContinuityCaptureNWTransportBase setTaskDelegate:](v12, "setTaskDelegate:", v11);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __65__CMContinuityCaptureNWClient_initWithDevice_queue_taskDelegate___block_invoke;
    v21 = &unk_24F06C0A8;
    objc_copyWeak(&v22, &location);
    -[CMContinuityCaptureNWTransportBase createTimeSyncClock:](v12, "createTimeSyncClock:", &v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    -[CMContinuityCaptureNWClient setupTCPListener](v12, "setupTCPListener", v18, v19, v20, v21);
    +[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connectToContinuityCaptureServerWithDelegate:", v12);

    -[ContinuityCaptureTransportDevice activate:](v12->_device, "activate:", 1);
  }

  return v12;
}

void __65__CMContinuityCaptureNWClient_initWithDevice_queue_taskDelegate___block_invoke(uint64_t a1, void *a2)
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
    objc_storeStrong(v5 + 10, a2);
    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("timeSyncClock"));
  }

}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  CMContinuityCaptureNWClient *v2;
  CMContinuityCaptureTimeSyncClock *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (void)setupTCPListener
{
  NSObject *secure_tcp;
  NSObject *v4;
  id v5;
  OS_nw_listener *v6;
  OS_nw_listener *listener;
  NSObject *v8;
  OS_nw_listener *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD handler[4];
  id v19;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureNWClient *v22;
  __int16 v23;
  OS_nw_listener *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
  v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(secure_tcp, v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (unsigned __int16)tcpPort);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (OS_nw_listener *)nw_listener_create_with_port((const char *)objc_msgSend(v5, "UTF8String"), secure_tcp);
  listener = self->_listener;
  self->_listener = v6;

  if (self->_listener)
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_listener;
      *(_DWORD *)buf = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ NW listener %@", buf, 0x16u);
    }

    v10 = self->_listener;
    -[CMContinuityCaptureNWClient queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    nw_listener_set_queue(v10, v11);

    v12 = self->_listener;
    v13 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke;
    handler[3] = &unk_24F06C0F8;
    objc_copyWeak(&v19, &location);
    nw_listener_set_new_connection_handler(v12, handler);
    v14 = self->_listener;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_8;
    v16[3] = &unk_24F06C120;
    objc_copyWeak(&v17, &location);
    nw_listener_set_state_changed_handler(v14, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    nw_listener_start((nw_listener_t)self->_listener);
  }
  else
  {
    CMContinuityCaptureLog(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%@ Failed to get tcp listener", buf, 0xCu);
    }

  }
  objc_destroyWeak(&location);
}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id *v7;
  id *v8;
  id *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[5];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    v16 = WeakRetained;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ New connection  %@", buf, 0x16u);

  }
  v7 = (id *)(a1 + 32);
  v8 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a2);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_5;
    handler[3] = &unk_24F06C0D0;
    objc_copyWeak(&v14, v7);
    handler[4] = v9;
    v10 = v4;
    v13 = v10;
    nw_connection_set_state_changed_handler(v10, handler);
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v10, v11);

    nw_connection_start(v10);
    objc_destroyWeak(&v14);
  }

}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v11 = 138412802;
    v12 = WeakRetained;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW connection state %d error %@", (uint8_t *)&v11, 0x1Cu);

  }
  if (a2 != 3)
  {
    if ((a2 & 0xFFFFFFFB) != 0)
    {
      if (a2 != 5)
        goto LABEL_11;
    }
    else
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
      if (!v8)
        goto LABEL_11;
      nw_connection_cancel(v8);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = 0;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setActiveConnection:", 0);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setActiveConnection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "scheduleReadForConnection:dataTillNow:", *(_QWORD *)(a1 + 40), 0);
LABEL_11:

}

void __47__CMContinuityCaptureNWClient_setupTCPListener__block_invoke_8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 138412802;
    v9 = WeakRetained;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ NW lsitener state %d error %@", (uint8_t *)&v8, 0x1Cu);

  }
}

- (ContinuityCaptureTransportDevice)device
{
  return self->_device;
}

- (ContinuityCaptureTaskDelegate)delegate
{
  return (ContinuityCaptureTaskDelegate *)objc_loadWeakRetained((id *)&self->_taskDelegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)currentSessionID
{
  return self->_currentSessionID;
}

- (void)activateEntity:(int64_t)a3 configuration:(id)a4 option:(unint64_t)a5 entityCompletion:(id)a6 overallCompletion:(id)a7
{
  void (**v11)(id, int64_t, _QWORD);
  id v12;
  NSMutableSet *activeEntities;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  id v18;

  v18 = a4;
  v11 = (void (**)(id, int64_t, _QWORD))a6;
  v12 = a7;
  if (v18)
  {
    activeEntities = self->_activeEntities;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(activeEntities) = -[NSMutableSet containsObject:](activeEntities, "containsObject:", v14);

    if ((activeEntities & 1) == 0)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v18, "setSessionID:", v15);

      objc_msgSend(v18, "setGenerationID:", CMContinuityCaptureGetStreamSessionGenerationID());
    }
  }
  v16 = self->_activeEntities;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v16, "addObject:", v17);

  if (-[NSMutableSet count](self->_activeEntities, "count") == 1)
    self->_currentSessionID = CMContinuityCaptureGetActivateGenerationID();
  v11[2](v11, a3, 0);
  (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

}

- (id)debugInfo
{
  return 0;
}

- (void)invalidate
{
  -[ContinuityCaptureTransportDevice activate:](self->_device, "activate:", 0);
}

- (void)resetSession:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)setPreferredTransport:(int64_t)a3 resetConnection:(BOOL)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)terminateEntity:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  NSMutableSet *activeEntities;
  void *v7;
  void *v8;
  void (**v9)(id, int64_t, _QWORD);

  activeEntities = self->_activeEntities;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v9 = (void (**)(id, int64_t, _QWORD))a5;
  objc_msgSend(v7, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](activeEntities, "removeObject:", v8);

  v9[2](v9, a3, 0);
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
  -[CMContinuityCaptureNWClient device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)lastActivationTime
{
  return self->lastActivationTime;
}

- (CMContinuityCaptureMetricsReporter)metricReporter
{
  return (CMContinuityCaptureMetricsReporter *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)preferredTransport
{
  return self->preferredTransport;
}

- (NSDate)sessionActivationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->metricReporter, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_activeEntities, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_taskDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
