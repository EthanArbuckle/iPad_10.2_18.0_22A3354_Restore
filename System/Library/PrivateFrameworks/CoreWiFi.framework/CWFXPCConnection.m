@implementation CWFXPCConnection

- (id)valueForEntitlement:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EA60;
  v23 = sub_1B063E9F8;
  v24 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06660A8;
  block[3] = &unk_1E6133698;
  v18 = &v19;
  block[4] = self;
  v6 = v4;
  v17 = v6;
  dispatch_sync(mutexQueue, block);
  v7 = (void *)v20[5];
  objc_msgSend_null(MEMORY[0x1E0C99E38], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v12)
    v13 = 0;
  else
    v13 = (void *)v20[5];
  v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)startMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSString *bundleID;
  NSString *processName;
  id v31;
  NSString *codesignID;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *mutexQueue;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  int v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    sub_1B062BEE0(v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    v42 = v8;
    v31 = v10;
    codesignID = self->_codesignID;
    sub_1B0634D44(self->_serviceType);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    v47 = 138544898;
    v48 = v23;
    v49 = 1024;
    v50 = v28;
    v51 = 2114;
    v52 = processName;
    v53 = 2114;
    v54 = bundleID;
    v55 = 2114;
    v56 = codesignID;
    v10 = v31;
    v8 = v42;
    v57 = 2114;
    v58 = v33;
    v59 = 2114;
    v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B062B75C;
  block[3] = &unk_1E6133968;
  block[4] = self;
  v44 = v8;
  v45 = v9;
  v46 = v10;
  v39 = v10;
  v40 = v9;
  v41 = v8;
  dispatch_async(mutexQueue, block);

}

- (void)__addXPCGetRequestWithType:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B0638360;
  v11[3] = &unk_1E6133760;
  v12 = v8;
  v9 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v10, a3, 0, (uint64_t)a4, v11);

}

- (void)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v6;

  v6 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, a2, a3, (uint64_t)a4, (uint64_t)a5, 0, 0, a6);
}

- (id)remoteObjectProxy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *remoteXPCProxyConnection;

  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection)
    remoteXPCProxyConnection = self->_XPCConnection;
  objc_msgSend_remoteObjectProxy(remoteXPCProxyConnection, a2, v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setProcessState:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B062908C;
  v7[3] = &unk_1E61333E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mutexQueue, v7);

}

- (void)__didInvalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CWFXPCRequest *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  CWFXPCRequest *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  NSObject *mutexQueue;
  id obj;
  _QWORD block[5];
  _QWORD v84[6];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[6];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[2];
  _QWORD v95[2];
  _BYTE v96[128];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend_registeredEventIDs(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v90, (uint64_t)v99, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v91 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v13 = objc_alloc_init(CWFXPCRequest);
        v18 = objc_msgSend_type(v12, v14, v15, v16, v17);
        v19 = sub_1B062BA4C(v18);
        objc_msgSend_setType_(v13, v20, v19, v21, v22);
        v97[0] = CFSTR("EventID");
        v97[1] = CFSTR("Remove");
        v98[0] = v12;
        v98[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v98, (uint64_t)v97, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v13, v25, (uint64_t)v24, v26, v27);

        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = sub_1B063EE78;
        v89[3] = &unk_1E61336C0;
        v89[4] = self;
        v89[5] = v12;
        objc_msgSend_setResponse_(v13, v28, (uint64_t)v89, v29, v30);
        objc_msgSend_delegate(self, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_XPCConnection_receivedXPCRequest_(v35, v36, (uint64_t)self, (uint64_t)v13, v37);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v38, (uint64_t)&v90, (uint64_t)v99, 16);
    }
    while (v9);

    objc_msgSend_delegate(self, v39, v40, v41, v42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v6, v43, (uint64_t)self, 0, v44);
  }

  v88 = 0u;
  v86 = 0u;
  v87 = 0u;
  v85 = 0u;
  objc_msgSend_registeredActivities(self, v45, v46, v47, v48);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v85, (uint64_t)v96, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v86 != v52)
          objc_enumerationMutation(obj);
        v54 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        v55 = objc_alloc_init(CWFXPCRequest);
        v60 = objc_msgSend_type(v54, v56, v57, v58, v59);
        v61 = sub_1B06414AC(v60);
        objc_msgSend_setType_(v55, v62, v61, v63, v64);
        v94[0] = CFSTR("EventID");
        v94[1] = CFSTR("Remove");
        v95[0] = v54;
        v95[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)v95, (uint64_t)v94, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v55, v67, (uint64_t)v66, v68, v69);

        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = sub_1B06661F4;
        v84[3] = &unk_1E61336C0;
        v84[4] = self;
        v84[5] = v54;
        objc_msgSend_setResponse_(v55, v70, (uint64_t)v84, v71, v72);
        objc_msgSend_delegate(self, v73, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_XPCConnection_receivedXPCRequest_(v77, v78, (uint64_t)self, (uint64_t)v55, v79);

      }
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v80, (uint64_t)&v85, (uint64_t)v96, 16);
    }
    while (v51);
  }

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0625998;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (CWFXPCConnectionDelegate)delegate
{
  return (CWFXPCConnectionDelegate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)__allowAlreadyPendingRequest:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v20;
  BOOL v21;

  v3 = a3;
  if (objc_msgSend_type(v3, v4, v5, v6, v7) == 64)
  {
    objc_msgSend_info(v3, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("ScanParams"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend_acceptableCacheAge(v16, v17, v18, v19, v20) == -1;
  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)processName
{
  return self->_processName;
}

- (CWFXPCConnection)initWithServiceType:(int64_t)a3 XPCConnection:(id)a4 bootArgs:(id)a5
{
  id v9;
  id v10;
  CWFXPCConnection *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CWFXPCConnection *v16;
  void **p_XPCConnection;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString *processName;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSString *bundleID;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSXPCConnection *XPCConnection;
  uint64_t v58;
  NSString *codesignID;
  uint64_t v60;
  NSUUID *UUID;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSArray *bootArgs;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  NSObject *v77;
  dispatch_queue_t v78;
  OS_dispatch_queue *requestQueue;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  NSObject *v89;
  dispatch_queue_t v90;
  OS_dispatch_queue *replyQueue;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  NSObject *v101;
  dispatch_queue_t v102;
  OS_dispatch_queue *eventQueue;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  NSObject *v113;
  dispatch_queue_t v114;
  OS_dispatch_queue *ackQueue;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  NSObject *v125;
  dispatch_queue_t v126;
  OS_dispatch_queue *mutexQueue;
  NSMutableSet *v128;
  NSMutableSet *mutableEventIDs;
  NSMutableArray *v130;
  NSMutableArray *mutablePendingEventAcknowledgements;
  NSMutableDictionary *v132;
  NSMutableDictionary *mutablePendingRequestMap;
  NSMutableArray *v134;
  NSMutableArray *mutableActivities;
  NSMutableDictionary *v136;
  NSMutableDictionary *coalescedEvents;
  NSMutableDictionary *v138;
  NSMutableDictionary *entitlementsCache;
  _OWORD v141[2];
  _OWORD v142[4];
  _QWORD v143[4];
  id v144;
  _QWORD v145[4];
  id v146;
  id location;
  objc_super v148;

  v9 = a4;
  v10 = a5;
  v148.receiver = self;
  v148.super_class = (Class)CWFXPCConnection;
  v11 = -[CWFXPCConnection init](&v148, sel_init);
  v16 = v11;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9 || !v11)
    goto LABEL_31;
  v11->_serviceType = a3;
  if (v9)
  {
    p_XPCConnection = (void **)&v11->_XPCConnection;
    objc_storeStrong((id *)&v11->_XPCConnection, a4);
    objc_initWeak(&location, v16);
    v18 = MEMORY[0x1E0C809B0];
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = sub_1B0665CE8;
    v145[3] = &unk_1E6133670;
    objc_copyWeak(&v146, &location);
    objc_msgSend_setInterruptionHandler_(v16->_XPCConnection, v19, (uint64_t)v145, v20, v21);
    v143[0] = v18;
    v143[1] = 3221225472;
    v143[2] = sub_1B0665E88;
    v143[3] = &unk_1E6133670;
    objc_copyWeak(&v144, &location);
    objc_msgSend_setInvalidationHandler_(*p_XPCConnection, v22, (uint64_t)v143, v23, v24);
    objc_destroyWeak(&v144);
    objc_destroyWeak(&v146);
    objc_destroyWeak(&location);
    if (*p_XPCConnection)
      objc_msgSend_auditToken(*p_XPCConnection, v25, v26, v27, v28);
    else
      memset(&v142[2], 0, 32);
    sub_1B0643A64();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v40, v41, v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    processName = v16->_processName;
    v16->_processName = (NSString *)v45;

    if (!v16->_processName)
      goto LABEL_31;
    if (*p_XPCConnection)
      objc_msgSend_auditToken(*p_XPCConnection, v47, v48, v49, v50);
    else
      memset(v142, 0, 32);
    objc_msgSend___bundleIDFromAuditToken_(v16, v47, (uint64_t)v142, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    bundleID = v16->_bundleID;
    v16->_bundleID = (NSString *)v51;

    XPCConnection = v16->_XPCConnection;
    if (XPCConnection)
      objc_msgSend_auditToken(XPCConnection, v53, v54, v55, v56);
    else
      memset(v141, 0, sizeof(v141));
    objc_msgSend___codesignIDFromAuditToken_(v16, v53, (uint64_t)v141, v55, v56);
    v58 = objc_claimAutoreleasedReturnValue();
    codesignID = v16->_codesignID;
    v16->_codesignID = (NSString *)v58;

  }
  else
  {
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v12, v13, v14, v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v29, v30, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v16->_processName;
    v16->_processName = (NSString *)v34;

    if (!v16->_processName)
    {
LABEL_31:

      v16 = 0;
      goto LABEL_30;
    }
  }
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v36, v37, v38, v39);
  v60 = objc_claimAutoreleasedReturnValue();
  UUID = v16->_UUID;
  v16->_UUID = (NSUUID *)v60;

  if (!v16->_UUID)
    goto LABEL_31;
  v66 = objc_msgSend_copy(v10, v62, v63, v64, v65);
  bootArgs = v16->_bootArgs;
  v16->_bootArgs = (NSArray *)v66;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v68, (uint64_t)CFSTR("com.apple.corewifi.XPC-connection-request.%@"), v69, v70, v16->_processName);
  v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v76 = (const char *)objc_msgSend_UTF8String(v71, v72, v73, v74, v75);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v77 = objc_claimAutoreleasedReturnValue();
  v78 = dispatch_queue_create(v76, v77);
  requestQueue = v16->_requestQueue;
  v16->_requestQueue = (OS_dispatch_queue *)v78;

  if (!v16->_requestQueue)
    goto LABEL_31;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v80, (uint64_t)CFSTR("com.apple.corewifi.XPC-connection-reply.%@"), v81, v82, v16->_processName);
  v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v88 = (const char *)objc_msgSend_UTF8String(v83, v84, v85, v86, v87);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = dispatch_queue_create(v88, v89);
  replyQueue = v16->_replyQueue;
  v16->_replyQueue = (OS_dispatch_queue *)v90;

  if (!v16->_replyQueue)
    goto LABEL_31;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v92, (uint64_t)CFSTR("com.apple.corewifi.XPC-connection-event.%@"), v93, v94, v16->_processName);
  v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v100 = (const char *)objc_msgSend_UTF8String(v95, v96, v97, v98, v99);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v101 = objc_claimAutoreleasedReturnValue();
  v102 = dispatch_queue_create(v100, v101);
  eventQueue = v16->_eventQueue;
  v16->_eventQueue = (OS_dispatch_queue *)v102;

  if (!v16->_eventQueue)
    goto LABEL_31;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v104, (uint64_t)CFSTR("com.apple.corewifi.XPC-connection-ack.%@"), v105, v106, v16->_processName);
  v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v112 = (const char *)objc_msgSend_UTF8String(v107, v108, v109, v110, v111);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v113 = objc_claimAutoreleasedReturnValue();
  v114 = dispatch_queue_create(v112, v113);
  ackQueue = v16->_ackQueue;
  v16->_ackQueue = (OS_dispatch_queue *)v114;

  if (!v16->_ackQueue)
    goto LABEL_31;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v116, (uint64_t)CFSTR("com.apple.corewifi.XPC-connection-mutex.%@"), v117, v118, v16->_processName);
  v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v124 = (const char *)objc_msgSend_UTF8String(v119, v120, v121, v122, v123);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v125 = objc_claimAutoreleasedReturnValue();
  v126 = dispatch_queue_create(v124, v125);
  mutexQueue = v16->_mutexQueue;
  v16->_mutexQueue = (OS_dispatch_queue *)v126;

  if (!v16->_mutexQueue)
    goto LABEL_31;
  v128 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  mutableEventIDs = v16->_mutableEventIDs;
  v16->_mutableEventIDs = v128;

  if (!v16->_mutableEventIDs)
    goto LABEL_31;
  v130 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mutablePendingEventAcknowledgements = v16->_mutablePendingEventAcknowledgements;
  v16->_mutablePendingEventAcknowledgements = v130;

  if (!v16->_mutablePendingEventAcknowledgements)
    goto LABEL_31;
  v132 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutablePendingRequestMap = v16->_mutablePendingRequestMap;
  v16->_mutablePendingRequestMap = v132;

  if (!v16->_mutablePendingRequestMap)
    goto LABEL_31;
  v134 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mutableActivities = v16->_mutableActivities;
  v16->_mutableActivities = v134;

  if (!v16->_mutableActivities)
    goto LABEL_31;
  v136 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  coalescedEvents = v16->_coalescedEvents;
  v16->_coalescedEvents = v136;

  if (!v16->_coalescedEvents)
    goto LABEL_31;
  v138 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  entitlementsCache = v16->_entitlementsCache;
  v16->_entitlementsCache = v138;

  if (!v16->_entitlementsCache)
    goto LABEL_31;
  v16->_defaultTimeoutOverride = -1;
