@implementation MKListener

- (void)listen
{
  NSObject *v3;
  __CFString *host;
  __CFString *v5;
  __CFString *v6;
  int64_t numberOfThreads;
  NSMutableDictionary *v8;
  NSMutableDictionary *connections;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *listenerQueue;
  NSMutableArray *v12;
  NSMutableArray *connectionQueuePool;
  uint64_t v14;
  NSObject *v15;
  id v16;
  dispatch_queue_t v17;
  uint64_t v18;
  MKCertificate *v19;
  id *v20;
  NSObject *secure_tcp;
  __CFString *v22;
  const char *v23;
  __CFString *v24;
  NSObject *v25;
  OS_nw_listener *v26;
  OS_nw_listener *listener;
  NSObject *v28;
  NSObject *v29;
  NSObject *bonjour_service;
  _QWORD v31[4];
  id v32;
  _QWORD handler[4];
  id v34;
  _QWORD configure_tcp[4];
  id v36;
  _QWORD configure_tls[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  MKListener *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "%@ will listen.", buf, 0xCu);
  }

  host = (__CFString *)self->_host;
  if (!host)
    host = CFSTR("::");
  v5 = host;
  if (self->_port)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), self->_port);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("0");
  }
  if (self->_numberOfThreads)
    numberOfThreads = self->_numberOfThreads;
  else
    numberOfThreads = 5;
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  connections = self->_connections;
  self->_connections = v8;

  v10 = (OS_dispatch_queue *)dispatch_queue_create("mk_listener_nw_listener_queue", MEMORY[0x24BDAC9C0]);
  listenerQueue = self->_listenerQueue;
  self->_listenerQueue = v10;

  v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", numberOfThreads);
  connectionQueuePool = self->_connectionQueuePool;
  self->_connectionQueuePool = v12;

  self->_lastUsedThreadIndex = -1;
  if (numberOfThreads >= 1)
  {
    v14 = 0;
    v15 = MEMORY[0x24BDAC9C0];
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mk_listener_connection_queue_%lu"), v14);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), v15);
      -[NSMutableArray addObject:](self->_connectionQueuePool, "addObject:", v17);

      ++v14;
    }
    while (numberOfThreads != v14);
  }
  objc_initWeak((id *)buf, self);
  v18 = MEMORY[0x24BDAC760];
  if (self->_useTLS)
  {
    if (!self->_certificate)
    {
      v19 = objc_alloc_init(MKCertificate);
      -[MKListener setCertificate:](self, "setCertificate:", v19);

    }
    configure_tls[0] = v18;
    configure_tls[1] = 3221225472;
    configure_tls[2] = __20__MKListener_listen__block_invoke_2;
    configure_tls[3] = &unk_24E359A20;
    v20 = &v38;
    objc_copyWeak(&v38, (id *)buf);
    configure_tcp[0] = v18;
    configure_tcp[1] = 3221225472;
    configure_tcp[2] = __20__MKListener_listen__block_invoke_3;
    configure_tcp[3] = &unk_24E359A20;
    objc_copyWeak(&v36, (id *)buf);
    secure_tcp = nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
    objc_destroyWeak(&v36);
  }
  else
  {
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __20__MKListener_listen__block_invoke;
    v39[3] = &unk_24E359A20;
    v20 = &v40;
    objc_copyWeak(&v40, (id *)buf);
    secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], v39);
  }
  objc_destroyWeak(v20);
  v22 = objc_retainAutorelease(v5);
  v23 = (const char *)-[__CFString UTF8String](v22, "UTF8String");
  v24 = objc_retainAutorelease(v6);
  v25 = nw_endpoint_create_host(v23, (const char *)-[__CFString UTF8String](v24, "UTF8String"));
  nw_parameters_set_reuse_local_address(secure_tcp, 1);
  nw_parameters_set_local_endpoint(secure_tcp, v25);
  v26 = (OS_nw_listener *)nw_listener_create(secure_tcp);
  listener = self->_listener;
  self->_listener = v26;

  nw_listener_set_queue((nw_listener_t)self->_listener, (dispatch_queue_t)self->_listenerQueue);
  v28 = self->_listener;
  handler[0] = v18;
  handler[1] = 3221225472;
  handler[2] = __20__MKListener_listen__block_invoke_4;
  handler[3] = &unk_24E359A48;
  objc_copyWeak(&v34, (id *)buf);
  nw_listener_set_state_changed_handler(v28, handler);
  v29 = self->_listener;
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __20__MKListener_listen__block_invoke_5;
  v31[3] = &unk_24E359A70;
  objc_copyWeak(&v32, (id *)buf);
  nw_listener_set_new_connection_handler(v29, v31);
  if (-[NSString length](self->_service, "length"))
  {
    bonjour_service = nw_advertise_descriptor_create_bonjour_service(-[NSString UTF8String](self->_service, "UTF8String"), "_http._tcp.", 0);
    nw_listener_set_advertise_descriptor((nw_listener_t)self->_listener, bonjour_service);

  }
  nw_listener_start((nw_listener_t)self->_listener);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak((id *)buf);
}

