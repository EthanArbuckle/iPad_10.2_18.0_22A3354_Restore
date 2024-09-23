@implementation FSClient

+ (void)initialize
{
  objc_msgSend(MEMORY[0x24BDD1540], "fskit_initLocalizationStrings");
}

- (void)setupHandlers
{
  NSXPCConnection *conn;
  uint64_t v4;
  NSXPCConnection *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  conn = self->_conn;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__FSClient_setupHandlers__block_invoke;
  v8[3] = &unk_250C31E00;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInterruptionHandler:](conn, "setInterruptionHandler:", v8);
  v5 = self->_conn;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __25__FSClient_setupHandlers__block_invoke_3;
  v6[3] = &unk_250C31E00;
  objc_copyWeak(&v7, &location);
  -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__FSClient_setupHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__FSClient_setupHandlers__block_invoke_2;
    block[3] = &unk_250C32490;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __25__FSClient_setupHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

void __25__FSClient_setupHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__FSClient_setupHandlers__block_invoke_4;
    block[3] = &unk_250C32490;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __25__FSClient_setupHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

- (void)handleInvalidated
{
  FSClient *v2;
  FSClientTaskUpdateHandler *fsClientTaskUpdateHandler;
  void *v4;
  void *v5;
  id v6;

  v2 = self;
  objc_sync_enter(v2);
  fsClientTaskUpdateHandler = v2->_fsClientTaskUpdateHandler;
  if (fsClientTaskUpdateHandler)
  {
    -[FSClientTaskUpdateHandler taskHandler](fsClientTaskUpdateHandler, "taskHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FSClientTaskUpdateHandler setTaskHandler:](v2->_fsClientTaskUpdateHandler, "setTaskHandler:", 0);
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  v4 = v6;
  if (v6)
  {
    fs_errorForPOSIXError(4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v5);

    v4 = v6;
  }

}

- (FSClient)init
{
  FSClient *v2;
  uint64_t v3;
  NSXPCConnection *conn;
  void *v5;
  FSClientTaskUpdateHandler *v6;
  FSClientTaskUpdateHandler *fsClientTaskUpdateHandler;
  NSXPCConnection *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  FSClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v17[16];
  _QWORD v18[5];
  _QWORD v19[5];
  objc_super v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v21 = 0;
  v22[0] = &v21;
  v22[1] = 0x3032000000;
  v22[2] = __Block_byref_object_copy__2;
  v22[3] = __Block_byref_object_dispose__2;
  v23 = 0;
  v20.receiver = self;
  v20.super_class = (Class)FSClient;
  v2 = -[FSClient init](&v20, sel_init);
  if (!v2)
  {
    v10 = 0;
LABEL_12:
    v2 = v2;

    v12 = v2;
    goto LABEL_13;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.filesystems.fskitd"), 4096);
  conn = v2->_conn;
  v2->_conn = (NSXPCConnection *)v3;

  if (v2->_conn)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A15F68);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_conn, "setRemoteObjectInterface:", v5);

    -[FSClient setupHandlers](v2, "setupHandlers");
    -[NSXPCConnection resume](v2->_conn, "resume");
    v6 = objc_alloc_init(FSClientTaskUpdateHandler);
    fsClientTaskUpdateHandler = v2->_fsClientTaskUpdateHandler;
    v2->_fsClientTaskUpdateHandler = v6;

    v8 = v2->_conn;
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __16__FSClient_init__block_invoke;
    v19[3] = &unk_250C32768;
    v19[4] = &v21;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __16__FSClient_init__block_invoke_2;
    v18[3] = &unk_250C32768;
    v18[4] = &v21;
    objc_msgSend(v10, "switchToFSKit:", v18);
    if (*(_QWORD *)(v22[0] + 40))
    {

      fskit_std_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FSClient init].cold.1((uint64_t)v22, v11);

      v2 = 0;
    }
    else
    {
      fskit_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_DEFAULT, "Setting remote protocol to all XPC", v17, 2u);
      }

      +[FSKitConstants FSAllClientXPCProtocols](FSKitConstants, "FSAllClientXPCProtocols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v2->_conn, "setRemoteObjectInterface:", v14);

      +[FSKitConstants FSClientHostXPCProtocol](FSKitConstants, "FSClientHostXPCProtocol");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v2->_conn, "setExportedInterface:", v15);

      -[NSXPCConnection setExportedObject:](v2->_conn, "setExportedObject:", v2->_fsClientTaskUpdateHandler);
    }
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __16__FSClient_init__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __16__FSClient_init__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)dealloc
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  objc_super v5;

  conn = self->_conn;
  if (conn)
  {
    -[NSXPCConnection invalidate](conn, "invalidate");
    v4 = self->_conn;
    self->_conn = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)FSClient;
  -[FSClient dealloc](&v5, sel_dealloc);
}

