@implementation CWFXPCListener

- (void)sendXPCEvent:(id)a3 reply:(id)a4
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
  block[2] = sub_1B062C124;
  block[3] = &unk_1E6133B18;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)XPCConnection:(id)a3 updatedRegisteredEventIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v11)
    objc_msgSend_XPCListener_XPCConnection_updatedRegisteredEventIDs_(v11, v12, (uint64_t)self, (uint64_t)v14, (uint64_t)v6);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CWFXPCConnection *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *mutexQueue;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v80;
  NSObject *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  id v88;
  void *v89;
  _QWORD block[5];
  id v91;
  _QWORD v92[5];
  id v93;
  id location;
  int v95;
  void *v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  int v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend___allowXPCConnection_serviceType_(self, v8, (uint64_t)v7, self->_serviceType, v9))
  {
    v10 = [CWFXPCConnection alloc];
    v12 = (void *)objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v10, v11, self->_serviceType, (uint64_t)v7, (uint64_t)self->_bootArgs);
    v16 = v12;
    v17 = v12 != 0;
    if (v12)
    {
      objc_msgSend_setDelegate_(v12, v13, (uint64_t)self, v14, v15);
      objc_msgSend_setExportedInterface_(v7, v18, (uint64_t)self->_requestXPCInterface, v19, v20);
      objc_msgSend_setRemoteObjectInterface_(v7, v21, (uint64_t)self->_eventXPCInterface, v22, v23);
      objc_msgSend_setExportedObject_(v7, v24, (uint64_t)v16, v25, v26);
      objc_initWeak(&location, v16);
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = sub_1B0627950;
      v92[3] = &unk_1E6135418;
      objc_copyWeak(&v93, &location);
      v92[4] = self;
      objc_msgSend_setInvalidationHandler_(v16, v27, (uint64_t)v92, v28, v29);
      CWFGetOSLog();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        CWFGetOSLog();
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = MEMORY[0x1E0C81028];
        v32 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v87 = v17;
        v88 = v6;
        objc_msgSend_processName(v16, v33, v34, v35, v36);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend_processIdentifier(v7, v37, v38, v39, v40);
        v46 = objc_msgSend_effectiveUserIdentifier(v7, v42, v43, v44, v45);
        v51 = objc_msgSend_effectiveGroupIdentifier(v7, v47, v48, v49, v50);
        objc_msgSend_UUID(v16, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v56, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v61, v62, 5, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 138544386;
        v96 = v89;
        v97 = 1024;
        v98 = v41;
        v99 = 1024;
        v100 = v46;
        v101 = 1024;
        v102 = v51;
        v103 = 2114;
        v104 = v65;
        _os_log_send_and_compose_impl();

        v6 = v88;
        v17 = v87;

      }
      objc_msgSend_resume(v16, v66, v67, v68, v69);
      mutexQueue = self->_mutexQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06E2FE8;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v71 = v16;
      v91 = v71;
      dispatch_async(mutexQueue, block);
      objc_msgSend_delegate(self, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_XPCListener_addedXPCConnection_(v76, v77, (uint64_t)self, (uint64_t)v71, v78);

      objc_destroyWeak(&v93);
      objc_destroyWeak(&location);
    }
    else
    {
      CWFGetOSLog();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        CWFGetOSLog();
        v81 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v81 = MEMORY[0x1E0C81028];
        v82 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v95 = 67109120;
        LODWORD(v96) = objc_msgSend_processIdentifier(v7, v83, v84, v85, v86);
        _os_log_send_and_compose_impl();
      }

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)__allowXPCConnection:(id)a3 serviceType:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  int v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  BOOL v86;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  unsigned __int8 v92;
  int v93;
  _BYTE v94[34];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v92 = 0;
  if (objc_msgSend_containsObject_(self->_bootArgs, v7, (uint64_t)CFSTR("corewifi_api_enforcement_disable=1"), v8, v9))
  {
    CWFGetOSLog();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v46 = objc_msgSend_processIdentifier(v6, v42, v43, v44, v45);
      sub_1B0634D44(a4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 67109378;
      *(_DWORD *)v94 = v46;
      *(_WORD *)&v94[4] = 2114;
      *(_QWORD *)&v94[6] = v47;
LABEL_27:
      v49 = 1;
      _os_log_send_and_compose_impl();

      goto LABEL_44;
    }
LABEL_28:
    v49 = 1;
    goto LABEL_44;
  }
  if (!objc_msgSend_processIdentifier(v6, v10, v11, v12, v13))
  {
    CWFGetOSLog();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v50 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      sub_1B0634D44(self->_serviceType);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 138543362;
      *(_QWORD *)v94 = v47;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  sub_1B062E5A4(a4, (char *)&v92, v16, v17, v18);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v15, v19, v20, v21, v22))
  {
    v49 = 0;
    goto LABEL_44;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v15 = v15;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v23, (uint64_t)&v88, (uint64_t)v95, 16);
  if (v24)
  {
    v28 = v24;
    v29 = *(_QWORD *)v89;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v89 != v29)
          objc_enumerationMutation(v15);
        objc_msgSend_valueForEntitlement_(v6, v25, *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i), v26, v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_BOOLValue(v31, v32, v33, v34, v35);

        if ((v36 & 1) != 0)
        {
          v49 = 1;
          v40 = v15;
          goto LABEL_43;
        }
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v25, (uint64_t)&v88, (uint64_t)v95, 16);
      if (v28)
        continue;
      break;
    }
  }

  v37 = v92;
  CWFGetOSLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v37)
  {
    if (v38)
    {
      CWFGetOSLog();
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = MEMORY[0x1E0C81028];
      v51 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_msgSend_processIdentifier(v6, v52, v53, v54, v55);
      if (v6)
        objc_msgSend_auditToken(v6, v56, v57, v58, v59);
      sub_1B0643A64();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v66, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B0634D44(a4);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v15, v73, (uint64_t)CFSTR(","), v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 67109890;
      *(_DWORD *)v94 = v60;
      *(_WORD *)&v94[4] = 2114;
      *(_QWORD *)&v94[6] = v71;
      *(_WORD *)&v94[14] = 2114;
      *(_QWORD *)&v94[16] = v72;
      *(_WORD *)&v94[24] = 2114;
      *(_QWORD *)&v94[26] = v76;
      _os_log_send_and_compose_impl();

LABEL_41:
    }
  }
  else
  {
    if (v38)
    {
      CWFGetOSLog();
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = MEMORY[0x1E0C81028];
      v61 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      if (v6)
        objc_msgSend_auditToken(v6, v62, v63, v64, v65);
      sub_1B0643A64();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v77, v78, v79, v80, v81);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B0634D44(a4);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v15, v82, (uint64_t)CFSTR(","), v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 138543874;
      *(_QWORD *)v94 = v71;
      *(_WORD *)&v94[8] = 2114;
      *(_QWORD *)&v94[10] = v72;
      *(_WORD *)&v94[18] = 2114;
      *(_QWORD *)&v94[20] = v85;
      _os_log_send_and_compose_impl();

      goto LABEL_41;
    }
  }
  v49 = 0;
