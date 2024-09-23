@implementation CKLogicalDeviceScopedDaemonProxy

+ (NSXPCInterface)CKXPCDaemonToClientLogicalDeviceScopedInterface
{
  if (qword_1ECD96EA0 != -1)
    dispatch_once(&qword_1ECD96EA0, &unk_1E1F656D8);
  return (NSXPCInterface *)(id)qword_1ECD96E98;
}

+ (NSXPCInterface)CKXPCClientToDaemonLogicalDeviceScopedInterface
{
  if (qword_1ECD96E90 != -1)
    dispatch_once(&qword_1ECD96E90, &unk_1E1F656B8);
  return (NSXPCInterface *)(id)qword_1ECD96E88;
}

- (CKLogicalDeviceScopedDaemonProxy)initWithDeviceContext:(id)a3
{
  id v4;
  CKLogicalDeviceScopedDaemonProxy *v5;
  CKLogicalDeviceScopedDaemonProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKLogicalDeviceScopedDaemonProxy;
  v5 = -[CKLogicalDeviceScopedDaemonProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_deviceContext, v4);

  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectionInterruptedObserver(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v10, (uint64_t)v9, v11);

  v12.receiver = self;
  v12.super_class = (Class)CKLogicalDeviceScopedDaemonProxy;
  -[CKLogicalDeviceScopedDaemonProxy dealloc](&v12, sel_dealloc);
}

- (CKXPCConnection)connection
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_deviceContext(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKXPCConnection *)v8;
}

- (void)clearAllClouddThrottles
{
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, a2, 1, (uint64_t)&unk_1E1F58958, &unk_1E1F655B8);
}

- (void)allClouddThrottlesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_18A7C02D4;
  v10[4] = sub_18A7C02E4;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A7C02F0;
  v7[3] = &unk_1E1F65608;
  v9 = v10;
  v5 = v4;
  v8 = v5;
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v6, 1, (uint64_t)&unk_1E1F59638, v7);

  _Block_object_dispose(v10, 8);
}

- (void)addClouddThrottle:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A7C0410;
  v7[3] = &unk_1E1F65630;
  v8 = v4;
  v5 = v4;
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v6, 1, (uint64_t)&unk_1E1F598F8, v7);

}

- (void)postClouddWalrusUpdateNotification
{
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, a2, 1, (uint64_t)&unk_1E1F65650, &unk_1E1F65670);
}

- (void)_getLogicalDeviceScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A7C04F0;
  v13[3] = &unk_1E1F60850;
  v16 = v6;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend__getLogicalDeviceScopedDaemonProxyCreatorSynchronous_completionHandler_(self, v12, v6, (uint64_t)v13);

}

- (void)_getLogicalDeviceScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  CKLogicalDeviceScopedDaemonProxy *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  CKLogicalDeviceScopedDaemonProxy *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  _QWORD v45[5];
  void (**v46)(id, void *, _QWORD);
  _QWORD v47[4];
  id v48;
  id location;

  v4 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_connectionInterruptedObserver(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_initWeak(&location, v7);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connection(v7, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_18A7C07EC;
    v47[3] = &unk_1E1F60878;
    objc_copyWeak(&v48, &location);
    objc_msgSend_addObserverForName_object_queue_usingBlock_(v15, v20, (uint64_t)CFSTR("CKXPCConnectionInterrupted"), (uint64_t)v19, 0, v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConnectionInterruptedObserver_(v7, v22, (uint64_t)v21, v23);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v7);

  v24 = v7;
  objc_sync_enter(v24);
  if (objc_msgSend_hasValidLogicalDeviceScopedDaemonProxyCreator(v24, v25, v26, v27))
  {
    objc_msgSend_logicalDeviceScopedDaemonProxyCreator(v24, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  objc_sync_exit(v24);

  if (v31)
  {
    v6[2](v6, v31, 0);
  }
  else
  {
    objc_msgSend_connection(v24, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(v24, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReferenceProtocol(v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_18A7C08D8;
    v45[3] = &unk_1E1F65698;
    v45[4] = v24;
    v46 = v6;
    objc_msgSend_getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol_synchronous_completionHandler_(v35, v44, (uint64_t)v43, v4, v45);

  }
}

- (CKXPCLogicalDeviceScopedDaemon)logicalDeviceScopedDaemonProxyCreator
{
  return self->_logicalDeviceScopedDaemonProxyCreator;
}

- (void)setLogicalDeviceScopedDaemonProxyCreator:(id)a3
{
  objc_storeStrong((id *)&self->_logicalDeviceScopedDaemonProxyCreator, a3);
}

- (BOOL)hasValidLogicalDeviceScopedDaemonProxyCreator
{
  return self->_hasValidLogicalDeviceScopedDaemonProxyCreator;
}

- (void)setHasValidLogicalDeviceScopedDaemonProxyCreator:(BOOL)a3
{
  self->_hasValidLogicalDeviceScopedDaemonProxyCreator = a3;
}

- (NSObject)connectionInterruptedObserver
{
  return self->_connectionInterruptedObserver;
}

- (void)setConnectionInterruptedObserver:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, a3);
}

- (CKLogicalDeviceContext)deviceContext
{
  return (CKLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedDaemonProxyCreator, 0);
}

@end
