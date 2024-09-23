@implementation COMessagingService

+ (id)serviceWithDelegate:(id)a3
{
  id v3;
  COServiceListenerProvider *v4;
  COMessagingAddOnProvider *v5;
  COMessagingService *v6;

  v3 = a3;
  v4 = -[COServiceListenerProvider initWithServiceName:entitlement:]([COServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.coordination.messaging"), CFSTR("com.apple.private.coordination.messaging"));
  v5 = objc_alloc_init(COMessagingAddOnProvider);
  v6 = -[COMessagingService initWithListenerProvider:addOnProvider:delegate:]([COMessagingService alloc], "initWithListenerProvider:addOnProvider:delegate:", v4, v5, v3);

  return v6;
}

- (COMessagingService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  COMessagingService *v5;
  uint64_t v6;
  NSMutableDictionary *connectedClients;
  uint64_t v8;
  NSMutableDictionary *requestHandlers;
  uint64_t v10;
  NSMutableDictionary *outstandingActivateCompletionHandlers;
  _COMessagingServiceMeter *v12;
  _COMessagingServiceMeter *meter;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  COMessagingService *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)COMessagingService;
  v5 = -[COService initWithListenerProvider:addOnProvider:delegate:](&v20, sel_initWithListenerProvider_addOnProvider_delegate_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    connectedClients = v5->_connectedClients;
    v5->_connectedClients = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    requestHandlers = v5->_requestHandlers;
    v5->_requestHandlers = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    outstandingActivateCompletionHandlers = v5->_outstandingActivateCompletionHandlers;
    v5->_outstandingActivateCompletionHandlers = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(_COMessagingServiceMeter);
    meter = v5->_meter;
    v5->_meter = v12;

    COCoreLogForCategory(10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[_COMessagingServiceMeter limits](v5->_meter, "limits");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v22 = v5;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p limiting %@", buf, 0x16u);

    }
    -[_COMessagingServiceMeter peaks](v5->_meter, "peaks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      COCoreLogForCategory(10);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v22 = v5;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%p evaluating sizing for %@", buf, 0x16u);
      }

    }
    -[COService _serviceReady](v5, "_serviceReady");

  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)COMessagingService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v14, sel__configureServiceInterfacesOnConnection_, v4);
  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = &unk_254E1ED00;
  objc_msgSend(v5, "interfaceWithProtocol:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0, v14.receiver, v14.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken_, 4, 0);
  objc_msgSend(v7, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x24BDAD000], sel_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken_, 5, 0);
  objc_msgSend(v4, "setExportedInterface:", v7);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_sessionStartedForSubTopic_withMember_produced_, 1, 0);
  objc_msgSend(v4, "setExportedInterface:", v7);
  objc_msgSend(v4, "setExportedObject:", self);
  v12 = &unk_254E2D700;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRemoteObjectInterface:", v13);
}