+ (void)fetchInstalledExtensionsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "installedExtensions:", v3);

}

+ (id)installedExtensionsWithError:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void *)objc_opt_new();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__FSClient_installedExtensionsWithError___block_invoke;
  v7[3] = &unk_250C32898;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v4, "installedExtensionsSync:", v7);
  *a3 = objc_retainAutorelease((id)v15[5]);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __41__FSClient_installedExtensionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FSClientTaskUpdateHandler)fsClientTaskUpdateHandler
{
  return (FSClientTaskUpdateHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFsClientTaskUpdateHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsClientTaskUpdateHandler, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)installedExtensions:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  conn = self->_conn;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__FSClient_Private__installedExtensions___block_invoke;
  v12[3] = &unk_250C31EC8;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __41__FSClient_Private__installedExtensions___block_invoke_2;
  v10[3] = &unk_250C328C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "installedExtensions:", v10);

}

uint64_t __41__FSClient_Private__installedExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__FSClient_Private__installedExtensions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)installedExtensionsSync:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  conn = self->_conn;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__FSClient_Private__installedExtensionsSync___block_invoke;
  v12[3] = &unk_250C31EC8;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __45__FSClient_Private__installedExtensionsSync___block_invoke_2;
  v10[3] = &unk_250C328C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "installedExtensions:", v10);

}

uint64_t __45__FSClient_Private__installedExtensionsSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__FSClient_Private__installedExtensionsSync___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)installedExtensionsForUser:(id *)a3 replyHandler:(id)a4
{
  id v6;
  NSXPCConnection *conn;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v11;
  id v12;
  _OWORD v13[2];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  conn = self->_conn;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke;
  v16[3] = &unk_250C31EC8;
  v9 = v6;
  v17 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke_2;
  v14[3] = &unk_250C328C0;
  v15 = v9;
  v11 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v11;
  v12 = v9;
  objc_msgSend(v10, "installedExtensionsForAuditToken:replyHandler:", v13, v14);

}

uint64_t __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)installedExtensionWithShortName:(id)a3 synchronous:(BOOL)a4 replyHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSXPCConnection *conn;
  uint64_t v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  conn = self->_conn;
  v11 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke;
    v22[3] = &unk_250C31EC8;
    v12 = &v23;
    v23 = v8;
    v13 = a3;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_2;
    v20[3] = &unk_250C31EC8;
    v12 = &v21;
    v21 = v8;
    v15 = a3;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v20);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_3;
  v18[3] = &unk_250C328E8;
  v19 = v9;
  v17 = v9;
  objc_msgSend(v16, "installedExtensionWithShortName:replyHandler:", a3, v18);

}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentTasks:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__FSClient_Private__currentTasks___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTasks:", v6);

}

uint64_t __34__FSClient_Private__currentTasks___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentTasksSync:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__FSClient_Private__currentTasksSync___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTasks:", v6);

}

uint64_t __38__FSClient_Private__currentTasksSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentResourceIDs:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  conn = self->_conn;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__FSClient_Private__currentResourceIDs___block_invoke;
  v12[3] = &unk_250C31EC8;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __40__FSClient_Private__currentResourceIDs___block_invoke_2;
  v10[3] = &unk_250C328C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "currentResourceIDs:", v10);

}

uint64_t __40__FSClient_Private__currentResourceIDs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__FSClient_Private__currentResourceIDs___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentResourceIDsSync:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  conn = self->_conn;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__FSClient_Private__currentResourceIDsSync___block_invoke;
  v12[3] = &unk_250C31EC8;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__FSClient_Private__currentResourceIDsSync___block_invoke_2;
  v10[3] = &unk_250C328C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "currentResourceIDs:", v10);

}

uint64_t __44__FSClient_Private__currentResourceIDsSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__FSClient_Private__currentResourceIDsSync___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentContainers:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__FSClient_Private__currentContainers___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContainers:", v6);

}

