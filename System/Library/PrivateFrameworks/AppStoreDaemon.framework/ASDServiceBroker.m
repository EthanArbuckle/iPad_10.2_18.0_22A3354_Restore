@implementation ASDServiceBroker

void __55__ASDServiceBroker__remoteObjectProxyWithErrorHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxyWithErrorHandler:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getLibraryServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getLibraryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLibraryServiceWithReplyHandler:", v5);

}

void __33__ASDServiceBroker_defaultBroker__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  objc_opt_self();
  v2 = objc_msgSend(v1, "newBrokerForMachServiceName:", CFSTR("com.apple.appstored.xpc"));
  v3 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = v2;

}

+ (id)newBrokerForMachServiceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:", v4);

  return v5;
}

- (ASDServiceBroker)initWithMachServiceName:(id)a3
{
  id v5;
  ASDServiceBroker *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v10;
  _QWORD handler[4];
  ASDServiceBroker *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDServiceBroker;
  v6 = -[ASDServiceBroker init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDServiceBroker", v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_machServiceName, a3);
    -[ASDServiceBroker _connect]((uint64_t)v6);
    v10 = v6->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__ASDServiceBroker_initWithMachServiceName___block_invoke;
    handler[3] = &unk_1E37BEB10;
    v13 = v6;
    notify_register_dispatch("com.apple.appstored.serviceBrokerAvailable", &v6->_token, v10, handler);

  }
  return v6;
}

+ (id)interface
{
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

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDPersonalizationStore interface](ASDPersonalizationStore, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_getPersonalizationServiceWithReplyHandler_, 0, 1);

  +[ASDAppStoreService interface](ASDAppStoreService, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_getAppStoreServiceWithReplyHandler_, 0, 1);

  +[ASDIAPHistory interface](ASDIAPHistory, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getIAPHistoryServiceWithReplyHandler_, 0, 1);

  +[ASDAppCapabilities interface](ASDAppCapabilities, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_getAppCapabilitiesServiceWithReplyHandler_, 0, 1);

  +[ASDAppLibrary interface](ASDAppLibrary, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_getLibraryServiceWithReplyHandler_, 0, 1);

  +[ASDUpdatesService interface](ASDUpdatesService, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_getUpdatesServiceWithReplyHandler_, 0, 1);

  +[ASDClipService interface](ASDClipService, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_getClipServiceWithReplyHandler_, 0, 1);

  +[ASDCrossfireStore interface](ASDCrossfireStore, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_getCrossfireServiceWithReplyHandler_, 0, 1);

  +[ASDTestFlightFeedback interface](ASDTestFlightFeedback, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_getTestFlightFeedbackServiceWithReplyHandler_, 0, 1);

  +[ASDManagedAppService interface](ASDManagedAppService, "interface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_getManagedAppServiceWithReplyHandler_, 0, 1);

  +[ASDOcelotStore interface](ASDOcelotStore, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_getOcelotServiceWithReplyHandler_, 0, 1);

  +[ASDDiagnosticService interface](ASDDiagnosticService, "interface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_getDiagnosticServiceWithReplyHandler_, 0, 1);

  +[ASDFairPlayService interface](ASDFairPlayService, "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_getFairPlayServiceWithReplyHandler_, 0, 1);

  +[ASDInstallApps interface](ASDInstallApps, "interface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_getInstallationServiceWithReplyHandler_, 0, 1);

  +[ASDInstallAttribution interface](ASDInstallAttribution, "interface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_getInstallAttributionServiceWithReplyHandler_, 0, 1);

  +[ASDInstallWebAttributionService interface](ASDInstallWebAttributionService, "interface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v18, sel_getInstallWebAttributionServiceWithReplyHandler_, 0, 1);

  +[SKANInteropService interface](SKANInteropService, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_getSKANInteropServiceWithReplyHandler_, 0, 1);

  +[ASDAppMetricsService interface](ASDAppMetricsService, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v20, sel_getMetricsServiceWithReplyHandler_, 0, 1);

  +[ASDPurchaseHistory interface](ASDPurchaseHistory, "interface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v21, sel_getPurchaseHistoryServiceWithReplyHandler_, 0, 1);

  +[ASDPurchaseManager interface](ASDPurchaseManager, "interface");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v22, sel_getPurchaseServiceWithReplyHandler_, 0, 1);

  +[ASDRepairService interface](ASDRepairService, "interface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_getRepairServiceWithReplyHandler_, 0, 1);

  +[ASDRestoreService interface](ASDRestoreService, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_getRestoreServiceWithReplyHandler_, 0, 1);

  +[ASDSkannerService interface](ASDSkannerService, "interface");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_getSkannerServiceWithReplyHandler_, 0, 1);

  +[ASDStoreKitExternalNotificationSheet interface](ASDStoreKitExternalNotificationSheet, "interface");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v26, sel_getStoreKitExternalNotificationServiceWithReplyHandler_, 0, 1);

  return v2;
}

- (void)_connect
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", *(_QWORD *)(a1 + 24), 0);
      v3 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v2;

      objc_msgSend(*(id *)(a1 + 8), "_setQueue:", *(_QWORD *)(a1 + 16));
      v4 = *(void **)(a1 + 8);
      objc_msgSend((id)objc_opt_class(), "interface");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRemoteObjectInterface:", v5);

      v6 = *(void **)(a1 + 8);
      +[ASDNotificationCenter defaultCenter](ASDNotificationCenter, "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExportedObject:", v7);

      v8 = *(void **)(a1 + 8);
      +[ASDNotificationCenter interface](ASDNotificationCenter, "interface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExportedInterface:", v9);

      objc_msgSend(*(id *)(a1 + 8), "setInterruptionHandler:", &__block_literal_global_9);
      v10 = *(void **)(a1 + 8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __28__ASDServiceBroker__connect__block_invoke_5;
      v12[3] = &unk_1E37BDD60;
      v12[4] = a1;
      objc_msgSend(v10, "setInvalidationHandler:", v12);
      objc_msgSend(*(id *)(a1 + 8), "resume");
    }
    else
    {
      ASDLogHandleForCategory(12);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection failed: No mach service name provided", buf, 2u);
      }

    }
  }
}

+ (id)defaultBroker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ASDServiceBroker_defaultBroker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAA38 != -1)
    dispatch_once(&qword_1ECFFAA38, block);
  return (id)_MergedGlobals_32;
}

