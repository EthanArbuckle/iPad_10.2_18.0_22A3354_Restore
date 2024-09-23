@implementation CKDXPCConnection

- (void)noteClientProcessScopedMetadata:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t isClientMainBundleAppleExecutable;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char isLikelyEqual;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  id v32;
  _QWORD block[5];
  id v34;

  v4 = a3;
  v7 = objc_msgSend_clientSDKVersion(v4, v5, v6);
  objc_msgSend_processScopedClientProxy(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientSDKVersion_(v10, v11, v7);

  isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v4, v12, v13);
  objc_msgSend_processScopedClientProxy(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsClientMainBundleAppleExecutable_(v17, v18, isClientMainBundleAppleExecutable);

  v19 = (void *)objc_opt_new();
  objc_msgSend_frameworkFingerprint(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isLikelyEqual = objc_msgSend_isLikelyEqual_(v22, v23, (uint64_t)v19);

  if ((isLikelyEqual & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_frameworkFingerprint(v4, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v27, v29, (uint64_t)CFSTR("Client and daemon processes have different versions of CloudKit.framework in memory: <%@> vs. <%@>"), v28, v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    CKGetGlobalQueue();
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEB8157C;
    block[3] = &unk_1E782EE20;
    block[4] = self;
    v34 = v30;
    v32 = v30;
    dispatch_async(v31, block);

    CKHandleSignificantIssueBehavior();
  }

}

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  CKDXPCConnection *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isSuspended;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  _QWORD block[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_systemAvailableQueue(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isSuspended = objc_msgSend_isSuspended(v7, v8, v9);

  if (isSuspended && objc_msgSend_canRunGivenAvailabilityState_(v4, v11, a3))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_processScopedClientProxy(v4, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_procName(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Connection from client %{public}@ is now active", buf, 0xCu);

    }
    objc_msgSend_systemAvailableQueue(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSuspended_(v22, v23, 0);

    objc_msgSend_processScopedClientProxy(v4, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend_systemAvailableQueue(v4, v11, v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_isSuspended(v27, v28, v29);

  objc_sync_exit(v4);
  if (v26)
  {
    dispatch_get_global_queue(17, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE9C35B8;
    block[3] = &unk_1E782EA40;
    v34 = v26;
    dispatch_async(v31, block);

  }
  return v30;
}

- (NSOperationQueue)systemAvailableQueue
{
  return self->_systemAvailableQueue;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (CKDProcessScopedClientProxy)processScopedClientProxy
{
  return self->_processScopedClientProxy;
}

- (NSHashTable)sharedContainers
{
  return self->_sharedContainers;
}

- (id)logicalDeviceScopedClientProxyForDeviceContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  CKDXPCConnection *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  CKDLogicalDeviceScopedClientProxy *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_testDeviceReference(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v10;
  v14 = CFSTR("NO_DEVICE_ID");
  if (v10)
    v14 = (const __CFString *)v10;
  v38[0] = v14;
  objc_msgSend_testDeviceReference(v4, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverReferenceProtocol(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDirectory(v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v21, (uint64_t)CFSTR("/dev/null"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[1] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v38, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)

  v25 = self;
  objc_sync_enter(v25);
  objc_msgSend_logicalDeviceScopedClientProxiesByDeviceReference(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v31 = [CKDLogicalDeviceScopedClientProxy alloc];
    v30 = (void *)objc_msgSend_initWithClientConnection_deviceContext_(v31, v32, (uint64_t)v25, v4);
    objc_msgSend_logicalDeviceScopedClientProxiesByDeviceReference(v25, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v35, v36, (uint64_t)v30, v24);

  }
  objc_sync_exit(v25);

  return v30;
}

- (NSMutableDictionary)logicalDeviceScopedClientProxiesByDeviceReference
{
  return self->_logicalDeviceScopedClientProxiesByDeviceReference;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  objc_msgSend_processScopedClientProxy(self, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_procName(v11, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v10, (uint64_t)CFSTR("client"), v9, 0);

}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKDXPCConnection *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (CKDXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  CKDXPCConnection *v6;
  CKDXPCConnection *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSDate *connectionDate;
  CKDProcessScopedClientProxy *v12;
  const char *v13;
  uint64_t v14;
  CKDProcessScopedClientProxy *processScopedClientProxy;
  uint64_t v16;
  NSMutableDictionary *logicalDeviceScopedClientProxiesByDeviceReference;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSHashTable *sharedContainers;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSHashTable *containerProxies;
  uint64_t v26;
  NSOperationQueue *systemAvailableQueue;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKDXPCConnection;
  v6 = -[CKDXPCConnection init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    objc_msgSend_now(MEMORY[0x1E0C99D68], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    connectionDate = v7->_connectionDate;
    v7->_connectionDate = (NSDate *)v10;

    v12 = [CKDProcessScopedClientProxy alloc];
    v14 = objc_msgSend_initWithClientConnection_(v12, v13, (uint64_t)v7);
    processScopedClientProxy = v7->_processScopedClientProxy;
    v7->_processScopedClientProxy = (CKDProcessScopedClientProxy *)v14;

    v16 = objc_opt_new();
    logicalDeviceScopedClientProxiesByDeviceReference = v7->_logicalDeviceScopedClientProxiesByDeviceReference;
    v7->_logicalDeviceScopedClientProxiesByDeviceReference = (NSMutableDictionary *)v16;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    sharedContainers = v7->_sharedContainers;
    v7->_sharedContainers = (NSHashTable *)v20;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    containerProxies = v7->_containerProxies;
    v7->_containerProxies = (NSHashTable *)v24;

    v26 = objc_opt_new();
    systemAvailableQueue = v7->_systemAvailableQueue;
    v7->_systemAvailableQueue = (NSOperationQueue *)v26;

    objc_msgSend_setSuspended_(v7->_systemAvailableQueue, v28, 1);
    objc_msgSend_setMaxConcurrentOperationCount_(v7->_systemAvailableQueue, v29, 1);
    objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerWatcher_(v32, v33, (uint64_t)v7);

  }
  return v7;
}

- (void)getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB81988;
  aBlock[3] = &unk_1E7835A30;
  v8 = v6;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  sub_1BE9CAD00(self, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = sub_1BE9C1170;
  v13[3] = &unk_1E7835A58;
  v14 = v8;
  v11 = v8;
  objc_msgSend_getProcessScopedClientProxyCreatorWithCompletionHandler_(v10, v12, (uint64_t)v13);

}

- (void)getContainerScopedDaemonProxyCreatorForSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend_systemAvailableQueue(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BE9A0B5C;
  v18[3] = &unk_1E7830C88;
  objc_copyWeak(&v22, &location);
  v14 = v8;
  v19 = v14;
  v15 = v9;
  v20 = v15;
  v16 = v10;
  v21 = v16;
  objc_msgSend_addOperationWithBlock_(v13, v17, (uint64_t)v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3
{
  char v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char hasAllowAccessDuringBuddyEntitlement;
  BOOL result;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0
    || (objc_msgSend_processScopedClientProxy(self, a2, a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_clientEntitlements(v5, v6, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v8, v9, v10),
        v8,
        v5,
        (hasAllowAccessDuringBuddyEntitlement & 1) != 0))
  {
    result = 1;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952B0];
    v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v23)
    {
      v24 = v22;
      objc_msgSend_processScopedClientProxy(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_procName(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@ not active. Device is not past buddy and it lacks the entitlement to bypass.", (uint8_t *)&v31, 0xCu);

      result = 0;
    }
  }
  if ((v3 & 2) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v14)
    {
      v15 = v13;
      objc_msgSend_processScopedClientProxy(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_procName(v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v21;
      _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@ not active yet because device hasn't been unlocked since boot.", (uint8_t *)&v31, 0xCu);

      return 0;
    }
  }
  return result;
}

- (void)invalidate
{
  const char *v3;
  const char *v4;
  uint64_t v5;

  objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, a2, 4, &unk_1E7835998);
  objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, v3, 4, &unk_1E78359B8);
  objc_msgSend_invalidate(self->_processScopedClientProxy, v4, v5);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setSuspended_(self->_systemAvailableQueue, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKDXPCConnection;
  -[CKDXPCConnection dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDXPCConnection *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (void)enumerateContainersUsingBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char *v9;

  v5 = (const char *)a3;
  v9 = (char *)v5;
  if (v5)
  {
    objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, v5, 0, v5);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDXPCConnection.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, 0, 0, 0);
  }

}

- (void)enumerateContainersWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v9 = a4;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDXPCConnection.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if ((a3 & 4) != 0)
  {
    objc_msgSend_sharedContainers(self, v7, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v19);
    objc_msgSend_sharedContainers(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v22, v23, v24);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v19);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1BEB80764;
    v32[3] = &unk_1E78359E0;
    v16 = &v33;
    v33 = v9;
    v25 = v9;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v29, v26, a3, v32);
  }
  else
  {
    objc_msgSend_containerProxies(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v10);
    objc_msgSend_containerProxies(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v13, v14, v15);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v10);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1BEB80774;
    v30[3] = &unk_1E7835A08;
    v16 = &v31;
    v31 = v9;
    v17 = v9;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v29, v18, a3, v30);
  }

}

- (id)containerProxyFromSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 outError:(id *)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  CKDApplicationID *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  char v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  char hasSystemLaunchDaemonEntitlement;
  const char *v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  dispatch_once_t *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  const char *v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  NSObject *v135;
  NSObject *v136;
  const char *v137;
  uint32_t v138;
  const char *v139;
  NSObject *v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  void *v146;
  const char *v147;
  char v148;
  uint64_t v149;
  id v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  CKDAppContainerTuple *v157;
  void *v158;
  const char *v159;
  void *v160;
  CKDContainerProxy *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  NSObject *v173;
  const char *v174;
  id v175;
  NSObject *v176;
  const char *v177;
  NSObject *v178;
  const char *v179;
  const char *v180;
  void *v182;
  id obj;
  id v184;
  void *v185;
  void *v187;
  void *v189;
  void *v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  uint8_t buf[4];
  CKDXPCConnection *v196;
  __int16 v197;
  void *v198;
  _BYTE v199[128];
  uint64_t v200;

  v200 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v184 = a4;
  v189 = v6;
  objc_msgSend_containerID(v6, v7, v8);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientEntitlements(v11, v12, v13);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_containerOptions(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fakeEntitlements(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_count(v19, v20, v21);

  if (!v22)
  {
LABEL_8:
    objc_msgSend_applicationBundleID(v190, v23, v24);
    goto LABEL_9;
  }
  if (!objc_msgSend_hasAllowFakeEntitlementsEntitlement(v190, v23, v24))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v196 = self;
      _os_log_error_impl(&dword_1BE990000, v35, OS_LOG_TYPE_ERROR, "Client Proxy \"%@\" is not entitled to use fake entitlements.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  objc_msgSend_containerOptions(v189, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fakeEntitlements(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlementsByAddingOverlay_(v190, v31, (uint64_t)v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v190 = v32;
  objc_msgSend_applicationBundleID(v32, v33, v34);
LABEL_9:
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v39 = [CKDApplicationID alloc];
    objc_msgSend_applicationBundleID(v190, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerOptions(v189, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerOptions(v189, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerOptions(v189, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerOptions(v189, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = (void *)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v39, v67, (uint64_t)v42, v48, v54, v60, v66);

  }
  else
  {
    v187 = 0;
  }
  objc_msgSend_processScopedClientProxy(self, v37, v38);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_clientSDKVersion(v68, v69, v70);
  v73 = objc_msgSend_validateEntitlementsWithSDKVersion_error_(v190, v72, v71, a5);

  if ((v73 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v87 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v196 = self;
      _os_log_error_impl(&dword_1BE990000, v87, OS_LOG_TYPE_ERROR, "Connection %@ has invalid client entitlements.", buf, 0xCu);
    }
    goto LABEL_25;
  }
  objc_msgSend_currentProcess(CKDDaemonProcess, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_processType(v76, v77, v78) == 1)
  {
    hasSystemLaunchDaemonEntitlement = objc_msgSend_hasSystemLaunchDaemonEntitlement(v190, v79, v80);

    if ((hasSystemLaunchDaemonEntitlement & 1) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v84 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v196 = self;
        _os_log_error_impl(&dword_1BE990000, v84, OS_LOG_TYPE_ERROR, "Connection %@ is not allowed to use the system cloudd.", buf, 0xCu);
      }
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v85, *MEMORY[0x1E0C947D8], 8, CFSTR("Connection %@ is not allowed to use the system cloudd."), self);
        v86 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      }
LABEL_25:
      v86 = 0;
      goto LABEL_97;
    }
  }
  else
  {

  }
  objc_msgSend_accountOverrideInfo(v189, v82, v83);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0C95280] && v182 && (objc_msgSend_hasCustomAccountsEntitlement(v190, v88, v89) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v173 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v196 = self;
      _os_log_error_impl(&dword_1BE990000, v173, OS_LOG_TYPE_ERROR, "The application on the other end of %@ is trying to use a custom account but it doesn't have the right entitlement. Denying connection.", buf, 0xCu);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v174, *MEMORY[0x1E0C947D8], 8, CFSTR("Connection %@ is not allowed to set custom account info"), self);
      v175 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:
      v86 = 0;
      *a5 = v175;
      goto LABEL_96;
    }
LABEL_93:
    v86 = 0;
    goto LABEL_96;
  }
  if (objc_msgSend_hasMasqueradingEntitlement(v190, v88, v89))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v92 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v196 = self;
      _os_log_impl(&dword_1BE990000, v92, OS_LOG_TYPE_INFO, "Giving %@ blanket access to any container", buf, 0xCu);
    }
    goto LABEL_63;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v90, v91);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v187, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v187, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v95, v102, (uint64_t)v101);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v187, v99, v100);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v187, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v95, v107, (uint64_t)v106);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v187, v104, v105);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v187, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v95, v112, (uint64_t)v111);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(v187, v109, v110);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(v187, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v95, v117, (uint64_t)v116);

  }
  objc_msgSend_clientPrefixEntitlement(v190, v114, v115);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  obj = v95;
  v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v119, (uint64_t)&v191, v199, 16);
  if (!v122)
    goto LABEL_62;
  v123 = *(_QWORD *)v192;
  v124 = *MEMORY[0x1E0C946B0];
  v125 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  while (2)
  {
    v126 = 0;
    do
    {
      if (*(_QWORD *)v192 != v123)
        objc_enumerationMutation(obj);
      v127 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v126);
      v128 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_applicationBundleID(v190, v120, v121);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v128, v130, v124, CFSTR("%@"), 0, v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_isEqualToString_(v131, v132, (uint64_t)v127))
      {
        if (*v125 != -1)
          dispatch_once(v125, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v135 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v196 = self;
          v136 = v135;
          v137 = "Giving %@ access to container because it's a data repair proxy";
          v138 = 12;
LABEL_59:
          _os_log_impl(&dword_1BE990000, v136, OS_LOG_TYPE_INFO, v137, buf, v138);
          goto LABEL_60;
        }
        goto LABEL_60;
      }
      if (!objc_msgSend_length(v118, v133, v134))
      {
        if (*v125 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v178 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
          goto LABEL_90;
        *(_DWORD *)buf = 138412546;
        v196 = self;
        v197 = 2114;
        v198 = v127;
        v179 = "Connection \"%@\" specified bundle identifier override '%{public}@', but it has no prefix entitlement";
        goto LABEL_99;
      }
      if (!objc_msgSend_hasPrefix_(v127, v139, (uint64_t)v118))
      {
        if (*v125 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v178 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
          goto LABEL_90;
        *(_DWORD *)buf = 138412546;
        v196 = self;
        v197 = 2114;
        v198 = v127;
        v179 = "Connection \"%@\" specified bundle identifier override '%{public}@', but it didn't match the prefix";
LABEL_99:
        _os_log_fault_impl(&dword_1BE990000, v178, OS_LOG_TYPE_FAULT, v179, buf, 0x16u);
LABEL_90:

        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v180, *MEMORY[0x1E0C947D8], 8, CFSTR("Connection %@ is not allowed to set its application bundle identifier without the %@ entitlement"), self, *MEMORY[0x1E0C95318]);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_93;
      }
      if (*v125 != -1)
        dispatch_once(v125, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v140 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v196 = self;
        v197 = 2114;
        v198 = v127;
        v136 = v140;
        v137 = "Allowing %@ to override bundle identifier '%{public}@' due to matching prefix";
        v138 = 22;
        goto LABEL_59;
      }
LABEL_60:

      ++v126;
    }
    while (v122 != v126);
    v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v120, (uint64_t)&v191, v199, 16);
    if (v122)
      continue;
    break;
  }
