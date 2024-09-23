@implementation CKLogicalDeviceContext

- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol
{
  return self->_testDeviceReferenceProtocol;
}

+ (id)defaultContext
{
  if (qword_1ECD96ED8 != -1)
    dispatch_once(&qword_1ECD96ED8, &unk_1E1F589B8);
  return (id)qword_1ECD96EE0;
}

- (CKThrottleManager)throttleManager
{
  CKLogicalDeviceContext *v2;
  CKThrottleManager *throttleManager;
  CKThrottleManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t inited;
  CKThrottleManager *v9;
  CKThrottleManager *v10;

  v2 = self;
  objc_sync_enter(v2);
  throttleManager = v2->_throttleManager;
  if (!throttleManager)
  {
    v4 = [CKThrottleManager alloc];
    inited = objc_msgSend_initInternal(v4, v5, v6, v7);
    v9 = v2->_throttleManager;
    v2->_throttleManager = (CKThrottleManager *)inited;

    throttleManager = v2->_throttleManager;
  }
  v10 = throttleManager;
  objc_sync_exit(v2);

  return v10;
}

- (id)_initWithTestDeviceReferenceProtocol:(id)a3 useLiveServer:(BOOL)a4
{
  id v7;
  CKLogicalDeviceContext *v8;
  CKLogicalDeviceContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKLogicalDeviceContext;
  v8 = -[CKLogicalDeviceContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_testDeviceReferenceProtocol, a3);
    v9->_useLiveServer = a4;
  }

  return v9;
}

+ (id)deviceContextForTestDeviceReferenceProtocol:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  CKLogicalDeviceContext *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v43;
  const char *v44;

  v8 = a3;
  if (v8 && __sTestOverridesAvailable)
  {
    v9 = sub_18A70E43C();
    objc_msgSend_sharedManager(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverReferenceProtocol(v8, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_existingServerProtocolForReferenceProtocol_(v13, v18, (uint64_t)v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22, v23);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)a1, CFSTR("CKLogicalDeviceContext.m"), 50, CFSTR("Unexpectedly nil test server from reference %@"), v8);

    }
    v24 = a1;
    objc_sync_enter(v24);
    objc_msgSend_deviceID(v8, v25, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = CFSTR("NO_DEVICE_ID");
    if (v28)
      v30 = (__CFString *)v28;
    v31 = v30;

    objc_msgSend_testDeviceContextForDeviceID_(v20, v32, (uint64_t)v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v35 = [CKLogicalDeviceContext alloc];
      v39 = objc_msgSend_useLiveServer(v20, v36, v37, v38);
      v34 = (void *)objc_msgSend__initWithTestDeviceReferenceProtocol_useLiveServer_(v35, v40, (uint64_t)v8, v39);
      objc_msgSend_setTestDeviceContext_forDeviceID_(v20, v41, (uint64_t)v34, (uint64_t)v31);
    }

    objc_sync_exit(v24);
  }
  else
  {
    objc_msgSend_defaultContext(CKLogicalDeviceContext, v5, v6, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

- (CKXPCConnection)connection
{
  uint64_t v2;
  uint64_t v3;

  return (CKXPCConnection *)objc_msgSend_sharedXPCConnection(CKXPCConnection, a2, v2, v3);
}

- (CKLogicalDeviceScopedDaemonProxy)deviceScopedDaemonProxy
{
  CKLogicalDeviceContext *v2;
  CKLogicalDeviceScopedDaemonProxy *deviceScopedDaemonProxy;
  CKLogicalDeviceScopedDaemonProxy *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKLogicalDeviceScopedDaemonProxy *v8;
  CKLogicalDeviceScopedDaemonProxy *v9;

  v2 = self;
  objc_sync_enter(v2);
  deviceScopedDaemonProxy = v2->_deviceScopedDaemonProxy;
  if (!deviceScopedDaemonProxy)
  {
    v4 = [CKLogicalDeviceScopedDaemonProxy alloc];
    v7 = objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2, v6);
    v8 = v2->_deviceScopedDaemonProxy;
    v2->_deviceScopedDaemonProxy = (CKLogicalDeviceScopedDaemonProxy *)v7;

    deviceScopedDaemonProxy = v2->_deviceScopedDaemonProxy;
  }
  v9 = deviceScopedDaemonProxy;
  objc_sync_exit(v2);

  return v9;
}

- (CKLogicalDeviceScopedStateManager)deviceScopedStateManager
{
  CKLogicalDeviceContext *v2;
  CKLogicalDeviceScopedStateManager *deviceScopedStateManager;
  CKLogicalDeviceScopedStateManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKLogicalDeviceScopedStateManager *v8;
  CKLogicalDeviceScopedStateManager *v9;

  v2 = self;
  objc_sync_enter(v2);
  deviceScopedStateManager = v2->_deviceScopedStateManager;
  if (!deviceScopedStateManager)
  {
    v4 = [CKLogicalDeviceScopedStateManager alloc];
    v7 = objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2, v6);
    v8 = v2->_deviceScopedStateManager;
    v2->_deviceScopedStateManager = (CKLogicalDeviceScopedStateManager *)v7;

    deviceScopedStateManager = v2->_deviceScopedStateManager;
  }
  v9 = deviceScopedStateManager;
  objc_sync_exit(v2);

  return v9;
}

