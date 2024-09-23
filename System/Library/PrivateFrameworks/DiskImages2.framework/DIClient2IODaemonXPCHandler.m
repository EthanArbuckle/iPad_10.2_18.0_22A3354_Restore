@implementation DIClient2IODaemonXPCHandler

- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3
{
  id v5;
  DIClient2IODaemonXPCHandler *v6;
  DIClient2IODaemonXPCHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIClient2IODaemonXPCHandler;
  v6 = -[DIBaseXPCHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_xpcListenerEndpoint, a3);

  return v7;
}

- (void)createConnection
{
  int v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v15 = 47;
    v16 = 2080;
    v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
    v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    getDIOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v15 = 47;
      v16 = 2080;
      v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
      _os_log_impl(&dword_212EB0000, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to IO daemon clients listener", buf, 0x12u);
    }

  }
  *__error() = v3;
  v7 = objc_alloc(MEMORY[0x24BDD1988]);
  -[DIClient2IODaemonXPCHandler xpcListenerEndpoint](self, "xpcListenerEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithListenerEndpoint:", v8);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v9);

  -[DIClient2IODaemonXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v10);

  -[DIBaseXPCHandler connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global_2);

  -[DIBaseXPCHandler connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInterruptionHandler:", &__block_literal_global_3);

}

int *__47__DIClient2IODaemonXPCHandler_createConnection__block_invoke()
{
  int v0;
  NSObject *v1;
  char *v2;
  NSObject *v3;
  int *result;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v1 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v6 = 60;
    v7 = 2080;
    v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
    v2 = (char *)_os_log_send_and_compose_impl();

    if (v2)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v2);
      free(v2);
    }
  }
  else
  {
    getDIOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v6 = 60;
      v7 = 2080;
      v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
      _os_log_impl(&dword_212EB0000, v3, OS_LOG_TYPE_DEFAULT, "%.*s: Reached an invalidation handler for the IO daemon connection", buf, 0x12u);
    }

  }
  result = __error();
  *result = v0;
  return result;
}

int *__47__DIClient2IODaemonXPCHandler_createConnection__block_invoke_2()
{
  int v0;
  NSObject *v1;
  char *v2;
  NSObject *v3;
  int *result;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v1 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v6 = 60;
    v7 = 2080;
    v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
    v2 = (char *)_os_log_send_and_compose_impl();

    if (v2)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v2);
      free(v2);
    }
  }
  else
  {
    getDIOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v6 = 60;
      v7 = 2080;
      v8 = "-[DIClient2IODaemonXPCHandler createConnection]_block_invoke";
      _os_log_impl(&dword_212EB0000, v3, OS_LOG_TYPE_DEFAULT, "%.*s: Reached an interruption handler for the IO daemon connection", buf, 0x12u);
    }

  }
  result = __error();
  *result = v0;
  return result;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B75568);
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __54__DIClient2IODaemonXPCHandler_addToRefCountWithError___block_invoke;
  v10 = &unk_24CEED908;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addToRefCountWithReply:", &v7);

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __54__DIClient2IODaemonXPCHandler_addToRefCountWithError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v3);

}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
}

@end
