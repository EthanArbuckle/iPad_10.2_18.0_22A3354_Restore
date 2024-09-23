@implementation MGDaemon

- (MGDaemon)initWithTopologyRequestHandler:(id)a3 serviceListenerProvider:(id)a4
{
  id v6;
  id v7;
  MGDaemon *v8;
  MGServiceClientSet *v9;
  MGServiceClientSet *clients;
  uint64_t v11;
  id topologyRequestHandler;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  MGDaemon *v20;
  NSObject *v21;
  uint64_t v22;
  MGDaemon *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  MGGroupsQueryAgent *v29;
  MGGroupsQueryAgent *queryAgent;
  MGGroupsMediator *v31;
  MGGroupsMediator *v32;
  MGGroupsMediator *homekitGroupsMediator;
  NSDictionary *v34;
  NSDictionary *internalQueries;
  uint64_t v36;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v38;
  NSXPCListener *listener;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSXPCListener *v45;
  NSObject *v46;
  MGGroupsQueryAgent *v47;
  NSObject *v48;
  MGGroupsMediator *localGroupsMediator;
  NSObject *v50;
  MGGroupsMediator *v51;
  MGRemoteQueryClientManager *v52;
  MGRemoteQueryClientManager *remoteQueryClient;
  NSObject *v54;
  MGGroupsMediator *v55;
  id v56;
  MGDaemon *v58;
  MGDaemon *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD block[4];
  MGDaemon *v64;
  id v65;
  id v66;
  MGGroupsMediator *v67;
  _QWORD v68[4];
  MGGroupsMediator *v69;
  _QWORD v70[4];
  NSObject *v71;
  MGDaemon *v72;
  id v73;
  objc_super v74;
  uint8_t buf[4];
  MGDaemon *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v74.receiver = self;
  v74.super_class = (Class)MGDaemon;
  v8 = -[MGDaemon init](&v74, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MGServiceClientSet);
    clients = v8->_clients;
    v8->_clients = v9;

    v11 = MEMORY[0x220788584](v6);
    topologyRequestHandler = v8->_topologyRequestHandler;
    v8->_topologyRequestHandler = (id)v11;

    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arguments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "indexOfObject:", CFSTR("--static"));
    v17 = MEMORY[0x24BDAC760];
    v62 = v15;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = v16 + 1;
      if (v16 + 1 < (unint64_t)objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByTrimmingCharactersInSet:");
        v20 = (MGDaemon *)objc_claimAutoreleasedReturnValue();

        if (-[MGDaemon length](v20, "length"))
        {
          MGLogForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v20;
            _os_log_impl(&dword_21CBD2000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to use static groups file at %@", buf, 0xCu);
          }

          v73 = 0;
          v59 = v20;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v20, 0, &v73);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (MGDaemon *)v73;
          v60 = (void *)v22;
          if (v22)
          {
            v24 = (void *)MEMORY[0x24BDD1620];
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v23;
            objc_msgSend(v24, "unarchivedObjectOfClasses:fromData:error:", v25, v22, &v72);
            v26 = objc_claimAutoreleasedReturnValue();
            v58 = v72;

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[NSObject enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", &__block_literal_global_4);
              v17 = MEMORY[0x24BDAC760];
              v70[0] = MEMORY[0x24BDAC760];
              v70[1] = 3221225472;
              v70[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_2;
              v70[3] = &unk_24E0AAE68;
              v71 = v13;
              -[NSObject enumerateKeysAndObjectsUsingBlock:](v71, "enumerateKeysAndObjectsUsingBlock:", v70);
              v27 = v71;
              v20 = v59;
            }
            else
            {
              MGLogForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
              v17 = MEMORY[0x24BDAC760];
              v20 = v59;
              if (v28)
              {
                *(_DWORD *)buf = 138412290;
                v76 = v58;
                _os_log_error_impl(&dword_21CBD2000, v27, OS_LOG_TYPE_ERROR, "Failed to unarchive static groups file (%@)", buf, 0xCu);
              }
            }

            v23 = v58;
          }
          else
          {
            MGLogForCategory(0);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v76 = v23;
              _os_log_error_impl(&dword_21CBD2000, v26, OS_LOG_TYPE_ERROR, "Failed to read static groups file (%@)", buf, 0xCu);
            }
            v20 = v59;
          }

        }
      }
    }
    v29 = -[MGGroupsQueryAgent initWithDelegate:]([MGGroupsQueryAgent alloc], "initWithDelegate:", v8);
    queryAgent = v8->_queryAgent;
    v8->_queryAgent = v29;

    v31 = -[MGGroupsMediator initWithGroupsQueryAgent:]([MGGroupsMediator alloc], "initWithGroupsQueryAgent:", v8->_queryAgent);
    -[MGGroupsMediator setAllowsClientEdits:](v31, "setAllowsClientEdits:", 1);
    objc_storeStrong((id *)&v8->_localGroupsMediator, v31);
    v32 = -[MGGroupsMediator initWithGroupsQueryAgent:]([MGGroupsMediator alloc], "initWithGroupsQueryAgent:", v8->_queryAgent);
    homekitGroupsMediator = v8->_homekitGroupsMediator;
    v8->_homekitGroupsMediator = v32;

    v34 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    internalQueries = v8->_internalQueries;
    v8->_internalQueries = v34;

    objc_storeStrong((id *)&v8->_listenerProvider, a4);
    -[MGServiceListenerProvider dispatchQueue](v8->_listenerProvider, "dispatchQueue");
    v36 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v36;

    -[MGServiceListenerProvider serviceListener](v8->_listenerProvider, "serviceListener");
    v38 = objc_claimAutoreleasedReturnValue();
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v38;

    -[NSXPCListener _setQueue:](v8->_listener, "_setQueue:", v8->_dispatchQueue);
    -[NSXPCListener setDelegate:](v8->_listener, "setDelegate:", v8);
    v40 = v13;
    if (objc_msgSend(v13, "count"))
    {
      -[MGGroupsMediator startActivityWithName:](v31, "startActivityWithName:", CFSTR("Startup"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v17;
      v68[0] = v17;
      v68[1] = 3221225472;
      v68[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_52;
      v68[3] = &unk_24E0AAE68;
      v69 = v31;
      v43 = v40;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v68);

    }
    else
    {
      v43 = v13;
      v42 = v17;
      v41 = 0;
    }
    MGLogForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v8->_listener;
      *(_DWORD *)buf = 134218240;
      v76 = v8;
      v77 = 2048;
      v78 = v45;
      _os_log_impl(&dword_21CBD2000, v44, OS_LOG_TYPE_DEFAULT, "%p created with listener %p", buf, 0x16u);
    }

    MGLogForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v8->_queryAgent;
      *(_DWORD *)buf = 134218240;
      v76 = v8;
      v77 = 2048;
      v78 = v47;
      _os_log_impl(&dword_21CBD2000, v46, OS_LOG_TYPE_DEFAULT, "%p using %p for groups query", buf, 0x16u);
    }

    MGLogForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      localGroupsMediator = v8->_localGroupsMediator;
      *(_DWORD *)buf = 134218240;
      v76 = v8;
      v77 = 2048;
      v78 = localGroupsMediator;
      _os_log_impl(&dword_21CBD2000, v48, OS_LOG_TYPE_DEFAULT, "%p using %p for local groups mediation", buf, 0x16u);
    }

    MGLogForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v8->_homekitGroupsMediator;
      *(_DWORD *)buf = 134218240;
      v76 = v8;
      v77 = 2048;
      v78 = v51;
      _os_log_impl(&dword_21CBD2000, v50, OS_LOG_TYPE_DEFAULT, "%p using %p for HomeKit groups mediation", buf, 0x16u);
    }

    if (_os_feature_enabled_impl())
    {
      v52 = -[MGRemoteQueryClientManager initWithQueryRunner:groupsQueryAgent:]([MGRemoteQueryClientManager alloc], "initWithQueryRunner:groupsQueryAgent:", v8, v8->_queryAgent);
      remoteQueryClient = v8->_remoteQueryClient;
      v8->_remoteQueryClient = v52;

    }
    v54 = v8->_dispatchQueue;
    block[0] = v42;
    block[1] = 3221225472;
    block[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_56;
    block[3] = &unk_24E0AAE90;
    v64 = v8;
    v65 = v7;
    v66 = v41;
    v67 = v31;
    v55 = v31;
    v56 = v41;
    dispatch_async(v54, block);

  }
  return v8;
}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "memberIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_3;
  v5[3] = &unk_24E0AAE40;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (objc_class *)MGClassForGroupIdentifier(v9);
    if (v4)
    {
      v5 = v4;
      v6 = [v4 alloc];
      -[objc_class type](v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithConnectionProvider:type:identifier:name:properties:memberIdentifiers:", 0, v7, v9, &stru_24E0ABFE0, 0, MEMORY[0x24BDBD1A8]);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v9);
    }
  }

}

