@implementation MXCore

void __31__MXCore__scheduleDataActivity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  xpc_activity_state_t state;
  _xpc_activity_s *activity;

  activity = a2;
  v3 = (void *)MEMORY[0x2207B03D8]();
  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performDataActivity");
  }
  else if (!state)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupDailyActivityCriteriaForDataActivity:", activity);
  }
  objc_autoreleasePoolPop(v3);

}

- (void)_setupDailyActivityCriteriaForDataActivity:(id)a3
{
  _xpc_activity_s *v4;
  xpc_object_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (_xpc_activity_s *)a3;
  v5 = xpc_activity_copy_criteria(v4);
  if (!v5)
  {
    -[MXCore MXCoreLogHandle](self, "MXCoreLogHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E837000, v6, OS_LOG_TYPE_DEFAULT, "Setting daily activity criteria", v8, 2u);
    }

    -[MXCore _getDailyActivityCriteria](self, "_getDailyActivityCriteria");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v4, v7);

  }
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
  v9[2] = __45__MXCore_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_24E2F9CD0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(requestQueue, v9);

  return 1;
}

void __38__MXCore__setupHandlersForConnection___block_invoke_29(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXCoreLogHandle");
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

uint64_t __45__MXCore_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXCoreLogHandle");
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

- (void)_setupRemoteInterfaceForConnection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDD1990];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_255447F68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_deliverMetricPayload_, 0, 0);

  objc_msgSend(v4, "remoteObjectInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_deliverDiagnosticPayload_, 0, 0);
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
  v7[2] = __38__MXCore__setupHandlersForConnection___block_invoke;
  v7[3] = &unk_24E2F9CA8;
  v7[4] = self;
  v5 = a3;
  objc_msgSend(v5, "setInterruptionHandler:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __38__MXCore__setupHandlersForConnection___block_invoke_29;
  v6[3] = &unk_24E2F9CA8;
  v6[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v6);

}

- (void)_setupExportedInterfaceForConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1990];
  v6 = a3;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_2554456F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v5);

  objc_msgSend(v6, "setExportedObject:", self);
}

- (void)_registerClient
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a1, a3, "Bundle %@ is not codesigned", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (MXCoreHandler)handler
{
  return (MXCoreHandler *)objc_getProperty(self, a2, 64, 1);
}

- (void)retrieveMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXCore bundleUtil](self, "bundleUtil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  objc_msgSend(v4, "bundleIDFromAuditToken:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MXCore _shouldDeliverToClientForBundleID:](self, "_shouldDeliverToClientForBundleID:", v5))
  {
    -[MXCore handler](self, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metricsForBundleID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "remoteObjectProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deliverMetricPayload:", v7);

    }
  }
  else
  {
    objc_msgSend(v3, "invalidate");
  }

}

- (void)retrieveDiagnostics
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleUtil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a2, v4, "Bundle Util: %@", v5);

  OUTLINED_FUNCTION_4_2();
}

- (OS_os_log)MXCoreLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)_shouldDeliverToClientForBundleID:(id)a3
{
  return -[MXCoreHandler shouldDeliverDataForBundleID:](self->_handler, "shouldDeliverDataForBundleID:", a3);
}

- (MXSource)source
{
  return (MXSource *)objc_getProperty(self, a2, 104, 1);
}

- (void)clientIsAvailableForPreparingDataActivity
{
  if (-[MXCore _canSetupXpcListenerForSourceData](self, "_canSetupXpcListenerForSourceData"))
    -[MXCore _scheduleDataActivity](self, "_scheduleDataActivity");
}

- (void)_scheduleDataActivity
{
  NSObject *MXCoreLogHandle;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  MXCoreLogHandle = self->_MXCoreLogHandle;
  if (os_log_type_enabled(MXCoreLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E837000, MXCoreLogHandle, OS_LOG_TYPE_DEFAULT, "Scheduling data activity\n", buf, 2u);
  }
  v4 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __31__MXCore__scheduleDataActivity__block_invoke;
  handler[3] = &unk_24E2F9D88;
  handler[4] = self;
  xpc_activity_register("com.apple.metrickitd.data", v4, handler);
}

