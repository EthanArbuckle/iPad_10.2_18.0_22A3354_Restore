@implementation C2MultipeerDiscovery

- (C2MultipeerDiscovery)initWithParent:(id)a3
{
  id v4;
  C2MultipeerDiscovery *v5;
  C2MultipeerDiscovery *v6;
  uint64_t v7;
  NSUUID *myPeerID;
  uint64_t v9;
  OS_nw_listener *listener;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  C2MultipeerDiscovery *v14;
  _QWORD block[4];
  C2MultipeerDiscovery *v17;
  objc_super v18;
  uint8_t buf[4];
  C2MultipeerDiscovery *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)C2MultipeerDiscovery;
  v5 = -[C2MultipeerDiscovery init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_parent, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    myPeerID = v6->_myPeerID;
    v6->_myPeerID = (NSUUID *)v7;

    -[C2MultipeerDiscovery _listener](v6, "_listener");
    v9 = objc_claimAutoreleasedReturnValue();
    listener = v6->_listener;
    v6->_listener = (OS_nw_listener *)v9;

  }
  if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_4);
  v11 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D4DC3000, v11, OS_LOG_TYPE_DEFAULT, "[%@ init]", buf, 0xCu);
  }
  -[C2MultipeerDiscovery parent](v6, "parent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__C2MultipeerDiscovery_initWithParent___block_invoke_4;
  block[3] = &unk_1E98986D0;
  v14 = v6;
  v17 = v14;
  dispatch_async(v13, block);

  return v14;
}

void __39__C2MultipeerDiscovery_initWithParent___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

uint64_t __39__C2MultipeerDiscovery_initWithParent___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "touch");
}

- (void)touch
{
  __assert_rtn("-[C2MultipeerDiscovery touch]", "C2MultipeerDiscovery.m", 40, "_browserTimer != nil");
}

- (void)startTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *browserTimer;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  -[C2MultipeerDiscovery parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[C2MultipeerDiscovery parent](self, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
  browserTimer = self->_browserTimer;
  self->_browserTimer = v7;

  -[C2MultipeerDiscovery browser](self, "browser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v10 = self->_browserTimer;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__C2MultipeerDiscovery_startTimer__block_invoke;
  v14[3] = &unk_1E98989A8;
  v14[4] = self;
  objc_copyWeak(&v16, &location);
  v15 = v9;
  v11 = v9;
  dispatch_source_set_event_handler(v10, v14);
  v12 = self->_browserTimer;
  v13 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_browserTimer);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __34__C2MultipeerDiscovery_startTimer__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "browser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);

    if (v6 == v7)
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_7);
      v8 = C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_INFO, "browser timer triggered, stopping.", v9, 2u);
      }
      nw_browser_cancel(*(nw_browser_t *)(a1 + 40));
      objc_msgSend(v5, "setBrowser:", 0);
      objc_msgSend(v5, "setBrowserTimer:", 0);
    }
  }

}

