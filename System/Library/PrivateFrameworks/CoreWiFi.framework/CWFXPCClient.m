@implementation CWFXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_mutableEventAckMap, 0);
  objc_storeStrong((id *)&self->_mutableEventCallbackMap, 0);
  objc_storeStrong((id *)&self->_mutableActivityMap, 0);
  objc_storeStrong((id *)&self->_mutableEventIDMap, 0);
  objc_storeStrong((id *)&self->_mutex, 0);
}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
  id v6;
  id v7;
  NSObject *mutex;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B062418C;
  block[3] = &unk_1E6133710;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(mutex, block);

}

- (BOOL)startMonitoringEvent:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *mutex;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  CWFXPCClient *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAE0;
  v35 = sub_1B063EA38;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self, v10, 169, v11, v12) & 1) != 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06E4328;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v30, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = sub_1B063EC2C;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v17, v18, (uint64_t)v8, (uint64_t)v9, (uint64_t)v29);

    mutex = self->_mutex;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = sub_1B06227C0;
    block[3] = &unk_1E6133340;
    v26 = v8;
    v27 = self;
    v28 = v9;
    dispatch_sync(mutex, block);

    v20 = v26;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v32[5];
    v32[5] = v24;
  }

  v21 = (void *)v32[5];
  if (a5 && v21)
  {
    *a5 = objc_retainAutorelease(v21);
    v21 = (void *)v32[5];
  }
  v22 = v21 == 0;
  _Block_object_dispose(&v31, 8);

  return v22;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 remoteXPCProxyConnection:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceType_endpoint_remoteXPCProxyConnection_, a3, 0, a4);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4 remoteXPCProxyConnection:(id)a5
{
  id v8;
  id v9;
  CWFXPCClient *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *mutex;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *targetQueue;
  NSMutableDictionary *v45;
  NSMutableDictionary *mutableEventIDMap;
  NSMutableDictionary *v47;
  NSMutableDictionary *mutableEventCallbackMap;
  NSMutableDictionary *v49;
  NSMutableDictionary *mutableEventAckMap;
  NSMutableDictionary *v51;
  NSMutableDictionary *mutableActivityMap;
  CWFXPCProxyConnection *v53;
  void *v54;
  CWFXPCClient *remoteXPCProxyConnection;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSXPCConnection *XPCConnection;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSXPCConnection *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  CWFXPCClient *v79;
  uint64_t v80;
  CWFXPCClient *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSXPCConnection *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  CWFXPCClient *v94;
  CWFXPCClient *v95;
  _QWORD v96[4];
  CWFXPCClient *v97;
  objc_super v98;

  v8 = a4;
  v9 = a5;
  v98.receiver = self;
  v98.super_class = (Class)CWFXPCClient;
  v10 = -[CWFXPCClient init](&v98, sel_init);
  v15 = v10;
  v16 = 0;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9 || !v10)
    goto LABEL_20;
  v10->_serviceType = a3;
  v17 = (void *)MEMORY[0x1E0CB3940];
  sub_1B0634D44(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("com.apple.corewifi.client-mutex.%@"), v20, v21, v18);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25, v26);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = dispatch_queue_create(v27, v28);
  mutex = v15->_mutex;
  v15->_mutex = (OS_dispatch_queue *)v29;

  if (!v15->_mutex)
    goto LABEL_19;
  v31 = (void *)MEMORY[0x1E0CB3940];
  sub_1B0634D44(v15->_serviceType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v31, v33, (uint64_t)CFSTR("com.apple.corewifi.client-event.%@"), v34, v35, v32);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v41 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39, v40);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = dispatch_queue_create(v41, v42);
  targetQueue = v15->_targetQueue;
  v15->_targetQueue = (OS_dispatch_queue *)v43;

  if (!v15->_targetQueue)
    goto LABEL_19;
  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableEventIDMap = v15->_mutableEventIDMap;
  v15->_mutableEventIDMap = v45;

  if (!v15->_mutableEventIDMap)
    goto LABEL_19;
  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableEventCallbackMap = v15->_mutableEventCallbackMap;
  v15->_mutableEventCallbackMap = v47;

  if (!v15->_mutableEventCallbackMap)
    goto LABEL_19;
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableEventAckMap = v15->_mutableEventAckMap;
  v15->_mutableEventAckMap = v49;

  if (!v15->_mutableEventAckMap
    || (v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]),
        mutableActivityMap = v15->_mutableActivityMap,
        v15->_mutableActivityMap = v51,
        mutableActivityMap,
        !v15->_mutableActivityMap))
  {
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  if (!v9)
  {
    if (v8)
    {
      v56 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v60 = objc_msgSend_initWithListenerEndpoint_(v56, v57, (uint64_t)v8, v58, v59);
      XPCConnection = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v60;

      v16 = 0;
    }
    else
    {
      sub_1B0634D44(v15->_serviceType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_20;
      v62 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v65 = objc_msgSend_initWithMachServiceName_options_(v62, v63, (uint64_t)v16, 4096, v64);
      v66 = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v65;

    }
    if (v15->_XPCConnection)
    {
      sub_1B063B0B4(v15->_serviceType, 0, v12, v13, v14);
      v67 = objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        v54 = (void *)v67;
        objc_msgSend_setRemoteObjectInterface_(v15->_XPCConnection, v11, v67, v13, v14);
        sub_1B062DC4C(v15->_serviceType, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExportedInterface_(v15->_XPCConnection, v73, (uint64_t)v72, v74, v75);

        objc_msgSend_setExportedObject_(v15->_XPCConnection, v76, (uint64_t)v15, v77, v78);
        v79 = v15;
        v80 = MEMORY[0x1E0C809B0];
        v96[0] = MEMORY[0x1E0C809B0];
        v96[1] = 3221225472;
        v96[2] = sub_1B06E314C;
        v96[3] = &unk_1E6133138;
        v81 = v79;
        v97 = v81;
        objc_msgSend_setInterruptionHandler_(v15->_XPCConnection, v82, (uint64_t)v96, v83, v84);
        v93[0] = v80;
        v93[1] = 3221225472;
        v93[2] = sub_1B06E3688;
        v93[3] = &unk_1E61333E0;
        v94 = v81;
        v95 = v94;
        v85 = v15->_XPCConnection;
        remoteXPCProxyConnection = v94;
        objc_msgSend_setInvalidationHandler_(v85, v86, (uint64_t)v93, v87, v88);

        v15 = remoteXPCProxyConnection;
        goto LABEL_18;
      }
    }
LABEL_20:
    objc_msgSend_invalidate(v15->_XPCConnection, v11, v12, v13, v14);
    objc_msgSend_setInvalidated_(v15, v90, 1, v91, v92);
    v54 = 0;
    remoteXPCProxyConnection = v15;
    v15 = 0;
    goto LABEL_18;
  }
  v53 = (CWFXPCProxyConnection *)v9;
  v54 = 0;
  v16 = 0;
  remoteXPCProxyConnection = (CWFXPCClient *)v15->_remoteXPCProxyConnection;
  v15->_remoteXPCProxyConnection = v53;
LABEL_18:

  return v15;
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3
{
  uint64_t v3;

  return (CWFXPCClient *)objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(self, a2, a3, 0, v3);
}

- (void)receivedXPCEvent:(id)a3
{
  id v4;
  CWFEvent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  CWFEvent *v43;
  _QWORD v44[5];
  CWFEvent *v45;

  v4 = a3;
  v5 = objc_alloc_init(CWFEvent);
  v10 = objc_msgSend_type(v4, v6, v7, v8, v9);
  objc_msgSend_interfaceName(v4, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v16, v10, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v5, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_timestamp(v4, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v5, v27, (uint64_t)v26, v28, v29);

  objc_msgSend_info(v4, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setInfo_(v5, v35, (uint64_t)v34, v36, v37);
  objc_msgSend_targetQueue(self, v38, v39, v40, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_1B06E4C98;
  v44[3] = &unk_1E61333E0;
  v44[4] = self;
  v45 = v5;
  v43 = v5;
  dispatch_async(v42, v44);

}

- (void)__receivedEvent:(id)a3
{
  id v4;
  NSObject *mutex;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  CWFXPCClient *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B06E46BC;
  v34 = sub_1B06E46E4;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  mutex = self->_mutex;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_1B062C438;
  v21 = &unk_1E6135488;
  v6 = v4;
  v22 = v6;
  v23 = self;
  v24 = &v26;
  v25 = &v30;
  dispatch_sync(mutex, &v18);
  if (*((_BYTE *)v27 + 24))
  {
    v11 = v31[5];
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
    else
    {
      objc_msgSend_acknowledge(v6, v7, v8, v9, v10, v18, v19, v20, v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend_acknowledge(v6, v13, v14, v15, v16);
        v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v17[2]();

      }
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

- (void)resume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_resume(self->_XPCConnection, a2, v2, v3, v4);
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)invalidate
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *mutex;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSXPCConnection *XPCConnection;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CWFXPCClient *obj;
  _QWORD v32[5];
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  if ((objc_msgSend_invalidated(obj, v2, v3, v4, v5) & 1) != 0)
  {
    objc_sync_exit(obj);

  }
  else
  {
    objc_msgSend_setInvalidated_(obj, v6, 1, v7, v8);
    objc_sync_exit(obj);

    v9 = MEMORY[0x1E0C809B0];
    mutex = obj->_mutex;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B063EFBC;
    block[3] = &unk_1E6133138;
    block[4] = obj;
    dispatch_sync(mutex, block);
    objc_msgSend_setInterruptionHandler_(obj, v11, 0, v12, v13);
    XPCConnection = obj->_XPCConnection;
    if (XPCConnection)
    {
      objc_msgSend_invalidate(XPCConnection, (const char *)obj, v14, v15, v16);
    }
    else
    {
      objc_msgSend_remoteXPCProxyConnection(obj, (const char *)obj, v14, v15, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invalidate(v22, v23, v24, v25, v26);

    }
    objc_msgSend_targetQueue(obj, v18, v19, v20, v21);
    v27 = objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = sub_1B06E3950;
    v32[3] = &unk_1E6133138;
    v32[4] = obj;
    dispatch_async(v27, v32);

    objc_msgSend_setInvalidationHandler_(obj, v28, 0, v29, v30);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  id v7;
  objc_super v8;

  if ((objc_msgSend_invalidated(self, a2, v2, v3, v4) & 1) == 0)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("'invalidate' must be called before dealloc"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)CWFXPCClient;
  -[CWFXPCClient dealloc](&v8, sel_dealloc);
}

- (CWFXPCClient)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFXPCClient init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceType_endpoint_remoteXPCProxyConnection_, a3, a4, 0);
}

- (void)suspend
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_suspend(self->_XPCConnection, a2, v2, v3, v4);
}

- (void)__beginActivity:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 171, v12, v13))
  {
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06E3B3C;
    v27[3] = &unk_1E6134940;
    v16 = v10;
    v28 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v27, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = sub_1B06E3B50;
    v23[3] = &unk_1E6135440;
    v23[4] = self;
    v24 = v8;
    v25 = v9;
    v26 = v16;
    objc_msgSend_beginActivity_requestParams_reply_(v20, v21, (uint64_t)v24, (uint64_t)v25, (uint64_t)v23);

  }
  else if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 45, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v22);

  }
}

