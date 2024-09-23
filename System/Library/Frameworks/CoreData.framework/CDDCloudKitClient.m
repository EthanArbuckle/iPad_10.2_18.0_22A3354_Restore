@implementation CDDCloudKitClient

- (CDDCloudKitClient)initWithMachServiceName:(id)a3
{
  CDDCloudKitClient *v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CDDCloudKitClient;
  v4 = -[CDDCloudKitClient init](&v15, sel_init);
  if (v4)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", a3, 0);
    v4->_connection = v5;
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF748A0));
    objc_initWeak(&location, v4);
    connection = v4->_connection;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke;
    v12[3] = &unk_1E1EDE1A0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v12);
    v8 = v4->_connection;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2;
    v10[3] = &unk_1E1EDE1A0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v10);
    -[NSXPCConnection resume](v4->_connection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[9] = 1;

}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[8] = 1;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitClient;
  -[CDDCloudKitClient dealloc](&v3, sel_dealloc);
}

- (BOOL)_valid
{
  return !self->_interrupted && !self->_invalidated;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  CDDCloudKitResponse *v8;
  _QWORD *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__CDDCloudKitClient_handleMessage_reply___block_invoke;
  v10[3] = &unk_1E1EDDBA0;
  v10[4] = &v11;
  v7 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  if (!v7 || (objc_msgSend(v7, "handleMessage:reply:", a3, a4), v12[5]))
  {
    v8 = [CDDCloudKitResponse alloc];
    v9 = -[CDDCloudKitResponse initWithMessage:success:error:](v8, a3, 0, (void *)v12[5]);
    (*((void (**)(id, _QWORD *))a4 + 2))(a4, v9);

  }
  v12[5] = 0;
  _Block_object_dispose(&v11, 8);
}

id __41__CDDCloudKitClient_handleMessage_reply___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