LABEL_30:

  return v16;
}

- (id)__bundleIDFromAuditToken:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  void (*v7)(__int128 *, _QWORD, id *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __CFString *v14;
  const __CFURL *v15;
  const __CFURL *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  void *Value;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  const char *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  if (!qword_1ECFD6A78)
  {
    v35 = xmmword_1E6133A50;
    *(_QWORD *)&v36 = 0;
    qword_1ECFD6A78 = _sl_dlopen();
  }
  if (!qword_1ECFD6A78)
    goto LABEL_8;
  v6 = *(_OWORD *)&a3->var0[4];
  v33 = *(_OWORD *)a3->var0;
  v34 = v6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v7 = (void (*)(__int128 *, _QWORD, id *))off_1ECFD6A80;
  v32 = off_1ECFD6A80;
  if (!off_1ECFD6A80)
  {
    *(_QWORD *)&v35 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v35 + 1) = 3221225472;
    *(_QWORD *)&v36 = sub_1B06730EC;
    *((_QWORD *)&v36 + 1) = &unk_1E61329A8;
    v37 = &v29;
    sub_1B06730EC(&v35, a2, (uint64_t)a3, v3, v4);
    v7 = (void (*)(__int128 *, _QWORD, id *))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v22, (uint64_t)"Boolean soft_CPCopyBundleIdentifierAndTeamFromAuditToken(audit_token_t, CFStringRef *, CFStringRef *)", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v27, (uint64_t)v25, (uint64_t)CFSTR("CWFXPCConnection.m"), 42, CFSTR("%s"), v26);

    __break(1u);
  }
  v35 = v33;
  v36 = v34;
  v7(&v35, 0, &v28);
  v12 = v28;
  if (!v28)
  {
LABEL_8:
    v13 = *(_OWORD *)&a3->var0[4];
    v35 = *(_OWORD *)a3->var0;
    v36 = v13;
    sub_1B0643A64();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, kCFURLPOSIXPathStyle, 0),
          (v16 = v15) != 0))
    {
      v17 = CFBundleCopyInfoDictionaryForURL(v15);
      v18 = v17;
      if (v17)
      {
        Value = (void *)CFDictionaryGetValue(v17, (const void *)*MEMORY[0x1E0C9AE78]);
        v28 = Value;
        if (Value)
        {
          CFRetain(Value);
          v12 = v28;
        }
        else
        {
          v12 = 0;
        }
        CFRelease(v18);
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v16);
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 parentRequestUUID:(id)a6 isParentRequest:(BOOL)a7 reply:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  CWFXPCRequest *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char isUserPrivacySensitiveRequestType;
  __CFString *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __uint64_t v83;
  const char *v84;
  uint64_t v85;
  int v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int64_t defaultTimeoutOverride;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  NSObject *v123;
  NSObject *replyQueue;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  void *v130;
  NSObject *v131;
  id v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  __CFString *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unsigned int v147;
  unint64_t v148;
  id v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  __CFString *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *mutexQueue;
  id v191;
  id v192;
  int *v194;
  int *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  NSString *processName;
  NSString *bundleID;
  NSString *codesignID;
  const __CFString *v202;
  void *v203;
  void *v204;
  qos_class_t v206;
  int64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v212;
  _QWORD block[4];
  id v214;
  id v215;
  CWFXPCConnection *v216;
  id v217;
  id v218;
  id v219;
  int64_t v220;
  __uint64_t v221;
  _QWORD v222[4];
  id v223;
  CWFXPCConnection *v224;
  CWFXPCRequest *v225;
  id v226;
  int64_t v227;
  BOOL v228;
  _QWORD v229[5];
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  int64_t v235;
  __uint64_t v236;
  id v237;
  int v238;
  const __CFString *v239;
  __int16 v240;
  _BYTE v241[14];
  __int16 v242;
  NSString *v243;
  __int16 v244;
  NSString *v245;
  __int16 v246;
  NSString *v247;
  __int16 v248;
  void *v249;
  __int16 v250;
  qos_class_t v251;
  __int16 v252;
  void *v253;
  __int16 v254;
  void *v255;
  __int16 v256;
  __CFString *v257;
  uint64_t v258;

  v258 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v16 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setType_(v16, v17, a3, v18, v19);
  v212 = v13;
  objc_msgSend_setRequestParameters_(v16, v20, (uint64_t)v13, v21, v22);
  objc_msgSend_setInfo_(v16, v23, (uint64_t)v12, v24, v25);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReceivedAt_(v16, v31, (uint64_t)v30, v32, v33);

  objc_msgSend_setIsSubrequest_(v16, v34, v14 != 0, v35, v36);
  objc_msgSend_UUID(v16, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = qos_class_self();
  CWFGetOSLog();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    CWFGetOSLog();
    v43 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = MEMORY[0x1E0C81028];
    v44 = MEMORY[0x1E0C81028];
  }

  v209 = v14;
  v210 = v12;
  v207 = a3;
  v208 = v15;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v49 = CFSTR("REQ");
    if (v14)
      v49 = CFSTR("SUBREQ");
    v202 = v49;
    sub_1B063544C(a3, v45, v46, v47, v48);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_processIdentifier(self->_XPCConnection, v50, v51, v52, v53);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    sub_1B0634D44(self->_serviceType);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v13, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = v41;
    objc_msgSend_UUIDString(v41, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v65, v66, 5, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    isUserPrivacySensitiveRequestType = objc_msgSend___isUserPrivacySensitiveRequestType_(self, v70, a3, v71, v72);
    if ((isUserPrivacySensitiveRequestType & 1) != 0)
    {
      v78 = CFSTR("<private>");
    }
    else
    {
      objc_msgSend_description(v210, v73, v74, v75, v76);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v198, v79, v80, v81, v82);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v238 = 138545922;
    v239 = v202;
    v240 = 2114;
    *(_QWORD *)v241 = v204;
    *(_WORD *)&v241[8] = 1024;
    *(_DWORD *)&v241[10] = v54;
    v242 = 2114;
    v243 = processName;
    v244 = 2114;
    v245 = bundleID;
    v246 = 2114;
    v247 = codesignID;
    v248 = 2114;
    v249 = v55;
    v250 = 1024;
    v251 = v206;
    v252 = 2114;
    v253 = v60;
    v254 = 2114;
    v255 = v69;
    v256 = 2114;
    v257 = v78;
    LODWORD(v196) = 104;
    v194 = &v238;
    _os_log_send_and_compose_impl();
    if ((isUserPrivacySensitiveRequestType & 1) == 0)
    {

    }
    v14 = v209;
    v12 = v210;
    a3 = v207;
    v15 = v208;
    v41 = v203;
  }

  v83 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v237 = 0;
  v86 = objc_msgSend___allowXPCRequestWithType_error_(self, v84, a3, (uint64_t)&v237, v85);
  v87 = v237;
  v92 = v87;
  if (v86)
  {
    objc_msgSend_requestParameters(v16, v88, v89, v90, v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_timeout(v93, v94, v95, v96, v97);

    if (!v98)
    {
      defaultTimeoutOverride = self->_defaultTimeoutOverride;
      if (defaultTimeoutOverride < 0)
      {
        v104 = objc_msgSend_type(v16, v99, v100, v101, v102);
        defaultTimeoutOverride = objc_msgSend___defaultTimeoutForRequestType_(self, v105, v104, v106, v107);
      }
      objc_msgSend_requestParameters(v16, v99, v100, v101, v102, v194, v196);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimeout_(v108, v109, defaultTimeoutOverride, v110, v111);

    }
    v112 = objc_msgSend_queuePriority(v212, v99, v100, v101, v102, v194, v196);
    if (v112)
      objc_msgSend_setQueuePriority_(v16, v113, v112, v115, v116);
    v117 = objc_msgSend_qualityOfService(v212, v113, v114, v115, v116);
    if (v117)
    {
      v121 = v117;
      CWFGetOSLog();
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      if (v122)
      {
        CWFGetOSLog();
        v123 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v123 = MEMORY[0x1E0C81028];
        v132 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v41, v133, v134, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v137, v138, 5, v139, v140);
        v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v146 = objc_msgSend_qualityOfService(v212, v142, v143, v144, v145);
        v238 = 138543874;
        v239 = v141;
        v240 = 1024;
        *(_DWORD *)v241 = v206;
        *(_WORD *)&v241[4] = 2048;
        *(_QWORD *)&v241[6] = v146;
        LODWORD(v197) = 28;
        v195 = &v238;
        _os_log_send_and_compose_impl();

      }
    }
    else if (v206 > 0x14)
    {
      HIDWORD(v148) = v206 - 9;
      LODWORD(v148) = v206 - 9;
      v147 = v148 >> 2;
      if (v147 > 6)
        v121 = 0;
      else
        v121 = qword_1B07116F0[v147];
    }
    else
    {
      CWFGetOSLog();
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      if (v130)
      {
        CWFGetOSLog();
        v131 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v131 = MEMORY[0x1E0C81028];
        v149 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v41, v150, v151, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v154, v155, 5, v156, v157);
        v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v238 = 138543362;
        v239 = v158;
        LODWORD(v197) = 12;
        v195 = &v238;
        _os_log_send_and_compose_impl();

      }
      v121 = -1;
    }
    objc_msgSend_setQualityOfService_(v16, v118, v121, v119, v120, v195, v197);
    v159 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_UUID(self, v160, v161, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v164, v165, v166, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v41, v170, v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v159, v175, (uint64_t)CFSTR("%@/%@"), v176, v177, v169, v174);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v16, v179, (uint64_t)v178, v180, v181);

    v229[0] = MEMORY[0x1E0C809B0];
    v229[1] = 3221225472;
    v229[2] = sub_1B063060C;
    v229[3] = &unk_1E61337B0;
    v229[4] = self;
    v230 = v41;
    v182 = v209;
    v15 = v208;
    v235 = v207;
    v236 = v83;
    v231 = v182;
    v232 = v212;
    v183 = v208;
    v233 = v92;
    v234 = v183;
    v184 = v41;
    v185 = v212;
    v186 = v92;
    objc_msgSend_setResponse_(v16, v187, (uint64_t)v229, v188, v189);
    mutexQueue = self->_mutexQueue;
    v222[0] = MEMORY[0x1E0C809B0];
    v222[1] = 3221225472;
    v222[2] = sub_1B0667D70;
    v222[3] = &unk_1E6133800;
    v223 = v182;
    v224 = self;
    v226 = v183;
    v227 = v207;
    v225 = v16;
    v228 = a7;
    v191 = v182;
    v192 = v183;
    v14 = v209;
    dispatch_async(mutexQueue, v222);

    v12 = v210;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06680D4;
    block[3] = &unk_1E6133828;
    v214 = v87;
    v215 = v14;
    v220 = a3;
    v221 = v83;
    v216 = self;
    v217 = v212;
    v218 = v41;
    v219 = v15;
    v125 = v41;
    v126 = v212;
    v127 = v14;
    v128 = v92;
    v129 = v15;
    dispatch_async(replyQueue, block);

  }
  return v16;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)__allowXPCRequestWithType:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  id *v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  const char *v49;
  id v50;
  void *v51;
  NSObject *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSString *processName;
  NSString *bundleID;
  NSString *codesignID;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  char v68;
  const char *v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  BOOL v79;
  NSString *v81;
  NSArray *bootArgs;
  int64_t serviceType;
  int v84;
  id v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  NSString *v112;
  NSString *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  int v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  void *v130;
  NSObject *v131;
  id v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  NSString *v138;
  NSString *v139;
  NSString *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  id v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  NSString *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  NSObject *v161;
  void *v162;
  id v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  NSString *v169;
  NSString *v170;
  NSString *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id v178;
  NSString *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  id v186;
  NSString *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  void *v198;
  NSObject *v199;
  id v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  NSString *v206;
  NSString *v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  int *v214;
  uint64_t v215;
  NSString *v216;
  NSString *v217;
  NSString *v218;
  NSString *v219;
  id *v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  id v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int16 v230;
  _BYTE v231[128];
  int v232;
  _BYTE v233[64];
  _BYTE v234[128];
  uint64_t v235;

  v5 = a4;
  v235 = *MEMORY[0x1E0C80C00];
  v230 = 0;
  if ((unint64_t)(a3 - 249) <= 0xFFFFFFFFFFFFFF07)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 22, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v34 = 0;
    v8 = 0;
  }
  else
  {
    sub_1B0639CE4(self->_serviceType, a2, a3, (uint64_t)a4, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a3, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_containsObject_(v8, v13, (uint64_t)v12, v14, v15);

    if ((v16 & 1) != 0)
    {
      if (objc_msgSend_containsObject_(self->_bootArgs, v17, (uint64_t)CFSTR("corewifi_api_enforcement_disable=1"), v18, v19))
      {
        CWFGetOSLog();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          CWFGetOSLog();
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = MEMORY[0x1E0C81028];
          v53 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v58 = objc_msgSend_processIdentifier(self->_XPCConnection, v54, v55, v56, v57);
          processName = self->_processName;
          bundleID = self->_bundleID;
          codesignID = self->_codesignID;
          sub_1B0634D44(self->_serviceType);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B063544C(a3, v63, v64, v65, v66);
          v232 = 67110402;
          *(_DWORD *)v233 = v58;
          *(_WORD *)&v233[4] = 2114;
          *(_QWORD *)&v233[6] = processName;
          *(_WORD *)&v233[14] = 2114;
          *(_QWORD *)&v233[16] = bundleID;
          *(_WORD *)&v233[24] = 2114;
          *(_QWORD *)&v233[26] = codesignID;
          *(_WORD *)&v233[34] = 2114;
          *(_QWORD *)&v233[36] = v62;
          *(_WORD *)&v233[44] = 2114;
          *(_QWORD *)&v233[46] = objc_claimAutoreleasedReturnValue();
          _os_log_send_and_compose_impl();

        }
LABEL_33:

        v50 = 0;
        v29 = 0;
        v78 = 0;
LABEL_34:
        v79 = 1;
        goto LABEL_35;
      }
      if (objc_msgSend_isLocal(self, v20, v21, v22, v23))
      {
        CWFGetOSLog();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          CWFGetOSLog();
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = MEMORY[0x1E0C81028];
          v72 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          sub_1B0634D44(self->_serviceType);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B063544C(a3, v74, v75, v76, v77);
          v232 = 138543618;
          *(_QWORD *)v233 = v73;
          *(_WORD *)&v233[8] = 2114;
          *(_QWORD *)&v233[10] = objc_claimAutoreleasedReturnValue();
          _os_log_send_and_compose_impl();

        }
        goto LABEL_33;
      }
      sub_1B063AD98(self->_serviceType, (const char *)a3, &v230, v26, v27);
      v29 = objc_claimAutoreleasedReturnValue();
      v220 = v5;
      if (objc_msgSend_count(v29, v30, v31, v32, v33))
      {
        v228 = 0u;
        v229 = 0u;
        v226 = 0u;
        v227 = 0u;
        v34 = v29;
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v226, (uint64_t)v234, 16);
        if (v36)
        {
          v40 = v36;
          v41 = *(_QWORD *)v227;
          while (2)
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v227 != v41)
                objc_enumerationMutation(v34);
              objc_msgSend_valueForEntitlement_(self, v37, *(_QWORD *)(*((_QWORD *)&v226 + 1) + 8 * i), v38, v39);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

              if ((v48 & 1) != 0)
              {
                v67 = v34;
                goto LABEL_25;
              }
            }
            v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v226, (uint64_t)v234, 16);
            if (v40)
              continue;
            break;
          }
        }

        if ((_BYTE)v230)
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v49, *MEMORY[0x1E0CB2FE0], 1, 0);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          CWFGetOSLog();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v220;
          if (v51)
          {
            CWFGetOSLog();
            v52 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v52 = MEMORY[0x1E0C81028];
            v106 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v111 = objc_msgSend_processIdentifier(self->_XPCConnection, v107, v108, v109, v110);
            v112 = self->_processName;
            v113 = self->_bundleID;
            v217 = self->_codesignID;
            sub_1B0634D44(self->_serviceType);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B063544C(a3, v115, v116, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_componentsJoinedByString_(v34, v120, (uint64_t)CFSTR(","), v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v232 = 67110658;
            *(_DWORD *)v233 = v111;
            *(_WORD *)&v233[4] = 2114;
            *(_QWORD *)&v233[6] = v112;
            *(_WORD *)&v233[14] = 2114;
            *(_QWORD *)&v233[16] = v113;
            *(_WORD *)&v233[24] = 2114;
            *(_QWORD *)&v233[26] = v217;
            *(_WORD *)&v233[34] = 2114;
            *(_QWORD *)&v233[36] = v114;
            *(_WORD *)&v233[44] = 2114;
            *(_QWORD *)&v233[46] = v119;
            *(_WORD *)&v233[54] = 2114;
            *(_QWORD *)&v233[56] = v123;
            _os_log_send_and_compose_impl();

            v5 = v220;
          }

          v78 = 0;
          goto LABEL_56;
        }
        CWFGetOSLog();
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        if (v162)
        {
          CWFGetOSLog();
          v67 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = MEMORY[0x1E0C81028];
          v186 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          v187 = self->_processName;
          sub_1B0634D44(self->_serviceType);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B063544C(a3, v189, v190, v191, v192);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsJoinedByString_(v34, v194, (uint64_t)CFSTR(","), v195, v196);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = 138544130;
          *(_QWORD *)v233 = v187;
          *(_WORD *)&v233[8] = 2114;
          *(_QWORD *)&v233[10] = v188;
          *(_WORD *)&v233[18] = 2114;
          *(_QWORD *)&v233[20] = v193;
          *(_WORD *)&v233[28] = 2114;
          *(_QWORD *)&v233[30] = v197;
          LODWORD(v215) = 42;
          v214 = &v232;
          _os_log_send_and_compose_impl();

        }
LABEL_25:

      }
      v68 = sub_1B06379D0(self->_serviceType, a3, self->_processName, (char *)&v230);
      if ((_BYTE)v230)
      {
        if ((v68 & 1) == 0)
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v69, *MEMORY[0x1E0CB2FE0], 1, 0);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          CWFGetOSLog();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            CWFGetOSLog();
            v71 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v71 = MEMORY[0x1E0C81028];
            v163 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            v168 = objc_msgSend_processIdentifier(self->_XPCConnection, v164, v165, v166, v167);
            v169 = self->_processName;
            v170 = self->_bundleID;
            v171 = self->_codesignID;
            sub_1B0634D44(self->_serviceType);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B063544C(a3, v173, v174, v175, v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v232 = 67110402;
            *(_DWORD *)v233 = v168;
            *(_WORD *)&v233[4] = 2114;
            *(_QWORD *)&v233[6] = v169;
            *(_WORD *)&v233[14] = 2114;
            *(_QWORD *)&v233[16] = v170;
            *(_WORD *)&v233[24] = 2114;
            *(_QWORD *)&v233[26] = v171;
            *(_WORD *)&v233[34] = 2114;
            *(_QWORD *)&v233[36] = v172;
            *(_WORD *)&v233[44] = 2114;
            *(_QWORD *)&v233[46] = v177;
            _os_log_send_and_compose_impl();

          }
          v78 = 0;