- (BOOL)_canSetupXpcListenerForSourceData
{
  MXSource *v3;
  MXSource *source;
  NSObject *MXCoreLogHandle;
  uint64_t v6;
  MXSource *v7;

  +[MXSource sharedSource](MXSource, "sharedSource");
  v3 = (MXSource *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  self->_source = v3;

  MXCoreLogHandle = self->_MXCoreLogHandle;
  if (os_log_type_enabled(MXCoreLogHandle, OS_LOG_TYPE_DEBUG))
    -[MXCore _canSetupXpcListenerForSourceData].cold.2((uint64_t *)&self->_source, MXCoreLogHandle, v6);
  v7 = self->_source;
  if (!v7 && os_log_type_enabled((os_log_t)self->_MXCoreLogHandle, OS_LOG_TYPE_ERROR))
    -[MXCore _canSetupXpcListenerForSourceData].cold.1();
  return v7 != 0;
}

+ (id)sharedCore
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__MXCore_sharedCore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCore_onceToken != -1)
    dispatch_once(&sharedCore_onceToken, block);
  return (id)sharedCore_result;
}

void __20__MXCore_sharedCore__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCore_result;
  sharedCore_result = (uint64_t)v1;

}

- (MXCore)init
{
  MXCore *v2;
  MXCore *v3;
  void *v4;
  int v5;
  NSObject *iVarQueue;
  MXCore *v7;
  _QWORD block[4];
  MXCore *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MXCore;
  v2 = -[MXCore init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MXCore _initLogHandle](v2, "_initLogHandle");
    -[MXCore _initQueue](v3, "_initQueue");
    -[MXCore _initIvar](v3, "_initIvar");
    -[MXCore _startListenClientXPC](v3, "_startListenClientXPC");
    if (!-[MXCore _canSetupXpcListenerForSourceData](v3, "_canSetupXpcListenerForSourceData"))
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[MXCore clientUtil](v3, "clientUtil");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasAnyClient");

    if (v5)
    {
      iVarQueue = v3->_iVarQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __14__MXCore_init__block_invoke;
      block[3] = &unk_24E2F9CA8;
      v10 = v3;
      dispatch_async(iVarQueue, block);

    }
    -[MXCore _registerXpcActivityForCore](v3, "_registerXpcActivityForCore");
  }
  v7 = v3;
LABEL_8:

  return v7;
}

uint64_t __14__MXCore_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleDataActivity");
}

