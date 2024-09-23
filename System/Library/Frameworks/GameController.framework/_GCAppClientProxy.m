@implementation _GCAppClientProxy

+ (id)clientProxyWithConnection:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConnection:server:", v7, v6);

  return v8;
}

- (id)_initWithConnection:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  _GCAppClientProxy *v9;
  _GCAppClientProxy *v10;
  uint64_t v11;
  NSArray *invalidationHandlers;
  _GCAppClientProxy *v13;
  void *v14;
  uint64_t v15;
  id connectionInvalidationRegistration;
  uint64_t v17;
  id connectionInterruptedRegistration;
  NSObject *v20;
  _QWORD v21[4];
  _GCAppClientProxy *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_GCAppClientProxy;
  v9 = -[_GCAppClientProxy init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a4);
    objc_storeStrong((id *)&v10->_connection, a3);
    v11 = objc_opt_new();
    invalidationHandlers = v10->_invalidationHandlers;
    v10->_invalidationHandlers = (NSArray *)v11;

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __48___GCAppClientProxy__initWithConnection_server___block_invoke;
    v21[3] = &unk_24D2B2B20;
    v13 = v10;
    v22 = v13;
    v14 = (void *)MEMORY[0x2199DEBB0](v21);
    -[_GCIPCIncomingConnection addInvalidationHandler:](v10->_connection, "addInvalidationHandler:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionInvalidationRegistration = v13->_connectionInvalidationRegistration;
    v13->_connectionInvalidationRegistration = (id)v15;

    -[_GCIPCIncomingConnection addInterruptionHandler:](v10->_connection, "addInterruptionHandler:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    connectionInterruptedRegistration = v13->_connectionInterruptedRegistration;
    v13->_connectionInterruptedRegistration = (id)v17;

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[_GCAppClientProxy _initWithConnection:server:].cold.1();

    }
  }

  return v10;
}

- (_GCAppClientProxy)init
{
  -[_GCAppClientProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v5;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCAppClientProxy.m"), 104, CFSTR("%@ is being deallocated, but is still valid."), self);

  }
  -[_GCAppClientProxy _invalidate](self, "_invalidate");
  v6.receiver = self;
  v6.super_class = (Class)_GCAppClientProxy;
  -[_GCAppClientProxy dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  _GCControllerManagerServer *v11;
  id v12;
  void *v13;
  _GCAppClientProxy *v14;
  id v15;
  id v16;
  _GCAppClientProxy *v17;
  NSMapTable *publishedControllerDescriptions;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  GCControllerServiceRemoteClientInterface *v35;
  unint64_t v36;
  _BOOL4 v37;
  int isInternalBuild;
  _GCIPCIncomingConnection *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  _GCIPCIncomingConnection *connection;
  void *v50;
  void *v51;
  void *v52;
  _GCControllerManagerServer *v53;
  id v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE buf[24];
  void *v65;
  _GCAppClientProxy *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (_GCControllerManagerServer *)a4;
  v12 = a5;
  v52 = v12;
  v53 = v11;
  v51 = v10;
  if (self->_server == v11 && objc_msgSend(v10, "isEqualToString:", CFSTR("activeControllerDevices")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = v13;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[_GCAppClientProxy observeValueForKeyPath:ofObject:change:context:].cold.2();

    }
    v54 = objc_alloc_init((Class)&off_254DEBB20);
    v16 = objc_alloc_init((Class)&off_254DEBB20);
    v17 = v14;
    objc_sync_enter(v17);
    publishedControllerDescriptions = v17->_publishedControllerDescriptions;
    if (publishedControllerDescriptions)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v19 = (id)-[NSMapTable copy](publishedControllerDescriptions, "copy");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v61 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v15, "member:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24 == 0;

            if (v25)
            {
              -[NSMapTable objectForKey:](v17->_publishedControllerDescriptions, "objectForKey:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                unk_254DEC4F8(&off_254DEC660, "currentHandler");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void setActiveDevices(_GCAppClientProxy *__strong, NSSet<id<_GCDeviceControllerProviding>> *__strong)");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("GCAppClientProxy.m"), 473, CFSTR("Bug in %s"), "setActiveDevices");

              }
              objc_msgSend(v26, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "addObject:", v27);

              -[NSMapTable removeObjectForKey:](v17->_publishedControllerDescriptions, "removeObjectForKey:", v23);
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        }
        while (v20);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v29 = v15;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v57 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            objc_msgSend(v33, "makeControllerForClient:", v17);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(v16, "addObject:", v34);
              -[NSMapTable setObject:forKey:](v17->_publishedControllerDescriptions, "setObject:forKey:", v34, v33);
            }

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        }
        while (v30);
      }

      objc_sync_exit(v17);
      if (!objc_msgSend(v54, "count") && !objc_msgSend(v16, "count"))
        goto LABEL_36;
      v35 = v17->_controllerServiceClient;
      if (v35)
      {
        v36 = v17->_controllerServiceClientPendingUpdates + 1;
        v17->_controllerServiceClientPendingUpdates = v36;
        if (v36 <= 0x14)
        {
          v37 = v36 == 20;
          isInternalBuild = gc_isInternalBuild();
          if (v37)
          {
            if (isInternalBuild)
            {
              getGCLogger();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                -[_GCAppClientProxy observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)v17, v41, v42, v43, v44, v45, v46, v47);

            }
            -[GCControllerServiceRemoteClientInterface refreshControllers](v35, "refreshControllers");
          }
          else
          {
            if (isInternalBuild)
            {
              getGCLogger();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                connection = v17->_connection;
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = connection;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v16;
                *(_WORD *)&buf[22] = 2112;
                v65 = v54;
                _os_log_debug_impl(&dword_215181000, v48, OS_LOG_TYPE_DEBUG, "Sending published controller changes to remote %@\nIncoming: %@\nOutgoing: %@", buf, 0x20u);
              }

            }
            if (objc_msgSend(v54, "count"))
              -[GCControllerServiceRemoteClientInterface unpublishControllersWithIdentifiers:](v35, "unpublishControllersWithIdentifiers:", v54);
            if (objc_msgSend(v16, "count"))
              -[GCControllerServiceRemoteClientInterface publishControllers:](v35, "publishControllers:", v16);
            if (v17->_controllerServiceClientPendingUpdates == 10)
            {
              v39 = v17->_connection;
              *(_QWORD *)buf = MEMORY[0x24BDAC760];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __setActiveDevices_block_invoke;
              v65 = &unk_24D2B2B20;
              v66 = v17;
              -[_GCIPCIncomingConnection scheduleSendBarrierBlock:](v39, "scheduleSendBarrierBlock:", buf);

            }
          }
        }
      }
    }
    else
    {
      objc_sync_exit(v17);
      v35 = (GCControllerServiceRemoteClientInterface *)v17;
    }