void __34__C2MultipeerDiscovery_startTimer__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)resetTimer
{
  void *v3;
  NSObject *v4;
  NSObject *browserTimer;
  dispatch_time_t v6;

  -[C2MultipeerDiscovery parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  browserTimer = self->_browserTimer;
  v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(browserTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (id)_peerToPeerParameters
{
  NSObject *secure_tcp;

  secure_tcp = nw_parameters_create_secure_tcp(&__block_literal_global_9_0, &__block_literal_global_14);
  nw_parameters_set_include_peer_to_peer(secure_tcp, 1);
  return secure_tcp;
}

void __45__C2MultipeerDiscovery__peerToPeerParameters__block_invoke(int a1, id a2)
{
  NSObject *v2;
  const char *v3;
  const char *v4;
  size_t v5;
  size_t v6;
  NSObject *alloc;
  NSObject *v8;
  size_t v9;
  __int128 macOut;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (const char *)objc_msgSend(CFSTR("ChunkDiscovery"), "UTF8String");
  v4 = (const char *)objc_msgSend(CFSTR("SuperSecretPasscode"), "UTF8String");
  macOut = 0u;
  v11 = 0u;
  v5 = strlen(v4);
  v6 = strlen(v3);
  CCHmac(2u, v4, v5, v3, v6, &macOut);
  alloc = dispatch_data_create_alloc();
  MEMORY[0] = macOut;
  MEMORY[0x10] = v11;
  strlen(v3);
  v8 = dispatch_data_create_alloc();
  v9 = strlen(v3);
  memcpy(0, v3, v9);
  sec_protocol_options_add_pre_shared_key(v2, alloc, v8);
  sec_protocol_options_append_tls_ciphersuite(v2, (tls_ciphersuite_t)0xAEu);

}

void __45__C2MultipeerDiscovery__peerToPeerParameters__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *options;

  options = a2;
  nw_tcp_options_set_enable_keepalive(options, 1);
  nw_tcp_options_set_keepalive_count(options, 2u);

}

- (id)_browser
{
  NSObject *v3;
  NSObject *v4;
  NSObject *bonjour_service;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD handler[5];
  uint8_t buf[16];

  if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_15_0);
  v3 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4DC3000, v3, OS_LOG_TYPE_INFO, "browser starting.", buf, 2u);
  }
  v4 = nw_parameters_create();
  nw_parameters_set_include_peer_to_peer(v4, 1);
  bonjour_service = nw_browse_descriptor_create_bonjour_service("_chunkdiscovery._tcp", 0);
  v6 = nw_browser_create(bonjour_service, v4);
  nw_browser_set_state_changed_handler(v6, &__block_literal_global_18_0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __32__C2MultipeerDiscovery__browser__block_invoke_2;
  handler[3] = &unk_1E9898A10;
  handler[4] = self;
  nw_browser_set_browse_results_changed_handler(v6, handler);
  -[C2MultipeerDiscovery parent](self, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  nw_browser_set_queue(v6, v8);

  nw_browser_start(v6);
  return v6;
}

void __32__C2MultipeerDiscovery__browser__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_2(uint64_t a1, NSObject *a2, void *a3)
{
  NSObject *v5;
  nw_browse_result_change_t changes;
  char v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *bonjour_service_name;
  const char *v12;
  const char *bonjour_service_type;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  nw_connection_t v27;
  C2MultipeerNetworkConnection *v28;
  void *v29;
  void *v30;
  void *v31;
  C2MultipeerNetworkConnection *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  changes = nw_browse_result_get_changes(a2, v5);
  v7 = changes;
  if (!changes)
  {
    if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_19_0);
    v8 = C2_MULTIPEER_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_INFO, "nw_browse_result_change_invalid", (uint8_t *)&v37, 2u);
    }
  }
  if (v5)
  {
    v9 = nw_browse_result_copy_endpoint(v5);
    if (v9)
    {
      v10 = v9;
      bonjour_service_name = nw_endpoint_get_bonjour_service_name(v9);
      if (bonjour_service_name)
      {
        v12 = bonjour_service_name;
        bonjour_service_type = nw_endpoint_get_bonjour_service_type(v10);
        if (bonjour_service_type)
        {
          if (strcmp("_chunkdiscovery._tcp", bonjour_service_type))
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_27);
            v14 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
              goto LABEL_70;
            LOWORD(v37) = 0;
            v15 = "Wrong service type.";
            goto LABEL_27;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v7 & 1) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_30_0);
            v18 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v18, OS_LOG_TYPE_INFO, "nw_browse_result_change_identical for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 2) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_32_0);
            v19 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v19, OS_LOG_TYPE_INFO, "nw_browse_result_change_result_added for peer %@", (uint8_t *)&v37, 0xCu);
            }
            objc_msgSend(*(id *)(a1 + 32), "parent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "clientConnectionByPeer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
                dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_34_0);
              v23 = C2_MULTIPEER_LOG_INTERNAL_1;
              if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
                goto LABEL_69;
              v37 = 138412290;
              v38 = v17;
              v24 = "Connection already exists to peer %@";
LABEL_68:
              _os_log_impl(&dword_1D4DC3000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v37, 0xCu);
LABEL_69:

              goto LABEL_70;
            }
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_36_0);
            v25 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v25, OS_LOG_TYPE_INFO, "Creating connection to %@", (uint8_t *)&v37, 0xCu);
            }
            objc_msgSend(*(id *)(a1 + 32), "_peerToPeerParameters");
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = nw_connection_create(v10, v26);

            v28 = [C2MultipeerNetworkConnection alloc];
            objc_msgSend(*(id *)(a1 + 32), "parent");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "parent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "queue");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[C2MultipeerNetworkConnection initWithParent:queue:connection:peerID:isClientConnection:](v28, "initWithParent:queue:connection:peerID:isClientConnection:", v29, v31, v27, v17, 1);

            objc_msgSend(*(id *)(a1 + 32), "parent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addClientConnection:peerID:", v32, v17);

          }
          if ((v7 & 4) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_39);
            v34 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v34, OS_LOG_TYPE_INFO, "nw_browse_result_change_result_removed for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 8) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_41);
            v35 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v35, OS_LOG_TYPE_INFO, "nw_browse_result_change_interface_added for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 0x10) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_43);
            v36 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1D4DC3000, v36, OS_LOG_TYPE_INFO, "nw_browse_result_change_interface_removed for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 0x20) == 0)
            goto LABEL_69;
          if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_45);
          v23 = C2_MULTIPEER_LOG_INTERNAL_1;
          if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            goto LABEL_69;
          v37 = 138412290;
          v38 = v17;
          v24 = "nw_browse_result_change_txt_record_changed for peer %@";
          goto LABEL_68;
        }
        if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_25);
        v14 = C2_MULTIPEER_LOG_INTERNAL_1;
        if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        LOWORD(v37) = 0;
        v15 = "No service type.";
      }
      else
      {
        if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_23);
        v14 = C2_MULTIPEER_LOG_INTERNAL_1;
        if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        LOWORD(v37) = 0;
        v15 = "No service name.";
      }