- (BOOL)beginActivity:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *mutex;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  CWFXPCClient *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAE0;
  v35 = sub_1B063EA38;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self, v10, 171, v11, v12) & 1) != 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06E3E2C;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v30, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = sub_1B06E3E3C;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_beginActivity_requestParams_reply_(v17, v18, (uint64_t)v8, (uint64_t)v9, (uint64_t)v29);

    mutex = self->_mutex;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = sub_1B06E3E4C;
    block[3] = &unk_1E6133340;
    v26 = v8;
    v27 = self;
    v28 = v9;
    dispatch_sync(mutex, block);

    v20 = v26;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v32[5];
    v32[5] = v24;
  }

  v21 = (void *)v32[5];
  if (a5 && v21)
  {
    *a5 = objc_retainAutorelease(v21);
    v21 = (void *)v32[5];
  }
  v22 = v21 == 0;
  _Block_object_dispose(&v31, 8);

  return v22;
}

- (void)endActivity:(id)a3 requestParameters:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *mutex;
  id v21;
  _QWORD block[4];
  id v23;
  CWFXPCClient *v24;

  v21 = a3;
  v6 = a4;
  if (objc_msgSend_allowRequestType_(self, v7, 172, v8, v9))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)&unk_1E6132840, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v21, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endActivityWithUUID_requestParams_reply_(v13, v19, (uint64_t)v18, (uint64_t)v6, (uint64_t)&unk_1E6131A60);

    mutex = self->_mutex;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06E3F80;
    block[3] = &unk_1E61333E0;
    v23 = v21;
    v24 = self;
    dispatch_sync(mutex, block);

  }
}

