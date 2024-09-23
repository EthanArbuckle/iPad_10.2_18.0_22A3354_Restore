@implementation DIBaseXPCHandler

- (DIBaseXPCHandler)init
{
  DIBaseXPCHandler *v2;
  dispatch_semaphore_t v3;
  void *v4;
  DIBaseXPCHandler *v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)DIBaseXPCHandler;
  v2 = -[DIBaseXPCHandler init](&v11, sel_init);
  if (v2
    && (v3 = dispatch_semaphore_create(0),
        -[DIBaseXPCHandler setSemaphore:](v2, "setSemaphore:", v3),
        v3,
        -[DIBaseXPCHandler semaphore](v2, "semaphore"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      v13 = 24;
      v14 = 2080;
      v15 = "-[DIBaseXPCHandler init]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v13 = 24;
        v14 = 2080;
        v15 = "-[DIBaseXPCHandler init]";
        _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_ERROR, "%.*s: Failed creating semaphore", buf, 0x12u);
      }

    }
    v5 = 0;
    *__error() = v6;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)DIBaseXPCHandler;
  -[DIBaseXPCHandler dealloc](&v4, sel_dealloc);
}

- (id)serviceName
{
  return 0;
}

- (BOOL)connectWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  -[DIBaseXPCHandler createConnection](self, "createConnection");
  -[DIBaseXPCHandler connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DIBaseXPCHandler connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resume");

    -[DIBaseXPCHandler connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __37__DIBaseXPCHandler_connectWithError___block_invoke;
    v14 = &unk_24CEED908;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIBaseXPCHandler setRemoteProxy:](self, "setRemoteProxy:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    v9 = 1;
  }
  else
  {
    v9 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 151, CFSTR("Failed to create XPC connection object"), a3);
  }
  objc_destroyWeak(&location);
  return v9;
}

void __37__DIBaseXPCHandler_connectWithError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v3);

}

- (void)signalCommandCompletedWithXpcError:(id)a3
{
  NSObject *v4;

  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", a3);
  -[DIBaseXPCHandler semaphore](self, "semaphore");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (BOOL)completeCommandWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char *v10;
  _BOOL8 v11;
  NSObject *v12;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DIBaseXPCHandler semaphore](self, "semaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[DIBaseXPCHandler xpcError](self, "xpcError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler setXpcError:](self, "setXpcError:", 0);
  -[DIBaseXPCHandler connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
    {
      v8 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v9 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        v15 = 45;
        v16 = 2080;
        v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
        v18 = 2114;
        v19 = v6;
        v10 = (char *)_os_log_send_and_compose_impl();

        if (v10)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
          free(v10);
        }
      }
      else
      {
        getDIOSLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          v15 = 45;
          v16 = 2080;
          v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
          v18 = 2114;
          v19 = v6;
          _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Got error from last XPC command: %{public}@", buf, 0x1Cu);
        }

      }
      *__error() = v8;
      LOBYTE(v11) = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    v11 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 151, CFSTR("XPC connection failed"), a3);
  }

  return v11;
}

- (void)closeConnection
{
  void *v3;

  -[DIBaseXPCHandler connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[DIBaseXPCHandler setConnection:](self, "setConnection:", 0);
}

- (BOOL)dupStderrWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x24BDD1578]);
  v6 = (void *)objc_msgSend(v5, "initWithFileDescriptor:", fileno((FILE *)*MEMORY[0x24BDAC8D8]));
  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __39__DIBaseXPCHandler_dupStderrWithError___block_invoke;
  v12 = &unk_24CEED908;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "dupWithStderrHandle:reply:", v6, &v9);

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return (char)a3;
}

void __39__DIBaseXPCHandler_dupStderrWithError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "signalCommandCompletedWithXpcError:", v3);

}

- (void)createConnection
{
  int v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    -[DIBaseXPCHandler serviceName](self, "serviceName");
    *(_DWORD *)buf = 68158210;
    v14 = 36;
    v15 = 2080;
    v16 = "-[DIBaseXPCHandler createConnection]";
    v17 = 2114;
    v18 = (id)objc_claimAutoreleasedReturnValue();
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
      -[DIBaseXPCHandler serviceName](self, "serviceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158210;
      v14 = 36;
      v15 = 2080;
      v16 = "-[DIBaseXPCHandler createConnection]";
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_212EB0000, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection with %{public}@", buf, 0x1Cu);

    }
  }
  *__error() = v3;
  v8 = objc_alloc(MEMORY[0x24BDD1988]);
  -[DIBaseXPCHandler serviceName](self, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithServiceName:", v9);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v10);

  -[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v11);

}

- (id)remoteObjectInterface
{
  return 0;
}

- (id)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
  objc_storeStrong(&self->_remoteProxy, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
  objc_storeStrong((id *)&self->_xpcError, a3);
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (void)setIsPrivileged:(BOOL)a3
{
  self->_isPrivileged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcError, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteProxy, 0);
}

@end
