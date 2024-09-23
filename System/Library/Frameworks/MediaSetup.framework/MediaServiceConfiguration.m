@implementation MediaServiceConfiguration

- (MediaServiceConfiguration)initWithQueue:(id)a3
{
  id v5;
  MediaServiceConfiguration *v6;
  MediaServiceConfigurationMediator *v7;
  MediaServiceConfigurationMediator *mediator;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSXPCConnection *v62;
  uint64_t v63;
  NSXPCConnection *v64;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id location;
  objc_super v73;

  v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)MediaServiceConfiguration;
  v6 = -[MediaServiceConfiguration init](&v73, sel_init);
  if (v6)
  {
    v67 = v5;
    v7 = -[MediaServiceConfigurationMediator initWithServiceDelegate:]([MediaServiceConfigurationMediator alloc], "initWithServiceDelegate:", v6);
    mediator = v6->_mediator;
    v6->_mediator = v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.mediasetupd.server"), 4096);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v9;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550CD6B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v11);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550B4598);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6->_connection, "setExportedInterface:");
    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6->_mediator);
    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_addMediaService_usingSetupBundles_completion_, 1, 0);

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getAvailableServices_userIdentifier_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getCachedAvailableServices_userIdentifier_completion_, 0, 1);

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getMediaServiceChoicesForAllUsers_, 0, 1);

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_getServiceConfigurationInfo_serviceID_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_getDefaultMediaServiceForAllUsers_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x24BDBCF20];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_getServiceConfigurationInfo_serviceID_completion_, 0, 0);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDBCF20];
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_getPublicInfoForBundleID_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_getResolvedServiceInfo_sharedUserID_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_getResolvedServiceInfo_completion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x24BDBCF20];
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v51, v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_activeServiceApplicationInformationForSharedUserID_completionHandler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)MEMORY[0x24BDBCF20];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_getSupportedThirdPartyMediaServices_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v6->_connection, "remoteObjectInterface");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x24BDBCF20];
    v60 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_getMediaServiceChoicesForSharedUser_completion_, 0, 1);

    objc_initWeak(&location, v6);
    v62 = v6->_connection;
    v63 = MEMORY[0x24BDAC760];
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __43__MediaServiceConfiguration_initWithQueue___block_invoke;
    v70[3] = &unk_24DBD58A8;
    objc_copyWeak(&v71, &location);
    -[NSXPCConnection setInterruptionHandler:](v62, "setInterruptionHandler:", v70);
    v64 = v6->_connection;
    v68[0] = v63;
    v68[1] = 3221225472;
    v68[2] = __43__MediaServiceConfiguration_initWithQueue___block_invoke_126;
    v68[3] = &unk_24DBD58A8;
    objc_copyWeak(&v69, &location);
    -[NSXPCConnection setInvalidationHandler:](v64, "setInvalidationHandler:", v68);
    -[NSXPCConnection resume](v6->_connection, "resume");
    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);

    v5 = v67;
  }

  return v6;
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;

  _MSLogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__MediaServiceConfiguration_initWithQueue___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connectionInterrupted");

}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_126(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;

  _MSLogingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__MediaServiceConfiguration_initWithQueue___block_invoke_126_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connectionInvalidated");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MediaServiceConfiguration;
  -[MediaServiceConfiguration dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MediaServiceConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)_sSharedInstance;
}

void __43__MediaServiceConfiguration_sharedInstance__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.mediasetup.serviceconfig", v5);
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithQueue:", v2);
  v4 = (void *)_sSharedInstance;
  _sSharedInstance = v3;

}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke;
    v26[3] = &unk_24DBD5920;
    v11 = v7;
    v27 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_2;
    v24[3] = &unk_24DBD5970;
    v24[4] = self;
    v25 = v11;
    objc_msgSend(v12, "getAvailableServices:userIdentifier:completion:", v13, v15, v24);

    v16 = v27;
  }
  else
  {
    _MSLogingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getAvailableServices:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  +[MSAnalytics sendUserRegisteredNumberOfServices:](MSAnalytics, "sendUserRegisteredNumberOfServices:", objc_msgSend(v5, "count"));
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_3;
    v9[3] = &unk_24DBD5948;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "_performBlock:", v9);

  }
}