- (void)_clientLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  COMessagingRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  COMessagingService *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  int v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  COMessagingService *v49;
  id obj;
  NSObject *group;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  NSObject *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  COMessagingService *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMessagingService connectedClients](self, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v4;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(10);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v73 = self;
    v74 = 1024;
    LODWORD(v75) = objc_msgSend(v9, "processIdentifier");
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p Lost client %d", buf, 0x12u);

  }
  objc_msgSend(v6, "topic");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cluster");
  v10 = objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v48 = (void *)v10;
  v49 = self;
  -[COService _addOnForCluster:](self, "_addOnForCluster:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v6, "sessions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v56 = v6;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v57)
  {
    v54 = *(_QWORD *)v69;
    v53 = *MEMORY[0x24BE19C98];
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v69 != v54)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v6, "sessions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "member");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v53, -1211, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E50]), "initWithCommandType:error:topic:subTopic:", 2, v17, v60, v13);
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "producedSession") & 1) != 0)
          objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForConsumerWithSubTopic:", v13);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForProducerWithSubTopic:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[COMessagingRequest initWithRequestID:requestType:payload:payloadType:topic:]([COMessagingRequest alloc], "initWithRequestID:requestType:payload:payloadType:topic:", arc4random(), 0, v19, v20, v60);
        if (v11)
        {
          dispatch_group_enter(group);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v16);
          v59 = v19;
          v22 = v18;
          v23 = v17;
          v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __34__COMessagingService__clientLost___block_invoke;
          v66[3] = &unk_24D4B3538;
          v67 = group;
          objc_msgSend(v11, "sendRequest:members:withCompletionHandler:", v21, v25, v66);

          v16 = v24;
          v17 = v23;
          v18 = v22;
          v19 = v59;

        }
        v6 = v56;
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    }
    while (v57);
  }

  v26 = dispatch_walltime(0, 10000000000);
  dispatch_group_wait(group, v26);
  v27 = v49;
  -[COMessagingService requestHandlers](v49, "requestHandlers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v48;
  objc_msgSend(v28, "objectForKey:", v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", v60);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v58 = v11;
    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v55 = v31;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v63 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v33, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqual:", v52);

          if (v40)
          {
            COCoreLogForCategory(10);
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              v73 = v49;
              v74 = 2112;
              v75 = v52;
              v76 = 2112;
              v77 = v38;
              _os_log_impl(&dword_215E92000, v41, OS_LOG_TYPE_DEFAULT, "%p Lost client %@ which had a request handler registered for class of type %@", buf, 0x20u);
            }

            objc_msgSend(v32, "removeObjectForKey:", v38);
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      }
      while (v35);
    }

    v42 = objc_msgSend(v32, "count");
    v27 = v49;
    -[COMessagingService requestHandlers](v49, "requestHandlers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v48;
    objc_msgSend(v43, "objectForKey:", v48);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v42)
    {
      objc_msgSend(v44, "setObject:forKey:", v32, v60);
      v6 = v56;
    }
    else
    {
      objc_msgSend(v44, "removeObjectForKey:", v60);

      -[COMessagingService requestHandlers](v49, "requestHandlers");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKey:", v48);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v56;
      if (objc_msgSend(v43, "count"))
      {
        v11 = v58;
        v31 = v55;
        goto LABEL_32;
      }
      -[COMessagingService requestHandlers](v49, "requestHandlers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeObjectForKey:", v48);
    }
    v11 = v58;
    v31 = v55;

LABEL_32:
  }
  -[COService _releaseAssertionForCluster:](v27, "_releaseAssertionForCluster:", v29);
  -[COMessagingService connectedClients](v27, "connectedClients");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "removeObjectForKey:", v52);

  v61.receiver = v27;
  v61.super_class = (Class)COMessagingService;
  -[COService _clientLost:](&v61, sel__clientLost_, v52);

}

void __34__COMessagingService__clientLost___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)activateMessageChannelForTopic:(id)a3 cluster:(id)a4 handlers:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  COMessagingClientInfo *v16;
  id v17;
  COMessagingClientInfo *v18;
  _QWORD v19[4];
  id v20;
  COMessagingClientInfo *v21;
  id v22;
  uint8_t buf[4];
  COMessagingService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  COCoreLogForCategory(10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v24 = self;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p Activate message channel for topic %@ and cluster %@ with handlers %@", buf, 0x2Au);
  }

  -[COService currentClient](self, "currentClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[COMessagingClientInfo initWithTopic:cluster:handledClasses:client:activateCompletionHanlder:]([COMessagingClientInfo alloc], "initWithTopic:cluster:handledClasses:client:activateCompletionHanlder:", v10, v11, v12, v15, v13);
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v11);
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__COMessagingService_activateMessageChannelForTopic_cluster_handlers_withCompletion___block_invoke;
  v19[3] = &unk_24D4B3560;
  objc_copyWeak(&v22, (id *)buf);
  v17 = v11;
  v20 = v17;
  v18 = v16;
  v21 = v18;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v17, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

void __85__COMessagingService_activateMessageChannelForTopic_cluster_handlers_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "_completeActivationForClient:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      COCoreLogForCategory(10);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v14 = 134218242;
        v15 = v5;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p Cluster %@ is currently unavailable. Channel activation will wait for cluster availability", (uint8_t *)&v14, 0x16u);
      }

      objc_msgSend(v5, "outstandingActivateCompletionHandlers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "outstandingActivateCompletionHandlers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v12, *(_QWORD *)(a1 + 32));

    }
  }

}