uint64_t __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGroup:");
}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_56(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".ready"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v3, "UTF8String"));

  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 56), "endActivity:");
}

- (MGDaemon)initWithServiceListenerProvider:(id)a3
{
  return -[MGDaemon initWithTopologyRequestHandler:serviceListenerProvider:](self, "initWithTopologyRequestHandler:serviceListenerProvider:", 0, a3);
}

- (MGDaemon)init
{
  MGServiceListenerProvider *v3;
  MGDaemon *v4;

  v3 = -[MGServiceListenerProvider initWithServiceName:entitlement:]([MGServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.MediaGroups.daemon"), CFSTR("com.apple.MediaGroups.client"));
  v4 = -[MGDaemon initWithTopologyRequestHandler:serviceListenerProvider:](self, "initWithTopologyRequestHandler:serviceListenerProvider:", 0, v3);

  return v4;
}

+ (id)daemonWithTopologyRequestHandler:(id)a3
{
  id v4;
  MGServiceListenerProvider *v5;
  void *v6;

  v4 = a3;
  v5 = -[MGServiceListenerProvider initWithServiceName:entitlement:]([MGServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.MediaGroups.daemon"), CFSTR("com.apple.MediaGroups.client"));
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopologyRequestHandler:serviceListenerProvider:", v4, v5);

  return v6;
}

+ (id)daemon
{
  return objc_alloc_init((Class)a1);
}

- (void)setTopologyRequestHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke;
  v7[3] = &unk_24E0AAF08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__MGDaemon_setTopologyRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x220788584](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  if (*(_QWORD *)(a1 + 40))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(*(id *)(a1 + 32), "clients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke_2;
    v17[3] = &unk_24E0AAEE0;
    v19 = &v20;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateClientsUsingBlock:", v17);

    if (!*((_BYTE *)v21 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "internalQueries");
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "queryAgent", (_QWORD)v13);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "outstandingQueryForIdentifier:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v12, "requiresTopology"))
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

              goto LABEL_13;
            }

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_13:

    }
    _Block_object_dispose(&v20, 8);
  }
}

void __38__MGDaemon_setTopologyRequestHandler___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9[2];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke_3;
  v8[3] = &unk_24E0AAEB8;
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  *(_OWORD *)v9 = v7;
  objc_msgSend(a2, "enumerateQueriesUsingBlock:", v8);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __38__MGDaemon_setTopologyRequestHandler___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "requiresTopology");
  *a3 = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (MGClientService)serviceForIngestion
{
  MGClientService *v3;
  MGClientService *v4;
  MGClientService *serviceForIngestion;
  NSObject *v6;
  int v8;
  MGDaemon *v9;
  __int16 v10;
  MGClientService *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = self->_serviceForIngestion;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE64B90], "clientServiceWithConnectionProvider:", 0);
    v4 = (MGClientService *)objc_claimAutoreleasedReturnValue();
    serviceForIngestion = self->_serviceForIngestion;
    self->_serviceForIngestion = v4;

    v3 = self->_serviceForIngestion;
    MGLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = self;
      v10 = 2048;
      v11 = v3;
      _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p created service %p for ingestion", (uint8_t *)&v8, 0x16u);
    }

  }
  return v3;
}