uint64_t __61__MediaServiceConfiguration_getAvailableServices_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedAvailableServices:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke;
    v26[3] = &unk_24DBD5920;
    v11 = v7;
    v27 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_2;
    v24[3] = &unk_24DBD5970;
    v24[4] = self;
    v25 = v11;
    objc_msgSend(v12, "getCachedAvailableServices:userIdentifier:completion:", v13, v15, v24);

    v16 = v27;
  }
  else
  {
    _MSLogingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getCachedAvailableServices:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_3;
    v9[3] = &unk_24DBD5948;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "_performBlock:", v9);

  }
}

uint64_t __67__MediaServiceConfiguration_getCachedAvailableServices_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)thirdPartyMusicAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  if (v4)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v5 = MEMORY[0x24BDAC760];
    connection = self->_connection;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke;
    v20[3] = &unk_24DBD5998;
    v20[4] = &v21;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_134;
    v19[3] = &unk_24DBD59C0;
    v19[4] = &v21;
    objc_msgSend(v7, "thirdPartyMusicAvailable:completion:", v8, v19);

    v9 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration thirdPartyMusicAvailable:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }

  return v9;
}

void __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MSLogingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_cold_1((uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_134(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  -[MediaServiceConfiguration getCachedServiceInfo:homeUserID:endpointID:completion:](self, "getCachedServiceInfo:homeUserID:endpointID:completion:", a3, a4, 0, a5);
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v16 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke;
    v29[3] = &unk_24DBD5920;
    v17 = v13;
    v30 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_2;
    v27[3] = &unk_24DBD5A10;
    v27[4] = self;
    v28 = v17;
    objc_msgSend(v18, "getCachedServiceInfo:homeUserID:endpointID:completion:", v10, v11, v12, v27);

    v19 = v30;
  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getCachedServiceInfo:homeUserID:endpointID:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_3;
    v12[3] = &unk_24DBD59E8;
    v16 = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v11, "_performBlock:", v12);

  }
}

uint64_t __83__MediaServiceConfiguration_getCachedServiceInfo_homeUserID_endpointID_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v16 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke;
    v29[3] = &unk_24DBD5920;
    v17 = v13;
    v30 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_2;
    v27[3] = &unk_24DBD5A38;
    v27[4] = self;
    v28 = v17;
    objc_msgSend(v18, "requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:", v10, v11, v12, v27);

    v19 = v30;
  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_3;
    v9[3] = &unk_24DBD5948;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "_performBlock:", v9);

  }
}

uint64_t __107__MediaServiceConfiguration_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateDefaultMediaService:(id)a3 forHome:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke;
    v30[3] = &unk_24DBD5920;
    v14 = v10;
    v31 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_2;
    v27[3] = &unk_24DBD5A88;
    v29 = v14;
    v27[4] = self;
    v28 = v8;
    objc_msgSend(v15, "updateDefaultMediaService:homeID:homeUserID:completion:", v28, v16, v18, v27);

    v19 = v31;
  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration updateDefaultMediaService:forHome:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  MSConfigurationEvent *v8;
  void *v9;
  void *v10;
  MSConfigurationEvent *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_3;
    v12[3] = &unk_24DBD5A60;
    v14 = v6;
    v15 = a2;
    v13 = v5;
    objc_msgSend(v7, "_performBlock:", v12);

  }
  if (a2)
  {
    v8 = [MSConfigurationEvent alloc];
    objc_msgSend(*(id *)(a1 + 40), "serviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MSConfigurationEvent initWithServiceId:](v8, "initWithServiceId:", v10);

    +[MSAnalytics sendConfigEvent:](MSAnalytics, "sendConfigEvent:", v11);
  }

}

