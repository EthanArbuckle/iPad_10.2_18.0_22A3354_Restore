@implementation MXSource

void __56__MXSource_cleanServiceDiagnosticsDirectoriesForClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanServiceDiagnosticsDirectoriesForClient:", *(_QWORD *)(a1 + 40));

}

- (MXSourceHandler)handler
{
  return (MXSourceHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  id v4;
  NSObject *iVarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__MXSource_cleanServiceDiagnosticsDirectoriesForClient___block_invoke;
  v7[3] = &unk_24E2F9CD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(iVarQueue, v7);

}

+ (id)sharedSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__MXSource_sharedSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSource_onceToken != -1)
    dispatch_once(&sharedSource_onceToken, block);
  return (id)sharedSource_result;
}

void __24__MXSource_sharedSource__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSource_result;
  sharedSource_result = (uint64_t)v1;

}

- (MXSource)init
{
  MXSource *v2;
  MXSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXSource;
  v2 = -[MXSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MXSource _initLogHandle](v2, "_initLogHandle");
    -[MXSource _initQueue](v3, "_initQueue");
    -[MXSource _initIvar](v3, "_initIvar");
    -[MXSource _startListenClientXPC](v3, "_startListenClientXPC");
  }
  return v3;
}

- (void)_initLogHandle
{
  os_log_t v3;
  id *p_MXSourceLogHandle;
  OS_os_log *MXSourceLogHandle;
  NSObject *v6;
  uint8_t v7[16];

  v3 = os_log_create("com.apple.metrickit.source", ");
  MXSourceLogHandle = self->_MXSourceLogHandle;
  p_MXSourceLogHandle = (id *)&self->_MXSourceLogHandle;
  *p_MXSourceLogHandle = v3;

  v6 = *p_MXSourceLogHandle;
  if (!*p_MXSourceLogHandle)
  {
    objc_storeStrong(p_MXSourceLogHandle, MEMORY[0x24BDACB70]);
    v6 = *p_MXSourceLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21E837000, v6, OS_LOG_TYPE_DEFAULT, "Initializing MXSource\n", v7, 2u);
  }
}

- (void)_initQueue
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *requestQueue;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *iVarQueue;
  NSObject *v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickit.source.requestqueue", v3);
  requestQueue = self->_requestQueue;
  self->_requestQueue = v4;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickit.source.ivarqueue", v8);
  iVarQueue = self->_iVarQueue;
  self->_iVarQueue = v6;

}

- (void)_initIvar
{
  void *v3;
  MXPayloadValidator *v4;
  MXPayloadValidator *payloadValidator;
  void *v6;
  MXBundleUtilProtocol *v7;
  MXBundleUtilProtocol *bundleUtil;
  MXSourceHandler *v9;
  MXSourceHandler *handler;
  id v11;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadValidator");
  v4 = (MXPayloadValidator *)objc_claimAutoreleasedReturnValue();
  payloadValidator = self->_payloadValidator;
  self->_payloadValidator = v4;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleUtil");
  v7 = (MXBundleUtilProtocol *)objc_claimAutoreleasedReturnValue();
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = v7;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handlerForMXSourceWithDelegate:", self);
  v9 = (MXSourceHandler *)objc_claimAutoreleasedReturnValue();
  handler = self->_handler;
  self->_handler = v9;

}

- (void)_startListenClientXPC
{
  NSObject *iVarQueue;
  _QWORD block[5];

  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MXSource__startListenClientXPC__block_invoke;
  block[3] = &unk_24E2F9CA8;
  block[4] = self;
  dispatch_async(iVarQueue, block);
}

void __33__MXSource__startListenClientXPC__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21E837000, v2, OS_LOG_TYPE_DEFAULT, "Initializing XPC Listener", (uint8_t *)&v9, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.metrickitsource.xpc"));
  objc_msgSend(*(id *)(a1 + 32), "setXpcListener:", v3);

  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "xpcListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_21E837000, v4, OS_LOG_TYPE_DEFAULT, "XPC Listener: %@", (uint8_t *)&v9, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "xpcListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "xpcListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *requestQueue;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__MXSource_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_24E2F9CD0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(requestQueue, v9);

  return 1;
}

uint64_t __47__MXSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_21E837000, v2, OS_LOG_TYPE_DEFAULT, "Received connection request from %d\n", (uint8_t *)v5, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setupExportedInterfaceForConnection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setupRemoteInterfaceForConnection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setupHandlersForConnection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "resume");
}

- (void)_setupExportedInterfaceForConnection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;

  v3 = (void *)MEMORY[0x24BDD1990];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_255444F00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exportedInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_writeMetricDataWithPayload_, 0, 0);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exportedInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_writeDiagnosticDataWithPayload_, 0, 0);

  objc_msgSend(v4, "setExportedObject:", self);
}