- (void)_completeActivationForClient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id obj;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "completionHandler");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompletionHandler:", 0);
    -[COMessagingService meter](self, "meter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientBundleIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topic");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cluster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessagingService connectedClients](self, "connectedClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v5;
    objc_msgSend(v8, "setObject:forKey:", v4, v5);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = v4;
    v9 = v4;
    v10 = (void *)v6;
    objc_msgSend(v9, "handledClasses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    v40 = (void *)v6;
    if (v11)
    {
      v12 = v11;
      v41 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[COMessagingService requestHandlers](self, "requestHandlers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", v14);
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v29 = (void *)v19;
                COCoreLogForCategory(10);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  -[COMessagingService _completeActivationForClient:].cold.1((uint64_t)self, v14, v30);

                v31 = (void *)MEMORY[0x24BDD1540];
                v32 = *MEMORY[0x24BE19C88];
                v47 = *MEMORY[0x24BE19C90];
                v48 = v14;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, -1100, v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                v27 = (void *)v35;
                v26 = v36;
                v28 = (void *)v37;
                (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v37 + 16))(v37, v34, objc_msgSend(v36, "sendLimitForIdentifier:", v35), objc_msgSend(v36, "receiveLimitForIdentifier:", v35));

                goto LABEL_20;
              }
              -[COMessagingService requestHandlers](self, "requestHandlers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v7);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", v10);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22;
              v24 = v42;
              v25 = v14;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v42, v14);
              -[COMessagingService requestHandlers](self, "requestHandlers");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", v7);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (uint64_t)v10;
              v23 = v22;
              v24 = v20;
            }
            objc_msgSend(v22, "setObject:forKey:", v24, v25);

            v10 = v40;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKey:", v42, v14);
            objc_msgSend(v18, "setObject:forKey:", v20, v10);
            -[COMessagingService requestHandlers](self, "requestHandlers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v18, v7);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v12)
          continue;
        break;
      }
    }

    v27 = (void *)v35;
    v26 = v36;
    v28 = (void *)v37;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 16))(v37, 0, objc_msgSend(v36, "sendLimitForIdentifier:", v35), objc_msgSend(v36, "receiveLimitForIdentifier:", v35));
LABEL_20:
    v4 = v38;
    v5 = v42;

  }
}

- (void)sendRequestWithPayload:(id)a3 payloadType:(id)a4 requestType:(int64_t)a5 requestID:(unsigned int)a6 members:(id)a7 activityToken:(id)a8
{
  uint64_t v10;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  COMessagingRequest *v20;
  void *v21;
  COMessagingRequest *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD *v50;
  id v51;
  int v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  id location;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _BYTE *v65;
  _QWORD *v66;
  _QWORD *v67;
  int64_t v68;
  uint64_t v69;
  _QWORD v70[3];
  uint64_t v71;
  _QWORD v72[4];
  _QWORD v73[5];
  id v74;
  id v75;
  int v76;
  _QWORD v77[5];
  id v78;
  id v79;
  int v80;
  _BYTE buf[38];
  __int16 v82;
  id v83;
  uint64_t v84;

  v10 = *(_QWORD *)&a6;
  v84 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v44 = a4;
  v43 = a7;
  v40 = a8;
  COCoreLogForCategory(10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = a5;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v44;
    v82 = 2112;
    v83 = v43;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p Service got request %u of type %ld and payload type %@ directed to members %@", buf, 0x30u);
  }

  -[COService currentClient](self, "currentClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessagingService connectedClients](self, "connectedClients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "cluster");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _addOnForCluster:](self, "_addOnForCluster:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "connection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessagingService meter](self, "meter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "clientIdentifier:canSendLength:", v19, objc_msgSend(v46, "length")) & 1) != 0)
  {
    if (v42)
    {
      v20 = [COMessagingRequest alloc];
      objc_msgSend(v45, "topic");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[COMessagingRequest initWithRequestID:requestType:payload:payloadType:topic:](v20, "initWithRequestID:requestType:payload:payloadType:topic:", v10, a5, v46, v44, v21);

      if (v40)
      {
        v23 = (void *)nw_activity_create_from_xpc_token();
        +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 5, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          goto LABEL_16;
      }
      else
      {
        +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 5, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
LABEL_16:
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          *(_QWORD *)&buf[24] = 0;
          v72[0] = 0;
          v72[1] = v72;
          v72[2] = 0x2020000000;
          v72[3] = 0;
          v70[0] = 0;
          v70[1] = v70;
          v70[2] = 0x2020000000;
          v71 = 0;
          v71 = objc_msgSend(v43, "count");
          v31 = objc_msgSend(v46, "length");
          v61[0] = MEMORY[0x24BDAC760];
          v61[1] = 3221225472;
          v61[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_100;
          v61[3] = &unk_24D4B35B0;
          v65 = buf;
          v66 = v72;
          v67 = v70;
          v39 = v24;
          v62 = v39;
          v68 = a5;
          v69 = v31;
          v63 = v44;
          v32 = v15;
          v64 = v32;
          v33 = (void *)MEMORY[0x2199F3D40](v61);
          objc_initWeak(&location, self);
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2;
          v53[3] = &unk_24D4B3600;
          v34 = v33;
          v57 = v34;
          objc_copyWeak(&v58, &location);
          v54 = v18;
          v55 = v19;
          v59 = v10;
          v35 = v32;
          v56 = v35;
          v36 = (void *)MEMORY[0x2199F3D40](v53);
          if (a5 == 1)
          {
            v47[0] = MEMORY[0x24BDAC760];
            v47[1] = 3221225472;
            v47[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_109;
            v47[3] = &unk_24D4B3650;
            v50 = v70;
            v49 = v34;
            objc_copyWeak(&v51, &location);
            v48 = v35;
            v52 = v10;
            objc_msgSend(v42, "broadcastRequest:recipientsCallback:completionHandler:", v22, v47, v36, v39);

            objc_destroyWeak(&v51);
          }
          else if (!a5)
          {
            objc_msgSend(v42, "sendRequest:members:withCompletionHandler:", v22, v43, v36, v39);
          }

          objc_destroyWeak(&v58);
          objc_destroyWeak(&location);

          _Block_object_dispose(v70, 8);
          _Block_object_dispose(v72, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_21;
        }
      }
      -[COMeshRequest setActivity:](v22, "setActivity:", v24);
      nw_activity_activate();
      goto LABEL_16;
    }
    COCoreLogForCategory(10);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[COMessagingService sendRequestWithPayload:payloadType:requestType:requestID:members:activityToken:].cold.1((uint64_t)self, v45, v28);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19C70], -2001, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_98;
    v73[3] = &unk_24D4B3588;
    v73[4] = self;
    v74 = v29;
    v75 = v41;
    v76 = v10;
    v22 = v29;
    objc_msgSend(v75, "remoteObjectProxyWithErrorHandler:", v73);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "failedToSendRequestWithID:withError:", v10, v22);

  }
  else
  {
    COCoreLogForCategory(10);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_msgSend(v46, "length");
      v38 = objc_msgSend(v18, "sendLimitForIdentifier:", v19);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v38;
      _os_log_error_impl(&dword_215E92000, v25, OS_LOG_TYPE_ERROR, "%p Service got a request of size %ld which is greater than max allowable size limit %ld", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19C88], -1102, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke;
    v77[3] = &unk_24D4B3588;
    v77[4] = self;
    v78 = v26;
    v79 = v41;
    v80 = v10;
    v22 = v26;
    objc_msgSend(v79, "remoteObjectProxyWithErrorHandler:", v77);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "failedToSendRequestWithID:withError:", v10, v22);

  }