uint64_t __74__MediaServiceConfiguration_updateDefaultMediaService_forHome_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke;
    v26[3] = &unk_24DBD5920;
    v11 = v7;
    v27 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_2;
    v24[3] = &unk_24DBD5A38;
    v24[4] = self;
    v25 = v11;
    objc_msgSend(v12, "getDefaultMediaService:homeUserID:completion:", v13, v15, v24);

    v16 = v27;
  }
  else
  {
    _MSLogingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getDefaultMediaService:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_3;
    v9[3] = &unk_24DBD5948;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "_performBlock:", v9);

  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaService_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeServiceFromHome:(id)a3 fromHome:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke;
    v29[3] = &unk_24DBD5920;
    v14 = v10;
    v30 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_2;
    v27[3] = &unk_24DBD5AB0;
    v27[4] = self;
    v28 = v14;
    objc_msgSend(v15, "removeMediaService:homeID:homeUserID:completion:", v8, v16, v18, v27);

    v19 = v30;
  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration removeServiceFromHome:fromHome:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_3;
    v8[3] = &unk_24DBD5A60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    objc_msgSend(v7, "_performBlock:", v8);

  }
}

uint64_t __71__MediaServiceConfiguration_removeServiceFromHome_fromHome_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)addMediaService:(id)a3 toHomes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(a4, "na_map:", &__block_literal_global_1);
    v10 = objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    v12 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_2;
    v24[3] = &unk_24DBD5920;
    v13 = v9;
    v25 = v13;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_3;
    v22[3] = &unk_24DBD5AB0;
    v22[4] = self;
    v23 = v13;
    objc_msgSend(v14, "addMediaService:usingSetupBundles:completion:", v8, v10, v22);

  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration addMediaService:toHomes:completion:].cold.1(v10, v15, v16, v17, v18, v19, v20, v21);
  }

}

MSSetupBundle *__64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MSSetupBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  MSSetupBundle *v7;

  v2 = a2;
  v3 = [MSSetupBundle alloc];
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MSSetupBundle initWithHomeID:homeUserID:](v3, "initWithHomeID:homeUserID:", v4, v6);

  return v7;
}

uint64_t __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_4;
    v8[3] = &unk_24DBD5A60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    objc_msgSend(v7, "_performBlock:", v8);

  }
}

uint64_t __64__MediaServiceConfiguration_addMediaService_toHomes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke;
    v23[3] = &unk_24DBD5920;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_2;
    v21[3] = &unk_24DBD5B40;
    v21[4] = self;
    v22 = v11;
    objc_msgSend(v12, "getPublicInfoForBundleID:completion:", v6, v21);

    v13 = v24;
  }
  else
  {
    _MSLogingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getPublicInfoForBundleID:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_3;
    v6[3] = &unk_24DBD5B18;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "_performBlock:", v6);

  }
}

uint64_t __65__MediaServiceConfiguration_getPublicInfoForBundleID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getServiceConfigurationInfo:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("Please use updated API, getServiceConfigurationInfo:serviceID:completion");
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a4 + 2))(v7, 0, v9);

  }
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke;
    v26[3] = &unk_24DBD5920;
    v14 = v10;
    v27 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_2;
    v24[3] = &unk_24DBD5B68;
    v24[4] = self;
    v25 = v14;
    objc_msgSend(v15, "getServiceConfigurationInfo:serviceID:completion:", v8, v9, v24);

    v16 = v27;
  }
  else
  {
    _MSLogingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getServiceConfigurationInfo:serviceID:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __78__MediaServiceConfiguration_getServiceConfigurationInfo_serviceID_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setVersion:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *connection;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    connection = self->_connection;
    v9 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __51__MediaServiceConfiguration_setVersion_completion___block_invoke;
    v22[3] = &unk_24DBD5920;
    v10 = v6;
    v23 = v10;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __51__MediaServiceConfiguration_setVersion_completion___block_invoke_2;
    v20[3] = &unk_24DBD5920;
    v21 = v10;
    objc_msgSend(v11, "setVersion:completion:", a3, v20);

    v12 = v23;
  }
  else
  {
    _MSLogingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration setVersion:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __51__MediaServiceConfiguration_setVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__MediaServiceConfiguration_setVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v8 = a5;
  connection = self->_connection;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke;
  v17[3] = &unk_24DBD5920;
  v11 = v8;
  v18 = v11;
  v12 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke_2;
  v15[3] = &unk_24DBD5920;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "overrideAppleMusicSubscriptionStatus:homeUserIDS:completion:", v6, v12, v15);

}