- (void)groupsQueryAgent:(id)a3 didFindResults:(id)a4 forQuery:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "group");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke;
  v21[3] = &unk_24E0AAE90;
  v21[4] = self;
  v22 = v8;
  v23 = v16;
  v24 = v10;
  v18 = v10;
  v19 = v16;
  v20 = v8;
  dispatch_async(v17, v21);

}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_2;
  v20[3] = &unk_24E0AAF80;
  v24 = &v30;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v21 = v3;
  v22 = v4;
  v25 = &v26;
  v23 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateClientsUsingBlock:", v20);

  if (!*((_BYTE *)v31 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "internalQueries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqual:", v6, (_QWORD)v16))
          {
            objc_msgSend(v7, "objectForKey:", v11);
            v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v12[2](v12, *(_QWORD *)(a1 + 56), 0);
            MGLogForCategory(3);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 134218242;
              v35 = v14;
              v36 = 2112;
              v37 = v11;
              _os_log_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEFAULT, "%p sent update for internal query %@", buf, 0x16u);
            }

            *((_BYTE *)v31 + 24) = 1;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v38, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

    if (!*((_BYTE *)v31 + 24))
      goto LABEL_16;
  }
  if (*((_BYTE *)v27 + 24))
  {
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "queryAgent", (_QWORD)v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeOutstandingQuery:", *(_QWORD *)(a1 + 40));

  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_3;
  v9[3] = &unk_24E0AAF58;
  v14 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v13 = v7;
  v8 = v5;
  objc_msgSend(v8, "enumerateQueriesUsingBlock:", v9);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32) == (_QWORD)v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_4;
    v24[3] = &unk_24E0AAF30;
    v24[4] = *(_QWORD *)(a1 + 48);
    v10 = v7;
    v25 = v10;
    v26 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 72);
    v27 = v11;
    v28 = v12;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_70;
    v19[3] = &unk_24E0AAF30;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 48);
    v20 = v10;
    v21 = v15;
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 72);
    v22 = v16;
    v23 = v17;
    v18 = v10;
    objc_msgSend(v13, "query:didUpdate:completion:", v18, v14, v19);

  }
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  MGLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134218498;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_ERROR, "%p sending query %@ update unsuccessful (%@)", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "removeQuery:", *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  MGLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 134218498;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p sending query %@ update failed (%@)", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "removeQuery:", *(_QWORD *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 134218242;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_DEFAULT, "%p sent update for query %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_ingestHomeKitHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  char isKindOfClass;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  MGDaemon *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  MGDaemon *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  MGDaemon *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  MGDaemon *v89;
  id v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[2];
  uint8_t buf[4];
  MGDaemon *v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGDaemon serviceForIngestion](self, "serviceForIngestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v91[0] = MEMORY[0x24BDAC760];
  v91[1] = 3221225472;
  v91[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke;
  v91[3] = &unk_24E0AAFA8;
  v91[4] = self;
  v9 = v4;
  v92 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v91);

  objc_msgSend(v9, "mediaSystems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v8;
  v86[1] = 3221225472;
  v86[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_2;
  v86[3] = &unk_24E0AAFD0;
  v11 = v5;
  v87 = v11;
  v12 = v9;
  v88 = v12;
  v89 = self;
  v13 = v6;
  v90 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v86);

  objc_msgSend(v12, "rooms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v8;
  v81[1] = 3221225472;
  v81[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_74;
  v81[3] = &unk_24E0AAFF8;
  v15 = v11;
  v82 = v15;
  v16 = v12;
  v83 = v16;
  v84 = self;
  v17 = v13;
  v85 = v17;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v81);

  objc_msgSend(v16, "zones");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v8;
  v76[1] = 3221225472;
  v76[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_77;
  v76[3] = &unk_24E0AB020;
  v19 = v15;
  v77 = v19;
  v20 = v16;
  v78 = v20;
  v79 = self;
  v64 = self;
  v68 = v17;
  v80 = v68;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v76);

  v61 = v19;
  v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE64BB8]), "initWithClientService:home:", v19, v20);
  MGLogForCategory(1);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v95 = self;
    v96 = 2112;
    v97 = v21;
    _os_log_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_DEFAULT, "%p adding home %@", buf, 0x16u);
  }

  v60 = (void *)v21;
  objc_msgSend(v68, "addGroup:", v21);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v20, "accessories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v102, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v73;
    v27 = *MEMORY[0x24BDD49A0];
    v62 = v20;
    v65 = *(_QWORD *)v73;
    v66 = v23;
    v70 = *MEMORY[0x24BDD49A0];
    do
    {
      v28 = 0;
      v67 = v25;
      do
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v28);
        objc_msgSend(v29, "category");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "categoryType");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v27);

        if (v32)
        {
          MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v29, v20);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "audioDestinationController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "destination");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v34)
            v37 = v35 == 0;
          else
            v37 = 1;
          if (v37)
          {
            MGLogForCategory(1);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v95 = v64;
              v96 = 2112;
              v97 = (uint64_t)v33;
              _os_log_impl(&dword_21CBD2000, v38, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@", buf, 0x16u);
            }

            objc_msgSend(v68, "removeGroupWithIdentifier:", v33);
          }
          else
          {
            MGGroupIdentifierForAccessory(v29, v20);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v69 = v33;
            if ((isKindOfClass & 1) != 0)
            {
              v40 = v36;
              objc_msgSend(v40, "home");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "uniqueIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uniqueIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v20;
              v45 = objc_msgSend(v42, "isEqual:", v43);

              if (v45)
              {
                MGGroupIdentifierForAccessory(v40, v44);
                v46 = objc_claimAutoreleasedReturnValue();
                goto LABEL_23;
              }
              MGLogForCategory(1);
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
LABEL_38:
                *(_DWORD *)buf = 134218754;
                v95 = v64;
                v96 = 2112;
                v97 = (uint64_t)v41;
                v98 = 2112;
                v99 = v40;
                v100 = 2112;
                v20 = v62;
                v101 = v62;
                _os_log_error_impl(&dword_21CBD2000, v58, OS_LOG_TYPE_ERROR, "%p the home %@ from audioDestination %@ doesn't match current home %@", buf, 0x2Au);
LABEL_31:
                v23 = v66;
                v25 = v67;

                v26 = v65;
                v33 = v69;
LABEL_32:
                MGLogForCategory(1);
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218498;
                  v95 = v64;
                  v96 = 2112;
                  v97 = (uint64_t)v36;
                  v98 = 2112;
                  v99 = v29;
                  _os_log_error_impl(&dword_21CBD2000, v50, OS_LOG_TYPE_ERROR, "%p couldn't find accessory that the matched media destination %@ for %@. Can't add HomeTheater.", buf, 0x20u);
                }
                goto LABEL_34;
              }
LABEL_30:
              v20 = v62;
              goto LABEL_31;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_32;
            v40 = v36;
            objc_msgSend(v40, "home");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "uniqueIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "uniqueIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v20;
            v49 = objc_msgSend(v47, "isEqual:", v48);

            if (!v49)
            {
              MGLogForCategory(1);
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                goto LABEL_38;
              goto LABEL_30;
            }
            MGGroupIdentifierForMediaSystemInHome(v40, v44);
            v46 = objc_claimAutoreleasedReturnValue();