- (void)_initLogHandle
{
  OS_os_log *v3;
  OS_os_log *MXCoreLogHandle;
  os_log_t *p_MXCoreLogHandle;
  os_log_t v6;
  id *p_MXCoreXcodeSupportLogHandle;
  OS_os_log *MXCoreXcodeSupportLogHandle;
  NSObject *v9;
  uint8_t v10[16];

  v3 = (OS_os_log *)os_log_create("com.apple.metrickit.core", ");
  p_MXCoreLogHandle = (os_log_t *)&self->_MXCoreLogHandle;
  MXCoreLogHandle = self->_MXCoreLogHandle;
  self->_MXCoreLogHandle = v3;

  if (!self->_MXCoreLogHandle)
    objc_storeStrong((id *)&self->_MXCoreLogHandle, MEMORY[0x24BDACB70]);
  v6 = os_log_create("com.apple.metrickit.core.xcodesupport", ");
  MXCoreXcodeSupportLogHandle = self->_MXCoreXcodeSupportLogHandle;
  p_MXCoreXcodeSupportLogHandle = (id *)&self->_MXCoreXcodeSupportLogHandle;
  *p_MXCoreXcodeSupportLogHandle = v6;

  if (!*p_MXCoreXcodeSupportLogHandle)
    objc_storeStrong(p_MXCoreXcodeSupportLogHandle, MEMORY[0x24BDACB70]);
  v9 = *p_MXCoreLogHandle;
  if (os_log_type_enabled(*p_MXCoreLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21E837000, v9, OS_LOG_TYPE_DEFAULT, "Initializing MXCore\n", v10, 2u);
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
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickitd.requestqueue", v3);
  requestQueue = self->_requestQueue;
  self->_requestQueue = v4;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metrickitd.ivarqueue", v8);
  iVarQueue = self->_iVarQueue;
  self->_iVarQueue = v6;

}

- (void)_startListenClientXPC
{
  NSObject *iVarQueue;
  _QWORD block[5];

  iVarQueue = self->_iVarQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MXCore__startListenClientXPC__block_invoke;
  block[3] = &unk_24E2F9CA8;
  block[4] = self;
  dispatch_async(iVarQueue, block);
}

void __31__MXCore__startListenClientXPC__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "MXCoreLogHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__MXCore__startListenClientXPC__block_invoke_cold_2();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.metrickit.xpc"));
  objc_msgSend(*v1, "setXpcListener:", v3);

  objc_msgSend(*v1, "MXCoreLogHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__MXCore__startListenClientXPC__block_invoke_cold_1(v1, v4);

  v5 = *v1;
  objc_msgSend(*v1, "xpcListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_msgSend(*v1, "xpcListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)_initIvar
{
  void *v3;
  MXBundleUtilProtocol *v4;
  MXBundleUtilProtocol *bundleUtil;
  void *v6;
  MXDeliveryPathUtilProtocol *v7;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  void *v9;
  MXDeliveryDataCacherProtocol *v10;
  MXDeliveryDataCacherProtocol *deliveryDataCacher;
  void *v12;
  MXClientUtilProtocol *v13;
  MXClientUtilProtocol *clientUtil;
  void *v15;
  MXCleanUtil *v16;
  MXCleanUtil *cleanUtil;
  MXCoreHandler *v18;
  MXCoreHandler *handler;
  id v20;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleUtil");
  v4 = (MXBundleUtilProtocol *)objc_claimAutoreleasedReturnValue();
  bundleUtil = self->_bundleUtil;
  self->_bundleUtil = v4;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deliveryPathUtil");
  v7 = (MXDeliveryPathUtilProtocol *)objc_claimAutoreleasedReturnValue();
  deliveryPathUtil = self->_deliveryPathUtil;
  self->_deliveryPathUtil = v7;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deliveryDataCacher");
  v10 = (MXDeliveryDataCacherProtocol *)objc_claimAutoreleasedReturnValue();
  deliveryDataCacher = self->_deliveryDataCacher;
  self->_deliveryDataCacher = v10;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientUtil");
  v13 = (MXClientUtilProtocol *)objc_claimAutoreleasedReturnValue();
  clientUtil = self->_clientUtil;
  self->_clientUtil = v13;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cleanUtil");
  v16 = (MXCleanUtil *)objc_claimAutoreleasedReturnValue();
  cleanUtil = self->_cleanUtil;
  self->_cleanUtil = v16;

  +[MXDependencyFactory shared](MXDependencyFactory, "shared");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handlerForMXCoreWithDelegate:", self);
  v18 = (MXCoreHandler *)objc_claimAutoreleasedReturnValue();
  handler = self->_handler;
  self->_handler = v18;

}

- (void)_registerXpcActivityForCore
{
  xpc_activity_register("com.apple.metrickitd.setup", (xpc_object_t)*MEMORY[0x24BDAC5A0], &__block_literal_global);
}

void __38__MXCore__setupHandlersForConnection___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "MXCoreLogHandle");
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

- (void)_registerClientAndTeam
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21E837000, v0, v1, "Bundle %@ is not codesigned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t __32__MXCore__registerClientAndTeam__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 40), "handler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerClientAndTeamForBundleID:andTeamID:", *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));

    return objc_msgSend(*(id *)(v1 + 32), "invalidate");
  }
  return result;
}

- (id)_getDailyActivityCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC598], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC5B0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC648], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6E8], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5D0], *MEMORY[0x24BDAC628]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC608]);
  return v2;
}