- (CKTestDeviceProtocol)testDeviceProtocol
{
  CKLogicalDeviceContext *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKTestDeviceProtocol *v6;
  CKTestDeviceProtocol *testDeviceProtocol;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  CKTestDeviceProtocol *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!__sTestOverridesAvailable)
  {
    v6 = 0;
    return v6;
  }
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_testDeviceReferenceProtocol(v2, v3, v4, v5);
  v6 = (CKTestDeviceProtocol *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    testDeviceProtocol = v2->_testDeviceProtocol;
    if (!testDeviceProtocol)
    {
      v8 = sub_18A70E43C();
      objc_msgSend_sharedManager(v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReferenceProtocol(v2, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serverReferenceProtocol(v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_existingServerProtocolForReferenceProtocol_(v12, v21, (uint64_t)v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v41 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_testDeviceReferenceProtocol(v2, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v45;
          _os_log_error_impl(&dword_18A5C5000, v41, OS_LOG_TYPE_ERROR, "Unexpectedly nil test server from reference %@", buf, 0xCu);

        }
        v6 = 0;
        goto LABEL_13;
      }
      objc_msgSend_testDeviceReferenceProtocol(v2, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceID(v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend_deviceProtocolWithDeviceID_error_(v23, v32, (uint64_t)v31, (uint64_t)&v47);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v47;
      v35 = v2->_testDeviceProtocol;
      v2->_testDeviceProtocol = (CKTestDeviceProtocol *)v33;

      if (!v2->_testDeviceProtocol)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v36 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_testDeviceReferenceProtocol(v2, v37, v38, v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v46;
          v50 = 2112;
          v51 = v34;
          _os_log_error_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_ERROR, "Unexpectedly nil test device from reference %@: %@", buf, 0x16u);

        }
      }

      testDeviceProtocol = v2->_testDeviceProtocol;
    }
    v6 = testDeviceProtocol;
  }
LABEL_13:
  objc_sync_exit(v2);

  return v6;
}

- (int64_t)pushBehavior
{
  CKLogicalDeviceContext *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_testDeviceProtocol(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v6)
    v11 = objc_msgSend_logicalDeviceContextPushBehavior(v6, v7, v8, v9);
  else
    v11 = 1;

  objc_sync_exit(v2);
  return v11;
}

- (id)deviceScopedPushTopic:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v4 = a3;
  v8 = objc_msgSend_pushBehavior(self, v5, v6, v7);
  objc_msgSend_testDeviceReferenceProtocol(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReferenceProtocol(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverReferenceProtocol(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDirectory(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  CKPushTopicForPushBehavior(v8, v4, v16, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (BOOL)useLiveServer
{
  return self->_useLiveServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceReferenceProtocol, 0);
  objc_storeStrong((id *)&self->_testDeviceProtocol, 0);
  objc_storeStrong((id *)&self->_throttleManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStateManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedDaemonProxy, 0);
}

@end