LABEL_23:
            v50 = v46;
            v20 = v44;

            v23 = v66;
            v25 = v67;
            v26 = v65;
            v33 = v69;
            if (!v50)
              goto LABEL_32;
            v93[0] = v71;
            v93[1] = v50;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(v34, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "UUIDString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKey:", v53, CFSTR("audioDestinationIdentifier"));

            v54 = objc_alloc(MEMORY[0x24BE64BD0]);
            objc_msgSend(v29, "name");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v54, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v61, CFSTR("com.apple.media-group.home-theater"), v69, v55, v51, v63);

            MGLogForCategory(1);
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v95 = v64;
              v96 = 2112;
              v97 = (uint64_t)v56;
              _os_log_impl(&dword_21CBD2000, v57, OS_LOG_TYPE_DEFAULT, "%p adding home theater %@", buf, 0x16u);
            }

            objc_msgSend(v68, "addGroup:", v56);
            v23 = v66;
            v25 = v67;
            v26 = v65;
            v33 = v69;
LABEL_34:

          }
          v27 = v70;
        }
        ++v28;
      }
      while (v25 != v28);
      v59 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v102, 16);
      v25 = v59;
    }
    while (v59);
  }

}

uint64_t __31__MGDaemon__ingestHomeKitHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addHomeKitAccessoryWithoutHomeIngestion:fromHome:", a2, *(_QWORD *)(a1 + 40));
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE64BD8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithClientService:mediaSystem:home:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  MGLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 134218242;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p adding media system %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "addGroup:", v5);
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_74(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE64BF0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithClientService:room:home:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  MGLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 134218242;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p adding room %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "addGroup:", v5);
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_77(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE64C08];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithClientService:zone:home:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  MGLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 134218242;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p adding zone %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "addGroup:", v5);
}

- (void)addHomeKitHome:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startActivityWithName:", CFSTR("Add HomeKit Home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon _ingestHomeKitHome:](self, "_ingestHomeKitHome:", v4);

  objc_msgSend(v6, "endActivity:", v5);
}

- (void)removeHomeKitHome:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  MGDaemon *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MGGroupIdentifierForHomeInHome(v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEFAULT, "%p removing home %@", (uint8_t *)&v8, 0x16u);
    }

    -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeGroupWithIdentifier:](v7, "removeGroupWithIdentifier:", v5);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p no home identifier for %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)addHomeKitZone:(id)a3 fromHome:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startActivityWithName:", CFSTR("Add HomeKit Zone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon _ingestHomeKitHome:](self, "_ingestHomeKitHome:", v5);

  objc_msgSend(v7, "endActivity:", v6);
}

- (void)removeHomeKitZone:(id)a3 fromHome:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  MGDaemon *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  MGGroupIdentifierForZoneInHome(v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p removing zone %@", (uint8_t *)&v10, 0x16u);
    }

    -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeGroupWithIdentifier:](v9, "removeGroupWithIdentifier:", v7);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_error_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_ERROR, "%p no zone identifier for %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)addHomeKitRoom:(id)a3 fromHome:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startActivityWithName:", CFSTR("Add HomeKit Room"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon _ingestHomeKitHome:](self, "_ingestHomeKitHome:", v5);

  objc_msgSend(v7, "endActivity:", v6);
}

- (void)removeHomeKitRoom:(id)a3 fromHome:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  MGDaemon *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  MGGroupIdentifierForRoomInHome(v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p removing room %@", (uint8_t *)&v10, 0x16u);
    }

    -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeGroupWithIdentifier:](v9, "removeGroupWithIdentifier:", v7);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_error_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_ERROR, "%p no room identifier for %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)addHomeKitMediaSystem:(id)a3 fromHome:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startActivityWithName:", CFSTR("Add HomeKit Media System"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon _ingestHomeKitHome:](self, "_ingestHomeKitHome:", v5);

  objc_msgSend(v7, "endActivity:", v6);
}

- (void)removeHomeKitMediaSystem:(id)a3 fromHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  MGDaemon *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startActivityWithName:", CFSTR("Remove HomeKit Media System"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  if (objc_msgSend(v6, "supportsAudioDestination"))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__MGDaemon_removeHomeKitMediaSystem_fromHome___block_invoke;
    v17[3] = &unk_24E0AB048;
    v17[4] = &v18;
    -[MGDaemon _homeTheaterGroupIdentifierForAudioDestination:fromHome:completion:](self, "_homeTheaterGroupIdentifierForAudioDestination:fromHome:completion:", v6, v7, v17);
  }
  v10 = v19[5];
  MGLogForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = (void *)v19[5];
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@ since media system %@ was part of it", buf, 0x20u);
    }

    objc_msgSend(v8, "removeGroupWithIdentifier:", v19[5]);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_DEFAULT, "%p no home theater identifier for %@", buf, 0x16u);
    }

  }
  MGGroupIdentifierForMediaSystemInHome(v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_DEFAULT, "%p removing media system %@", buf, 0x16u);
    }

    objc_msgSend(v8, "removeGroupWithIdentifier:", v14);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_ERROR, "%p no media system identifier for %@", buf, 0x16u);
    }

  }
  objc_msgSend(v8, "endActivity:", v9);

  _Block_object_dispose(&v18, 8);
}

void __46__MGDaemon_removeHomeKitMediaSystem_fromHome___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addHomeKitMediaSystem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MGDaemon addHomeKitMediaSystem:fromHome:](self, "addHomeKitMediaSystem:fromHome:", v4, v5);

}

- (void)removeHomeKitMediaSystem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MGDaemon removeHomeKitMediaSystem:fromHome:](self, "removeHomeKitMediaSystem:fromHome:", v4, v5);

}

- (void)addHomeKitAccessory:(id)a3 fromHome:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startActivityWithName:", CFSTR("Add HomeKit Accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon _ingestHomeKitHome:](self, "_ingestHomeKitHome:", v5);

  objc_msgSend(v7, "endActivity:", v6);
}

