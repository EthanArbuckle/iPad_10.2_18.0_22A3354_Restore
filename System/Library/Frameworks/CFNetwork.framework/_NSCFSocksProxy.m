@implementation _NSCFSocksProxy

- (void)connected:(int)a3
{
  NSProxyConnection *inbound;
  void *v6;
  uint64_t v7;
  NSProxyConnection *v8;
  NSProxyConnection *outbound;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, int);
  void *v13;
  _NSCFSocksProxy *v14;

  inbound = self->_inbound;
  -[__CFN_SocksHandshake finish:](self->_socksHandshake, "finish:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProxyConnection write:handler:](inbound, "write:handler:", v6, &__block_literal_global_7_6274);

  if (a3)
  {
    -[_NSCFSocksProxy cleanup](self, "cleanup");
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = self->_inbound;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __30___NSCFSocksProxy_readInbound__block_invoke;
    v13 = &unk_1E14F96F8;
    v14 = self;
    -[NSProxyConnection read:handler:](v8, "read:handler:", 0x40000, &v10);
    outbound = self->_outbound;
    v10 = v7;
    v11 = 3221225472;
    v12 = __31___NSCFSocksProxy_readOutbound__block_invoke;
    v13 = &unk_1E14F96F8;
    v14 = self;
    -[NSProxyConnection read:handler:](outbound, "read:handler:", 0x40000, &v10);
  }
}

- (void)cleanup
{
  NSProxyConnection *inbound;
  NSProxyConnection *v4;
  NSProxyConnection *outbound;

  -[NSProxyConnection cancel](self->_outbound, "cancel");
  inbound = self->_inbound;
  if (inbound && inbound->_pendingWrites)
  {
    inbound->_doCleanupWhenWritesCompleted = 1;
  }
  else
  {
    -[NSProxyConnection cancel](inbound, "cancel");
    v4 = self->_inbound;
    self->_inbound = 0;

  }
  outbound = self->_outbound;
  self->_outbound = 0;

  objc_msgSend((id)_proxyServers, "removeObject:", self);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[_NSCFSocksProxy proxyServers]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v7 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "Finished ProxyConnection %lu connection(s) left", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)_NSCFSocksProxy;
  -[_NSCFSocksProxy dealloc](&v5, sel_dealloc);
}

- (void)outboundConnectionReceivedData:(id)a3 handler:(id)a4
{
  id v6;
  NSProxyConnection *inbound;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  inbound = self->_inbound;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___NSCFSocksProxy_outboundConnectionReceivedData_handler___block_invoke;
  v9[3] = &unk_1E14FB650;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSProxyConnection write:handler:](inbound, "write:handler:", a3, v9);

}

- (void)outboundConnectionCompleteWithError:(int)a3
{
  __CFN_SocksHandshake *socksHandshake;

  socksHandshake = self->_socksHandshake;
  if (socksHandshake && socksHandshake->_finished)
    -[_NSCFSocksProxy cleanup](self, "cleanup", *(_QWORD *)&a3);
  else
    -[_NSCFSocksProxy connected:](self, "connected:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outbound, 0);
  objc_storeStrong((id *)&self->_inbound, 0);
  objc_storeStrong((id *)&self->_socksHandshake, 0);
  objc_storeStrong((id *)&self->_outHost, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)proxyServers
{
  void *v0;
  id v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)_proxyServers;
  if (!_proxyServers)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2 = (void *)_proxyServers;
    _proxyServers = (uint64_t)v1;

    v0 = (void *)_proxyServers;
  }
  return v0;
}

- (uint64_t)readInbound
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __30___NSCFSocksProxy_readInbound__block_invoke;
    v2[3] = &unk_1E14F96F8;
    v2[4] = result;
    return objc_msgSend(v1, "read:handler:", 0x40000, v2);
  }
  return result;
}

- (uint64_t)readOutbound
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 48);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __31___NSCFSocksProxy_readOutbound__block_invoke;
    v2[3] = &unk_1E14F96F8;
    v2[4] = result;
    return objc_msgSend(v1, "read:handler:", 0x40000, v2);
  }
  return result;
}

+ (void)handleIncomingConnection:(id)a3 queue:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  _NSCFSocksProxy *v9;
  NSProxyConnection *v10;
  id v11;
  id *v12;
  NSProxyConnection *v13;
  id v14;
  id *v15;
  id *v16;
  const char *v17;
  void *v18;
  id newValue;
  objc_super v20;

  newValue = a5;
  v7 = a4;
  v8 = a3;
  v9 = [_NSCFSocksProxy alloc];
  v10 = [NSProxyConnection alloc];
  v11 = v8;
  if (v10)
  {
    v20.receiver = v10;
    v20.super_class = (Class)NSProxyConnection;
    v12 = objc_msgSendSuper2(&v20, sel_init);
    v10 = (NSProxyConnection *)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a3);
      tcp_connection_set_event_handler();
      tcp_connection_start();
    }
  }

  v13 = v10;
  v14 = v7;
  if (v9)
  {
    v20.receiver = v9;
    v20.super_class = (Class)_NSCFSocksProxy;
    v15 = objc_msgSendSuper2(&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 5, v10);
      objc_storeStrong(v16 + 1, a4);
    }
  }
  else
  {
    v16 = 0;
  }

  if (v16)
    objc_setProperty_atomic(v16, v17, newValue, 56);
  +[_NSCFSocksProxy proxyServers]();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v16);

  -[_NSCFSocksProxy handshakeRead]((uint64_t)v16);
}

- (uint64_t)handshakeRead
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 40);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __32___NSCFSocksProxy_handshakeRead__block_invoke;
    v2[3] = &unk_1E14F96F8;
    v2[4] = result;
    return objc_msgSend(v1, "read:handler:", 1024, v2);
  }
  return result;
}

@end