- (void)_performDataActivity
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[MXCore MXCoreLogHandle](self, "MXCoreLogHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "com.apple.metrickitd.data";
    _os_log_impl(&dword_21E837000, v3, OS_LOG_TYPE_DEFAULT, "%s running\n", (uint8_t *)&v4, 0xCu);
  }

  -[MXCoreHandler performDataActivity](self->_handler, "performDataActivity");
}

- (void)metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MXCore iVarQueue](self, "iVarQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke;
  block[3] = &unk_24E2F9CD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "MXCoreLogHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "saveMetricPayloadsToDeliveryDirectoryAndReportSuccessForClientMetrics:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cleanStaleData");
}

- (void)clientIsNotAvailable
{
  xpc_activity_unregister("com.apple.metrickitd.data");
}

- (void)clientDidRegisterForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registrationProcessed");

  -[MXCore MXCoreLogHandle](self, "MXCoreLogHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21E837000, v7, OS_LOG_TYPE_DEFAULT, "New client: %@\n", (uint8_t *)&v8, 0xCu);
  }

}

- (BOOL)isAppExtension:(id)a3
{
  return -[MXBundleUtilProtocol isAppExtensionFromBundleID:](self->_bundleUtil, "isAppExtensionFromBundleID:", a3);
}

- (id)_getDummyPayloadForClient:(id)a3 dateString:(id)a4
{
  return +[MXCorePayloadConstructor buildDummyPayloadForClient:withDateString:](MXCorePayloadConstructor, "buildDummyPayloadForClient:withDateString:", a3, a4);
}

- (id)_getDummyDiagnosticPayloadForClient:(id)a3 dateString:(id)a4
{
  return +[MXCorePayloadConstructor buildDummyDiagnosticPayloadForClient:withDateString:](MXCorePayloadConstructor, "buildDummyDiagnosticPayloadForClient:withDateString:", a3, a4);
}

- (void)_deliverDummyPayloadForXcodeClient:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MXDeliveryPathUtilProtocol *deliveryPathUtil;
  char v13;
  id v14;
  MXDeliveryDataCacherProtocol *deliveryDataCacher;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  MXDeliveryPathUtilProtocol *v21;
  int v22;
  id v23;
  NSObject *iVarQueue;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  MXCore *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v4 = a3;
  v5 = -[MXClientUtilProtocol hasClientForBundleID:](self->_clientUtil, "hasClientForBundleID:", v4);
  -[MXCore MXCoreXcodeSupportLogHandle](self, "MXCoreXcodeSupportLogHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
      -[MXCore _deliverDummyPayloadForXcodeClient:].cold.3();

    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSObject setLocale:](v6, "setLocale:", v8);
    -[NSObject setDateFormat:](v6, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringFromDate:](v6, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MXDeliveryPathUtilProtocol applicationContainerPathForBundleID:](self->_deliveryPathUtil, "applicationContainerPathForBundleID:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      deliveryPathUtil = self->_deliveryPathUtil;
      v35 = 0;
      v13 = -[MXDeliveryPathUtilProtocol createMetricDirectoryAtPath:forClient:withError:](deliveryPathUtil, "createMetricDirectoryAtPath:forClient:withError:", v11, v4, &v35);
      v14 = v35;
      if ((v13 & 1) == 0)
      {
        -[MXCore MXCoreXcodeSupportLogHandle](self, "MXCoreXcodeSupportLogHandle");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[MXCore _deliverDummyPayloadForXcodeClient:].cold.2();

        goto LABEL_22;
      }
      deliveryDataCacher = self->_deliveryDataCacher;
      -[MXCore _getDummyPayloadForClient:dateString:](self, "_getDummyPayloadForClient:dateString:", v4, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v14;
      v17 = -[MXDeliveryDataCacherProtocol writeMetricReport:atAppContainerPath:forClient:withError:](deliveryDataCacher, "writeMetricReport:atAppContainerPath:forClient:withError:", v16, v11, v4, &v34);
      v18 = v34;

      if ((v17 & 1) == 0)
      {
        -[MXCore MXCoreXcodeSupportLogHandle](self, "MXCoreXcodeSupportLogHandle");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MXCore _deliverDummyPayloadForXcodeClient:].cold.1();

      }
      -[MXCore _getDummyDiagnosticPayloadForClient:dateString:](self, "_getDummyDiagnosticPayloadForClient:dateString:", v4, v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = self->_deliveryPathUtil;
        v33 = v18;
        v22 = -[MXDeliveryPathUtilProtocol createDiagnosticDirectoryAtPath:forClient:withError:](v21, "createDiagnosticDirectoryAtPath:forClient:withError:", v11, v4, &v33);
        v23 = v33;

        if (v22)
        {
          v32 = v23;
          -[MXCore _writeDiagnosticReport:atAppContainerPath:forClient:withError:](self, "_writeDiagnosticReport:atAppContainerPath:forClient:withError:", v20, v11, v4, &v32);
          v18 = v32;

        }
        else
        {
          v18 = v23;
        }
      }

    }
    else
    {
      iVarQueue = self->_iVarQueue;
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __45__MXCore__deliverDummyPayloadForXcodeClient___block_invoke;
      v29 = &unk_24E2F9CD0;
      v30 = self;
      v31 = v4;
      dispatch_async(iVarQueue, &v26);

    }
    -[MXDeliveryDataCacherProtocol notifyDataAvailableForDelivery](self->_deliveryDataCacher, "notifyDataAvailableForDelivery", v26, v27, v28, v29, v30);