- (void)_addHomeKitAccessoryWithoutHomeIngestion:(id)a3 fromHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  MGDaemon *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MGDaemon serviceForIngestion](self, "serviceForIngestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MGGroupIdentifierForAccessory(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)MGClassForGroupIdentifier(v9);
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v6, "deviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v13, CFSTR("deviceIdentifier"));
    }
    else
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v15, CFSTR("deviceIdentifier"));

    }
    if ((objc_class *)objc_opt_class() == v11)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "homePodVariant"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v16, CFSTR("HomePodVariant"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "productColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v17, CFSTR("productColor"));

    }
    v18 = [v11 alloc];
    -[objc_class type](v11, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v8, v19, v9, v20, v12, MEMORY[0x24BDBD1A8]);

    MGLogForCategory(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134218242;
      v27 = self;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_DEFAULT, "%p adding accessory %@", (uint8_t *)&v26, 0x16u);
    }

    if (objc_msgSend(v6, "isCurrentAccessory"))
    {
      -[MGDaemon queryAgent](self, "queryAgent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCurrentDeviceIdentifier:", v24);

    }
    -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addGroup:", v21);

  }
  else
  {
    MGLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134218242;
      v27 = self;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p no accessory class for %@", (uint8_t *)&v26, 0x16u);
    }
  }

}

- (void)removeHomeKitAccessory:(id)a3 fromHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  MGDaemon *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MGDaemon homekitGroupsMediator](self, "homekitGroupsMediator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startActivityWithName:", CFSTR("Remove HomeKit Accessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  objc_msgSend(v6, "audioDestinationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && (objc_msgSend(v6, "category"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "categoryType"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD49A0]),
        v12,
        v11,
        v13))
  {
    MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v6, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v26[5];
    v26[5] = v14;

  }
  else if (objc_msgSend(v6, "supportsAudioDestination"))
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __44__MGDaemon_removeHomeKitAccessory_fromHome___block_invoke;
    v24[3] = &unk_24E0AB048;
    v24[4] = &v25;
    -[MGDaemon _homeTheaterGroupIdentifierForAudioDestination:fromHome:completion:](self, "_homeTheaterGroupIdentifierForAudioDestination:fromHome:completion:", v6, v7, v24);
  }
  v16 = v26[5];
  MGLogForCategory(1);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      v19 = (void *)v26[5];
      *(_DWORD *)buf = 134218498;
      v32 = self;
      v33 = 2112;
      v34 = v19;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@ since accessory %@ was part of it", buf, 0x20u);
    }

    objc_msgSend(v8, "removeGroupWithIdentifier:", v26[5]);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_DEFAULT, "%p no home theater identifier for %@", buf, 0x16u);
    }

  }
  MGGroupIdentifierForAccessory(v6, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(1);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_DEFAULT, "%p removing accessory %@", buf, 0x16u);
    }

    if (objc_msgSend(v6, "isCurrentAccessory"))
    {
      -[MGDaemon queryAgent](self, "queryAgent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCurrentDeviceIdentifier:", 0);

    }
    objc_msgSend(v8, "removeGroupWithIdentifier:", v20);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      v33 = 2112;
      v34 = v6;
      _os_log_error_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_ERROR, "%p no accessory identifier for %@", buf, 0x16u);
    }

  }
  objc_msgSend(v8, "endActivity:", v9);

  _Block_object_dispose(&v25, 8);
}

void __44__MGDaemon_removeHomeKitAccessory_fromHome___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_homeTheaterGroupIdentifierForAudioDestination:(id)a3 fromHome:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v7, "audioDestinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v21 = 0;
    objc_msgSend(v8, "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__MGDaemon__homeTheaterGroupIdentifierForAudioDestination_fromHome_completion___block_invoke;
    v12[3] = &unk_24E0AB070;
    v13 = v10;
    v15 = &v16;
    v14 = v8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

    v9[2](v9, v17[5]);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v9[2](v9, 0);
  }

}

void __79__MGDaemon__homeTheaterGroupIdentifierForAudioDestination_fromHome_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "audioDestinationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioDestinationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v15, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "categoryType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD49A0]) & 1) != 0)
    {
      v11 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

      if (v11)
      {
        MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v15, *(void **)(a1 + 40));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        *a4 = 1;
      }
    }
    else
    {

    }
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  MGServiceClient *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id from;
  id location;
  uint8_t buf[4];
  MGDaemon *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MGLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = self;
    v24 = 1024;
    v25 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p received new connection from %d", buf, 0x12u);
  }

  -[MGDaemon listenerProvider](self, "listenerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "serviceShouldAcceptNewConnection:", v7);
  if (v10)
  {
    MGSetServiceXPCInterfacesOnConnection(v7, 1);
    objc_msgSend(v7, "setExportedObject:", self);
    -[MGDaemon dispatchQueue](self, "dispatchQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v11);

    v12 = -[MGServiceClient initWithConnection:]([MGServiceClient alloc], "initWithConnection:", v7);
    -[MGDaemon clients](self, "clients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addClientService:", v12);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v12);
    objc_initWeak(&from, v7);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_24E0AB0C0;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    v14 = (void *)MEMORY[0x220788584](v16);
    objc_msgSend(v7, "setInterruptionHandler:", v14);
    objc_msgSend(v7, "setInvalidationHandler:", v14);
    objc_msgSend(v7, "resume");

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  return v10;
}

void __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  v5 = v4;
  if (WeakRetained && v3 && v4)
  {
    MGLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "Service %p lost connection from %d", buf, 0x12u);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke_102;
    v8[3] = &unk_24E0AB098;
    v8[4] = WeakRetained;
    objc_msgSend(v3, "enumerateQueriesUsingBlock:", v8);
    objc_msgSend(WeakRetained, "clients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeClientService:", v3);

  }
}