- (void)getAppStoreServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ASDServiceBroker_getAppStoreServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAppStoreServiceWithReplyHandler:", v5);

}

- (void)getIAPHistoryServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getIAPHistoryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getIAPHistoryServiceWithReplyHandler:", v5);

}

- (_QWORD)_remoteObjectProxyWithErrorHandler:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    v18 = 0;
    v5 = a1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__ASDServiceBroker__remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E37BED98;
    v12 = &v13;
    block[4] = a1;
    v6 = v3;
    v11 = v6;
    dispatch_sync(v5, block);
    v7 = (void *)v14[5];
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDServiceBrokerErrorDomain"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v8);

      v7 = (void *)v14[5];
    }
    a1 = v7;

    _Block_object_dispose(&v13, 8);
  }

  return a1;
}

- (void)getPurchaseHistoryServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ASDServiceBroker_getPurchaseHistoryServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPurchaseHistoryServiceWithReplyHandler:", v5);

}

void __44__ASDServiceBroker_initWithMachServiceName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    ASDLogHandleForCategory(12);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_19A03B000, v2, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Reconnecting after receiving notification", v4, 2u);
    }

    -[ASDServiceBroker _connect](*(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", ASDServiceBrokerConnectedNotification, *(_QWORD *)(a1 + 32));

}

void __28__ASDServiceBroker__connect__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  ASDLogHandleForCategory(12);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_19A03B000, v0, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection interrupted", v1, 2u);
  }

}

void __28__ASDServiceBroker__connect__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19A03B000, v2, OS_LOG_TYPE_ERROR, "[ASDServiceBroker]: Connection invalidated", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)ASDServiceBroker;
  -[ASDServiceBroker dealloc](&v3, sel_dealloc);
}

- (id)getCapabilitiesServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEB40;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getAppCapabilitiesServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (_QWORD)_synchronousRemoteObjectProxyWithErrorHandler:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    v18 = 0;
    v5 = a1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__ASDServiceBroker__synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E37BED98;
    v12 = &v13;
    block[4] = a1;
    v6 = v3;
    v11 = v6;
    dispatch_sync(v5, block);
    v7 = (void *)v14[5];
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDServiceBrokerErrorDomain"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v8);

      v7 = (void *)v14[5];
    }
    a1 = v7;

    _Block_object_dispose(&v13, 8);
  }

  return a1;
}

void __52__ASDServiceBroker_getCapabilitiesServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getCrossfireServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ASDServiceBroker_getCrossfireServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCrossfireServiceWithReplyHandler:", v5);

}

uint64_t __61__ASDServiceBroker_getCrossfireServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getClipServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ASDServiceBroker_getClipServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getClipServiceWithReplyHandler:", v5);

}

uint64_t __56__ASDServiceBroker_getClipServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getClipServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__ASDServiceBroker_getClipServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__ASDServiceBroker_getClipServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEB68;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getClipServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __44__ASDServiceBroker_getClipServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__ASDServiceBroker_getClipServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getDiagnosticServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEB90;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getDiagnosticServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__ASDServiceBroker_getDiagnosticServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getDiagnosticServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getDiagnosticServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getDiagnosticServiceWithReplyHandler:", v5);

}