LABEL_75:
          v34 = v29;
          v5 = v220;
          goto LABEL_56;
        }
      }
      else if ((v68 & 1) == 0)
      {
        CWFGetOSLog();
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        if (v160)
        {
          CWFGetOSLog();
          v161 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v161 = MEMORY[0x1E0C81028];
          v178 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v161, OS_LOG_TYPE_FAULT))
        {
          v179 = self->_processName;
          sub_1B0634D44(self->_serviceType);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B063544C(a3, v181, v182, v183, v184);
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = 138543874;
          *(_QWORD *)v233 = v179;
          *(_WORD *)&v233[8] = 2114;
          *(_QWORD *)&v233[10] = v180;
          *(_WORD *)&v233[18] = 2114;
          *(_QWORD *)&v233[20] = v185;
          LODWORD(v215) = 32;
          v214 = &v232;
          _os_log_send_and_compose_impl();

        }
      }
      bootArgs = self->_bootArgs;
      v81 = self->_processName;
      serviceType = self->_serviceType;
      v225 = 0;
      v84 = sub_1B0637E60(serviceType, a3, v81, bootArgs, &v225);
      v85 = v225;
      v78 = v85;
      if (v84)
      {
        v223 = 0u;
        v224 = 0u;
        v221 = 0u;
        v222 = 0u;
        v78 = v85;
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v86, (uint64_t)&v221, (uint64_t)v231, 16);
        if (v87)
        {
          v91 = v87;
          v92 = *(_QWORD *)v222;
          while (2)
          {
            for (j = 0; j != v91; ++j)
            {
              if (*(_QWORD *)v222 != v92)
                objc_enumerationMutation(v78);
              objc_msgSend_valueForEntitlement_(self, v88, *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * j), v89, v90, v214, v215);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = objc_msgSend_BOOLValue(v94, v95, v96, v97, v98);

              if ((v99 & 1) != 0)
              {

                goto LABEL_51;
              }
            }
            v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v88, (uint64_t)&v221, (uint64_t)v231, 16);
            if (v91)
              continue;
            break;
          }
        }

        if (HIBYTE(v230))
        {
          if (objc_msgSend_isCodesignedByApple(self, v100, v101, v102, v103))
          {
            CWFGetOSLog();
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            if (v104)
            {
              CWFGetOSLog();
              v105 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v105 = MEMORY[0x1E0C81028];
              v132 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
            {
              v137 = objc_msgSend_processIdentifier(self->_XPCConnection, v133, v134, v135, v136);
              v138 = self->_processName;
              v139 = self->_bundleID;
              v140 = self->_codesignID;
              sub_1B0634D44(self->_serviceType);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1B063544C(a3, v142, v143, v144, v145);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v232 = 67110402;
              *(_DWORD *)v233 = v137;
              *(_WORD *)&v233[4] = 2114;
              *(_QWORD *)&v233[6] = v138;
              *(_WORD *)&v233[14] = 2114;
              *(_QWORD *)&v233[16] = v139;
              *(_WORD *)&v233[24] = 2114;
              *(_QWORD *)&v233[26] = v140;
              *(_WORD *)&v233[34] = 2114;
              *(_QWORD *)&v233[36] = v141;
              *(_WORD *)&v233[44] = 2114;
              *(_QWORD *)&v233[46] = v146;
              _os_log_send_and_compose_impl();

            }
            goto LABEL_51;
          }
          if (HIBYTE(v230) && objc_msgSend_isCodesignedByApple(self, v100, v101, v102, v103))
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v100, *MEMORY[0x1E0CB2FE0], 1, 0);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            CWFGetOSLog();
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            if (v198)
            {
              CWFGetOSLog();
              v199 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v199 = MEMORY[0x1E0C81028];
              v200 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
            {
              v205 = objc_msgSend_processIdentifier(self->_XPCConnection, v201, v202, v203, v204);
              v206 = self->_processName;
              v207 = self->_bundleID;
              v219 = self->_codesignID;
              sub_1B0634D44(self->_serviceType);
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1B063544C(a3, v209, v210, v211, v212);
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              v232 = 67110402;
              *(_DWORD *)v233 = v205;
              *(_WORD *)&v233[4] = 2114;
              *(_QWORD *)&v233[6] = v206;
              *(_WORD *)&v233[14] = 2114;
              *(_QWORD *)&v233[16] = v207;
              *(_WORD *)&v233[24] = 2114;
              *(_QWORD *)&v233[26] = v219;
              *(_WORD *)&v233[34] = 2114;
              *(_QWORD *)&v233[36] = v208;
              *(_WORD *)&v233[44] = 2114;
              *(_QWORD *)&v233[46] = v213;
              _os_log_send_and_compose_impl();

            }
            goto LABEL_75;
          }
        }
        v124 = objc_msgSend_locationAuthorizationStatus(self, v100, v101, v102, v103, v214, v215);
        if (v124 != 3)
        {
          v129 = v124;
          if (v124 != 4 || (objc_msgSend_isVisible(self, v125, v126, v127, v128) & 1) == 0)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v125, *MEMORY[0x1E0CB2FE0], 1, 0);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            CWFGetOSLog();
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            if (v130)
            {
              CWFGetOSLog();
              v131 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v131 = MEMORY[0x1E0C81028];
              v147 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
            {
              v152 = objc_msgSend_processIdentifier(self->_XPCConnection, v148, v149, v150, v151);
              v153 = self->_processName;
              v216 = self->_bundleID;
              v218 = self->_codesignID;
              sub_1B0634D44(self->_serviceType);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1B063544C(a3, v155, v156, v157, v158);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              v232 = 67110658;
              *(_DWORD *)v233 = v129;
              *(_WORD *)&v233[4] = 1024;
              *(_DWORD *)&v233[6] = v152;
              *(_WORD *)&v233[10] = 2114;
              *(_QWORD *)&v233[12] = v153;
              *(_WORD *)&v233[20] = 2114;
              *(_QWORD *)&v233[22] = v216;
              *(_WORD *)&v233[30] = 2114;
              *(_QWORD *)&v233[32] = v218;
              *(_WORD *)&v233[40] = 2114;
              *(_QWORD *)&v233[42] = v154;
              *(_WORD *)&v233[50] = 2114;
              *(_QWORD *)&v233[52] = v159;
              _os_log_send_and_compose_impl();

            }
            goto LABEL_75;
          }
        }
      }
