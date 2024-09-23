@implementation CKDXPCConnectionManager

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CKDXPCConnection *v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  const char *v45;
  int isEqualToString;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  unint64_t v55;
  const __CFString *v56;
  id v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  const char *v64;
  id obj;
  id v67;
  id v68;
  void *context;
  NSObject *v70;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  id location;
  os_activity_scope_state_s state;
  uint8_t v90[128];
  uint8_t buf[4];
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  const __CFString *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v5 = a4;
  context = (void *)MEMORY[0x1C3B83E24]();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v70 = _os_activity_create(&dword_1BE990000, "xpcConnection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v70, &state);
  objc_msgSend_CKXPCDaemonToClientMuxerInterface(MEMORY[0x1E0C95228], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v5, v9, (uint64_t)v8);

  objc_msgSend_CKXPCClientToDaemonMuxerInterface(MEMORY[0x1E0C95228], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedInterface_(v5, v13, (uint64_t)v12);

  v14 = [CKDXPCConnection alloc];
  v16 = (void *)objc_msgSend_initWithXPCConnection_(v14, v15, (uint64_t)v5);
  objc_msgSend_setExportedObject_(v5, v17, (uint64_t)v16);
  objc_initWeak(&location, v16);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v92 = v16;
    _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "New connection from client %@", buf, 0xCu);
  }
  v19 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = sub_1BEA1A970;
  v86[3] = &unk_1E782EF38;
  objc_copyWeak(&v87, &location);
  objc_msgSend_setInterruptionHandler_(v5, v20, (uint64_t)v86);
  v84[0] = v19;
  v84[1] = 3221225472;
  v84[2] = sub_1BEA1AA4C;
  v84[3] = &unk_1E782EF38;
  objc_copyWeak(&v85, &location);
  objc_msgSend_setInvalidationHandler_(v5, v21, (uint64_t)v84);
  v22 = (void *)MEMORY[0x1E0CB34C8];
  v81[0] = v19;
  v81[1] = 3221225472;
  v81[2] = sub_1BE9B7668;
  v81[3] = &unk_1E782EE20;
  v72 = v16;
  v82 = v72;
  v67 = v5;
  v83 = v67;
  objc_msgSend_blockOperationWithBlock_(v22, v23, (uint64_t)v81);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_opt_new();
  objc_msgSend_processScopedClientProxy(v72, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processBinaryName(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_tearDownOperations(self, v32, v33);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend_tearDownOperations(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v77, v99, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v78 != v41)
            objc_enumerationMutation(v36);
          v43 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend_name(v43, v38, v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v44, v45, (uint64_t)v31);

          if (isEqualToString)
            objc_msgSend_addObject_(v25, v38, (uint64_t)v43);
        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v77, v99, 16);
      }
      while (v40);
    }

    objc_sync_exit(obj);
  }
  if (objc_msgSend_count(v25, v32, v33))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v49 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v52 = objc_msgSend_count(v25, v50, v51);
      v55 = objc_msgSend_count(v25, v53, v54);
      v56 = &stru_1E7838F48;
      *(_DWORD *)buf = 138413058;
      v92 = v72;
      v93 = 2112;
      if (v55 > 1)
        v56 = CFSTR("s");
      v94 = v31;
      v95 = 2048;
      v96 = v52;
      v97 = 2112;
      v98 = v56;
      _os_log_impl(&dword_1BE990000, v49, OS_LOG_TYPE_INFO, "Incoming client %@ connection with processBinaryName %@ is waiting to resume its xpc connection. We have %ld existing connection%@ tearing down", buf, 0x2Au);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v57 = v25;
    v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v73, v90, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v74 != v61)
            objc_enumerationMutation(v57);
          objc_msgSend_addDependency_(v24, v59, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j));
        }
        v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v59, (uint64_t)&v73, v90, 16);
      }
      while (v60);
    }

  }
  objc_msgSend_clientConnectionQueue(self, v47, v48);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v63, v64, (uint64_t)v24);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(context);

  return 1;
}

- (NSMutableArray)tearDownOperations
{
  return self->_tearDownOperations;
}

