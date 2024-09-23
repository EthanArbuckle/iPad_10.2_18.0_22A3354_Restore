@implementation GDCComputeService

- (id)updateViewWithName:(id)a3 viewUpdateSourceRequests:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  GDCComputeService *v23;
  _QWORD v25[6];
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  GDCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v23 = self;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v7;
    _os_log_impl(&dword_23FE05000, v9, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateViewWithName called: %@", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        GDCLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v7;
          v47 = 2112;
          v48 = v16;
          _os_log_impl(&dword_23FE05000, v15, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateViewWithName: request: %@ %@", buf, 0x16u);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    }
    while (v11);
  }

  v17 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke;
  v26[3] = &unk_25101DF40;
  v18 = v7;
  v27 = v18;
  v28 = &v33;
  -[GDCComputeService synchronousRemoteObjectProxyWithErrorHandler:](v23, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_23;
  v25[3] = &unk_25101DF68;
  v25[4] = &v39;
  v25[5] = &v33;
  objc_msgSend(v19, "updateViewWithName:viewUpdateSourceRequests:reply:", v18, v10, v25);

  v20 = (void *)v40[5];
  if (a5 && !v20)
  {
    *a5 = objc_retainAutorelease((id)v34[5]);
    v20 = (void *)v40[5];
  }
  v21 = v20;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v21;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  GDCComputeService *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[GDCComputeService locked_establishConnection](v5, "locked_establishConnection");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v5->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)locked_establishConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  _QWORD v6[4];
  id v7;
  id buf[2];

  if (!self->_connection)
  {
    GDCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23FE05000, v3, OS_LOG_TYPE_DEFAULT, "GDCComputeService: establishing connection.", (uint8_t *)buf, 2u);
    }

    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.intelligenceplatform.IntelligencePlatformComputeService"));
    connection = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", self->_serverInterface);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global);
    objc_initWeak(buf, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__GDCComputeService_locked_establishConnection__block_invoke_21;
    v6[3] = &unk_25101DF18;
    objc_copyWeak(&v7, buf);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v6);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (GDCComputeService)init
{
  GDCComputeService *v2;
  uint64_t v3;
  NSXPCInterface *serverInterface;
  NSXPCInterface *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSXPCInterface *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GDCComputeService;
  v2 = -[GDCComputeService init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256F90678);
    v3 = objc_claimAutoreleasedReturnValue();
    serverInterface = v2->_serverInterface;
    v2->_serverInterface = (NSXPCInterface *)v3;

    v5 = v2->_serverInterface;
    v6 = (void *)MEMORY[0x24267A648]();
    v7 = objc_alloc(MEMORY[0x24BDBCF20]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_updateViewWithName_viewUpdateSourceRequests_reply_, 0, 1);

    v10 = v2->_serverInterface;
    v11 = (void *)MEMORY[0x24267A648]();
    v12 = objc_alloc(MEMORY[0x24BDBCF20]);
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v11);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_updateGroupWithName_namesAndRequests_reply_, 0, 1);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GDCComputeService;
  -[GDCComputeService dealloc](&v3, sel_dealloc);
}