void __20__MKListener_listen__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didReceiveTCPOptions:", v3);

}

void __20__MKListener_listen__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didReceiveSecureOptions:", v3);

}

void __20__MKListener_listen__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didReceiveTCPOptions:", v3);

}

void __20__MKListener_listen__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "listenerDidReceiveState:error:", a2, v5);

}

void __20__MKListener_listen__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "listenerDidReceiveConnection:", v3);

}

- (void)cancel
{
  NSObject *v3;
  MKListener *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *listener;
  OS_nw_listener *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  MKListener *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "%@ will cancel.", buf, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](v4->_connections, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        nw_connection_cancel(*(nw_connection_t *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](v4->_connections, "removeAllObjects");
  objc_sync_exit(v4);

  listener = v4->_listener;
  if (listener)
  {
    nw_listener_cancel(listener);
    v10 = v4->_listener;
    v4->_listener = 0;

  }
}

- (void)didReceiveSecureOptions:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  tls_ciphersuite_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = v4;
  if (objc_msgSend(&unk_24E36C800, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(&unk_24E36C800, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unsigned __int16)objc_msgSend(v7, "integerValue");

      sec_protocol_options_append_tls_ciphersuite(v5, v8);
      ++v6;
    }
    while (v6 < objc_msgSend(&unk_24E36C800, "count"));
  }
  sec_protocol_options_set_min_tls_protocol_version(v5, tls_protocol_version_TLSv12);
  sec_protocol_options_set_max_tls_protocol_version(v5, tls_protocol_version_TLSv13);
  v9 = sec_identity_create(-[MKCertificate identity](self->_certificate, "identity"));
  sec_protocol_options_set_local_identity(v5, v9);
  -[MKCertificate digest](self->_clientCertificate, "digest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKListener setClientCertificateHash:](self, "setClientCertificateHash:", v10);

  sec_protocol_options_set_peer_authentication_required(v5, self->_clientCertificate != 0);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__MKListener_didReceiveSecureOptions___block_invoke;
  v11[3] = &unk_24E359A98;
  objc_copyWeak(&v12, &location);
  sec_protocol_options_set_verify_block(v5, v11, (dispatch_queue_t)self->_listenerQueue);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __38__MKListener_didReceiveSecureOptions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (void *)MEMORY[0x2207B99F4]();
  objc_msgSend(WeakRetained, "didReceiveTrust:complete:", v7, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)didReceiveTrust:(id)a3 complete:(id)a4
{
  void (**v6)(id, uint64_t);
  SecTrustRef v7;
  void *v8;
  uint64_t v9;
  MKCertificate *v10;

  v6 = (void (**)(id, uint64_t))a4;
  v7 = sec_trust_copy_ref((sec_trust_t)a3);
  v10 = -[MKCertificate initWithTrust:]([MKCertificate alloc], "initWithTrust:", v7);
  -[MKCertificate digest](v10, "digest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToData:", self->_clientCertificateHash);
  CFRelease(v7);
  v6[2](v6, v9);

}

- (void)listenerDidReceiveState:(int)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t port;
  id WeakRetained;
  int v10;
  MKListener *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 1024;
    v13 = a3;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "%@ did receive a state. state=%d, error=%@", (uint8_t *)&v10, 0x1Cu);
  }

  if (a3 == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "listenerDidCancel:", self);
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    port = nw_listener_get_port((nw_listener_t)self->_listener);
    -[MKListener setPort:](self, "setPort:", port);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "listener:didOpen:", self, port);
LABEL_7:

  }
}

- (void)listenerDidReceiveConnection:(id)a3
{
  id v4;
  NSMutableArray *connectionQueuePool;
  unint64_t v6;
  int64_t lastUsedThreadIndex;
  void *v8;
  MKListener *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  NSObject *v15;
  id v16;
  id location;

  v4 = a3;
  connectionQueuePool = self->_connectionQueuePool;
  v6 = self->_lastUsedThreadIndex + 1;
  self->_lastUsedThreadIndex = v6;
  if (v6 >= -[NSMutableArray count](connectionQueuePool, "count"))
  {
    lastUsedThreadIndex = 0;
    self->_lastUsedThreadIndex = 0;
  }
  else
  {
    lastUsedThreadIndex = self->_lastUsedThreadIndex;
  }
  -[NSMutableArray objectAtIndex:](self->_connectionQueuePool, "objectAtIndex:", lastUsedThreadIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v9->_connections, "setObject:forKey:", v4, v10);

  objc_sync_exit(v9);
  objc_initWeak(&location, v9);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__MKListener_listenerDidReceiveConnection___block_invoke;
  v13[3] = &unk_24E359AC0;
  objc_copyWeak(&v16, &location);
  v11 = v4;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  nw_connection_set_state_changed_handler(v11, v13);
  nw_connection_set_queue(v11, v12);
  nw_connection_start(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __43__MKListener_listenerDidReceiveConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "connection:DidChangeState:error:queue:", *(_QWORD *)(a1 + 32), a2, v6, *(_QWORD *)(a1 + 40));

}