LABEL_43:

LABEL_44:
  if (v92)
    v86 = v49;
  else
    v86 = 1;

  return v86;
}

- (void)XPCConnection:(id)a3 receivedXPCRequest:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  const char *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  if (v11)
  {
    objc_msgSend_XPCListener_XPCConnection_receivedXPCRequest_(v11, v12, (uint64_t)self, (uint64_t)v25, (uint64_t)v6);
  }
  else
  {
    objc_msgSend_response(v6, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_response(v6, v18, v19, v20, v21);
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v23, *MEMORY[0x1E0CB2FE0], 45, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v24, 0);

    }
  }

}

- (CWFXPCListenerDelegate)delegate
{
  return (CWFXPCListenerDelegate *)objc_getProperty(self, a2, 56, 1);
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
  v9 = sub_1B063EAD0;
  v10 = sub_1B063EA30;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06388C0;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)XPCConnections
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
  v9 = sub_1B063EAD0;
  v10 = sub_1B063EA30;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06294C4;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
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
  v9 = sub_1B063EAD0;
  v10 = sub_1B063EA30;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06399D8;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CWFXPCListener)initWithServiceType:(int64_t)a3
{
  CWFXPCListener *v4;
  CWFXPCListener *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *mutexQueue;
  NSMutableArray *v19;
  NSMutableArray *mutableXPCConnections;
  uint64_t v21;
  NSArray *bootArgs;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSXPCListener *XPCListener;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSXPCListener *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSXPCInterface *requestXPCInterface;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSXPCInterface *eventXPCInterface;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)CWFXPCListener;
  v4 = -[CWFXPCListener init](&v45, sel_init);
  v5 = v4;
  v6 = 0;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9)
    goto LABEL_9;
  if (!v4)
    goto LABEL_9;
  v4->_serviceType = a3;
  sub_1B0634D44(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_9;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("com.apple.corewifi.XPC-listener-mutex.%@"), v8, v9, v6);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create(v15, v16);
  mutexQueue = v5->_mutexQueue;
  v5->_mutexQueue = (OS_dispatch_queue *)v17;

  if (!v5->_mutexQueue)
    goto LABEL_9;
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mutableXPCConnections = v5->_mutableXPCConnections;
  v5->_mutableXPCConnections = v19;

  if (!v5->_mutableXPCConnections)
    goto LABEL_9;
  CWFBootArgs();
  v21 = objc_claimAutoreleasedReturnValue();
  bootArgs = v5->_bootArgs;
  v5->_bootArgs = (NSArray *)v21;

  v23 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v27 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6, v25, v26);
  XPCListener = v5->_XPCListener;
  v5->_XPCListener = (NSXPCListener *)v27;

  v32 = v5->_XPCListener;
  if (!v32)
    goto LABEL_9;
  objc_msgSend_setDelegate_(v32, v29, (uint64_t)v5, v30, v31);
  sub_1B063B0B4(a3, (const char *)1, v33, v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  requestXPCInterface = v5->_requestXPCInterface;
  v5->_requestXPCInterface = (NSXPCInterface *)v36;

  if (!v5->_requestXPCInterface
    || (sub_1B062DC4C(a3, v38, v39, v40, v41),
        v42 = objc_claimAutoreleasedReturnValue(),
        eventXPCInterface = v5->_eventXPCInterface,
        v5->_eventXPCInterface = (NSXPCInterface *)v42,
        eventXPCInterface,
        !v5->_eventXPCInterface))
  {
LABEL_9:

    v5 = 0;
  }

  return v5;
}

