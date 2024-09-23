@implementation NARApplicationWorkspace

- (NARApplicationWorkspace)init
{
  NARApplicationWorkspace *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NARApplicationWorkspace;
  v2 = -[NARApplicationWorkspace init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanoappregistry.xpc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NARApplicationWorkspace;
  -[NARApplicationWorkspace dealloc](&v3, sel_dealloc);
}

- (id)workspaceInfo:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[NARApplicationWorkspace queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke;
  block[3] = &unk_24E06CB80;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_loadConnectionIfNeeded");
  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke_2;
  v7[3] = &unk_24E06CB30;
  v7[4] = v3;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __41__NARApplicationWorkspace_workspaceInfo___block_invoke_3;
  v6[3] = &unk_24E06CB58;
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "getWorkspaceInfoWithCompletion:", v6);

}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41__NARApplicationWorkspace_workspaceInfo___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getWorkspaceInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[NARApplicationWorkspace queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke;
    v6[3] = &unk_24E06CBF8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_loadConnectionIfNeeded");
  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_24E06CBA8;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_workspaceServiceWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_3;
  v5[3] = &unk_24E06CBD0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "getWorkspaceInfoWithCompletion:", v5);

}

uint64_t __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__NARApplicationWorkspace_getWorkspaceInfoWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getWorkspaceInfoIncludingHiddenApps:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (v6)
  {
    -[NARApplicationWorkspace queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke;
    block[3] = &unk_24E06CC20;
    block[4] = self;
    v9 = v6;
    v10 = a3;
    dispatch_async(v7, block);

  }
}

void __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_loadConnectionIfNeeded");
  v2 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_2;
  v8[3] = &unk_24E06CBA8;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_workspaceServiceWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_3;
  v6[3] = &unk_24E06CBD0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "getWorkspaceInfoIncludingHiddenApps:completion:", v5, v6);

}

uint64_t __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__NARApplicationWorkspace_getWorkspaceInfoIncludingHiddenApps_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_workspaceServiceWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  _QWORD block[5];

  -[NARApplicationWorkspace queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NARApplicationWorkspace__connectionInvalidated__block_invoke;
  block[3] = &unk_24E06CC48;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__NARApplicationWorkspace__connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)_loadConnectionIfNeeded
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.nanoappregistry.workspace"), 0);
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    NARWorkspaceServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = self->_connection;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __50__NARApplicationWorkspace__loadConnectionIfNeeded__block_invoke;
    v11 = &unk_24E06CC70;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", &v8);
    -[NSXPCConnection resume](self->_connection, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__NARApplicationWorkspace__loadConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
