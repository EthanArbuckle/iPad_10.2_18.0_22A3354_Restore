@implementation NSProxyConnection

- (NSProxyConnection)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSProxyConnection *v13;
  id v14;
  uint64_t v15;
  OS_tcp_connection *connection;
  id v18;
  NSProxyConnection *v19;
  id v20;
  unsigned __int16 v21;
  id location;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)NSProxyConnection;
  v13 = -[NSProxyConnection init](&v23, sel_init);
  if (v13)
  {
    v14 = objc_retainAutorelease(v10);
    objc_msgSend(v14, "UTF8String");
    v15 = tcp_connection_create();
    connection = v13->_connection;
    v13->_connection = (OS_tcp_connection *)v15;

    objc_initWeak(&location, v13);
    objc_copyWeak(&v20, &location);
    v18 = v14;
    v21 = a4;
    v19 = v13;
    tcp_connection_set_event_handler();
    tcp_connection_start();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)read:(unint64_t)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = v5;
  if (self->_connection)
  {
    v7 = v5;
    tcp_connection_read();

  }
}

- (void)write:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  if (self)
    ++self->_pendingWrites;
  v7 = v5;
  v6 = v5;
  tcp_connection_write();

}

- (void)cancel
{
  OS_tcp_connection *connection;

  if (self->_connection)
  {
    tcp_connection_cancel();
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSProxyConnection cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NSProxyConnection;
  -[NSProxyConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __35__NSProxyConnection_write_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    --*(_QWORD *)(v1 + 32);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__NSProxyConnection_read_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__NSProxyConnection_initWithHost_port_queue_configuration___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int error;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained(WeakRetained + 3);

    if (v6)
    {
      if (a2 == 3)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v12 = (id)CFNLog::logger;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(unsigned __int16 *)(a1 + 56);
          v14 = *(_QWORD *)(a1 + 32);
          v16 = 138412802;
          v17 = v14;
          v18 = 1024;
          v19 = v13;
          v20 = 1024;
          error = tcp_connection_get_error();
          _os_log_impl(&dword_183ECA000, v12, OS_LOG_TYPE_DEFAULT, "Failure connecting to: %@:%d error:%d", (uint8_t *)&v16, 0x18u);
        }

        v11 = tcp_connection_get_error();
        v10 = v6;
      }
      else
      {
        if (a2 != 1)
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v15 = (id)CFNLog::logger;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = 67109120;
            LODWORD(v17) = a2;
            _os_log_impl(&dword_183ECA000, v15, OS_LOG_TYPE_DEFAULT, "Event received on outbound connection %d", (uint8_t *)&v16, 8u);
          }

          goto LABEL_21;
        }
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v7 = (id)CFNLog::logger;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(unsigned __int16 *)(a1 + 56);
          v16 = 138412546;
          v17 = v8;
          v18 = 1024;
          v19 = v9;
          _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEFAULT, "Connected to: %@:%d", (uint8_t *)&v16, 0x12u);
        }

        v10 = v6;
        v11 = 0;
      }
      objc_msgSend(v10, "connected:", v11);
LABEL_21:

    }
  }
}

void __43__NSProxyConnection_initWithTCPConnection___block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;
  const char *v3;
  NSObject *v5;
  uint32_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 1:
      return;
    case 2:
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      LOWORD(v7[0]) = 0;
      v3 = "Inbound EVENT_READ_CLOSE";
      goto LABEL_18;
    case 3:
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      LOWORD(v7[0]) = 0;
      v3 = "Inbound EVENT_DISCONNECTED";
      goto LABEL_18;
    case 4:
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      LOWORD(v7[0]) = 0;
      v3 = "Inbound EVENT_WRITE_CLOSE";
LABEL_18:
      v5 = v2;
      v6 = 2;
      break;
    default:
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v7[0] = 67109120;
      v7[1] = a2;
      v3 = "Event received on inbound connection %d";
      v5 = v2;
      v6 = 8;
      break;
  }
  _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)v7, v6);
LABEL_20:

}

@end