uint64_t __39__FSClient_Private__currentContainers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentContainersSync:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__FSClient_Private__currentContainersSync___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContainers:", v6);

}

uint64_t __43__FSClient_Private__currentContainersSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSXPCConnection *conn;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  conn = self->_conn;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke;
  v18[3] = &unk_250C31EC8;
  v11 = v8;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke_2;
  v16[3] = &unk_250C32910;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "probeResource:usingBundle:replyHandler:", v13, v12, v16);

}

uint64_t __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  _OWORD v17[2];
  _QWORD v18[4];
  id v19;

  v10 = a6;
  conn = self->_conn;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__FSClient_Private__probeResource_usingBundle_auditToken_replyHandler___block_invoke;
  v18[3] = &unk_250C31EC8;
  v19 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a5->var0[4];
  v17[0] = *(_OWORD *)a5->var0;
  v17[1] = v16;
  objc_msgSend(v15, "probeResource:usingBundle:auditToken:replyHandler:", v14, v13, v17, v12);

}

uint64_t __71__FSClient_Private__probeResource_usingBundle_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)probeResourceSync:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSXPCConnection *conn;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  conn = self->_conn;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke;
  v18[3] = &unk_250C31EC8;
  v11 = v8;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke_2;
  v16[3] = &unk_250C32910;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "probeResource:usingBundle:replyHandler:", v13, v12, v16);

}

uint64_t __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  NSXPCConnection *conn;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v12 = a6;
  v13 = a7;
  conn = self->_conn;
  v15 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke;
  v26[3] = &unk_250C31EC8;
  v16 = v13;
  v27 = v16;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke_2;
  v23[3] = &unk_250C32938;
  v24 = v12;
  v25 = v16;
  v21 = v12;
  v22 = v16;
  objc_msgSend(v20, "checkResource:usingBundle:options:connection:replyHandler:", v19, v18, v17, v21, v23);

}

uint64_t __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didStart");
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  NSXPCConnection *conn;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  __int128 v23;
  id v24;
  id v25;
  _OWORD v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v14 = a7;
  v15 = a8;
  conn = self->_conn;
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke;
  v30[3] = &unk_250C31EC8;
  v18 = v15;
  v31 = v18;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2;
  v27[3] = &unk_250C32938;
  v28 = v14;
  v29 = v18;
  v23 = *(_OWORD *)&a6->var0[4];
  v26[0] = *(_OWORD *)a6->var0;
  v26[1] = v23;
  v24 = v14;
  v25 = v18;
  objc_msgSend(v22, "checkResource:usingBundle:options:auditToken:connection:replyHandler:", v21, v20, v19, v26, v24, v27);

}

uint64_t __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didStart");
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  NSXPCConnection *conn;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v12 = a6;
  v13 = a7;
  conn = self->_conn;
  v15 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke;
  v26[3] = &unk_250C31EC8;
  v16 = v13;
  v27 = v16;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke_2;
  v23[3] = &unk_250C32938;
  v24 = v12;
  v25 = v16;
  v21 = v12;
  v22 = v16;
  objc_msgSend(v20, "formatResource:usingBundle:options:connection:replyHandler:", v19, v18, v17, v21, v23);

}

uint64_t __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didStart");
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  NSXPCConnection *conn;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  __int128 v23;
  id v24;
  id v25;
  _OWORD v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v14 = a7;
  v15 = a8;
  conn = self->_conn;
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke;
  v30[3] = &unk_250C31EC8;
  v18 = v15;
  v31 = v18;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2;
  v27[3] = &unk_250C32938;
  v28 = v14;
  v29 = v18;
  v23 = *(_OWORD *)&a6->var0[4];
  v26[0] = *(_OWORD *)a6->var0;
  v26[1] = v23;
  v24 = v14;
  v25 = v18;
  objc_msgSend(v22, "formatResource:usingBundle:options:auditToken:connection:replyHandler:", v21, v20, v19, v26, v24, v27);

}

uint64_t __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didStart");
}

- (void)setTaskUpdateHandler:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *conn;
  uint64_t v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  conn = self->_conn;
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke;
  v18[3] = &unk_250C31EC8;
  v10 = v7;
  v19 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v12 = v6 != 0;
  v15[2] = __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke_2;
  v15[3] = &unk_250C32960;
  v15[4] = self;
  v16 = v6;
  v17 = v10;
  v13 = v10;
  v14 = v6;
  objc_msgSend(v11, "setTaskUpdateInterest:replyHandler:", v12, v15);

}

