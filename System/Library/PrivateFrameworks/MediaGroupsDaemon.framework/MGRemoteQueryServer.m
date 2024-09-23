@implementation MGRemoteQueryServer

- (MGRemoteQueryServer)initWithHomeHash:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MGRemoteQueryServer *v11;
  MGRemoteQueryServer *v12;
  uint64_t v13;
  NSArray *clients;
  NSError *error;
  uint64_t v16;
  NSString *homeHash;
  NSObject *v18;
  _QWORD block[4];
  MGRemoteQueryServer *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MGRemoteQueryServer;
  v11 = -[MGRemoteQueryServer init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v12->_dispatchQueue, a5);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    clients = v12->_clients;
    v12->_clients = (NSArray *)v13;

    error = v12->_error;
    v12->_error = 0;

    v12->_invalidated = 0;
    v16 = objc_msgSend(v8, "copy");
    homeHash = v12->_homeHash;
    v12->_homeHash = (NSString *)v16;

    -[MGRemoteQueryServer dispatchQueue](v12, "dispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__MGRemoteQueryServer_initWithHomeHash_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v21 = v12;
    dispatch_async(v18, block);

  }
  return v12;
}

uint64_t __63__MGRemoteQueryServer_initWithHomeHash_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListener");
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryServer _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServer;
  -[MGRemoteQueryServer dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServer clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[MGRemoteQueryServer _unsafe_transactionCount](self, "_unsafe_transactionCount");
  -[MGRemoteQueryServer listener](self, "listener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MGRemoteQueryServer invalidated](self, "invalidated");
  v11 = 78;
  if (v10)
    v11 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _clients = %lu, _transactions = %lu, _listener = %@, _invalidated = %c>"), v5, self, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)_startListener
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  MGRemoteQueryServer *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServer listener](self, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryServer listener](self, "listener");
      v6 = objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p server already listening %@", (uint8_t *)&v10, 0x16u);
LABEL_10:

    }
  }
  else
  {
    if (!-[MGRemoteQueryServer invalidated](self, "invalidated"))
    {
      -[MGRemoteQueryServer _prepareListenerParameters](self, "_prepareListenerParameters");
      v5 = objc_claimAutoreleasedReturnValue();
      -[MGRemoteQueryServer _prepareListenerAdvertisement](self, "_prepareListenerAdvertisement");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = nw_listener_create(v5);
      -[MGRemoteQueryServer setListener:](self, "setListener:", v7);
      -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      nw_listener_set_queue(v7, v8);

      nw_listener_set_advertise_descriptor(v7, v6);
      -[MGRemoteQueryServer _updateConnectionLimit](self, "_updateConnectionLimit");
      -[MGRemoteQueryServer _prepareListenerHandlers](self, "_prepareListenerHandlers");
      MGLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134218496;
        v11 = self;
        v12 = 2048;
        v13 = 1;
        v14 = 2048;
        v15 = 1;
        _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p server starting, versions %lu->%lu", (uint8_t *)&v10, 0x20u);
      }

      nw_listener_start(v7);
      goto LABEL_10;
    }
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p server invalidated, not starting", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  MGRemoteQueryServer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!-[MGRemoteQueryServer invalidated](self, "invalidated"))
  {
    MGLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = self;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p server invalidating", buf, 0xCu);
    }

    -[MGRemoteQueryServer setInvalidated:](self, "setInvalidated:", 1);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServer setClients:](self, "setClients:", v4);

    -[MGRemoteQueryServer listener](self, "listener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServer setListener:](self, "setListener:", 0);
    -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __34__MGRemoteQueryServer__invalidate__block_invoke;
      block[3] = &unk_24E0AA4F8;
      v8 = v5;
      dispatch_async(v6, block);

    }
    else
    {
      -[MGRemoteQueryServer _invalidated](self, "_invalidated");
    }

  }
}

void __34__MGRemoteQueryServer__invalidate__block_invoke(uint64_t a1)
{
  nw_listener_cancel(*(nw_listener_t *)(a1 + 32));
}

