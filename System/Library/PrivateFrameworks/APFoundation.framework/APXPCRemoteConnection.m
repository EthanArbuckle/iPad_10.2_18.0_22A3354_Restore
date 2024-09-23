@implementation APXPCRemoteConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfairLock, 0);
  objc_storeStrong((id *)&self->_machService, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (void)connectionInvalidated
{
  APXPCRemoteConnection *v2;
  NSMutableArray *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2->_delegates;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_connectionInvalidated(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5, v6, v7, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v8);
  }

  objc_sync_exit(v2);
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSXPCConnection *v29;
  NSXPCConnection *xpcConnection;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  BOOL v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  NSXPCConnection *v94;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t);
  void *v103;
  id v104;
  _QWORD v105[4];
  id v106;
  uint8_t buf[4];
  id v108;
  __int16 v109;
  APXPCRemoteConnection *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  objc_msgSend_unfairLock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  if (self->_xpcConnection)
  {
LABEL_19:
    objc_msgSend_unlock(v5, v9, v10, v11);
    v94 = self->_xpcConnection;
    goto LABEL_20;
  }
  APLogForCategory(0x32uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v108 = (id)objc_opt_class();
    v109 = 2114;
    v110 = self;
    v13 = v108;
    _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_INFO, "[%{private}@] Creating a new NSXPCConnection for %{public}@", buf, 0x16u);

  }
  objc_msgSend_delegates(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v23 = (void *)objc_opt_class();
    objc_msgSend_machService(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v22, v28, (uint64_t)v27, 4096);
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v29;

    v31 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend_remoteObjectInterface(v21, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceWithProtocol_(v31, v36, (uint64_t)v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      APLogForCategory(0x32uLL);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v108 = v42;
        v43 = v42;
        _os_log_impl(&dword_1CF251000, v41, OS_LOG_TYPE_INFO, "[%{private}@] Extending remote selectors to allow collection classes to pass data.", buf, 0xCu);

      }
      objc_msgSend_extendCollectionClassesForRemoteInterface_(v21, v44, (uint64_t)v38, v45);
    }
    objc_msgSend_setRemoteObjectInterface_(self->_xpcConnection, v39, (uint64_t)v38, v40);
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_exportedInterface(v21, v46, v47, v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        objc_msgSend_exportedObject(v21, v49, v50, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53 == 0;

        if (!v54)
        {
          v58 = (void *)MEMORY[0x1E0CB3B50];
          objc_msgSend_exportedInterface(v21, v55, v56, v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_interfaceWithProtocol_(v58, v60, (uint64_t)v59, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setExportedInterface_(self->_xpcConnection, v63, (uint64_t)v62, v64);

          v65 = (void *)MEMORY[0x1E0CB3B50];
          objc_msgSend_exportedInterface(v21, v66, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_interfaceWithProtocol_(v65, v70, (uint64_t)v69, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            APLogForCategory(0x32uLL);
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              v76 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138477827;
              v108 = v76;
              v77 = v76;
              _os_log_impl(&dword_1CF251000, v75, OS_LOG_TYPE_INFO, "[%{private}@] Extending exported selectors to allow collection classes to pass data.", buf, 0xCu);

            }
            objc_msgSend_extendCollectionClassesForExportedInterface_(v21, v78, (uint64_t)v72, v79);
          }
          objc_msgSend_setExportedInterface_(self->_xpcConnection, v73, (uint64_t)v72, v74);
          objc_msgSend_exportedObject(v21, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setExportedObject_(self->_xpcConnection, v84, (uint64_t)v83, v85);

        }
      }
    }
    objc_initWeak((id *)buf, self);
    v86 = MEMORY[0x1E0C809B0];
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = sub_1CF2842B0;
    v105[3] = &unk_1E8C48630;
    objc_copyWeak(&v106, (id *)buf);
    objc_msgSend_setInterruptionHandler_(self->_xpcConnection, v87, (uint64_t)v105, v88);
    v100 = v86;
    v101 = 3221225472;
    v102 = sub_1CF260D14;
    v103 = &unk_1E8C48630;
    objc_copyWeak(&v104, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_xpcConnection, v89, (uint64_t)&v100, v90);
    objc_msgSend_resume(self->_xpcConnection, v91, v92, v93, v100, v101, v102, v103);
    objc_destroyWeak(&v104);
    objc_destroyWeak(&v106);
    objc_destroyWeak((id *)buf);

    goto LABEL_19;
  }
  APLogForCategory(0x32uLL);
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF251000, v96, OS_LOG_TYPE_ERROR, "There are no known delegates. Returning a nil xpc connection as no one can handle the messages.", buf, 2u);
  }

  objc_msgSend_unlock(v5, v97, v98, v99);
  v94 = 0;
LABEL_20:

  return v94;
}