uint64_t __62__ASDServiceBroker_getDiagnosticServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getFairPlayServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEBB8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getFairPlayServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__ASDServiceBroker_getFairPlayServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getIAPHistoryServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEBE0;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getIAPHistoryServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__ASDServiceBroker_getIAPHistoryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __62__ASDServiceBroker_getIAPHistoryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getInstallationServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEC08;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getInstallationServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__ASDServiceBroker_getInstallationServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getInstallationServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ASDServiceBroker_getInstallationServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInstallationServiceWithReplyHandler:", v5);

}

uint64_t __64__ASDServiceBroker_getInstallationServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getInstallAttributionServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEC30;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getInstallAttributionServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__ASDServiceBroker_getInstallAttributionServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getInstallAttributionServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ASDServiceBroker_getInstallAttributionServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInstallAttributionServiceWithReplyHandler:", v5);

}

uint64_t __70__ASDServiceBroker_getInstallAttributionServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getInstallWebAttributionServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ASDServiceBroker_getInstallWebAttributionServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInstallWebAttributionServiceWithReplyHandler:", v5);

}

uint64_t __73__ASDServiceBroker_getInstallWebAttributionServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSKANInteropServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ASDServiceBroker_getSKANInteropServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSKANInteropServiceWithReplyHandler:", v5);

}

uint64_t __63__ASDServiceBroker_getSKANInteropServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getLibraryServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEC58;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getLibraryServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__ASDServiceBroker_getLibraryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __59__ASDServiceBroker_getLibraryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getManagedAppServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BEC80;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getManagedAppServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__ASDServiceBroker_getManagedAppServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getManagedAppServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getManagedAppServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getManagedAppServiceWithReplyHandler:", v5);

}

uint64_t __62__ASDServiceBroker_getManagedAppServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOcelotServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ASDServiceBroker_getOcelotServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getOcelotServiceWithReplyHandler:", v5);

}

uint64_t __58__ASDServiceBroker_getOcelotServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPersonalizationServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ASDServiceBroker_getPersonalizationServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPersonalizationServiceWithReplyHandler:", v5);

}

uint64_t __67__ASDServiceBroker_getPersonalizationServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getPurchaseHistoryServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BECA8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getPurchaseHistoryServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__ASDServiceBroker_getPurchaseHistoryServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __67__ASDServiceBroker_getPurchaseHistoryServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getPurchaseServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BECD0;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getPurchaseServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__ASDServiceBroker_getPurchaseServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getAppMetricsServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDServiceBroker_getAppMetricsServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getMetricsServiceWithReplyHandler:", v5);

}

uint64_t __62__ASDServiceBroker_getAppMetricsServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ASDServiceBroker_getAppStoreServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPurchaseServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ASDServiceBroker_getPurchaseServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPurchaseServiceWithReplyHandler:", v5);

}

uint64_t __60__ASDServiceBroker_getPurchaseServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSkannerServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getSkannerServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSkannerServiceWithReplyHandler:", v5);

}

uint64_t __59__ASDServiceBroker_getSkannerServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getStoreKitExternalNotificationServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BECF8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getStoreKitExternalNotificationServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__ASDServiceBroker_getStoreKitExternalNotificationServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getTestFlightFeedbackServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ASDServiceBroker_getTestFlightFeedbackServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getTestFlightFeedbackServiceWithReplyHandler:", v5);

}

uint64_t __70__ASDServiceBroker_getTestFlightFeedbackServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getTestFlightFeedbackServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BED20;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getTestFlightFeedbackServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__ASDServiceBroker_getTestFlightFeedbackServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getUpdatesServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BED48;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getUpdatesServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__ASDServiceBroker_getUpdatesServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getRepairServiceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__ASDServiceBroker_getRepairServiceWithError___block_invoke;
  v10[3] = &unk_1E37BDFB0;
  v10[4] = &v17;
  -[ASDServiceBroker _synchronousRemoteObjectProxyWithErrorHandler:](self, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __46__ASDServiceBroker_getRepairServiceWithError___block_invoke_2;
  v9[3] = &unk_1E37BED70;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "getRepairServiceWithReplyHandler:", v9);

  v6 = (void *)v12[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __46__ASDServiceBroker_getRepairServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__ASDServiceBroker_getRepairServiceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getRepairServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ASDServiceBroker_getRepairServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRepairServiceWithReplyHandler:", v5);

}

uint64_t __58__ASDServiceBroker_getRepairServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getRestoreServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getRestoreServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRestoreServiceWithReplyHandler:", v5);

}

uint64_t __59__ASDServiceBroker_getRestoreServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getUpdatesServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ASDServiceBroker_getUpdatesServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BDB60;
  v8 = v4;
  v5 = v4;
  -[ASDServiceBroker _remoteObjectProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUpdatesServiceWithReplyHandler:", v5);

}

uint64_t __59__ASDServiceBroker_getUpdatesServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__ASDServiceBroker__synchronousRemoteObjectProxyWithErrorHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "synchronousRemoteObjectProxyWithErrorHandler:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
