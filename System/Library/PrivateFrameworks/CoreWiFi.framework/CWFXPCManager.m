@implementation CWFXPCManager

- (void)XPCRequestProxy:(id)a3 invalidatedXPCConnection:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_XPCManager_invalidatedXPCConnection_(v9, v10, (uint64_t)self, (uint64_t)v12, v11);

}

- (void)XPCRequestProxy:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  NSObject *mutexQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B062BF38;
  block[3] = &unk_1E6133B18;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(mutexQueue, block);

}

- (id)registeredEventIDs
{
  id v3;
  NSObject *mutexQueue;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CWFXPCManager *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  mutexQueue = self->_mutexQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1B0638794;
  v15 = &unk_1E61333E0;
  v16 = self;
  v17 = v3;
  v5 = v3;
  dispatch_sync(mutexQueue, &v12);
  v10 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9, v12, v13, v14, v15, v16);

  return v10;
}

- (id)registeredActivities
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *mutexQueue;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CWFXPCManager *v19;
  id v20;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = self->_mutexQueue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1B06398AC;
  v18 = &unk_1E61333E0;
  v19 = self;
  v20 = v6;
  v8 = v6;
  dispatch_sync(mutexQueue, &v15);
  v13 = (void *)objc_msgSend_copy(v8, v9, v10, v11, v12, v15, v16, v17, v18, v19);

  return v13;
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5
{
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;

  v51 = a4;
  v7 = a5;
  objc_msgSend_XPCManager_XPCConnection_updatedRegisteredEventIDs_(self->_XPCRequestProxy, v8, (uint64_t)self, (uint64_t)v51, (uint64_t)v7);
  if ((objc_msgSend_isLocal(v51, v9, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend___updateProcessMonitorConfiguration(self, v13, v14, v15, v16);
    if (objc_msgSend_count(v7, v17, v18, v19, v20))
    {
      if (objc_msgSend_count(v7, v21, v22, v23, v24) == 1 && objc_opt_class())
      {
        v29 = (void *)MEMORY[0x1E0D87D70];
        objc_msgSend_XPCConnection(v51, v25, v26, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_processIdentifier(v30, v31, v32, v33, v34);
        objc_msgSend_identifierWithPid_(v29, v36, v35, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_handleForIdentifier_error_(MEMORY[0x1E0D87D68], v40, (uint64_t)v39, 0, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_currentState(v42, v43, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProcessState_(v51, v48, (uint64_t)v47, v49, v50);

      }
    }
    else
    {
      objc_msgSend_setProcessState_(v51, v21, 0, v23, v24);
    }
  }

}

- (void)__updateProcessMonitorConfiguration
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0638ACC;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  objc_msgSend_XPCManager_XPCConnection_receivedXPCRequest_(self->_XPCRequestProxy, a2, (uint64_t)self, (uint64_t)a4, (uint64_t)a5);
}

- (CWFXPCManagerDelegate)delegate
{
  return (CWFXPCManagerDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)XPCListener:(id)a3 invalidatedXPCConnection:(id)a4
{
  uint64_t v4;

  objc_msgSend_XPCManager_invalidatedXPCConnection_(self->_XPCRequestProxy, a2, (uint64_t)self, (uint64_t)a4, v4);
}

- (CWFXPCManager)initWithServiceTypes:(id)a3
{
  id v4;
  CWFXPCManager *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *mutexQueue;
  NSMutableArray *v9;
  NSMutableArray *mutableXPCListeners;
  CWFXPCRequestProxy *v11;
  CWFXPCRequestProxy *XPCRequestProxy;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  RBSProcessMonitor *processMonitor;
  NSMutableSet *v19;
  NSMutableSet *processMonitorPIDs;
  NSObject *p_super;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CWFXPCListener *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  id v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int16 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CWFXPCManager;
  v5 = -[CWFXPCManager init](&v54, sel_init);
  if (v5)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      CWFGetOSLog();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        CWFGetOSLog();
        p_super = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        p_super = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v53 = 0;
        _os_log_send_and_compose_impl();
      }
LABEL_24:

LABEL_25:
      p_super = &v5->super;
      v5 = 0;
      goto LABEL_26;
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.corewifi.XPC-manager-mutex", v6);
    mutexQueue = v5->_mutexQueue;
    v5->_mutexQueue = (OS_dispatch_queue *)v7;

    if (!v5->_mutexQueue)
      goto LABEL_25;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableXPCListeners = v5->_mutableXPCListeners;
    v5->_mutableXPCListeners = v9;

    if (!v5->_mutableXPCListeners)
      goto LABEL_25;
    v11 = objc_alloc_init(CWFXPCRequestProxy);
    XPCRequestProxy = v5->_XPCRequestProxy;
    v5->_XPCRequestProxy = v11;

    if (!v5->_XPCRequestProxy)
      goto LABEL_25;
    if (objc_opt_class())
    {
      objc_msgSend_monitor(MEMORY[0x1E0D87D90], v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      processMonitor = v5->_processMonitor;
      v5->_processMonitor = (RBSProcessMonitor *)v17;

      if (!v5->_processMonitor)
        goto LABEL_25;
      v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      processMonitorPIDs = v5->_processMonitorPIDs;
      v5->_processMonitorPIDs = v19;

      if (!v5->_processMonitorPIDs)
        goto LABEL_25;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    p_super = v4;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(p_super, v22, (uint64_t)&v49, (uint64_t)v55, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v50;
LABEL_11:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(p_super);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v26);
        v28 = [CWFXPCListener alloc];
        v33 = objc_msgSend_integerValue(v27, v29, v30, v31, v32);
        v37 = (void *)objc_msgSend_initWithServiceType_(v28, v34, v33, v35, v36);
        if (!v37)
          goto LABEL_24;
        v41 = v37;
        objc_msgSend_setDelegate_(v37, v38, (uint64_t)v5, v39, v40);
        objc_msgSend_addObject_(v5->_mutableXPCListeners, v42, (uint64_t)v41, v43, v44);

        if (v24 == ++v26)
        {
          v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(p_super, v45, (uint64_t)&v49, (uint64_t)v55, 16);
          if (v24)
            goto LABEL_11;
          break;
        }
      }
    }
  }
  else
  {
    p_super = 0;
  }
LABEL_26:

  return v5;
}

- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5
{
  MEMORY[0x1E0DE7D20](self->_XPCRequestProxy, sel_setTargetQueue_requestType_interfaceName_, a3, a4, a5);
}

- (CWFXPCManager)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFXPCManager init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_XPCRequestProxy, sel_XPCManager_sendXPCEvent_reply_, self, a3, a4);
}

- (void)resume
{
  uint64_t v2;
  uint64_t v3;
  NSObject *mutexQueue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];

  objc_msgSend_setDelegate_(self->_XPCRequestProxy, a2, (uint64_t)self, v2, v3);
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0674ECC;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  objc_msgSend_startEventMonitoring(self->_XPCRequestProxy, v6, v7, v8, v9);
}

- (void)suspend
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0675024;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)invalidate
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B067517C;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)localXPCClientWithServiceType:(int64_t)a3
{
  NSObject *mutexQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1B063EA70;
  v11 = sub_1B063EA00;
  v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B067538C;
  block[3] = &unk_1E6133AA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)endpointWithServiceType:(int64_t)a3
{
  NSObject *mutexQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1B063EA70;
  v11 = sub_1B063EA00;
  v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0675580;
  block[3] = &unk_1E6133AA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CWFPrivateMACManager)privateMACManager
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CWFPrivateMACManager *)objc_msgSend_privateMACManager(self->_XPCRequestProxy, a2, v2, v3, v4);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  objc_msgSend_XPCManager_XPCConnection_canceledXPCRequestsWithUUID_(self->_XPCRequestProxy, a2, (uint64_t)self, (uint64_t)a4, (uint64_t)a5);
}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (**v55)(_QWORD, _QWORD, _QWORD);
  const char *v56;
  void *v57;
  void *v58;

  v7 = a4;
  v8 = a5;
  objc_msgSend_delegate(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  objc_msgSend_supportedRequestTypes(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_type(v8, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_containsObject_(v18, v29, (uint64_t)v28, v30, v31);

  if (v32)
  {
    objc_msgSend_XPCManager_XPCConnection_receivedXPCRequest_(v13, v33, (uint64_t)self, (uint64_t)v7, (uint64_t)v8);
  }
  else
  {
LABEL_4:
    CWFGetOSLog();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      CWFGetOSLog();
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = MEMORY[0x1E0C81028];
      v36 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend_type(v8, v37, v38, v39, v40);
      sub_1B063544C(v41, v42, v43, v44, v45);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    objc_msgSend_response(v8, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend_response(v8, v51, v52, v53, v54);
      v55 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v56, *MEMORY[0x1E0CB2FE0], 45, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v55)[2](v55, v57, 0);

    }
  }

}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_XPCManager_XPCConnection_canceledXPCRequestsWithUUID_(v12, v13, (uint64_t)self, (uint64_t)v14, (uint64_t)v7);

}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)supportedRequestTypes
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSupportedRequestTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRequestTypes, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_processMonitorPIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_XPCRequestProxy, 0);
  objc_storeStrong((id *)&self->_mutableXPCListeners, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