- (CWFXPCListener)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFXPCListener init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)resume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_resume(self->_XPCListener, a2, v2, v3, v4);
}

- (void)suspend
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_suspend(self->_XPCListener, a2, v2, v3, v4);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *mutexQueue;
  _QWORD block[5];

  objc_msgSend_invalidate(self->_XPCListener, a2, v2, v3, v4);
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E2A9C;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)localXPCClient
{
  CWFXPCConnection *v3;
  const char *v4;
  void *v5;
  CWFXPCClient *v6;
  int64_t serviceType;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *mutexQueue;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  _QWORD block[5];
  id v68;
  _QWORD v69[5];
  id v70;
  id location;
  int v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = [CWFXPCConnection alloc];
  v5 = (void *)objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v3, v4, self->_serviceType, 0, (uint64_t)self->_bootArgs);
  if (v5)
  {
    v6 = [CWFXPCClient alloc];
    serviceType = self->_serviceType;
    objc_msgSend_localXPCProxyConnection(v5, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(v6, v13, serviceType, (uint64_t)v12, v14);

    if (v15)
    {
      objc_msgSend_localXPCProxyConnection(v15, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRemoteXPCProxyConnection_(v5, v21, (uint64_t)v20, v22, v23);

      objc_msgSend_setDelegate_(v5, v24, (uint64_t)self, v25, v26);
      objc_initWeak(&location, v5);
      v27 = MEMORY[0x1E0C809B0];
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = sub_1B06E2ED0;
      v69[3] = &unk_1E6135418;
      objc_copyWeak(&v70, &location);
      v69[4] = self;
      objc_msgSend_setInvalidationHandler_(v5, v28, (uint64_t)v69, v29, v30);
      CWFGetOSLog();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        CWFGetOSLog();
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v33 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_processName(v5, v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v5, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v43, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v48, v49, 5, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 138543618;
        v73 = v38;
        v74 = 2114;
        v75 = v52;
        _os_log_send_and_compose_impl();

      }
      objc_msgSend_resume(v5, v53, v54, v55, v56);
      mutexQueue = self->_mutexQueue;
      block[0] = v27;
      block[1] = 3221225472;
      block[2] = sub_1B06E2FB4;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v58 = v5;
      v68 = v58;
      dispatch_async(mutexQueue, block);

      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
      objc_msgSend_delegate(self, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_XPCListener_addedXPCConnection_(v63, v64, (uint64_t)self, (uint64_t)v58, v65);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)XPCConnection:(id)a3 canceledXPCRequestsWithUUID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v11)
    objc_msgSend_XPCListener_XPCConnection_canceledXPCRequestsWithUUID_(v11, v12, (uint64_t)self, (uint64_t)v14, (uint64_t)v6);

}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSXPCListener)XPCListener
{
  return self->_XPCListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_bootArgs, 0);
  objc_storeStrong((id *)&self->_eventXPCInterface, 0);
  objc_storeStrong((id *)&self->_requestXPCInterface, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_mutableXPCConnections, 0);
  objc_storeStrong((id *)&self->_XPCListener, 0);
}

@end
