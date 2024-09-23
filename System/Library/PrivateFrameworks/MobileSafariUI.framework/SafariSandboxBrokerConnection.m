@implementation SafariSandboxBrokerConnection

- (void)_connectionWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    (*((void (**)(id, NSXPCConnection *, _QWORD))v4 + 2))(v4, connection, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.Safari.SandboxBroker"));
    WBSUISafariSandboxBrokerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v9);

    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __66__SafariSandboxBrokerConnection__connectionWithCompletionHandler___block_invoke;
    v13 = &unk_1E9CF25A0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "setInvalidationHandler:", &v10);
    objc_msgSend(v8, "resume", v10, v11, v12, v13);
    objc_storeStrong((id *)p_connection, v8);
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v8, 0);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }

}

void __66__SafariSandboxBrokerConnection__connectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