void __47__GDCComputeService_locked_establishConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  GDCLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __47__GDCComputeService_locked_establishConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __47__GDCComputeService_locked_establishConnection__block_invoke_21(uint64_t a1)
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
  _QWORD *v12;
  void *v13;

  GDCLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__GDCComputeService_locked_establishConnection__block_invoke_21_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_sync_enter(v12);
    v13 = (void *)v12[1];
    v12[1] = 0;

    objc_sync_exit(v12);
  }

}

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  GDCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)updateGroupWithName:(id)a3 namesAndRequests:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  GDCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_23FE05000, v10, OS_LOG_TYPE_DEFAULT, "GDCComputeService: updateGroupWithName called: %@", buf, 0xCu);
  }

  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke;
  v18[3] = &unk_25101DF40;
  v12 = v8;
  v19 = v12;
  v20 = &v21;
  -[GDCComputeService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_25;
  v17[3] = &unk_25101DF68;
  v17[4] = &v27;
  v17[5] = &v21;
  objc_msgSend(v13, "updateGroupWithName:namesAndRequests:reply:", v12, v9, v17);

  v14 = (void *)v28[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v14 = (void *)v28[5];
  }
  v15 = v14;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  GDCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)clearViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  GDCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v8;
    v32 = 1024;
    v33 = v6;
    _os_log_impl(&dword_23FE05000, v9, OS_LOG_TYPE_DEFAULT, "GDCComputeService: clearViewWithName called [name: %@, fullRebuild: %d]", buf, 0x12u);
  }

  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke;
  v17[3] = &unk_25101DF40;
  v11 = v8;
  v18 = v11;
  v19 = &v20;
  -[GDCComputeService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_26;
  v16[3] = &unk_25101DF90;
  v16[4] = &v26;
  v16[5] = &v20;
  objc_msgSend(v12, "clearViewWithName:fullRebuild:reply:", v11, v6, v16);

  v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v13 = *((unsigned __int8 *)v27 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  GDCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_26(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)truncateViewWithName:(id)a3 fullRebuild:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  GDCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v8;
    v32 = 1024;
    v33 = v6;
    _os_log_impl(&dword_23FE05000, v9, OS_LOG_TYPE_DEFAULT, "GDCComputeService: truncateViewWithName called [name: %@, fullRebuild: %d]", buf, 0x12u);
  }

  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke;
  v17[3] = &unk_25101DF40;
  v11 = v8;
  v18 = v11;
  v19 = &v20;
  -[GDCComputeService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_28;
  v16[3] = &unk_25101DF90;
  v16[4] = &v26;
  v16[5] = &v20;
  objc_msgSend(v12, "truncateViewWithName:fullRebuild:reply:", v11, v6, v16);

  v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v13 = *((unsigned __int8 *)v27 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  GDCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_28(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)stopWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint8_t buf[16];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  GDCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FE05000, v5, OS_LOG_TYPE_DEFAULT, "GDCComputeService: stop called", buf, 2u);
  }

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__GDCComputeService_stopWithError___block_invoke;
  v12[3] = &unk_25101DFB8;
  v12[4] = &v14;
  -[GDCComputeService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __35__GDCComputeService_stopWithError___block_invoke_29;
  v11[3] = &unk_25101DF90;
  v11[4] = &v20;
  v11[5] = &v14;
  objc_msgSend(v7, "stopWithReply:", v11);

  v8 = *((unsigned __int8 *)v21 + 24);
  if (a3 && !*((_BYTE *)v21 + 24))
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v8 = *((unsigned __int8 *)v21 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __35__GDCComputeService_stopWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  GDCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __35__GDCComputeService_stopWithError___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __35__GDCComputeService_stopWithError___block_invoke_29(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __47__GDCComputeService_locked_establishConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23FE05000, a1, a3, "GDCComputeService: interrupted.", a5, a6, a7, a8, 0);
}

void __47__GDCComputeService_locked_establishConnection__block_invoke_21_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23FE05000, a1, a3, "GDCComputeService: invalidated.", a5, a6, a7, a8, 0);
}

void __71__GDCComputeService_updateViewWithName_viewUpdateSourceRequests_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23FE05000, v0, v1, "GDCComputeService: error during updateViewWithName %@ call: %@");
  OUTLINED_FUNCTION_2();
}

void __64__GDCComputeService_updateGroupWithName_namesAndRequests_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23FE05000, v0, v1, "GDCComputeService: error during updateGroupWithName %@ call: %@");
  OUTLINED_FUNCTION_2();
}

void __57__GDCComputeService_clearViewWithName_fullRebuild_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23FE05000, v0, v1, "GDCComputeService: error during clearViewWithName %@ call: %@");
  OUTLINED_FUNCTION_2();
}

void __60__GDCComputeService_truncateViewWithName_fullRebuild_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23FE05000, v0, v1, "GDCComputeService: error during truncateViewWithName %@ call: %@");
  OUTLINED_FUNCTION_2();
}

void __35__GDCComputeService_stopWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23FE05000, a2, OS_LOG_TYPE_ERROR, "GDCComputeService: error during stop: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