LABEL_36:
    goto LABEL_33;
  }
  v55.receiver = self;
  v55.super_class = (Class)_GCAppClientProxy;
  -[_GCAppClientProxy observeValueForKeyPath:ofObject:change:context:](&v55, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_33:

}

- (id)description
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@%s client.pid: %i, client.bundleIdentifier: %@>"), v3, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)redactedDescription
{
  uint64_t v3;
  unsigned __int8 v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class();
  v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v4 & 1) != 0)
    v5 = " (invalid)";
  else
    v5 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@%s client.pid: %i, client.bundleIdentifier: %@>"), v3, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  unsigned __int8 v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v5 & 1) != 0)
    v6 = " (invalid)";
  else
    v6 = "";
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "processIdentifier");
  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p%s client.pid: %i, client.bundleIdentifier: %@>"), v4, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_invalidate
{
  BOOL *p_invalid;
  unsigned __int8 v3;
  _GCAppClientProxy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _GCAppClientProxy *v10;
  NSMapTable *publishedControllerDescriptions;
  GCControllerServiceRemoteClientInterface *controllerServiceClient;
  void **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  _GCAppClientProxy *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_invalid = &self->_invalid;
  v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    -[_GCAppClientProxy invalidationHandlers](v4, "invalidationHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "App client proxy invalidated: %@", buf, 0xCu);
      }

    }
    v10 = v4;
    objc_sync_enter(v10);
    if (v10->_publishedControllerDescriptions)
    {
      -[_GCControllerManagerServer removeObserver:forKeyPath:context:](v10->_server, "removeObserver:forKeyPath:context:", v10, CFSTR("activeControllerDevices"), 0);
      publishedControllerDescriptions = v10->_publishedControllerDescriptions;
      v10->_publishedControllerDescriptions = 0;

    }
    controllerServiceClient = v10->_controllerServiceClient;
    v10->_controllerServiceClient = 0;

    objc_sync_exit(v10);
    v13 = v10;
    objc_sync_enter(v13);
    +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13[3], "process");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeApplicationFromCanReceiveEventsMonitoring:", objc_msgSend(v15, "processIdentifier"));

    objc_sync_exit(v13);
    v16 = v13[5];
    v13[5] = 0;

    v17 = v13[4];
    v13[4] = 0;

    v18 = v13[3];
    v13 += 3;
    objc_msgSend(v18, "invalidate");
    v19 = *v13;
    *v13 = 0;

  }
}