LABEL_62:

LABEL_63:
  objc_msgSend_cloudServices(v190, v93, v94);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v141, v142, *MEMORY[0x1E0C95340]))
  {

    goto LABEL_66;
  }
  objc_msgSend_cloudServices(v190, v143, v144);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend_containsObject_(v146, v147, *MEMORY[0x1E0C95338]);

  if ((v148 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v176 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v196 = self;
      _os_log_error_impl(&dword_1BE990000, v176, OS_LOG_TYPE_ERROR, "Connection %@ is not entitled to use CloudKit", buf, 0xCu);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v177, *MEMORY[0x1E0C947D8], 8, CFSTR("Connection %@ is not entitled to use CloudKit"), self);
      v175 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_82;
    }
    goto LABEL_93;
  }
LABEL_66:
  v149 = objc_msgSend_containerEnvironmentForContainerID_entitlements_(MEMORY[0x1E0C94C28], v145, (uint64_t)v185, v190);
  v150 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_containerIdentifier(v185, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v150, v154, (uint64_t)v153, v149);

  if (v187)
  {
    v157 = [CKDAppContainerTuple alloc];
    CKCurrentPersonaID();
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v157, v159, (uint64_t)v187, v155, v158);

    v161 = [CKDContainerProxy alloc];
    objc_msgSend_containerOptions(v189, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend_initWithAppContainerTuple_entitlements_options_distantContainer_connection_(v161, v165, (uint64_t)v160, v190, v164, v184, self);

    objc_msgSend_containerProxies(self, v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v168);
    objc_msgSend_containerProxies(self, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v171, v172, (uint64_t)v86);

    objc_sync_exit(v168);
  }
  else if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v156, *MEMORY[0x1E0C947D8], 8, CFSTR("Trying to initialize a container without an application ID"));
    v86 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
  }