- (NSOperationQueue)clientConnectionQueue
{
  return self->_clientConnectionQueue;
}

+ (id)sharedConnectionManager
{
  if (qword_1ED7026E8 != -1)
    dispatch_once(&qword_1ED7026E8, &unk_1E782EE90);
  return (id)qword_1ED7026E0;
}

+ (void)clouddStarted
{
  uint64_t v2;
  void *v3;

  v2 = os_transaction_create();
  v3 = (void *)qword_1ED700E30;
  qword_1ED700E30 = v2;

}

- (id)initInternal
{
  const char *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char isSystemInstalledBinary;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  dispatch_queue_t v40;
  void *v41;
  dispatch_source_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  dispatch_source_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  objc_super v52;
  uint64_t handler;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  id v57;

  v52.receiver = self;
  v52.super_class = (Class)CKDXPCConnectionManager;
  v4 = -[CKDXPCConnectionManager init](&v52, sel_init);
  if (v4)
  {
    objc_msgSend_enableTransactions(MEMORY[0x1E0CB3B58], v2, v3);
    objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_processType(v7, v8, v9);

    if (v10 > 2)
      v13 = 0;
    else
      v13 = **((id **)&unk_1E782EFF8 + v10);
    objc_msgSend_currentProcess(CKDDaemonProcess, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v14, v15, v16);

    if ((isSystemInstalledBinary & 1) == 0)
    {
      objc_msgSend_stringByAppendingString_(v13, v18, (uint64_t)CFSTR(".debug"));
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v19;
    }
    v20 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v22 = objc_msgSend_initWithMachServiceName_(v20, v21, (uint64_t)v13);
    v23 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v22;

    objc_msgSend_setDelegate_(*((void **)v4 + 1), v24, (uint64_t)v4);
    v25 = objc_opt_new();
    v26 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v25;

    v27 = objc_opt_new();
    v28 = (void *)*((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v27;

    objc_msgSend_setMaxConcurrentOperationCount_(*((void **)v4 + 5), v29, 10);
    v30 = objc_opt_new();
    v31 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v30;

    v32 = objc_opt_new();
    v33 = (void *)*((_QWORD *)v4 + 10);
    *((_QWORD *)v4 + 10) = v32;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_UTILITY, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create("com.apple.cloudkit.connectionManager.statusreport.callback", v35);
    v37 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v36;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v38, QOS_CLASS_UTILITY, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = dispatch_queue_create("com.apple.cloudkit.connectionManager.statusreport", v39);
    v41 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v40;

    v42 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v4 + 8));
    v43 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v42;

    v44 = *((_QWORD *)v4 + 7);
    v45 = MEMORY[0x1E0C809B0];
    handler = MEMORY[0x1E0C809B0];
    v54 = 3221225472;
    v55 = sub_1BE998418;
    v56 = &unk_1E782EFD8;
    v57 = &unk_1E782EEB0;
    dispatch_source_set_event_handler(v44, &handler);

    dispatch_resume(*((dispatch_object_t *)v4 + 7));
    CKGetGlobalQueue();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1DuLL, 0, v46);
    v48 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v47;

    v49 = *((_QWORD *)v4 + 4);
    handler = v45;
    v54 = 3221225472;
    v55 = sub_1BE998418;
    v56 = &unk_1E782EFD8;
    v57 = &unk_1E782EED0;
    dispatch_source_set_event_handler(v49, &handler);

    dispatch_resume(*((dispatch_object_t *)v4 + 4));
    dispatch_get_global_queue(0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v4 + 6) = os_state_add_handler();

  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  intptr_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  objc_msgSend_sighandlerSource(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v4);

  objc_msgSend_statusReportRequestSource(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v7);

  if (objc_msgSend_stateHandle(self, v8, v9))
  {
    objc_msgSend_stateHandle(self, v10, v11);
    os_state_remove_handler();
  }
  while (1)
  {
    objc_msgSend_sighandlerSource(self, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (dispatch_source_testcancel(v14))
      break;
    objc_msgSend_statusReportRequestSource(self, v15, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_source_testcancel(v12);

    if (v13)
      goto LABEL_7;
    usleep(0xAu);
  }

LABEL_7:
  v17.receiver = self;
  v17.super_class = (Class)CKDXPCConnectionManager;
  -[CKDXPCConnectionManager dealloc](&v17, sel_dealloc);
}

- (void)activate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEFAULT, "Activating connection manager", v10, 2u);
  }
  objc_msgSend_xpcListener(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activate(v6, v7, v8);

  v9 = (void *)qword_1ED700E30;
  qword_1ED700E30 = 0;

}