- (void)pingWithReply:(id)a3
{
  id v3;
  id v4;
  _QWORD activity_block[4];
  id v6;

  v3 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __35___GCAppClientProxy_pingWithReply___block_invoke;
  activity_block[3] = &unk_24D2B4AA8;
  v6 = v3;
  v4 = v3;
  _os_activity_initiate(&dword_215181000, "(App Client) Ping", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)clientCanReceiveEventsDidChange:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  _GCAppClientProxy *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = atomic_load((unsigned __int8 *)&obj->_invalid);
  if ((v4 & 1) == 0)
  {
    +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCIPCIncomingConnection process](obj->_connection, "process");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setApplicationCanReceiveEvents:forPID:", v3, objc_msgSend(v6, "processIdentifier"));

  }
  objc_sync_exit(obj);

}

- (void)connectToControllerServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __64___GCAppClientProxy_connectToControllerServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Controller Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToPlayerIndicatorXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __77___GCAppClientProxy_connectToPlayerIndicatorXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Player Indicator XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToLightXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __67___GCAppClientProxy_connectToLightXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Light XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToAdaptiveTriggersXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __78___GCAppClientProxy_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Adaptive Triggers XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToMotionXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __68___GCAppClientProxy_connectToMotionXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Motion XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToBatteryXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __69___GCAppClientProxy_connectToBatteryXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Battery XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToSettingsXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __70___GCAppClientProxy_connectToSettingsXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Settings XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToGameIntentXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __72___GCAppClientProxy_connectToGameIntentXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'Game Intent XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToSystemGestureXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __75___GCAppClientProxy_connectToSystemGestureXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'System Gesture XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)connectToPhotoVideoXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  _GCAppClientProxy *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __72___GCAppClientProxy_connectToPhotoVideoXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_24D2B5008;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client) Connect 'PhotoVideo XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

+ (id)settingsSuiteName
{
  if (settingsSuiteName_onceToken != -1)
    dispatch_once(&settingsSuiteName_onceToken, &__block_literal_global_32);
  return (id)settingsSuiteName_suiteName;
}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_keyboardMouseTransaction, 0);
  objc_storeStrong((id *)&self->_publishedControllerDescriptions, 0);
  objc_storeStrong((id *)&self->_controllerServiceClient, 0);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[_GCIPCIncomingConnection process](self->_connection, "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  void *v4;
  _GCAppClientProxy *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _GCObservation *v10;
  _GCObservation *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if ((v6 & 1) != 0)
  {
    objc_sync_exit(v5);

    v11 = 0;
  }
  else
  {
    -[_GCAppClientProxy invalidationHandlers](v5, "invalidationHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = (void *)MEMORY[0x2199DEBB0](v4);
    objc_msgSend(v8, "addObject:", v9);

    -[_GCAppClientProxy setInvalidationHandlers:](v5, "setInvalidationHandlers:", v8);
    objc_sync_exit(v5);

    objc_initWeak(&location, v5);
    v10 = [_GCObservation alloc];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58___GCAppClientProxy_DeviceClient__addInvalidationHandler___block_invoke;
    v13[3] = &unk_24D2B4828;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    v11 = -[_GCObservation initWithCleanupHandler:](v10, "initWithCleanupHandler:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (_GCIPCObjectRegistry)IPCObjectRegistry
{
  return (_GCIPCObjectRegistry *)self->_server;
}

- (_GCIPCServiceRegistry)IPCServiceRegistry
{
  return (_GCIPCServiceRegistry *)self->_server;
}

- (void)fetchControllerDescriptionsWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke;
  activity_block[3] = &unk_24D2B2AD0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(App Client / Controller Service Server) Fetch Controller Descriptions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)playerIndicatorXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Player Indicator XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)lightXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Light XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)adaptiveTriggersXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Adaptive Triggers XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)motionXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Motion XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)batteryXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Battery XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)gameIntentXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / GameIntent XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)systemGestureXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / SystemGesture XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)settingsXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_24D2B5530;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215181000, "(App Client / Settings XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (BOOL)readBooleanValueWithName:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef v6;
  void *v7;
  CFTypeID v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Reading %@ property...", (uint8_t *)&v14, 0xCu);
    }

  }
  v4 = (const __CFString *)*MEMORY[0x24BDBD590];
  v5 = +[_GCAppClientProxy settingsSuiteName](_GCAppClientProxy, "settingsSuiteName");
  v6 = CFPreferencesCopyValue(v3, v5, v4, (CFStringRef)*MEMORY[0x24BDBD588]);
  v7 = (void *)v6;
  if (v6 && ((v8 = CFGetTypeID(v6), v8 == CFBooleanGetTypeID()) || v8 == CFNumberGetTypeID()))
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 0;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = CFSTR("YES");
      v14 = 138412802;
      v15 = v3;
      if (!v7)
        v13 = CFSTR("NO");
      v16 = 1024;
      v17 = v9;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "%@ value is %d. Key exists ? %@", (uint8_t *)&v14, 0x1Cu);
    }

  }
  return v9;
}