- (void)connection:(id)a3 DidChangeState:(int)a4 error:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MKListener *v20;
  void *v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MKListener connection:DidChangeState:error:queue:].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  }
  else if (a4 == 5 || a4 == 4)
  {
    v20 = self;
    objc_sync_enter(v20);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v20->_connections, "removeObjectForKey:", v21);

    objc_sync_exit(v20);
  }
  else if (a4 == 3)
  {
    -[MKListener read:queue:](self, "read:queue:", v10, v12);
  }

}

- (void)read:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD completion[4];
  NSObject *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id location;
  _QWORD v17[3];
  char v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x2207B99F4]();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  objc_initWeak(&location, self);
  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 3221225472;
  completion[2] = __25__MKListener_read_queue___block_invoke;
  completion[3] = &unk_24E359AE8;
  v14 = v17;
  objc_copyWeak(&v15, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  nw_connection_receive(v9, 1u, 0xFFFFFFFF, completion);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
  objc_autoreleasePoolPop(v8);

}

void __25__MKListener_read_queue___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v9 = (id *)(a1 + 7);
  v10 = a5;
  v11 = a3;
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "connection:didReceiveContent:context:completed:queue:error:", a1[4], v12, v11, a4, a1[5], v10);

}

- (void)connection:(id)a3 didReceiveContent:(id)a4 context:(id)a5 completed:(BOOL)a6 queue:(id)a7 error:(id)a8
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char *hostname;
  MKConnection *v27;
  void *v28;
  id WeakRetained;
  NSObject *v30;
  uint8_t v31[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (v17)
  {
    +[MKLog log](MKLog, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MKListener connection:didReceiveContent:context:completed:queue:error:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

    nw_connection_cancel(v13);
  }
  else if (v14)
  {
    v25 = nw_connection_copy_endpoint(v13);
    hostname = (char *)nw_endpoint_get_hostname(v25);
    if (hostname)
      hostname = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", hostname);
    v27 = -[MKConnection initWithConnection:queue:hostname:]([MKConnection alloc], "initWithConnection:queue:hostname:", v13, v16, hostname);
    v28 = (void *)MEMORY[0x2207B99F4]();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "connection:didReceiveData:", v27, v14);

    objc_autoreleasePoolPop(v28);
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_21EC08000, v30, OS_LOG_TYPE_INFO, "MKListener will ignore a new connection that has empty content.", v31, 2u);
    }

  }
}

- (void)readData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKListener read:queue:](self, "read:queue:", v6, v5);
}

- (void)sendData:(id)a3 throughConnection:(id)a4 close:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD completion[4];
  NSObject *v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x2207B99F4]();
  objc_msgSend(v9, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v8);
  v14 = dispatch_data_create((const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), v12, 0);
  v15 = (id *)MEMORY[0x24BDE0860];
  if (!v5)
    v15 = (id *)MEMORY[0x24BDE0850];
  v16 = *v15;
  objc_initWeak(&location, self);
  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 3221225472;
  completion[2] = __47__MKListener_sendData_throughConnection_close___block_invoke;
  completion[3] = &unk_24E359B10;
  objc_copyWeak(&v22, &location);
  v23 = v5;
  v17 = v11;
  v20 = v17;
  v18 = v9;
  v21 = v18;
  nw_connection_send(v17, v14, v16, 1, completion);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v10);
}

void __47__MKListener_sendData_throughConnection_close___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
    nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "readData:", *(_QWORD *)(a1 + 40));

}

- (MKListenerDelegate)delegate
{
  return (MKListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useTLS
{
  return self->_useTLS;
}

- (void)setUseTLS:(BOOL)a3
{
  self->_useTLS = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (unint64_t)numberOfThreads
{
  return self->_numberOfThreads;
}

- (void)setNumberOfThreads:(unint64_t)a3
{
  self->_numberOfThreads = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (MKCertificate)clientCertificate
{
  return self->_clientCertificate;
}

- (void)setClientCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertificate, a3);
}

- (NSData)clientCertificateHash
{
  return self->_clientCertificateHash;
}

- (void)setClientCertificateHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificateHash, 0);
  objc_storeStrong((id *)&self->_clientCertificate, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueuePool, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)connection:(uint64_t)a3 DidChangeState:(uint64_t)a4 error:(uint64_t)a5 queue:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "did had a connection error. error=%@", a5, a6, a7, a8, 2u);
}

- (void)connection:(uint64_t)a3 didReceiveContent:(uint64_t)a4 context:(uint64_t)a5 completed:(uint64_t)a6 queue:(uint64_t)a7 error:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "MKListener could not continue to receive a connection because an underlying issue occurred unexpectedly. error=%@", a5, a6, a7, a8, 2u);
}

@end
