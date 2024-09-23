@implementation CSIndexConnection

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __49__CSIndexConnection_sendMessageAsync_completion___block_invoke;
  v8[3] = &unk_1E2401FB8;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CSIndexConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v6 = v9;
  -[CSXPCConnection sendMessageAsync:completion:](&v7, sel_sendMessageAsync_completion_, a3, v8);

}

+ (id)sharedConnectionForUser:(unsigned int)a3
{
  _QWORD block[4];
  unsigned int v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSIndexConnection_sharedConnectionForUser___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v5 = a3;
  if (sharedConnectionForUser__onceToken != -1)
    dispatch_once(&sharedConnectionForUser__onceToken, block);
  return (id)sharedConnectionForUser__sCSIndexConnection;
}

uint64_t __45__CSIndexConnection_sharedConnectionForUser___block_invoke(uint64_t a1)
{
  CSIndexConnection *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = sConnectionName;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "sConnectionName: %@", (uint8_t *)&v6, 0xCu);
  }
  v2 = [CSIndexConnection alloc];
  v3 = -[CSXPCConnection initWithMachServiceName:](v2, "initWithMachServiceName:", sConnectionName);
  v4 = (void *)sharedConnectionForUser__sCSIndexConnection;
  sharedConnectionForUser__sCSIndexConnection = v3;

  objc_msgSend((id)sharedConnectionForUser__sCSIndexConnection, "_setUser:", *(unsigned int *)(a1 + 32));
  return objc_msgSend((id)sharedConnectionForUser__sCSIndexConnection, "setPrivateDaemon:", sPrivateDaemon);
}

uint64_t __49__CSIndexConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleError:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSIndexConnection;
  -[CSXPCConnection handleError:](&v3, sel_handleError_, a3);
}

@end