uint64_t __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke_102(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, void *);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MGDaemon *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void (**v48)(id, void *, void *);
  id v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  MGDaemon *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_getAssociatedObject(v14, "com.apple.MediaGroups.ClientService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (qword_25531B968 != -1)
    dispatch_once(&qword_25531B968, &__block_literal_global_104);
  v17 = objc_msgSend((id)_MergedGlobals_1, "objectForKey:", v10);
  if (v17)
  {
    v18 = (void *)v17;
    v51 = v10;
    v19 = self;
    v46 = v16;
    v47 = v15;
    v48 = v13;
    v20 = v11;
    v21 = (void *)MEMORY[0x24BE64B98];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "groupIdentifierWithUUID:", v22);
    v50 = objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v49 = v12;
    v24 = v12;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v53;
      do
      {
        v28 = 0;
        v29 = v23;
        do
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v28), "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "arrayByAddingObject:", v30);
          v23 = (id)objc_claimAutoreleasedReturnValue();

          ++v28;
          v29 = v23;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v26);
    }

    v31 = (void *)v50;
    v11 = v20;
    objc_msgSend(v18, "validateGroupSpecificationWithType:identifier:name:properties:members:", v51, v50, v20, 0, v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      MGLogForCategory(3);
      v33 = objc_claimAutoreleasedReturnValue();
      v16 = v46;
      v15 = v47;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v57 = v19;
        v58 = 2112;
        v59 = v32;
        _os_log_error_impl(&dword_21CBD2000, v33, OS_LOG_TYPE_ERROR, "%p group validation failed: %@", buf, 0x16u);
      }

      v34 = v32;
      v35 = 0;
      v12 = v49;
    }
    else
    {
      v42 = objc_alloc((Class)v18);
      v16 = v46;
      v15 = v47;
      if (v46)
        v43 = objc_msgSend(v42, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v46, v51, v50, v11, 0, v23);
      else
        v43 = objc_msgSend(v42, "initWithConnectionProvider:type:identifier:name:properties:memberIdentifiers:", 0, v51, v50, v11, 0, v23);
      v35 = (void *)v43;
      v12 = v49;
      -[MGDaemon localGroupsMediator](v19, "localGroupsMediator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addGroup:", v35);

      MGLogForCategory(3);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v57 = v19;
        v58 = 2048;
        v59 = v35;
        _os_log_impl(&dword_21CBD2000, v45, OS_LOG_TYPE_DEFAULT, "%p creation complete for %p", buf, 0x16u);
      }

      v31 = (void *)v50;
    }

    v13 = v48;
    v10 = v51;
  }
  else
  {
    v36 = objc_msgSend((id)qword_25531B960, "objectForKey:", v10);
    MGLogForCategory(3);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        *(_DWORD *)buf = 134217984;
        v57 = self;
        _os_log_error_impl(&dword_21CBD2000, v37, OS_LOG_TYPE_ERROR, "%p group type creation not allowed", buf, 0xCu);
      }

      v39 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BE64B70];
      v41 = 1;
    }
    else
    {
      if (v38)
      {
        *(_DWORD *)buf = 134217984;
        v57 = self;
        _os_log_error_impl(&dword_21CBD2000, v37, OS_LOG_TYPE_ERROR, "%p group type creation not supported", buf, 0xCu);
      }

      v39 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BE64B70];
      v41 = 2;
    }
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, v41, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
  }
  v13[2](v13, v35, v32);

}

void __56__MGDaemon_createGroupWithType_name_members_completion___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[11];
  _QWORD v15[13];

  v15[11] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = MEMORY[0x24BDBD1B8];

  objc_msgSend(MEMORY[0x24BE64BF8], "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  v15[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BC8], "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B78], "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v15[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64C00], "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v15[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B80], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v15[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BD8], "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v15[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BF0], "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v15[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64C08], "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v15[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BB8], "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v15[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B90], "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v15[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BD0], "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  v15[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_25531B960;
  qword_25531B960 = v10;

}

- (void)deleteGroup:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = deleteGroup_completion__onceToken;
  v8 = a3;
  if (v7 != -1)
    dispatch_once(&deleteGroup_completion__onceToken, &__block_literal_global_112);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__MGDaemon_deleteGroup_completion___block_invoke_2;
  v10[3] = &unk_24E0AB128;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[MGDaemon _fetchGroupInfo:completion:](self, "_fetchGroupInfo:completion:", v8, v10);

}

void __35__MGDaemon_deleteGroup_completion___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[11];
  _QWORD v15[13];

  v15[11] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)qword_25531B970;
  qword_25531B970 = MEMORY[0x24BDBD1B8];

  objc_msgSend(MEMORY[0x24BE64BF8], "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  v15[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BC8], "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B78], "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v15[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64C00], "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v15[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B80], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v15[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BD8], "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v15[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BF0], "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v15[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64C08], "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v15[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BB8], "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v15[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B90], "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v15[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64BD0], "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  v15[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_25531B978;
  qword_25531B978 = v10;

}

void __35__MGDaemon_deleteGroup_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id location;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  objc_initWeak(&location, a4);
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    MGLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v31 = v15;
      v32 = 2112;
      v33 = v13;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p failed to fetch group for deletion %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!v9)
  {
    MGLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v31 = v18;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p failed to find group for deletion", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v16 = objc_loadWeakRetained(&location);
  v14 = v16;
  if (!v16)
  {
    MGLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v31 = v25;
      _os_log_error_impl(&dword_21CBD2000, v19, OS_LOG_TYPE_ERROR, "%p failed to find source for deletion", buf, 0xCu);
    }

    v14 = 0;
LABEL_14:
    v13 = 0;
    goto LABEL_27;
  }
  if ((-[NSObject allowsClientEdits](v16, "allowsClientEdits") & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)qword_25531B970, "objectForKey:", v17))
    {
      -[NSObject removeGroup:](v14, "removeGroup:", v9);
      v13 = 0;
    }
    else
    {
      v21 = objc_msgSend((id)qword_25531B978, "objectForKey:", v17);
      MGLogForCategory(3);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (v21)
      {
        if (v23)
        {
          v27 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          v31 = v27;
          _os_log_error_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_ERROR, "%p group type deletion not allowed", buf, 0xCu);
        }
        v24 = 7;
      }
      else
      {
        if (v23)
        {
          v28 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          v31 = v28;
          _os_log_error_impl(&dword_21CBD2000, v22, OS_LOG_TYPE_ERROR, "%p group type deletion not supported", buf, 0xCu);
        }
        v24 = 2;
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE64B70], v24, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    MGLogForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v31 = v26;
      _os_log_error_impl(&dword_21CBD2000, v20, OS_LOG_TYPE_ERROR, "%p deletion not allowed by group source", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE64B70], 9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_destroyWeak(&location);

}

- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, void *, void *);
  uint64_t v21;
  objc_class *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  MGDaemon *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v36 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void (**)(id, void *, void *))a9;
  if (qword_25531B990 != -1)
    dispatch_once(&qword_25531B990, &__block_literal_global_114);
  v21 = objc_msgSend((id)qword_25531B980, "objectForKey:", v15);
  if (!v21)
  {
    MGLogForCategory(3);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v38 = self;
      v39 = 2112;
      v40 = v15;
      _os_log_error_impl(&dword_21CBD2000, v31, OS_LOG_TYPE_ERROR, "%p group type %@ not supported", buf, 0x16u);
    }

    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BE64B70];
    v34 = 2;
    goto LABEL_14;
  }
  v22 = (objc_class *)v21;
  objc_msgSend((id)qword_25531B988, "objectForKey:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", v17);

  if (!v24)
  {
    MGLogForCategory(3);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v38 = self;
      v39 = 2112;
      v40 = v17;
      _os_log_error_impl(&dword_21CBD2000, v35, OS_LOG_TYPE_ERROR, "%p accessory category %@ is not supported", buf, 0x16u);
    }

    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BE64B70];
    v34 = 3;