uint64_t __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTaskHandler:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v4);

    v3 = 0;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)getFSProgressForTask:(id)a3 replyHandler:(id)a4
{
  id v6;
  NSXPCConnection *conn;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  conn = self->_conn;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke;
  v15[3] = &unk_250C31EC8;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_2;
  v13[3] = &unk_250C329B0;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "getProgressPortForTask:replyHandler:", v10, v13);

}

uint64_t __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_3;
    v6[3] = &unk_250C32988;
    v7 = *(id *)(a1 + 32);
    +[FSTaskProgress constructFromListener:description:replyHandler:](FSTaskProgress, "constructFromListener:description:replyHandler:", a2, a3, v6);

  }
}

uint64_t __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelTask:(id)a3 replyHandler:(id)a4
{
  id v6;
  NSXPCConnection *conn;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  conn = self->_conn;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__FSClient_Private__cancelTask_replyHandler___block_invoke;
  v11[3] = &unk_250C31EC8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelTask:replyHandler:", v9, v8);

}

uint64_t __45__FSClient_Private__cancelTask_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateVolumeName:(id)a3 usingBundle:(id)a4 volumeID:(id)a5 replyHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  BOOL v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "UTF8String");
  fskit_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:]";
    v33 = 2080;
    v34 = v14;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    _os_log_debug_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEBUG, "%s:start:%s:%@:%@", buf, 0x2Au);
  }

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fskit.exfat")))
  {
    if ((unint64_t)objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 10) <= 0x16)
    {
      v16 = 0;
      v17 = 1;
      v18 = "\"*/:<>?\\|";
      goto LABEL_18;
    }
LABEL_8:
    v16 = CFSTR("Volume name exceeds 11 characters");
    goto LABEL_34;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fskit.msdos")))
  {
    if ((unint64_t)objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4) > 0xB)
      goto LABEL_8;
    v16 = 0;
    v17 = 1;
    v18 = "\"*+,./:;<=>?[\\]|";
  }
  else
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fskit.apfs")))
    {
      if ((unint64_t)objc_msgSend(v13, "length") <= 0x100)
        goto LABEL_28;
      v16 = CFSTR("Volume name exceeds 256 characters");
      goto LABEL_34;
    }
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fskit.hfs")))
    {
      fskit_std_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:].cold.2();

      v16 = CFSTR("Unknown bundle");
      goto LABEL_34;
    }
    v19 = objc_msgSend(v13, "length");
    v17 = v19 < 0x100;
    if (v19 >= 0x100)
      v16 = CFSTR("Volume name exceeds 255 characters");
    else
      v16 = 0;
    v18 = "/:";
  }
LABEL_18:
  if (objc_msgSend(v13, "length"))
  {
    v20 = 0;
    while (1)
    {
      v21 = *(unsigned __int8 *)(v14 + v20);
      if (v21 == 32 && v20 == 0)
        break;
      if (v21 < 0x20 || strchr(v18, v21))
      {
        v16 = CFSTR("Volume name contains invalid characters");
        goto LABEL_34;
      }
      if (objc_msgSend(v13, "length") <= (unint64_t)++v20)
        goto LABEL_27;
    }
    v16 = CFSTR("Volume name starts with a space");
    goto LABEL_34;
  }
LABEL_27:
  if (v17)
  {
LABEL_28:
    v23 = 0;
    goto LABEL_37;
  }
LABEL_34:
  fskit_std_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:].cold.1();

  v26 = (void *)MEMORY[0x24BDD1540];
  v27 = *MEMORY[0x24BDD1128];
  v29 = *MEMORY[0x24BDD0FD8];
  v30 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 22, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
  v12[2](v12, v23);

}

- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__FSClient_Private__activateVolume_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateVolume:shortName:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __67__FSClient_Private__activateVolume_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  +[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", CFSTR("-f"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __69__FSClient_Private__deactivateVolume_shortName_options_replyHandler___block_invoke;
    v19 = &unk_250C329D8;
    v20 = v14;
    v21 = &v22;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v16);

  }
  -[FSClient deactivateVolume:shortName:numericOptions:replyHandler:](self, "deactivateVolume:shortName:numericOptions:replyHandler:", v10, v11, v23[3], v13, v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);
}