- (void)_invalidated
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MGRemoteQueryServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p server invalidated", buf, 0xCu);
  }

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MGRemoteQueryServer__invalidated__block_invoke;
  block[3] = &unk_24E0AA4F8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __35__MGRemoteQueryServer__invalidated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverInvalidated:withError:", v2, v3);

  }
}

- (id)_prepareListenerParameters
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *secure_tcp;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x220788584](*MEMORY[0x24BDE0870]);
  -[MGRemoteQueryServer _prepareListenerTLS](self, "_prepareListenerTLS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  secure_tcp = nw_parameters_create_secure_tcp(v5, v4);
  nw_parameters_set_include_peer_to_peer(secure_tcp, 0);
  nw_parameters_set_local_only(secure_tcp, 1);
  nw_parameters_set_server_mode();
  nw_parameters_set_reuse_local_address(secure_tcp, 1);
  nw_parameters_set_attach_protocol_listener();
  -[MGRemoteQueryServer _prepareListenerHTTP:](self, "_prepareListenerHTTP:", secure_tcp);

  return secure_tcp;
}

- (id)_prepareListenerTLS
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__MGRemoteQueryServer__prepareListenerTLS__block_invoke;
  v7[3] = &unk_24E0AA688;
  v7[4] = self;
  v4 = (void *)MEMORY[0x220788584](v7);
  v5 = (void *)MEMORY[0x220788584]();

  return v5;
}

void __42__MGRemoteQueryServer__prepareListenerTLS__block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;
  NSObject *options;

  options = a2;
  objc_msgSend(*(id *)(a1 + 32), "_prepareListenerIdentity");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    sec_protocol_options_set_local_identity(options, v3);
  sec_protocol_options_add_tls_application_protocol(options, (const char *)objc_msgSend(CFSTR("h2"), "UTF8String"));
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);

}

- (id)_prepareListenerIdentity
{
  NSObject *v2;
  __SecIdentity *SelfSignedIdentity;
  __SecIdentity *v4;
  sec_identity_t v5;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  SelfSignedIdentity = (__SecIdentity *)_CFHTTPServerCreateSelfSignedIdentity();
  if (SelfSignedIdentity)
  {
    v4 = SelfSignedIdentity;
    v5 = sec_identity_create(SelfSignedIdentity);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_prepareListenerHTTP:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *protocol;

  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  protocol = nw_http_messaging_create_options();
  v6 = nw_parameters_copy_default_protocol_stack(v4);

  nw_protocol_stack_prepend_application_protocol(v6, protocol);
}

- (id)_prepareListenerAdvertisement
{
  NSObject *v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  NSObject *dictionary;
  const char *v9;
  size_t v10;
  const char *v11;
  size_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  size_t v16;
  NSObject *bonjour_service;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 1);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  dictionary = nw_txt_record_create_dictionary();
  v9 = (const char *)objc_msgSend(CFSTR("v"), "UTF8String");
  v10 = strlen(v5);
  nw_txt_record_set_key(dictionary, v9, (const uint8_t *)v5, v10);
  v11 = (const char *)objc_msgSend(CFSTR("m"), "UTF8String");
  v12 = strlen(v7);
  nw_txt_record_set_key(dictionary, v11, (const uint8_t *)v7, v12);
  -[MGRemoteQueryServer homeHash](self, "homeHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    v15 = (const char *)objc_msgSend(CFSTR("h"), "UTF8String");
    v16 = strlen(v14);
    nw_txt_record_set_key(dictionary, v15, (const uint8_t *)v14, v16);
  }
  bonjour_service = nw_advertise_descriptor_create_bonjour_service(0, (const char *)objc_msgSend(CFSTR("_mediagroups._tcp"), "UTF8String"), 0);
  nw_advertise_descriptor_set_txt_record_object(bonjour_service, dictionary);

  return bonjour_service;
}