LABEL_27:
      _os_log_impl(&dword_1D4DC3000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v37, 2u);
LABEL_70:

      goto LABEL_71;
    }
  }
  if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_21);
  v16 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1D4DC3000, v16, OS_LOG_TYPE_INFO, "No endpoint.", (uint8_t *)&v37, 2u);
  }
LABEL_71:

}

void __32__C2MultipeerDiscovery__browser__block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_20()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_22()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_24()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_26()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_29()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_33()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_35()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_38()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_40()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_42()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __32__C2MultipeerDiscovery__browser__block_invoke_44()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (id)_listener
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *bonjour_service;
  void *v7;
  NSObject *v8;
  _QWORD handler[5];

  -[C2MultipeerDiscovery _peerToPeerParameters](self, "_peerToPeerParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = nw_listener_create(v3);

  -[NSUUID UUIDString](self->_myPeerID, "UUIDString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)objc_msgSend(v5, "UTF8String"), "_chunkdiscovery._tcp", 0);
  nw_advertise_descriptor_set_no_auto_rename(bonjour_service, 1);
  nw_listener_set_advertise_descriptor(v4, bonjour_service);
  nw_listener_set_state_changed_handler(v4, &__block_literal_global_47);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__C2MultipeerDiscovery__listener__block_invoke_2;
  handler[3] = &unk_1E9898A58;
  handler[4] = self;
  nw_listener_set_new_connection_handler(v4, handler);
  -[C2MultipeerDiscovery parent](self, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  nw_listener_set_queue(v4, v8);

  nw_listener_start(v4);
  return v4;
}

void __33__C2MultipeerDiscovery__listener__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  nw_endpoint_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  C2MultipeerNetworkConnection *v14;
  void *v15;
  void *v16;
  void *v17;
  C2MultipeerNetworkConnection *v18;
  void *v19;
  int v20;
  uint64_t description;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = nw_connection_copy_endpoint(v3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverConnectionByPeer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_50);
      v10 = C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D4DC3000, v10, OS_LOG_TYPE_INFO, "Ignoring connection, unexpected conflict on UUID, something has gone terribly wrong.", (uint8_t *)&v20, 2u);
      }
      nw_connection_cancel(v3);
    }
    else
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_52);
      v12 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        v20 = 136315394;
        description = nw_endpoint_get_description();
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_INFO, "Accepting connection from %s with fake peer ID %@", (uint8_t *)&v20, 0x16u);

      }
      v14 = [C2MultipeerNetworkConnection alloc];
      objc_msgSend(*(id *)(a1 + 32), "parent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "parent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[C2MultipeerNetworkConnection initWithParent:queue:connection:peerID:isClientConnection:](v14, "initWithParent:queue:connection:peerID:isClientConnection:", v15, v17, v3, v6, 0);

      objc_msgSend(*(id *)(a1 + 32), "parent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addServerConnection:peerID:", v18, v6);

    }
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_1 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_48_0);
    v11 = C2_MULTIPEER_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D4DC3000, v11, OS_LOG_TYPE_INFO, "Ignoring connection, no endpoint.", (uint8_t *)&v20, 2u);
    }
    nw_connection_cancel(v3);
  }

}

void __33__C2MultipeerDiscovery__listener__block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __33__C2MultipeerDiscovery__listener__block_invoke_49()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __33__C2MultipeerDiscovery__listener__block_invoke_51()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (C2Multipeer)parent
{
  return (C2Multipeer *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSUUID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_myPeerID, a3);
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (OS_dispatch_source)browserTimer
{
  return self->_browserTimer;
}

- (void)setBrowserTimer:(id)a3
{
  objc_storeStrong((id *)&self->_browserTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserTimer, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_myPeerID, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