LABEL_96:
LABEL_97:

  return v86;
}

- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_systemAvailableQueue(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEB81678;
  v14[3] = &unk_1E782F4D0;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);

}

- (void)getProcessScopedDaemonProxyCreatorWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_systemAvailableQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEB81770;
  v10[3] = &unk_1E782EC68;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)getDaemonTestServerManagerProxyCreatorWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_processType(v7, v8, v9);

  if (v10 == 2)
  {
    objc_msgSend_systemAvailableQueue(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1BEB818C8;
    v15[3] = &unk_1E782EFD8;
    v16 = v4;
    objc_msgSend_addOperationWithBlock_(v13, v14, (uint64_t)v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReference:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB81AA0;
  aBlock[3] = &unk_1E7835A30;
  v10 = v8;
  v19 = v10;
  v11 = a3;
  v12 = _Block_copy(aBlock);
  sub_1BE9CAD00(self, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1BEB81AB4;
  v16[3] = &unk_1E7835A80;
  v17 = v10;
  v14 = v10;
  objc_msgSend_getLogicalDeviceScopedClientProxyCreatorForTestDeviceReferenceProtocol_completionHandler_(v13, v15, (uint64_t)v11, v16);

}

- (id)CKStatusReportArray
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_connectionDate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("\n connected since: %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  objc_msgSend_addObject_(v3, v11, (uint64_t)CFSTR("------ Containers -------"));
  objc_msgSend_containerProxies(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend_containerProxies(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_CKStatusReportArray(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v23), v19, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  objc_sync_exit(v14);
  return v3;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (void)setProcessScopedClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_processScopedClientProxy, a3);
}

- (void)setLogicalDeviceScopedClientProxiesByDeviceReference:(id)a3
{
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxiesByDeviceReference, a3);
}

- (NSHashTable)containerProxies
{
  return self->_containerProxies;
}

- (void)setSystemAvailableQueue:(id)a3
{
  objc_storeStrong((id *)&self->_systemAvailableQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAvailableQueue, 0);
  objc_storeStrong((id *)&self->_containerProxies, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxiesByDeviceReference, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_processScopedClientProxy, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