- (void)_prepareListenerHandlers
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD handler[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id location;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  -[MGRemoteQueryServer listener](self, "listener");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v12[5];
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke;
  handler[3] = &unk_24E0AA520;
  objc_copyWeak(&v10, &location);
  handler[4] = &v11;
  nw_listener_set_state_changed_handler(v4, handler);
  v6 = v12[5];
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke_13;
  v7[3] = &unk_24E0AA6B0;
  objc_copyWeak(&v8, &location);
  nw_listener_set_new_connection_handler(v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);

  objc_destroyWeak(&location);
}

void __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  CFErrorRef v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2 == 4)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    objc_msgSend(v7, "_invalidated");
  }
  else if (a2 == 3 && WeakRetained)
  {
    MGLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218242;
      v13 = v7;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p server listener failed, error %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = nw_error_copy_cf_error(v5);
    objc_msgSend(v7, "setError:", v9);
    objc_msgSend(v7, "_invalidate");

  }
}

void __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke_13(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *connection;

  connection = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "invalidated") & 1) == 0)
    objc_msgSend(v4, "_handleNewConnection:", connection);
  else
    nw_connection_cancel(connection);

}

- (void)_handleNewConnection:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MGRemoteQueryServer invalidated](self, "invalidated"))
  {
    MGLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134218242;
      *(_QWORD *)&location[4] = self;
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p server invalidated, not handling %@", location, 0x16u);
    }

    nw_connection_cancel(v4);
  }
  else
  {
    -[MGRemoteQueryServer _clientFind:](self, "_clientFind:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[MGRemoteQueryServer clients](self, "clients"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v10 != -1)
      && (-[MGRemoteQueryServer _clientAdd:](self, "_clientAdd:", v4),
          (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      MGLogForCategory(5);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 134218498;
        *(_QWORD *)&location[4] = self;
        v16 = 2048;
        v17 = v7;
        v18 = 2112;
        v19 = v4;
        _os_log_debug_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEBUG, "%p server attempting to use client %p to service new connection %@", location, 0x20u);
      }

      objc_initWeak((id *)location, self);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __44__MGRemoteQueryServer__handleNewConnection___block_invoke;
      v12[3] = &unk_24E0AA700;
      objc_copyWeak(&v14, (id *)location);
      v12[4] = self;
      v13 = v4;
      -[NSObject addNewConnection:completion:](v7, "addNewConnection:completion:", v13, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)location);

    }
    else
    {
      MGLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 134218242;
        *(_QWORD *)&location[4] = self;
        v16 = 2112;
        v17 = v4;
        _os_log_error_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_ERROR, "%p server has no client to handle new connection %@", location, 0x16u);
      }

      nw_connection_cancel(v4);
      -[MGRemoteQueryServer _updateConnectionLimit](self, "_updateConnectionLimit");
    }
  }

}

void __44__MGRemoteQueryServer__handleNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  id v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__MGRemoteQueryServer__handleNewConnection___block_invoke_2;
    v9[3] = &unk_24E0AA6D8;
    v11 = a2;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9[4] = v5;
    v9[5] = v7;
    v10 = v8;
    dispatch_async(v6, v9);

  }
}

void __44__MGRemoteQueryServer__handleNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 3:
      MGLogForCategory(5);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 48);
        v11 = 134218242;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_error_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_ERROR, "%p server retrying accept of %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_handleNewConnection:", *(_QWORD *)(a1 + 48));
      break;
    case 2:
      nw_connection_cancel(*(nw_connection_t *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLimit");
      break;
    case 1:
      MGLogForCategory(5);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "clients");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");
        v8 = objc_msgSend(*(id *)(a1 + 40), "_transactionCount");
        v11 = 134218496;
        v12 = v5;
        v13 = 2048;
        v14 = v7;
        v15 = 2048;
        v16 = v8;
        _os_log_debug_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEBUG, "%p server accepted, now %lu/%lu clients", (uint8_t *)&v11, 0x20u);

      }
      break;
  }
}