- (void)enumerateConnections:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend_clientConnections(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_clientConnections(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend_copy(v10, v11, v12);

  objc_sync_exit(v7);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA1AFAC;
  v16[3] = &unk_1E782EF88;
  v17 = v4;
  v13 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(v15, v14, (uint64_t)v16);

}

- (id)CKStatusReportArray
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  id v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  void *v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v102;
  id obj;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v4, v5);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_availabilityDescription(v102, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v10, (uint64_t)CFSTR("System Availability: %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v12, (uint64_t)v11);

  objc_msgSend_clientConnections(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v15);
  objc_msgSend_clientConnections(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_copy(v18, v19, v20);

  objc_sync_exit(v15);
  v22 = (void *)MEMORY[0x1E0CB3940];
  v25 = objc_msgSend_count(v21, v23, v24);
  objc_msgSend_stringWithFormat_(v22, v26, (uint64_t)CFSTR("\n%lu connected clients"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = -1;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v21;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v109, v118, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v110;
    v34 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v110 != v33)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend_CKStatusReportArray(v36, v30, v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v38, (uint64_t)v37);

        if (v114[3] == -1)
        {
          v108[0] = v34;
          v108[1] = 3221225472;
          v108[2] = sub_1BEA1B52C;
          v108[3] = &unk_1E782EFB0;
          v108[4] = &v113;
          objc_msgSend_enumerateContainersWithOptions_usingBlock_(v36, v30, 4, v108);
        }
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v109, v118, 16);
    }
    while (v32);
  }

  objc_msgSend_addObject_(v3, v39, (uint64_t)CFSTR("------ Shared Foreground Queue Operations -------"));
  objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operations(v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v45, v46, v47))
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = objc_msgSend_count(v45, v48, v49);
    objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_maxConcurrentOperationCount(v54, v55, v56);
    objc_msgSend_stringWithFormat_(v50, v58, (uint64_t)CFSTR("%lu/%ld {"), v51, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v60, (uint64_t)v59);

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v61 = v45;
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v104, v117, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v105 != v65)
            objc_enumerationMutation(v61);
          objc_msgSend_operationStatusReport_(CKDContainer, v63, *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
            objc_msgSend_addObject_(v3, v67, (uint64_t)v68);

        }
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v63, (uint64_t)&v104, v117, 16);
      }
      while (v64);
    }

    objc_msgSend_addObject_(v3, v69, (uint64_t)CFSTR("}"));
  }
  else
  {
    objc_msgSend_addObject_(v3, v48, (uint64_t)CFSTR("No operations."));
  }
  objc_msgSend_addObject_(v3, v70, (uint64_t)CFSTR("------ Global Configuration Manager -------"));
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKStatusReportArray(v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v77, (uint64_t)v76);

  objc_msgSend_addObject_(v3, v78, (uint64_t)CFSTR("-------------------------------------------"));
  if ((objc_msgSend_availabilityState(v102, v79, v80) & 1) != 0)
  {
    objc_msgSend_existingDefaultContext(CKDLogicalDeviceContext, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_throttleManager(v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKStatusReportArray(v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v89, v90, v91))
    {
      objc_msgSend_addObject_(v3, v92, (uint64_t)&stru_1E7838F48);
      objc_msgSend_addObject_(v3, v93, (uint64_t)CFSTR("------ Active Throttles -------"));
      objc_msgSend_addObject_(v3, v94, (uint64_t)v89);
      objc_msgSend_addObject_(v3, v95, (uint64_t)CFSTR("-------------------------------------------"));
    }

  }
  v96 = (void *)MEMORY[0x1E0CB3940];
  CKStringFromServerEnvironment();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v96, v98, (uint64_t)CFSTR("Cached environment is %@"), v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v100, (uint64_t)v99);

  _Block_object_dispose(&v113, 8);
  return v3;
}