LABEL_21:

}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke()
{
  NSObject *v0;

  COCoreLogForCategory(10);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1();

}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_98()
{
  NSObject *v0;

  COCoreLogForCategory(10);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1();

}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_100(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  xpc_object_t xdict;

  if (a2)
    v4 = *(_QWORD *)(a1 + 64);
  else
    v4 = *(_QWORD *)(a1 + 56);
  ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24)
                                                                    + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 24)
    && *(_QWORD *)(a1 + 32))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    if (xdict)
    {
      xpc_dictionary_set_int64(xdict, "type", *(_QWORD *)(a1 + 80));
      xpc_dictionary_set_uint64(xdict, "size", *(_QWORD *)(a1 + 88));
      xpc_dictionary_set_string(xdict, "command", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "bundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(xdict, "client", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      if (!v5)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3;
    v14[3] = &unk_24D4B35D8;
    v15 = v9;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = v12;
    v22 = *(_DWORD *)(a1 + 72);
    v19 = v8;
    v20 = *(id *)(a1 + 48);
    v21 = v10;
    dispatch_async(v13, v14);

  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)();
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  int v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  _BYTE v43[14];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "clientIdentifier:canReceiveLength:", v4, objc_msgSend(v5, "length"));

  if ((v3 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    COCoreLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v2, "payload");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");
      v28 = objc_msgSend(*(id *)(a1 + 40), "receiveLimitForIdentifier:", *(_QWORD *)(a1 + 48));
      v29 = *(_DWORD *)(a1 + 88);
      *(_DWORD *)buf = 134218752;
      v39 = v25;
      v40 = 2048;
      v41 = v27;
      v42 = 2048;
      *(_QWORD *)v43 = v28;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)&v43[10] = v29;
      _os_log_error_impl(&dword_215E92000, v7, OS_LOG_TYPE_ERROR, "%p Response message is too big (%ld > %ld) for request ID %u", buf, 0x26u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19C88], -1103, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  COCoreLogForCategory(10);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_DWORD *)(a1 + 88);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218754;
    v39 = v11;
    v40 = 2112;
    v41 = v9;
    v42 = 1024;
    *(_DWORD *)v43 = v10;
    *(_WORD *)&v43[4] = 2112;
    *(_QWORD *)&v43[6] = v12;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p Received response %@ for request %u from node %@", buf, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 64), "memberSnapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_107;
  v33 = &unk_24D4B3588;
  v34 = *(_QWORD *)(a1 + 56);
  v15 = v14;
  v35 = v15;
  v36 = *(id *)(a1 + 64);
  v37 = *(_DWORD *)(a1 + 88);
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v6)
  {
    objc_msgSend(v16, "receivedResponseForRequestID:responsePayload:responseType:responseError:fromMember:", *(unsigned int *)(a1 + 88), 0, 0, v6, v13, v30, v31, v32, v33, v34, v35);
  }
  else
  {
    v18 = *(id *)(a1 + 80);
    v19 = *(void **)(a1 + 80);
    if (v19)
    {
      objc_msgSend(v19, "domain", v30, v31, v32, v33, v34, v35);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v20 == CFSTR("COMeshControllerErrorDomain")
        && (unint64_t)(objc_msgSend(*(id *)(a1 + 80), "code") + 4101) <= 1)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19C88], -1109, 0);
        v21 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v21;
      }
    }
    v22 = *(unsigned int *)(a1 + 88);
    objc_msgSend(v2, "payload", v30, v31, v32, v33, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "payloadType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "receivedResponseForRequestID:responsePayload:responseType:responseError:fromMember:", v22, v23, v24, v18, v13);

  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_107()
{
  NSObject *v0;

  COCoreLogForCategory(10);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_107_cold_1();

}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  int v11;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2_110;
    v7[3] = &unk_24D4B3628;
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v3;
    v11 = *(_DWORD *)(a1 + 64);
    dispatch_async(v6, v7);

  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2_110(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_111;
  v16[3] = &unk_24D4B3588;
  v16[4] = *(_QWORD *)(a1 + 40);
  v3 = v2;
  v17 = v3;
  v18 = *(id *)(a1 + 48);
  v19 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 48);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "memberSnapshot", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "receivedRecipientListForRequestID:recipients:", *(unsigned int *)(a1 + 56), v5);
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_111()
{
  NSObject *v0;

  COCoreLogForCategory(10);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_111_cold_1();

}