LABEL_51:
      v50 = 0;
      goto LABEL_34;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, *MEMORY[0x1E0CB2FE0], 45, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v34 = 0;
  }
LABEL_56:
  v79 = 0;
  if (v5 && v50)
  {
    v50 = objc_retainAutorelease(v50);
    v79 = 0;
    *v5 = v50;
  }
  v29 = v34;
LABEL_35:

  return v79;
}

- (unint64_t)__defaultTimeoutForRequestType:(int64_t)a3
{
  unint64_t result;
  BOOL v4;
  unint64_t v5;

  result = 4000000000;
  if (a3 > 180)
  {
    if (a3 > 187)
    {
      if ((unint64_t)(a3 - 192) <= 0x32)
      {
        if (((1 << (a3 + 64)) & 0x5818000000031) != 0)
          return 20000000000;
        if (a3 == 220 || a3 == 238)
          return 10000000000;
      }
      v4 = a3 == 188;
      v5 = 60000000000;
LABEL_17:
      if (v4)
        return v5;
      return result;
    }
    if (a3 != 181 && a3 != 184 && a3 != 186)
      return result;
    return 20000000000;
  }
  switch(a3)
  {
    case '>':
    case '@':
      result = 120000000000;
      break;
    case '?':
    case 'B':
    case 'C':
    case 'D':
    case 'O':
      return result;
    case 'A':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
      return 20000000000;
    default:
      v4 = a3 == 6;
      v5 = 10000000000;
      goto LABEL_17;
  }
  return result;
}

- (id)registeredEventIDs
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA60;
  v10 = sub_1B063E9F8;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B062C3BC;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isLocal
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)__updateXPCTransactionCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  OS_os_transaction *XPCTransaction;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OS_os_transaction *v17;
  OS_os_transaction *v18;
  OS_os_transaction *v19;
  id v20;

  XPCTransaction = self->_XPCTransaction;
  if (objc_msgSend_count(self->_mutablePendingRequestMap, a2, v2, v3, v4)
    || objc_msgSend_count(self->_mutableEventIDs, v7, v8, v9, v10)
    || objc_msgSend_count(self->_mutableActivities, v7, v11, v9, v10)
    || objc_msgSend_count(self->_mutablePendingEventAcknowledgements, v7, v12, v9, v10))
  {
    if (XPCTransaction)
      return;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("com.apple.corewifi.xpc-transaction.%@"), v9, v10, self->_processName);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v20, v13, v14, v15, v16);
    v17 = (OS_os_transaction *)os_transaction_create();
    v18 = self->_XPCTransaction;
    self->_XPCTransaction = v17;

    v19 = (OS_os_transaction *)v20;
LABEL_8:

    return;
  }
  if (XPCTransaction)
  {
    v19 = self->_XPCTransaction;
    self->_XPCTransaction = 0;
    goto LABEL_8;
  }
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CWFEventID *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CWFEventID *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *mutexQueue;
  id v35;
  id v36;
  CWFEventID *v37;
  CWFEventID *v38;
  _QWORD block[4];
  CWFEventID *v40;
  CWFXPCConnection *v41;
  CWFEventID *v42;
  id v43;
  id v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend_interfaceName(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(CWFEventID);
  v18 = objc_msgSend_type(v6, v14, v15, v16, v17);
  objc_msgSend_setType_(v13, v19, v18, v20, v21);
  if (v12)
  {
    v22 = objc_alloc_init(CWFEventID);
    v27 = objc_msgSend_type(v6, v23, v24, v25, v26);
    objc_msgSend_setType_(v22, v28, v27, v29, v30);
    objc_msgSend_setInterfaceName_(v22, v31, (uint64_t)v12, v32, v33);
  }
  else
  {
    v22 = 0;
  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0633588;
  block[3] = &unk_1E6133738;
  v40 = v22;
  v41 = self;
  v42 = v13;
  v43 = v6;
  v44 = v7;
  v35 = v7;
  v36 = v6;
  v37 = v13;
  v38 = v22;
  dispatch_async(mutexQueue, block);

}

- (id)registeredActivities
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA60;
  v10 = sub_1B063E9F8;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B0639BE8;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)resume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int64_t serviceType;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSObject *mutexQueue;
  const char *v28;
  NSArray *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD block[6];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (self->_XPCConnection)
  {
    sub_1B0639CE4(self->_serviceType, a2, v2, v3, v4);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v64, (uint64_t)v70, 16);
    if (v7)
    {
      v12 = v7;
      v54 = *(_QWORD *)v65;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v65 != v54)
            objc_enumerationMutation(obj);
          serviceType = self->_serviceType;
          v16 = (const char *)objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v64 + 1) + 8 * i), v8, v9, v10, v11);
          sub_1B063AD98(serviceType, v16, 0, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v19;
          if (v19)
          {
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v60, (uint64_t)v69, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v61;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v61 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                  mutexQueue = self->_mutexQueue;
                  block[0] = v13;
                  block[1] = 3221225472;
                  block[2] = sub_1B0666170;
                  block[3] = &unk_1E61333E0;
                  block[4] = self;
                  block[5] = v26;
                  dispatch_sync(mutexQueue, block);
                }
                v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v28, (uint64_t)&v60, (uint64_t)v69, 16);
              }
              while (v23);
            }
          }

        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v64, (uint64_t)v70, 16);
      }
      while (v12);
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v29 = self->_bootArgs;
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v55, (uint64_t)v68, 16);
    if (v31)
    {
      v35 = v31;
      v36 = *(_QWORD *)v56;
      while (2)
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(v29);
          v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
          if (objc_msgSend_hasPrefix_(v38, v32, (uint64_t)CFSTR("corewifi_timeout_override="), v33, v34))
          {
            v40 = objc_msgSend_length(CFSTR("corewifi_timeout_override="), v32, v39, v33, v34);
            objc_msgSend_substringFromIndex_(v38, v41, v40, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            self->_defaultTimeoutOverride = objc_msgSend_integerValue(v44, v45, v46, v47, v48);

            goto LABEL_27;
          }
        }
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v55, (uint64_t)v68, 16);
        if (v35)
          continue;
        break;
      }
    }