uint64_t __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__MediaServiceConfiguration_overrideAppleMusicSubscriptionStatus_homeUserIDS_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke;
    v20[3] = &unk_24DBD5920;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_2;
    v18[3] = &unk_24DBD5B90;
    v18[4] = self;
    v19 = v8;
    objc_msgSend(v9, "getDefaultMediaServiceForAllUsers:", v18);

    v10 = v21;
  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getDefaultMediaServiceForAllUsers:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_3;
    v9[3] = &unk_24DBD5948;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v8, "_performBlock:", v9);

  }
}

uint64_t __63__MediaServiceConfiguration_getDefaultMediaServiceForAllUsers___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke;
    v26[3] = &unk_24DBD5920;
    v14 = v10;
    v27 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_2;
    v24[3] = &unk_24DBD5BB8;
    v24[4] = self;
    v25 = v14;
    objc_msgSend(v15, "getResolvedServiceInfo:sharedUserID:completion:", v8, v9, v24);

    v16 = v27;
  }
  else
  {
    _MSLogingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getResolvedServiceInfo:sharedUserID:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __76__MediaServiceConfiguration_getResolvedServiceInfo_sharedUserID_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke;
    v23[3] = &unk_24DBD5920;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_2;
    v21[3] = &unk_24DBD5BB8;
    v21[4] = self;
    v22 = v11;
    objc_msgSend(v12, "getResolvedServiceInfo:completion:", v6, v21);

    v13 = v24;
  }
  else
  {
    _MSLogingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration getResolvedServiceInfo:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __63__MediaServiceConfiguration_getResolvedServiceInfo_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)switchUserAccountInfo:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    connection = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke;
    v29[3] = &unk_24DBD5920;
    v14 = v10;
    v30 = v14;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_2;
    v27[3] = &unk_24DBD5BE0;
    v27[4] = self;
    v28 = v14;
    objc_msgSend(v15, "switchUserAccountInfo:homeID:homeUserID:completion:", v8, v16, v18, v27);

    v19 = v30;
  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration switchUserAccountInfo:home:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_3;
  v7[3] = &unk_24DBD5B18;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "_performBlock:", v7);

}

uint64_t __67__MediaServiceConfiguration_switchUserAccountInfo_home_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _MSLogingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_219CD8000, v5, OS_LOG_TYPE_INFO, "Setting MediaServiceUpdatedDelegate %@", (uint8_t *)&v7, 0xCu);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_146);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openConnection");

  objc_storeWeak((id *)&self->_delegate, v4);
}

void __41__MediaServiceConfiguration_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _MSLogingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__MediaServiceConfiguration_setDelegate___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MediaServiceConfiguration delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_2550CD710))
    goto LABEL_4;
  -[MediaServiceConfiguration delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MediaServiceConfiguration delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceSettingDidUpdate:homeUserID:", v10, v6);
LABEL_4:

  }
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v6;
  MSRemovalEvent *v7;
  void *v8;
  void *v9;
  MSRemovalEvent *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = [MSRemovalEvent alloc];
  objc_msgSend(v14, "serviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSRemovalEvent initWithServiceId:](v7, "initWithServiceId:", v9);

  +[MSAnalytics sendRemovalEvent:](MSAnalytics, "sendRemovalEvent:", v10);
  -[MediaServiceConfiguration delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "conformsToProtocol:", &unk_2550CD710))
    goto LABEL_4;
  -[MediaServiceConfiguration delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MediaServiceConfiguration delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userDidRemoveService:homeUserID:", v14, v6);
LABEL_4:

  }
}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MediaServiceConfiguration delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_2550CD710))
    goto LABEL_4;
  -[MediaServiceConfiguration delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MediaServiceConfiguration delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidUpdateDefaultService:homeUserID:", v10, v6);
LABEL_4:

  }
}

- (void)_performBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MediaServiceUpdatedDelegate)delegate
{
  return (MediaServiceUpdatedDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MediaServiceConfigurationMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
  objc_storeStrong((id *)&self->_mediator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSXPCConnection *connection;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    connection = self->_connection;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke;
    v31[3] = &unk_24DBD5920;
    v16 = v13;
    v32 = v16;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentUser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_2;
    v29[3] = &unk_24DBD5AB0;
    v29[4] = self;
    v30 = v16;
    objc_msgSend(v17, "updateProperty:homeID:homeUserID:withOptions:completion:", v10, v18, v20, v12, v29);

    v21 = v32;
  }
  else
  {
    _MSLogingFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration(MediaService) updateProperty:forHome:withOptions:completion:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  }

}

uint64_t __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_3;
    v8[3] = &unk_24DBD5A60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    objc_msgSend(v7, "_performBlock:", v8);

  }
}