- (void)endAllActivities:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *mutex;
  id v14;
  _QWORD block[5];

  v14 = a3;
  if (objc_msgSend_allowRequestType_(self, v4, 172, v5, v6))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)&unk_1E6132100, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endAllActivitiesWithRequestParams_reply_(v10, v11, (uint64_t)v14, (uint64_t)&unk_1E6131AC0, v12);

    mutex = self->_mutex;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06E4070;
    block[3] = &unk_1E6133138;
    block[4] = self;
    dispatch_sync(mutex, block);
  }

}

- (void)__startMonitoringEvent:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 169, v12, v13))
  {
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06E422C;
    v27[3] = &unk_1E6134940;
    v16 = v10;
    v28 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v27, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = sub_1B06E4240;
    v23[3] = &unk_1E6135440;
    v23[4] = self;
    v24 = v8;
    v25 = v9;
    v26 = v16;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v20, v21, (uint64_t)v24, (uint64_t)v25, (uint64_t)v23);

  }
  else if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 45, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v22);

  }
}

- (void)stopMonitoringEvent:(id)a3 requestParameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_allowRequestType_(self, v8, 170, v9, v10))
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)&unk_1E6135460, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B06E4404;
    v16[3] = &unk_1E61333B8;
    v16[4] = self;
    v17 = v6;
    objc_msgSend_stopMonitoringEvent_requestParams_reply_(v14, v15, (uint64_t)v17, (uint64_t)v7, (uint64_t)v16);

  }
}