LABEL_27:

    objc_msgSend_resume(self->_XPCConnection, v49, v50, v51, v52);
  }
}

- (void)queryPowerWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 5, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryTxRateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 20, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryRxRateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 187, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryRSSIWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 18, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryPHYModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 29, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryNumberOfSpatialStreamsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 27, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryMCSIndexWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 26, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGuardIntervalWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 25, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryCountryCodeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 22, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryChannelWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 16, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBluetoothCoexModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 155, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)isCodesignedByApple
{
  CWFXPCConnection *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int codesignedByApple;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v2 = self;
  objc_sync_enter(v2);
  codesignedByApple = v2->_codesignedByApple;
  if (!v2->_codesignedByApple)
  {
    objc_msgSend_XPCConnection(v2, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    if (v8)
      objc_msgSend_auditToken(v8, v9, v10, v11, v12);
    v2->_codesignedByApple = 2;

    codesignedByApple = v2->_codesignedByApple;
  }
  v14 = codesignedByApple == 2;
  objc_sync_exit(v2);

  return v14;
}

- (id)__codesignIDFromAuditToken:(id *)a3
{
  __int128 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFURL *v8;
  OSStatus v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  OSStatus v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;
  _BYTE v24[32];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v24 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v24[16] = v3;
  sub_1B0643A64();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_14;
  staticCode = 0;
  v8 = (const __CFURL *)objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v4, (uint64_t)v7, v5, v6);
  v9 = SecStaticCodeCreateWithPath(v8, 0, &staticCode);
  if (staticCode)
  {
    information = 0;
    v13 = SecCodeCopySigningInformation(staticCode, 2u, &information);
    if (information)
    {
      objc_msgSend_objectForKey_(information, v10, *MEMORY[0x1E0CD6D18], v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(information);
    }
    else
    {
      v14 = (void *)SecCopyErrorMessageString(v13, 0);
      CWFGetOSLog();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        CWFGetOSLog();
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 138543874;
        *(_QWORD *)&v24[4] = v7;
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = v13;
        *(_WORD *)&v24[18] = 2114;
        *(_QWORD *)&v24[20] = v14;
        _os_log_send_and_compose_impl();
      }

      if (v14)
      {
        CFRelease(v14);
        v14 = 0;
      }
    }
    CFRelease(staticCode);
    goto LABEL_21;
  }
  v14 = (void *)SecCopyErrorMessageString(v9, 0);
  CWFGetOSLog();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    CWFGetOSLog();
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v24 = 138543874;
    *(_QWORD *)&v24[4] = v7;
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = v9;
    *(_WORD *)&v24[18] = 2114;
    *(_QWORD *)&v24[20] = v14;
    _os_log_send_and_compose_impl();
  }

  if (v14)
  {
    CFRelease(v14);
LABEL_14:
    v14 = 0;
  }
LABEL_21:

  return v14;
}

- (CWFXPCConnection)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFXPCConnection init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)suspend
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_suspend(self->_XPCConnection, a2, v2, v3, v4);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSXPCConnection *XPCConnection;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(void);

  XPCConnection = self->_XPCConnection;
  if (XPCConnection)
  {
    objc_msgSend_invalidate(XPCConnection, a2, v2, v3, v4);
  }
  else
  {
    objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v7, v8, v9, v10, v11);

    objc_msgSend_invalidationHandler(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_invalidationHandler(self, v17, v18, v19, v20);
      v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v21[2]();

    }
    objc_msgSend_setInvalidationHandler_(self, v17, 0, v19, v20);
  }
}

- (void)__coalesceAndCacheEvent:(id)a3
{
  CWFEventID *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  CWFEventID *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  id v52;

  v52 = a3;
  v4 = objc_alloc_init(CWFEventID);
  v9 = objc_msgSend_type(v52, v5, v6, v7, v8);
  objc_msgSend_setType_(v4, v10, v9, v11, v12);
  objc_msgSend_interfaceName(v52, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterfaceName_(v4, v18, (uint64_t)v17, v19, v20);

  switch(objc_msgSend_type(v52, v21, v22, v23, v24))
  {
    case 10:
      v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v28, 11, v29, v30);
      goto LABEL_7;
    case 11:
      v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v35, 10, v36, v37);
      goto LABEL_7;
    case 15:
      v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v38, 16, v39, v40);
      goto LABEL_7;
    case 16:
      v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v41, 15, v42, v43);
LABEL_7:
      objc_msgSend_interfaceName(v4, v31, v32, v33, v34);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInterfaceName_(v27, v45, (uint64_t)v44, v46, v47);

      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v48, 0, (uint64_t)v27, v49);
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v50, (uint64_t)v52, (uint64_t)v4, v51);

      break;
    default:
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v25, (uint64_t)v52, (uint64_t)v4, v26);
      break;
  }

}

- (BOOL)__shouldCoalesceEventTypeWhileSuspended:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x25;
}

- (BOOL)__shouldDropEventTypeWhileSuspended:(int64_t)a3
{
  return 0;
}

- (id)processState
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA60;
  v10 = sub_1B063E9F8;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B0667018;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isVisible
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  const char *v7;
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
  uint64_t v18;

  v5 = (uint64_t *)MEMORY[0x1E0D22E50];
  if (MEMORY[0x1E0D22E50])
  {
    objc_msgSend_processState(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_taskState(v6, v7, v8, v9, v10) == 4)
    {
      objc_msgSend_endowmentNamespaces(v6, v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend_containsObject_(v15, v16, *v5, v17, v18);

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (char)v5;
}

+ (int)locationAuthorizationStatusForWiFiNetworking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], a2, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/MobileWiFi.framework"), v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4;
  if (!v4)
    goto LABEL_6;
  if (!qword_1ECFD6A88)
  {
    v4 = _sl_dlopen();
    qword_1ECFD6A88 = v4;
  }
  if (qword_1ECFD6A88)
  {
    v10 = sub_1B06673B0(v4, v5, v6, v7, v8);
    v14 = objc_msgSend_authorizationStatusForBundle_(v10, v11, (uint64_t)v9, v12, v13);
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (id)__locationBundleIDOverride
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isEqual;

  objc_msgSend_bundleID(self, a2, v2, v3, v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v11, v12, (uint64_t)CFSTR("com.apple.milod"), v13, v14))
  {

LABEL_4:
    v6 = CFSTR("/System/Library/LocationBundles/Milod.bundle");
    return v6;
  }
  objc_msgSend_processName(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)CFSTR("milod"), v21, v22);

  if (isEqual)
    goto LABEL_4;
  return v6;
}

- (int)locationAuthorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;

  if (!qword_1ECFD6A88)
    qword_1ECFD6A88 = _sl_dlopen();
  if (!qword_1ECFD6A88)
    return 0;
  objc_msgSend___locationBundleIDOverride(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v6;
  if (v6)
  {
    v12 = sub_1B06673B0(v6, v7, v8, v9, v10);
    v16 = objc_msgSend_authorizationStatusForBundleIdentifier_(v12, v13, (uint64_t)v11, v14, v15);
  }
  else
  {
    CWFGetOSLog();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      CWFGetOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_processIdentifier(self->_XPCConnection, v20, v21, v22, v23);
      sub_1B0634D44(self->_serviceType);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    v16 = 0;
  }

  return v16;
}

- (id)__privacyFilteredScanResult:(id)a3 allowSSID:(BOOL)a4 allowBSSID:(BOOL)a5 allowCountryCode:(BOOL)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  CWFScanResult *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v56;
  uint64_t v57;

  v9 = a3;
  objc_msgSend_properties(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_1E615E6D0, v16, v17) & 1) == 0
    && (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1E615E6E8, v19, v20) & 1) == 0
    && (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1E615E700, v19, v20) & 1) == 0
    && !objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1E615E718, v19, v20))
  {
    v42 = v9;
    goto LABEL_22;
  }
  if (!objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1E615E718, v19, v20))
  {
    v30 = (void *)objc_msgSend_mutableCopy(v14, v21, v22, v23, v24);
    if (objc_msgSend_containsObject_(v14, v43, (uint64_t)&unk_1E615E6D0, v44, v45) && !a4)
      objc_msgSend_removeObject_(v30, v46, (uint64_t)&unk_1E615E6D0, v47, v48);
    if (objc_msgSend_containsObject_(v14, v46, (uint64_t)&unk_1E615E6E8, v47, v48) && !a5)
      objc_msgSend_removeObject_(v30, v49, (uint64_t)&unk_1E615E6E8, v50, v51);
    if (objc_msgSend_containsObject_(v14, v49, (uint64_t)&unk_1E615E700, v50, v51) && !a6)
      objc_msgSend_removeObject_(v30, v52, (uint64_t)&unk_1E615E700, v53, v54);
    objc_msgSend_filteredScanResultWithProperties_(v9, v52, (uint64_t)v30, v53, v54);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend_scanRecord(v9, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_mutableCopy(v25, v26, v27, v28, v29);

  if (a4)
  {
    if (a5)
      goto LABEL_8;
LABEL_24:
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)CFSTR("BSSID"), v32);
    if (a6)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)CFSTR("SSID"), v32);
  objc_msgSend_setObject_forKeyedSubscript_(v30, v56, 0, (uint64_t)CFSTR("SSID_STR"), v57);
  if (!a5)
    goto LABEL_24;
LABEL_8:
  if (!a6)
  {
LABEL_9:
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)CFSTR("80211D_IE"), v32);
    objc_msgSend_setObject_forKeyedSubscript_(v30, v33, 0, (uint64_t)CFSTR("IE"), v34);
  }