- (void)sessionStartedForSubTopic:(id)a3 withMember:(id)a4 produced:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  COMessagingSessionInfo *v12;
  void *v13;
  id v14;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[COService currentClient](self, "currentClient");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessagingService connectedClients](self, "connectedClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[COMessagingSessionInfo initWithSubTopic:member:produced:]([COMessagingSessionInfo alloc], "initWithSubTopic:member:produced:", v9, v8, v5);
  objc_msgSend(v11, "sessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v9);

}

- (void)sessionEndedForSubTopic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[COService currentClient](self, "currentClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessagingService connectedClients](self, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "sessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (void)addOn:(id)a3 receivedRequest:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COMessagingService *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke;
  v15[3] = &unk_24D4B0EC8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  COCoreLogForCategory(10);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "payloadType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v57 = v4;
    v58 = 2112;
    v59 = v2;
    v60 = 2112;
    v61 = v5;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p Received a request %@ of type %@", buf, 0x20u);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_clustersForAddOn:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v51;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "requestHandlers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "topic");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "payloadType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {

          objc_msgSend(v16, "connection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = MEMORY[0x24BDAC760];
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_115;
          v46[3] = &unk_24D4B3678;
          v46[4] = *(_QWORD *)(a1 + 40);
          v28 = v16;
          v47 = v28;
          v29 = v2;
          v48 = v29;
          v49 = *(id *)(a1 + 56);
          objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v46);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "sender");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "memberSnapshot");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, *(id *)(a1 + 40));
          objc_msgSend(v29, "payload");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "payloadType");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v29, "requestID");
          v42[0] = v27;
          v42[1] = 3221225472;
          v42[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_116;
          v42[3] = &unk_24D4B36C8;
          objc_copyWeak(&v45, (id *)buf);
          v36 = v28;
          v43 = v36;
          v44 = *(id *)(a1 + 56);
          objc_msgSend(v30, "receivedRequestWithPayload:payloadType:requestID:fromMember:withCallback:", v33, v34, v35, v32, v42);

          objc_destroyWeak(&v45);
          objc_destroyWeak((id *)buf);

          goto LABEL_23;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v7)
        continue;
      break;
    }
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "connectedClients", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v39;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v21), "topic");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "topic");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if ((v24 & 1) != 0)
        {
          v25 = -1101;
          goto LABEL_22;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v19)
        continue;
      break;
    }
  }
  v25 = -1114;