- (void)_setupRemoteInterfaceForConnection:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD1990];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_255447E90);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

}

- (void)_setupHandlersForConnection:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__MXSource__setupHandlersForConnection___block_invoke;
  v7[3] = &unk_24E2F9CA8;
  v7[4] = self;
  v5 = a3;
  objc_msgSend(v5, "setInterruptionHandler:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __40__MXSource__setupHandlersForConnection___block_invoke_27;
  v6[3] = &unk_24E2F9CA8;
  v6[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v6);

}

void __40__MXSource__setupHandlersForConnection___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = 67109120;
    v3[1] = objc_msgSend(v2, "processIdentifier");
    _os_log_impl(&dword_21E837000, v1, OS_LOG_TYPE_INFO, "Connection to %d interrupted\n", (uint8_t *)v3, 8u);

  }
}

void __40__MXSource__setupHandlersForConnection___block_invoke_27(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = 67109120;
    v3[1] = objc_msgSend(v2, "processIdentifier");
    _os_log_impl(&dword_21E837000, v1, OS_LOG_TYPE_INFO, "Connection to %d invalidated\n", (uint8_t *)v3, 8u);

  }
}

- (void)writeMetricDataWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *iVarQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[MXPayloadValidator validatePayload:](self->_payloadValidator, "validatePayload:", v4))
  {
    -[MXSource MXSourceLogHandle](self, "MXSourceLogHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[MXSource writeMetricDataWithPayload:].cold.1(v4);

    iVarQueue = self->_iVarQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__MXSource_writeMetricDataWithPayload___block_invoke;
    v7[3] = &unk_24E2F9CD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(iVarQueue, v7);

  }
}

void __39__MXSource_writeMetricDataWithPayload___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleMetricDataWithPayload:", *(_QWORD *)(a1 + 40));

}

- (void)writeDiagnosticDataWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *iVarQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[MXPayloadValidator validatePayload:](self->_payloadValidator, "validatePayload:", v4))
  {
    -[MXSource MXSourceLogHandle](self, "MXSourceLogHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[MXSource writeDiagnosticDataWithPayload:].cold.1(v4);

    iVarQueue = self->_iVarQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__MXSource_writeDiagnosticDataWithPayload___block_invoke;
    v7[3] = &unk_24E2F9CD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(iVarQueue, v7);

  }
}

void __43__MXSource_writeDiagnosticDataWithPayload___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleDiagnosticDataWithPayload:", *(_QWORD *)(a1 + 40));

}

- (BOOL)writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  return -[MXSourceHandler writeDiagnosticReport:atAppContainerPath:forClient:withError:](self->_handler, "writeDiagnosticReport:atAppContainerPath:forClient:withError:", a3, a4, a5, a6);
}

- (void)metricPayloadDidCacheToSourceDirectory
{
  id v2;

  -[MXSource _invalidateConnection](self, "_invalidateConnection");
  +[MXCore sharedCore](MXCore, "sharedCore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDataActivity");

}

- (void)_invalidateConnection
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "invalidate");
    v2 = v3;
  }

}

- (void)deliverDummyPayloadForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *iVarQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MXSource_deliverDummyPayloadForClient___block_invoke;
  block[3] = &unk_24E2F9CF8;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(iVarQueue, block);

}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_3(v2, a1, v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bundleIDFromPid:", objc_msgSend(*(id *)(a1 + 40), "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dt.instruments.DVTInstrumentsFoundation"));

  objc_msgSend(*(id *)(a1 + 32), "MXSourceLogHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_1(a1, v6, v8);

    +[MXCore sharedCore](MXCore, "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliverDummyPayloadForXcodeClient:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (v7)
      __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_2(v6);

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
}

- (OS_os_log)MXSourceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMXSourceLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MXPayloadValidator)payloadValidator
{
  return (MXPayloadValidator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPayloadValidator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_iVarQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_payloadValidator, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_MXSourceLogHandle, 0);
}

- (void)writeMetricDataWithPayload:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "sourceIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_21E837000, v4, v5, "source : %@, metrics : %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

- (void)writeDiagnosticDataWithPayload:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "sourceIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_21E837000, v4, v5, "source : %@, diagnostics : %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_10();
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a2, a3, "Commencing dummy delivery per request from DTServiceHub for: %@", (uint8_t *)&v4);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E837000, log, OS_LOG_TYPE_DEBUG, "Rejecting dummy payload delivery request", v1, 2u);
}

void __41__MXSource_deliverDummyPayloadForClient___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), "bundleIDFromPid:", objc_msgSend(*(id *)(a2 + 40), "processIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a3, v5, "Received dummy delivery request from: %@", (uint8_t *)&v6);

}

@end