LABEL_10:
  v35 = [CWFScanResult alloc];
  objc_msgSend_matchingKnownNetworkProfile(v9, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(v35, v41, (uint64_t)v30, (uint64_t)v40, 0);

LABEL_21:
LABEL_22:

  return v42;
}

- (BOOL)__hasPendingRequestWithType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_allValues(self->_mutablePendingRequestMap, a2, a3, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend_type(v16, v9, v10, v11, v12) == a3
          && !objc_msgSend_isSubrequest(v16, v9, v10, v11, v12))
        {
          v17 = 1;
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v13)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (BOOL)__isUserPrivacySensitiveRequestType:(int64_t)a3
{
  return (unint64_t)(a3 - 201) <= 1 && sub_1B0643454(self->_bootArgs) != 1;
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
  v12[2] = sub_1B06683DC;
  v12[3] = &unk_1E6133138;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *remoteXPCProxyConnection;

  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection)
    remoteXPCProxyConnection = self->_XPCConnection;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *remoteXPCProxyConnection;

  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection)
    remoteXPCProxyConnection = self->_XPCConnection;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSString *processName;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  processName = self->_processName;
  v7 = objc_msgSend_processIdentifier(self->_XPCConnection, a2, v2, v3, v4);
  return (id)objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("%@ (pid=%d)"), v9, v10, processName, v7);
}

- (void)stopMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSString *bundleID;
  NSString *processName;
  id v31;
  NSString *codesignID;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *mutexQueue;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  int v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    sub_1B062BEE0(v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    v42 = v8;
    v31 = v10;
    codesignID = self->_codesignID;
    sub_1B0634D44(self->_serviceType);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    v47 = 138544898;
    v48 = v23;
    v49 = 1024;
    v50 = v28;
    v51 = 2114;
    v52 = processName;
    v53 = 2114;
    v54 = bundleID;
    v55 = 2114;
    v56 = codesignID;
    v10 = v31;
    v8 = v42;
    v57 = 2114;
    v58 = v33;
    v59 = 2114;
    v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0668848;
  block[3] = &unk_1E6133968;
  block[4] = self;
  v44 = v8;
  v45 = v9;
  v46 = v10;
  v39 = v10;
  v40 = v9;
  v41 = v8;
  dispatch_async(mutexQueue, block);

}

- (void)stopMonitoringAllEventsWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSString *processName;
  NSString *bundleID;
  NSString *codesignID;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *mutexQueue;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  int v30;
  int v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CWFGetOSLog();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CWFGetOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend_processIdentifier(self->_XPCConnection, v11, v12, v13, v14);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    sub_1B0634D44(self->_serviceType);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v6, v20, v21, v22, v23);
    v30 = 67110402;
    v31 = v15;
    v32 = 2114;
    v33 = processName;
    v34 = 2114;
    v35 = bundleID;
    v36 = 2114;
    v37 = codesignID;
    v38 = 2114;
    v39 = v19;
    v40 = 2114;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0668E80;
  block[3] = &unk_1E6133710;
  block[4] = self;
  v28 = v6;
  v29 = v7;
  v25 = v7;
  v26 = v6;
  dispatch_async(mutexQueue, block);

}

- (void)queryEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 98, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySystemEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 99, (uint64_t)a3, (uint64_t)a4);
}

- (void)beginActivity:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *mutexQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CWFXPCConnection *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  mutexQueue = self->_mutexQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B06692B8;
  v15[3] = &unk_1E6133968;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(mutexQueue, v15);

}

- (void)endActivityWithUUID:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *mutexQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CWFXPCConnection *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  mutexQueue = self->_mutexQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B0669D0C;
  v15[3] = &unk_1E6133968;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(mutexQueue, v15);

}

- (void)endAllActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B066A3D4;
  block[3] = &unk_1E6133710;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(mutexQueue, block);

}

- (void)queryActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 112, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySystemActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 113, (uint64_t)a3, (uint64_t)a4);
}

- (void)cancelRequestsWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B066A7C0;
  block[3] = &unk_1E6133710;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(mutexQueue, block);

}

- (void)queryMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 33, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryHardwareMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 173, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBSSIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 9, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBSSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 10, (uint64_t)a3, (uint64_t)a4);
}

- (void)setCompanionCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("CountryCode");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066ACE4;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 23, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066ACF8;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryCurrentKnownNetworkProfileWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 58, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryCurrentScanResultWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B066AE64;
  v10[3] = &unk_1E61339E0;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, v9, 57, (uint64_t)v6, (uint64_t)v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)queryDTIMIntervalWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 24, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryInterfaceCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 4, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 3, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 1, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryNoiseWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 19, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryOpModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 30, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryParentInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 32, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryRangingCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 34, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySSIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 7, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 8, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySecurityWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 12, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAuthTypeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 11, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryWEPSubtypeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 13, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryWAPISubtypeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 14, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySupportedChannelsWithCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a4;
  v11 = a3;
  objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)CFSTR("CountryCode"), v18);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1B066B128;
  v21[3] = &unk_1E6133760;
  v22 = v8;
  v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 15, (uint64_t)v16, (uint64_t)v10, v21);

}

- (void)queryHardwareSupportedChannelsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 210, (uint64_t)a3, (uint64_t)a4);
}

- (void)querySupportedPHYModesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 28, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryTxPowerWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 21, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryPowerStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 147, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryChainAckWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 148, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryTxChainPowerWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 149, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDesenseWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 150, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDesenseLevelWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 151, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBluetoothCoexConfigWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 152, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBluetoothCoexProfiles2GHzWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 153, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBluetoothCoexProfiles5GHzWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 154, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryLeakyAPStatsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 156, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryLQMSummaryWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 175, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryVirtualInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 2, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryVirtualInterfaceRoleWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 31, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLElectionIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 46, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLElectionParametersWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 45, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLElectionRSSIThresholdsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 47, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 50, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLOpModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 52, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLPeerDatabaseWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 48, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLPreferredChannelsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 40, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSecondaryMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 51, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSocialTimeSlotsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 49, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 53, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLStrategyWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 44, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSyncChannelSequenceWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 42, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSyncEnabledWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 39, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSyncParametersWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 43, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSyncStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 41, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLSidecarDiagnosticsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 146, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLExtensionStateMachineParamsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 157, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLElectionMetricWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 158, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLPresenceModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 159, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLGuardTimeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 160, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLAvailabilityWindowAPAlignmentWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 161, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 162, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLAFTxModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 163, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLPeerTrafficRegistrationWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 164, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLEncryptionTypeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 165, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAWDLBTLEStateParamsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 166, (uint64_t)a3, (uint64_t)a4);
}

- (id)__filterScanResultsForPrivacy:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = objc_msgSend___allowXPCRequestWithType_error_(self, v5, 7, 0, v6);
  v10 = objc_msgSend___allowXPCRequestWithType_error_(self, v8, 9, 0, v9);
  v13 = objc_msgSend___allowXPCRequestWithType_error_(self, v11, 22, 0, v12);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v4;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23);
        v25 = (void *)MEMORY[0x1B5E0A33C]();
        objc_msgSend___privacyFilteredScanResult_allowSSID_allowBSSID_allowCountryCode_(self, v26, v24, v7, v10, v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend_addObject_(v38, v27, (uint64_t)v30, v28, v29);

        objc_autoreleasePoolPop(v25);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v21);
  }

  v36 = (void *)objc_msgSend_copy(v38, v32, v33, v34, v35);
  return v36;
}

- (id)__matchedScanResultsWithKnownNetworkProfiles:(id)a3 scanResults:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v6;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1B5E0A33C](v14);
        sub_1B06420C0(v18, v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v18, v20, (uint64_t)v23, v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v11, v25, (uint64_t)v24, v26, v27);

        }
        else
        {
          objc_msgSend_addObject_(v11, v20, (uint64_t)v18, v21, v22, (_QWORD)v35);
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v28, (uint64_t)&v35, (uint64_t)v39, 16);
      v15 = v14;
    }
    while (v14);
  }

  v33 = (void *)objc_msgSend_copy(v11, v29, v30, v31, v32);
  return v33;
}

- (void)__matchKnownNetworksWithScanResults:(id)a3 parentXPCRequest:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_requestParameters(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1B066B8CC;
  v22[3] = &unk_1E6133918;
  objc_copyWeak(&v25, &location);
  v18 = v6;
  v23 = v18;
  v19 = v7;
  v24 = v19;
  v21 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v20, 54, 0, (uint64_t)v12, v17, 0, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)__performFollowupANQPForPasspointScanResults:(id)a3 combinedScanResults:(id)a4 parameters:(id)a5 parentXPCRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CWFANQPParameters *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  const char *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id location;
  const __CFString *v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(CWFANQPParameters);
  objc_msgSend_ANQPElementIDListForPasspointScanResults(v12, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setANQPElementIDList_(v14, v20, (uint64_t)v19, v21, v22);

  v27 = objc_msgSend_acceptableANQPCacheAgeForPasspointScanResults(v12, v23, v24, v25, v26);
  objc_msgSend_setAcceptableCacheAge_(v14, v28, v27, v29, v30);
  v35 = objc_msgSend_maximumANQPAgeForPasspointScanResults(v12, v31, v32, v33, v34);
  objc_msgSend_setMaximumAge_(v14, v36, v35, v37, v38);
  objc_msgSend_setScanResults_(v14, v39, (uint64_t)v10, v40, v41);
  objc_initWeak(&location, self);
  v65 = CFSTR("ANQPParams");
  v66[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)v66, (uint64_t)&v65, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v13, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v13, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = sub_1B066BC74;
  v59[3] = &unk_1E6133A08;
  objc_copyWeak(&v63, &location);
  v54 = v11;
  v60 = v54;
  v55 = v12;
  v61 = v55;
  v56 = v13;
  v62 = v56;
  v58 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v57, 65, (uint64_t)v43, (uint64_t)v48, v53, 0, v59);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);

}

- (id)__passpointScanResults:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    v10 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v3);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v15 = (void *)objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (void)__performScanWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v29 = CFSTR("ScanParams");
  v30[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B066C0F8;
  v24[3] = &unk_1E6133918;
  objc_copyWeak(&v27, &location);
  v20 = v6;
  v25 = v20;
  v21 = v7;
  v26 = v21;
  v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v22, 64, (uint64_t)v9, (uint64_t)v14, v19, 0, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)performScanWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *replyQueue;
  void *v23;
  id *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id *v29;
  const char *v30;
  _QWORD block[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  const __CFString *v40;
  id v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    objc_msgSend_ANQPElementIDListForPasspointScanResults(v8, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else if ((objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v17, v18, v19, v20) & 1) == 0)
    {
      v40 = CFSTR("ScanParams");
      v41 = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v41, (uint64_t)&v40, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = sub_1B066C694;
      v33[3] = &unk_1E6133A30;
      v24 = &v35;
      objc_copyWeak(&v35, &location);
      v34 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v30, 64, (uint64_t)v26, (uint64_t)v9, v33);
      v29 = &v34;
      goto LABEL_7;
    }
    v42 = CFSTR("ScanParams");
    v43[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v43, (uint64_t)&v42, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1B066C5C8;
    v36[3] = &unk_1E6133A30;
    v24 = &v38;
    objc_copyWeak(&v38, &location);
    v37 = v11;
    objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v25, 64, (uint64_t)v23, (uint64_t)v9, 0, 1, v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend___performScanWithParameters_parentXPCRequest_(self, v27, (uint64_t)v8, (uint64_t)v26, v28);
    v29 = &v37;
LABEL_7:

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B066C760;
  block[3] = &unk_1E61336E8;
  v32 = v10;
  dispatch_async(replyQueue, block);

LABEL_8:
}