uint64_t __89__MediaServiceConfiguration_MediaService__updateProperty_forHome_withOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke;
    v23[3] = &unk_24DBD5920;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_2;
    v21[3] = &unk_24DBD5C48;
    v21[4] = self;
    v22 = v11;
    objc_msgSend(v12, "activeServiceApplicationInformationForSharedUserID:completionHandler:", v6, v21);

    v13 = v24;
  }
  else
  {
    _MSLogingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration(AppSelection) activeServiceApplicationInformationForSharedUserID:completionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __112__MediaServiceConfiguration_AppSelection__activeServiceApplicationInformationForSharedUserID_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    connection = self->_connection;
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke;
    v23[3] = &unk_24DBD5920;
    v11 = v7;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_2;
    v21[3] = &unk_24DBD5C70;
    v21[4] = self;
    v22 = v11;
    objc_msgSend(v12, "getMediaServiceChoicesForSharedUser:completion:", v6, v21);

    v13 = v24;
  }
  else
  {
    _MSLogingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration(AppSelection) getMediaServiceChoicesForSharedUser:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __90__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForSharedUser_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getMediaServiceChoicesForAllUsers:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke;
    v20[3] = &unk_24DBD5920;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_2;
    v18[3] = &unk_24DBD5B68;
    v18[4] = self;
    v19 = v8;
    objc_msgSend(v9, "getMediaServiceChoicesForAllUsers:", v18);

    v10 = v21;
  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration(AppSelection) getMediaServiceChoicesForAllUsers:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_3;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __77__MediaServiceConfiguration_AppSelection__getMediaServiceChoicesForAllUsers___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke;
    v20[3] = &unk_24DBD5920;
    v8 = v4;
    v21 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_197;
    v18[3] = &unk_24DBD5C70;
    v18[4] = self;
    v19 = v8;
    objc_msgSend(v9, "getSupportedThirdPartyMediaServices:", v18);

    v10 = v21;
  }
  else
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MediaServiceConfiguration(AppSelection) getSupportedThirdPartyMediaServices:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  _MSLogingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_2;
  v11[3] = &unk_24DBD5948;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_performBlock:", v11);

}

uint64_t __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_219CD8000, a1, a3, "Connection to mediasetupd server is interrupted", a5, a6, a7, a8, 0);
}

void __43__MediaServiceConfiguration_initWithQueue___block_invoke_126_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_219CD8000, a1, a3, "Connection to mediasetupd server is invalidated", a5, a6, a7, a8, 0);
}

- (void)getAvailableServices:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getCachedAvailableServices:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)thirdPartyMusicAvailable:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s Unexpected parameter, Nil HMHome", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__MediaServiceConfiguration_thirdPartyMusicAvailable___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MediaServiceConfiguration thirdPartyMusicAvailable:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_219CD8000, a2, OS_LOG_TYPE_ERROR, "%s Error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)getCachedServiceInfo:(uint64_t)a3 homeUserID:(uint64_t)a4 endpointID:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthRenewalForMediaService:(uint64_t)a3 homeUserID:(uint64_t)a4 parentNetworkActivity:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateDefaultMediaService:(uint64_t)a3 forHome:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getDefaultMediaService:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)removeServiceFromHome:(uint64_t)a3 fromHome:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)addMediaService:(uint64_t)a3 toHomes:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getPublicInfoForBundleID:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getServiceConfigurationInfo:(uint64_t)a3 serviceID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setVersion:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getDefaultMediaServiceForAllUsers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getResolvedServiceInfo:(uint64_t)a3 sharedUserID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getResolvedServiceInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)switchUserAccountInfo:(uint64_t)a3 home:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__MediaServiceConfiguration_setDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a2, a3, "Error establishing connection, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__MediaServiceConfiguration_AppSelection__getSupportedThirdPartyMediaServices___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219CD8000, a2, a3, "got an error when working with the proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
