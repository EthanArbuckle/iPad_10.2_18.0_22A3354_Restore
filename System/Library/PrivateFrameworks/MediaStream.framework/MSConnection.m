@implementation MSConnection

- (void)_waitForMessageToBeSent
{
  dispatch_semaphore_t v3;
  NSXPCConnection *center;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  center = self->_center;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MSConnection__waitForMessageToBeSent__block_invoke;
  v6[3] = &unk_1E994DA10;
  v7 = v3;
  v5 = v3;
  -[NSXPCConnection addBarrierBlock:](center, "addBarrierBlock:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

- (MSConnection)init
{
  MSConnection *v2;
  uint64_t v3;
  NSXPCConnection *center;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *serverSideConfig;
  dispatch_queue_t v8;
  OS_dispatch_queue *serverSideConfigQueue;
  NSObject *v10;
  _QWORD handler[4];
  MSConnection *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MSConnection;
  v2 = -[MSConnection init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediastream.mstreamd"), 0);
    center = v2->_center;
    v2->_center = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF16308);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_center, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection resume](v2->_center, "resume");
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serverSideConfig = v2->_serverSideConfig;
    v2->_serverSideConfig = v6;

    v8 = dispatch_queue_create("com.apple.MediaStream.MSConnection._serverSideConfigQueue", 0);
    serverSideConfigQueue = v2->_serverSideConfigQueue;
    v2->_serverSideConfigQueue = (OS_dispatch_queue *)v8;

    v10 = v2->_serverSideConfigQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __20__MSConnection_init__block_invoke;
    handler[3] = &unk_1E994D798;
    v13 = v2;
    notify_register_dispatch("MSServerSideConfigurationDidChangeNotification", &v2->_serverSideConfigNotificationToken, v10, handler);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_serverSideConfigNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)MSConnection;
  -[MSConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)enqueueAssetCollections:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSXPCConnection *center;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  char v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v8 = a3;
  v9 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v10 = dispatch_semaphore_create(0);
  center = self->_center;
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke;
  v24[3] = &unk_1E994D488;
  v28 = &v29;
  v24[4] = self;
  v13 = v8;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v15 = v10;
  v27 = v15;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke_75;
  v20[3] = &unk_1E994D4B0;
  v22 = &v29;
  v23 = &v35;
  v17 = v15;
  v21 = v17;
  objc_msgSend(v16, "enqueueAssetCollections:personID:reply:", v13, v14, v20);
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && v30[5])
  {
    -[MSConnection _machErrorWithUnderlyingError:](self, "_machErrorWithUnderlyingError:");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = *((_BYTE *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSXPCConnection *center;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  char v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v8 = a3;
  v9 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v10 = dispatch_semaphore_create(0);
  center = self->_center;
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke;
  v24[3] = &unk_1E994D488;
  v28 = &v29;
  v24[4] = self;
  v13 = v8;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v15 = v10;
  v27 = v15;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke_77;
  v20[3] = &unk_1E994D4B0;
  v22 = &v29;
  v23 = &v35;
  v17 = v15;
  v21 = v17;
  objc_msgSend(v16, "dequeueAssetCollectionWithGUIDs:personID:reply:", v13, v14, v20);
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && v30[5])
  {
    -[MSConnection _machErrorWithUnderlyingError:](self, "_machErrorWithUnderlyingError:");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = *((_BYTE *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

- (void)deleteAssetCollections:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *center;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  center = self->_center;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48__MSConnection_deleteAssetCollections_personID___block_invoke;
  v15 = &unk_1E994D4D8;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteAssetCollections:personID:", v10, v9, v12, v13, v14, v15);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)pollForSubscriptionUpdatesForPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MSConnection_pollForSubscriptionUpdatesForPersonID___block_invoke;
  v8[3] = &unk_1E994D500;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pollForSubscriptionUpdatesForPersonID:", v6);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)checkForOutstandingActivities
{
  id v3;

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_center, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_98);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retryOutstandingActivities");
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)handleSubscriptionPushForPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MSConnection_handleSubscriptionPushForPersonID___block_invoke;
  v8[3] = &unk_1E994D500;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:", v6);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)forgetPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__MSConnection_forgetPersonID___block_invoke;
  v8[3] = &unk_1E994D500;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forgetEverythingForPersonID:", v6);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSXPCConnection *center;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  MSConnection *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  -[NSMutableDictionary objectForKey:](self->_serverSideConfig, "objectForKey:", v4);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v24[5];
  if (!v5)
  {
    v6 = dispatch_semaphore_create(0);
    center = self->_center;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__MSConnection_serverSideConfigurationForPersonID___block_invoke;
    v19[3] = &unk_1E994D548;
    v9 = v4;
    v20 = v9;
    v21 = self;
    v10 = v6;
    v22 = v10;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __51__MSConnection_serverSideConfigurationForPersonID___block_invoke_78;
    v15[3] = &unk_1E994D570;
    v18 = &v23;
    v15[4] = self;
    v16 = v9;
    v12 = v10;
    v17 = v12;
    objc_msgSend(v11, "serverSideConfigurationForPersonID:reply:", v16, v15);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    v5 = (void *)v24[5];
  }
  v13 = v5;
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MSConnection_refreshServerSideConfigurationForPersonID___block_invoke;
  v8[3] = &unk_1E994D500;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refreshServerSideConfigurationForPersonID:", v6);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)resetServerStateForPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MSConnection_resetServerStateForPersonID___block_invoke;
  v8[3] = &unk_1E994D500;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetServerStateForPersonID:", v6);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (void)abortActivitiesForPersonID:(id)a3
{
  id v4;
  NSXPCConnection *center;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  MSConnection *v13;

  v4 = a3;
  center = self->_center;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__MSConnection_abortActivitiesForPersonID___block_invoke;
  v11 = &unk_1E994D4D8;
  v12 = v4;
  v13 = self;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](center, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "abortAllActivityForPersonID:", v6, v8, v9, v10, v11);
  -[MSConnection _waitForMessageToBeSent](self, "_waitForMessageToBeSent");

}

- (id)pause
{
  return -[MSClientSidePauseContext initWithServer:]([MSClientSidePauseContext alloc], "initWithServer:", self->_center);
}

- (void)resume:(id)a3
{
  objc_msgSend(a3, "resume");
}

- (id)_machErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  MSMSLocalizedString(CFSTR("ERROR_MACH_FAILURE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("mstreamdErrorDomain"), 1000, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideConfigQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfig, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

void __43__MSConnection_abortActivitiesForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_machErrorWithUnderlyingError:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MSVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can't abort activities for personID %@: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __44__MSConnection_resetServerStateForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v4;
    v7 = 2114;
    v8 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not reset server state for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __58__MSConnection_refreshServerSideConfigurationForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v4;
    v7 = 2114;
    v8 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not refresh server side configuration for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

intptr_t __51__MSConnection_serverSideConfigurationForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_machErrorWithUnderlyingError:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "MSVerboseDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can't retrieve server-side configuration for personID %@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __51__MSConnection_serverSideConfigurationForPersonID___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", CFSTR("retval"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __31__MSConnection_forgetPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v4;
    v7 = 2114;
    v8 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not send message to forget personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __50__MSConnection_handleSubscriptionPushForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v4;
    v7 = 2114;
    v8 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not handle subscription push for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __45__MSConnection_checkForOutstandingActivities__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not checkForOutstandingActivities: %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

void __54__MSConnection_pollForSubscriptionUpdatesForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v4;
    v7 = 2114;
    v8 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not poll for subscription updates for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __48__MSConnection_deleteAssetCollections_personID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543874;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    v10 = 2114;
    v11 = a2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not delete asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

intptr_t __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_machErrorWithUnderlyingError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not dequeue asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

intptr_t __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("error"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "objectForKey:", CFSTR("retval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "BOOLValue");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_machErrorWithUnderlyingError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not enqueue asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

intptr_t __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("error"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "objectForKey:", CFSTR("retval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "BOOLValue");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __20__MSConnection_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sending local notification that server-side config has changed.", v3, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSCServerSideConfigurationDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

intptr_t __39__MSConnection__waitForMessageToBeSent__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MSConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_once != -1)
    dispatch_once(&sharedConnection_once, block);
  return (id)sharedConnection_conn;
}

void __32__MSConnection_sharedConnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  if (MSMediaStreamInitialize_once != -1)
    dispatch_once(&MSMediaStreamInitialize_once, &__block_literal_global_194);
  +[MSMSPlatform thePlatform](MSMSPlatform, "thePlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MSCoreMediaStreamInitialize();

  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedConnection_conn;
  sharedConnection_conn = (uint64_t)v3;

}

@end
