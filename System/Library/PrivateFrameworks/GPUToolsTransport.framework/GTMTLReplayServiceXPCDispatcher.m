@implementation GTMTLReplayServiceXPCDispatcher

- (GTMTLReplayServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 bulkDataService:(id)a5 bulkDataServiceProperties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OS_os_log *v15;
  OS_os_log *log;
  void *v17;
  void *v18;
  GTMTLReplayServiceXPCDispatcher *v19;
  GTMTLReplayServiceXPCDispatcher *v20;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4;
  v15 = (OS_os_log *)os_log_create("com.apple.gputools.transport", "ReplayDispatcher");
  log = self->_log;
  self->_log = v15;

  objc_msgSend(v14, "protocolMethods");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v18, "addObject:", CFSTR("bulkDataService"));
  objc_msgSend(v18, "addObject:", CFSTR("broadcastDisconnect"));
  v22.receiver = self;
  v22.super_class = (Class)GTMTLReplayServiceXPCDispatcher;
  v19 = -[GTXPCDispatcher initWithProtocolMethods:](&v22, sel_initWithProtocolMethods_, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_implInstance, a3);
    objc_storeStrong((id *)&v20->_bulkDataService, a5);
    objc_storeStrong((id *)&v20->_bulkDataServiceProperties, a6);
  }

  return v20;
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GTMTLReplayService broadcastDisconnect:path:](self->_implInstance, "broadcastDisconnect:path:", v6, v7);

}

- (void)bulkDataService:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  gt_xpc_dictionary_create_reply(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_nsobject(v7, "returnValue", (uint64_t)self->_bulkDataServiceProperties);
  objc_msgSend(v6, "sendMessage:", v7);

}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  GTMTLReplayServiceObserver *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTMTLReplayServiceObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTMTLReplayService registerObserver:](self->_implInstance, "registerObserver:", v10);
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GTMTLReplayService deregisterObserver:](self->_implInstance, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
  gt_xpc_dictionary_create_reply(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendMessage:", v8);
}

- (void)load_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  GTURLAccessProviderXPCProxy *v11;
  void *v12;
  GTURLAccessProviderXPCProxy *v13;
  uint64_t v14;
  void *nsobject;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  allServices(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v8, (Protocol *)&unk_255D647A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [GTURLAccessProviderXPCProxy alloc];
  objc_msgSend(v10, "serviceProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v11, "initWithConnection:remoteProperties:", v6, v12);

  v14 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "url", v14);
  gt_xpc_dictionary_create_reply(v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__GTMTLReplayServiceXPCDispatcher_load_error__replyConnection___block_invoke;
  v19[3] = &unk_24F827FC0;
  v19[4] = self;
  v20 = v16;
  v21 = v6;
  v17 = v6;
  v18 = v16;
  -[GTURLAccessProviderXPCProxy securityScopedURLFromSandboxID:completionHandler:](v13, "securityScopedURLFromSandboxID:completionHandler:", nsobject, v19);

}

void __63__GTMTLReplayServiceXPCDispatcher_load_error__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v8 = 0;
    objc_msgSend(v3, "load:error:", a2, &v8);
    v4 = v8;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File transfer failed in %@: %@"), CFSTR("GTReplayService"), CFSTR("loading GPU trace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 8, v7);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 40), "error", v4);
  objc_msgSend(*(id *)(a1 + 48), "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (void)terminateProcess:(id)a3 replyConnection:(id)a4
{
  -[GTMTLReplayService terminateProcess](self->_implInstance, "terminateProcess", a3, a4);
}

- (void)fetch_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLReplayService fetch:](self->_implInstance, "fetch:", v6);

}

- (void)query_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLReplayService query:](self->_implInstance, "query:", v6);

}

- (void)update_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  GTMTLReplayServiceXPCDispatcher *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self->_implInstance);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke;
  block[3] = &unk_24F828010;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  objc_copyWeak(&v15, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  dispatch_group_t v12;
  id v13;

  v2 = dispatch_group_create();
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_2;
  v10[3] = &unk_24F827FE8;
  v11 = v3;
  v12 = v2;
  v13 = *(id *)(a1 + 40);
  v6 = v2;
  DispatchReplayerBatchRequest(v11, v4, v5, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = (id)objc_msgSend(WeakRetained, "update:", v7);

}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GTURLAccessProviderXPCProxy *v9;
  uint64_t v10;
  void *v11;
  GTURLAccessProviderXPCProxy *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "shaderURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      allServices(*(void **)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      filteredArrayByService(v6, (Protocol *)&unk_255D647A0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [GTURLAccessProviderXPCProxy alloc];
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "serviceProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v9, "initWithConnection:remoteProperties:", v10, v11);

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      objc_msgSend(v4, "shaderURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_3;
      v18[3] = &unk_24F827BC8;
      v19 = v4;
      v20 = *(id *)(a1 + 40);
      -[GTURLAccessProviderXPCProxy securityScopedURLFromSandboxID:completionHandler:](v12, "securityScopedURLFromSandboxID:completionHandler:", v13, v18);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = *(void **)(a1 + 48);
      v15 = v3;
      xpc_dictionary_get_array(v14, "_pathHistory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPath:", v16);

      objc_msgSend(*(id *)(a1 + 32), "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setConnection:", v17);

    }
  }

}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setShaderURL:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)decode_:(id)a3 replyConnection:(id)a4
{
  id v5;
  id v6;

  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[GTMTLReplayService decode:](self->_implInstance, "decode:", v6);

}

- (void)display_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "request", v6);

  -[GTMTLReplayService display:](self->_implInstance, "display:", nsobject);
}