LABEL_14:
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v34, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    goto LABEL_15;
  }
  MGGroupIdentifierForAccessoryIdentifierInHome(v36, v16, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [v22 alloc];
  v27 = (void *)objc_msgSend(v26, "initWithConnectionProvider:type:identifier:name:properties:memberIdentifiers:", 0, v15, v25, v18, v19, MEMORY[0x24BDBD1A8]);
  -[MGDaemon localGroupsMediator](self, "localGroupsMediator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addGroup:", v27);

  MGLogForCategory(3);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v38 = self;
    v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_21CBD2000, v29, OS_LOG_TYPE_DEFAULT, "%p completed accessory %@", buf, 0x16u);
  }

  v30 = 0;
LABEL_15:
  v20[2](v20, v27, v30);

}

void __110__MGDaemon_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64BC8], "type");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  v13[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64C00], "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE64B80], "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  v13[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_25531B980;
  qword_25531B980 = v3;

  objc_msgSend(MEMORY[0x24BE64BC8], "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v11[0] = *MEMORY[0x24BDD49E0];
  objc_msgSend(MEMORY[0x24BE64C00], "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  v11[1] = *MEMORY[0x24BDD4A30];
  objc_msgSend(MEMORY[0x24BE64B80], "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  v11[2] = *MEMORY[0x24BDD49A8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_25531B988;
  qword_25531B988 = v8;

}

- (void)setName:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37__MGDaemon_setName_group_completion___block_invoke;
  v14[3] = &unk_24E0AB170;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[MGDaemon _fetchGroupInfo:completion:](self, "_fetchGroupInfo:completion:", v13, v14);

}

void __37__MGDaemon_setName_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    MGLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v20 = 134218242;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for rename %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    MGLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v20 = 134217984;
      v21 = v18;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p rename not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE64B70], 4, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v15 = *(id *)(a1 + 40);
  MGLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 134217984;
    v21 = v19;
    _os_log_error_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for rename", (uint8_t *)&v20, 0xCu);
  }

  v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__MGDaemon_addMember_group_completion___block_invoke;
  v14[3] = &unk_24E0AB170;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[MGDaemon _fetchGroupInfo:completion:](self, "_fetchGroupInfo:completion:", v13, v14);

}

void __39__MGDaemon_addMember_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    MGLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v20 = 134218242;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for adding member %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    MGLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v20 = 134217984;
      v21 = v18;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p adding members not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE64B70], 6, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v15 = *(id *)(a1 + 40);
  MGLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 134217984;
    v21 = v19;
    _os_log_error_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for adding member", (uint8_t *)&v20, 0xCu);
  }

  v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__MGDaemon_removeMember_group_completion___block_invoke;
  v14[3] = &unk_24E0AB170;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[MGDaemon _fetchGroupInfo:completion:](self, "_fetchGroupInfo:completion:", v13, v14);

}

void __42__MGDaemon_removeMember_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    MGLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v20 = 134218242;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for removing member %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    MGLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v20 = 134217984;
      v21 = v18;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p removing members not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE64B70], 6, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v15 = *(id *)(a1 + 40);
  MGLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 134217984;
    v21 = v19;
    _os_log_error_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for removing member", (uint8_t *)&v20, 0xCu);
  }

  v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)startQueryWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t i;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MGOutstandingQuery *v20;
  void *v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  MGDaemon *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceClientForXPCConnection:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allowEvaluation");
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.MediaGroups.groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v9 = (void *)MEMORY[0x24BDBD1A8];
    }
  }
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i < v11; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v15 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v15, "removeObjectAtIndex:", i);

        ++i;
        v9 = v15;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.type IN %@"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD14C0];
  v33[0] = v16;
  v33[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[MGOutstandingQuery initWithPredicate:]([MGOutstandingQuery alloc], "initWithPredicate:", v19);
  -[MGOutstandingQuery identifier](v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon topologyRequestHandler](self, "topologyRequestHandler");
  v22 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (-[MGOutstandingQuery requiresTopology](v20, "requiresTopology") && v22)
  {
    MGLogForCategory(3);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v30 = self;
      v31 = 2112;
      v32 = v21;
      _os_log_debug_impl(&dword_21CBD2000, v23, OS_LOG_TYPE_DEBUG, "%p requesting topology for query %@", buf, 0x16u);
    }

    v22[2](v22);
  }
  objc_msgSend(v28, "addQuery:", v20);
  MGLogForCategory(3);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v30 = self;
    v31 = 2112;
    v32 = v21;
    _os_log_impl(&dword_21CBD2000, v24, OS_LOG_TYPE_DEFAULT, "%p starting query %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, _QWORD, _QWORD))v27 + 2))(v27, v21, 0, 0);
  -[MGDaemon queryAgent](self, "queryAgent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addOutstandingQuery:", v20);

  -[MGDaemon remoteQueryClient](self, "remoteQueryClient");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOutstandingQuery:", v20);

}

- (void)stopQuery:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDD1988];
  v7 = (void (**)(id, _QWORD))a4;
  v8 = a3;
  objc_msgSend(v6, "currentConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MGDaemon clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceClientForXPCConnection:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "outstandingQueryForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGDaemon stopQuery:](self, "stopQuery:", v11);
  objc_msgSend(v10, "removeQuery:", v11);
  v7[2](v7, 0);

}

- (void)stopQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  MGDaemon *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon queryAgent](self, "queryAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeOutstandingQuery:", v4);

  -[MGDaemon remoteQueryClient](self, "remoteQueryClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeOutstandingQuery:", v4);

  MGLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p stopped query %@", (uint8_t *)&v9, 0x16u);
  }

}

