@implementation _NSCFServer

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4 interface:(id)a5
{
  id v8;
  _NSCFServer *v9;
  uint64_t v10;
  NSNumber *listenerID;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_NSCFServer;
  v9 = -[_NSCFServer init](&v13, sel_init);
  if (v9)
  {
    ++_listenerIDCounter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v10 = objc_claimAutoreleasedReturnValue();
    listenerID = v9->_listenerID;
    v9->_listenerID = (NSNumber *)v10;

    -[_NSCFServer setType:](v9, "setType:", a3);
    -[_NSCFServer setListenerPort:](v9, "setListenerPort:", a4);
    -[_NSCFServer setInterface:](v9, "setInterface:", v8);
  }

  return v9;
}

- (_NSCFServer)initWithType:(int64_t)a3
{
  return -[_NSCFServer initWithType:port:interface:](self, "initWithType:port:interface:", a3, 0, 0);
}

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4
{
  return -[_NSCFServer initWithType:port:interface:](self, "initWithType:port:interface:", a3, a4, 0);
}

- (_NSCFServer)init
{
  return -[_NSCFServer initWithType:](self, "initWithType:", 0);
}

- (BOOL)start
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[16];

  if (self->_type == 1)
  {
    v3 = objc_opt_class();
    -[_NSCFServer configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __20___NSCFServer_start__block_invoke;
    v8[3] = &unk_1E14F7598;
    v9 = v4;
    v10 = v3;
    v5 = v4;
    v6 = -[_NSCFServer startWithAcceptHandler:]((uint64_t)self, v8);

  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = (id)CFNLog::logger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, "Error: Unknown Server Protocol Type", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)stop
{
  OS_tcp_listener *listener;
  OS_tcp_listener *v4;
  void *v5;

  listener = self->_listener;
  if (listener)
  {
    tcp_listener_cancel();
    v4 = self->_listener;
    self->_listener = 0;

    +[_NSCFServer listeners]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, self->_listenerID);

  }
  return listener != 0;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[_NSCFServer stop](self, "stop");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "Listener deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSCFServer;
  -[_NSCFServer dealloc](&v4, sel_dealloc);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)listenerPort
{
  return self->_listenerPort;
}

- (void)setListenerPort:(int64_t)a3
{
  self->_listenerPort = a3;
}

- (NSString)interface
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isCoprocessorInterfaceEnabled
{
  return self->_enableCoprocessorInterface;
}

- (void)setEnableCoprocessorInterface:(BOOL)a3
{
  self->_enableCoprocessorInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

+ (id)listeners
{
  void *v0;
  id v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)_listeners;
  if (!_listeners)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = (void *)_listeners;
    _listeners = (uint64_t)v1;

    v0 = (void *)_listeners;
  }
  return v0;
}

- (uint64_t)startWithAcceptHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  uint64_t v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  id location[5];
  NSObject *v17;
  id v18;

  v3 = a2;
  if (a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("listener-queue", v4);

    v6 = tcp_listener_create();
    v7 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v6;

    if (*(_QWORD *)(a1 + 56))
    {
      v8 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "UTF8String");
      tcp_listener_set_port();

      location[1] = (id)MEMORY[0x1E0C809B0];
      location[2] = (id)3221225472;
      location[3] = __38___NSCFServer_startWithAcceptHandler___block_invoke;
      location[4] = &unk_1E14F75C0;
      v17 = v5;
      v18 = v3;
      tcp_listener_set_accept_handler();
      objc_initWeak(location, (id)a1);
      v11 = v8;
      objc_copyWeak(&v15, location);
      tcp_listener_set_error_handler();
      objc_msgSend((id)a1, "interface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "UTF8String");
        tcp_listener_set_interface();
      }
      if (objc_msgSend((id)a1, "isCoprocessorInterfaceEnabled"))
        tcp_listener_enable_coprocessor_interface();
      tcp_listener_start();
      *(_QWORD *)(a1 + 24) = __rev16(tcp_listener_get_port());
      +[_NSCFServer listeners]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", a1, *(_QWORD *)(a1 + 48));

      dispatch_semaphore_signal(v11);
      a1 = *(_QWORD *)(a1 + 24) != 0;
      objc_destroyWeak(&v15);

      objc_destroyWeak(location);
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

+ (BOOL)startSocksServerWithPort:(int64_t)a3
{
  _NSCFServer *v4;

  v4 = objc_alloc_init(_NSCFServer);
  -[_NSCFServer setListenerPort:](v4, "setListenerPort:", a3);
  LOBYTE(a3) = -[_NSCFServer startWithAcceptHandler:]((uint64_t)v4, &__block_literal_global_3107);

  return a3;
}

+ (BOOL)stopAll
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)_listeners, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "stop");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = (void *)_listeners;
  _listeners = 0;

  return 1;
}

+ (id)adressesForInterface:(id)a3
{
  id v3;
  void *v4;
  ifaddrs *v5;
  sockaddr *ifa_addr;
  int sa_family;
  char *v8;
  const char *v9;
  NSObject *v10;
  _BOOL4 v11;
  char *ifa_name;
  void *v13;
  char *v14;
  ifaddrs *v15;
  ifaddrs *v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  char *v21;
  char v22[64];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (getifaddrs(&v17))
    perror("getifaddrs");
  v5 = v17;
  if (!v17)
  {
    v15 = 0;
    goto LABEL_23;
  }
  do
  {
    ifa_addr = v5->ifa_addr;
    if (ifa_addr && (v5->ifa_flags & 1) != 0)
    {
      sa_family = ifa_addr->sa_family;
      if (sa_family == 30)
      {
        v8 = &ifa_addr->sa_data[6];
      }
      else
      {
        if (sa_family != 2)
          goto LABEL_20;
        v8 = &ifa_addr->sa_data[2];
      }
      v9 = inet_ntop(sa_family, v8, v22, 0x40u);
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          ifa_name = v5->ifa_name;
          *(_DWORD *)buf = 136315394;
          v19 = ifa_name;
          v20 = 2080;
          v21 = v22;
          _os_log_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s\n", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5->ifa_name);
        v10 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "isEqualToString:", v10))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      else if (v11)
      {
        v14 = v5->ifa_name;
        *(_DWORD *)buf = 136315138;
        v19 = v14;
        _os_log_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEFAULT, "%s: inet_ntop failed!\n", buf, 0xCu);
      }

    }
LABEL_20:
    v5 = v5->ifa_next;
  }
  while (v5);
  v15 = v17;
LABEL_23:
  MEMORY[0x186DB7A08](v15);

  return v4;
}

@end