- (APUnfairLock)unfairLock
{
  return self->_unfairLock;
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)invalidateForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  APLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v30 = 138543362;
    v31 = v4;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Request to invalidate the connection from %{public}@", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend_removeDelegate_(self, v6, (uint64_t)v4, v7);
  if (!self->_numClients)
  {
    APLogForCategory(0x32uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_machService(self, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138478083;
      v31 = v10;
      v32 = 2114;
      v33 = v14;
      _os_log_impl(&dword_1CF251000, v8, OS_LOG_TYPE_INFO, "[%{private}@] No more clients exist for the xpc connection to %{public}@. Invalidating the connection.", (uint8_t *)&v30, 0x16u);

    }
    objc_msgSend_unfairLock(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v18, v19, v20, v21);
    objc_msgSend_invalidate(self->_xpcConnection, v22, v23, v24);
    objc_msgSend_setXpcConnection_(self, v25, 0, v26);
    objc_msgSend_unlock(v18, v27, v28, v29);

  }
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void)removeDelegate:(id)a3
{
  APXPCRemoteConnection *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_removeObject_(v4->_delegates, v5, (uint64_t)v10, v6);
  objc_msgSend_decreaseConnectionCount(v4, v7, v8, v9);
  objc_sync_exit(v4);

}

- (NSString)machService
{
  return self->_machService;
}

- (void)decreaseConnectionCount
{
  APXPCRemoteConnection *obj;

  obj = self;
  objc_sync_enter(obj);
  --obj->_numClients;
  objc_sync_exit(obj);

}

- (APXPCRemoteConnection)initWithDelegate:(id)a3
{
  id v4;
  APXPCRemoteConnection *v5;
  APXPCRemoteConnection *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *machService;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *delegates;
  APUnfairLock *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  APUnfairLock *unfairLock;
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)APXPCRemoteConnection;
  v5 = -[APXPCRemoteConnection init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_numClients = 0;
    v7 = (void *)objc_opt_class();
    objc_msgSend_machService(v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    machService = v6->_machService;
    v6->_machService = (NSString *)v11;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v16;

    v18 = [APUnfairLock alloc];
    v21 = objc_msgSend_initWithOptions_(v18, v19, 0, v20);
    unfairLock = v6->_unfairLock;
    v6->_unfairLock = (APUnfairLock *)v21;

    objc_msgSend_addDelegate_(v6, v23, (uint64_t)v4, v24);
  }

  return v6;
}

+ (id)sharedConnectionFor:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  APXPCRemoteConnection *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  APLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v24 = 138543362;
    v25 = v3;
    _os_log_impl(&dword_1CF251000, v4, OS_LOG_TYPE_INFO, "The shared connection will be used for %{public}@", (uint8_t *)&v24, 0xCu);
  }

  v5 = (void *)objc_opt_class();
  objc_msgSend_machService(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend_connectionForMachService_(v10, v11, (uint64_t)v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16 = v13;
    objc_msgSend_addDelegate_(v13, v14, (uint64_t)v3, v15);
  }
  else
  {
    v17 = [APXPCRemoteConnection alloc];
    v16 = (void *)objc_msgSend_initWithDelegate_(v17, v18, (uint64_t)v3, v19);
    v20 = (void *)objc_opt_class();
    objc_msgSend_addSharedConnection_forMachService_(v20, v21, (uint64_t)v16, (uint64_t)v9);
  }
  v22 = v16;

  return v22;
}

- (void)addDelegate:(id)a3
{
  APXPCRemoteConnection *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_addObject_(v4->_delegates, v5, (uint64_t)v10, v6);
  objc_msgSend_increaseConnectionCount(v4, v7, v8, v9);
  objc_sync_exit(v4);

}

- (void)increaseConnectionCount
{
  APXPCRemoteConnection *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_numClients;
  objc_sync_exit(obj);

}

+ (id)connectionFor:(id)a3
{
  id v3;
  NSObject *v4;
  APXPCRemoteConnection *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  APLogForCategory(0x32uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1CF251000, v4, OS_LOG_TYPE_INFO, "A new connection will be established for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [APXPCRemoteConnection alloc];
  v8 = (void *)objc_msgSend_initWithDelegate_(v5, v6, (uint64_t)v3, v7);

  return v8;
}

- (void)dealloc
{
  void *v3;
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = (void *)objc_opt_class();
  objc_msgSend_removeSharedConnectionForMachService_(v3, v4, (uint64_t)self->_machService, v5);
  v6.receiver = self;
  v6.super_class = (Class)APXPCRemoteConnection;
  -[APXPCRemoteConnection dealloc](&v6, sel_dealloc);
}

+ (void)removeSharedConnectionForMachService:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v3 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v8 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v12, v13, (uint64_t)v15, v14);

  objc_sync_exit(v7);
}

+ (id)connectionForMachService:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v9 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v14, (uint64_t)v3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v16;
}

+ (id)sharedConnections
{
  if (qword_1ED2BC9B0 != -1)
    dispatch_once(&qword_1ED2BC9B0, &unk_1E8C480B0);
  return (id)qword_1ED2BC9A0;
}

+ (void)addSharedConnection:(id)a3 forMachService:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  v11 = (void *)objc_opt_class();
  objc_msgSend_sharedConnections(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v17, (uint64_t)v5);

  objc_sync_exit(v10);
}

- (void)connectionInterrupted
{
  APXPCRemoteConnection *v2;
  NSMutableArray *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2->_delegates;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_connectionInterrupted(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5, v6, v7, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v8);
  }

  objc_sync_exit(v2);
}

- (int)numClients
{
  return self->_numClients;
}

- (void)setNumClients:(int)a3
{
  self->_numClients = a3;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

@end