uint64_t __69__FSClient_Private__deactivateVolume_shortName_options_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1uLL;
  return result;
}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 synchronousReplyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__FSClient_Private__loadResource_shortName_options_synchronousReplyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadResource:shortName:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __76__FSClient_Private__loadResource_shortName_options_synchronousReplyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__FSClient_Private__loadResource_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadResource:shortName:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __65__FSClient_Private__loadResource_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  NSXPCConnection *conn;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __int128 v19;
  _OWORD v20[2];
  _QWORD v21[4];
  id v22;

  v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __78__FSClient_Private__loadResource_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_250C31EC8;
  v22 = v12;
  v14 = v12;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  objc_msgSend(v18, "loadResource:usingBundle:options:auditToken:replyHandler:", v17, v16, v15, v20, v14);

}

uint64_t __78__FSClient_Private__loadResource_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSXPCConnection *conn;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  conn = self->_conn;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__FSClient_Private__setEnabledStateForIdentifier_newState_replyHandler___block_invoke;
  v13[3] = &unk_250C31EC8;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabledStateForIdentifier:newState:replyHandler:", v11, v5, v10);

}

uint64_t __72__FSClient_Private__setEnabledStateForIdentifier_newState_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__FSClient_Project__activateVolume_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateVolume:usingBundle:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __69__FSClient_Project__activateVolume_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  NSXPCConnection *conn;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __int128 v19;
  _OWORD v20[2];
  _QWORD v21[4];
  id v22;

  v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __80__FSClient_Project__activateVolume_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_250C31EC8;
  v22 = v12;
  v14 = v12;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  objc_msgSend(v18, "activateVolume:usingBundle:options:auditToken:replyHandler:", v17, v16, v15, v20, v14);

}

uint64_t __80__FSClient_Project__activateVolume_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  conn = self->_conn;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__FSClient_Project__deactivateVolume_shortName_numericOptions_replyHandler___block_invoke;
  v16[3] = &unk_250C31EC8;
  v17 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deactivateVolume:shortName:numericOptions:replyHandler:", v14, v13, a5, v12);

}

uint64_t __76__FSClient_Project__deactivateVolume_shortName_numericOptions_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  NSXPCConnection *conn;
  id v14;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  _OWORD v19[2];
  _QWORD v20[4];
  id v21;

  v12 = a7;
  conn = self->_conn;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __89__FSClient_Project__deactivateVolume_usingBundle_numericOptions_auditToken_replyHandler___block_invoke;
  v20[3] = &unk_250C31EC8;
  v21 = v12;
  v14 = v12;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)&a6->var0[4];
  v19[0] = *(_OWORD *)a6->var0;
  v19[1] = v18;
  objc_msgSend(v17, "deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:", v16, v15, a5, v19, v14);

}

uint64_t __89__FSClient_Project__deactivateVolume_usingBundle_numericOptions_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  conn = self->_conn;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__FSClient_Project__deactivateVolume_usingBundle_numericOptions_replyHandler___block_invoke;
  v16[3] = &unk_250C31EC8;
  v17 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deactivateVolume:usingBundle:numericOptions:replyHandler:", v14, v13, a5, v12);

}

uint64_t __78__FSClient_Project__deactivateVolume_usingBundle_numericOptions_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__FSClient_Project__loadResource_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadResource:usingBundle:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __67__FSClient_Project__loadResource_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__FSClient_Project__unloadResource_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unloadResource:usingBundle:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __69__FSClient_Project__unloadResource_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10;
  NSXPCConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__FSClient_Project__unloadResource_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_250C31EC8;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unloadResource:shortName:options:replyHandler:", v15, v14, v13, v12);

}

uint64_t __67__FSClient_Project__unloadResource_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12;
  NSXPCConnection *conn;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __int128 v19;
  _OWORD v20[2];
  _QWORD v21[4];
  id v22;

  v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __80__FSClient_Project__unloadResource_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_250C31EC8;
  v22 = v12;
  v14 = v12;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  objc_msgSend(v18, "unloadResource:usingBundle:options:auditToken:replyHandler:", v17, v16, v15, v20, v14);

}

uint64_t __80__FSClient_Project__unloadResource_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)init
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "Error connecting to fskitd: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