- (void)__performANQPWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v29 = CFSTR("ANQPParams");
  v30[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B066C990;
  v24[3] = &unk_1E6133918;
  objc_copyWeak(&v27, &location);
  v20 = v6;
  v25 = v20;
  v21 = v7;
  v26 = v21;
  v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v22, 65, (uint64_t)v9, (uint64_t)v14, v19, 0, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)performANQPWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id *v21;
  NSObject *replyQueue;
  const char *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    if (objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v12, v13, v14, v15))
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = sub_1B066CC80;
      v29[3] = &unk_1E6133A30;
      v16 = &v31;
      objc_copyWeak(&v31, &location);
      v30 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v17, 65, 0, (uint64_t)v9, 0, 1, v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___performANQPWithParameters_parentXPCRequest_(self, v19, (uint64_t)v8, (uint64_t)v18, v20);
      v21 = &v30;

    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1B066CD4C;
      v26[3] = &unk_1E6133A30;
      v16 = &v28;
      objc_copyWeak(&v28, &location);
      v27 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v23, 65, 0, (uint64_t)v9, v26);
      v21 = &v27;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1B066CE18;
    v24[3] = &unk_1E61336E8;
    v25 = v10;
    dispatch_async(replyQueue, v24);

  }
}

- (void)setChannel:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("Channel");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066D000;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 17, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066D014;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)setPower:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v6 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("Power");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066D1B8;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 6, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)setRangeable:(BOOL)a3 peerList:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v8 = a3;
  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a4)
  {
    v28[0] = CFSTR("Rangeable");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("RangingPeerList");
    v29[0] = v18;
    v29[1] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B066D37C;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 68, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066D390;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = CFSTR("RangingPeerList");
    v28[1] = CFSTR("RangingTimeout");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a3;
    objc_msgSend_numberWithUnsignedInteger_(v13, v15, a4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B066D5B0;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 69, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066D63C;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)setRangingIdentifier:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (v8)
  {
    v17 = CFSTR("RangingIdentifier");
    v18[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v18, (uint64_t)&v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B066D7DC;
  v15[3] = &unk_1E6133760;
  v13 = v11;
  v16 = v13;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 174, (uint64_t)v12, (uint64_t)v9, v15);
  if (v8)

}

- (void)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("AWDLPeerAssistedDiscoveryParams");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066D960;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 66, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066D974;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)stopAWDLPeerAssistedDiscoveryWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B066DA78;
  v9[3] = &unk_1E6133760;
  v10 = v6;
  v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 67, 0, (uint64_t)a3, v9);

}

- (id)__shouldPerformPreAssociation6GHzFollowupScan:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = v3;
  if (!v3
    || (objc_msgSend_isFILSDiscoveryFrame(v3, v4, v5, v6, v7) & 1) != 0
    || (objc_msgSend_channel(v8, v9, v10, v11, v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend_is6GHz(v13, v14, v15, v16, v17),
        v13,
        (v18 & 1) != 0))
  {
    v23 = 0;
    goto LABEL_26;
  }
  objc_msgSend_RNRBSSList(v8, v19, v20, v21, v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v23, v24, v25, v26, v27))
  {
LABEL_26:
    v35 = 0;
    goto LABEL_24;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v23 = v23;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v28, (uint64_t)&v52, (uint64_t)v56, 16);
  if (!v29)
  {
    v35 = 0;
    goto LABEL_23;
  }
  v34 = v29;
  v35 = 0;
  v36 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v34; ++i)
    {
      if (*(_QWORD *)v53 != v36)
        objc_enumerationMutation(v23);
      v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      objc_msgSend_channel(v38, v30, v31, v32, v33, (_QWORD)v52);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_is6GHz(v39, v40, v41, v42, v43);

      if (v44)
      {
        v45 = objc_msgSend_shortSSID(v38, v30, v31, v32, v33);
        if (v45)
        {
          if (v45 != objc_msgSend_shortSSID(v8, v46, v47, v48, v49))
            continue;
        }
        else if ((objc_msgSend_isSameSSID(v38, v46, v47, v48, v49) & 1) == 0)
        {
          continue;
        }
        if ((objc_msgSend_isColocatedAP(v38, v30, v31, v32, v33) & 1) != 0)
        {
          v50 = v38;

          v35 = v50;
          goto LABEL_23;
        }
        if (!v35)
          v35 = v38;
      }
    }
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v34)
      continue;
    break;
  }
LABEL_23:

LABEL_24:
  return v35;
}

- (void)__perform6GHzFollowupScanAndAssociateWithParameters:(id)a3 BSS:(id)a4 parentXPCRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  CWFScanParameters *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  const char *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id location;
  const __CFString *v84;
  CWFScanParameters *v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(CWFScanParameters);
  objc_msgSend_scanResult(v8, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_shortSSID(v16, v17, v18, v19, v20);
  objc_msgSend_setShortSSID_(v11, v22, v21, v23, v24);

  objc_msgSend_BSSID(v9, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBSSID_(v11, v30, (uint64_t)v29, v31, v32);

  objc_msgSend_channel(v9, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v37;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v86, 1, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannels_(v11, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_setBSSType_(v11, v44, 3, v45, v46);
  objc_msgSend_setIncludeHiddenNetworks_(v11, v47, 0, v48, v49);
  objc_msgSend_setAcceptableCacheAge_(v11, v50, 0, v51, v52);
  objc_msgSend_setScanType_(v11, v53, 1, v54, v55);
  if (objc_msgSend_isUPRActive(v9, v56, v57, v58, v59))
    objc_msgSend_setScanFlags_(v11, v60, 32, v61, v62);
  else
    objc_msgSend_setScanFlags_(v11, v60, 1056, v61, v62);
  objc_initWeak(&location, self);
  v84 = CFSTR("ScanParams");
  v85 = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)&v85, (uint64_t)&v84, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v10, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v10, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = sub_1B066DF28;
  v79[3] = &unk_1E6133918;
  objc_copyWeak(&v82, &location);
  v75 = v8;
  v80 = v75;
  v76 = v10;
  v81 = v76;
  v78 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v77, 64, (uint64_t)v64, (uint64_t)v69, v74, 0, v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);

}

- (void)associateWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id *v23;
  const char *v24;
  void *v25;
  const char *v26;
  NSObject *replyQueue;
  const char *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  const __CFString *v35;
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  if (v8)
  {
    objc_msgSend_scanResult(v8, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___shouldPerformPreAssociation6GHzFollowupScan_(self, v17, (uint64_t)v16, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v37 = CFSTR("AssocParams");
      v38[0] = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v38, (uint64_t)&v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = sub_1B066E32C;
      v33[3] = &unk_1E6133760;
      v23 = &v34;
      v34 = v15;
      objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v24, 62, (uint64_t)v22, (uint64_t)v9, 0, 1, v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend___perform6GHzFollowupScanAndAssociateWithParameters_BSS_parentXPCRequest_(self, v26, (uint64_t)v8, (uint64_t)v20, (uint64_t)v25);
    }
    else
    {
      v35 = CFSTR("AssocParams");
      v36 = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v36, (uint64_t)&v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = sub_1B066E340;
      v31[3] = &unk_1E6133760;
      v23 = &v32;
      v32 = v15;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v28, 62, (uint64_t)v25, (uint64_t)v9, v31);
    }

  }
  else
  {
    replyQueue = self->_replyQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B066E354;
    v29[3] = &unk_1E61336E8;
    v30 = v10;
    dispatch_async(replyQueue, v29);
    v20 = v30;
  }

}

- (void)disassociateWithReason:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("DisassocReason");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066E4F8;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 63, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)updateSoftAPBand:(unsigned int)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v6 = *(_QWORD *)&a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("SoftAPBand");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithUnsignedInt_(v9, v11, v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066E63C;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 219, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)queryKnownNetworkProfileMatchingNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066E7C0;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 55, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066E84C;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryKnownNetworkProfileMatchingScanResult:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("ScanResult");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066EA34;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 56, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066EAC0;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryKnownNetworkProfilesWithProperties:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a4;
  v11 = a3;
  objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)CFSTR("NetworkProfileProperties"), v18);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1B066EC24;
  v21[3] = &unk_1E6133760;
  v22 = v8;
  v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 54, (uint64_t)v16, (uint64_t)v10, v21);

}

- (void)addKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066EE20;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 59, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066EE34;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 requestParams:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  NSObject *replyQueue;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21 = v16;
  if (v12)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v12, (uint64_t)CFSTR("NetworkProfile"), v24);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v25, (uint64_t)v13, (uint64_t)CFSTR("NetworkProfileProperties"), v26);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v14, (uint64_t)CFSTR("OSSpecificKeys"), v28);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1B066F030;
    v33[3] = &unk_1E6133760;
    v34 = v21;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v29, 61, (uint64_t)v22, (uint64_t)v15, v33);

  }
  else
  {
    replyQueue = self->_replyQueue;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1B066F044;
    v31[3] = &unk_1E61336E8;
    v32 = v16;
    dispatch_async(replyQueue, v31);
    v22 = v32;
  }

}

- (void)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = CFSTR("NetworkProfile");
    v28[1] = CFSTR("RemoveReason");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a3;
    objc_msgSend_numberWithInteger_(v13, v15, a4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B066F264;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 60, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066F278;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryThermalIndexWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 35, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryCountryBandSupport:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 197, (uint64_t)a3, (uint64_t)a4);
}

- (void)setThermalIndex:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("ThermalIndex");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066F43C;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 36, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)queryLinkDownStatusWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 37, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryWoWEnabledWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 38, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIO80211ControllerInfoWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 114, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIO80211InterfaceInfoWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 115, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 116, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 117, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryNetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 121, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryNetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 120, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIsNetworkServiceEnabledWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 122, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 118, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 119, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 125, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDHCPLeaseStartTimeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 123, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDHCPLeaseExpirationTimeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 124, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 126, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 127, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv4InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 130, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv4NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 129, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv4NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 128, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv6InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 135, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv6NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 134, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv6NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 133, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 131, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 132, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryGlobalDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 136, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryNetworkReachabilityWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 137, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryEAP8021XSupplicantStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 138, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryEAP8021XControlModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 139, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryEAP8021XControlStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 140, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryEAP8021XClientStatusWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 141, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryRoamStatusWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 142, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 143, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAutoJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 144, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDeviceUUIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 145, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryLinkQualityMetricWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 167, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryPowerDebugInfoWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 176, (uint64_t)a3, (uint64_t)a4);
}

