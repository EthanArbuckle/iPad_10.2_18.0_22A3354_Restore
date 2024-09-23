@implementation BBObserverServerProxy

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BBObserverServerProxy_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)updateSectionInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserverServerProxy_updateSectionInfo___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__BBObserverServerProxy_updateSectionParameters_forSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSectionParameters:forSectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __43__BBObserverServerProxy_updateSectionInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSectionInfo:", *(_QWORD *)(a1 + 40));

}

void __57__BBObserverServerProxy_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteBulletinsLoadedForSectionID:", *(_QWORD *)(a1 + 40));

}

- (BBObserver)observer
{
  return (BBObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_updateSectionParameters_forSectionID___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_1 != -1)
    dispatch_once(&xpcInterface_onceToken_1, &__block_literal_global_24);
  return (id)xpcInterface___interface_1;
}

void __37__BBObserverServerProxy_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A5450);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface___interface_1;
  xpcInterface___interface_1 = v0;

  v2 = (void *)xpcInterface___interface_1;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v66[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_clearSection_, 0, 0);

  v6 = (void *)xpcInterface___interface_1;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v65 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_clearBulletinsFromDate_toDate_inSections_, 0, 0);

  v10 = (void *)xpcInterface___interface_1;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v64 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_clearBulletinsFromDate_toDate_inSections_, 1, 0);

  v14 = (void *)xpcInterface___interface_1;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_clearBulletinsFromDate_toDate_inSections_, 2, 0);

  v18 = (void *)xpcInterface___interface_1;
  v19 = (void *)MEMORY[0x24BDBCF20];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_clearBulletinIDs_inSection_, 0, 0);

  v22 = (void *)xpcInterface___interface_1;
  v23 = (void *)MEMORY[0x24BDBCF20];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_clearBulletinIDs_inSection_, 0, 0);

  v26 = (void *)xpcInterface___interface_1;
  v27 = (void *)MEMORY[0x24BDBCF20];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_removeBulletins_inSection_fromFeeds_, 0, 0);

  v30 = (void *)xpcInterface___interface_1;
  v31 = (void *)MEMORY[0x24BDBCF20];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getSectionInfoWithHandler_, 0, 1);

  v34 = (void *)xpcInterface___interface_1;
  v35 = (void *)MEMORY[0x24BDBCF20];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getSectionInfoForActiveSectionsWithHandler_, 0, 1);

  v38 = (void *)xpcInterface___interface_1;
  v39 = (void *)MEMORY[0x24BDBCF20];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_getSectionInfoForSectionIDs_withHandler_, 0, 0);

  v42 = (void *)xpcInterface___interface_1;
  v43 = (void *)MEMORY[0x24BDBCF20];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_getSectionInfoForSectionIDs_withHandler_, 0, 1);

  v46 = (void *)xpcInterface___interface_1;
  v47 = (void *)MEMORY[0x24BDBCF20];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setWithArray:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_getBulletinsForPublisherMatchIDs_sectionID_withHandler_, 0, 1);

  v50 = (void *)xpcInterface___interface_1;
  v51 = (void *)MEMORY[0x24BDBCF20];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setWithArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_getBulletinsWithHandler_, 0, 1);

}

- (BBObserverServerProxy)initWithObserver:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BBObserverServerProxy *v14;
  BBObserverServerProxy *v15;
  NSXPCConnection *connection;
  void *v17;
  NSXPCConnection *v18;
  void *v19;
  NSXPCConnection *v20;
  uint64_t v21;
  NSXPCConnection *v22;
  NSObject *queue;
  _QWORD block[4];
  id v26;
  BBObserverServerProxy *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)BBObserverServerProxy;
  v14 = -[BBObserverServerProxy init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    -[BBObserverServerProxy setObserver:](v14, "setObserver:", v10);
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v15->_calloutQueue, a6);
    *(_WORD *)&v15->_isValid = 257;
    objc_storeStrong((id *)&v15->_connection, a4);
    connection = v15->_connection;
    objc_msgSend((id)objc_opt_class(), "xpcInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v17);

    v18 = v15->_connection;
    +[BBObserverClientProxy xpcInterface](BBObserverClientProxy, "xpcInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v18, "setExportedInterface:", v19);

    -[NSXPCConnection setExportedObject:](v15->_connection, "setExportedObject:", v15);
    objc_initWeak(&location, v15);
    v20 = v15->_connection;
    v21 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke;
    v30[3] = &unk_24C562FE0;
    objc_copyWeak(&v31, &location);
    -[NSXPCConnection setInvalidationHandler:](v20, "setInvalidationHandler:", v30);
    v22 = v15->_connection;
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_60;
    v28[3] = &unk_24C562FE0;
    objc_copyWeak(&v29, &location);
    -[NSXPCConnection setInterruptionHandler:](v22, "setInterruptionHandler:", v28);
    -[NSXPCConnection resume](v15->_connection, "resume");
    queue = v15->_queue;
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_2;
    block[3] = &unk_24C562E50;
    v26 = v10;
    v27 = v15;
    dispatch_async(queue, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke(uint64_t a1)
{
  _WORD *WeakRetained;
  NSObject *v2;
  int v3;
  _WORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBObserverServerProxy (%{public}@) connection invalidated", (uint8_t *)&v3, 0xCu);
    }
    WeakRetained[4] = 0;
  }

}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_60(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  NSObject **v5;
  uint8_t buf[4];
  NSObject **v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = WeakRetained;
      _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBObserverServerProxy (%{public}@) connection interrupted", buf, 0xCu);
    }
    *((_BYTE *)WeakRetained + 9) = 0;
    v3 = WeakRetained[4];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_61;
    block[3] = &unk_24C562E28;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_61(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverProxy:connectionStateDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));

}

