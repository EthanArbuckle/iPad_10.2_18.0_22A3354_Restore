@implementation DIBaseServiceDelegate

- (DIBaseServiceDelegate)init
{
  DIBaseServiceDelegate *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  DIBaseServiceDelegate *v5;
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
  v11.super_class = (Class)DIBaseServiceDelegate;
  v2 = -[DIBaseServiceDelegate init](&v11, sel_init);
  if (v2
    && (v3 = dispatch_queue_create(0, MEMORY[0x24BDAC9C0]),
        dispatchQueue = v2->_dispatchQueue,
        v2->_dispatchQueue = (OS_dispatch_queue *)v3,
        dispatchQueue,
        !v2->_dispatchQueue))
  {
    v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      v13 = 29;
      v14 = 2080;
      v15 = "-[DIBaseServiceDelegate init]";
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
        v13 = 29;
        v14 = 2080;
        v15 = "-[DIBaseServiceDelegate init]";
        _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_ERROR, "%.*s: Failed creating queue", buf, 0x12u);
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

- (BOOL)setupNewConnection:(id)a3
{
  return 0;
}

- (id)serviceName
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  BOOL v10;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uid_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158722;
    v13 = 60;
    v14 = 2080;
    v15 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
    v16 = 1024;
    v17 = objc_msgSend(v5, "processIdentifier");
    v18 = 1024;
    v19 = objc_msgSend(v5, "effectiveUserIdentifier");
    v20 = 1024;
    v21 = geteuid();
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158722;
      v13 = 60;
      v14 = 2080;
      v15 = "-[DIBaseServiceDelegate listener:shouldAcceptNewConnection:]";
      v16 = 1024;
      v17 = objc_msgSend(v5, "processIdentifier");
      v18 = 1024;
      v19 = objc_msgSend(v5, "effectiveUserIdentifier");
      v20 = 1024;
      v21 = geteuid();
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Received connection from pid %d with euid %d. Our euid is %d", buf, 0x24u);
    }

  }
  *__error() = v6;
  v10 = -[DIBaseServiceDelegate setupNewConnection:](self, "setupNewConnection:", v5);
  objc_msgSend(v5, "resume");
  -[DIBaseServiceDelegate validateConnection](self, "validateConnection");

  return v10;
}

- (void)createListener
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v3);

}

- (void)startXPClistener
{
  void *v3;
  id v4;

  -[DIBaseServiceDelegate createListener](self, "createListener");
  -[DIBaseServiceDelegate listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[DIBaseServiceDelegate listener](self, "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