LABEL_22:

    goto LABEL_23;
  }
  if (v7)
    -[MXCore _deliverDummyPayloadForXcodeClient:].cold.4();
LABEL_23:

}

void __45__MXCore__deliverDummyPayloadForXcodeClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientUtil");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeClientFromPersistenceForBundleID:", *(_QWORD *)(a1 + 40));

}

- (void)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[MXSource sharedSource](MXSource, "sharedSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "writeDiagnosticReport:atAppContainerPath:forClient:withError:", v12, v11, v10, a6);

  if ((v14 & 1) == 0)
  {
    -[MXCore MXCoreXcodeSupportLogHandle](self, "MXCoreXcodeSupportLogHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MXCore _writeDiagnosticReport:atAppContainerPath:forClient:withError:].cold.1();

  }
}

- (void)setMXCoreLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)MXCoreXcodeSupportLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMXCoreXcodeSupportLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setBundleUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MXDeliveryDataCacherProtocol)deliveryDataCacher
{
  return (MXDeliveryDataCacherProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeliveryDataCacher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MXCleanUtil)cleanUtil
{
  return (MXCleanUtil *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCleanUtil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MXClientUtilProtocol)clientUtil
{
  return self->_clientUtil;
}

- (void)setClientUtil:(id)a3
{
  objc_storeStrong((id *)&self->_clientUtil, a3);
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

- (NSString)currentDataActivityDate
{
  return self->_currentDataActivityDate;
}

- (void)setCurrentDataActivityDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataActivityDate, a3);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_currentDataActivityDate, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);
  objc_storeStrong((id *)&self->_cleanUtil, 0);
  objc_storeStrong((id *)&self->_deliveryDataCacher, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_MXCoreXcodeSupportLogHandle, 0);
  objc_storeStrong((id *)&self->_MXCoreLogHandle, 0);
}

void __31__MXCore__startListenClientXPC__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a2, v4, "XPC Listener: %@", v5);

  OUTLINED_FUNCTION_4_2();
}

void __31__MXCore__startListenClientXPC__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Initializing XPC Listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_canSetupXpcListenerForSourceData
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a2, a3, "MXSource: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __92__MXCore_metricIsAvailableFromSourceDirectoryForSavingToDeliveryDirectoryWithClientMetrics___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Starting payload delivery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Dummy metric payload delivery: Failed to write metric report for %@ with error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Dummy payload delivery: Failed to create file directory for %@ with error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Starting xcode dummy payload delivery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deliverDummyPayloadForXcodeClient:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v0, v1, "Client %@ not found, ending dummy payload delivery", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Dummy diagnostic payload delivery: Failed to write diagnostic report for %@ with error: %@");
  OUTLINED_FUNCTION_5();
}

@end