uint64_t __72__BBObserverServerProxy_initWithObserver_connection_queue_calloutQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serverProxy:connectionStateDidChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9));
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBObserverServerProxy;
  -[BBObserverServerProxy dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  *(_WORD *)&self->_isValid = 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)established
{
  return self->_isEstablished;
}

- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BBObserverServerProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  block[3] = &unk_24C5632D0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __72__BBObserverServerProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObserverFeed:attachToLightsAndSirensGateway:", a1[6], a1[5]);

}

- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__BBObserverServerProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  v11[3] = &unk_24C565720;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __75__BBObserverServerProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObserverFeed:asLightsAndSirensGateway:priority:", a1[6], a1[5], a1[7]);

}

- (void)handleResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ handling response %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_64;
  v7[3] = &unk_24C563190;
  v6 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "handleResponse:withCompletion:", v6, v7);

}

void __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ response handling completed with success %d", buf, 0x12u);
  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_65;
    block[3] = &unk_24C565748;
    v12 = v8;
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __55__BBObserverServerProxy_handleResponse_withCompletion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)finishedWithBulletinID:(id)a3 transactionID:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_finishedWithBulletinID_transactionID___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __62__BBObserverServerProxy_finishedWithBulletinID_transactionID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedWithBulletinID:transactionID:", a1[5], a1[6]);

}

- (void)clearSection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__BBObserverServerProxy_clearSection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__BBObserverServerProxy_clearSection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSection:", *(_QWORD *)(a1 + 40));

}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__BBObserverServerProxy_clearBulletinsFromDate_toDate_inSections___block_invoke;
  v15[3] = &unk_24C5636F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __66__BBObserverServerProxy_clearBulletinsFromDate_toDate_inSections___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearBulletinsFromDate:toDate:inSections:", a1[5], a1[6], a1[7]);

}

- (void)clearBulletinIDs:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBObserverServerProxy_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__BBObserverServerProxy_clearBulletinIDs_inSection___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearBulletinIDs:inSection:", a1[5], a1[6]);

}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__BBObserverServerProxy_removeBulletins_inSection_fromFeeds___block_invoke;
  v13[3] = &unk_24C5635B8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __61__BBObserverServerProxy_removeBulletins_inSection_fromFeeds___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBulletins:inSection:fromFeeds:", a1[5], a1[6], a1[7]);

}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BBObserverServerProxy_requestNoticesBulletinsForSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__BBObserverServerProxy_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestNoticesBulletinsForSectionID:", *(_QWORD *)(a1 + 40));

}

- (void)requestNoticesBulletinsForAllSections
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverServerProxy_requestNoticesBulletinsForAllSections__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __62__BBObserverServerProxy_requestNoticesBulletinsForAllSections__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestNoticesBulletinsForAllSections");

}

- (void)getSectionInfoWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_2;
  v4[3] = &unk_24C565770;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "getSectionInfoWithHandler:", v4);

}

void __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __51__BBObserverServerProxy_getSectionInfoWithHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_2;
  v4[3] = &unk_24C565770;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "getSectionInfoForActiveSectionsWithHandler:", v4);

}

void __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __68__BBObserverServerProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_2;
  v5[3] = &unk_24C565770;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "getSectionInfoForSectionIDs:withHandler:", v3, v5);

}

void __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __65__BBObserverServerProxy_getSectionInfoForSectionIDs_withHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_2;
  v5[3] = &unk_24C565798;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "getSectionParametersForSectionID:withHandler:", v3, v5);

}

void __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __70__BBObserverServerProxy_getSectionParametersForSectionID_withHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_2;
  v5[3] = &unk_24C5657C0;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "getUniversalSectionIDForSectionID:withHandler:", v3, v5);

}

void __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __71__BBObserverServerProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_2;
  v4[3] = &unk_24C565770;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "getBulletinsWithHandler:", v4);

}

void __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __49__BBObserverServerProxy_getBulletinsWithHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_2;
  v5[3] = &unk_24C5657E8;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "getPublisherMatchIDsOfBulletinsPublishedAfterDate:withHandler:", v3, v5);

}

void __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __87__BBObserverServerProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
  v15[3] = &unk_24C563230;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_2;
  v6[3] = &unk_24C565770;
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "getBulletinsForPublisherMatchIDs:sectionID:withHandler:", v3, v4, v6);

}

void __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_3;
    block[3] = &unk_24C563590;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __80__BBObserverServerProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateBulletin:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke_2;
  v4[3] = &unk_24C565180;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateBulletin:withReply:", v3, v4);

}

uint64_t __52__BBObserverServerProxy_updateBulletin_withHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)removeSection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BBObserverServerProxy_removeSection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __39__BBObserverServerProxy_removeSection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSection:", *(_QWORD *)(a1 + 40));

}

- (void)updateGlobalSettings:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverServerProxy_updateGlobalSettings___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__BBObserverServerProxy_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateGlobalSettings:", *(_QWORD *)(a1 + 40));

}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BBObserverServerProxy_noteServerReceivedResponseForBulletin___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__BBObserverServerProxy_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteServerReceivedResponseForBulletin:", *(_QWORD *)(a1 + 40));

}

- (void)getObserverDebugInfo:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void (**)(id, void *))a3;
  -[BBObserverServerProxy observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