- (void)_dumpStatusReportArrayToOsTrace:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_once_t *v13;
  os_log_t *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_statusReportQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v14 = (os_log_t *)MEMORY[0x1E0C952F0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v17, v16);
        }
        else
        {
          if (*v13 != -1)
            dispatch_once(v13, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v19 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v16;
            _os_log_impl(&dword_1BE990000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v18, (uint64_t)&v20, v26, 16);
    }
    while (v11);
  }

}

- (void)_dumpStatusReportToFileHandle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_statusReportQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_CKStatusReportArray(self, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (void *)MEMORY[0x1C3B83E24]();
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_CKComponentsAndSubcomponentsJoinedByString_(v11, v14, (uint64_t)CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v16, (uint64_t)CFSTR("%@"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dataUsingEncoding_(v17, v18, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v4, v20, (uint64_t)v19);

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v10, (uint64_t)v11);
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  CKTestNotificationPrefix();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v21, v23, (uint64_t)CFSTR("%@%@"), v22, *MEMORY[0x1E0C95418]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (const char *)objc_msgSend_UTF8String(v24, v25, v26);
  notify_post(v27);
  if (!v4)
  {
    objc_msgSend_statusReportCallbacks(self, v28, v29);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend_statusReportCallbacks(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v47, v51, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v32);
          v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend_statusReportCallbackQueue(self, v34, v35);
          v40 = objc_claimAutoreleasedReturnValue();
          dispatch_async(v40, v39);

        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v47, v51, 16);
      }
      while (v36);
    }

    objc_msgSend_statusReportCallbacks(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v43, v44, v45);

    objc_sync_exit(obj);
  }

}

- (void)dumpStatusReportToFileHandle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_statusReportQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA1BA78;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (void)statusReportWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  id aBlock;

  aBlock = a3;
  if (aBlock)
  {
    objc_msgSend_statusReportCallbacks(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    objc_msgSend_statusReportCallbacks(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _Block_copy(aBlock);
    objc_msgSend_addObject_(v9, v11, (uint64_t)v10);

    objc_sync_exit(v6);
  }
  objc_msgSend_statusReportRequestSource(self, v4, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v12, 1uLL);

}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (void)setTearDownOperations:(id)a3
{
  objc_storeStrong((id *)&self->_tearDownOperations, a3);
}

- (OS_dispatch_source)sighandlerSource
{
  return self->_sighandlerSource;
}

- (void)setSighandlerSource:(id)a3
{
  objc_storeStrong((id *)&self->_sighandlerSource, a3);
}

- (void)setClientConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnectionQueue, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (OS_dispatch_source)statusReportRequestSource
{
  return self->_statusReportRequestSource;
}

- (void)setStatusReportRequestSource:(id)a3
{
  objc_storeStrong((id *)&self->_statusReportRequestSource, a3);
}

- (OS_dispatch_queue)statusReportQueue
{
  return self->_statusReportQueue;
}

- (void)setStatusReportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusReportQueue, a3);
}

- (OS_dispatch_queue)statusReportCallbackQueue
{
  return self->_statusReportCallbackQueue;
}

- (void)setStatusReportCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusReportCallbackQueue, a3);
}

- (NSMutableArray)statusReportCallbacks
{
  return self->_statusReportCallbacks;
}

- (void)setStatusReportCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_statusReportCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReportCallbacks, 0);
  objc_storeStrong((id *)&self->_statusReportCallbackQueue, 0);
  objc_storeStrong((id *)&self->_statusReportQueue, 0);
  objc_storeStrong((id *)&self->_statusReportRequestSource, 0);
  objc_storeStrong((id *)&self->_clientConnectionQueue, 0);
  objc_storeStrong((id *)&self->_sighandlerSource, 0);
  objc_storeStrong((id *)&self->_tearDownOperations, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