- (void)stopMonitoringAllEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[5];

  v4 = a3;
  if (objc_msgSend_allowRequestType_(self, v5, 170, v6, v7))
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)&unk_1E6131B40, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B06E455C;
    v14[3] = &unk_1E61344A8;
    v14[4] = self;
    objc_msgSend_stopMonitoringAllEventsWithRequestParams_reply_(v11, v12, (uint64_t)v4, (uint64_t)v14, v13);

  }
}

- (id)eventHandlerWithEventID:(id)a3
{
  id v4;
  NSObject *mutex;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;
  CWFXPCClient *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B06E46BC;
  v17 = sub_1B06E46E4;
  v18 = 0;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E46EC;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutex, block);
  v7 = (void *)MEMORY[0x1B5E0A4F8](v14[5]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)clearAllEventHandlers
{
  NSObject *mutex;
  _QWORD block[5];

  mutex = self->_mutex;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E4798;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutex, block);
}

- (CWFXPCProxyConnection)localXPCProxyConnection
{
  CWFXPCProxyConnection *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];

  v3 = [CWFXPCProxyConnection alloc];
  v7 = (void *)objc_msgSend_initWithForwardingTarget_(v3, v4, (uint64_t)self, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B06E4844;
  v12[3] = &unk_1E6133138;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (BOOL)allowRequestType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
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
  int v20;
  CWFXPCClient *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v7 = objc_msgSend_serviceType(self, a2, a3, v3, v4);
  sub_1B0639CE4(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_containsObject_(v12, v17, (uint64_t)v16, v18, v19);

  if (v20)
  {
    v21 = self;
    objc_sync_enter(v21);
    objc_msgSend_remoteObjectInterface(v21->_XPCConnection, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0640CC4(a3, v26);

    objc_sync_exit(v21);
  }
  return v20;
}

- (id)remoteObjectProxy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxy(v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_remoteObjectProxy(self->_XPCConnection, v6, v7, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)__acknowledgeEventWithUUID:(id)a3
{
  id v4;
  NSObject *mutex;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1B06E46BC;
  v15 = sub_1B06E46E4;
  v16 = 0;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E4C3C;
  block[3] = &unk_1E6133698;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_sync(mutex, block);
  v7 = v12[5];
  if (v7)
    (*(void (**)(void))(v7 + 16))();

  _Block_object_dispose(&v11, 8);
}

- (void)receivedAcknowledgedXPCEvent:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  CWFEvent *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *mutex;
  id v56;
  id v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  dispatch_time_t v67;
  NSObject *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  CWFEvent *v75;
  _QWORD v76[5];
  CWFEvent *v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD block[5];
  id v83;
  id v84;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CWFEvent);
  v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
  objc_msgSend_interfaceName(v7, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v19, v13, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v8, v22, (uint64_t)v21, v23, v24);

  objc_msgSend_timestamp(v7, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v8, v30, (uint64_t)v29, v31, v32);

  v37 = objc_msgSend_acknowledgementTimeout(v7, v33, v34, v35, v36);
  objc_msgSend_setAcknowledgementTimeout_(v8, v38, v37, v39, v40);
  objc_msgSend_info(v7, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setInfo_(v8, v46, (uint64_t)v45, v47, v48);
  objc_msgSend_UUID(v8, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = MEMORY[0x1E0C809B0];
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E4F3C;
  block[3] = &unk_1E6133710;
  block[4] = self;
  v56 = v53;
  v83 = v56;
  v84 = v6;
  v57 = v6;
  dispatch_async(mutex, block);
  v80[0] = v54;
  v80[1] = 3221225472;
  v80[2] = sub_1B06E4F8C;
  v80[3] = &unk_1E61333E0;
  v80[4] = self;
  v58 = v56;
  v81 = v58;
  objc_msgSend_setAcknowledge_(v8, v59, (uint64_t)v80, v60, v61);
  v66 = objc_msgSend_acknowledgementTimeout(v8, v62, v63, v64, v65);
  v67 = dispatch_time(0, v66);
  v68 = self->_mutex;
  v78[0] = v54;
  v78[1] = 3221225472;
  v78[2] = sub_1B06E4F98;
  v78[3] = &unk_1E61333E0;
  v78[4] = self;
  v79 = v58;
  v69 = v58;
  dispatch_after(v67, v68, v78);
  objc_msgSend_targetQueue(self, v70, v71, v72, v73);
  v74 = objc_claimAutoreleasedReturnValue();
  v76[0] = v54;
  v76[1] = 3221225472;
  v76[2] = sub_1B06E4FD0;
  v76[3] = &unk_1E61333E0;
  v76[4] = self;
  v77 = v8;
  v75 = v8;
  dispatch_async(v74, v76);

}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTargetQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, a3);
}

@end