- (void)profile_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *nsobject_classes;
  void *v16;
  void *v17;
  void *v18;
  GTURLAccessProviderXPCProxy *v19;
  void *v20;
  GTURLAccessProviderXPCProxy *v21;
  id v22;
  GTURLAccessProviderXPCProxy *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GTURLAccessProviderXPCProxy *v28;
  GTMTLReplayServiceXPCDispatcher *v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_dictionary_get_array(v7, "_pathHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v7, "request", v14);

  allServices(v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  filteredArrayByService(v16, (Protocol *)&unk_255D647A0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [GTURLAccessProviderXPCProxy alloc];
  objc_msgSend(v18, "serviceProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v19, "initWithConnection:remoteProperties:", v6, v20);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __60__GTMTLReplayServiceXPCDispatcher_profile__replyConnection___block_invoke;
  v26[3] = &unk_24F828038;
  v30 = v6;
  v31 = uint64;
  v27 = v9;
  v28 = v21;
  v29 = self;
  v22 = v6;
  v23 = v21;
  v24 = v9;
  objc_msgSend(nsobject_classes, "setStreamHandler:", v26);
  v25 = (id)-[GTMTLReplayService profile:](self->_implInstance, "profile:", nsobject_classes);

}

void __60__GTMTLReplayServiceXPCDispatcher_profile__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t empty;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v3 = a2;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "_port", *(_QWORD *)(a1 + 64));
  xpc_dictionary_set_value(empty, "_replyPath", *(xpc_object_t *)(a1 + 32));
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_13;
  }
  objc_msgSend(v3, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0x24BDD1000uLL;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(v3, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v14, v16, &v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;

    if (!v18 && v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Profiler Raw URL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 40), "makeURL:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("Profiler Raw URL"));
        v27 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v27;
        objc_msgSend(v3, "setData:", v22);

        v8 = 0x24BDD1000;
        objc_msgSend(v3, "setError:", v18);

      }
      else
      {
        v18 = 0;
      }

    }
  }
  v23 = *(void **)(v8 + 1560);
  v26 = 0;
  objc_msgSend(v23, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v26;
  xpc_dictionary_set_uint64(empty, "bulkDataHandle", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "handoverDataForDownload:", v24));

LABEL_13:
  objc_msgSend(*(id *)(a1 + 56), "sendMessage:", empty);

}

- (void)shaderdebug_:(id)a3 replyConnection:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *nsobject_classes;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[8];

  v22[7] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = a3;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  v22[5] = objc_opt_class();
  v22[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "request", v10);
  gt_xpc_dictionary_create_reply(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __64__GTMTLReplayServiceXPCDispatcher_shaderdebug__replyConnection___block_invoke;
  v19 = &unk_24F828060;
  v20 = v12;
  v21 = v6;
  v13 = v6;
  v14 = v12;
  objc_msgSend(nsobject_classes, "setCompletionHandler:", &v16);
  v15 = (id)-[GTMTLReplayService shaderdebug:](self->_implInstance, "shaderdebug:", nsobject_classes, v16, v17, v18, v19);

}

uint64_t __64__GTMTLReplayServiceXPCDispatcher_shaderdebug__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)raytrace_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  void *v9;
  void *v10;
  void *nsobject_classes;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GTMTLReplayServiceXPCDispatcher *v17;
  id v18;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_dictionary_get_array(v7, "_pathHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v7, "request", v10);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__GTMTLReplayServiceXPCDispatcher_raytrace__replyConnection___block_invoke;
  v15[3] = &unk_24F828088;
  v16 = v9;
  v17 = self;
  v18 = v6;
  v19 = uint64;
  v12 = v6;
  v13 = v9;
  objc_msgSend(nsobject_classes, "setStreamHandler:", v15);
  v14 = (id)-[GTMTLReplayService raytrace:](self->_implInstance, "raytrace:", nsobject_classes);

}

void __61__GTMTLReplayServiceXPCDispatcher_raytrace__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t empty;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "_port", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_value(empty, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_uint64(empty, "streamState", objc_msgSend(v3, "state"));
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    xpc_dictionary_set_uint64(empty, "bulkDataHandle", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "handoverDataForDownload:", v7));

    goto LABEL_5;
  }
  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_6;
  objc_msgSend(v3, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v13);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v13;

  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "handoverDataForDownload:", v8);
  xpc_dictionary_set_uint64(empty, "bulkDataHandle", v12);
LABEL_5:

LABEL_6:
  objc_msgSend(*(id *)(a1 + 48), "sendMessage:", empty);

}

- (void)cancel_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t xdict;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[GTMTLReplayService cancel:](self->_implInstance, "cancel:", xpc_dictionary_get_uint64(v7, "token"));
  gt_xpc_dictionary_create_reply(v7);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  objc_msgSend(v6, "sendMessage:", xdict);

}

- (void)pause_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t xdict;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[GTMTLReplayService pause:](self->_implInstance, "pause:", xpc_dictionary_get_uint64(v7, "token"));
  gt_xpc_dictionary_create_reply(v7);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  objc_msgSend(v6, "sendMessage:", xdict);

}

- (void)resume_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t xdict;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[GTMTLReplayService resume:](self->_implInstance, "resume:", xpc_dictionary_get_uint64(v7, "token"));
  gt_xpc_dictionary_create_reply(v7);
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  objc_msgSend(v6, "sendMessage:", xdict);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bulkDataServiceProperties, 0);
  objc_storeStrong((id *)&self->_bulkDataService, 0);
  objc_storeStrong((id *)&self->_implInstance, 0);
}

@end