- (void)performAutoJoinWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  CWFAutoJoinParameters *v12;
  CWFAutoJoinParameters *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = (CWFAutoJoinParameters *)v8;
  v13 = v12;
  if (!v12)
  {
    v13 = objc_alloc_init(CWFAutoJoinParameters);
    objc_msgSend_setTrigger_(v13, v14, 16, v15, v16);
    objc_msgSend_setMode_(v13, v17, 1, v18, v19);
  }
  v25 = CFSTR("AutoJoinParams");
  v26[0] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v26, (uint64_t)&v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1B066F7E0;
  v23[3] = &unk_1E6133760;
  v24 = v10;
  v21 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 177, (uint64_t)v20, (uint64_t)v9, v23);

}

- (void)queryCCAWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 178, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryUserAutoJoinStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 179, (uint64_t)a3, (uint64_t)a4);
}

- (void)setUserAutoJoinState:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v6 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("UserAutoJoinState");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066F944;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 180, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)queryAutoHotspotModeWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 182, (uint64_t)a3, (uint64_t)a4);
}

- (void)setAutoHotspotMode:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("AutoHotspotMode");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B066FA98;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 183, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)queryWiFiUIStateFlagsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 185, (uint64_t)a3, (uint64_t)a4);
}

- (void)performSensingWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("SensingParams");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066FC2C;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 188, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066FCB8;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)performNearbyDeviceDiscovery:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NDDParams");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B066FEA0;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 238, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B066FEB4;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryUserSettingsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 189, (uint64_t)a3, (uint64_t)a4);
}

- (void)setUserSettings:(id)a3 properties:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  NSObject *replyQueue;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v10, (uint64_t)CFSTR("UserSettings"), v17);
    if (v11)
      objc_msgSend_setObject_forKey_(v15, v18, (uint64_t)v11, (uint64_t)CFSTR("UserSettingsProperties"), v19);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1B0670090;
    v24[3] = &unk_1E6133760;
    v25 = v14;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 190, (uint64_t)v15, (uint64_t)v12, v24);

  }
  else
  {
    replyQueue = self->_replyQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B06700A4;
    v22[3] = &unk_1E61336E8;
    v23 = v13;
    dispatch_async(replyQueue, v22);
    v15 = v23;
  }

}

- (void)queryAutoJoinMetricWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 193, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 194, (uint64_t)a3, (uint64_t)a4);
}

- (void)resetAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B06701C8;
  v9[3] = &unk_1E6133760;
  v10 = v6;
  v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 195, 0, (uint64_t)a3, v9);

}

- (void)queryIPv4SubnetMasksWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 203, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv4ARPResolvedHardwareAddressWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 204, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv4ARPResolvedIPAddressWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 205, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDHCPServerIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 206, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryDHCPv6ServerIDWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 207, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv4NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 208, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryIPv6NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 209, (uint64_t)a3, (uint64_t)a4);
}

- (void)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 requestParams:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  NSObject *replyQueue;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24 = v19;
  if (v14 && v15)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v15, (uint64_t)CFSTR("NetworkProfile"), v27);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v28, (uint64_t)v14, (uint64_t)CFSTR("BSS"), v29);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v30, (uint64_t)v16, (uint64_t)CFSTR("BSSProperties"), v31);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v32, (uint64_t)v17, (uint64_t)CFSTR("OSSpecificKeys"), v33);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_1B0670400;
    v38[3] = &unk_1E6133760;
    v39 = v24;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v34, 200, (uint64_t)v25, (uint64_t)v18, v38);

  }
  else
  {
    replyQueue = self->_replyQueue;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1B0670414;
    v36[3] = &unk_1E61336E8;
    v37 = v19;
    dispatch_async(replyQueue, v36);
    v25 = v37;
  }

}

- (void)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id *v18;
  const char *v19;
  NSObject *replyQueue;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a3 && a4)
  {
    v27[0] = CFSTR("NetworkProfile");
    v27[1] = CFSTR("BSS");
    v28[0] = a4;
    v28[1] = a3;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = a4;
    v15 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B0670628;
    v25[3] = &unk_1E6133760;
    v18 = &v26;
    v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 198, (uint64_t)v17, (uint64_t)v10, v25);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B067063C;
    block[3] = &unk_1E61336E8;
    v18 = &v24;
    v24 = v11;
    v21 = a4;
    v22 = a3;
    dispatch_async(replyQueue, block);
  }

}

- (void)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id *v18;
  const char *v19;
  NSObject *replyQueue;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a3 && a4)
  {
    v27[0] = CFSTR("NetworkProfile");
    v27[1] = CFSTR("BSS");
    v28[0] = a4;
    v28[1] = a3;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = a4;
    v15 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B0670850;
    v25[3] = &unk_1E6133760;
    v18 = &v26;
    v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 199, (uint64_t)v17, (uint64_t)v10, v25);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0670864;
    block[3] = &unk_1E61336E8;
    v18 = &v24;
    v24 = v11;
    v21 = a4;
    v22 = a3;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryPasswordForKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B0670A48;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 201, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0670AD4;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)setPassword:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *replyQueue;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18 = v13;
  if (v11)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v11, (uint64_t)CFSTR("NetworkProfile"), v21);
    objc_msgSend_setObject_forKeyedSubscript_(v19, v22, (uint64_t)v10, (uint64_t)CFSTR("Password"), v23);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1B0670CA4;
    v28[3] = &unk_1E6133760;
    v29 = v18;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v24, 202, (uint64_t)v19, (uint64_t)v12, v28);

  }
  else
  {
    replyQueue = self->_replyQueue;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B0670CB8;
    v26[3] = &unk_1E61336E8;
    v27 = v13;
    dispatch_async(replyQueue, v26);
    v19 = v27;
  }

}

- (void)queryMaxLinkSpeedWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 211, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryStateWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 212, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryPowersaveWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 213, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryMaxNSSForAPWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 214, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryTxNSSWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 215, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryBeaconCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B0670E68;
  v10[3] = &unk_1E6133A30;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 216, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)queryBackgroundScanCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B0671020;
  v10[3] = &unk_1E6133A30;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 241, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)queryBackgroundScanConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 243, (uint64_t)a3, (uint64_t)a4);
}

- (void)setBackgroundScanConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("BackgroundScanConfiguration");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B067126C;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 244, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671280;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryBlockedBandsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 217, (uint64_t)a3, (uint64_t)a4);
}

- (void)setBlockedBands:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("BlockedBands");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B0671474;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 218, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671488;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)startHostAPModeWithConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("HostAPConfiguration");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B067166C;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 220, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671680;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)stopHostAPModeWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B0671784;
  v9[3] = &unk_1E6133760;
  v10 = v6;
  v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 221, 0, (uint64_t)a3, v9);

}

- (void)queryPrivateMACAddressForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B0671908;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 222, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671994;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryPrivateMACAddressModeForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B0671B7C;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 223, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671C08;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = CFSTR("NetworkProfile");
    v28[1] = CFSTR("PrivateMACMode");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a4;
    objc_msgSend_numberWithInteger_(v13, v15, a3, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B0671E2C;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 224, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0671E40;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryPrivateMACAddressModeSystemSettingWithRequestParams:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B0671F44;
  v9[3] = &unk_1E6133760;
  v10 = v6;
  v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 225, 0, (uint64_t)a3, v9);

}

- (void)setPrivateMACAddressModeSystemSetting:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v21 = CFSTR("PrivateMACMode");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B0672100;
  v19[3] = &unk_1E6133760;
  v20 = v8;
  v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 226, (uint64_t)v16, (uint64_t)v10, v19);

}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v8 = a3;
  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = CFSTR("NetworkProfile");
    v28[1] = CFSTR("State");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B06722C0;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 227, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06722D4;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryIsQuickProbeRequiredForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("NetworkProfile");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06724B8;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 228, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0672544;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id *v21;
  const char *v22;
  NSObject *replyQueue;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v8 = a3;
  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = CFSTR("NetworkProfile");
    v28[1] = CFSTR("Result");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B0672768;
    v26[3] = &unk_1E6133760;
    v21 = &v27;
    v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 229, (uint64_t)v20, (uint64_t)v10, v26);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B067277C;
    block[3] = &unk_1E61336E8;
    v21 = &v25;
    v25 = v11;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryHostAPStationListWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 233, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryLQMConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 234, (uint64_t)a3, (uint64_t)a4);
}

- (void)setLQMConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id *v15;
  const char *v16;
  NSObject *replyQueue;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    v22 = CFSTR("LQMConfiguration");
    v23[0] = a3;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B0672980;
    v20[3] = &unk_1E6133760;
    v15 = &v21;
    v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 235, (uint64_t)v14, (uint64_t)v8, v20);

  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0672994;
    block[3] = &unk_1E61336E8;
    v15 = &v19;
    v19 = v9;
    dispatch_async(replyQueue, block);
  }

}

- (void)queryWiFiAssistOverrideReasonsWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 236, (uint64_t)a3, (uint64_t)a4);
}

- (void)queryAutoJoinDenyListWithRequestParams:(id)a3 reply:(id)a4
{
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, a2, 245, (uint64_t)a3, (uint64_t)a4);
}

- (void)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v24[0] = CFSTR("NetworkProfile");
  v24[1] = CFSTR("AutoJoinDenyListAddReason");
  v25[0] = a3;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  v13 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v25, (uint64_t)v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1B0672B80;
  v22[3] = &unk_1E6133760;
  v23 = v10;
  v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 246, (uint64_t)v19, (uint64_t)v12, v22);

}

- (void)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v24[0] = CFSTR("NetworkProfile");
  v24[1] = CFSTR("AutoJoinDenyListRemoveReason");
  v25[0] = a3;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  v13 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v25, (uint64_t)v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1B0672D64;
  v22[3] = &unk_1E6133760;
  v23 = v10;
  v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 247, (uint64_t)v19, (uint64_t)v12, v22);

}

- (void)queryKnownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (v8)
  {
    v17 = CFSTR("KnownNetworkInfoOptions");
    v18[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v18, (uint64_t)&v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B0672F14;
  v15[3] = &unk_1E6133760;
  v16 = v11;
  v13 = v11;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 248, (uint64_t)v12, (uint64_t)v9, v15);

}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)codesignID
{
  return self->_codesignID;
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_codesignID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bootArgs, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_entitlementsCache, 0);
  objc_storeStrong((id *)&self->_XPCTransaction, 0);
  objc_storeStrong((id *)&self->_coalescedEvents, 0);
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_mutablePendingEventAcknowledgements, 0);
  objc_storeStrong((id *)&self->_mutableEventIDs, 0);
  objc_storeStrong((id *)&self->_mutableActivities, 0);
  objc_storeStrong((id *)&self->_mutablePendingRequestMap, 0);
  objc_storeStrong((id *)&self->_ackQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