- (id)_clientAdd:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_endpoint_t v6;
  MGRemoteQueryServerClient *v7;
  void *v8;
  MGRemoteQueryServerClient *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  MGRemoteQueryServer *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  MGRemoteQueryServerClient *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = nw_connection_copy_endpoint(v4);
  v7 = [MGRemoteQueryServerClient alloc];
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MGRemoteQueryServerClient initWithPeer:delegate:dispatchQueue:](v7, "initWithPeer:delegate:dispatchQueue:", v6, self, v8);

  -[MGRemoteQueryServer clients](self, "clients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryServer setClients:](self, "setClients:", v11);
  MGLogForCategory(5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134219010;
    v15 = self;
    v16 = 2048;
    v17 = objc_msgSend(v11, "count");
    v18 = 2048;
    v19 = -[MGRemoteQueryServer _transactionCount](self, "_transactionCount");
    v20 = 2048;
    v21 = v9;
    v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEBUG, "%p server now %lu/%lu clients after adding client %p for connection %@", (uint8_t *)&v14, 0x34u);
  }

  return v9;
}

- (id)_clientFind:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  nw_endpoint_type_t type;
  char *v17;
  char *v18;
  void *v19;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = nw_connection_copy_endpoint(v4);
  v7 = nw_endpoint_copy_address_string(v6);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v8);
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v9, "length"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MGRemoteQueryServer clients](self, "clients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v21 = v4;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "peer");
          v15 = objc_claimAutoreleasedReturnValue();
          type = nw_endpoint_get_type(v6);
          if (type == nw_endpoint_get_type(v15))
          {
            v17 = nw_endpoint_copy_address_string(v15);
            if (v17)
            {
              v18 = v17;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              free(v18);
              if (v9 && v19 && (objc_msgSend(v9, "isEqual:", v19) & 1) != 0)
              {
                v11 = v14;

                goto LABEL_22;
              }
            }
            else
            {
              v19 = 0;
            }

          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
LABEL_22:
      v4 = v21;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_clientRemove:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  MGRemoteQueryServer *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryServer clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  -[MGRemoteQueryServer setClients:](self, "setClients:", v7);
  MGLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218752;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(v7, "count");
    v13 = 2048;
    v14 = -[MGRemoteQueryServer _transactionCount](self, "_transactionCount");
    v15 = 2048;
    v16 = v4;
    _os_log_debug_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEBUG, "%p server now %lu/%lu clients after removing client %p", (uint8_t *)&v9, 0x2Au);
  }

  -[MGRemoteQueryServer _updateConnectionLimit](self, "_updateConnectionLimit");
}

- (void)clientLostTransaction:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__MGRemoteQueryServer_clientLostTransaction___block_invoke;
  block[3] = &unk_24E0AA4F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __45__MGRemoteQueryServer_clientLostTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLimit");
}

- (void)clientInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__MGRemoteQueryServer_clientInvalidated___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __41__MGRemoteQueryServer_clientInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientRemove:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)_transactionCount
{
  NSObject *v3;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[MGRemoteQueryServer _unsafe_transactionCount](self, "_unsafe_transactionCount");
}

- (unint64_t)_unsafe_transactionCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MGRemoteQueryServer clients](self, "clients", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "transactionCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateConnectionLimit
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServer listener](self, "listener");
  v7 = objc_claimAutoreleasedReturnValue();
  v4 = -[MGRemoteQueryServer invalidated](self, "invalidated");
  v5 = (void *)v7;
  if (!v4 && v7)
  {
    -[MGRemoteQueryServer listener](self, "listener");
    v6 = objc_claimAutoreleasedReturnValue();
    nw_listener_set_new_connection_limit(v6, -[MGRemoteQueryServer _connectionLimit](self, "_connectionLimit"));

    v5 = (void *)v7;
  }

}

- (unsigned)_connectionLimit
{
  NSObject *v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  MGRemoteQueryServer *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[MGRemoteQueryServer _transactionCount](self, "_transactionCount");
  if (v4 >= 0x15)
    v5 = 0;
  else
    v5 = 20 - v4;
  MGLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = v5;
    _os_log_debug_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEBUG, "%p server allowing %lu new connections", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (MGRemoteQueryServerDelegate)delegate
{
  return (MGRemoteQueryServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (NSArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