- (id)startInternalQueryWithPredicate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MGOutstandingQuery *v9;
  void *v10;
  void (**v11)(_QWORD);
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  MGDaemon *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[MGOutstandingQuery initWithPredicate:]([MGOutstandingQuery alloc], "initWithPredicate:", v7);
  -[MGOutstandingQuery identifier](v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon topologyRequestHandler](self, "topologyRequestHandler");
  v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (-[MGOutstandingQuery requiresTopology](v9, "requiresTopology"))
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    MGLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134218242;
      v21 = self;
      v22 = 2112;
      v23 = v10;
      _os_log_debug_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEBUG, "%p requesting topology for local query %@", (uint8_t *)&v20, 0x16u);
    }

    v11[2](v11);
  }
  MGLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_DEFAULT, "%p starting internal query %@", (uint8_t *)&v20, 0x16u);
  }

  -[MGDaemon internalQueries](self, "internalQueries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = (void *)MEMORY[0x220788584](v6);
  objc_msgSend(v16, "setObject:forKey:", v17, v10);

  -[MGDaemon setInternalQueries:](self, "setInternalQueries:", v16);
  -[MGDaemon queryAgent](self, "queryAgent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOutstandingQuery:", v9);

  return v9;
}

- (void)stopInternalQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  MGDaemon *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGDaemon queryAgent](self, "queryAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeOutstandingQuery:", v4);

  -[MGDaemon internalQueries](self, "internalQueries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObjectForKey:", v6);
  -[MGDaemon setInternalQueries:](self, "setInternalQueries:", v9);
  MGLogForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p stopped internal query %@", (uint8_t *)&v11, 0x16u);
  }

}

- (void)_fetchGroupInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  MGDaemon *v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BE64B90], "predicateForGroup:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__MGDaemon__fetchGroupInfo_completion___block_invoke;
  v14[3] = &unk_24E0AB1C0;
  objc_copyWeak(&v19, &location);
  v18 = &v20;
  v10 = v6;
  v15 = v10;
  v16 = self;
  v11 = v7;
  v17 = v11;
  -[MGDaemon startInternalQueryWithPredicate:handler:](self, "startInternalQueryWithPredicate:handler:", v9, v14);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v21[5];
  v21[5] = v12;

  objc_destroyWeak(&v19);
  _Block_object_dispose(&v20, 8);

  objc_destroyWeak(&location);
}

void __39__MGDaemon__fetchGroupInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE *v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id location;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stopInternalQuery:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    location = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__6;
    v43 = __Block_byref_object_dispose__6;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__6;
    v37 = __Block_byref_object_dispose__6;
    v38 = 0;
    if (v6)
    {
      v11 = v6;
      v38 = v11;
      MGLogForCategory(3);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      v23 = "%p failed to internally fetch group %@";
    }
    else
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "group");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mediator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak(&location, v18);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v47 = __Block_byref_object_copy__6;
        v48 = __Block_byref_object_dispose__6;
        v49 = 0;
        objc_msgSend(v17, "predicateForMembers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 40);
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __39__MGDaemon__fetchGroupInfo_completion___block_invoke_125;
        v25[3] = &unk_24E0AB198;
        objc_copyWeak(&v31, (id *)(a1 + 64));
        v28 = buf;
        v29 = &v33;
        v30 = &v39;
        v27 = *(id *)(a1 + 48);
        v16 = v17;
        v26 = v16;
        objc_copyWeak(&v32, &location);
        objc_msgSend(v19, "startInternalQueryWithPredicate:handler:", v24, v25);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v20;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        _Block_object_dispose(buf, 8);

        goto LABEL_7;
      }
      MGLogForCategory(3);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_4:

        v13 = *(_QWORD *)(a1 + 48);
        v14 = v40[5];
        v15 = objc_loadWeakRetained(&location);
        (*(void (**)(uint64_t, _QWORD, uint64_t, void *, uint64_t))(v13 + 16))(v13, 0, v14, v15, v34[5]);
        v16 = 0;
LABEL_7:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v39, 8);

        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      v23 = "%p failed to internally find group %@";
    }
    _os_log_error_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_4;
  }
LABEL_8:

}

void __39__MGDaemon__fetchGroupInfo_completion___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stopInternalQuery:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
      MGLogForCategory(3);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v30 = v8;
        v31 = 2112;
        v32 = v6;
        _os_log_error_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_ERROR, "%p failed to internally fetch group members %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v5;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "group", (_QWORD)v24);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v11, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v14);
      }

      v18 = -[NSObject count](v11, "count");
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v19);
      if (v18)

    }
    v21 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v23 = objc_loadWeakRetained((id *)(a1 + 80));
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, _QWORD))(v20 + 16))(v20, v21, v22, v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
}

- (void)startOutstandingQueryWithPredicate:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke;
  v22[3] = &unk_24E0AB1E8;
  v23 = v9;
  v12 = v9;
  v13 = (void *)MEMORY[0x220788584](v22);
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke_2;
  block[3] = &unk_24E0AB210;
  block[4] = self;
  v19 = v8;
  v20 = v13;
  v21 = v10;
  v15 = v10;
  v16 = v13;
  v17 = v8;
  dispatch_async(v14, block);

}

void __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "group", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startInternalQueryWithPredicate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)stopOutstandingQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGDaemon dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__MGDaemon_stopOutstandingQuery___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __33__MGDaemon_stopOutstandingQuery___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopInternalQuery:", *(_QWORD *)(a1 + 40));
}

- (void)setServiceForIngestion:(id)a3
{
  objc_storeStrong((id *)&self->_serviceForIngestion, a3);
}

- (MGServiceListenerProvider)listenerProvider
{
  return self->_listenerProvider;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (MGServiceClientSet)clients
{
  return self->_clients;
}

- (MGGroupsMediator)localGroupsMediator
{
  return self->_localGroupsMediator;
}

- (MGGroupsMediator)homekitGroupsMediator
{
  return self->_homekitGroupsMediator;
}

- (NSDictionary)internalQueries
{
  return self->_internalQueries;
}

- (void)setInternalQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)topologyRequestHandler
{
  return self->_topologyRequestHandler;
}

- (MGGroupsQueryAgent)queryAgent
{
  return self->_queryAgent;
}

- (MGRemoteQueryServerManager)remoteQueryServer
{
  return self->_remoteQueryServer;
}

- (MGRemoteQueryClientManager)remoteQueryClient
{
  return self->_remoteQueryClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteQueryClient, 0);
  objc_storeStrong((id *)&self->_remoteQueryServer, 0);
  objc_storeStrong((id *)&self->_queryAgent, 0);
  objc_storeStrong(&self->_topologyRequestHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_internalQueries, 0);
  objc_storeStrong((id *)&self->_homekitGroupsMediator, 0);
  objc_storeStrong((id *)&self->_localGroupsMediator, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listenerProvider, 0);
  objc_storeStrong((id *)&self->_serviceForIngestion, 0);
}

@end