- (void)checkEmulatedControllerEnabledWithReply:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", -[_GCAppClientProxy readBooleanValueWithName:](self, "readBooleanValueWithName:", CFSTR("emulatedControllerEnabled")));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (void)checkClipBufferingEnabledWithReply:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", -[_GCAppClientProxy readBooleanValueWithName:](self, "readBooleanValueWithName:", CFSTR("bufferingEnabled")));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (void)onVideoRecordingStart:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = -[GCReplayNotificationOptions initRecordingStart]([GCReplayNotificationOptions alloc], "initRecordingStart");
  +[GCNotificationManager sharedInstance](GCNotificationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestNotification:withReply:", v5, v3);

}

- (void)onVideoRecordingStopWithURL:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "onVideoRecordingStopWithURL: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)getRPScreenRecorderClass_softClass_0;
  v14 = getRPScreenRecorderClass_softClass_0;
  if (!getRPScreenRecorderClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v16 = __getRPScreenRecorderClass_block_invoke_0;
    v17 = &unk_24D2B4C40;
    v18 = &v11;
    __getRPScreenRecorderClass_block_invoke_0((uint64_t)&buf);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v8, "sharedRecorder", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveClipToCameraRoll:handler:", v5, v6);

}

- (void)generateURLFor:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *, void *);
  char **v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int isInternalBuild;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, void *))a4;
  v7 = &selRef_stopObservingAllKeyPaths;
  v8 = a3;
  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@_%@.mp4"), v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "Generating URL for: %@", buf, 0xCu);
    }

  }
  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByExpandingTildeInPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  -[NSObject lastPathComponent](v11, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length")
    || (objc_msgSend(v15, "isEqualToString:", CFSTR(".")) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", CFSTR("..")) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSURL fileURLWithPath:isDirectory:](&off_254DF3050, "fileURLWithPath:isDirectory:", v24, 0);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  isInternalBuild = gc_isInternalBuild();
  if (v16)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "Assigning last URL: %@", buf, 0xCu);
      }

    }
    -[_GCControllerManagerServer setLastGeneratedName:directoryHandle:url:](self->_server, "setLastGeneratedName:directoryHandle:url:", v11, 0, v16);
    v18 = v14;
    v19 = v18;
    if (v18)
    {
      v20 = objc_retainAutorelease(v18);
      -[NSObject fileSystemRepresentation](v20, "fileSystemRepresentation");
      v21 = (void *)sandbox_extension_issue_file();
      v22 = gc_isInternalBuild();
      if (v21)
      {
        if (v22)
        {
          getGCLogger();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v20;
            _os_log_impl(&dword_215181000, v27, OS_LOG_TYPE_INFO, "extension token for: %@ was succesfully issued", buf, 0xCu);
          }

          v7 = &selRef_stopObservingAllKeyPaths;
        }
        objc_msgSend(v7[399], "stringWithCString:encoding:", v21, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        free(v21);
        goto LABEL_17;
      }
      if (v22)
      {
        getGCLogger();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[_GCAppClientProxy(GCPhotoVideoXPCProxyService) generateURLFor:withReply:].cold.2();

      }
    }
LABEL_16:
    v23 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (isInternalBuild)
  {
    getGCLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_GCAppClientProxy(GCPhotoVideoXPCProxyService) generateURLFor:withReply:].cold.1();
    goto LABEL_16;
  }
  v23 = 0;
LABEL_18:
  v6[2](v6, v16, v23);

}

- (void)getTheLastGeneratedURLWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, 0, 0, 0, 0);
}

- (void)takeScreenshotWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  objc_class *v5;
  id v6;
  SEL v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void (**)(id, _QWORD))a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Trying to capture a screenshot", (uint8_t *)v10, 2u);
    }

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getSSUIServiceClass_softClass;
  v14 = getSSUIServiceClass_softClass;
  if (!getSSUIServiceClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getSSUIServiceClass_block_invoke;
    v10[3] = &unk_24D2B4C40;
    v10[4] = &v11;
    __getSSUIServiceClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v6 = objc_alloc_init(v5);
  v7 = NSSelectorFromString(CFSTR("showScreenshotUI"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(id, SEL))objc_msgSend(v6, "methodForSelector:", v7))(v6, v7);
    v3[2](v3, 0);
  }
  else
  {
    +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.GameController.gamecontrollerd.screenshot"), 3328, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v3)[2](v3, v8);

  }
}

- (void)_initWithConnection:server:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_20(&dword_215181000, v0, v1, "App client proxy created: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_23();
}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:(uint64_t)a4 change:(uint64_t)a5 context:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_20(&dword_215181000, a2, a3, "Sending published controller refresh request to remote %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_23();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_22(&dword_215181000, v0, v1, "%@ has received new active controller devices: %@");
  OUTLINED_FUNCTION_0_23();
}

@end