LABEL_22:

  v37 = objc_alloc(MEMORY[0x24BDD1540]);
  v36 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", *MEMORY[0x24BE19C88], v25, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_23:

}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_115_cold_1();

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE19C88];
  v9 = *MEMORY[0x24BDD1398];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -1115, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_116(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_2;
    v13[3] = &unk_24D4B36A0;
    v13[4] = v11;
    v14 = a1[4];
    v15 = v7;
    v18 = a1[5];
    v16 = v8;
    v17 = v9;
    dispatch_async(v12, v13);

  }
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  COMessagingResponse *v6;

  objc_msgSend(*(id *)(a1 + 32), "meter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "clientIdentifier:canReceiveLength:", v3, objc_msgSend(*(id *)(a1 + 48), "length"));

  if ((v4 & 1) != 0)
  {
    v6 = objc_alloc_init(COMessagingResponse);
    -[COMessagingResponse setPayload:](v6, "setPayload:", *(_QWORD *)(a1 + 48));
    -[COMessagingResponse setPayloadType:](v6, "setPayloadType:", *(_QWORD *)(a1 + 56));
    (*(void (**)(_QWORD, COMessagingResponse *, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v6, *(_QWORD *)(a1 + 64));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE19C88], -1103, 0);
    v6 = (COMessagingResponse *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, COMessagingResponse *))(v5 + 16))(v5, 0, v6);
  }

}

- (void)_addOnAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  COMessagingService *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  v19 = v4;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(10);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v35 = self;
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p Add-on added for clusters %@", buf, 0x16u);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v7;
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        -[COMessagingService outstandingActivateCompletionHandlers](self, "outstandingActivateCompletionHandlers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              COCoreLogForCategory(10);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v35 = self;
                v36 = 2112;
                v37 = v8;
                _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%p Invoking clients waiting on message channel activation for cluster %@", buf, 0x16u);
              }

              -[COMessagingService _completeActivationForClient:](self, "_completeActivationForClient:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

        if (v11)
        {
          -[COMessagingService outstandingActivateCompletionHandlers](self, "outstandingActivateCompletionHandlers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v8);

        }
        v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

}

- (void)_addOnRemoved:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  COMessagingService *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(10);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p Add-on removed for clusters %@", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)_applicableToCluster:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "requiredServices") >> 3) & 1;

  return v4;
}

- (NSMutableDictionary)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
  objc_storeStrong((id *)&self->_connectedClients, a3);
}

- (_COMessagingServiceMeter)meter
{
  return self->_meter;
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandlers, a3);
}

- (NSMutableDictionary)outstandingActivateCompletionHandlers
{
  return self->_outstandingActivateCompletionHandlers;
}

- (void)setOutstandingActivateCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingActivateCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingActivateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_meter, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
}

- (void)_completeActivationForClient:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_4(&dword_215E92000, a3, (uint64_t)a3, "%p Found a client already registered for requests of type %@", (uint8_t *)&v3);
}

- (void)sendRequestWithPayload:(NSObject *)a3 payloadType:requestType:requestID:members:activityToken:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "cluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_4(&dword_215E92000, a3, v6, "%p add-on for cluster %@ doesn't exist on service", (uint8_t *)&v7);

}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_1(v0);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_7(&dword_215E92000, v1, v2, "%p Failed to deliver an error %@ to client (%d) for request ID %u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_107_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_7(&dword_215E92000, v1, v2, "%p Failed to notify client (%d) of response from %@ for request ID %u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_111_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_7(&dword_215E92000, v1, v2, "%p Failed to notify client (%d) of the recipient list %@ for request ID %u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_5_1();
  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(v2 + 32);
  objc_msgSend(*(id *)(v2 + 40), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "processIdentifier");
  v6 = *(_QWORD *)(v1 + 48);
  v7 = 134218498;
  v8 = v3;
  v9 = 1024;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_215E92000, v0, OS_LOG_TYPE_ERROR, "%p Client (%d) lost during the processing of request %@", (uint8_t *)&v7, 0x1Cu);

  OUTLINED_FUNCTION_8();
}

@end
